*** Comments ***
Transacción VL02N
Esta transacción es la continuación de la transaccion VL10B
genera un ID


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
vl02n - entrada traslado
    [Arguments]    ${idVL10B}
    RPA.Windows.Send Keys    keys=${transaccionVL02N}
    Sleep    1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtEntregaSalidaVL02N}    ${idVL10B}
    RPA.Windows.Send Keys    keys={ENTER}
    Sleep    1
    RPA.Desktop.Click    coordinates:32,379    click
    CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP    1    up
    CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP    12    tab
    RPA.Desktop.Type Text    ${almacen}
    RPA.Windows.Send Keys    keys={ENTER}
    Sleep    1
    RPA.SAP.Click Element   ${menuDetallesVL02N} 
    RPA.SAP.Click Element   ${menuDetallesNumeroSerieVL02N}
    RPA.Excel.Files.Open Workbook    ${pathExcel}
    ${row}=    RPA.Excel.Files.Read Worksheet    header=true
    ${next}=    RPA.Excel.Files.Find Empty Row
    Log    ${row}    console=True
    FOR    ${counter}    IN RANGE    2    ${next}
        ${column}=    RPA.Excel.Files.Get cell value    ${counter}    A
        RPA.SAP.Input Text    /app/con[0]/ses[0]/wnd[1]/usr/tblSAPLIPW1TC_SERIAL_NUMBERS/ctxtRIPW0-SERNR[0,${counter-2}]      ${column}
    END
    RPA.Excel.Files.Close Workbook
    CapturaPantalla
    RPA.SAP.Click Element    ${btnGrabarNumeroSerieVL02N}
    Sleep    1
    RPA.SAP.Click Element    ${btnContabilizarSimVL02N}
    CapturaPantalla
    Sleep    1
    # Cerrar ventana impresora
    RPA.Desktop.Press Keys    alt    F4
    Sleep    1
    ${txtNumeroTrasladoVL02N} =    RPA.SAP.Get Value    ${panelNumeroPedidoSAP}
    ${numeroEntregaVL02N} =        RPA.SAP.Get Value    ${numeroEntregaSalidaVL02N}
    CapturaPantalla
    CANTIDAD_CLICK_ELEMENTO_RPA_SAP    1    ${btnAtras}
    CERRAR_APLICATIVO_SAP
    

