*** Settings ***
Resource  ../keywords/abrirSAP.resource
Resource  ../keywords/loginSAP.resource
Resource    ../Keywords/transaction_mb52.resource
Resource    ../Keywords/transaccion_me21n.resource

*** Test Cases ***
Transaccion MB52 - Validar Stock SAP
# Inserta: Código del material - CAV
    abrir_sap
    login_sap
    transaccion_mb52    70047935  C108

Transaccion ME21N - Traslado Material SAP
# Inserta: CAV_origen - Org_compras - grupo_compras - sociedad - codigo_material - cantidad_pedido - CAV_destino
    abrir_sap
    login_sap
    transaccion_me21n    C108  CO06  T13  CO06  70047935  1  C100