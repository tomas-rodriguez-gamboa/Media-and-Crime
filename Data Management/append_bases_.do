
/* DO FILES PARA BASES DE DATOS DE PROVINCIAS.
PRIMERO SOLO PARA LA HOJA DE CATEGORIZACION Y LUEGO PARA LA HOJA DE FORMULARIO 1
*/


***UNIR BASE DE CATEGORIZACION****************

cd  "C:\Users\Tomas\Desktop\Universidad\Investigación profe barbara\base de datos fopea\formato stata"

dir

use "caba"
append using "catamarca"
save "base_combinada_1", replace

use "base_combinada_1", clear
append using "chaco" 
save "base_combinada_2",replace

use "base_combinada_2", clear
append using "chubut"
save "base_combinada_3",replace

use "base_combinada_3", clear
append using "corrientes"
save "base_combinada_4",replace

use "base_combinada_4", clear
append using "cordoba_gc"
save "base_combinada_5",replace

use"base_combinada_5",clear
append using "entre_rios"
save "base_combinada_6",replace

use "base_combinada_6", clear
append using "formosa"
save "base_combinada_7",replace

use "base_combinada_7", clear
append using "jujuy"
save "base_combinada_8", replace

use"base_combinada_8", clear
append using "la_pampa"
save "base_combinada_9", replace

use "base_combinada_9", clear
append using "la_rioja"
save "base_combinada10", replace

use "base_combinada10", clear
append using "mendoza"
save "base_combinada11",replace

use "base_combinada11", clear
append using "misiones"
save "base_combinada12", replace

use "base_combinada12", clear
append using "neuquen"
save "base_combinada13", replace

use"base_combinada13", clear
append using "pba_Conurbano"
save "base_combinada14", replace

use "base_combinada14", clear
append using "pba_II"
save "base_combinada15", replace

use "base_combinada15", clear
append using "pba_III"
save "base_combinada16", replace

use "base_combinada16", clear
append using "resto_cordoba"
save "base_combinada17", replace

use "base_combinada17", clear
append using "resto_santa_fe"
save "base_combinada18", replace

use "base_combinada18", clear
append using "rio_negro"
save "base_combinada19", replace

use "base_combinada19", clear
append using "rosario_gran_rosario"
save "base combinada20", replace

use "base combinada20", clear
append using "salta"
save "base_combinada21", replace

use "base_combinada21", clear
append using "santa_cruz"
save "base_combinada22", replace

use "base_combinada22", clear
append using "santiago_del_estero"
save "base_combinada23", replace

use "base_combinada23", clear
append using "san_juan"
save "base_combinada24", replace

use "base_combinada24", clear
append using "san_luis"
save "base_combinada25", replace

use "base_combinada25", clear
append using "tierra_del_fuego"
save "base combinada26", replace

use "base combinada26", clear
append using "tucuman"
save "base_fopea_categorizacion" ,replace
*********************************************************************************
*ahora la union para las bases que tienen informacion del formulario 1

use "carac_caba"
append using "carac_catamarca"
save "base_1", replace 

use "base_1", clear
append using "carac_chaco" 
save "base_2",replace

use "base_2", clear
append using "carac_chubut"
save "base_3",replace

use "base_3", clear
append using "carac_corrientes"
save "base_4",replace

use "base_4", clear
append using "carac_cordoba_gc"
save "base_5",replace

use"base_5",clear
append using "carac_entre_rios"
save "base_6",replace

use "base_6", clear
append using "carac_formosa"
save "base_7",replace

use "base_7", clear
append using "carac_jujuy"
save "base_8", replace

use"base_8", clear
append using "carac_la_pampa"
save "base_9", replace

use "base_9", clear
append using "carac_la_rioja"
save "base_10", replace

use "base_10", clear
append using "carac_mendoza"
save "base_11",replace

use "base_11", clear
append using "carac_misiones_"
save "base_12", replace

use "base_12", clear
append using "carac_neuquen"
save "base_13", replace

use"base_13", clear
append using "carac_pba_Conurbano"
save "base_14", replace

use "base_14", clear
append using "carac_pba_II"
save "base_15", replace

use "base_15", clear
append using "carac_pba_III"
save "base_16", replace

use "base_16", clear
append using "carac_resto_cordoba"
save "base_17", replace

use "base_17", clear
append using "carac_resto_santa_fe"
save "base_18", replace

use "base_18", clear
append using "carac_rio_negro"
save "base_19", replace

use "base_19", clear
append using "carac_rosario_gran_rosario"
save "base_20", replace

use "base_20", clear
append using "carac_salta"
save "base_21", replace

use "base_21", clear
append using "carac_santa_cruz"
save "base_22", replace

use "base_22", clear
append using "carac_santiago_del_estero"
save "base_23", replace

use "base_23", clear
append using "carac_san_juan"
save "base_24", replace

use "base_24", clear
append using "carac_san_luis"
save "base_25", replace

use "base_25", clear
append using "carac_tierra_del_fuego"
save "base_formulario_1", replace

