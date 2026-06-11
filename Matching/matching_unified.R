################################################################################
#---------------------- Media Presence  Crime Reporting ---------------------
#-------------- 15.05.2025 - @Tomas-Rodriguez-Gamboa ------------------------
#-------------- Unified script: Median split + Top vs Bottom Quartile -------
################################################################################
# Preamble
#-------------------------------------------------------------------------------
rm(list = ls(all.names = TRUE))
options(scipen = 999)
library(optmatch)
library(tidyverse)
library(readstata13)
library(MatchIt)
library(broom)
library(purrr)
library(dplyr)
library(tidyr)
library(stringr)
library(xtable)
library(haven)
library(rbounds)

################################################################################
# Load base master
#-------------------------------------------------------------------------------
data_master <- read_dta("C:/Users/Tomas/Desktop/Universidad/Investigación profe barbara/merge.do/base_cross_section_2021.dta")

################################################################################
# Distance from province Capital to CABA (in KM)
#-------------------------------------------------------------------------------
caba_distance <- data.frame(
  provincia = c(
    "ciudad de buenos aires", "buenos aires", "catamarca", "chaco", "chubut",
    "cordoba", "corrientes", "entre rios", "formosa", "jujuy", "la pampa",
    "la rioja", "mendoza", "misiones", "neuquen", "rio negro", "salta",
    "san juan", "san luis", "santa cruz", "santa fe", "santiago del estereo",
    "tierra del fuego", "tucuman"
  ),
  km = c(
    0, 60, 978, 795, 1127, 647, 801, 377, 940, 1387, 588, 987, 985, 861, 987,
    1611, 1284, 1114, 754, 2056, 393, 973, 2385, 1079
  )
)

data_master <- data_master %>%
  left_join(caba_distance, by = "provincia")

################################################################################
# Treatment Definitions
# Cada especificación tiene: id, label para tablas, función que arma treated,
# carpetas de output y etiqueta para Rosenbaum
#-------------------------------------------------------------------------------
treatment_specs <- list(
  
  list(
    id            = "median",
    rosenbaum_def = "Median split (full sample)",
    out_balance   = "balance_tables_results_median_medios",
    out_results   = "results_tables_results_median_medios",
    make_data     = function(dm) {
      dm %>%
        arrange(desc(cantidad_medios)) %>%
        mutate(quartile = ntile(cantidad_medios, 4)) %>%
        mutate(
          treated = case_when(
            quartile > 2 ~ 1,
            quartile < 3 ~ 0,
            TRUE ~ NA_real_
          )
        ) %>%
        filter(!is.na(treated))
    }
  ),
  
  list(
    id            = "quartile",
    rosenbaum_def = "Top vs. bottom quartile",
    out_balance   = "balance_tables_results_Q_medios",
    out_results   = "results_tables_results_Q_medios",
    make_data     = function(dm) {
      dm %>%
        arrange(desc(cantidad_medios)) %>%
        mutate(quartile = ntile(cantidad_medios, 4)) %>%
        mutate(
          treated = case_when(
            quartile == 4 ~ 1,
            quartile == 1 ~ 0,
            TRUE ~ NA_real_
          )
        ) %>%
        filter(!is.na(treated))
    }
  )
)

################################################################################
# Outcomes
#-------------------------------------------------------------------------------
outcomes <- c("tasa_theft", "tasa_robbery", "tasa_assault", "tasa_sex_offense")

################################################################################
# Propensity Score Formula
#-------------------------------------------------------------------------------
ps_formula <- as.formula(
  "treated ~
superficie_km2 +
genero +
indice_envejecimiento +
hogares_sin_agua +
promedio_personas_viviendas +
desague_sin_red +
porcentaje_nac_en_extranjeros +
tasa_actividad +
medio_pandemia +
medio_joven +
medio_consolidado +
medio_tradicional +
medio_escrito +
medio_audiovisual +
medio_redes +
extension_geografica +
prevencion_delito"
)

################################################################################
# Shared Utilities
#-------------------------------------------------------------------------------
set.seed(123)

rhs_vars        <- all.vars(delete.response(terms(ps_formula)))
mahvars_formula <- as.formula(paste("~", paste(rhs_vars, collapse = " + ")))

fmt3  <- function(x) sprintf("%.3f", x)
fmtp3 <- function(p) sprintf("%.3f", p)

get_sizes <- function(m.out, md) {
  out <- tryCatch({
    sm  <- summary(m.out)
    nt  <- suppressWarnings(as.numeric(sm$nn["Matched", "Treated"]))
    nc  <- suppressWarnings(as.numeric(sm$nn["Matched", "Control"]))
    if (is.na(nt) || is.na(nc)) {
      nt <- sum(md$treated == 1 & md$weights > 0, na.rm = TRUE)
      nc <- sum(md$treated == 0 & md$weights > 0, na.rm = TRUE)
    }
    c(nt, nc)
  }, error = function(e) {
    c(sum(md$treated == 1 & md$weights > 0, na.rm = TRUE),
      sum(md$treated == 0 & md$weights > 0, na.rm = TRUE))
  })
  names(out) <- c("n_treated", "n_control")
  out
}

numify <- function(x) {
  if (is.numeric(x)) return(x)
  if (is.logical(x) || is.factor(x)) return(as.numeric(x))
  suppressWarnings(as.numeric(x))
}
wmean <- function(x, w) weighted.mean(x, w, na.rm = TRUE)
wvar  <- function(x, w, mu) sum(w * (x - mu)^2, na.rm = TRUE) / sum(w, na.rm = TRUE)
pv_lm <- function(y, trt, w = NULL) {
  df  <- data.frame(y = y, treated = trt)
  fit <- if (is.null(w)) lm(y ~ treated, data = df) else lm(y ~ treated, data = df, weights = w)
  coefs <- summary(fit)$coef
  if ("treated" %in% rownames(coefs)) coefs["treated", "Pr(>|t|)"] else coefs[2, 4]
}

################################################################################
# Matching Methods (same for both specifications)
#-------------------------------------------------------------------------------
matching_methods <- list(
  list(id = "nearest_logit",
       args = list(method = "nearest", distance = "logit", replace = FALSE,
                   ratio = 1, std.caliper = TRUE, caliper = 0.2, discard = "both")),

  list(id = "nearest_logit_rep2",
       args = list(method = "nearest", distance = "logit", replace = TRUE,
                   ratio = 2, std.caliper = TRUE, caliper = 0.2, discard = "both")),

  list(id = "optimal_logit",
       args = list(method = "optimal", distance = "logit", ratio = 1,
                   std.caliper = TRUE, caliper = 0.1, discard = "both")),

  list(id = "full_logit_ATT",
       args = list(method = "full", distance = "logit", estimand = "ATT", discard = "both")),

  list(id = "subclass5_logit_ATT",
       args = list(method = "subclass", distance = "logit", subclass = 5,
                   estimand = "ATT", discard = "both")),

  list(id = "nearest_mahal_with_pscaliper",
       args = list(method = "nearest", distance = "glm", mahvars = mahvars_formula,
                   replace = FALSE, ratio = 1, std.caliper = TRUE, caliper = 0.2, discard = "both")),

  list(id = "nearest_mahal_exact_prov",
       args = list(method = "nearest", distance = "mahalanobis",
                   replace = FALSE, ratio = 1, exact = ~ provincia))
)

method_labels <- c(
  "nearest_logit"                = "Nearest Neighbor (1:1, No Replacement)",
  "nearest_logit_rep2"           = "Nearest Neighbor (1:2, Replacement)",
  "optimal_logit"                = "Optimal Matching",
  "full_logit_ATT"               = "Full Matching",
  "subclass5_logit_ATT"          = "Subclassification",
  "nearest_mahal_with_pscaliper" = "Nearest Neighbor (Mahalanobis)",
  "nearest_mahal_exact_prov"     = "Nearest Neighbor (Mahalanobis, Exact Province)"
)

method_order <- c(
  "Nearest Neighbor (1:1, No Replacement)",
  "Nearest Neighbor (1:2, Replacement)",
  "Nearest Neighbor (Mahalanobis)",
  "Nearest Neighbor (Mahalanobis, Exact Province)",
  "Optimal Matching",
  "Full Matching",
  "Subclassification"
)

note_block <- paste0(
  "\n% --- Notes appended by R ---\n",
  "\\begin{flushleft}\\footnotesize\n",
  "\\textit{Notes.} \\textbf{Nearest Neighbor variants:} ",
  "(1) Propensity-score nearest neighbor (logit), 1:1 without replacement; common support enforced and a 0.2 SD caliper on the PS. ",
  "(2) Propensity-score nearest neighbor with replacement; common support and a 0.2 SD caliper. ",
  "(3) Mahalanobis nearest neighbor on covariates within a propensity-score caliper (0.2 SD). ",
  "(4) Mahalanobis nearest neighbor with exact matching on \\textit{province}. ",
  "\\textbf{Other methods:} Optimal Matching minimizes global distance (some solvers may ignore calipers); ",
  "Full Matching forms treated–control strata and estimates ATT using weights; ",
  "Subclassification groups observations into 5 PS strata and compares treated vs. controls within strata. ",
  "Reported coefficients are weighted differences in means (T$-$C). ",
  "p-values come from a weighted linear regression of the outcome on treatment within the matched sample. ",
  "Sample sizes (\\textit{n\\_treated}, \\textit{n\\_control}) reflect matched/effective units.\n",
  "\\end{flushleft}\n"
)

################################################################################
# Main Loop: run everything for each treatment specification
#-------------------------------------------------------------------------------
purrr::walk(treatment_specs, function(spec) {
  
  message("\n", strrep("=", 70))
  message(">>> Running specification: ", spec$id)
  message(strrep("=", 70))
  
  # --- 1. Build dataset for this specification ---
  data_matching   <- spec$make_data(data_master)
  matched_datasets <- list()
  
  # --- 2. safe_match closure (needs data_matching and matched_datasets in scope) ---
  safe_match <- purrr::safely(function(mspec) {
    m.out <- do.call(
      MatchIt::matchit,
      c(list(formula = ps_formula, data = data_matching), mspec$args)
    )
    md <- MatchIt::match.data(m.out)
    matched_datasets[[mspec$id]] <<- md
    sizes <- get_sizes(m.out, md)
    
    purrr::map_dfr(outcomes, function(y) {
      if (!y %in% names(md)) return(tibble::tibble())
      fit <- lm(reformulate("treated", response = y), data = md, weights = md$weights)
      tt  <- broom::tidy(fit)
      row <- dplyr::filter(tt, term == "treated")
      if (nrow(row) == 0) return(tibble::tibble())
      tibble::tibble(
        method    = mspec$id,
        outcome   = y,
        coef      = fmt3(row$estimate),
        pval      = fmtp3(row$p.value),
        n_treated = sizes["n_treated"],
        n_control = sizes["n_control"]
      )
    })
  })
  
  # --- 3. Run all matching methods ---
  res_list <- purrr::map(matching_methods, safe_match)
  
  purrr::walk2(matching_methods, res_list, function(mspec, res) {
    if (!is.null(res$error))
      message("  ⚠️  Falló método '", mspec$id, "': ", res$error$message)
  })
  
  results_long <- res_list %>%
    purrr::map("result") %>%
    purrr::compact() %>%
    dplyr::bind_rows()
  
  if (nrow(results_long) == 0) {
    warning("Spec '", spec$id, "': No se obtuvieron resultados. Revisa outcomes y variables.")
    return(invisible(NULL))
  }
  
  results_long <- results_long %>%
    mutate(method = recode(method, !!!method_labels)) %>%
    mutate(method = factor(method, levels = method_order))
  
  # --- 4. Wide results table ---
  sizes_by_method <- results_long %>% distinct(method, n_treated, n_control)
  outcome_names   <- unique(results_long$outcome)
  intercaladas    <- as.vector(rbind(paste0(outcome_names, "_coef"),
                                     paste0(outcome_names, "_pval")))
  
  table_wide <- results_long %>%
    pivot_wider(names_from = outcome, values_from = c(coef, pval), names_glue = "{outcome}_{.value}") %>%
    distinct() %>%
    arrange(method) %>%
    left_join(sizes_by_method, by = "method") %>%
    dplyr::select(method, all_of(intercaladas), n_treated, n_control) %>%
    mutate(method = gsub("_", "\\\\_", method))
  
  # --- 5. Balance tables ---
  balance_all <- purrr::imap_dfr(matched_datasets, function(md, id) {
    method_label <- recode(id, !!!method_labels, .default = id)
    tr_pre  <- data_matching$treated
    tr_post <- md$treated
    w_post  <- md$weights
    
    vars_ok <- rhs_vars[rhs_vars %in% intersect(names(data_matching), names(md))]
    if (length(vars_ok) == 0) return(tibble::tibble())
    
    var_balances <- purrr::map_dfr(vars_ok, function(v) {
      y_pre  <- numify(data_matching[[v]])
      y_post <- numify(md[[v]])
      
      y_T_pre <- y_pre[tr_pre == 1]; y_C_pre <- y_pre[tr_pre == 0]
      mean_T_pre <- mean(y_T_pre, na.rm = TRUE); mean_C_pre <- mean(y_C_pre, na.rm = TRUE)
      sd_T_pre   <- sd(y_T_pre, na.rm = TRUE);   sd_C_pre   <- sd(y_C_pre, na.rm = TRUE)
      sd_pooled  <- sqrt((sd_T_pre^2 + sd_C_pre^2) / 2)
      pre_D      <- mean_T_pre - mean_C_pre
      pre_smd    <- if (sd_pooled == 0) 0 else abs(pre_D / sd_pooled)
      pre_vrat   <- if (sd_C_pre == 0) NA else (sd_T_pre^2) / (sd_C_pre^2)
      pre_p      <- pv_lm(y_pre, tr_pre, w = NULL)
      
      y_T_post <- y_post[tr_post == 1]; y_C_post <- y_post[tr_post == 0]
      w_T_post <- w_post[tr_post == 1]; w_C_post <- w_post[tr_post == 0]
      mean_T_post <- wmean(y_T_post, w_T_post); mean_C_post <- wmean(y_C_post, w_C_post)
      var_T_post  <- wvar(y_T_post, w_T_post, mean_T_post)
      var_C_post  <- wvar(y_C_post, w_C_post, mean_C_post)
      sd_T_post   <- sqrt(var_T_post); sd_C_post <- sqrt(var_C_post)
      post_D      <- mean_T_post - mean_C_post
      post_smd    <- if (sd_pooled == 0) 0 else abs(post_D / sd_pooled)
      post_vrat   <- if (var_C_post == 0) NA else var_T_post / var_C_post
      post_p      <- pv_lm(y_post, tr_post, w = w_post)
      
      tibble::tibble(
        method = method_label, variable = v,
        pre_treated = mean_T_pre, pre_sd_T = sd_T_pre, pre_control = mean_C_pre, pre_sd_C = sd_C_pre,
        pre_diff = pre_D, pre_smd = pre_smd, pre_vratio = pre_vrat, pre_p = pre_p,
        match_treat = mean_T_post, match_sd_T = sd_T_post, match_ctrl = mean_C_post, match_sd_C = sd_C_post,
        match_diff = post_D, match_smd = post_smd, match_vratio = post_vrat, match_p = post_p
      )
    })
    
    n_row <- tibble::tibble(
      method = method_label, variable = "N",
      pre_treated = sum(tr_pre == 1), pre_sd_T = NA,
      pre_control = sum(tr_pre == 0), pre_sd_C = NA,
      pre_diff = NA, pre_smd = NA, pre_vratio = NA, pre_p = NA,
      match_treat = sum(w_post[tr_post == 1]), match_sd_T = NA,
      match_ctrl  = sum(w_post[tr_post == 0]), match_sd_C = NA,
      match_diff = NA, match_smd = NA, match_vratio = NA, match_p = NA
    )
    bind_rows(var_balances, n_row)
  })
  
  # --- 6. Export balance tables ---
  cols_order  <- c("variable",
                   "pre_treated", "pre_sd_T", "pre_control", "pre_sd_C",
                   "pre_diff", "pre_smd", "pre_vratio", "pre_p",
                   "match_treat", "match_sd_T", "match_ctrl", "match_sd_C",
                   "match_diff", "match_smd", "match_vratio", "match_p")
  col_english <- c("Variable",
                   "Pre: Mean T", "Pre: SD T", "Pre: Mean C", "Pre: SD C",
                   "Pre: Diff", "Pre: SMD", "Pre: V-Ratio", "Pre: p",
                   "Match: Mean T", "Match: SD T", "Match: Mean C", "Match: SD C",
                   "Match: Diff", "Match: SMD", "Match: V-Ratio", "Match: p")
  
  if (!dir.exists(spec$out_balance)) dir.create(spec$out_balance, recursive = TRUE)
  
  by_method <- split(balance_all, balance_all$method)
  purrr::iwalk(by_method, function(dfm, meth_label) {
    custom_levels <- c(rhs_vars, "N")
    tab      <- dfm %>%
      dplyr::select(dplyr::all_of(cols_order)) %>%
      dplyr::arrange(factor(variable, levels = custom_levels))
    num_cols <- setdiff(names(tab), "variable")
    tab[num_cols] <- lapply(tab[num_cols], function(x) suppressWarnings(as.numeric(x)))
    
    p_and_stat_cols <- c("pre_p", "match_p", "pre_smd", "match_smd", "pre_vratio", "match_vratio")
    other_cols      <- setdiff(num_cols, p_and_stat_cols)
    is_N_row        <- tab$variable == "N"
    
    tab[!is_N_row, other_cols]      <- lapply(tab[!is_N_row, other_cols], function(x) round(x, 2))
    tab[!is_N_row, p_and_stat_cols] <- lapply(tab[!is_N_row, p_and_stat_cols], function(x) round(x, 3))
    tab[is_N_row, "pre_treated"]  <- round(tab[is_N_row, "pre_treated"], 0)
    tab[is_N_row, "pre_control"]  <- round(tab[is_N_row, "pre_control"], 0)
    tab[is_N_row, "match_treat"]  <- round(tab[is_N_row, "match_treat"], 0)
    tab[is_N_row, "match_ctrl"]   <- round(tab[is_N_row, "match_ctrl"], 0)
    colnames(tab) <- col_english
    
    digits <- c(0)
    for (nm in col_english) {
      if (nm == "Variable") digits <- c(digits, 0)
      else if (nm %in% c("Pre: p", "Match: p", "Pre: SMD", "Match: SMD", "Pre: V-Ratio", "Match: V-Ratio"))
        digits <- c(digits, 3)
      else digits <- c(digits, 2)
    }
    align    <- c("l", "l", rep("r", length(col_english) - 1))
    file_tag <- gsub("[^A-Za-z0-9]+", "_", as.character(meth_label))
    fn       <- file.path(spec$out_balance, paste0("balance_", file_tag, ".tex"))
    print(xtable::xtable(tab, digits = digits, align = align), include.rownames = FALSE, file = fn)
  })
  
  # --- 7. Export wide results table ---
  if (!dir.exists(spec$out_results)) dir.create(spec$out_results, recursive = TRUE)
  fn <- file.path(spec$out_results, "wide_table_results.tex")
  tw <- table_wide
  num_cols_tw <- setdiff(names(tw), "method")
  tw[num_cols_tw] <- lapply(tw[num_cols_tw], function(x) suppressWarnings(as.numeric(x)))
  
  align_vec  <- c("l", "l", rep("r", ncol(tw) - 1))
  digits_vec <- rep(0, ncol(tw) + 1)
  pval_idx   <- grep("_pval$", names(tw), value = FALSE)
  if (length(pval_idx)) digits_vec[pval_idx + 1] <- 3
  
  print(
    xtable::xtable(tw, caption = "Matching results by method and outcome.",
                   label = "tab:wide_results", digits = digits_vec, align = align_vec),
    include.rownames = FALSE,
    sanitize.text.function = identity,
    file = fn
  )
  cat(note_block, file = fn, append = TRUE)
  
  # --- 8. Rosenbaum Sensitivity Bounds ---
  md_mahal <- matched_datasets[["nearest_mahal_exact_prov"]]
  
  find_gamma_threshold <- function(outcome_vec, trt, gamma_seq = seq(1, 4, by = 0.1), alpha = 0.05) {
    x_T <- outcome_vec[trt == 1]; x_C <- outcome_vec[trt == 0]
    n   <- min(length(x_T), length(x_C))
    x_T <- x_T[1:n]; x_C <- x_C[1:n]
    gamma_threshold <- NA
    for (g in gamma_seq) {
      res     <- psens(x = x_T, y = x_C, Gamma = g, GammaInc = 0.1)
      p_upper <- res$bounds[res$bounds$Gamma == g, "Upper bound"]
      if (!is.na(p_upper) && p_upper >= alpha) { gamma_threshold <- g; break }
    }
    return(gamma_threshold)
  }
  
  sensitivity_results <- purrr::map_dfr(outcomes, function(oc) {
    tibble::tibble(
      outcome = oc,
      gamma   = find_gamma_threshold(outcome_vec = md_mahal[[oc]], trt = md_mahal$treated)
    )
  })
  
  sens_wide <- sensitivity_results %>%
    pivot_wider(names_from = outcome, values_from = gamma) %>%
    mutate(definition = spec$rosenbaum_def) %>%
    dplyr::select(definition, everything())
  colnames(sens_wide) <- c("Treatment definition", "Theft", "Robbery", "Assault", "Sex offenses")
  
  print(
    xtable::xtable(sens_wide,
                   caption = "Rosenbaum sensitivity bounds: Gamma at which the ATT loses significance",
                   label   = "tab:B3"),
    include.rownames = FALSE,
    file = file.path(spec$out_results, "table_B3_rosenbaum.tex")
  )
  
  message("  ✅ Spec '", spec$id, "' completada. Outputs en: ",
          spec$out_balance, " y ", spec$out_results)
})

message("\n", strrep("=", 70))
message(">>> Pipeline completo para todas las especificaciones.")
message(strrep("=", 70))
################################################################################
