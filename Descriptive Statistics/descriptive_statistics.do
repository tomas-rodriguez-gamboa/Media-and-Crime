/*******************************************************************************

                    Descriptive Statics CROSS SECTION
					
					Author: Tomás Rodríguez Gamboa

*******************************************************************************/

global cross_section "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\merge.do"				   
						   
use "$cross_section/base_cross_section_2021.dta", clear


/*******************************************************************************

                               TIER 1
	  
********************************************************************************/

*NATIONAL AGGREGATES

*total de medios
quietly sum cantidad_medios
scalar total_medios = r(sum)

*total de periodistas
quietly sum cantidad_periodistas
scalar total_periodistas = r(sum)

*medios por cada 100.000 mil habitantes (national)
quietly sum cantidad_medios
scalar total_medios = r(sum)
quietly sum poblacion_total
scalar total_pob = r(sum)
scalar tasa_nacional_medios = (scalar(total_medios) / scalar(total_pob)) * 100000

* Journalists per outlet (porque hay divisiones que dan 0 cuando no tengo medios)
gen periodistas_por_medio = cantidad_periodistas / cantidad_medios if cantidad_medios > 0
sum periodistas_por_medio
scalar mean_per_outlet = r(mean)

sum periodistas_por_medio, detail
scalar median_per_outlet = r(p50)


/*Share of outlets that produce locally vs. syndicated content*/



*COVERAGE/ MEDIA DESERTS

 * Departamentos con cero medios
count if cantidad_medios == 0
scalar depto_cero = r(N)
* Total de departamentos
count
scalar total_deptos = r(N)
* Share (cero medios)
scalar share_cero = (scalar(depto_cero) / scalar(total_deptos)) * 100

* Departamentos con 2 o menos medios
count if cantidad_medios <= 2
scalar depto_dos = r(N)
scalar share_dos = (scalar(depto_dos) / scalar(total_deptos)) * 100

* Departamentos con 5 o menos medios
count if cantidad_medios <= 5
scalar depto_cinco = r(N)
scalar share_cinco = (scalar(depto_cinco) / scalar(total_deptos)) * 100

*********************
* Primero el total de poblacion nacional
quietly sum poblacion_total
scalar total_pob = r(sum)

* Poblacion en departamentos con cero medios
quietly sum poblacion_total if cantidad_medios == 0
scalar pob_cero = r(sum)
scalar share_pob_cero = (scalar(pob_cero) / scalar(total_pob)) * 100

* Poblacion en departamentos con 2 o menos medios
quietly sum poblacion_total if cantidad_medios <= 2
scalar pob_dos = r(sum)
scalar share_pob_dos = (scalar(pob_dos) / scalar(total_pob)) * 100

* Poblacion en departamentos con 5 o menos medios
quietly sum poblacion_total if cantidad_medios <= 5
scalar pob_cinco = r(sum)
scalar share_pob_cinco = (scalar(pob_cinco) / scalar(total_pob)) * 100

* Para ver los resultados
display "Share pob cero medios: " scalar(share_pob_cero)
display "Share pob 2 o menos: " scalar(share_pob_dos)
display "Share pob 5 o menos: " scalar(share_pob_cinco)

*asimetria numerica 
sum cantidad_medios, detail
scalar mean_medios = r(mean)
scalar p25_medios = r(p25)
scalar p50_medios = r(p50)
scalar p75_medios = r(p75)
scalar p90_medios = r(p90)
scalar p99_medios = r(p99)


*COMPOSITION

*conteo y promedio de tipos de medios 
preserve
use "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\base de datos fopea\formato stata\base_formulario_1_cleaned.dta", clear

* Total de medios excluyendo departamentos sin medios
count if departamento != "iruya" & departamento != "la poma" & departamento != "molinos"
scalar total_medios_desag = r(N)

* Conteo y share por tipo de medio
count if medio_escrito == 1 & departamento != "iruya" & departamento != "la poma" & departamento != "molinos"
scalar count_escrito = r(N)
scalar share_escrito = (scalar(count_escrito) / scalar(total_medios_desag)) * 100

count if medio_audiovisual == 1 & departamento != "iruya" & departamento != "la poma" & departamento != "molinos"
scalar count_audiovisual = r(N)
scalar share_audiovisual = (scalar(count_audiovisual) / scalar(total_medios_desag)) * 100

count if medio_redes == 1 & departamento != "iruya" & departamento != "la poma" & departamento != "molinos"
scalar count_redes = r(N)
scalar share_redes = (scalar(count_redes) / scalar(total_medios_desag)) * 100

restore



/* los contratos no tengo
esa info*/


*PROVINCIAL HETEROGENEITY

*Medios por provincia
egen medios_prov = total(cantidad_medios), by(id_prov)
egen pob_prov = total(poblacion_total), by(id_prov)
gen tasa_prov = (medios_prov / pob_prov) * 100000

* Tag para evitar sobreconteo
egen tag_prov = tag(id_prov)

* Promedio nacional de tasas provinciales
sum tasa_prov if tag_prov == 1
scalar promedio_tasa_prov = r(mean)

* Min y max de tasa provincial
scalar min_tasa_prov = r(min)
scalar max_tasa_prov = r(max)

* Provincia con tasa mínima de medios
levelsof provincia if tasa_prov == scalar(min_tasa_prov) & tag_prov == 1, local(prov_min_medios) clean
local prov_min_medios = "`prov_min_medios'"
* Provincia con tasa máxima de medios
levelsof provincia if tasa_prov == scalar(max_tasa_prov) & tag_prov == 1, local(prov_max_medios) clean
local prov_max_medios = "`prov_max_medios'"


*Periodistas por provincia
egen periodistas_prov = total(cantidad_periodistas), by(id_prov)
gen tasa_periodistas_prov = (periodistas_prov / pob_prov) * 100000

* Promedio nacional de tasas provinciales y mismo tag que antes
sum tasa_periodistas_prov if tag_prov == 1
scalar promedio_tasa_periodistas_prov = r(mean)

* Min y max de tasa provincial
scalar min_tasa_periodistas_prov = r(min)
scalar max_tasa_periodistas_prov = r(max)

* Provincia con tasa mínima de periodistas
levelsof provincia if tasa_periodistas_prov == scalar(min_tasa_periodistas_prov) & tag_prov == 1, local(prov_min_periodistas) clean
local prov_min_periodistas = "`prov_min_periodistas'"
* Provincia con tasa máxima de periodistas
levelsof provincia if tasa_periodistas_prov == scalar(max_tasa_periodistas_prov) & tag_prov == 1, local(prov_max_periodistas) clean
local prov_max_periodistas = "`prov_max_periodistas'"


* Creamos el ranking real, único y correlativo del 1 al 24 (para medios)
egen ranking_prov = rank(-tasa_prov) if tag_prov == 1, unique
* Verificamos el resumen 
sum ranking_prov					   
* Santiago del Estero
levelsof ranking_prov if provincia == "santiago del estereo" & tag_prov == 1, local(ranking_santiago)
levelsof tasa_prov if provincia == "santiago del estereo" & tag_prov == 1, local(tasa_santiago)
* Formosa
levelsof ranking_prov if provincia == "formosa" & tag_prov == 1, local(ranking_formosa)
levelsof tasa_prov if provincia == "formosa" & tag_prov == 1, local(tasa_formosa)
* La Rioja
levelsof ranking_prov if provincia == "la rioja" & tag_prov == 1, local(ranking_larioja)
levelsof tasa_prov if provincia == "la rioja" & tag_prov == 1, local(tasa_larioja)	
	
* Creamos el ranking real, único y correlativo del 1 al 24 (para periodistas)
egen ranking_periodistas_prov = rank(-tasa_periodistas_prov) if tag_prov == 1, unique
* Verificamos el resumen
sum ranking_periodistas_prov
* Santiago del Estero
levelsof ranking_periodistas_prov if provincia == "santiago del estereo" & tag_prov == 1, local(ranking_periodistas_santiago)
levelsof tasa_periodistas_prov if provincia == "santiago del estereo" & tag_prov == 1, local(tasa_periodistas_santiago)
* Formosa
levelsof ranking_periodistas_prov if provincia == "formosa" & tag_prov == 1, local(ranking_periodistas_formosa)
levelsof tasa_periodistas_prov if provincia == "formosa" & tag_prov == 1, local(tasa_periodistas_formosa)
* La Rioja
levelsof ranking_periodistas_prov if provincia == "la rioja" & tag_prov == 1, local(ranking_periodistas_larioja)
levelsof tasa_periodistas_prov if provincia == "la rioja" & tag_prov == 1, local(tasa_periodistas_larioja)
	
	
								   
*identificar la presencia min de medios para gran buenos aires
* Total de municipios en GBA
count if id_prov == 5
scalar total_gba = r(N)

* Municipios con 0 medios
count if id_prov == 5 & cantidad_medios == 0
scalar gba_cero = r(N)
scalar share_gba_cero = (scalar(gba_cero) / scalar(total_gba)) * 100

* Municipios con 2 o menos medios
count if id_prov == 5 & cantidad_medios <= 2
scalar gba_dos = r(N)
scalar share_gba_dos = (scalar(gba_dos) / scalar(total_gba)) * 100

* Municipios con 5 o menos medios
count if id_prov == 5 & cantidad_medios <= 5
scalar gba_cinco = r(N)
scalar share_gba_cinco = (scalar(gba_cinco) / scalar(total_gba)) * 100

display "Share GBA cero medios: " scalar(share_gba_cero)
display "Share GBA 2 o menos: " scalar(share_gba_dos)
display "Share GBA 5 o menos: " scalar(share_gba_cinco)



/*******************************************************************************

                               TIER 2
	  
********************************************************************************/

eststo clear
* Correlacion entre medios y periodistas
estpost correlate cantidad_medios cantidad_periodistas, listwise
esttab . using "Table_Media_Correlation.tex", replace ///
    cells("rho(fmt(3))") ///
    not noobs nonumber ///
    booktabs ///
    title("Baseline Correlation Between Media Measures") ///
    collabels(none) ///
    rename(cantidad_medios "Local Media Outlets" cantidad_periodistas "Total Journalists")

eststo clear
* Macro local con el orden exacto de las covariables del Censo para las filas
local censo_vars superficie_km2 genero indice_envejecimiento ///
                 hogares_sin_agua promedio_personas_viviendas desague_sin_red ///
                 porcentaje_nac_en_extranjeros tasa_actividad
* Calculamos y guardamos la primera columna (Correlaciones con Medios)
estpost correlate cantidad_medios `censo_vars', listwise
eststo corr_medios
* Calculamos y guardamos la segunda columna (Correlaciones con Periodistas)
estpost correlate cantidad_periodistas `censo_vars', listwise
eststo corr_periodistas
* Exportamos ambas columnas juntas
esttab corr_medios corr_periodistas using "Table_Census_Correlations.tex", replace ///
    cells("rho(fmt(3))") ///
    booktabs ///
    not noobs nonumber ///
    label ///
    title("Department-Level Correlations: Media Measures vs. Census Covariates") ///
    mtitles("Local Media Outlets" "Total Journalists") ///
    collabels(none)


/*******************************************************************************

                               TIER 3
	  
********************************************************************************/

* scatter o density de periodistas 
preserve
use "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\base de datos fopea\formato stata\base_formulario_1_cleaned.dta", clear

* Excluir departamentos sin medios
drop if departamento == "iruya" | departamento == "la poma" | departamento == "molinos"

* Variable aproximada de periodistas
gen periodistas_aprox = .
replace periodistas_aprox = 3 if periodistas_1_5 == 1
replace periodistas_aprox = 7.5 if periodistas_6_9 == 1
replace periodistas_aprox = 14.5 if periodistas_10_19 == 1
replace periodistas_aprox = 29.5 if periodistas_20_39 == 1
replace periodistas_aprox = 49.5 if periodistas_40_59 == 1
replace periodistas_aprox = 69.5 if periodistas_60_79 == 1
replace periodistas_aprox = 89.5 if periodistas_80_99 == 1
replace periodistas_aprox = 120 if periodistas_mas_100 == 1

* Scatter
encode provincia, gen(provincia_num)

scatter periodistas_aprox provincia_num, ///
    graphregion(color(white)) plotregion(color(white)) ///
    xtitle("Province") ///
    ytitle("Journalists per outlet (approximate)") ///
    msize(small) jitter(3) ///
    xlabel(, valuelabel angle(45))
graph export "scatter_periodistas_outlet.png", replace

restore


* descomposicion de varianza (no me funciono de forma automatica)
* Overall
xtset id_prov
quietly sum relacion_poblacion_medios
scalar mean_overall = r(mean)
scalar sd_overall = r(sd)
scalar min_overall = r(min)
scalar max_overall = r(max)

* Between: colapsar a nivel provincia
preserve
collapse (mean) relacion_poblacion_medios, by(id_prov)
quietly sum relacion_poblacion_medios
scalar sd_between = r(sd)
scalar min_between = r(min)
scalar max_between = r(max)
restore

* Within: extraido del xtsum
xtsum relacion_poblacion_medios
scalar sd_within = 11.97322



*===============================================================================
* COMPOSITION: MEDIA AGE (PRE VS POST 2000) - FILE WRITE
*===============================================================================

preserve
    use "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\base de datos fopea\formato stata\base_formulario_1_cleaned.dta", clear

*  Excluir departamentos sin medios para mantener consistencia
    drop if inlist(departamento, "iruya", "la poma", "molinos")
*  Calcular el total real de observaciones válidas en esta base micro
    quietly count if antiguedad != ""
    scalar total_medios_antiguedad = r(N)
*  Conteos y Shares absolutos
    quietly count if antiguedad == "Medio Tradicional"
    scalar count_pre2000 = r(N)
    scalar share_pre2000 = (scalar(count_pre2000) / scalar(total_medios_antiguedad)) * 100
    quietly count if antiguedad != "Medio Tradicional" & antiguedad != ""
    scalar count_post2000 = r(N)
    scalar share_post2000 = (scalar(count_post2000) / scalar(total_medios_antiguedad)) * 100
*  Control visual rápido en consola
    display "Pre-2000: " scalar(count_pre2000) " (" scalar(share_pre2000) "%)"
    display "Post-2000: " scalar(count_post2000) " (" scalar(share_post2000) "%)"
restore




********************************************************************************
* VERIFICACION DE SCALARS
********************************************************************************

* Tabla 1
display "=== TABLA 1 ==="
display "total_medios: " scalar(total_medios)
display "total_periodistas: " scalar(total_periodistas)
display "tasa_nacional_medios: " scalar(tasa_nacional_medios)
display "mean_per_outlet: " scalar(mean_per_outlet)
display "median_per_outlet: " scalar(median_per_outlet)

* Tabla 2
display "=== TABLA 2 ==="
display "depto_cero: " scalar(depto_cero)
display "share_cero: " scalar(share_cero)
display "share_pob_cero: " scalar(share_pob_cero)
display "depto_dos: " scalar(depto_dos)
display "share_dos: " scalar(share_dos)
display "share_pob_dos: " scalar(share_pob_dos)
display "depto_cinco: " scalar(depto_cinco)
display "share_cinco: " scalar(share_cinco)
display "share_pob_cinco: " scalar(share_pob_cinco)

* Tabla 3
display "=== TABLA 3 ==="
display "mean_medios: " scalar(mean_medios)
display "p25_medios: " scalar(p25_medios)
display "p50_medios: " scalar(p50_medios)
display "p75_medios: " scalar(p75_medios)
display "p90_medios: " scalar(p90_medios)
display "p99_medios: " scalar(p99_medios)

* Tabla 4
display "=== TABLA 4 ==="
display "count_escrito: " scalar(count_escrito)
display "share_escrito: " scalar(share_escrito)
display "count_audiovisual: " scalar(count_audiovisual)
display "share_audiovisual: " scalar(share_audiovisual)
display "count_redes: " scalar(count_redes)
display "share_redes: " scalar(share_redes)

* Tabla 5A
display "=== TABLA 5A ==="
display "min_tasa_prov: " scalar(min_tasa_prov)
display "max_tasa_prov: " scalar(max_tasa_prov)
display "prov_min_medios: " "`prov_min_medios'"
display "prov_max_medios: " "`prov_max_medios'"
display "min_tasa_periodistas_prov: " scalar(min_tasa_periodistas_prov)
display "max_tasa_periodistas_prov: " scalar(max_tasa_periodistas_prov)
display "tasa_larioja: " `tasa_larioja'
display "ranking_larioja: " `ranking_larioja'
display "tasa_formosa: " `tasa_formosa'
display "ranking_formosa: " `ranking_formosa'
display "tasa_santiago: " `tasa_santiago'
display "ranking_santiago: " `ranking_santiago'

* Tabla 5B
display "=== TABLA 5B ==="
display "gba_cero: " scalar(gba_cero)
display "share_gba_cero: " scalar(share_gba_cero)
display "gba_dos: " scalar(gba_dos)
display "share_gba_dos: " scalar(share_gba_dos)
display "gba_cinco: " scalar(gba_cinco)
display "share_gba_cinco: " scalar(share_gba_cinco)

* Tabla 6
display "=== TABLA 6 ==="
display "mean_overall: " scalar(mean_overall)
display "sd_overall: " scalar(sd_overall)
display "min_overall: " scalar(min_overall)
display "max_overall: " scalar(max_overall)
display "sd_between: " scalar(sd_between)
display "min_between: " scalar(min_between)
display "max_between: " scalar(max_between)
display "sd_within: " scalar(sd_within)

* Tabla 7
display "=== TABLA 7 ==="
display "count_pre2000: " scalar(count_pre2000)
display "share_pre2000: " scalar(share_pre2000)
display "count_post2000: " scalar(count_post2000)
display "share_post2000: " scalar(share_post2000)
display "total_medios_antiguedad: " scalar(total_medios_antiguedad)






********************************************************************************
* TABLA 1 "NATIONAL AGGREGATES"
******************************************************************************** 
file open tabla1 using "tabla1_National_aggregates.tex", write replace
file write tabla1 "\begin{table}[H]" _n
file write tabla1 "\centering" _n
file write tabla1 "\caption{Media : National Aggregates}" _n
file write tabla1 "\label{tab:national_aggregates}" _n
file write tabla1 "\begin{tabular}{lc}" _n
file write tabla1 "\toprule" _n
file write tabla1 " & 2021 \\" _n
file write tabla1 "\midrule" _n
file write tabla1 "Total number of local media outlets & `=scalar(total_medios)' \\" _n
file write tabla1 "Total journalists & `=scalar(total_periodistas)' \\" _n
file write tabla1 "Outlets per 100,000 inhabitants & `: display %9.2f scalar(tasa_nacional_medios)' \\" _n
file write tabla1 "Journalists per outlet (mean) & `: display %9.2f scalar(mean_per_outlet)' \\" _n
file write tabla1 "Journalists per outlet (median) & `: display %9.2f scalar(median_per_outlet)' \\" _n
file write tabla1 "\midrule" _n
file write tabla1 "\multicolumn{2}{p{0.85\linewidth}}{\footnotesize \textit{Notes:} Data from FOPEA 2021 snapshot.} \\" _n
file write tabla1 "\bottomrule" _n
file write tabla1 "\end{tabular}" _n
file write tabla1 "\end{table}" _n
file close tabla1

********************************************************************************
* TABLA 2 "MEDIA DESERTS"
******************************************************************************** 
file open tabla2 using "tabla2_Media_deserts.tex", write replace
file write tabla2 "\begin{table}[H]" _n
file write tabla2 "\centering" _n
file write tabla2 "\caption{Media: Media Deserts}" _n
file write tabla2 "\label{tab:media_deserts}" _n
file write tabla2 "\begin{tabular}{lccc}" _n
file write tabla2 "\toprule" _n
file write tabla2 "Media availability & Departments & Share of departments (\%) & Share of population (\%) \\" _n
file write tabla2 "\midrule" _n
file write tabla2 "zero outlets & `=scalar(depto_cero)' & `: display %9.2f scalar(share_cero)' & `: display %9.2f scalar(share_pob_cero)' \\" _n
file write tabla2 "\$\leq\$ 2 outlets & `=scalar(depto_dos)' & `: display %9.2f scalar(share_dos)' & `: display %9.2f scalar(share_pob_dos)' \\" _n
file write tabla2 "\$\leq\$ 5 outlets & `=scalar(depto_cinco)' & `: display %9.2f scalar(share_cinco)' & `: display %9.2f scalar(share_pob_cinco)' \\" _n
file write tabla2 "\midrule" _n
file write tabla2 "\multicolumn{4}{p{0.9\linewidth}}{\footnotesize \textit{Notes:} Shares are calculated relative to the total number of departments and national population.} \\" _n
file write tabla2 "\bottomrule" _n
file write tabla2 "\end{tabular}" _n
file write tabla2 "\end{table}" _n
file close tabla2

********************************************************************************
* TABLA 3 "DISTRIBUTION OF OUTLETS PER DEPARTMENT"
********************************************************************************
file open tabla3 using "tabla3_distribution_outlets.tex", write replace
file write tabla3 "\begin{table}[H]" _n
file write tabla3 "\centering" _n
file write tabla3 "\caption{Distribution of Local Media Outlets Across Departments}" _n
file write tabla3 "\label{tab:distribution_outlets}" _n
file write tabla3 "\begin{tabular}{lc}" _n
file write tabla3 "\toprule" _n
file write tabla3 "Statistic & Outlets per department \\" _n
file write tabla3 "\midrule" _n
file write tabla3 "Mean & `: display %9.2f scalar(mean_medios)' \\" _n
file write tabla3 "25th percentile & `: display %9.2f scalar(p25_medios)' \\" _n
file write tabla3 "Median & `: display %9.2f scalar(p50_medios)' \\" _n
file write tabla3 "75th percentile & `: display %9.2f scalar(p75_medios)' \\" _n
file write tabla3 "90th percentile & `: display %9.2f scalar(p90_medios)' \\" _n
file write tabla3 "99th percentile & `: display %9.2f scalar(p99_medios)' \\" _n
file write tabla3 "\midrule" _n
file write tabla3 "\multicolumn{2}{p{0.85\linewidth}}{\footnotesize \textit{Notes:} Statistics are computed using the distribution of local media outlets across departments. The large gap between upper percentiles and the median documents the strong concentration of outlets in a small number of departments.} \\" _n
file write tabla3 "\bottomrule" _n
file write tabla3 "\end{tabular}" _n
file write tabla3 "\end{table}" _n
file close tabla3

********************************************************************************
* TABLA 4 "COMPOSITION"
********************************************************************************
file open tabla4 using "tabla4_composition.tex", write replace
file write tabla4 "\begin{table}[H]" _n
file write tabla4 "\centering" _n
file write tabla4 "\caption{Composition of Media Outlets}" _n
file write tabla4 "\label{tab:composition_outlets}" _n
file write tabla4 "\begin{tabular}{lcc}" _n
file write tabla4 "\toprule" _n
file write tabla4 "Outlet type & Count & Share (\%) \\" _n
file write tabla4 "\midrule" _n
file write tabla4 "Written & `=scalar(count_escrito)' & `: display %9.2f scalar(share_escrito)' \\" _n
file write tabla4 "Audiovisual & `=scalar(count_audiovisual)' & `: display %9.2f scalar(share_audiovisual)' \\" _n
file write tabla4 "Digital & `=scalar(count_redes)' & `: display %9.2f scalar(share_redes)' \\" _n
file write tabla4 "\midrule" _n
file write tabla4 "\multicolumn{3}{p{0.9\linewidth}}{\footnotesize \textit{Notes:} Categories are not mutually exclusive. A single outlet may be classified in more than one category. Shares refer to the proportion of outlets with each characteristic in the FOPEA 2021 outlet-level database.}\\" _n
file write tabla4 "\bottomrule" _n
file write tabla4 "\end{tabular}" _n
file write tabla4 "\end{table}" _n
file close tabla4

********************************************************************************
* TABLA 5 "HETEROGENEITY"
********************************************************************************
file open tabla5a using "tabla5a_provincial_heterogeneity.tex", write replace
file write tabla5a "\begin{table}[H]" _n
file write tabla5a "\centering" _n
file write tabla5a "\caption{Provincial Heterogeneity in Media Presence}" _n
file write tabla5a "\label{tab:provincial_heterogeneity}" _n
file write tabla5a "\begin{tabular}{lcccc}" _n
file write tabla5a "\toprule" _n
file write tabla5a " & Outlets per 100,000 & Rank & Journalists per 100,000 & Rank \\" _n
file write tabla5a "\midrule" _n
file write tabla5a "Min (`prov_min_medios') & `: display %9.2f scalar(min_tasa_prov)' & --- & `: display %9.2f scalar(min_tasa_periodistas_prov)' & --- \\" _n
file write tabla5a "Max (`prov_max_medios') & `: display %9.2f scalar(max_tasa_prov)' & --- & `: display %9.2f scalar(max_tasa_periodistas_prov)' & --- \\" _n
file write tabla5a "\midrule" _n
file write tabla5a "La Rioja & `: display %9.2f `tasa_larioja'' & `ranking_larioja' & `: display %9.2f `tasa_periodistas_larioja'' & `ranking_periodistas_larioja' \\" _n
file write tabla5a "Formosa & `: display %9.2f `tasa_formosa'' & `ranking_formosa' & `: display %9.2f `tasa_periodistas_formosa'' & `ranking_periodistas_formosa' \\" _n
file write tabla5a "Santiago del Estero & `: display %9.2f `tasa_santiago'' & `ranking_santiago' & `: display %9.2f `tasa_periodistas_santiago'' & `ranking_periodistas_santiago' \\" _n
file write tabla5a "\midrule" _n
file write tabla5a "\multicolumn{5}{p{0.95\linewidth}}{\footnotesize \textit{Notes:} Rates computed as totals per 100,000 inhabitants. Rank 1 indicates highest rate among 24 provinces.} \\" _n
file write tabla5a "\bottomrule" _n
file write tabla5a "\end{tabular}" _n
file write tabla5a "\end{table}" _n
file close tabla5a

file open tabla5b using "tabla5b_gba_media_presence.tex", write replace
file write tabla5b "\begin{table}[H]" _n
file write tabla5b "\centering" _n
file write tabla5b "\caption{Minimal Media Presence in Greater Buenos Aires}" _n
file write tabla5b "\label{tab:gba_media}" _n
file write tabla5b "\begin{tabular}{lcc}" _n
file write tabla5b "\toprule" _n
file write tabla5b "Media availability & Municipalities & Share (\%) \\" _n
file write tabla5b "\midrule" _n
file write tabla5b "Zero outlets & `=scalar(gba_cero)' & `: display %9.2f scalar(share_gba_cero)' \\" _n
file write tabla5b "\$\leq\$ 2 outlets & `=scalar(gba_dos)' & `: display %9.2f scalar(share_gba_dos)' \\" _n
file write tabla5b "\$\leq\$ 5 outlets & `=scalar(gba_cinco)' & `: display %9.2f scalar(share_gba_cinco)' \\" _n
file write tabla5b "\midrule" _n
file write tabla5b "\multicolumn{3}{p{0.85\linewidth}}{\footnotesize \textit{Notes:} Greater Buenos Aires municipalities only. Shares relative to total GBA municipalities.} \\" _n
file write tabla5b "\bottomrule" _n
file write tabla5b "\end{tabular}" _n
file write tabla5b "\end{table}" _n
file close tabla5b

********************************************************************************
* TABLA 6 "DESCOMPOSITION OF VARIANCE"
********************************************************************************
file open tabla6 using "tabla6_variance_decomp.tex", write replace
file write tabla6 "\begin{table}[H]" _n
file write tabla6 "\centering" _n
file write tabla6 "\caption{Variance Decomposition of Outlets per 100,000 Inhabitants}" _n
file write tabla6 "\label{tab:variance_decomp}" _n
file write tabla6 "\begin{tabular}{lcccc}" _n
file write tabla6 "\toprule" _n
file write tabla6 " & Mean & Std. Dev. & Min & Max \\" _n
file write tabla6 "\midrule" _n
file write tabla6 "Overall & `: display %9.2f scalar(mean_overall)' & `: display %9.2f scalar(sd_overall)' & `: display %9.2f scalar(min_overall)' & `: display %9.2f scalar(max_overall)' \\" _n
file write tabla6 "Between provinces & & `: display %9.2f scalar(sd_between)' & `: display %9.2f scalar(min_between)' & `: display %9.2f scalar(max_between)' \\" _n
file write tabla6 "Within provinces & & `: display %9.2f scalar(sd_within)' & & \\" _n
file write tabla6 "\midrule" _n
file write tabla6 "\multicolumn{5}{p{0.95\linewidth}}{\footnotesize \textit{Notes:} Decomposition based on province fixed effects. Between variation reflects differences across provinces; within variation reflects differences across departments within the same province.} \\" _n
file write tabla6 "\bottomrule" _n
file write tabla6 "\end{tabular}" _n
file write tabla6 "\end{table}" _n
file close tabla6

********************************************************************************
* TABLA 7 "MEDIA AGE"
********************************************************************************
file open tabla7 using "tabla7_media_age.tex", write replace
file write tabla7 "\begin{table}[H]" _n
file write tabla7 "\centering" _n
file write tabla7 "\caption{Composition of Local Media Outlets by Vintage}" _n
file write tabla7 "\label{tab:media_age}" _n
file write tabla7 "\begin{tabular}{lcc}" _n
file write tabla7 "\toprule" _n
file write tabla7 "Media Vintage & Count & Share (\%) \\" _n
file write tabla7 "\midrule" _n
file write tabla7 "Pre-2000 (Traditional Media) & `=scalar(count_pre2000)' & `: display %9.2f scalar(share_pre2000)' \\" _n
file write tabla7 "Post-2000 (New / Digital Media) & `=scalar(count_post2000)' & `: display %9.2f scalar(share_post2000)' \\" _n
file write tabla7 "\midrule" _n
file write tabla7 "Total & `=scalar(total_medios_antiguedad)' & 100.00 \\" _n
file write tabla7 "\midrule" _n
file write tabla7 "\multicolumn{3}{p{0.85\linewidth}}{\footnotesize \textit{Notes:} Data from FOPEA 2021 outlet-level database.} \\" _n
file write tabla7 "\bottomrule" _n
file write tabla7 "\end{tabular}" _n
file write tabla7 "\end{table}" _n
file close tabla7


















