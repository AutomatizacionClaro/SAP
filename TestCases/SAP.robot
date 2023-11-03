*** Comments ***
Ejecución RPA Proceso traslado de material a un punto directo CAV
Se debe de colocar la siguiente información:

RPA Traslado De Material A Un Punto Directo:

"codigo del material" = 70046968
"centro origen del material" = C108
"org Compras" = CO06
"grupo compras" = T09
"sociedad" = CO15
"cantidad pedido del material" = 2
"centro destino del material" = C127

Ejemplo:
rpa - traslado material a un punto directo     70046968  C108  CO06  T09  CO15  2  C127

*** Settings ***
Resource  ../keywords/abrirSAP.resource
Resource  ../keywords/loginSAP.resource   
Resource    ../Keywords/rpa_validacion_traslado_material.resource


*** Test Cases ***
RPA Traslado De Material A Un Punto Directo 
    abrir_sap
    login_sap
    rpa - traslado material a un punto directo     70046968  C108  CO06  T09  CO15  2  C127
