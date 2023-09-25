# Validación stock del material transacción MB52

*** Settings ***
Library     RPA.SAP
#Library  WhiteLibrary
Library     RPA.Windows
Library     RPA.FileSystem
Library     Screenshot    ..\\SAP\\Images
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource

*** Keywords ***
transaccion_mb52
    [Arguments]    ${codigoMaterial}  ${centroCAV}
    RPA.Windows.Send Keys    keys=${transaccionMB52}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtMaterialMb52}    ${codigoMaterial}
    RPA.SAP.Input Text    ${txtCentroMb52}    ${centroCAV}
    RPA.SAP.Click Element    ${btnValidarStock}
    Sleep  2
    ${txtLibreUtilizacion}=  RPA.SAP.Get Value  ${txtLibreUtilizado}
    RPA.FileSystem.Create File    ..\\SAP\\Resources\\transaccion_mb52.txt    
    ...    content=Transacción MB52 - Validación de Stock\n\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroCAV}\n LibreUtilización: ${txtLibreUtilizacion}     
    ...    encoding=utf-8    overwrite=True
    RPA.Windows.Close Current Window
    