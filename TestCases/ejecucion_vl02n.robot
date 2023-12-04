*** Comments ***
Ejecución Transacción VL02N

Se debe de colocar la siguiente información:

Transaccion VL02N Entrada Traslado:
"id generado transaccion VL10B" = 2101621270

Ejemplo:
vl02n - entrada traslado   2101621270

*** Settings ***
Resource    ../keywords/abrirSAP.resource
Resource    ../keywords/loginSAP.resource
Resource    ../Keywords/transaccion_vl02n.resource


*** Test Cases ***
Transaccion VL02N Entrada Traslado
    abrir_sap
    login_sap
    vl02n - entrada traslado   2101621270