*** Comments ***
Ejecución RPA Proceso traslado de material a un punto directo CAV

Se debe de colocar la siguiente información:

 - RPA Traslado De Material A Un Punto Directo:
    <centro origen del material>
    <org Compras>
    <grupo compras>
    <sociedad>
    <codigo del material>
    <cantidad pedido del material>
    <centro destino del material>

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
