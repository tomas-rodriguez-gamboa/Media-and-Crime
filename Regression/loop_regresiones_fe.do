/*******************************************************************************
   loop_regresiones_fe.do
   Drop-in replacement for loop_regresiones_fe.do.

   Author: Tomas Rodriguez Gamboa
   Date  : 2026-05-25
*******************************************************************************/

* User: set this path to wherever the .dta lives on your machine
global cross_section "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\merge.do"

use "$cross_section/base_cross_section_2021.dta", clear

* The crime variable for sex offenses is called `rape` in this base, not
* `sex_offense`. Either rename here or update the paper to clarify the
* subclass restriction:
* rename rape sex_offense  // <- uncomment if you want to keep the original name

local crimes theft robbery threat assault rape

local demog superficie_km2 genero indice_envejecimiento
local viv hogares_sin_agua promedio_personas_viviendas desague_sin_red
local socio porcentaje_nac_en_extranjeros tasa_actividad
local censo_total `demog' `viv' `socio'

local antiguedad medio_pandemia medio_joven medio_consolidado medio_tradicional
local tipo medio_escrito medio_audiovisual medio_redes
local alcance extension_geografica prevencion_delito
local medios_total `antiguedad' `tipo' `alcance'

* -----------------------------------------------------------------------
* LOOP EXTERNO: medios vs periodistas
* -----------------------------------------------------------------------
foreach treat_var in cantidad_medios cantidad_periodistas {

    if "`treat_var'" == "cantidad_medios"      local suffix "medios"
    if "`treat_var'" == "cantidad_periodistas" local suffix "periodistas"

    * ----- CENSO ACUMULATIVO -----
    cap mkdir "results_census_cumulative_fe_cluster_`suffix'"

    foreach y of local crimes {
        eststo clear

        ppmlhdfe `y' `treat_var', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m1
        estadd local demog "No"
        estadd local viv "No"
        estadd local socio "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `demog', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m2
        estadd local demog "Yes"
        estadd local viv "No"
        estadd local socio "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `demog' `viv', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m3
        estadd local demog "Yes"
        estadd local viv "Yes"
        estadd local socio "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `censo_total', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m4
        estadd local demog "Yes"
        estadd local viv "Yes"
        estadd local socio "Yes"
        estadd local fe "Yes"

        esttab m1 m2 m3 m4 using "results_census_cumulative_fe_cluster_`suffix'/tabs_census_cumulative_fe_cluster_`y'.tex", replace ///
            keep(`treat_var') nodepvars eqlabels(none) nomtitles collabels(none) ///
            b(3) se(3) se star(* 0.10 ** 0.05 *** 0.01) ///
            stats(demog viv socio fe N, fmt(0 0 0 0 0) ///
            labels("Demographic controls" "Housing controls" "Socioeconomic controls" "Province FE" "Observations")) ///
            booktabs
    }

    * ----- MEDIOS ACUMULATIVO -----
    cap mkdir "results_media_cumulative_fe_cluster_`suffix'"

    foreach y of local crimes {
        eststo clear

        ppmlhdfe `y' `treat_var', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m1
        estadd local antiguedad "No"
        estadd local tipo "No"
        estadd local alcance "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `antiguedad', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m2
        estadd local antiguedad "Yes"
        estadd local tipo "No"
        estadd local alcance "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `antiguedad' `tipo', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m3
        estadd local antiguedad "Yes"
        estadd local tipo "Yes"
        estadd local alcance "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `medios_total', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        eststo m4
        estadd local antiguedad "Yes"
        estadd local tipo "Yes"
        estadd local alcance "Yes"
        estadd local fe "Yes"

        esttab m1 m2 m3 m4 using "results_media_cumulative_fe_cluster_`suffix'/tabs_media_cumulative_fe_cluster_`y'.tex", replace ///
            keep(`treat_var') nodepvars eqlabels(none) nomtitles collabels(none) ///
            b(3) se(3) se star(* 0.10 ** 0.05 *** 0.01) ///
            stats(antiguedad tipo alcance fe N, fmt(0 0 0 0 0) ///
            labels("Media age" "Media type" "Media scope" "Province FE" "Observations")) ///
            booktabs
    }

    * ----- MODELO COMPLETO -----
    cap mkdir "results_model_fe_cluster_`suffix'"

    foreach y of local crimes {
        eststo clear

        ppmlhdfe `y' `treat_var', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        estimates store `y'_m1
        eststo m1
        estadd local censo_total "No"
        estadd local medios_total "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `censo_total', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        estimates store `y'_m2
        eststo m2
        estadd local censo_total "Yes"
        estadd local medios_total "No"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `medios_total', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        estimates store `y'_m3
        eststo m3
        estadd local censo_total "No"
        estadd local medios_total "Yes"
        estadd local fe "Yes"

        ppmlhdfe `y' `treat_var' `censo_total' `medios_total', absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
        estimates store `y'_m4
        eststo m4
        estadd local censo_total "Yes"
        estadd local medios_total "Yes"
        estadd local fe "Yes"

        esttab m1 m2 m3 m4 using "results_model_fe_cluster_`suffix'/tabs_model_fe_cluster_`y'.tex", replace ///
            keep(`treat_var') nodepvars eqlabels(none) nomtitles collabels(none) ///
            b(3) se(3) se star(* 0.10 ** 0.05 *** 0.01) ///
            stats(censo_total medios_total fe N, fmt(0 0 0 0) ///
            labels("Census controls" "Media controls" "Province FE" "Observations")) ///
            booktabs

        * -----ADDITION: wild cluster bootstrap p-values on preferred (m4) -----
        * Install: ssc install boottest, replace
        cap which boottest
        if (_rc == 0) {
            qui ppmlhdfe `y' `treat_var' `censo_total' `medios_total', ///
                absorb(id_prov) exposure(poblacion_total) vce(cluster id_prov)
            cap boottest `treat_var' = 0, cluster(id_prov) reps(9999) weighttype(rademacher) seed(20260525)
            if (_rc == 0) {
                display "Wild cluster bootstrap p-value for `y' (preferred): " %6.4f r(p)
            }
        }
    }
}
