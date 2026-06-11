**do files de limpieza df fopea categorizacion**
**UNIFORMAR  NOMBRE DE VARIABLES PARA LA UNIÓN****

use "caba",clear
rename BARRIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/48
gen provincia="Ciudad Autonoma Buenos Aires"
save "caba", replace

use"catamarca",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/16
gen provincia= "Catamarca"
save "catamarca", replace


use"chaco",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/29
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/25
gen provincia= "Chaco"
save "chaco", replace


use"chubut",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/15
gen provincia= "Chubut"
save "chubut", replace


use "corrientes",clear 
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/25
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia= "Corrientes"
save "corrientes", replace


use "cordoba_gc",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/10
gen provincia= "Cordoba GC"
save "cordoba_gc", replace

use "entre_rios",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/17
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia= "Entre Rios"
save "entre_rios", replace


use "formosa",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/9
gen provincia= "Formosa"
save "formosa", replace


use "jujuy",clear
rename DEPARTAMENTO departamento
rename CATEGORIA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIONPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIONPOBLACIONRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/16
gen provincia= "Jujuy"
save "jujuy", replace


use "la_pampa", clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/22
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia= "La Pampa"
save "la_pampa", replace


use "la_rioja",clear
rename MUNICIPIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/18
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia= "La Rioja"
save "la_rioja", replace


use "mendoza",clear
rename MUNICIPIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/18
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Mendoza"
save "mendoza", replace

use "misiones",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/17
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Misiones"
save "misiones", replace

use "neuquen",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/16
gen provincia="Neuquen"
save "neuquen", replace

use "pba_conurbano",clear
rename MUNICIPIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/32
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="BA Conurbano"
save "pba_conurbano", replace


use "pba_II",clear
rename MUNICIPIO departamento
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename CATEGORÍA categoria
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/47
gen provincia="PBA_II"
save "pba_II",replace

use "pba_III",clear
rename MUNICIPIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/56
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="PBA_III"
save "pba_III", replace

use "resto_cordoba",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/16
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Resto Cordoba"
save "resto_cordoba", replace

use "resto_santa_fe",clear
rename DEPARTAMENTO departamento
rename CATEGORIZACIÓN categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIONPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIONPOBLACIONRESIDENTEPER relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/10
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Resto Santa Fe"
save "resto_santa_fe", replace


use "rio_negro",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
keep in 1/13
gen provincia="Rio Negro"
save "rio_negro", replace


use "rosario_gran_rosario",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/9
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Rosario Gran Rosario"
save "rosario_gran_rosario", replace

use "salta",clear
rename DEPARTAMENTOS departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/23
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Salta"
save "salta", replace

use "santa_cruz",clear
rename DEPARTAMENTO departamento
rename CATEGORIA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIONPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIONPOBLACIONRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/7
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Santa Cruz"
save "santa_cruz", replace


use "santiago_del_estero",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/27
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Santiago del Estereo"
save "santiago_del_estero", replace


use "san_juan",clear
rename DEPARTAMENTO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPE relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/19
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="San Juan"
save "san_juan", replace


use "san_luis",clear
rename DEPARTAMENTO departamento
rename CATEGORIA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIONPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIONPOBLACIONRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/9
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="San Luis"
save "san_luis", replace


use "tierra_del_fuego",clear
rename MUNICIPIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/3
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Tierra del Fuego"
save "tierra_del_fuego",replace


use "tucuman",clear
rename MUNICIPIO departamento
rename CATEGORÍA categoria
rename POBLACIÓNRESIDENTE poblacion_residente
rename CANTIDADDEMEDIOS cantidad_medios
rename CANTIDADDEPERIODISTAS cantidad_periodistas
rename RELACIÓNPOBLACIÓNRESIDENTEMED relacion_residente_medios
rename RELACIÓNPOBLACIÓNRESIDENTEPER  relacion_residente_periodista
rename CONCLUSIONES conclusiones
rename PORCENTAJES porcentajes
keep in 1/17
keep departamento poblacion_residente cantidad_medios cantidad_periodistas relacion_residente_periodista relacion_residente_medios categoria
gen provincia="Tucuman"
save "tucuman",replace

/*
SE TRABAJA AHORA CON LA BASE DE DATOS UNIDA 
*/

use "base_fopea_categorizacion.dta"


rename provincia provincia_orig

gen provincia="."

replace	provincia="Buenos Aires" if provincia_orig=="BA Conurbano"
replace	provincia="Catamarca" if provincia_orig=="Catamarca"
replace	provincia="Chaco" if provincia_orig=="Chaco"
replace	provincia="Chubut" if provincia_orig=="Chubut"
replace	provincia="Ciudad Autonoma Buenos Aires" if provincia_orig=="Ciudad Autonoma Buenos Aires"
replace	provincia="Cordoba" if provincia_orig=="Cordoba GC"
replace	provincia="Corrientes" if provincia_orig=="Corrientes"
replace	provincia="Entre Rios" if provincia_orig=="Entre Rios"
replace	provincia="Formosa" if provincia_orig=="Formosa"
replace provincia="Jujuy" if provincia_orig=="Jujuy"
replace	provincia="La Pampa" if provincia_orig=="La Pampa"
replace	provincia="La Rioja" if provincia_orig=="La Rioja"
replace	provincia="Mendoza" if provincia_orig=="Mendoza"
replace	provincia="Misiones" if provincia_orig=="Misiones"
replace	provincia="Neuquen" if provincia_orig=="Neuquen"
replace	provincia="Buenos Aires" if provincia_orig=="PBA_II"
replace	provincia="Buenos Aires" if provincia_orig=="PBA_III"
replace	provincia="Cordoba" if provincia_orig=="Resto Cordoba"
replace	provincia="Santa Fe" if provincia_orig=="Resto Santa Fe"
replace	provincia="Rio Negro" if provincia_orig=="Rio Negro"
replace	provincia="Santa Fe" if provincia_orig=="Rosario Gran Rosario"
replace	provincia="Salta" if provincia_orig=="Salta"
replace	provincia="San Juan" if provincia_orig=="San Juan"
replace	provincia="San Luis" if provincia_orig=="San Luis"
replace	provincia="Santa Cruz" if provincia_orig=="Santa Cruz"
replace	provincia="Santiago del Estero" if provincia_orig=="Santiago del Estereo"
replace	provincia="Tierra del Fuego" if provincia_orig=="Tierra del Fuego"
replace	provincia="Tucuman" if provincia_orig=="Tucuman"

rename departamento departamento_orig

gen departamento="."

**** CABA ****

replace	departamento="Comuna 15" if departamento_orig=="Agronomía" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 5" if departamento_orig=="Almagro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 3" if departamento_orig=="Balvanera" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if departamento_orig=="Barracas" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if departamento_orig=="Belgrano" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if departamento_orig=="Boca" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 5" if departamento_orig=="Boedo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 6" if departamento_orig=="Caballito" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if departamento_orig=="Chacarita" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if departamento_orig=="Coghlan" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if departamento_orig=="Colegiales" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if departamento_orig=="Constitución" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 7" if departamento_orig=="Flores" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if departamento_orig=="Floresta" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if departamento_orig=="Liniers" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if departamento_orig=="Mataderos" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if departamento_orig=="Monserrat" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if departamento_orig=="Monte Castro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if departamento_orig=="Nueva Pompeya" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if departamento_orig=="Nuñez" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 14" if departamento_orig=="Palermo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if departamento_orig=="Parque Avellaneda" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 7" if departamento_orig=="Parque Chacabuco" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if departamento_orig=="Parque Chas" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if departamento_orig=="Parque Patricios" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if departamento_orig=="Paternal" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if departamento_orig=="Puerto Madero" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 2" if departamento_orig=="Recoleta" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if departamento_orig=="Retiro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if departamento_orig=="Saavedra" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 3" if departamento_orig=="San Cristobal" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if departamento_orig=="San Nicolás" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if departamento_orig=="San Telmo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if departamento_orig=="Velez Sarsfield" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if departamento_orig=="Versalles" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if departamento_orig=="Villa Crespo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if departamento_orig=="Villa del Parque " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if departamento_orig=="Villa Devoto" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if departamento_orig=="Villa General Mitre" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 8" if departamento_orig=="Villa Lugano" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if departamento_orig=="Villa Luro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if departamento_orig=="Villa Ortuzar" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if departamento_orig=="Villa Pueyrredón" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if departamento_orig=="Villa Real" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 8" if departamento_orig=="Villa Riachuelo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if departamento_orig=="Villa Santa Rita" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 8" if departamento_orig=="Villa Soldati" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if departamento_orig=="Villa Urquiza" & provincia=="Ciudad Autonoma Buenos Aires"


**** PBA ****
** Almost all are correct. Only a couple need more information to be able to be matched.

replace departamento=departamento_orig if provincia=="Buenos Aires"

replace	departamento="veinticinco de mayo" if departamento_orig=="25 de mayo" & provincia=="Buenos Aires"
replace	departamento="nueve de julio" if departamento_orig=="9 de julio" & provincia=="Buenos Aires"
replace	departamento="leandro n. alem" if departamento_orig=="alem" & provincia=="Buenos Aires"
replace	departamento="general arenales" if departamento_orig=="arenales" & provincia=="Buenos Aires"
replace	departamento="general belgrano" if departamento_orig=="belgrano" & provincia=="Buenos Aires"
replace	departamento="general las heras" if departamento_orig=="las heras" & provincia=="Buenos Aires"
replace	departamento="san miguel del monte" if departamento_orig=="monte" & provincia=="Buenos Aires"
replace	departamento="carmen de patagones" if departamento_orig=="patagones" & provincia=="Buenos Aires"
replace	departamento="san nicolas" if departamento_orig=="san nicolás de los arroyos" & provincia=="Buenos Aires"
replace	departamento="capitan sarmiento" if departamento_orig=="sarmiento" & provincia=="Buenos Aires"
replace	departamento="general viamonte" if departamento_orig=="viamonte" & provincia=="Buenos Aires"

*** Catamarca ***

replace departamento=departamento_orig if provincia=="Catamarca"

*** Cordoba ***

replace departamento=departamento_orig if provincia=="Cordoba"

*** Corrientes ***

replace departamento=departamento_orig if provincia=="Corrientes"

replace	departamento="capital" if departamento_orig=="corrientes" & provincia=="Corrientes"

*** Chaco ***

replace departamento=departamento_orig if provincia=="Chaco"

replace	departamento="mayor luis j. fontana" if departamento_orig=="mayor luis jorge fontana" & provincia=="Chaco"



*** Chubut ***

replace departamento=departamento_orig if provincia=="Chubut"


*** Entre Rios ***

replace departamento=departamento_orig if provincia=="Entre Rios"

replace	departamento="islas del ibicuy" if departamento_orig=="islas" & provincia=="Entre Rios"


*** Formosa ***

replace departamento=departamento_orig if provincia=="Formosa"

*** Jujuy ***
replace departamento=departamento_orig if provincia=="Jujuy"


*** La Pampa ***

replace departamento=departamento_orig if provincia=="La Pampa"


*** La Rioja ***

replace departamento=departamento_orig if provincia=="La Rioja"

replace	departamento="ángel vicente peñaloza" if departamento_orig=="general Ángel vicente peñaloza" & provincia=="La Rioja"

replace	departamento="capital" if departamento_orig=="la rioja (capital)" & provincia=="La Rioja"


*** Mendoza ***

replace departamento=departamento_orig if provincia=="Mendoza"

replace	departamento="capital" if departamento_orig=="ciudad de mendoza" & provincia=="Mendoza"


*** Misiones ***

replace departamento=departamento_orig if provincia=="Misiones"

replace	departamento="capital" if departamento_orig=="capital (posadas)" & provincia=="Misiones"


*** Neuquen ***

replace departamento=departamento_orig if provincia=="Neuquen"


*** Rio Negro ***

replace departamento=departamento_orig if provincia=="Rio Negro"


*** Salta ***

replace departamento=departamento_orig if provincia=="Salta"


*** San Juan ***

replace departamento=departamento_orig if provincia=="San Juan"


*** San Luis ***

replace departamento=departamento_orig if provincia=="San Luis"

replace	departamento="juan martin de pueyrredon" if departamento_orig=="juan m. de pueyrredon" & provincia=="San Luis"

replace	departamento="libertador general san martin" if departamento_orig=="lib. general san martin	" & provincia=="San Luis"


*** Santa Fe ***

replace departamento=departamento_orig if provincia=="Santa Fe"

*** Santa Cruz ***

replace departamento=departamento_orig if provincia=="Santa Cruz"

*** Santiago del Estero ***

replace departamento=departamento_orig if provincia=="Santiago del Estero"

replace	departamento="juan felipe ibarra" if departamento_orig=="juan f. ibarra" & provincia=="Santiago del Estero"


*** Tucuman ***

replace departamento=departamento_orig if provincia=="Tucuman"


*** Tierra del Fuego ***

replace departamento=departamento_orig if provincia=="Tierra del Fuego"


*** Collapse para tener una variable por Depto, el problema esta solo en tres comunas de CABA ***
destring categoria poblacion_residente cantidad_medios cantidad_periodistas, replace
collapse (min) categoria  (sum) poblacion_residente cantidad_medios cantidad_periodistas, by(provincia departamento)

*las relaciones poblacion residente y medios varian para el mismo departamento por lo cual la omito del collapse y luego cuando dejo una observacion por departamento creo esas relaciones


*recuperar datos que se pierden en la categorizacion pero si muestra que hay medios en el formulario 1 OJO CON CANTIDAD DE PERIODISTAS
replace cantidad_medios = 1 if departamento=="Cainguás " & provincia=="Misiones"
replace cantidad_periodistas= 5 if departamento=="Cainguás " & provincia=="Misiones"

replace cantidad_medios= 1 if departamento=="Rinconada" & provincia=="Jujuy"
replace cantidad_periodistas= 4 if departamento=="Rinconada" & provincia=="Jujuy" 
replace cantidad_medios= 1 if departamento=="Susques" & provincia=="Jujuy"
replace cantidad_periodistas= 2 if departamento=="Susques" & provincia=="Jujuy"
replace cantidad_medios= 3 if departamento=="Tumbaya" & provincia=="Jujuy"
replace cantidad_periodistas= 8 if departamento=="Tumbaya" & provincia=="Jujuy"

  *aqui los periodistas estaban bien
replace cantidad_medios = 5 if departamento == "Aluminé" & provincia == "Neuquen" 
replace cantidad_medios = 10 if departamento == "Cañuelas" & provincia == "Buenos Aires"
replace cantidad_medios = 5 if departamento == "Comuna 7" & provincia == "Ciudad Autonoma Buenos Aires"
replace cantidad_periodistas = 15 if departamento == "Comuna 7" & provincia == "Ciudad Autonoma Buenos Aires"
replace cantidad_medios = 9 if departamento == "Concepción " & provincia == "Corrientes"
replace cantidad_medios = 14 if departamento == "Corrientes " & provincia == "Corrientes"
replace cantidad_medios = 10 if departamento == "San Justo " & provincia == "Santa Fe"
replace cantidad_periodistas = 10 if departamento == "San Justo " & provincia == "Santa Fe"

replace cantidad_medios=3 if departamento=="Sauce" & provincia=="Corrientes"
replace cantidad_periodistas=3 if departamento=="Sauce" & provincia=="Corrientes"


*genero las relaciones
gen relacion_residente_medios = .
replace relacion_residente_medios = poblacion_residente / cantidad_medios ///
if cantidad_medios > 0

gen relacion_residente_periodista = .
replace relacion_residente_periodista = poblacion_residente / cantidad_periodistas ///
if cantidad_periodistas > 0

*DONDE NO HAY INFO LLENAMOS CON 0 
replace relacion_residente_medios = 0 if relacion_residente_medios == .
replace relacion_residente_periodista=0 if relacion_residente_periodista== .




save "base_fopea_categorizacion_cleaned.dta", replace

/* 
PASO TODO A MINUSCULA Y PREPARO LA BASE PARA EL MERGE

*/

use base_fopea_categorizacion_cleaned, clear

*en esta base tengo una observacion por departamento
*****************************************************************

*paso todo a minuscula
replace departamento = lower(departamento)
replace provincia=lower(provincia)	

*Ñorquin y Ñorquinco lo hago manual

replace departamento= "ñorquin" if  departamento=="Ñorquín" & provincia=="neuquen"
replace departamento= "ñorquinco" if  departamento=="Ñorquincó" & provincia=="rio negro"


**eliminar espacios**
replace provincia = strtrim(provincia)
replace departamento = strtrim(departamento)

*eliminar acentos
replace provincia = subinstr(provincia, "ó", "o", .)
replace provincia = subinstr(provincia, "í", "i", .)
replace provincia = subinstr(provincia, "é", "e", .)
replace provincia = subinstr(provincia, "á", "a", .)
replace provincia = subinstr(provincia, "ú", "u", .)

replace departamento = subinstr(departamento, "ó", "o", .)
replace departamento = subinstr(departamento, "í", "i", .)
replace departamento= subinstr(departamento, "é", "e", .)
replace departamento= subinstr(departamento, "á", "a", .)
replace departamento= subinstr(departamento, "ú", "u", .)

*elimino puntos intermedios 

replace departamento = "jose c paz" if departamento== "jose c. paz" & provincia == "buenos aires"
replace departamento = "dr manuel belgrano" if departamento == "dr. manuel belgrano" & provincia== "jujuy"
replace departamento = "leandro n alem" if departamento == "leandro n. alem" & provincia == "misiones"
replace departamento = "juan m de pueyrredon" if departamento == "juan m. de pueyrredon" & provincia == "san luis"
replace departamento = "lib general san martin" if departamento == "lib. general san martin" & provincia == "san luis"
replace departamento = "juan f ibarra" if departamento == "juan f. ibarra" & provincia == "santiago del estero"

*eliminamos tucuman

drop if provincia == "tucuman"

save, replace

