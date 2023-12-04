*** Comments ***
Transacción IQ09
Esta transacción permite realizar un filtro de todas las propiedades del material
ejemplo: centro origen, almacen, imei, etc.


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
iq09 - validacion material
    [Arguments]    ${codigoMaterial}    ${cavOrigen}
    RPA.Windows.Send Keys    keys=${transaccionIQ09}
    Sleep    1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    CapturaPantalla
    Sleep    1
    RPA.SAP.Input Text    ${materialIq09}    ${codigoMaterial}
    RPA.SAP.Input Text    ${txtStatusInclusivoIq09}    ${statusInclusivoIsq09}
    RPA.SAP.Input Text    ${txtCentroIq09}    ${cavOrigen}
    RPA.SAP.Input Text    ${txtAlmacenIq09}    ${almacen}
    RPA.SAP.Click Element    ${btnValidarStock}
    CapturaPantalla
    Sleep    1
    CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
    CERRAR_APLICATIVO_SAP

iq09 - confirmacion imeis excel
    RPA.Windows.Send Keys    keys=${transaccionIQ09}
    CapturaPantalla
    Sleep    1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    Sleep    1
    RPA.SAP.Click Element    ${btnNumeroSerieIQ09}
    RPA.Excel.Files.Open Workbook    ${pathExcel}
    ${row}=    RPA.Excel.Files.Read Worksheet    header=true
    ${next}=    RPA.Excel.Files.Find Empty Row
    FOR    ${counter}    IN RANGE    3    ${next}
        ${column}=    RPA.Excel.Files.Get cell value    ${counter}    A
        RPA.SAP.Input Text
        ...    /app/con[0]/ses[0]/wnd[1]/usr/tabsTAB_STRIP/tabpSIVA/ssubSCREEN_HEADER:SAPLALDB:3010/tblSAPLALDBSINGLE/txtRSCSEL_255-SLOW_I[1,${counter-3}]
        ...    ${column}
    END
    CapturaPantalla
    Sleep    1
    RPA.SAP.Click Element    ${btnGuardarNumerosSerieIQ09}
    Sleep    1
    RPA.SAP.Click Element    ${btnValidarStock}
    Sleep    1
    CapturaPantalla
    CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
    CERRAR_APLICATIVO_SAP
