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
    [Arguments]    ${cavOrigen}  ${idPedidoMB52}
    RPA.Windows.Send Keys        keys=${transaccionVL10B}
    RPA.SAP.Click Element        ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtPtoExpedicPtoRecepcionVL10B}    ${cavOrigen}
    Sleep    1
    RPA.SAP.Click Element    ${tablaPedidosComprasVL10B}
    Sleep    1
    RPA.SAP.Input Text    ${txtDocumentoComprasVL10B}    ${idPedidoMB52}
    RPA.SAP.Click Element    ${btnValidarStock}
