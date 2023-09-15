*** Settings ***
Resource  ../keywords/abrirSAP.resource
Resource  ../keywords/loginSAP.resource

*** Test Cases ***
PROCESO SAP
    abrir_sap
    login_sap