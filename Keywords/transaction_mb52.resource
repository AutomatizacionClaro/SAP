# Validación stock del material transacción MB52

*** Settings ***
Library  RPA.SAP
#Library  WhiteLibrary
Library  RPA.Windows
Library    Screenshot    ..\\SAP\\Images
Library    RPA.JavaAccessBridge
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource

*** Keywords ***
transaccion_mb52
    [Arguments]    ${codigoMaterial} 
    RPA.Windows.Send Keys    keys=${transaccionMB52}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtMaterialMb52}    ${codigoMaterial}
    RPA.SAP.Click Element    ${btnValidarStock}
    