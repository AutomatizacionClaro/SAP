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
RPA Validación y Proceso de traslado del material
    [Arguments]    ${codigoMaterial}
    ...    ${centroOrigenMaterial}    ${orgCompras}    ${grupoCompras}    ${sociedad}
    ...    ${cantidadPedidoMaterial}    ${centroDestinoMaterial}
    RPA.Windows.Send Keys    keys=${transaccionMB52}
    Sleep    1
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    CapturaPantalla
    RPA.SAP.Input Text    ${txtMaterialMb52}    ${codigoMaterial}
    Sleep    1
    RPA.SAP.Input Text    ${txtCentroMb52}    ${centroOrigenMaterial}
    Sleep    1
    RPA.SAP.Click Element    ${btnValidarStock}
    CapturaPantalla
    Sleep    1
    ${txtLibreUtilizacion} =    RPA.SAP.Get Value    ${txtLibreUtilizado}
    IF    ${txtLibreUtilizacion} != "0"
        CANTIDAD_CLICK_ELEMENTO    2    ${btnAtras}
        # INICIO TRASLADO MATERIAL ME21N
        RPA.Windows.Send Keys    keys=${transaccionME21N}
        RPA.SAP.Click Element    ${btnCheckTransaccion}
        CapturaPantalla
        Sleep    2
        # Lista carrito Pedido_traslado
        RPA.SAP.Select From List By Label    ${pedidoTrasladoME21N}    ${pedidoTraslado}
        Sleep    1
        RPA.SAP.Input Text    ${centroSuministradoME21N}    ${centroOrigenMaterial}
        RPA.Windows.Send Keys    keys={ENTER}
        CapturaPantalla
        Sleep    1
        RPA.SAP.Input Text    ${orgCompraME21N}    ${orgCompras}
        Sleep    1
        RPA.SAP.Input Text    ${grupoComprasME21N}    ${grupoCompras}
        Sleep    1
        RPA.SAP.Input Text    ${sociedadME21N}    ${sociedad}
        Sleep    1
        RPA.Windows.Send Keys    keys={ENTER}
        CapturaPantalla
        ${textoOrgCompra} =    RPA.SAP.Get Value    ${valorOrgCompraME21N}
        ${textoGrupoCompra} =    RPA.SAP.Get Value    ${valorGrupoComprasME21N}
        ${textoSociedad} =    RPA.SAP.Get Value    ${valorSociedadME21N}
        RPA.SAP.Input Text    ${filaCodigoMaterial}    ${codigoMaterial}
        Sleep    1
        RPA.SAP.Input Text    ${filaCantidadPedido}    ${cantidadPedidoMaterial}
        Sleep    1
        RPA.SAP.Input Text    ${filaLote}    ${lote}
        Sleep    1
        RPA.SAP.Input Text    ${filaCavDestino}    ${centroDestinoMaterial}
        Sleep    1
        RPA.SAP.Input Text    ${filaAlmacen}    ${almacen}
        Sleep    1
        RPA.Windows.Send Keys    keys={ENTER}
        CapturaPantalla
        Sleep    2
        ${textoCavDestino} =    RPA.SAP.Get Value    ${filaDireccionCavDestino}
        RPA.SAP.Click Element    ${btnGrabarTransaccion}
        CapturaPantalla
        RPA.Windows.Send Keys    keys={ENTER}
        Sleep    2
        ${txtNumeroPedidoSAP} =    RPA.SAP.Get Value    ${panelNumeroPedidoSAP}
        RPA.Desktop.Press Keys    shift    F5
        CapturaPantalla
        Sleep    2
        ${txtIdNumeroPedidoSAPME21N} =    RPA.SAP.Get Value    ${numIdPedidoSAP}
        RPA.Desktop.Press Keys    alt    F4
        Sleep    1
        # INICIO PEDIDO DE COMPRAS - VL10B
        CANTIDAD_CLICK_ELEMENTO    2    ${btnAtras}
        RPA.Windows.Send Keys    keys=${transaccionVL10B}
        Sleep    1
        RPA.SAP.Click Element    ${btnCheckTransaccion}
        RPA.SAP.Input Text    ${txtPtoExpedicPtoRecepcionVL10B}    ${centroOrigenMaterial}
        Sleep    1
        RPA.SAP.Click Element    ${tablaPedidosComprasVL10B}
        Sleep    1
        RPA.SAP.Input Text    ${txtDocumentoComprasVL10B}    ${txtIdNumeroPedidoSAPME21N}
        RPA.SAP.Click Element    ${btnValidarStock}
        Sleep    1
        RPA.Desktop.Click    coordinates:27,179    click
        RPA.SAP.Click Element    ${btnFondoVL10B}
        Sleep    2
        # Cerrar ventana impresora
        RPA.Desktop.Press Keys    alt    F4
        RPA.SAP.Click Element    ${btnVisualizarSuprimirEntregasVL10B}
         Sleep    2
        RPA.Desktop.Click    coordinates:598,179    click
         Sleep    1
        ${obtenerIdNumeroVL10B} =    RPA.SAP.Get Value    ${idTransaccionVL10B}
        CANTIDAD_CLICK_ELEMENTO    3    ${btnAtras}
        # ENTR. TRASL - VL02N
        RPA.Windows.Send Keys    keys=${transaccionVL02N}
        Sleep    1
        RPA.SAP.Click Element    ${btnCheckTransaccion}
        RPA.SAP.Input Text    ${txtEntregaSalidaVL02N}    ${obtenerIdNumeroVL10B}
        RPA.Windows.Send Keys    keys={ENTER}
        Sleep    1
        RPA.SAP.Click Element    ${tablaResumenPosicionesVL02N}
        Sleep    1
        RPA.SAP.Click Element    ${menuDetallesVL02N} 
        RPA.SAP.Click Element    ${menuDetallesNumeroSerieVL02N}
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
        ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\n\nInicio traslado material - ${transaccionME21N}\n Centro Origen: ${centroOrigenMaterial}\n Org.Compras: ${orgCompras} - ${textoOrgCompra}\n GrupoCompras: ${grupoCompras} - ${textoGrupoCompra}\n Sociedad: ${sociedad} - ${textoSociedad}\n\n Centro Destino: ${centroDestinoMaterial} - ${textoCavDestino}\n CodigoMaterial: ${codigoMaterial}\n CantidadPedidoMaterial: ${cantidadPedidoMaterial}\n\n ${txtNumeroPedidoSAP}\n\n\n Inicio Pedidos De Compras - ${transaccionVL10B}\n Pto.expedic/Pto.recepción: ${centroOrigenMaterial}\n DocumentoCompra: ${txtIdNumeroPedidoSAPME21N}\n\n NÚMERO DOCUMENTO COMERCIAL: ${obtenerIdNumeroVL10B}\n\n\n Entr.Traslado ${obtenerIdNumeroVL10B} - ${transaccionVL02N} 
        ...    encoding=utf-8
        ...    overwrite=True
    ELSE
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
        ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\nMaterial sin STOCK!
        ...    encoding=utf-8
        ...    overwrite=True
        CERRAR_APLICATIVO_SAP
        Sleep    1
    END
