*** Settings ***
Library     RPA.SAP
Library     RPA.Windows
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource


*** Keywords ***
login_sap
    FOR    ${Conteo}    IN RANGE    0    99999999
        ${Login}=    Run Keyword And Return Status    RPA.SAP.Connect To Session
        IF    ${Login}== True    BREAK
    END
    RPA.SAP.Open Connection    SAP EQA
    RPA.SAP.Input Text    ${nvaLoginSAP}${txtUsuario}    ${usuarioSAP}
    CapturaPantalla
    RPA.SAP.Input Password    ${nvaLoginSAP}${txtClave}    ${claveSAP}
    CapturaPantalla
    RPA.SAP.Click Element    ${nvaLoginSAP}${btnLogin}
    ${ElementoPresente}=    Run Keyword And Return Status    Element Should Be Present    ${vnaSesionAbierta}
    IF    ${ElementoPresente} == $True
        CapturaPantalla
        RPA.SAP.Select Radio Button    ${vnaSesionAbierta}${rbtnOpcionDos}
        CapturaPantalla
        RPA.SAP.Click Element    ${vnaSesionAbierta}${btnCheckOK}
        CapturaPantalla
    END
