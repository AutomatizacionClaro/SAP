*** Comments ***
Ejecución Transacción IQ09

Se debe de colocar la siguiente información:

 - Transaccion ME21N Validacion Material:
    <centro origen del material>
    <org Compras>
    <grupo compras>
    <sociedad>
    <codigo del material>
    <cantidad pedido del material>
    <centro destino del material>

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