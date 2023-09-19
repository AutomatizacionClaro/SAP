*** Settings ***
Resource  ../keywords/abrirSAP.resource
Resource  ../keywords/loginSAP.resource
Resource    ../Keywords/transaction_mb52.resource

*** Test Cases ***
PROCESO SAP
    abrir_sap
    login_sap
    transaccion_mb52    70038158  C127