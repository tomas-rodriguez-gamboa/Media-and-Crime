/*******************************************************************************

                    Moderators CROSS SECTION
					
					Author: Tomás Rodríguez Gamboa

*******************************************************************************/


global cross_section "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\merge.do"				   
						   
use "$cross_section/base_cross_section_2021_extended.dta", clear


* ----- 1. medio_rural_alto: histograma -----
histogram medio_rural_alto, bin(30) title("Distribución medio_rural_alto")
graph export "histograma_rural.png", replace


* ----- Correlación -----
quietly correlate medio_contenido_local densidad_km2
local rho = string(r(C)[2,1], "%9.3f")

file open f using "descriptivos_moderadores.tex", write replace

file write f "\begin{table}[htbp]" _n
file write f "\centering" _n
file write f "\caption{Correlación medio\_contenido\_local y densidad poblacional}" _n
file write f "\begin{tabular}{lcc}" _n
file write f "\toprule" _n
file write f " & medio\_contenido\_local & densidad\_km2 \\" _n
file write f "\midrule" _n
file write f "medio\_contenido\_local & 1.000 & \\" _n
file write f "densidad\_km2 & `rho' & 1.000 \\" _n
file write f "\bottomrule" _n
file write f "\end{tabular}" _n
file write f "\end{table}" _n
file write f _n

* ----- Descriptivos prevencion_delito -----
quietly summarize prevencion_delito, detail
local mean = string(r(mean), "%9.3f")
local sd   = string(r(sd),   "%9.3f")
local med  = string(r(p50),  "%9.3f")
local min  = string(r(min),  "%9.3f")
local max  = string(r(max),  "%9.3f")
local n    = r(N)

file write f "\begin{table}[htbp]" _n
file write f "\centering" _n
file write f "\caption{Estadísticos descriptivos: prevencion\_delito}" _n
file write f "\begin{tabular}{lccccc}" _n
file write f "\toprule" _n
file write f "Variable & Media & SD & Mediana & Min & Max \\" _n
file write f "\midrule" _n
file write f "prevencion\_delito & `mean' & `sd' & `med' & `min' & `max' \\" _n
file write f "\bottomrule" _n
file write f "\multicolumn{6}{l}{\footnotesize N = `n'; 98 departamentos (19\%) reportan valor cero.}" _n
file write f "\end{tabular}" _n
file write f "\end{table}" _n

file close f