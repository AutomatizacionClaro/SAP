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
        CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
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
        ${ElementoDireccionPresente} =    Run Keyword And Return Status
        ...    Element Should Be Present
        ...    ${opcionDireccionEntregaME21N}
        IF    ${ElementoDireccionPresente} == $True
            RPA.SAP.Click Element    ${opcionDireccionEntregaME21N}
            ${textoCavDestino} =    RPA.SAP.Get Value    ${filaDireccionCavDestino}
            CapturaPantalla
        END
        RPA.SAP.Click Element    ${btnGrabarTransaccion}
        CapturaPantalla
        ${nombreBtnGrabar} =    RPA.SAP.Get Value    ${btnGrabarRetenerME21N}
        IF    "${nombreBtnGrabar}" == "Reten."
            RPA.SAP.Click Element    ${btnGrabarTratarME21N}
            CapturaPantalla
            Sleep    2
            RPA.SAP.Click Element    ${btnGrabarTratarAceptarME21N}
            Sleep    1
            CapturaPantalla
            CERRAR_APLICATIVO_SAP
            RPA.FileSystem.Create File
            ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
            ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\n\nInicio traslado material - ${transaccionME21N}\n\n FALLIDO!
            ...    encoding=utf-8
            ...    overwrite=True
        ELSE
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
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
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
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    3    ${btnAtras}
            # ENTR. TRASL - VL02N
            RPA.Windows.Send Keys    keys=${transaccionVL02N}
            Sleep    1
            RPA.SAP.Click Element    ${btnCheckTransaccion}
            RPA.SAP.Input Text    ${txtEntregaSalidaVL02N}    ${obtenerIdNumeroVL10B}
            RPA.Windows.Send Keys    keys={ENTER}
            Sleep    1
            RPA.Desktop.Click    coordinates:32,379    click
            CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP   1   up
            CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP   12  tab
            RPA.Desktop.Type Text  ${almacen}
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
            RPA.SAP.Click Element    ${btnGrabarNumeroSerieVL02N}
            Sleep    1
            RPA.SAP.Click Element    ${btnContabilizarSimVL02N}
            Sleep    1
            # Cerrar ventana impresora
            RPA.Desktop.Press Keys    alt    F4
            Sleep    1
            ${txtNumeroTrasladoVL02N} =    RPA.SAP.Get Value    ${panelNumeroPedidoSAP}
            ${numeroEntregaVL02N} =        RPA.SAP.Get Value    ${numeroEntregaSalidaVL02N}
            Log    ${numeroEntregaVL02N}    console=True
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    1    ${btnAtras}
            # ENTR. TRASL - MIGO
            RPA.Windows.Send Keys    keys=${transaccionMIGO}
            Sleep    1
            RPA.SAP.Click Element    ${btnCheckTransaccion}
            Sleep    1
            RPA.SAP.Select From List By Label    ${cmbEntregaSalidaMercanciaMIGO}    ${entradaMercanciasMigo}
            Sleep    1
            RPA.SAP.Select From List By Label    ${cmbEntregaMIGO}    ${entregaMigo}
            Sleep    1
            RPA.SAP.Input Text    ${txtNumeroVL02NMIGO}    ${numeroEntregaVL02N}
            RPA.Windows.Send Keys    keys={ENTER}
            Sleep    1
            RPA.SAP.Click Element    ${menuNumeroSerieMIGO}
            Sleep    1
            RPA.SAP.Select Checkbox    ${chPosicionOkMIGO}
            Sleep    1
            RPA.SAP.Click Element    ${btnContabilizarMIGO}
            ${numDocumentoMaterialMigo} =        RPA.SAP.Get Value    ${numeroDocumentoMaterialMIGO}
            RPA.FileSystem.Create File
            ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
            ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\n\nInicio traslado material - ${transaccionME21N}\n Centro Origen: ${centroOrigenMaterial}\n Org.Compras: ${orgCompras} - ${textoOrgCompra}\n GrupoCompras: ${grupoCompras} - ${textoGrupoCompra}\n Sociedad: ${sociedad} - ${textoSociedad}\n\n Centro Destino: ${centroDestinoMaterial} - ${textoCavDestino}\n CodigoMaterial: ${codigoMaterial}\n CantidadPedidoMaterial: ${cantidadPedidoMaterial}\n\n ${txtNumeroPedidoSAP}\n\n\n Inicio Pedidos De Compras - ${transaccionVL10B}\n Pto.expedic/Pto.recepción: ${centroOrigenMaterial}\n DocumentoCompra: ${txtIdNumeroPedidoSAPME21N}\n\n NÚMERO DOCUMENTO COMERCIAL: ${obtenerIdNumeroVL10B}\n\n\n Entr.Traslado ${obtenerIdNumeroVL10B} - ${transaccionVL02N}\n ${txtNumeroTrasladoVL02N}\n\n\n Transacción ${transaccionMIGO}\n ${numDocumentoMaterialMigo}
            ...    encoding=utf-8
            ...    overwrite=True
        END
    ELSE
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
        ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\nMaterial sin STOCK!
        ...    encoding=utf-8
        ...    overwrite=True
        CERRAR_APLICATIVO_SAP
        Sleep    1
    END
