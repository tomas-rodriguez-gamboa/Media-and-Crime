/*
Merge de bases de fopea
*/
use base_fopea_categorizacion_cleaned
merge 1:1 departamento provincia using "base_formulario_1_cleaned_cross_section"

sort provincia departamento

*cambio los puntos por ceros excepto lezama para recordar que ese es un missing
*los que cambio por cero son porque no habian medios en la hoga de categorizacion
foreach var in periodistas_0 periodistas_1_5 periodistas_6_9 periodistas_10_19 periodistas_20_39 periodistas_40_59 periodistas_60_79 periodistas_80_99 periodistas_mas_100 medio_pandemia medio_joven medio_consolidado medio_tradicional ///
                medio_escrito medio_audiovisual medio_redes extension_geografica ///
                prevencion_delito total_medios  total_antiguedad {

    replace `var' = 0 if missing(`var') & ///
        !(provincia=="buenos aires" & departamento=="lezama")
}

*la provincia de salta tiene 3 departamentos con inconsistencia debido a que hay datos 0 y se contaron igual como cantidad de medios
* los departamentos: iruya  molinos   la poma 

drop _merge

*limpio en nombres para hacer el merge con las bases de censo, crimen y densidad.

replace provincia = "ciudad de buenos aires" if provincia == "ciudad autonoma buenos aires"
replace provincia = "santiago del estereo" if provincia== "santiago del estero"

replace departamento = "capitan sarmiento" if departamento== "sarmiento" & provincia == "buenos aires"
replace departamento = "coronel de marina leonardo rosales" if departamento== "coronel rosales" & provincia == "buenos aires"
replace departamento = "general arenales" if departamento== "arenales" & provincia == "buenos aires"
replace departamento = "general belgrano" if departamento== "belgrano" & provincia == "buenos aires"
replace departamento = "general juan madariaga" if departamento== "general madariaga" & provincia == "buenos aires"
replace departamento = "jose c. paz" if departamento== "jose c paz" & provincia == "buenos aires"
replace departamento = "general las heras" if departamento== "las heras" & provincia == "buenos aires"
replace departamento = "san nicolas" if departamento== "san nicolas de los arroyos" & provincia == "buenos aires"
replace departamento = "general viamonte" if departamento== "viamonte" & provincia == "buenos aires"
replace departamento = "mayor luis jorge fontana" if departamento== "mayor luis j. fontana" & provincia == "buenos aires"

replace departamento ="capital" if departamento == "corrientes" & provincia == "corrientes"

replace departamento = "islas del ibicuy" if departamento == "islas" & provincia == "entre rios"

replace departamento = "dr. manuel belgrano" if departamento == "dr manuel belgrano" & provincia == "jujuy"

replace departamento = "angel vicente peñaloza" if departamento == "general Ángel vicente peñaloza" & provincia == "la rioja"
replace departamento = "capital" if departamento == "la rioja (capital)" & provincia == "la rioja"
replace  departamento = "capital" if departamento == "ciudad de mendoza" & provincia == "mendoza"

replace  departamento = "capital" if departamento == "capital (posadas)" & provincia == "misiones"
replace  departamento = "eldorado" if departamento == "el dorado" & provincia == "misiones"
replace  departamento = "leandro n. alem" if departamento == "leandro n alem" & provincia == "misiones"

replace  departamento = "loncopue" if departamento == "loconpue" & provincia == "neuquen"


replace  departamento = "libertador general san martin" if departamento == "lib general san martin" & provincia == "san luis"


replace  departamento = "mayor luis j. fontana" if departamento == "mayor luis jorge fontana" & provincia == "chaco"

replace departamento = "leandro n. alem" if departamento == "alem" & provincia == "buenos aires"

replace departamento = "juan felipe ibarra" if departamento == "juan f ibarra" & provincia == "santiago del estereo"

replace departamento = "juan martin de pueyrredon" if departamento == "juan m de pueyrredon" & provincia == "san luis"


save "base_final_fopea_cleaned_cross_section.dta", replace
