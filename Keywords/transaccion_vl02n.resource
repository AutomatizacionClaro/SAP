*** Comments ***
Validación stock material transacción MB52
Inicio traslado del material transacción ME21N
Pedido de compras transacción VL10B


*** Settings ***
Library     RPA.SAP
Library     RPA.Windows
Library     RPA.FileSystem
Library     RPA.Desktop
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource


*** Keywords ***
transaccion_vl02n
    RPA.Windows.Send Keys    keys=${transaccionVL02N}
    Sleep    1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtEntregaSalidaVL02N}    2101621270
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
