*** Comments ***
# Validación stock material transacción MB52
# Validación traslado del material transacción ME21N


*** Settings ***
Library     RPA.SAP
# Library    WhiteLibrary
Library     RPA.Windows
Library     Screenshot    ..\\SAP\\Images
Library     RPA.FileSystem
Library     RPA.Desktop
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource


*** Keywords ***
RPA Validación y Traslado del material
    [Arguments]    ${codigoMaterial}
    ...    ${centroOrigenMaterial}    ${orgCompras}    ${grupoCompras}    ${sociedad}
    ...    ${cantidadPedidoMaterial}    ${centroDestinoMaterial}
    RPA.Windows.Send Keys    keys=${transaccionMB52}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    RPA.SAP.Input Text    ${txtMaterialMb52}    ${codigoMaterial}
    RPA.SAP.Input Text    ${txtCentroMb52}    ${centroOrigenMaterial}
    RPA.SAP.Click Element    ${btnValidarStock}
    ${txtLibreUtilizacion} =    RPA.SAP.Get Value    ${txtLibreUtilizado}
    IF    ${txtLibreUtilizacion} != "0"
        CANTIDAD_CLICK_ELEMENTO    2    ${btnAtras}
        # INICIO TRASLADO MATERIAL
        RPA.Windows.Send Keys    keys=${transaccionME21N}
        RPA.SAP.Click Element    ${btnCheckTransaccion}
        Sleep    2
        # Lista carrito Pedido_traslado
        RPA.SAP.Select From List By Label    ${pedidoTrasladoME21N}    ${pedidoTraslado}
        RPA.SAP.Input Text    ${centroSuministradoME21N}    ${centroOrigenMaterial}    # C108
        RPA.Windows.Send Keys    keys={ENTER}
        RPA.SAP.Input Text    ${orgCompraME21N}    ${orgCompras}    # CO06
        Sleep    1
        RPA.SAP.Input Text    ${grupoComprasME21N}    ${grupoCompras}    # T13
        Sleep    1
        RPA.SAP.Input Text    ${sociedadME21N}    ${sociedad}    # CO06
        RPA.Windows.Send Keys    keys={ENTER}
        ${textoOrgCompra} =    RPA.SAP.Get Value    ${valorOrgCompraME21N}
        ${textoGrupoCompra} =    RPA.SAP.Get Value    ${valorGrupoComprasME21N}
        ${textoSociedad} =    RPA.SAP.Get Value    ${valorSociedadME21N}
        RPA.SAP.Input Text    ${filaCodigoMaterial}    ${codigoMaterial}    # 70047935
        RPA.SAP.Input Text    ${filaCantidadPedido}    ${cantidadPedidoMaterial}    # 1
        RPA.SAP.Input Text    ${filaLote}    ${lote}
        RPA.SAP.Input Text    ${filaCavDestino}    ${centroDestinoMaterial}    # C100
        RPA.SAP.Input Text    ${filaAlmacen}    ${almacen}
        RPA.Windows.Send Keys    keys={ENTER}
        Sleep    3
        ${textoCavDestino} =    RPA.SAP.Get Value    ${filaDireccionCavDestino}
        RPA.SAP.Click Element    ${btnGrabarTransaccion}
        RPA.Windows.Send Keys    keys={ENTER}
        Sleep    2
        ${txtNumeroPedidoSAP} =    RPA.SAP.Get Value    ${panelNumeroPedidoSAP}
        RPA.Desktop.Press Keys    shift    F5
        Sleep    1
        ${txtIdNumeroPedidoSAP} =    RPA.SAP.Get Value    ${numIdPedidoSAP}
        Log    ${txtIdNumeroPedidoSAP}    console=True
        Sleep    1
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
        ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\n\nInicio traslado material - ${transaccionME21N}\n Centro Origen: ${centroOrigenMaterial}\n Org.Compras: ${orgCompras} - ${textoOrgCompra}\n GrupoCompras: ${grupoCompras} - ${textoGrupoCompra}\n Sociedad: ${sociedad} - ${textoSociedad}\n\n Centro Destino: ${centroDestinoMaterial} - ${textoCavDestino}\n CodigoMaterial: ${codigoMaterial}\n CantidadPedidoMaterial: ${cantidadPedidoMaterial}\n\n Ejecución exitosa!\n\n ${txtNumeroPedidoSAP}
        ...    encoding=utf-8
        ...    overwrite=True
    END
