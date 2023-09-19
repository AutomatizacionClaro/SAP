*** Settings ***
Resource  ../keywords/abrirSAP.resource
Resource  ../keywords/loginSAP.resource
Resource    ../Keywords/transaction_mb52.resource
Resource    ../Keywords/transaccion_me21n.resource

*** Test Cases ***
Transaccion MB52 - Validar Stock SAP
    abrir_sap
    login_sap
    transaccion_mb52    70038158  C127

Transaccion ME21N - Traslado Material SAP
    abrir_sap
    login_sap
    transaccion_me21n