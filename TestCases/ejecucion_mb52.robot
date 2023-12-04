*** Comments ***
Ejecución Transacción MB52

Se debe de colocar la siguiente información:

Transaccion MB52 Validacion Stock
"código del material" = 70048876
"centro origen del material" = C108

Ejemplo:
mb52 - validar stock material    70048876  C108

*** Settings ***
Resource    ../keywords/abrirSAP.resource
Resource    ../keywords/loginSAP.resource
Resource    ../Keywords/transaccion_mb52.resource


*** Test Cases ***
Transaccion MB52 Validacion Stock
    abrir_sap
    login_sap
    mb52 - validar stock material    70048876  C108