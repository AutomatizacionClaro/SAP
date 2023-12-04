*** Comments ***
Ejecución Transacción VL10B

Se debe de colocar la siguiente información:

Transaccion VL10B Pedido De Compras:
"centro origen del material" = C108
"ID generado del ME21N" = 4201367423

Ejemplo:
vl10b - pedidos de compras    C108  4201367423

*** Settings ***
Resource    ../keywords/abrirSAP.resource
Resource    ../keywords/loginSAP.resource
Resource    ../Keywords/transaccion_vl10b.resource


*** Test Cases ***
Transaccion VL10B Pedido De Compras
    abrir_sap
    login_sap
    vl10b - pedidos de compras    C108  4201367423