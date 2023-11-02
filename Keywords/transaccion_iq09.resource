*** Comments ***
Validación stock material transacción MB52
Inicio traslado del material transacción ME21N
Pedido de compras transacción VL10B


*** Settings ***
Library     RPA.SAP
Library     RPA.Windows
Library     RPA.FileSystem
Library     RPA.Desktop
Library     RPA.Tables
Library     RPA.Excel.Files
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource


*** Keywords ***
transaccion_iq09
    RPA.Windows.Send Keys    keys=${transaccionIQ09}
    Sleep    1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    CapturaPantalla
    Sleep    1
    RPA.SAP.Input Text    ${materialIq09}    70048876
    RPA.SAP.Input Text    ${txtStatusInclusivoIq09}    ${statusInclusivoIsq09}
    RPA.SAP.Input Text    ${txtCentroIq09}    C108
    RPA.SAP.Input Text    ${txtAlmacenIq09}    H001
    RPA.SAP.Click Element    ${btnValidarStock}
    CapturaPantalla
    Sleep    1
    # CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP    5    tab
    # ${numeroSerieImei}=    RPA.SAP.Get Element Location    ${tablaIdIq09}
    # ${numeroSerieImeiDos}=    RPA.SAP.Get Element Type    ${tablaIdIq09}
    # Log    ${numeroSerieImei}    console=True
    # Log    ${numeroSerieImeiDos}    console=True
    # RPA.FileSystem.Read File    path

    # ${numeroDeSerie}=    RPA.SAP.Get Cell Value    ${tablaIdIq09}    2    5
    # Log    ${numeroDeSerie}    console=True
