################################################################################
#---------------------- Media Presence  Crime Reporting ---------------------
#----------------------- 15.05.2025 - @Tomas-Rodriguez-Gamboa ----------------------
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
#base master
data_master<- read_dta("C:/Users/Tomas/Desktop/Universidad/Investigación profe barbara/merge.do/base_cross_section_2021.dta")
################################################################################
###############################################################################
# Distance from province Capital to CABA (in KM)

#-------------------------------------------------------------------------------
caba_distance <- data.frame(
  provincia = c(
    "ciudad de buenos aires", 
    "buenos aires", 
    "catamarca", 
    "chaco", 
    "chubut",
    "cordoba", 
    "corrientes", 
    "entre rios", 
    "formosa", 
    "jujuy", 
    "la pampa",
    "la rioja",
    "mendoza", 
    "misiones", 
    "neuquen", 
    "rio negro",
    "salta", 
    "san juan", 
    "san luis", 
    "santa cruz", 
    "santa fe",
    "santiago del estereo", 
    "tierra del fuego", 
    "tucuman"
  ),
  km = c(
    0, 60, 978, 795, 1127, 647, 801, 377, 940, 1387, 588, 987, 985, 861, 987, 
    1611, 1284, 1114, 754, 2056, 393, 973, 2385, 1079
  )
)

################################################################################
# Merge base_master with caba_distance
data_master <- data_master %>%
  left_join(
    caba_distance, 
    by = "provincia"
  )
################################################################################
#-------------------------------------------------------------------------------
################################################################################
#note: variable q_medios was dropped
data_matching <- data_master %>%
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
#-------------------------------------------------------------------------------
################################################################################
# Outcomes
#------------------------------------------------------------------------------
outcomes <- c("tasa_theft", 
              "tasa_robbery", 
              "tasa_assault", 
              "tasa_sex_offense"
)
#-------------------------------------------------------------------------------
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
#-------------------------------------------------------------------------------
################################################################################
# Utilities for Matching Methods
#-------------------------------------------------------------------------------
set.seed(123) 
#-------------------------------------------------------------------------------
rhs_vars <- all.vars(delete.response(terms(ps_formula)))
mahvars_formula <- as.formula(paste("~", paste(rhs_vars, collapse = " + ")))
#-------------------------------------------------------------------------------
fmt3  <- function(x) sprintf("%.3f", x)
fmtp3 <- function(p) sprintf("%.3f", p)
#-------------------------------------------------------------------------------
get_sizes <- function(m.out, md) {
  out <- tryCatch({
    sm <- summary(m.out)
    nt  <- suppressWarnings(as.numeric(sm$nn["Matched","Treated"]))
    nc  <- suppressWarnings(as.numeric(sm$nn["Matched","Control"]))
    if (is.na(nt) || is.na(nc)) {
      nt <- sum(md$treated == 1 & md$weights > 0, na.rm = TRUE)
      nc <- sum(md$treated == 0 & md$weights > 0, na.rm = TRUE)
    }
    c(nt, nc)
  }, error = function(e) {
    c(sum(md$treated == 1 & md$weights > 0, na.rm = TRUE),
      sum(md$treated == 0 & md$weights > 0, na.rm = TRUE))
  })
  names(out) <- c("n_treated","n_control")
  out
}
safe_match <- purrr::safely(function(spec){
  m.out <- do.call(
    MatchIt::matchit,
    c(list(formula = ps_formula, data = data_matching),
      spec$args)
  )
  #-------------------------------------------------------------------------------
  md <- MatchIt::match.data(m.out)
  matched_datasets[[spec$id]] <<- md
  #-------------------------------------------------------------------------------
  sizes <- get_sizes(m.out, md)
  #-------------------------------------------------------------------------------
  purrr::map_dfr(outcomes, function(y) {
    if (!y %in% names(md)) return(tibble::tibble())
    fit <- lm(reformulate("treated", response = y),
              data = md, 
              weights = md$weights)
    tt  <- broom::tidy(fit)
    row <- dplyr::filter(tt, term == "treated")
    if (nrow(row) == 0) return(tibble::tibble())
    tibble::tibble(
      method    = spec$id,
      outcome   = y,
      coef      = fmt3(row$estimate),
      se        = fmt3(row$std.error),
      pval      = fmtp3(row$p.value),
      n_treated = sizes["n_treated"],
      n_control = sizes["n_control"]
    )
  })
})
#-------------------------------------------------------------------------------
################################################################################
# Matching Methods
#-------------------------------------------------------------------------------
matching_methods <- list(
  list(id = "nearest_logit",
       args = list(method = "nearest",
                   distance = "logit",
                   replace = FALSE,
                   ratio = 1,
                   std.caliper = TRUE,
                   caliper = 0.2,
                   discard = "both")),
  
  list(id = "nearest_logit_rep2",
       args = list(method = "nearest",
                   distance = "logit",
                   replace = TRUE,
                   ratio = 2,
                   std.caliper = TRUE,
                   caliper = 0.2,
                   discard = "both")),
  
  list(id = "optimal_logit",
       args = list(method = "optimal",
                   distance = "logit",
                   ratio = 1,
                   std.caliper = TRUE,
                   caliper = 0.1,
                   discard = "both")),
  
  list(id = "full_logit_ATT",
       args = list(method = "full",
                   distance = "logit",
                   estimand = "ATT",
                   discard = "both")),
  
  list(id = "subclass5_logit_ATT",
       args = list(method = "subclass",
                   distance = "logit",
                   subclass = 5,
                   estimand = "ATT",
                   discard = "both")),
  
  list(id = "nearest_mahal_with_pscaliper",
       args = list(method = "nearest",
                   distance = "glm",           
                   mahvars = mahvars_formula,  
                   replace = FALSE,
                   ratio = 1,
                   std.caliper = TRUE,       
                   caliper = 0.2,
                   discard = "both")),
  
  list(id = "nearest_mahal_exact_prov",
       args = list(method = "nearest",
                   distance = "mahalanobis",
                   replace = FALSE,
                   ratio = 1,
                   exact = ~ provincia
       ))
)
#-------------------------------------------------------------------------------
################################################################################
# Functions to Run
#-------------------------------------------------------------------------------
matched_datasets  <- list()
run_one_method <- function(spec) {
  m.out <- do.call(
    MatchIt::matchit,
    c(list(formula = ps_formula, 
           data = data_matching
    ), 
    spec$args)
  )
  md <- MatchIt::match.data(m.out)
  matched_datasets[[spec$id]] <<- md
  sm <- summary(m.out)
  n_treated <- suppressWarnings(as.numeric(sm$nn["Matched", "Treated"]))
  n_control <- suppressWarnings(as.numeric(sm$nn["Matched", "Control"]))
  #-------------------------------------------------------------------------------
  purrr::map_dfr(outcomes, function(y) {
    fit <- lm(reformulate("treated", 
                          response = y
    ), 
    data = md, 
    weights = md$weights
    )
    tt  <- broom::tidy(fit)
    row <- tt %>% dplyr::filter(term == "treated")
    tibble::tibble(
      method = spec$id,
      outcome = y,
      coef = fmt3(row$estimate),
      se        = fmt3(row$std.error),
      pval = fmtp3(row$p.value),
      n_treated = n_treated,
      n_control = n_control
    )
  })
}
#-------------------------------------------------------------------------------
################################################################################
# Run and Report All Matching Methods
#-------------------------------------------------------------------------------
res_list <- purrr::map(matching_methods, safe_match)
#-------------------------------------------------------------------------------
purrr::walk2(matching_methods, res_list, function(spec, res) {
  if (!is.null(res$error)) message("⚠️ Falló método '", 
                                   spec$id, "': ", 
                                   res$error$message)
})
#-------------------------------------------------------------------------------
results_long <- res_list %>%
  purrr::map("result") %>%
  purrr::compact() %>%
  dplyr::bind_rows()
#-------------------------------------------------------------------------------
if (nrow(results_long) == 0) stop("No se obtuvieron resultados. 
                                  Revisa nombres de outcomes y variables.")
#-------------------------------------------------------------------------------
method_labels <- c(
  "nearest_logit"                = "Nearest Neighbor (1:1, No Replacement)",
  "nearest_logit_rep2"           = "Nearest Neighbor (1:2, Replacement)",
  "optimal_logit"                = "Optimal Matching",
  "full_logit_ATT"               = "Full Matching",
  "subclass5_logit_ATT"          = "Subclassification",
  "nearest_mahal_with_pscaliper" = "Nearest Neighbor (Mahalanobis)",
  "nearest_mahal_exact_prov"     = "Nearest Neighbor (Mahalanobis, Exact Province)"
)
#-------------------------------------------------------------------------------
results_long <- results_long %>%
  mutate(
    method = recode(method, !!!method_labels)
  )
#-------------------------------------------------------------------------------
order <- c(
  "Nearest Neighbor (1:1, No Replacement)",
  "Nearest Neighbor (1:2, Replacement)",
  "Nearest Neighbor (Mahalanobis)",
  "Nearest Neighbor (Mahalanobis, Exact Province)",
  "Optimal Matching",
  "Full Matching",
  "Subclassification"
)
#-------------------------------------------------------------------------------
results_long <- results_long %>%
  mutate(method = factor(method, 
                         levels = order)
  )
#-------------------------------------------------------------------------------
table_wide <- results_long %>%
  pivot_wider(
    names_from = outcome,
    values_from = c(coef, se, pval),
    names_glue = "{outcome}_{.value}"
  ) %>%
  distinct() %>%
  arrange(method)
#-------------------------------------------------------------------------------
sizes_by_method <- results_long %>%
  distinct(method, 
           n_treated, 
           n_control
  )
#-------------------------------------------------------------------------------
table_wide <- left_join(table_wide, 
                        sizes_by_method, 
                        by = "method"
)
#-------------------------------------------------------------------------------
outcome_names <- unique(results_long$outcome)
intercaladas <- as.vector(rbind(
  paste0(outcome_names, "_coef"),
  paste0(outcome_names, "_se"),
  paste0(outcome_names, "_pval")
)
)
table_wide <- left_join(table_wide, 
                        sizes_by_method, 
                        by = "method") %>%
  dplyr::select(method, 
                all_of(intercaladas),
                n_treated, 
                n_control) %>%
  mutate(method = gsub("_", "\\\\_", method))
#-------------------------------------------------------------------------------
################################################################################
# Balance Tables
#-------------------------------------------------------------------------------
numify <- function(x) {
  if (is.numeric(x)) return(x)
  if (is.logical(x) || is.factor(x)) return(as.numeric(x))
  suppressWarnings(as.numeric(x))
}
wmean <- function(x, w) weighted.mean(x, w, na.rm = TRUE)

# Función para varianza ponderada (requerida para SD y vratio post-matching)
wvar <- function(x, w, mu) {
  sum(w * (x - mu)^2, na.rm = TRUE) / sum(w, na.rm = TRUE)
}

pv_lm <- function(y, trt, w = NULL) {
  df <- data.frame(y = y, treated = trt)
  fit <- if (is.null(w)) lm(y ~ treated, data = df) else lm(y ~ treated, data = df, weights = w)
  coefs <- summary(fit)$coef
  if ("treated" %in% rownames(coefs)) coefs["treated", "Pr(>|t|)"] else coefs[2, 4]
}
rhs_vars <- all.vars(delete.response(terms(ps_formula)))

#-------------------------------------------------------------------------------
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
    
    # --- CÁLCULOS PRE-MATCHING  ---
    y_T_pre <- y_pre[tr_pre == 1]
    y_C_pre <- y_pre[tr_pre == 0]
    
    mean_T_pre <- mean(y_T_pre, na.rm = TRUE)
    mean_C_pre <- mean(y_C_pre, na.rm = TRUE)
    sd_T_pre   <- sd(y_T_pre, na.rm = TRUE)
    sd_C_pre   <- sd(y_C_pre, na.rm = TRUE)
    sd_pooled  <- sqrt((sd_T_pre^2 + sd_C_pre^2) / 2)
    
    pre_D      <- mean_T_pre - mean_C_pre
    pre_smd    <- if(sd_pooled == 0) 0 else abs(pre_D / sd_pooled)
    pre_vrat   <- if(sd_C_pre == 0) NA else (sd_T_pre^2) / (sd_C_pre^2)
    pre_p      <- pv_lm(y_pre, tr_pre, w = NULL)
    
    # --- CÁLCULOS POST-MATCHING  ---
    y_T_post <- y_post[tr_post == 1]
    y_C_post <- y_post[tr_post == 0]
    w_T_post <- w_post[tr_post == 1]
    w_C_post <- w_post[tr_post == 0]
    
    mean_T_post <- wmean(y_T_post, w_T_post)
    mean_C_post <- wmean(y_C_post, w_C_post)
    
    var_T_post  <- wvar(y_T_post, w_T_post, mean_T_post)
    var_C_post  <- wvar(y_C_post, w_C_post, mean_C_post)
    sd_T_post   <- sqrt(var_T_post)
    sd_C_post   <- sqrt(var_C_post)
    
    post_D      <- mean_T_post - mean_C_post
    post_smd    <- if(sd_pooled == 0) 0 else abs(post_D / sd_pooled) 
    post_vrat   <- if(var_C_post == 0) NA else var_T_post / var_C_post
    post_p      <- pv_lm(y_post, tr_post, w = w_post)
    
    tibble::tibble(
      method       = method_label,
      variable     = v,
      pre_treated  = mean_T_pre,
      pre_sd_T     = sd_T_pre,
      pre_control  = mean_C_pre,
      pre_sd_C     = sd_C_pre,
      pre_diff     = pre_D,
      pre_smd      = pre_smd,
      pre_vratio   = pre_vrat,
      pre_p        = pre_p,
      match_treat  = mean_T_post,
      match_sd_T   = sd_T_post,
      match_ctrl   = mean_C_post,
      match_sd_C   = sd_C_post,
      match_diff   = post_D,
      match_smd    = post_smd,
      match_vratio = post_vrat,
      match_p      = post_p
    )
  })
  
  # 2. Agregar fila de tamaño de muestra (N) al final de este método específico
  n_row <- tibble::tibble(
    method       = method_label,
    variable     = "N",
    pre_treated  = sum(tr_pre == 1),
    pre_sd_T     = NA,
    pre_control  = sum(tr_pre == 0),
    pre_sd_C     = NA,
    pre_diff     = NA,
    pre_smd      = NA,
    pre_vratio   = NA,
    pre_p        = NA,
    match_treat  = sum(w_post[tr_post == 1]), # N efectivo final del tratamiento
    match_sd_T   = NA,
    match_ctrl   = sum(w_post[tr_post == 0]), # N efectivo final del control
    match_sd_C   = NA,
    match_diff   = NA,
    match_smd    = NA,
    match_vratio = NA,
    match_p      = NA
  )
  
  bind_rows(var_balances, n_row)
})

################################################################################
# Export to LaTeX
#-------------------------------------------------------------------------------
out_dir <- "balance_tables_results_median_medios"
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)


cols_order <- c("variable",
                "pre_treated", "pre_sd_T", "pre_control", "pre_sd_C", "pre_diff", "pre_smd", "pre_vratio", "pre_p",
                "match_treat", "match_sd_T", "match_ctrl", "match_sd_C", "match_diff", "match_smd", "match_vratio", "match_p")

col_english <- c("Variable",
                 "Pre: Mean T", "Pre: SD T", "Pre: Mean C", "Pre: SD C", "Pre: Diff", "Pre: SMD", "Pre: V-Ratio", "Pre: p",
                 "Match: Mean T", "Match: SD T", "Match: Mean C", "Match: SD C", "Match: Diff", "Match: SMD", "Match: V-Ratio", "Match: p")

by_method <- split(balance_all, balance_all$method)

purrr::iwalk(by_method, function(dfm, meth_label) {
  custom_levels <- c(rhs_vars, "N")
  
  tab <- dfm %>%
    dplyr::select(dplyr::all_of(cols_order)) %>%
    dplyr::arrange(factor(variable, levels = custom_levels))
  
  num_cols <- setdiff(names(tab), "variable")
  tab[num_cols] <- lapply(tab[num_cols], function(x) suppressWarnings(as.numeric(x)))
  
  p_and_stat_cols <- c("pre_p", "match_p", "pre_smd", "match_smd", "pre_vratio", "match_vratio")
  other_cols <- setdiff(num_cols, p_and_stat_cols)
  
  is_N_row <- tab$variable == "N"
  
  # Redondear variables estándar (Medias/SD a 2 decimales, Métricas críticas a 3)
  tab[!is_N_row, other_cols] <- lapply(tab[!is_N_row, other_cols], function(x) round(x, 2))
  tab[!is_N_row, p_and_stat_cols] <- lapply(tab[!is_N_row, p_and_stat_cols], function(x) round(x, 3))
  
  # La fila "N" siempre debe mostrar números enteros (sin decimales)
  tab[is_N_row, "pre_treated"]  <- round(tab[is_N_row, "pre_treated"], 0)
  tab[is_N_row, "pre_control"]  <- round(tab[is_N_row, "pre_control"], 0)
  tab[is_N_row, "match_treat"]  <- round(tab[is_N_row, "match_treat"], 0)
  tab[is_N_row, "match_ctrl"]   <- round(tab[is_N_row, "match_ctrl"], 0)
  
  colnames(tab) <- col_english

  digits <- c(0) 
  for (nm in col_english) {
    if (nm == "Variable") {
      digits <- c(digits, 0)
    } else if (nm %in% c("Pre: p", "Match: p", "Pre: SMD", "Match: SMD", "Pre: V-Ratio", "Match: V-Ratio")) {
      digits <- c(digits, 3)
    } else {
      digits <- c(digits, 2)
    }
  }
  
  align <- c("l", "l", rep("r", length(col_english) - 1))
  
  file_tag <- gsub("[^A-Za-z0-9]+", "_", as.character(meth_label))
  fn <- file.path(out_dir, paste0("balance_", file_tag, ".tex"))
  
  print(xtable::xtable(tab, digits = digits, align = align),
        include.rownames = FALSE,
        file = fn)
})

#-------------------------------------------------------------------------------
# Bloque Final Estático para la tabla ancha de resultados (wide_table_results.tex)
#-------------------------------------------------------------------------------
out_dir <- "results_tables_results_median_medios"
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

fn <- file.path(out_dir, "wide_table_results.tex")
tw <- table_wide

num_cols <- setdiff(names(tw), "method")
tw[num_cols] <- lapply(tw[num_cols], 
                       function(x) suppressWarnings(as.numeric(x)))

align_vec <- c("l", "l", rep("r", ncol(tw) - 1))

digits_vec <- rep(0, ncol(tw) + 1)

pval_idx <- grep("_pval$", names(tw), value = FALSE)
se_idx   <- grep("_se$", names(tw), value = FALSE)
coef_idx <- grep("_coef$", names(tw), value = FALSE)

if (length(pval_idx)) digits_vec[pval_idx + 1] <- 3
if (length(se_idx))   digits_vec[se_idx + 1]   <- 3
if (length(coef_idx)) digits_vec[coef_idx + 1] <- 3 

print(
  xtable::xtable(
    tw,
    caption = "Matching results by method and outcome.",
    label   = "tab:wide_results",
    digits  = digits_vec,
    align   = align_vec
  ),
  include.rownames = FALSE,
  sanitize.text.function = identity,  
  file = fn
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
cat(note_block, file = fn, append = TRUE)
#########################################################################################
################################################################################
# Rosenbaum Sensitivity Bounds (Table B.3)
#-------------------------------------------------------------------------------
md_mahal <- matched_datasets[["nearest_mahal_exact_prov"]]

find_gamma_threshold <- function(outcome_vec, trt, gamma_seq = seq(1, 4, by = 0.1), alpha = 0.05) {
  x_T <- outcome_vec[trt == 1]
  x_C <- outcome_vec[trt == 0]
  n   <- min(length(x_T), length(x_C))
  x_T <- x_T[1:n]
  x_C <- x_C[1:n]
  
  gamma_threshold <- NA
  for (g in gamma_seq) {
    res     <- psens(x = x_T, y = x_C, Gamma = g, GammaInc = 0.1)
    p_upper <- res$bounds[res$bounds$Gamma == g, "Upper bound"]
    if (!is.na(p_upper) && p_upper >= alpha) {
      gamma_threshold <- g
      break
    }
  }
  return(gamma_threshold)
}

sensitivity_results <- purrr::map_dfr(outcomes, function(oc) {
  tibble::tibble(
    outcome = oc,
    gamma   = find_gamma_threshold(
      outcome_vec = md_mahal[[oc]],
      trt         = md_mahal$treated
    )
  )
})

sens_wide <- sensitivity_results %>%
  pivot_wider(names_from = outcome, values_from = gamma) %>%
  mutate(definition = "Median split (full sample)") %>%
  dplyr::select(definition, everything())

colnames(sens_wide) <- c("Treatment definition",
                         "Theft", "Robbery", "Assault", "Sex offenses")

out_dir <- "results_tables_results_median_medios"
print(
  xtable::xtable(sens_wide,
                 caption = "Rosenbaum sensitivity bounds: Gamma at which the ATT loses significance",
                 label   = "tab:B3"),
  include.rownames = FALSE,
  file = file.path(out_dir, "table_B3_rosenbaum.tex")
)
################################################################################