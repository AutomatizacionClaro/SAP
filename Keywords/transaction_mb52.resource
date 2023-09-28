# Validación stock del material transacción MB52

*** Settings ***
Library     RPA.SAP
#Library  WhiteLibrary
Library     RPA.Windows
Library     RPA.Desktop
Library     RPA.FileSystem
Library     Screenshot    ..\\SAP\\Images
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource

*** Keywords ***
transaccion_mb52
    [Arguments]    ${codigoMaterial}  ${centroCAV}
    RPA.Windows.Send Keys    keys=${transaccionMB52}
    Sleep  1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtMaterialMb52}    ${codigoMaterial}
    Sleep  1
    RPA.SAP.Input Text    ${txtCentroMb52}    ${centroCAV}
    Sleep  1
    RPA.SAP.Click Element    ${btnValidarStock}
    Sleep  2
    ${txtLibreUtilizacion}=  RPA.SAP.Get Value  ${txtLibreUtilizado}
    #RPA.Desktop.Press Keys  alt  F4
    RPA.FileSystem.Create File    ..\\SAP\\Resources\\transaccion_mb52.txt    
    ...    content=Transacción MB52 - Validación de Stock\n\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroCAV}\n LibreUtilización: ${txtLibreUtilizacion}     
    ...    encoding=utf-8    overwrite=True
    CANTIDAD_CLICK_ELEMENTO    2    ${btnAtras}
    CERRAR_APLICATIVO_SAP
    