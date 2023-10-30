*** Comments ***
Validación pedidos de compras, visual.rápida


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
transaccion_vl10b
    [Arguments]    ${cavOrigen}    ${idPedidoMB52}
    RPA.Windows.Send Keys    keys=${transaccionVL10B}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtPtoExpedicPtoRecepcionVL10B}    ${cavOrigen}
    Sleep    1
    RPA.SAP.Click Element    ${tablaPedidosComprasVL10B}
    Sleep    1
    RPA.SAP.Input Text    ${txtDocumentoComprasVL10B}    ${idPedidoMB52}
    RPA.SAP.Click Element    ${btnValidarStock}
    RPA.Desktop.Click    coordinates:27,179    click
    Sleep    1
    RPA.SAP.Click Element    ${btnFondoVL10B}
    Sleep    2
    # Cerrar ventana impresora
    RPA.Desktop.Press Keys    alt    F4
    RPA.SAP.Click Element    ${btnVisualizarSuprimirEntregasVL10B}
    Sleep    2
    RPA.Desktop.Click    coordinates:598,179    click
    Sleep    1
    ${obtenerIdNumeroVL10B} =    RPA.SAP.Get Value    ${idTransaccionVL10B}
    CANTIDAD_CLICK_ELEMENTO_RPA_SAP    3    ${btnAtras}
    CERRAR_APLICATIVO_SAP
