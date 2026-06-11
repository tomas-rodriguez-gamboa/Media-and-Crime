
*hago el collapse de formulario 1 para dejar una observacion por departamento y asi me sirve para el cross section

use "base_formulario_1_cleaned", clear

*el collapse ahora no es por año porque necesito la composicion general de cada provincia-departamento para el 2021, no solo del 2021.
 *antes iba a hacer por año y luego filtrar solo con el 2021 para hacer el merge con categorias.

collapse (mean) periodistas_0 periodistas_1_5 periodistas_6_9 periodistas_10_19 periodistas_20_39 periodistas_40_59 periodistas_60_79 periodistas_80_99 periodistas_mas_100 medio_pandemia medio_joven medio_consolidado medio_tradicional medio_escrito medio_audiovisual medio_redes extension_geografica prevencion_delito total_medios total_antiguedad  local_content pub_rev_share                                      ///
           rev_pauta_of rev_pauta_priv rev_subsidios rev_donaciones         ///
           rev_avisos_dig rev_patrocinado rev_ventas rev_eventos rev_otra   ///
           rev_publico rev_privado                                          ///
           reach_extra_muni rural_alto                                      ///
    (count) n_medios_form1_responses = local_content                        ///
    , by(provincia departamento)


* n_medios_form1_responses indica cuántos medios del depto respondieron Q9.
* Si es bajo (e.g., 1-2) las medias son ruidosas; vale la pena reportarlo.

/*-----------------------------------------------------------------------------
  Step 6: Renombrar al nombre final (convención del paper)
-----------------------------------------------------------------------------*/
rename local_content         medio_contenido_local
rename pub_rev_share         medio_dep_publica
rename rev_publico           medio_financ_publico
rename rev_privado           medio_financ_privado
rename reach_extra_muni      medio_reach_extra_muni
rename rural_alto            medio_rural_alto

* Labels finales
label var medio_contenido_local      "Share local content (Q9, dept avg)"
label var medio_dep_publica          "Share rev from public sector (Q11, dept avg)"
label var medio_financ_publico       "Share outlets with any public funding (Q10)"
label var medio_financ_privado       "Share outlets with any private funding (Q10)"
label var medio_reach_extra_muni     "Share outlets reaching beyond own muni (Q14)"
label var medio_rural_alto           "Share outlets with high rural reach (Q15, cond.)"

save "base_formulario_1_cleaned_cross_section.dta", replace
