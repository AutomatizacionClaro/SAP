*** Comments ***
Validación stock del material transacción MB52


*** Settings ***
Library     RPA.SAP
Library     RPA.Windows
Library     RPA.Desktop
Library     RPA.FileSystem
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource


*** Keywords ***
transaccion_mb52
    [Arguments]    ${codigoMaterial}    ${centroCAV}
    TRY
        RPA.Windows.Send Keys    keys=${transaccionMB52}
        Sleep    1
        CapturaPantalla
        RPA.SAP.Click Element    ${btnCheckTransaccion}
        RPA.SAP.Input Text    ${txtMaterialMb52}    ${codigoMaterial}
        Sleep    1
        RPA.SAP.Input Text    ${txtCentroMb52}    ${centroCAV}
        CapturaPantalla
        Sleep    1
        RPA.SAP.Click Element    ${btnValidarStock}
        CapturaPantalla
        Sleep    2
        ${txtLibreUtilizacion}=    RPA.SAP.Get Value    ${txtLibreUtilizado}
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\transaccion_mb52.txt
        ...    content=Transacción MB52 - Validación de Stock\n\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroCAV}\n LibreUtilización: ${txtLibreUtilizacion}
        ...    encoding=utf-8
        ...    overwrite=True
        CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
        CERRAR_APLICATIVO_SAP
    EXCEPT
        ${labelPanelSap}=    RPA.SAP.Get Value    ${panelNumeroPedidoSAP}
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\transaccion_mb52.txt
        ...    content=Transacción MB52 - Validación de Stock\n\n Error en la ejecución, ${labelPanelSap}
        ...    encoding=utf-8
        ...    overwrite=True
        CERRAR_APLICATIVO_SAP
    END
