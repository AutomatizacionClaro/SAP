*** Settings ***
Library  RPA.SAP
#Library  WhiteLibrary
Library  RPA.Windows
Library    Screenshot    ..\\SAP\\Images
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource

*** Keywords ***
login_sap
    #Screenshot
    FOR  ${Conteo}  IN RANGE  0  99999999
        ${Login}=  Run Keyword And Return Status  RPA.SAP.Connect To Session
        Exit For Loop If    ${Login}== True
    END
    RPA.SAP.Open Connection  SAP EQA
    RPA.SAP.Input Text  ${nvaLoginSAP}${txtUsuario}  ${usuarioSAP}
    #Screenshot
    RPA.SAP.Input Password  ${nvaLoginSAP}${txtClave}  ${claveSAP}
    #Screenshot
    RPA.SAP.Click Element  ${nvaLoginSAP}${btnLogin}
    # Validación segunda autenticación -- realiza el cambio Alejo
    IF    ${True}
    RPA.SAP.Select Radio Button  ${vnaSesionAbierta}${rbtnOpcionDos}
    RPA.SAP.Click Element  ${vnaSesionAbierta}${btnCheckOK}
    ELSE
    Log     No realiza segunda validación autenticación login SAP    console=True
    END
    #Screenshot  
    #Screenshot
    #Screenshot

    