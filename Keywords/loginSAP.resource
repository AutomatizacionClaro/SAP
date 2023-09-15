*** Settings ***
Library  RPA.SAP
Library  WhiteLibrary
Library    Screenshot    ..\\SAP\\Images
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource

*** Keywords ***
login_sap
    
    WhiteLibrary.Launch Application   saplogon.exe
    Screenshot
    FOR  ${Conteo}  IN RANGE  0  99999999
        ${Login}=  Run Keyword And Return Status  RPA.SAP.Connect To Session
        Exit For Loop If    ${Login}== True
    END
    RPA.SAP.Open Connection  SAP    
    RPA.SAP.Input Text  ${nvaLoginSAP}${txtUsuario}  ${usuarioSAP}
    Screenshot
    RPA.SAP.Input Password  ${nvaLoginSAP}${txtClave}  ${claveSAP}
    Screenshot
    RPA.SAP.Click Element  ${nvaLoginSAP}${btnLogin}
    Screenshot
    RPA.SAP.Select Radio Button  ${vnaSesionAbierta}${rbtnOpcionDos}
    Screenshot
    RPA.SAP.Click Element  ${vnaSesionAbierta}${btnCheckOK}
    Screenshot
    