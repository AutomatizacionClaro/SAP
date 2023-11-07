*** Comments ***
Ejecución Transacción ME21N

Se debe de colocar la siguiente información:

Transaccion ME21N Inicio Traslado Material:
"centro origen del material" = C108
"org Compras" = CO06
"grupo compras" = T09
"sociedad" = CO15
"codigo del material" = 70048076
"cantidad pedido del material" = 1
"centro destino del material" = C127

Ejemplo:
me21n - inicio traslado material    C108  CO06  T09  CO15  70048076  1  C127

*** Settings ***
Resource    ../keywords/abrirSAP.resource
Resource    ../keywords/loginSAP.resource
Resource    ../Keywords/transaccion_me21n.resource


*** Test Cases ***
Transaccion ME21N Inicio Traslado Material
    abrir_sap
    login_sap
    me21n - inicio traslado material    C108  CO06  T09  CO15  70048076  1  C127