*** Comments ***
Ejecución Transacción IQ09

contiene 2 casos de prueba, donde se debe de colocar la siguiente informacion:

Transaccion 1: IQ09 Validacion Material
por defecto la validación sera almacen "H001" y status inclusivo:"Alma"
"código del material" = 70048076
"centro origen del material" = C108

Ejemplo: iq09 - validacion material    70048076    C108
    
Transaccion 2: IQ09 Confirmación Imeis Excel 
agregar los imeis al archivo excel en resource/imeis_material.xlsx


*** Settings ***
Resource    ../keywords/abrirSAP.resource
Resource    ../keywords/loginSAP.resource
Resource    ../Keywords/transaccion_iq09.resource


*** Test Cases ***
Transaccion IQ09 Validacion Material
    abrir_sap
    login_sap
    iq09 - validacion material    70048076    C108

Transaccion IQ09 Confirmación Imeis Excel
    abrir_sap
    login_sap
    iq09 - confirmacion imeis excel
