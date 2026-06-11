*intento de data panel*

use "base_formulario_1_cleaned", clear

*hago una id para cada medio
gen id_tmp = _n

*hago una fila de fin
gen año_fin_data=2021
*creo un tope de conteo de años vivos
gen n_años = año_fin_data - año_inicio + 1

*expando cada observacion segun sus años de vida por ejemplo si es 5 ( 2017 al 2021), aparece 5 veces ese depto
expand  n_años
* junto por grupos y le asigno los años. Cuando cambia de grupo el conteo parte denuevo
bys id_tmp: gen año = año_inicio + _n - 1

* hago el flujo en una variable nueva con una expresion logica
gen flujo = (año == año_inicio)

*con la variable flujo hago el stock
* ordeno por provincia asi se reinicia el conteo cuando cambia de depto
sort provincia departamento año
by provincia departamento: gen stock = sum(flujo)


collapse ///
    (sum) flujo ///
    (max) stock ///
    (mean) periodistas_0 periodistas_1_5 periodistas_6_9 periodistas_10_19 periodistas_20_39 periodistas_40_59 periodistas_60_79 periodistas_80_99 periodistas_mas_100 medio_pandemia medio_joven medio_consolidado medio_tradicional medio_escrito medio_audiovisual  medio_redes extension_geografica prevencion_delito total_medios total_antiguedad, by(provincia departamento año)
	
*hay observaciones unicas porque el medio se creo solo en el 2021 por lo que necesito crear los medios hacia atras o hacia adelante
	bys provincia departamento: gen n_obs = _N
list provincia departamento año if n_obs == 1

/*
los que hay solo una observacion es porque no hay medios o se crearon en el 2021
primero arreglare los territorios que no tienen medios especificamente los de salta
*/

*creo un año base 
replace año = 2017 if missing(año)
*corroboro que replace se hizo bien
list provincia departamento año if n_obs == 1

*completo para años faltantes y a cada territorio le asigno un id
sort provincia departamento año
egen id_depto = group(provincia departamento)

*declaro el panel
xtset id_depto año
*completo años faltantes para todas las observaciones (algunos solo parten del 2018 y asi)
tsfill, full 
*chequeo
bys id_depto: assert _N == 5

*copio info en los años que se crearon hacia atras y adelante pero solo nombres de provincias y deptos
by id_depto: egen provincia_fix = mode(provincia)
by id_depto: egen departamento_fix = mode(departamento)

drop provincia departamento
rename provincia_fix provincia
rename departamento_fix departamento

*elimino n_obs y la creo denuevo para contar si todos los deptos tienen 5 años
drop n_obs

bys id_depto: gen n_obs = _N
tab n_obs

*cambio los puntos por ceros excepto lezama para recordar que ese es un missing

foreach var in stock periodistas_0 periodistas_1_5 periodistas_6_9 periodistas_10_19 periodistas_20_39 periodistas_40_59 periodistas_60_79 periodistas_80_99 periodistas_mas_100 medio_pandemia medio_joven medio_consolidado medio_tradicional ///
                medio_escrito medio_audiovisual medio_redes extension_geografica ///
                prevencion_delito total_medios  total_antiguedad {

    replace `var' = 0 if missing(`var') & ///
        !(provincia=="buenos aires" & departamento=="lezama")
}
	
	
*hago el merge con categorizacion para ver si el stock calza con la cantidad de medios para 2021

/*use base_formulario_1_cleaned_panel
merge m:1 departamento provincia using "base_fopea_categorizacion_cleaned"	
	
gen check = (cantidad_medios == stock)
tab check
*nota: todos calzan porque hay info en categorizacion que no se encuentra en el formulario 1

clear*/


*preparo la base para el merge

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
	
save base_formulario_1_cleaned_panel, replace
	
	
	
	