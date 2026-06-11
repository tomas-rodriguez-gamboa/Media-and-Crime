*categorizo barrios a departamentos y limpio base

use "carac_caba"
drop Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica  Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones P 

rename Barriodondetienesedeelme barrio
replace barrio = lower(barrio)
rename AquéotrosbarriosdelaC alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Cuálessonsusfuentesdei fuentes_ingreso

gen  provincia="."
replace	provincia="Ciudad Autonoma Buenos Aires" 
gen departamento="."
replace	departamento="Comuna 15" if barrio=="agronomía" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 5" if barrio=="almagro " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 5" if barrio=="almagro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 3" if barrio=="balvanera " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 3" if barrio=="balvanera" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio =="barracas " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio =="barracas" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if barrio=="belgrano " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if barrio=="belgrano" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio=="boca" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 5" if barrio=="boedo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 6" if barrio=="caballito" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="chacarita" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if barrio=="coghlan" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if barrio=="colegiales " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if barrio=="colegiales" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if barrio=="constitución" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 7" if barrio=="flores" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="floresta" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if  barrio=="liniers" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if barrio=="mataderos" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if barrio=="mataderos " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if barrio=="montserrat" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="monte castro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio=="nueva pompeya" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 13" if barrio=="nuñez" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 14" if barrio=="palermo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if barrio=="parque avellaneda" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 7" if barrio=="parque chacabuco " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 7" if barrio=="parque chacabuco" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="parque chas " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio=="parque patricios" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="paternal" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if   barrio=="puerto madero" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 2" if barrio=="recoleta" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if barrio=="retiro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if barrio=="saavedra" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 3" if barrio=="san cristobal" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if  barrio=="san nicolás" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if barrio=="san telmo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="velez sarsfield" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="versalles" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="versailles" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="villa crespo " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="villa crespo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if barrio=="villa del parque " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if barrio=="villa del parque" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if barrio=="villa devoto " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if barrio=="villa devoto" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if barrio=="villa general mitre" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 8" if barrio=="villa lugano" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="villa luro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="villa ortuzar" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if barrio=="villa pueyrredón " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if barrio=="villa pueyrredón" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 10" if barrio=="villa real" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 8" if barrio=="villa riachuelo" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 11" if barrio=="villa santa rita" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 8" if barrio=="villa soldati" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if barrio=="villa urquiza " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 12" if barrio=="villa urquiza" & provincia=="Ciudad Autonoma Buenos Aires"

*casos especiales*
replace	departamento="Comuna 4" if barrio=="mataderos pero cubre comuna 4" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if barrio=="mataderos/la boca transmite para caba y conurbano" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="parque patricios pero cubre chacarita" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 5" if barrio=="boedo redacción en nueva pompeya" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio=="la boca" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio=="la boca " & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 7" if barrio=="mataderos con epicentro en comuna 7 - 8 - 9 -10 -11" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 14" if barrio=="oficinas en palermo, abarca 48 barrios" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="la paternal" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if barrio=="barrio norte pero su información se centra en retiro" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 4" if barrio=="barrio norte pero cubre la boca - barracas - nueva pompeya - parque patricios" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if   barrio=="flores pero se escribe sobre puerto madero" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if   barrio=="la paternal pero cubre comuna 1" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 15" if barrio=="la paternal y montserrat" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 9" if barrio=="mataderos pero cubre parque avellaneda y liniers" & provincia=="Ciudad Autonoma Buenos Aires"
replace	departamento="Comuna 1" if barrio=="viila general mitre pero cubre san telmo y alrededores" & provincia=="Ciudad Autonoma Buenos Aires"

keep in 1/103
drop barrio

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace	

save "carac_caba", replace
****************************************************
use "carac_catamarca", clear
drop Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones A

rename Municipiodondetienesedeel barrio
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

gen  provincia="."
replace	provincia="Catamarca" 
gen departamento="."

*tambien llamada la puerta
replace departamento = "Ambato" if barrio == "La Puerta" & provincia == "Catamarca"
replace departamento = "Ambato" if barrio == "La Puerta " & provincia == "Catamarca"
replace departamento = "Ambato" if barrio == "El Rodeo" & provincia == "Catamarca"


*tambien llamada ciudad de andalgala
replace departamento = "Andalgalá" if barrio == "Andalgalá" & provincia == "Catamarca"
replace departamento = "Andalgalá" if barrio == "Aconquija" & provincia == "Catamarca"

*tambien llamada villa de antofagasta de la sierra
replace departamento = "Antofagasta de la sierra" if barrio == "Antofagasta" & provincia == "Catamarca"

*tambien llamada ciudad de belen
replace departamento = "Belén" if barrio == "Pozo de Piedra" & provincia == "Catamarca"
replace departamento = "Belén" if barrio == "Belén - Catamarca" & provincia == "Catamarca"
replace departamento = "Belén" if barrio == "Belén" & provincia == "Catamarca"
replace departamento = "Belén" if barrio == "Londres" & provincia == "Catamarca"
replace departamento = "Belén" if barrio == "Hualfin" & provincia == "Catamarca"
replace departamento = "Belén" if barrio == "Belén Catamarca " & provincia == "Catamarca"


*tambien llamada chumbicha
replace departamento = "Capayán" if barrio == "Huillapima" & provincia == "Catamarca"

*tambien llamada san fernando del valle de catamarca
replace departamento = "Capital" if barrio == "San Fernando del Valle de Catamarca" & provincia == "Catamarca"
replace departamento = "Capital" if barrio == "SAN FERNANDO DEL VALLE DE CATAMARCA" & provincia == "Catamarca"
replace departamento = "Capital" if barrio == "San Fernando del valle de Catamarca" & provincia == "Catamarca"
replace departamento = "Capital" if barrio == "San Fernando del Valle De Catamarca" & provincia == "Catamarca"


*tambien llamado san jose
replace departamento = "Fray Mamerto Esquiú" if barrio == "Fray Mamerto Esquiu" & provincia == "Catamarca"

*tambien llaada ciudad de recreo
replace departamento = "La Paz" if barrio == "Icaño" & provincia == "Catamarca"
replace departamento = "La Paz" if barrio == "Recreo Catamarca " & provincia == "Catamarca"

*tambien llamado saujil
replace departamento = "Pomán" if barrio == "Poman" & provincia == "Catamarca"
replace departamento = "Pomán" if barrio == "Saujil" & provincia == "Catamarca"
replace departamento = "Pomán" if barrio == "Saujil " & provincia == "Catamarca"

replace departamento = "Santa María" if barrio == "San José" & provincia == "Catamarca"
replace departamento = "Santa María" if barrio == "Santa María" & provincia == "Catamarca"

*tambien llamado bañado de ovanta

replace departamento = "Tinogasta" if barrio == "Tinogasta" & provincia == "Catamarca"
replace departamento = "Tinogasta" if barrio == "Fiambalá" & provincia == "Catamarca"

*tambien llamado san isidro
replace departamento = "Valle viejo" if barrio == "Valle Viejo" & provincia == "Catamarca" 


keep in 1/46
drop barrio


replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta (missing)" 
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta" 

destring ingresos_sector_publico, replace

save "carac_catamarca", replace
*************************************************
use "carac_chaco", clear

drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica  Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones Marcatemporal

rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso


gen  provincia="."
replace	provincia="Chaco"

rename Departamentodondetienesede departamento
keep in 1/103


replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"

replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

save"carac_chaco", replace 
*************************************************

use "carac_chubut", clear
drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica  Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones Timestamp

rename Municipiodondetienesedeel barrio 
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso



replace barrio = lower(barrio)
rename Aquéotrosmunicipiosalca alcance_otros_dpto


gen  provincia="."
replace	provincia="Chubut"
gen departamento="."

replace	departamento="Biedma" if barrio=="puerto madryn" & provincia=="Chubut"
replace	departamento="Biedma" if barrio=="puerto madryn " & provincia=="Chubut"
replace	departamento="Biedma" if barrio=="puerto piramides" & provincia=="Chubut"

replace	departamento="Cushamen" if barrio=="el maiten" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="el maitén" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="epuyen" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="lago puelo" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="el hoyo" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="cholila" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="cushamen" & provincia=="Chubut"
replace	departamento="Cushamen" if barrio=="gualjaina" & provincia=="Chubut"

replace	departamento="Escalante" if barrio=="comodoro rivadavia" & provincia=="Chubut"
replace	departamento="Escalante" if barrio=="comodoro rivadavia " & provincia=="Chubut"
replace	departamento="Escalante" if barrio=="rada tilly" & provincia=="Chubut"
replace	departamento="Escalante" if barrio=="rada tilly " & provincia=="Chubut"
replace	departamento="Escalante" if barrio=="caleta cordova" & provincia=="Chubut"
replace	departamento="Escalante" if barrio=="manantiales rosales" & provincia=="Chubut"

replace	departamento="Florentino Ameghino" if barrio=="camarones" & provincia=="Chubut"
replace	departamento="Florentino Ameghino" if barrio=="camarones " & provincia=="Chubut"
replace	departamento="Florentino Ameghino" if barrio=="garayalde" & provincia=="Chubut"
replace	departamento="Florentino Ameghino" if barrio=="cabo raso" & provincia=="Chubut"

replace	departamento="Futaleufu" if barrio=="esquel" & provincia=="Chubut"
replace	departamento="Futaleufu" if barrio=="esquel " & provincia=="Chubut"
replace	departamento="Futaleufu" if barrio=="trevelin" & provincia=="Chubut"
replace	departamento="Futaleufu" if barrio=="lago rosario" & provincia=="Chubut"
replace	departamento="Futaleufu" if barrio=="aldea escolar" & provincia=="Chubut"
replace	departamento="Futaleufu" if barrio=="los cripreses" & provincia=="Chubut"
replace	departamento="Futaleufu" if barrio=="nahuel pan" & provincia=="Chubut"

replace	departamento="Gaiman" if barrio=="gaiman" & provincia=="Chubut"
replace	departamento="Gaiman" if barrio=="gaiman " & provincia=="Chubut"
replace	departamento="Gaiman" if barrio=="dolavon" & provincia=="Chubut"
replace	departamento="Gaiman" if barrio=="28 de julio" & provincia=="Chubut"

replace	departamento="Gastre" if barrio=="gastre" & provincia=="Chubut"
replace	departamento="Gastre" if barrio=="blancutre" & provincia=="Chubut"
replace	departamento="Gastre" if barrio=="yala laubat" & provincia=="Chubut"
replace	departamento="Gastre" if barrio=="lagunita salada" & provincia=="Chubut"

replace	departamento="Languiñeo" if barrio=="tecka" & provincia=="Chubut"
replace	departamento="Languiñeo" if barrio=="colan conhue" & provincia=="Chubut"
replace	departamento="Languiñeo" if barrio=="paso del sapo" & provincia=="Chubut"
replace	departamento="Languiñeo" if barrio=="carrenleufu" & provincia=="Chubut"

replace	departamento="Mártires" if barrio=="las plumas" & provincia=="Chubut"
replace	departamento="Mártires" if barrio=="el mirasol" & provincia=="Chubut"

replace	departamento="Paso de Indios" if barrio=="paso de indios" & provincia=="Chubut"
replace	departamento="Paso de Indios" if barrio=="los altares" & provincia=="Chubut"

replace	departamento="Rawson" if barrio=="rawson" & provincia=="Chubut"
replace	departamento="Rawson" if barrio=="rawson " & provincia=="Chubut"
replace	departamento="Rawson" if barrio=="playa union" & provincia=="Chubut"
replace	departamento="Rawson" if barrio=="magagna" & provincia=="Chubut"
replace	departamento="Rawson" if barrio=="trelew" & provincia=="Chubut"

replace	departamento="Río Senguer" if barrio=="alto rio senguer" & provincia=="Chubut"
replace	departamento="Río Senguer" if barrio=="río senguer" & provincia=="Chubut"
replace	departamento="Río Senguer" if barrio=="río mayo" & provincia=="Chubut"
replace	departamento="Río Senguer" if barrio=="río mayo " & provincia=="Chubut"
replace	departamento="Río Senguer" if barrio=="aldea beleiro" & provincia=="Chubut"
replace	departamento="Río Senguer" if barrio=="lago blanco" & provincia=="Chubut"
replace	departamento="Río Senguer" if barrio=="aldea apeleg" & provincia=="Chubut"

replace	departamento="Sarmiento" if barrio=="sarmiento" & provincia=="Chubut"
replace	departamento="Sarmiento" if barrio=="sarmiento  " & provincia=="Chubut"
replace	departamento="Sarmiento" if barrio=="buen pasto" & provincia=="Chubut"
replace	departamento="Sarmiento" if barrio=="matasiete" & provincia=="Chubut"

replace	departamento="Telsen" if barrio=="telsen" & provincia=="Chubut"
replace	departamento="Telsen" if barrio=="gan gan" & provincia=="Chubut"
replace	departamento="Telsen" if barrio=="chacay oeste" & provincia=="Chubut"

replace	departamento="Tehuelches" if barrio=="josé de san martín" & provincia=="Chubut"
replace	departamento="Tehuelches" if barrio=="río pico" & provincia=="Chubut"
replace	departamento="Tehuelches" if barrio=="atilio viglione" & provincia=="Chubut"
replace	departamento="Tehuelches" if barrio=="gobernador costa" & provincia=="Chubut"
keep in 1/63
drop barrio

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"

	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

save"carac_chubut", replace

******************************************
use "carac_cordoba_gc", clear
gen provincia = "."
replace provincia= "Cordoba GC"
rename Departamento departamento
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso


drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica  Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones Ciudad Marcatemporal 

keep in 1/94

tostring cantidad_periodistas, replace force

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

save"carac_cordoba_gc", replace
********************************************
use "carac_corrientes", clear
rename Departamentodondetienesede barrio
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica  Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones   Timestamp

replace barrio = lower(barrio)
gen  provincia="."
replace	provincia="Corrientes"
gen departamento="."

replace departamento="Bella Vista" if barrio=="bella vista" & provincia=="Corrientes"
replace departamento="Bella Vista" if barrio=="bella vista " & provincia=="Corrientes"

replace departamento="Berón de Astrada" if barrio=="berón de astrada" & provincia=="Corrientes"
replace departamento="Berón de Astrada" if barrio=="berón de astrada " & provincia=="Corrientes"

replace departamento="Concepción" if barrio=="concepción" & provincia=="Corrientes"
replace departamento="Concepción" if barrio=="santa rosa " & provincia=="Corrientes"
replace departamento="Concepción" if barrio=="tabay " & provincia=="Corrientes"
replace departamento="Concepción" if barrio=="colonia tatacuá" & provincia=="Corrientes"
replace departamento="Concepción" if barrio=="tatacuá " & provincia=="Corrientes"
replace departamento="Concepción" if barrio=="tatacúa " & provincia=="Corrientes"


replace departamento="Corrientes" if barrio=="corrientes" & provincia=="Corrientes"
replace departamento="Corrientes" if barrio=="corrientes " & provincia=="Corrientes"
replace departamento="Corrientes" if barrio=="barrio centro" & provincia=="Corrientes"
replace departamento="Corrientes" if barrio=="barrio ponce" & provincia=="Corrientes"
replace departamento="Corrientes" if barrio=="barrio sur" & provincia=="Corrientes"
replace departamento="Corrientes" if barrio=="laguna brava" & provincia=="Corrientes"
replace departamento="Corrientes" if barrio=="riachuelo " & provincia=="Corrientes"

replace departamento="Curuzú Cuatiá" if barrio=="curuzú cuatiá" & provincia=="Corrientes"
replace departamento="Curuzú Cuatiá" if barrio=="perugorría" & provincia=="Corrientes"
replace departamento="Curuzú Cuatiá" if barrio=="perugorria " & provincia=="Corrientes"
replace departamento="Curuzú Cuatiá" if barrio=="cazadores correntinos" & provincia=="Corrientes"

replace departamento="Empedrado" if barrio=="empedrado" & provincia=="Corrientes"
replace departamento="Empedrado" if barrio=="empedrado " & provincia=="Corrientes"
replace departamento="Empedrado" if barrio=="el sombrero " & provincia=="Corrientes"


replace departamento="Esquina" if barrio=="esquina" & provincia=="Corrientes"
replace departamento="Esquina" if barrio=="esquina " & provincia=="Corrientes"
replace departamento="Esquina" if barrio=="pueblo libertador " & provincia=="Corrientes"


replace departamento="General Alvear" if barrio=="alvear" & provincia=="Corrientes"
replace departamento="General Alvear" if barrio=="estación torrent" & provincia=="Corrientes"
replace departamento="General Alvear" if barrio=="general alvear " & provincia=="Corrientes"


replace departamento="General Paz" if barrio=="itá ibaté" & provincia=="Corrientes"
replace departamento="General Paz" if barrio=="itá ibaté " & provincia=="Corrientes"
replace departamento="General Paz" if barrio=="palmar grande" & provincia=="Corrientes"
replace departamento="General Paz" if barrio=="lomas de vallejos " & provincia=="Corrientes"
replace departamento="General Paz" if barrio=="caá catí" & provincia=="Corrientes"
replace departamento="General Paz" if barrio=="caá catí " & provincia=="Corrientes"
replace departamento="General Paz" if barrio=="caa catí " & provincia=="Corrientes"

replace departamento="Goya" if barrio=="goya" & provincia=="Corrientes"
replace departamento="Goya" if barrio=="goya " & provincia=="Corrientes"
replace departamento="Goya" if barrio=="colonia carolina " & provincia=="Corrientes"
replace departamento="Goya" if barrio=="san isidro" & provincia=="Corrientes"


replace departamento="Itatí" if barrio=="itatí" & provincia=="Corrientes"
replace departamento="Itatí" if barrio=="ramada paso " & provincia=="Corrientes"
replace departamento="Itatí" if barrio=="itatí" & provincia=="Corrientes"
replace departamento="Itatí" if barrio=="itatí " & provincia=="Corrientes"


replace departamento="Ituzaingó" if barrio=="colonia liebig " & provincia=="Corrientes"
replace departamento="Ituzaingó" if barrio=="ituzaingó" & provincia=="Corrientes"
replace departamento="Ituzaingó" if barrio=="ituzaingó " & provincia=="Corrientes"
replace departamento="Ituzaingó" if barrio=="san antonio" & provincia=="Corrientes"
replace departamento="Ituzaingó" if barrio=="san carlos" & provincia=="Corrientes"
replace departamento="Ituzaingó" if barrio=="san carlos " & provincia=="Corrientes"
replace departamento="Ituzaingó" if barrio=="san antonio de apipé " & provincia=="Corrientes"


replace departamento="Lavalle" if barrio=="lavalle " & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="santa lucía" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="santa lucía " & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="cruz de los milagros" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="gobernador martínez" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="villa córdoba" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="yataytí calle" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="yatay tí calle" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="gobernador martínez " & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="cruz de los milagros" & provincia=="Corrientes"
replace departamento="Lavalle" if barrio=="yatay" & provincia=="Corrientes"


replace departamento="Mburucuyá" if barrio=="mburucuyá " & provincia=="Corrientes"
replace departamento="Mburucuyá" if barrio=="mburucuyá" & provincia=="Corrientes"

replace departamento="Mercedes" if barrio=="mercedes" & provincia=="Corrientes"
replace departamento="Mercedes" if barrio=="mercedes " & provincia=="Corrientes"

replace departamento="Monte Caseros" if barrio=="monte caseros" & provincia=="Corrientes"
replace departamento="Monte Caseros" if barrio=="colonia libertad " & provincia=="Corrientes"
replace departamento="Monte Caseros" if barrio=="mocoretá" & provincia=="Corrientes"
replace departamento="Monte Caseros" if barrio=="mocoretá " & provincia=="Corrientes"

replace departamento="Paso de los Libres" if barrio=="paso de los libres" & provincia=="Corrientes"
replace departamento="Paso de los Libres" if barrio=="paso de los libres " & provincia=="Corrientes"
replace departamento="Paso de los Libres" if barrio=="bonpland" & provincia=="Corrientes"
replace departamento="Paso de los Libres" if barrio=="tapebicuá " & provincia=="Corrientes"

replace departamento="Saladas" if barrio=="saladas" & provincia=="Corrientes"
replace departamento="Saladas" if barrio=="saladas " & provincia=="Corrientes"
replace departamento="Saladas" if barrio=="san lorenzo" & provincia=="Corrientes"
replace departamento="Saladas" if barrio=="san lorenzo " & provincia=="Corrientes"
replace departamento="Saladas" if barrio=="pago de los deseos" & provincia=="Corrientes"

replace departamento="San Cosme" if barrio=="san cosme" & provincia=="Corrientes"
replace departamento="San Cosme" if barrio=="paso de la patria" & provincia=="Corrientes"
replace departamento="San Cosme" if barrio=="santa ana de los guácaras" & provincia=="Corrientes"
replace departamento="San Cosme" if barrio=="santa ana de las guácaras " & provincia=="Corrientes"
replace departamento="San Cosme" if barrio=="paso de la patria" & provincia=="Corrientes"
replace departamento="San Cosme" if barrio=="paso de la patria" & provincia=="Corrientes"

replace departamento="San Luis del Palmar" if barrio=="san luis del palmar" & provincia=="Corrientes"
replace departamento="San Luis del Palmar" if barrio=="san luis del palmar " & provincia=="Corrientes"
replace departamento="San Luis del Palmar" if barrio=="san luis del palmar" & provincia=="Corrientes"

replace departamento="San Martín" if barrio=="san martín" & provincia=="Corrientes"
replace departamento="San Martín" if barrio=="colonia carlos pellegrini " & provincia=="Corrientes"
replace departamento="San Martín" if barrio=="la cruz " & provincia=="Corrientes"
replace departamento="San Martín" if barrio=="pellegrini" & provincia=="Corrientes"
replace departamento="San Martín" if barrio=="yapeyú" & provincia=="Corrientes"
replace departamento="San Martín" if barrio=="yapeyú " & provincia=="Corrientes"


replace departamento="San Miguel" if barrio=="san miguel" & provincia=="Corrientes"
replace departamento="San Miguel" if barrio=="barrio san miguel" & provincia=="Corrientes"
replace departamento="San Miguel" if barrio=="san miguel " & provincia=="Corrientes"
replace departamento="San Miguel" if barrio=="loreto" & provincia=="Corrientes"



replace departamento="San Roque" if barrio=="san roque" & provincia=="Corrientes"
replace departamento="San Roque" if barrio=="pedro r. fernández" & provincia=="Corrientes"
replace departamento="San Roque" if barrio=="9 de julio " & provincia=="Corrientes"
replace departamento="San Roque" if barrio=="estación 9 de julio" & provincia=="Corrientes"
replace departamento="San Roque" if barrio=="pedro r. fernández (mantilla)" & provincia=="Corrientes"
replace departamento="San Roque" if barrio=="mantilla" & provincia=="Corrientes"
replace departamento="San Roque" if barrio=="chavarría" & provincia=="Corrientes"



replace departamento="Santo Tomé" if barrio=="santo tomé" & provincia=="Corrientes"
replace departamento="Santo Tomé" if barrio=="santo tomé " & provincia=="Corrientes"
replace departamento="Santo Tomé" if barrio=="gobernador virasoro" & provincia=="Corrientes"
replace departamento="Santo Tomé" if barrio=="garaví" & provincia=="Corrientes"
replace departamento="Santo Tomé" if barrio=="garaví " & provincia=="Corrientes"
replace departamento="Santo Tomé" if barrio=="garruchos" & provincia=="Corrientes"


replace departamento="Sauce" if barrio=="sauce" & provincia=="Corrientes"

keep in 1/121
drop barrio

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace
	
save"carac_corrientes", replace
******************************
use "carac_entre_rios", clear
gen provincia="."
replace provincia= "Entre Rios"
rename Departamentodonderesideel departamento 
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica  Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  Marcatemporal

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace
keep in 1/78
save "carac_entre_rios", replace
********************************************
use "carac_formosa", clear

drop Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  Timestamp

rename Municipiodondetienesedeel barrio
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene  cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace barrio = lower(barrio)

gen  provincia="."
replace	provincia="Formosa"
gen departamento="."

replace	departamento="Bermejo" if barrio=="laguna yema" & provincia=="Formosa"
replace	departamento="Bermejo" if barrio=="fortín soledad" & provincia=="Formosa"
replace	departamento="Bermejo" if barrio=="chiriguanos" & provincia=="Formosa"
replace	departamento="Bermejo" if barrio=="pozo del mortero" & provincia=="Formosa"

replace	departamento="Formosa" if barrio=="formosa" & provincia=="Formosa"
replace	departamento="Formosa" if barrio=="formosa " & provincia=="Formosa"
replace	departamento="Formosa" if barrio=="gran guardia" & provincia=="Formosa"
replace	departamento="Formosa" if barrio=="colonia pastoril" & provincia=="Formosa"
replace	departamento="Formosa" if barrio=="san hilario" & provincia=="Formosa"

replace	departamento="Laishí" if barrio=="san francisco de laishí" & provincia=="Formosa"
replace	departamento="Laishí" if barrio=="misión san francisco de laishí" & provincia=="Formosa"
replace	departamento="Laishí" if barrio=="herradura " & provincia=="Formosa"
replace	departamento="Laishí" if barrio=="lucio v. mansilla" & provincia=="Formosa"
replace	departamento="Laishí" if barrio=="tatané" & provincia=="Formosa"
replace	departamento="Laishí" if barrio=="villa escolar " & provincia=="Formosa"
replace	departamento="Laishí" if barrio=="banco payaguá" & provincia=="Formosa"

replace	departamento="Matacos" if barrio=="ingeniero juárez" & provincia=="Formosa"

replace	departamento="Patiño" if barrio=="comandante fontana " & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="ibarreta" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="ibarreta " & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="las lomitas" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="las lomitas " & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="pozo del tigre " & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="san martin 2" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="villa general güemes" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="estanislao del campo" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="estanislao del campo " & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="subteniente perín" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="fortín leyes" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="colonia sarmiento" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="bartolome de las casas" & provincia=="Formosa"
replace	departamento="Patiño" if barrio=="manuel belgrano" & provincia=="Formosa"

replace	departamento="Pilcomayo" if barrio=="clorinda " & provincia=="Formosa"
replace	departamento="Pilcomayo" if barrio=="clorinda" & provincia=="Formosa"
replace	departamento="Pilcomayo" if barrio=="laguna blanca" & provincia=="Formosa"
replace	departamento="Pilcomayo" if barrio=="laguna naineck" & provincia=="Formosa"
replace	departamento="Pilcomayo" if barrio=="riacho he he" & provincia=="Formosa"

replace	departamento="Pirané" if barrio=="pirané" & provincia=="Formosa"
replace	departamento="Pirané" if barrio=="el colorado" & provincia=="Formosa"
replace	departamento="Pirané" if barrio=="mayor vicente villafañe" & provincia=="Formosa"
replace	departamento="Pirané" if barrio=="palo santo" & provincia=="Formosa"
replace	departamento="Pirané" if barrio=="villa dos trece " & provincia=="Formosa"


replace	departamento="Ramón Lista" if barrio=="el chorro" & provincia=="Formosa"
replace	departamento="Ramón Lista" if barrio=="maría cristina" & provincia=="Formosa"
replace	departamento="Ramón Lista" if barrio=="el potrillo" & provincia=="Formosa"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

drop barrio
save "carac_formosa", replace
************************************
use "carac_jujuy", clear

drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones Marcatemporal

rename Periodistasinvolucradosene cantidad_periodistas
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename  Ciudadalaquepertenece barrio
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace barrio = lower(barrio)

gen  provincia="."
replace	provincia="Jujuy"
gen departamento="."

replace	departamento="Cochinoca" if barrio=="abra pampa" & provincia=="Jujuy"
replace	departamento="Cochinoca" if barrio=="puesto del marqués" & provincia=="Jujuy"
replace	departamento="Cochinoca" if barrio=="rinconadillas" & provincia=="Jujuy"

replace	departamento="Dr manuel belgrano" if barrio=="san salvador de jujuy" & provincia=="Jujuy"
replace	departamento="Dr manuel belgrano" if barrio=="alto comedero" & provincia=="Jujuy"
replace	departamento="Dr manuel belgrano" if barrio=="villa jardin de reyes" & provincia=="Jujuy"

replace	departamento="El carmen" if barrio=="el carmen" & provincia=="Jujuy"
replace	departamento="El carmen" if barrio=="monterrico" & provincia=="Jujuy"
replace	departamento="El carmen" if barrio=="monterrico " & provincia=="Jujuy"
replace	departamento="El carmen" if barrio=="san antonio" & provincia=="Jujuy"
replace	departamento="El carmen" if barrio=="aguas calientes" & provincia=="Jujuy"
replace	departamento="El carmen" if barrio=="perico" & provincia=="Jujuy"
replace	departamento="El carmen" if barrio=="puesto viejo" & provincia=="Jujuy"

replace	departamento="Humahuaca" if barrio=="humahuaca" & provincia=="Jujuy"
replace	departamento="Humahuaca" if barrio=="uquía" & provincia=="Jujuy"
replace	departamento="Humahuaca" if barrio=="palca de aparzo" & provincia=="Jujuy"
replace	departamento="Humahuaca" if barrio=="el aguilar" & provincia=="Jujuy"


replace	departamento="Ledesma" if barrio=="libertador general san martín" & provincia=="Jujuy"
replace	departamento="Ledesma" if barrio=="fraile pintado" & provincia=="Jujuy"
replace	departamento="Ledesma" if barrio=="fraile pintado " & provincia=="Jujuy"
replace	departamento="Ledesma" if barrio=="calilegua" & provincia=="Jujuy"
replace	departamento="Ledesma" if barrio=="caimancito" & provincia=="Jujuy"
replace	departamento="Ledesma" if barrio=="yuto" & provincia=="Jujuy"


replace	departamento="Papalá" if barrio=="papalá" & provincia=="Jujuy"
replace	departamento="Papalá" if barrio=="palpalá" & provincia=="Jujuy"
replace	departamento="Papalá" if barrio=="río blanco" & provincia=="Jujuy"
replace	departamento="Papalá" if barrio=="carahunco" & provincia=="Jujuy"

replace	departamento="Rinconada" if barrio=="rinconada" & provincia=="Jujuy"
replace	departamento="Rinconada" if barrio=="mina pirquitas" & provincia=="Jujuy"
replace	departamento="Rinconada" if barrio=="cusi cusi" & provincia=="Jujuy"

replace	departamento="San antonio" if barrio=="san antonio" & provincia=="Jujuy"
replace	departamento="San antonio" if barrio=="los alisos" & provincia=="Jujuy"
replace	departamento="San antonio" if barrio=="villa jardín del rey" & provincia=="Jujuy"

replace	departamento="San pedro" if barrio=="san pedro de jujuy" & provincia=="Jujuy"
replace	departamento="San pedro" if barrio=="la esperanza" & provincia=="Jujuy"
replace	departamento="San pedro" if barrio=="arrayanal" & provincia=="Jujuy"
replace	departamento="San pedro" if barrio=="rodeíto" & provincia=="Jujuy"
replace	departamento="San pedro" if barrio=="la mendieta" & provincia=="Jujuy"

replace	departamento="Santa bárbara" if barrio=="santa clara" & provincia=="Jujuy"
replace	departamento="Santa bárbara" if barrio=="el fuerte" & provincia=="Jujuy"
replace	departamento="Santa bárbara" if barrio=="palma sola" & provincia=="Jujuy"
replace	departamento="Santa bárbara" if barrio=="el piquete" & provincia=="Jujuy"
replace	departamento="Santa bárbara" if barrio=="el talar" & provincia=="Jujuy"

replace	departamento="Santa catalina" if barrio=="santa catalina" & provincia=="Jujuy"
replace	departamento="Santa catalina" if barrio=="cieneguillas" & provincia=="Jujuy"
replace	departamento="Santa catalina" if barrio=="oratorio" & provincia=="Jujuy"
replace	departamento="Santa catalina" if barrio=="el angosto" & provincia=="Jujuy"

replace	departamento="Susque" if barrio=="susques" & provincia=="Jujuy"
replace	departamento="Susque" if barrio=="huáncar" & provincia=="Jujuy"
replace	departamento="Susque" if barrio=="coranzulí" & provincia=="Jujuy"
replace	departamento="Susque" if barrio=="olaroz chico" & provincia=="Jujuy"
replace	departamento="Susque" if barrio=="paso de jama, susques" & provincia=="Jujuy"

replace	departamento="Tilcara" if barrio=="tilcara" & provincia=="Jujuy"
replace	departamento="Tilcara" if barrio=="maimará" & provincia=="Jujuy"
replace	departamento="Tilcara" if barrio=="juella" & provincia=="Jujuy"
replace	departamento="Tilcara" if barrio=="huacalera" & provincia=="Jujuy"

replace	departamento="Tumbaya" if barrio=="tumbaya" & provincia=="Jujuy"
replace	departamento="Tumbaya" if barrio=="purmamarca" & provincia=="Jujuy"
replace	departamento="Tumbaya" if barrio=="volcán" & provincia=="Jujuy"
replace	departamento="Tumbaya" if barrio=="tumbaya grande" & provincia=="Jujuy"

replace	departamento="Valle grande" if barrio=="valle grande" & provincia=="Jujuy"
replace	departamento="Valle grande" if barrio=="san lucas" & provincia=="Jujuy"
replace	departamento="Valle grande" if barrio=="pampichuela" & provincia=="Jujuy"

replace	departamento="Yavi" if barrio=="la quiaca" & provincia=="Jujuy"
replace	departamento="Yavi" if barrio=="la quiaca " & provincia=="Jujuy"

replace	departamento="Yavi" if barrio=="yavi" & provincia=="Jujuy"
replace	departamento="Yavi" if barrio=="pumahuasi" & provincia=="Jujuy"
replace	departamento="Yavi" if barrio=="el condór" & provincia=="Jujuy"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/80
drop barrio
save "carac_jujuy", replace

********************************************************************************
use "carac_la_pampa", clear

drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones R S T U V W    Marcatemporal

rename Periodistasinvolucradosene cantidad_periodistas
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename  Localidad barrio
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace barrio = lower(barrio)

gen  provincia="."
replace	provincia="La pampa"
gen departamento="."

replace	departamento="Atreucó" if barrio=="macachín" & provincia=="La pampa"
replace	departamento="Atreucó" if barrio=="macachin " & provincia=="La pampa"


replace	departamento="Caleu caleu" if barrio=="la adela" & provincia=="La pampa"


replace	departamento="Capital" if barrio=="santa rosa" & provincia=="La pampa"
replace	departamento="Capital" if barrio=="santa rosa " & provincia=="La pampa"
replace	departamento="Capital" if barrio=="anguil" & provincia=="La pampa"
replace	departamento="Capital" if barrio=="winifreda" & provincia=="La pampa"
replace	departamento="Capital" if barrio=="mauricio mayer" & provincia=="La pampa"

replace	departamento="Catriló" if barrio=="catrilo" & provincia=="La pampa"
replace	departamento="Catriló" if barrio=="catrilÓ" & provincia=="La pampa"
replace	departamento="Catriló" if barrio=="catriló" & provincia=="La pampa"
replace	departamento="Catriló" if barrio=="catriló - la pampa" & provincia=="La pampa"

replace	departamento="Chalileo" if barrio=="santa isabel" & provincia=="La pampa"

replace	departamento="Chapaleufú" if barrio=="intendente alvear" & provincia=="La pampa"

replace	departamento="Chical co" if barrio=="algarrobo del águila" & provincia=="La pampa"
replace	departamento="Chical co" if barrio=="algarrobo del aguila" & provincia=="La pampa"
replace	departamento="Chical co" if barrio=="la humada" & provincia=="La pampa"

replace	departamento="Conhelo" if barrio=="eduardo castex" & provincia=="La pampa"
replace	departamento="Conhelo" if barrio=="eduardo castex " & provincia=="La pampa"
replace	departamento="Conhelo" if barrio=="monte nievas" & provincia=="La pampa"
replace	departamento="Conhelo" if barrio=="colonia barón" & provincia=="La pampa"
replace	departamento="Conhelo" if barrio=="villa mirasol" & provincia=="La pampa"
replace	departamento="Conhelo" if barrio=="matileo" & provincia=="La pampa"
replace	departamento="Conhelo" if barrio=="rucanelo" & provincia=="La pampa"

replace	departamento="Curacó" if barrio=="puelches" & provincia=="La pampa"

replace	departamento="Guatraché" if barrio=="guatraché" & provincia=="La pampa"
replace	departamento="Guatraché" if barrio=="guatraché la pampa2" & provincia=="La pampa"

replace	departamento="Hucal" if barrio=="bernasconi" & provincia=="La pampa"

replace	departamento="Limay mahuida" if barrio=="limay mahuida" & provincia=="La pampa"

replace	departamento="Lihuel calel" if barrio=="cuchillo-có" & provincia=="La pampa"

replace	departamento="Loventué" if barrio=="victorica" & provincia=="La pampa"

replace	departamento="Maracó" if barrio=="general pico" & provincia=="La pampa"
replace	departamento="Maracó" if barrio=="general pico la pampa " & provincia=="La pampa"

replace	departamento="Puelén" if barrio=="veinticinco de mayo" & provincia=="La pampa"
replace	departamento="Puelén" if barrio=="25 de mayo" & provincia=="La pampa"

replace	departamento="Quemú quemú" if barrio=="quemú quemú" & provincia=="La pampa"
replace	departamento="Quemú quemú" if barrio=="quemu quemu" & provincia=="La pampa"

replace	departamento="Rancul" if barrio=="parera" & provincia=="La pampa"
replace	departamento="Rancul" if barrio=="parera" & provincia=="La pampa"
replace	departamento="Rancul" if barrio=="rancul - la pampa " & provincia=="La pampa"

replace	departamento="Realicó" if barrio=="realicó" & provincia=="La pampa"
replace	departamento="Realicó" if barrio=="realicó " & provincia=="La pampa"
 replace	departamento="Realicó" if barrio=="realico" & provincia=="La pampa"
  replace	departamento="Realicó" if barrio=="realico la pampa" & provincia=="La pampa"
    replace	departamento="Realicó" if barrio=="realicó la pampa" & provincia=="La pampa"
    replace	departamento="Realicó" if barrio=="ingeniero luiggi" & provincia=="La pampa"   
	replace	departamento="Realicó" if barrio=="ingeniero luggi " & provincia=="La pampa"
 

replace	departamento="Toay" if barrio=="toay" & provincia=="La pampa"

replace	departamento="Trenel" if barrio=="trenel" & provincia=="La pampa"
replace	departamento="Trenel" if barrio=="arata" & provincia=="La pampa"
replace	departamento="Trenel" if barrio=="metileo" & provincia=="La pampa"
replace	departamento="Trenel" if barrio=="vértiz" & provincia=="La pampa"

replace	departamento="Utracán" if barrio=="general acha" & provincia=="La pampa"
replace	departamento="Utracán" if barrio=="general acha " & provincia=="La pampa"
replace	departamento="Utracán" if barrio=="colonia santa maría" & provincia=="La pampa"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/61
drop barrio
save "carac_la_pampa", replace
*****************************************
use "carac_la_rioja", clear
gen provincia= "."
replace provincia= "La Rioja"

rename Periodistasinvolucradosene cantidad_periodistas
rename Municipiodondetienesedeel departamento
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso


drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones Marcatemporal

replace departamento= "san blas" if departamento == "San Blas de Los Sauces- Los Robles"
replace departamento= "ortiz" if departamento == "Ortiz de Ocampo"
replace departamento= "ortiz" if departamento == "Ortiz de Ocampo- Milagro"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
replace departamento = "Capital" if departamento  == "Capital "
replace departamento = "Capital" if departamento  == "Capital  "

destring ingresos_sector_publico, replace
	
save "carac_la_rioja", replace
*****************************************
use "carac_mendoza", clear
gen provincia= "."
replace provincia= "Mendoza"

rename Periodistasinvolucradosene cantidad_periodistas
rename Municipiodondetienesedeel departamento
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"

replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace
	
keep in 1/144
save "carac_mendoza", replace
******************************************
use "carac_misiones_", clear

drop Marcatemporal   Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones 

rename Periodistasinvolucradosene cantidad_periodistas 
rename Departamentodondetienesede barrio
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace barrio = lower(barrio)
gen  provincia="."
replace	provincia="Misiones"
gen departamento="."

replace	departamento="Apóstoles" if barrio=="apóstoles" & provincia=="Misiones"
replace	departamento="Apóstoles" if barrio=="azara" & provincia=="Misiones"
replace	departamento="Apóstoles" if barrio=="san josé" & provincia=="Misiones"
replace	departamento="Apóstoles" if barrio=="tres capones" & provincia=="Misiones"

replace	departamento="Cainguás" if barrio=="cainguás" & provincia=="Misiones"
replace	departamento="Cainguás" if barrio=="campo grande" & provincia=="Misiones"
replace	departamento="Cainguás" if barrio=="aristóbulo del valle" & provincia=="Misiones"
replace	departamento="Cainguás" if barrio=="dos de mayo" & provincia=="Misiones"

replace	departamento="Candelaria" if barrio=="santa ana" & provincia=="Misiones"
replace	departamento="Candelaria" if barrio=="candelaria" & provincia=="Misiones"
replace	departamento="Candelaria" if barrio=="bonpland" & provincia=="Misiones"
replace	departamento="Candelaria" if barrio=="loreto" & provincia=="Misiones"
replace	departamento="Candelaria" if barrio=="cerro corá" & provincia=="Misiones"
replace	departamento="Candelaria" if barrio=="mártires" & provincia=="Misiones"
replace	departamento="Candelaria" if barrio=="profundidad" & provincia=="Misiones"

replace	departamento="Capital" if barrio=="posadas" & provincia=="Misiones"
replace	departamento="Capital" if barrio=="posadas " & provincia=="Misiones"
replace	departamento="Capital" if barrio=="garupá" & provincia=="Misiones"
replace	departamento="Capital" if barrio=="fachinal" & provincia=="Misiones"

replace	departamento="Concepción" if barrio=="concepción de la sierra" & provincia=="Misiones"
replace	departamento="Concepción" if barrio=="santa maría" & provincia=="Misiones"

replace	departamento="Eldorado" if barrio=="eldorado" & provincia=="Misiones"
replace	departamento="Eldorado" if barrio=="colonia delicia" & provincia=="Misiones"
replace	departamento="Eldorado" if barrio=="9 de julio" & provincia=="Misiones"
replace	departamento="Eldorado" if barrio=="santiago de liniers" & provincia=="Misiones"
replace	departamento="Eldorado" if barrio=="colonia victoria" & provincia=="Misiones"

replace	departamento="General manuel belgrano" if barrio=="bernardo de irigoyen" & provincia=="Misiones"
replace	departamento="General manuel belgrano" if barrio=="comandante andresito" & provincia=="Misiones"
replace	departamento="General manuel belgrano" if barrio=="san antonio" & provincia=="Misiones"

replace	departamento="Guaraní" if barrio=="el soberbio" & provincia=="Misiones"
replace	departamento="Guaraní" if barrio=="san vicente" & provincia=="Misiones"

replace	departamento="Iguazú" if barrio=="puerto esperanza" & provincia=="Misiones"
replace	departamento="Iguazú" if barrio=="puerto iguazú" & provincia=="Misiones"
replace	departamento="Iguazú" if barrio=="iguazú " & provincia=="Misiones"
replace	departamento="Iguazú" if barrio=="colonia wanda" & provincia=="Misiones"
replace	departamento="Iguazú" if barrio=="puerto libertad" & provincia=="Misiones"

replace	departamento="Leando N.Alem" if barrio=="leandro n.alem" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="leandro n. alem" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="cerro azul" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="dos arroyos" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="gobernador lopez" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="arroyo del medio" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="o.victor andrade" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="caá yarí" & provincia=="Misiones"
replace	departamento="Leando N.Alem" if barrio=="alma fuerte" & provincia=="Misiones"

replace	departamento="Libertador gral.san martin" if barrio=="puerto rico" & provincia=="Misiones"
replace	departamento="Libertador gral.san martin" if barrio=="garuhape" & provincia=="Misiones"
replace	departamento="Libertador gral.san martin" if barrio=="capioví" & provincia=="Misiones"
replace	departamento="Libertador gral.san martin" if barrio=="el alcázar" & provincia=="Misiones"
replace	departamento="Libertador gral.san martin" if barrio=="puerto leoni" & provincia=="Misiones"
replace	departamento="Libertador gral.san martin" if barrio=="ruiz de montoya" & provincia=="Misiones"


replace	departamento="Montecarlo" if barrio=="montecarlo" & provincia=="Misiones"
replace	departamento="Montecarlo" if barrio=="puerto piray" & provincia=="Misiones"
replace	departamento="Montecarlo" if barrio=="caraguatay" & provincia=="Misiones"

replace	departamento="Oberá" if barrio=="oberá" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="campo ramón" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="campo viera" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="guaraní" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="los helechos" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="colonia alberdí" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="panambí" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="san martín" & provincia=="Misiones"
replace	departamento="Oberá" if barrio=="general alvear" & provincia=="Misiones"

replace	departamento="San ignacio" if barrio=="san ignacio" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="jardín américa" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="santo pipó" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="corpus" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="hipólito yrigoyen" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="general urquiza" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="colonia polana" & provincia=="Misiones"
replace	departamento="San ignacio" if barrio=="gobernador roca" & provincia=="Misiones"

replace	departamento="San javier" if barrio=="itacaruaré" & provincia=="Misiones"
replace	departamento="San javier" if barrio=="mojón grande" & provincia=="Misiones"
replace	departamento="San javier" if barrio=="san javier" & provincia=="Misiones"
replace	departamento="San javier" if barrio=="florentino ameghino" & provincia=="Misiones"

replace	departamento="San pedro" if barrio=="san pedro" & provincia=="Misiones"
replace	departamento="San pedro" if barrio=="san pedro " & provincia=="Misiones"
replace	departamento="San pedro" if barrio=="pozo azul" & provincia=="Misiones"

replace	departamento="Veinticinco de mayo" if barrio=="alba posse" & provincia=="Misiones"
replace	departamento="Veinticinco de mayo" if barrio=="colonia aurora" & provincia=="Misiones"
replace	departamento="Veinticinco de mayo" if barrio=="25 de mayo" & provincia=="Misiones"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace
	
drop barrio
save "carac_misiones_", replace

********************************************************************************

use "carac_neuquen", clear

drop Timestamp  Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones   R S T U V W 

rename CantidaddePeriodistasinvol cantidad_periodistas
rename DepartamentodelaProvincia barrio
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace barrio = lower(barrio)
gen  provincia="."
replace	provincia="Neuquén"
gen departamento="."

replace departamento = "Aluminé" if barrio == "aluminé" & provincia == "Neuquén"
replace departamento = "Aluminé" if barrio == "aluminé " & provincia == "Neuquén"
replace departamento = "Aluminé" if barrio == "villa pehuenia" & provincia == "Neuquén"
replace departamento = "Aluminé" if barrio == "villa pehuenia moquehue" & provincia == "Neuquén"
replace departamento = "Aluminé" if barrio == "villa pehuenia. neuquén" & provincia == "Neuquén"


replace departamento = "Añelo" if barrio == "añelo" & provincia == "Neuquén"
replace departamento = "Añelo" if barrio == "añelo." & provincia == "Neuquén"
replace departamento = "Añelo" if barrio == "san patricio del chañar" & provincia == "Neuquén"
replace departamento = "Añelo" if barrio == "aguada San Roque" & provincia == "Neuquén"


replace departamento = "Catán lil" if barrio == "las coloradas" & provincia == "Neuquén"


replace departamento = "Chos malal" if barrio == "chos malal" & provincia == "Neuquén"
replace departamento = "Chos malal" if barrio == "tricao malal" & provincia == "Neuquén"


replace departamento = "Collón curá" if barrio == "piedra del águila" & provincia == "Neuquén"
replace departamento = "Collón curá" if barrio == "piedra del aguila" & provincia == "Neuquén"
replace departamento = "Collón curá" if barrio == "piedra del Águila" & provincia == "Neuquén"

replace departamento = "Confluencia" if barrio == "neuquen" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "neuquén" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "neuquén " & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "centenario" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "centenario " & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "plottier" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "neuquén capital" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "vista Alegre" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "vista alegre " & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "senillosa" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "cutral co, plaza huincul " & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "cutral co plaza huincul" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "cutral co plaza huincul" & provincia == "Neuquén"
replace departamento = "Confluencia" if barrio == "cutral co - plaza huincul" & provincia == "Neuquén"

replace departamento = "Confluencia" if barrio == "villa el chocón" & provincia == "Neuquén"



replace departamento = "Huiliches" if barrio == "junín de los andes" & provincia == "Neuquén"
replace departamento = "Huiliches" if barrio == "junin de los andes" & provincia == "Neuquén"

replace departamento = "Lácar" if barrio == "san martín de los andes " & provincia == "Neuquén"
replace departamento = "Lácar" if barrio == "san martín de los andes" & provincia == "Neuquén"
replace departamento = "Lácar" if barrio == "villa lago meliquina" & provincia == "Neuquén"

replace departamento = "Loncopué" if barrio == "loncopué" & provincia == "Neuquén"
replace departamento = "Loncopué" if barrio == "loncopue" & provincia == "Neuquén"
replace departamento = "Loncopué" if barrio == "loncopue " & provincia == "Neuquén"


replace departamento = "Los lagos" if barrio == "villa la angostura" & provincia == "Neuquén"
replace departamento = "Los lagos" if barrio == "villa la angostura " & provincia == "Neuquén"
replace departamento = "Los lagos" if barrio == "cuyín manzano" & provincia == "Neuquén"

replace departamento = "Minas" if barrio == "andacollo" & provincia == "Neuquén"
replace departamento = "Minas" if barrio == "huinganco" & provincia == "Neuquén"
replace departamento = "Minas" if barrio == "varvarco" & provincia == "Neuquén"
replace departamento = "Minas" if barrio == "las ovejas" & provincia == "Neuquén"
replace departamento = "Minas" if barrio == "los miches" & provincia == "Neuquén"

replace departamento = "pehuenches" if barrio == "rincón de los sauces" & provincia == "Neuquén"
replace departamento = "pehuenches" if barrio == "rincon de los sauces" & provincia == "Neuquén"
replace departamento = "pehuenches" if barrio == "barranca" & provincia == "Neuquén"
replace departamento = "pehuenches" if barrio == "barrancas" & provincia == "Neuquén"
replace departamento = "pehuenches" if barrio == "buta ranquil" & provincia == "Neuquén"


replace departamento = "picunches" if barrio == "las lajas" & provincia == "Neuquén"
replace departamento = "picunches" if barrio == "bajada del agrio " & provincia == "Neuquén"

replace departamento = "picún leufú" if barrio == "picún leufú" & provincia == "Neuquén"
replace departamento = "picún leufú" if barrio == "picun leufu" & provincia == "Neuquén"

replace departamento = "zapala" if barrio == "zapala" & provincia == "Neuquén"
replace departamento = "zapala" if barrio == "mariano moreno" & provincia == "Neuquén"
replace departamento = "zapala" if barrio == "ramón m. castro" & provincia == "Neuquén"


replace departamento = "ñorquín" if barrio == "taquimilan " & provincia == "Neuquén"
replace departamento = "ñorquín" if barrio == "el huecu" & provincia == "Neuquén"
replace departamento = "ñorquín" if barrio == "el huecú" & provincia == "Neuquén"
replace departamento = "ñorquín" if barrio == "caviahue copahue" & provincia == "Neuquén"
replace departamento = "ñorquin" if barrio == "el cholar" & provincia == "Neuquén"


replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace
keep in 1/71

drop barrio
save "carac_neuquen", replace
*****************************************
use "carac_pba_conurbano", clear
gen provincia="."
replace provincia= "BA Conurbano"

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones   

rename Periodistasinvolucradosene cantidad_periodistas
rename Municipiodondetienesedeel departamento
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/213
save "carac_pba_conurbano", replace
***************************************
use "carac_pba_II", clear

drop  Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones   

rename Periodistasinvolucradosene cantidad_periodistas
rename Municipio departamento
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

gen  provincia="."
replace	provincia="PBA II"
replace departamento = lower(departamento)

replace	departamento="veinticinco de mayo" if departamento=="25 de mayo" & provincia=="PBA II"
replace	departamento="nueve de julio" if departamento=="9 de julio" & provincia=="PBA II"
replace	departamento="leandro n. alem" if departamento=="alem" & provincia=="PBA II"
replace	departamento="general arenales" if departamento=="arenales" & provincia=="PBA II"
replace	departamento="general belgrano" if departamento=="belgrano" & provincia=="PBA II"
replace	departamento="general las heras" if departamento=="las heras" & provincia=="PBA II"
replace	departamento="san miguel del monte" if departamento=="monte" & provincia=="PBA II"
replace	departamento="carmen de patagones" if departamento=="patagones" & provincia=="PBA II"
replace	departamento="san nicolas" if departamento=="san nicolás de los arroyos" & provincia=="PBA II"
replace	departamento="capitan sarmiento" if departamento=="sarmiento" & provincia=="PBA II"
replace	departamento="general viamonte" if departamento=="viamonte" & provincia=="PBA II"
replace departamento= "san andres de giles" if departamento=="san antonio de giles" & provincia=="PBA II"
replace departamento = "zarate" if departamento == "zárate" & provincia=="PBA II"


replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/241
save "carac_pba_II", replace
**********************************
use "carac_pba_III", clear
gen provincia= "."
replace provincia="PBA III"

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones    R S T U V W

rename Periodistasinvolucradosene cantidad_periodistas
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Municipiodondetienesedeel departamento
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/187

save "carac_pba_III", replace
************************************
use "carac_resto_cordoba", clear
gen provincia= "."
replace provincia="Resto Cordoba"

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones   R S

rename Periodistasinvolucradosene cantidad_periodistas
rename Departamentodondetienesede departamento
rename Aquéotrosdepartamentosa alcance_otros_dpto 
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/148
save "carac_resto_cordoba", replace
************************************
use "carac_resto_santa_fe", clear
gen provincia="."
replace provincia="Resto Santa Fe"


rename Departamentodondetienesede departamento
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene  cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

replace departamento = "General Obligado" if departamento =="Villa Ocampo" & provincia== "Resto Santa Fe"

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

save "carac_resto_santa_fe", replace
*********************************
use "carac_rio_negro", clear

rename Municipiodondetienesedeel barrio
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop  A Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones 


replace barrio = lower(barrio)
gen  provincia="."
replace	provincia="Río Negro"
gen departamento="."

replace departamento = "Adolfo alsina" if barrio == "viedma" & provincia == "Río Negro"
replace departamento = "Adolfo alsina" if barrio == "viedma " & provincia == "Río Negro"

replace departamento = "Avellaneda" if barrio == "choele choel" & provincia == "Río Negro"
replace departamento = "Avellaneda" if barrio == "luis beltrán" & provincia == "Río Negro"
replace departamento = "Avellaneda" if barrio == "lamarque" & provincia == "Río Negro"
replace departamento = "Avellaneda" if barrio == "pomona" & provincia == "Río Negro"
replace departamento = "Avellaneda" if barrio == "chimpay" & provincia == "Río Negro"
replace departamento = "Avellaneda" if barrio == "coronel belisle" & provincia == "Río Negro"


replace departamento = "Bariloche" if barrio == "san carlos de bariloche" & provincia == "Río Negro"
replace departamento = "Bariloche" if barrio == "san carlos de bariloche " & provincia == "Río Negro"
replace departamento = "Bariloche" if barrio == "el bolsón" & provincia == "Río Negro"

replace departamento = "Conesa" if barrio == "general conesa" & provincia == "Río Negro"


replace departamento = "General Roca" if barrio == "general roca" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "general roca " & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "cipolletti" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "cipolletti " & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "allen" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "cinco saltos" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "general fernández oro" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "ingeniero huergo" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "catriel" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "catriel " & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "villa regina" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "villa regina " & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "chichinales" & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "cervantes " & provincia == "Río Negro"
replace departamento = "General Roca" if barrio == "campo grande" & provincia == "Río Negro"


replace departamento = "Pichi Mahuida" if barrio == "río colorado " & provincia == "Río Negro"
replace departamento = "Pichi Mahuida" if barrio == "rio colorado" & provincia == "Río Negro"
replace departamento = "Pichi Mahuida" if barrio == "río colorado" & provincia == "Río Negro"


replace departamento = "Pilcaniyeu" if barrio == "pilcaniyeu" & provincia == "Río Negro"
replace departamento = "Pilcaniyeu" if barrio == "dina huapi" & provincia == "Río Negro"

replace departamento = "Ñorquincó" if barrio == "ñorquincó" & provincia == "Río Negro"

replace departamento = "San Antonio" if barrio == "san antonio oeste" & provincia == "Río Negro"
replace departamento = "San Antonio" if barrio == "san antonio este" & provincia == "Río Negro"
replace departamento = "San Antonio" if barrio == "san antonio oeste, las grutas" & provincia == "Río Negro"
replace departamento = "San Antonio" if barrio == "las grutas" & provincia == "Río Negro"
replace departamento = "San Antonio" if barrio == "sierra grande" & provincia == "Río Negro"
replace departamento = "San Antonio" if barrio == "sierra grande " & provincia == "Río Negro"

replace departamento = "Valcheta" if barrio == "valcheta" & provincia == "Río Negro"
replace departamento = "Valcheta" if barrio == "valcheta " & provincia == "Río Negro"

replace departamento = "Valcheta" if barrio == "aguada cecilio" & provincia == "Río Negro"
replace departamento = "Valcheta" if barrio == "sierra pailemán" & provincia == "Río Negro"

replace departamento = "9 de Julio" if barrio == "sierra colorada" & provincia == "Río Negro"
replace departamento = "9 de Julio" if barrio == "prahuaniyeu" & provincia == "Río Negro"
replace departamento = "9 de Julio" if barrio == "ministro ramos mexia" & provincia == "Río Negro"

replace departamento = "25 de Mayo" if barrio == "maquinchao" & provincia == "Río Negro"
replace departamento = "25 de Mayo" if barrio == "maquinchao " & provincia == "Río Negro"

replace departamento = "25 de Mayo" if barrio == "ingeniero jacobacci" & provincia == "Río Negro"
replace departamento = "25 de Mayo" if barrio == "ingeniero jacobaci" & provincia == "Río Negro"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/101
drop barrio
save "carac_rio_negro", replace

***********************************

use "carac_rosario_gran_rosario", clear
gen provincia="."
replace provincia="Rosario Gran Rosario"

rename Periodistasinvolucradosene cantidad_periodistas
rename Departamentodondetienesede departamento
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop A Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones 

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/67
save "carac_rosario_gran_rosario", replace
**************************************
use "carac_salta", clear
gen provincia ="."
replace provincia= "Salta"

rename CantidaddePeriodistasinvol cantidad_periodistas
rename DepartamentodelaProvincia departamento
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop Timestamp Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
		replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/54
save "carac_salta", replace
**************************************
use "carac_san_juan", clear
gen provincia="."
replace provincia= "San Juan"

rename Periodistasinvolucradosene cantidad_periodistas
rename Municipiodondetienesedeel departamento
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/54
save "carac_san_juan", replace
**********************************
use "carac_san_luis", clear
gen provincia ="."
replace provincia="San Luis"

rename Periodistasinvolucradosene cantidad_periodistas
rename Departamentodondetienesede departamento
rename Aquéotrosdepartamentosa alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  Marcatemporal

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/41
save "carac_san_luis", replace

*********************************************
use "carac_santa_cruz", clear

rename Municipiodondetienesedeel  barrio
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  

gen  provincia="."
replace	provincia="Santa cruz"
gen departamento="."
replace barrio = lower(barrio)

replace	departamento="Corpen Aike" if barrio=="puerto santa cruz" & provincia=="Santa cruz"
replace	departamento="Corpen Aike" if barrio=="comandante luis piedra buena" & provincia=="Santa cruz"
replace	departamento="Corpen Aike" if barrio=="piedrabuena" & provincia=="Santa cruz"
replace	departamento="Corpen Aike" if barrio=="julia dufour" & provincia=="Santa cruz"

replace	departamento="Deseado" if barrio=="puerto deseado" & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="puerto deseado " & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="caleta olivia" & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="pico truncado" & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="pico truncado " & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="las heras" & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="las heras " & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="fitz roy" & provincia=="Santa cruz"
replace	departamento="Deseado" if barrio=="cañadón seco" & provincia=="Santa cruz"


replace	departamento="Gúer Aike" if barrio=="río gallegos" & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="río gallegos " & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="rospentek" & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="28 de noviembre" & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="28 de noviembre " & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="río turbio" & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="río turbio " & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="julia dufour" & provincia=="Santa cruz"
replace	departamento="Gúer Aike" if barrio=="el cóndor" & provincia=="Santa cruz"

replace	departamento="Lago Argentino" if barrio=="el calafate" & provincia=="Santa cruz"
replace	departamento="Lago Argentino" if barrio=="el chaltén" & provincia=="Santa cruz"
replace	departamento="Lago Argentino" if barrio=="tres lagos" & provincia=="Santa cruz"
replace	departamento="Lago Argentino" if barrio=="comision de fomento tres lagos" & provincia=="Santa cruz"
replace	departamento="Lago Argentino" if barrio=="la leona" & provincia=="Santa cruz"


replace	departamento="Lago Buenos Aires" if barrio=="perrito moreno" & provincia=="Santa cruz"
replace	departamento="Lago Buenos Aires" if barrio=="perito moreno" & provincia=="Santa cruz"
replace	departamento="Lago Buenos Aires" if barrio=="los antiguos" & provincia=="Santa cruz"
replace	departamento="Lago Buenos Aires" if barrio=="lago posadas" & provincia=="Santa cruz"

replace	departamento="Magallanes" if barrio=="puerto san julián" & provincia=="Santa cruz"
replace	departamento="Magallanes" if barrio=="el salado" & provincia=="Santa cruz"
replace	departamento="Magallanes" if barrio=="la trinchera" & provincia=="Santa cruz"

replace	departamento="Rio Chico" if barrio=="gobernador gregores" & provincia=="Santa cruz"
replace	departamento="Rio Chico" if barrio=="gobernador gregores " & provincia=="Santa cruz"
replace	departamento="Rio Chico" if barrio=="bajo caracoles" & provincia=="Santa cruz"
replace	departamento="Rio Chico" if barrio=="hipólito yrigoyen" & provincia=="Santa cruz"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/35
drop barrio
save "carac_santa_cruz", replace


*************************************************
use "carac_santiago_del_estero", clear

rename Municipiodondetienesedeel  barrio
rename Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones 

gen  provincia="."
replace	provincia="Santiago del Estero"
gen departamento="."
replace barrio = lower(barrio)

replace departamento = "Avellaneda" if barrio == "colonia dora" & provincia == "Santiago del Estero"

replace departamento = "Capital" if barrio == "santiago del estero" & provincia == "Santiago del Estero"
replace departamento = "Capital" if barrio == "santiago del estero " & provincia == "Santiago del Estero"
replace departamento = "Sarmiento" if barrio == "garza" & provincia == "Santiago del Estero"
replace departamento = "Belgrano" if barrio == "bandera" & provincia == "Santiago del Estero"
replace departamento = "Moreno" if barrio == "quimilí" & provincia == "Santiago del Estero"
replace departamento = "Banda" if barrio == "la banda" & provincia == "Santiago del Estero"
replace departamento = "Banda" if barrio == "la banda " & provincia == "Santiago del Estero"
replace departamento = "Banda" if barrio == "clodomira" & provincia == "Santiago del Estero"
replace departamento = "Robles" if barrio == "fernández" & provincia == "Santiago del Estero"
replace departamento = "Robles" if barrio == "forres" & provincia == "Santiago del Estero"
replace departamento = "Robles" if barrio == "beltrán" & provincia == "Santiago del Estero"
replace departamento = "San Martín" if barrio == "brea pozo" & provincia == "Santiago del Estero"
replace departamento = "San Martín" if barrio == "vilmer" & provincia == "Santiago del Estero"
replace departamento = "Silípica" if barrio == "árraga" & provincia == "Santiago del Estero"
replace departamento = "Silípica" if barrio == "villa silípica" & provincia == "Santiago del Estero"
replace departamento = "Loreto" if barrio == "loreto" & provincia == "Santiago del Estero"
replace departamento = "Atamisqui" if barrio == "villa atamisqui" & provincia == "Santiago del Estero"
replace departamento = "Atamisqui" if barrio == "medellín" & provincia == "Santiago del Estero"
replace departamento = "Copo" if barrio == "monte quemado" & provincia == "Santiago del Estero"
replace departamento = "Copo" if barrio == "el caburé" & provincia == "Santiago del Estero"
replace departamento = "Alberdi" if barrio == "campo gallo" & provincia == "Santiago del Estero"
replace departamento = "Alberdi" if barrio == "agustina libarona" & provincia == "Santiago del Estero"
replace departamento = "Río Hondo" if barrio == "termas de río hondo" & provincia == "Santiago del Estero"
replace departamento = "Río Hondo" if barrio == "villa río hondo" & provincia == "Santiago del Estero"
replace departamento = "Choya" if barrio == "frías" & provincia == "Santiago del Estero"
replace departamento = "Choya" if barrio == "frías " & provincia == "Santiago del Estero"
replace departamento = "Choya" if barrio == "tapso" & provincia == "Santiago del Estero"
replace departamento = "Guasayán" if barrio == "san pedro de guasayán" & provincia == "Santiago del Estero"
replace departamento = "Guasayán" if barrio == "lavalle" & provincia == "Santiago del Estero"
replace departamento = "Jiménez" if barrio == "pozo hondo" & provincia == "Santiago del Estero"
replace departamento = "Jiménez" if barrio == "el aibal" & provincia == "Santiago del Estero"
replace departamento = "Juan Felipe Ibarra" if barrio == "suncho corral" & provincia == "Santiago del Estero"

replace departamento = "General Taboada" if barrio == "añatuya" & provincia == "Santiago del Estero"

replace departamento = "Moreno" if barrio == "tintina" & provincia == "Santiago del Estero"

replace departamento = "Quebrachos" if barrio == "sumampa" & provincia == "Santiago del Estero"
replace departamento = "Quebrachos" if barrio == "Sumampa Viejo" & provincia == "Santiago del Estero"

replace departamento = "Rivadavia" if barrio == "selva" & provincia == "Santiago del Estero"
replace departamento = "Ojo de Agua" if barrio == "villa ojo de agua" & provincia == "Santiago del Estero"

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/53
drop barrio

save "carac_santiago_del_estero", replace
*****************************************
use "carac_tierra_del_fuego", clear

rename  Ciudadalaquepertenece departamento
rename  Aquéotrosmunicipiosalca alcance_otros_dpto
rename Antigüedad antiguedad
rename Plataformasdepublicación plataformas_publicacion
rename Quéporcentajedesuconteni porcentaje_contenido_refe
rename Cuálessonlastemáticasde tematicas_informativas
rename Periodistasinvolucradosene cantidad_periodistas
rename Quéporcentajedesusingre ingresos_sector_publico
rename Sielmedioestásituadoen medio_ubicado_rural
rename Cuálessonsusfuentesdei fuentes_ingreso

gen provincia="."
replace provincia="Tierra del Fuego"

drop Marcatemporal Vínculolaboralentrelosper Naturalezadelapropiedad Conquéperiodicidadpublica Cuáleselobjetivodesum Cuálfueelroldelencuest Observaciones  B S T U V W X Y Z AA AB AC AD 

replace cantidad_periodistas = "entre 1 y 5" if ///
    cantidad_periodistas == "1" | ///
    cantidad_periodistas == "2" | ///
    cantidad_periodistas == "3" | ///
    cantidad_periodistas == "4" | ///
    cantidad_periodistas == "5"
	replace ingresos_sector_publico = "" if ingresos_sector_publico == "No sabe / No contesta"

destring ingresos_sector_publico, replace

keep in 1/16
save "carac_tierra_del_fuego", replace

/***********************************************
TRABAJO AHORA CON LA BASE DE DATOS UNIDA LLAMADA "BASE_FORMULARIO_1"
(UNI CADA BASE DE LAS ANTERIORES Y EXCLUIMOS TUCUMAN PORQUE ES LA PROVINCIA PILOTO) 
*/*************************

use "base_formulario_1.dta", clear 

*uniformo el nombre de las provincias
*elimino tucuman porque no hay datos de departamento 

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
replace	provincia="La Pampa" if provincia_orig=="La pampa"
replace	provincia="La Rioja" if provincia_orig=="La Rioja"
replace	provincia="Mendoza" if provincia_orig=="Mendoza"
replace	provincia="Misiones" if provincia_orig=="Misiones"
replace	provincia="Neuquen" if provincia_orig=="Neuquén"
replace	provincia="Buenos Aires" if provincia_orig=="PBA II"
replace	provincia="Buenos Aires" if provincia_orig=="PBA III"
replace	provincia="Cordoba" if provincia_orig=="Resto Cordoba"
replace	provincia="Santa Fe" if provincia_orig=="Resto Santa Fe"
replace	provincia="Rio Negro" if provincia_orig=="Río Negro"
replace	provincia="Santa Fe" if provincia_orig=="Rosario Gran Rosario"
replace	provincia="Salta" if provincia_orig=="Salta"
replace	provincia="San Juan" if provincia_orig=="San Juan"
replace	provincia="San Luis" if provincia_orig=="San Luis"
replace	provincia="Santa Cruz" if provincia_orig=="Santa cruz"
replace	provincia="Santiago del Estero" if provincia_orig=="Santiago del Estero"
replace	provincia="Tierra del Fuego" if provincia_orig=="Tierra del Fuego"

drop provincia_orig

save "base_formulario_1_cleaned", replace

/*
TRABAJO CON LA BASE DE DATOS YA LIMPIA Y ASIGNO DUMMY

*/

use "base_formulario_1_cleaned.dta", clear

/*

SE TRABAJA CON ANTIGUEDAD SEGUN EL SIGUIENTE CRITERIO:
* Dado que es 2021, menos de dos años -> pandemia.
* De 3 a 10 - > Medio Joven.
* De 10 a 25 -> Medio consolidado. 
* 25+ Medio Tradicional.
*/

rename antiguedad antiguedad_org
gen antiguedad = antiguedad_org

replace antiguedad= "Medio de Pandemia"  if antiguedad_org== "Menos de un año"
replace antiguedad= "Medio de Pandemia"  if antiguedad_org== "Un año"
replace antiguedad= "Medio Joven"  if antiguedad_org== "Dos años"
replace antiguedad= "Medio Joven"  if antiguedad_org== "Tres años"
replace antiguedad= "Medio Joven"  if antiguedad_org== "Cuatro años"
replace antiguedad= "Medio Joven"  if antiguedad_org== "Cinco años"
replace antiguedad= "Medio Joven"  if antiguedad_org== "Entre 6 y 10 años"
replace antiguedad= "Medio Consolidado"  if antiguedad_org== "Entre 11 y 15 años"
replace antiguedad= "Medio Consolidado"  if antiguedad_org== "Entre 16 y 20 años"
replace antiguedad= "Medio Consolidado"  if antiguedad_org== "Entre 21 y 25 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 26 y 30 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 31 y 35 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 36 y 40 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 41 y 45 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 46 y 50 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 51 y 55 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 56 y 60 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 61 y 65 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 66 y 70 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 71 y 75 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 76 y 80 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 81 y 85 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 86 y 90 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 91 y 95 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Entre 96 y 100 años"
replace antiguedad= "Medio Tradicional"  if antiguedad_org== "Más de 100 años"

/* 

hago la variablde de año del medio para asi despues ocuparla como pseudo panel
considerando que la encuesta fue en febrero del 2021
*/
gen año_inicio = .

replace año_inicio= 2021 if antiguedad_org == "Menos de un año"
replace año_inicio= 2020 if antiguedad_org == "Un año"
replace año_inicio= 2019 if antiguedad_org == "Dos años"
replace año_inicio= 2018 if antiguedad_org == "Tres años"
replace año_inicio= 2017 if antiguedad_org == "Cuatro años"
replace año_inicio= 2017 if antiguedad_org == "Cinco años"
replace año_inicio= 2017 if antiguedad_org == "Entre 6 y 10 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 11 y 15 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 16 y 20 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 21 y 25 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 26 y 30 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 31 y 35 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 36 y 40 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 41 y 45 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 46 y 50 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 51 y 55 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 56 y 60 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 61 y 65 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 66 y 70 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 71 y 75 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 76 y 80 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 81 y 85 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 86 y 90 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 91 y 95 años"
replace año_inicio= 2017 if antiguedad_org == "Entre 96 y 100 años"
replace año_inicio= 2017 if antiguedad_org == "Más de 100 años"

drop antiguedad_org

/*
DUMMY PARA ANTIGUEDAD

*/

gen medio_pandemia=0
gen medio_joven= 0
gen medio_consolidado= 0
gen medio_tradicional= 0

replace medio_pandemia=1 if antiguedad=="Medio de Pandemia"
replace medio_joven= 1 if antiguedad== "Medio Joven"
replace medio_consolidado=1 if antiguedad=="Medio Consolidado"
replace medio_tradicional=1 if antiguedad=="Medio Tradicional"


/*
DUMMY PARA PERIODISTAS
uniformo los datos considerando el error que se genera en los extremos.
*/
replace cantidad_periodistas = "entre 1 y 5"   if cantidad_periodistas == "entre 1 y 5"
replace cantidad_periodistas = "entre 6 y 9"   if cantidad_periodistas == "Más de 5 y menos de 10"
replace cantidad_periodistas = "entre 10 y 19" if cantidad_periodistas == "Más de 10 y menos de 20"
replace cantidad_periodistas = "entre 20 y 39" if cantidad_periodistas == "Entre 20 y 40"
replace cantidad_periodistas = "entre 40 y 59" if cantidad_periodistas == "Entre 40 y 60"
replace cantidad_periodistas = "entre 60 y 79" if cantidad_periodistas== "Entre 60 y 80"
replace cantidad_periodistas = "entre 80 y 99" if cantidad_periodistas == "Entre 80 y 100"
replace cantidad_periodistas = "más de 100" if cantidad_periodistas == "Más de 100"

*reasigno los que estan suelto (estan en formato texto)


replace cantidad_periodistas = "entre 1 y 5" if cantidad_periodistas == "Dos"
replace cantidad_periodistas = "entre 1 y 5" if cantidad_periodistas == "Norberto Amateis, Bibiana Amateis."

replace cantidad_periodistas = "entre 6 y 9" if cantidad_periodistas == "6"
replace cantidad_periodistas = "entre 6 y 9" if cantidad_periodistas == "7"
replace cantidad_periodistas = "entre 6 y 9" if cantidad_periodistas == "8"

replace cantidad_periodistas = "entre 10 y 19" if cantidad_periodistas == "10"
replace cantidad_periodistas = "entre 10 y 19" if cantidad_periodistas == "14"
replace cantidad_periodistas = "entre 10 y 19" if cantidad_periodistas == "15"
replace cantidad_periodistas = "entre 10 y 19" if cantidad_periodistas == "18"

replace cantidad_periodistas = "entre 20 y 39" if cantidad_periodistas == "30"

replace cantidad_periodistas = "entre 40 y 59" if cantidad_periodistas == "50"

replace cantidad_periodistas = "entre 60 y 79" if cantidad_periodistas == "70"

replace cantidad_periodistas = "entre 80 y 99" if cantidad_periodistas == "90"

*ahora hago las dummy

gen periodistas_0       = 0
gen periodistas_1_5     = 0
gen periodistas_6_9     = 0
gen periodistas_10_19   = 0
gen periodistas_20_39   = 0
gen periodistas_40_59   = 0
gen periodistas_60_79   = 0
gen periodistas_80_99   = 0
gen periodistas_mas_100 = 0


replace periodistas_0 = 1 if cantidad_periodistas == "0"
replace periodistas_1_5 = 1 if cantidad_periodistas == "entre 1 y 5"
replace periodistas_6_9 = 1 if cantidad_periodistas == "entre 6 y 9"
replace periodistas_10_19 = 1 if cantidad_periodistas == "entre 10 y 19"
replace periodistas_20_39 = 1 if cantidad_periodistas == "entre 20 y 39"
replace periodistas_40_59 = 1 if cantidad_periodistas == "entre 40 y 59"
replace periodistas_60_79 = 1 if cantidad_periodistas == "entre 60 y 79"
replace periodistas_80_99 = 1 if cantidad_periodistas == "entre 80 y 99"
replace periodistas_mas_100 = 1 if cantidad_periodistas == "más de 100"


/*

CAMBIO DE CATEGORIAS PARA LOS TIPOS DE MEDIOS
*/


gen medio_escrito= .
gen medio_audiovisual=.
gen medio_redes= .

* Medio Escrito (tenga o no redes)
replace medio_escrito =  1 if ///
strpos(lower(plataformas), "portal digital") | ///
strpos(lower(plataformas), "diario de papel") | ///
strpos(lower(plataformas), "periódico de papel") | ///
strpos(lower(plataformas), "revista") | ///
strpos(lower(plataformas), "boletín") | ///
strpos(lower(plataformas), "blog") | ///
strpos(lower(plataformas), "agencia de noticias")
replace medio_escrito= 0 if medio_escrito== .
* Medio Audiovisual (tenga o no redes), pero solo si no fue clasificado como escrito
replace medio_audiovisual = 1 if ( ///
strpos(lower(plataformas), "estación de radio") | ///
strpos(lower(plataformas), "canal de televisión") | ///
strpos(lower(plataformas), "tv") | ///
strpos(lower(plataformas), "podcast"))
replace medio_audiovisual= 0 if medio_audiovisual== .
* Redes Sociales, solo si no fue clasificado como escrito ni audiovisual
replace medio_redes = 1 if ( ///
strpos(lower(plataformas), "facebook") | ///
strpos(lower(plataformas), "instagram") | ///
strpos(lower(plataformas), "twitter") | ///
strpos(lower(plataformas), "tiktok") | ///
strpos(lower(plataformas), "youtube"))
replace medio_redes= 0 if medio_redes== .


/*
DUMMY PARA EXTENSION GEOGRAFICA

*/

gen extension_geografica= 0
replace extension_geografica = 1 if !missing(alcance_otros_dpto)

/*
DUMMY PARA PREVENCION

*/

gen prevencion_delito= 0
replace prevencion_delito = 1 if strpos(lower(tematica), "vigilancia y prevención de delitos") > 0

/*
OBTENEMOS PROPORCIONES
*/

****calculo solo para verificar******

* Calcular total de medios en cada departamento y antiguedad para verificar si son lo mismo
egen total_medios = count(departamento), by(departamento)
egen total_antiguedad= count(antiguedad), by(departamento)

/*

UNIFORMO COSAS PARA LUEGO HACER EL COLLAPSE

*/
*****uniformar algunas cosas

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



replace departamento= "Capital" if departamento=="Cordoba Capital" & provincia== "Cordoba"
replace departamento= "Colon" if departamento=="COLÓN" & provincia== "Entre Rios"
replace departamento= "Colon" if departamento=="Colon, Entre Rios" & provincia== "Entre Rios"
replace departamento= "Concordia" if departamento=="Concordia - Entre Rios" & provincia== "Entre Rios"
replace departamento= "Diamante" if departamento=="DIAMANTE" & provincia== "Entre Rios"
replace departamento= "Federacion" if departamento=="Federacion, Entre Rios" & provincia== "Entre Rios"
replace departamento= "Federal" if departamento=="Federal, Entre Rios" & provincia== "Entre Rios"
replace departamento= "Feliciano" if departamento=="Feliciano - Entre Rios" & provincia== "Entre Rios"
replace departamento= "Feliciano" if departamento=="Feliciano, Provincia de Entre Rios" & provincia== "Entre Rios"
replace departamento= "Gualeguay" if departamento=="Gualeguay, Entre Rios" & provincia== "Entre Rios"
replace departamento= "Gualeguaychu" if departamento=="Gualeguaychu/Entre Rios" & provincia== "Entre Rios"
replace departamento= "La Paz" if departamento=="La Paz, Entre Rios" & provincia== "Entre Rios"
replace departamento= "La Paz" if departamento=="La Paz, Entre Rios." & provincia== "Entre Rios"
replace departamento= "Nogoya" if departamento=="Nogoya - Entre Rios" & provincia== "Entre Rios"
replace departamento= "Parana" if departamento=="PARANA" & provincia== "Entre Rios"
replace departamento= "Parana" if departamento=="Parana, Entre Rios" & provincia== "Entre Rios"
replace departamento= "San Salvador" if departamento=="SAN SALVADOR" & provincia== "Entre Rios"
replace departamento= "San Salvador" if departamento=="San Salvador (Entre Rios)" & provincia== "Entre Rios"
replace departamento= "San Salvador" if departamento=="San Salvador, Entre Rios" & provincia== "Entre Rios"
replace departamento= "San Salvador" if departamento=="San Salvador, Entre Rios." & provincia== "Entre Rios"
replace departamento= "Uruguay" if departamento=="Uruguay, Entre Rios" & provincia== "Entre Rios"
replace departamento= "Victoria" if departamento=="Victoria, Entre Rios" & provincia== "Entre Rios"
replace departamento= "Villaguay" if departamento=="Villaguay, Entre Rios" & provincia== "Entre Rios"
replace departamento="Fatima" if departamento=="Famatina - Chañarmuyo" & provincia=="La Rioja"
replace departamento="General obligado" if departamento=="Gral Obligado" & provincia=="Santa Fe"
replace departamento="General obligado" if departamento=="GRAL. OBLIGADO" & provincia=="Santa Fe"
replace departamento="General obligado" if departamento=="General Obligado" & provincia=="Santa Fe"
replace departamento="Capital" if departamento=="La Capital" & provincia=="Santa Fe"
replace departamento="Castellanos" if departamento=="castellano santa fe" & provincia=="Santa Fe"
replace departamento="Castellanos" if departamento=="CASTELLANOS" & provincia=="Santa Fe"
replace departamento="Castellanos" if departamento=="Castellano (pcia de Santa Fe)" & provincia=="Santa Fe"
replace departamento="San Cristobal" if departamento=="san cristobal" & provincia=="Santa Fe"
replace departamento="San Javier" if departamento=="SAN JAVIER - SANTA FE" & provincia=="Santa Fe"
replace departamento="Garay" if departamento=="Dto.Garay  Santa fe" & provincia=="Santa Fe"
replace departamento="San Justo" if departamento=="San Justo- Prov. Santa Fe" & provincia=="Santa Fe"
replace departamento="Adolfo Alsina" if departamento=="Adolfo alsina" & provincia=="Rio Negro"
replace departamento="Cruz del Eje" if departamento=="Cruz del eje" & provincia=="Cordoba"
replace departamento="Rio Seco" if departamento=="Rio Seco " & provincia=="Cordoba"
replace departamento="Colon" if departamento=="colon" & provincia=="Entre Rios"

replace departamento="General Juan Facundo Quiroga" if departamento=="General Juan Facundo Quiroga. Ruta 29" & provincia=="La Rioja"

replace departamento="san isidro" if departamento=="San Isidro" & provincia=="Buenos Aires"
replace departamento="san isidro" if departamento=="San isidro" & provincia=="Buenos Aires"

replace departamento="leandro n alem" if departamento=="Leando N.Alem" & provincia=="Misiones"
replace departamento="leandro n alem" if departamento=="leandro n. alem" & provincia=="Buenos Aires"
replace departamento="leandro n alem" if departamento=="leandro n. alem" & provincia=="Buenos Aires"
replace departamento="capital" if departamento=="San Fernando del Valle" & provincia=="Catamarca"
replace departamento="general jose de san martin" if departamento=="San Martin" & provincia=="Salta"
replace departamento="presidente roque saenz peña" if departamento=="Roque Saenz Peña" & provincia=="Cordoba"
replace departamento="güer aike" if departamento=="Guer Aike" & provincia=="Santa Cruz"
replace departamento="la capital" if departamento=="Capital" & provincia=="Santa Fe"
replace departamento="9 de julio" if departamento=="Nueve de Julio" & provincia=="Santa Fe"
replace  departamento = "iruya" if departamento=="Iruya" & provincia== "Salta"

replace  departamento = "juan f ibarra" if departamento=="Juan Felipe Ibarra" & provincia== "Santiago del Estero"
replace  departamento = "capital" if departamento=="Corrientes" & provincia== "Corrientes"


***********************************************************************************

/*

PREPARO LA BASE PARA EL MERGE

*/


*paso a minuscula los nombres y observaciones
replace departamento = lower(departamento)
replace provincia=lower(provincia)	



*renombro departamentos para el merge

replace departamento="25 de mayo" if departamento=="veinticinco de mayo" & provincia=="buenos aires"
replace departamento="9 de julio" if departamento=="nueve de julio" & provincia=="buenos aires"
replace departamento="arenales" if departamento=="general arenales" & provincia=="buenos aires"
replace departamento="belgrano" if departamento=="general belgrano" & provincia=="buenos aires"
replace departamento="las heras" if departamento=="general las heras" & provincia=="buenos aires"
replace departamento="monte" if departamento=="san miguel del monte" & provincia=="buenos aires"
replace departamento="sarmiento" if departamento=="capitan sarmiento" & provincia=="buenos aires"
replace departamento="viamonte" if departamento=="general viamonte" & provincia=="buenos aires"
replace departamento = "alem" if departamento == "leandro n alem" & provincia == "buenos aires"


replace departamento="corrientes" if departamento == "capital" & provincia== "corrientes"

replace departamento="12 de octubre" if departamento=="doce de octubre" & provincia=="chaco"
replace departamento="2 de abril" if departamento=="dos de abril" & provincia=="chaco"
replace departamento="9 de julio" if departamento=="nueve de julio" & provincia=="chaco"
replace departamento="1º de mayo" if departamento=="primero de mayo" & provincia=="chaco"
replace departamento="25 de mayo" if departamento=="veinticinco de mayo" & provincia=="chaco"

replace departamento="palpala" if departamento=="papala" & provincia=="jujuy"
replace departamento="susques" if departamento=="susque" & provincia=="jujuy"

replace departamento="famatina" if departamento=="fatima" & provincia=="la rioja"
replace departamento="general ortiz de ocampo" if departamento=="ortiz" & provincia=="la rioja"
replace departamento="san blas de los sauces" if departamento=="san blas" & provincia=="la rioja"
replace departamento= "la rioja (capital)" if departamento == "capital" & provincia == "la rioja"

replace departamento="el dorado" if departamento=="eldorado" & provincia=="misiones"
replace departamento = "capital (posadas)" if departamento== "capital" & provincia== "misiones"

replace departamento="loconpue" if departamento=="loncopue" & provincia=="neuquen"

replace departamento =  " juan m de pueyrredon" if departamento == "juan martin de pueyrredon" & provincia =="san luis"
replace departamento = "juan m de pueyrredon"  if departamento == " juan m de pueyrredon" & provincia =="san luis"
replace departamento = "lib general san martin" if departamento == "libertador general san martin" & provincia == "san luis"

*elimino punto intermedio
replace departamento = "jose c paz" if departamento == "jose c. paz" & provincia == "buenos aires"


*cambiamos los nombres de las respuestas 9,19,11,12,14,15
rename porcentaje_contenido_refe   q9_local_content_pct       // numérica 0-1
rename fuentes_ingreso   q10_rev_sources            // texto multi-select separado por comas
rename ingresos_sector_publico  q11_pub_rev_share          // numérica 0-1
rename alcance_otros_dpto   q14_other_munis            // texto libre
rename medio_ubicado_rural   q15_rural_reach            // categórica: 2 valores o missing


/*-----------------------------------------------------------------------------
  Construir indicadores binarios al nivel medio
-----------------------------------------------------------------------------*/


* --- Q9: contenido local --- (ya es numérico 0-1, solo limpiamos)
gen local_content = q9_local_content_pct
label var local_content "Q9: share of content about own municipio (0-1)"

* --- Q11: % ingresos del sector público ---
gen pub_rev_share = q11_pub_rev_share
label var pub_rev_share "Q11: share of revenue from public sector (0-1)"

* --- Q10: fuentes de ingresos (multi-select como string) ---
* Usamos strpos() para detectar si el string contiene cada categoría.
* Atención al exacto matching de la cadena (acentos, mayúsculas) — los nombres
* abajo son los que aparecen en Catamarca.xlsx; verificalo en otras provincias.

gen rev_pauta_of      = (strpos(q10_rev_sources, "Pauta oficial") > 0)
gen rev_pauta_priv    = (strpos(q10_rev_sources, "Pauta privada") > 0)
gen rev_subsidios     = (strpos(q10_rev_sources, "Subsidios o aportes no reintegrables") > 0)
gen rev_donaciones    = (strpos(q10_rev_sources, "Donaciones") > 0)
gen rev_avisos_dig    = (strpos(q10_rev_sources, "Avisos digitales") > 0)
gen rev_patrocinado   = (strpos(q10_rev_sources, "Contenido patrocinado") > 0)
gen rev_ventas        = (strpos(q10_rev_sources, "Venta de copias") > 0)
gen rev_eventos       = (strpos(q10_rev_sources, "Eventos") > 0)
gen rev_otra          = (strpos(q10_rev_sources, "Otra") > 0)

* Composites: cualquier fuente pública / cualquier fuente privada
gen rev_publico       = (rev_pauta_of == 1 | rev_subsidios == 1)
gen rev_privado       = (rev_pauta_priv == 1 | rev_avisos_dig == 1 | ///
                         rev_patrocinado == 1 | rev_ventas == 1 | rev_eventos == 1)

label var rev_publico "Q10: medio recibe al menos UNA fuente pública (0/1)"
label var rev_privado "Q10: medio recibe al menos UNA fuente privada (0/1)"

* Si q10_rev_sources es missing en algunos medios, las variables binarias arriba
* serán 0 (porque strpos(missing,...) = 0). Esto es probablemente lo que
* queremos: "no reportó" → "no recibe esa fuente". Si preferimos que sea
* missing, agregar:
*   foreach v of varlist rev_* { replace `v' = . if missing(q10_rev_sources) }

/*-----------------------------------------------------------------------------
  Step 4: Q14 y Q15 — alcance extra-municipal y rural
-----------------------------------------------------------------------------*/

* Q14: cualquier respuesta no vacía y distinta de "Solo local" cuenta como
* alcance extra-municipal. Conviene verificar que estos sean los strings
* correctos en la base efectivamente importada.
gen reach_extra_muni = .
replace reach_extra_muni = 1 if !missing(q14_other_munis) & ///
                                trim(lower(q14_other_munis)) != "solo local"
replace reach_extra_muni = 0 if missing(q14_other_munis) | ///
                                trim(lower(q14_other_munis)) == "solo local"
label var reach_extra_muni "Q14: medio alcanza al menos otro municipio (0/1)"

* Q15: condicional — solo medios en municipios mayoritariamente rurales
* responden. Si responden, codificamos:
*   "Más de la mitad de la población rural"  → 1
*   "Menos de la mitad de la población rural" → 0
* Cualquier otro string o missing → .

gen rural_alto = .
replace rural_alto = 1 if q15_rural_reach == "Más de la mitad de la población rural"
replace rural_alto = 0 if q15_rural_reach == "Menos de la mitad de la población rural"
label var rural_alto "Q15: medio alcanza >50% pop. rural (condicional)"







save "base_formulario_1_cleaned", replace


*falta hacer el collapse pero se hace para el cross section en otro do.file


































