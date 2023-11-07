*** Comments ***
RPA - Proceso de traslado del material a un punto directo
Transacción 1: MB52 - Validación de stock
Transacción 2: ME21N - Inicio traslado del material
Transacción 3: VL10B - Pedidos de compras
Transacción 4: VL02N - Modificar entrega de salida
Transacción 5: MIGO - Entrada de mercancías entrega
Transacción 6: IQ09 -  Visualización número serial


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
rpa - traslado material a un punto directo 
    [Arguments]  ${codigoMaterial}  ${centroOrigenMaterial}   ${orgCompras}    
    ...    ${grupoCompras}  ${sociedad}
    ...    ${cantidadPedidoMaterial}    ${centroDestinoMaterial}
    #Transacción 1: MB52 - Validación de stock
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
    # Validación MB52 validación existencia del material
    IF    ${txtLibreUtilizacion} != "0"
        CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
        # Transacción 2: ME21N - Inicio traslado del material
        RPA.Windows.Send Keys    keys=${transaccionME21N}
        RPA.SAP.Click Element    ${btnCheckTransaccion}
        CapturaPantalla
        Sleep    2
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
        # Validación ME21N pestaña dirección presente si existe
        IF    ${ElementoDireccionPresente} == $True
            RPA.SAP.Click Element    ${opcionDireccionEntregaME21N}
            ${textoCavDestino} =    RPA.SAP.Get Value    ${filaDireccionCavDestino}
            CapturaPantalla
        END
        RPA.SAP.Click Element    ${btnGrabarTransaccion}
        CapturaPantalla
        ${nombreBtnGrabar} =    RPA.SAP.Get Value    ${btnGrabarRetenerME21N}
        # Validación ME21N Grabación de la transacción en caso de error
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
            # Transacción 3: VL10B - Pedidos de compras
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
            RPA.Windows.Send Keys    keys=${transaccionVL10B}
            CapturaPantalla
            Sleep    1
            RPA.SAP.Click Element    ${btnCheckTransaccion}
            RPA.SAP.Input Text    ${txtPtoExpedicPtoRecepcionVL10B}    ${centroOrigenMaterial}
            Sleep    1
            CapturaPantalla
            RPA.SAP.Click Element    ${tablaPedidosComprasVL10B}
            Sleep    1
            RPA.SAP.Input Text    ${txtDocumentoComprasVL10B}    ${txtIdNumeroPedidoSAPME21N}
            RPA.SAP.Click Element    ${btnValidarStock}
            CapturaPantalla
            Sleep    1
            RPA.Desktop.Click    coordinates:27,179    click
            RPA.SAP.Click Element    ${btnFondoVL10B}
            Sleep    2
            # Cerrar ventana impresora
            RPA.Desktop.Press Keys    alt    F4
            RPA.SAP.Click Element    ${btnVisualizarSuprimirEntregasVL10B}
            CapturaPantalla
            Sleep    2
            RPA.Desktop.Click    coordinates:598,179    click
            Sleep    1
            ${obtenerIdNumeroVL10B} =    RPA.SAP.Get Value    ${idTransaccionVL10B}
            CapturaPantalla
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    3    ${btnAtras}
            # Transacción 4: VL02N - Modificar entrega de salida
            RPA.Windows.Send Keys    keys=${transaccionVL02N}
            Sleep    1
            CapturaPantalla
            RPA.SAP.Click Element    ${btnCheckTransaccion}
            RPA.SAP.Input Text    ${txtEntregaSalidaVL02N}    ${obtenerIdNumeroVL10B}
            CapturaPantalla
            RPA.Windows.Send Keys    keys={ENTER}
            Sleep    1
            RPA.Desktop.Click    coordinates:32,379    click
            CapturaPantalla
            CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP   1   up
            CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP   12  tab
            RPA.Desktop.Type Text  ${almacen}
            CapturaPantalla
            RPA.Windows.Send Keys    keys={ENTER}  
            Sleep    1
            RPA.SAP.Click Element   ${menuDetallesVL02N} 
            RPA.SAP.Click Element   ${menuDetallesNumeroSerieVL02N}
            CapturaPantalla
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
            # Transacción 5: MIGO - Entrada de mercancías entrega
            RPA.Windows.Send Keys    keys=${transaccionMIGO}
            CapturaPantalla
            Sleep    1
            RPA.SAP.Click Element    ${btnCheckTransaccion}
            Sleep    1
            RPA.SAP.Select From List By Label    ${cmbEntregaSalidaMercanciaMIGO}    ${entradaMercanciasMigo}
            Sleep    1
            RPA.SAP.Select From List By Label    ${cmbEntregaMIGO}    ${entregaMigo}
            Sleep    1
            RPA.SAP.Input Text    ${txtNumeroVL02NMIGO}    ${numeroEntregaVL02N}
            CapturaPantalla
            RPA.Windows.Send Keys    keys={ENTER}
            Sleep    1
            RPA.SAP.Click Element    ${menuNumeroSerieMIGO}
            CapturaPantalla
            Sleep    1
            RPA.SAP.Select Checkbox    ${chPosicionOkMIGO}
            Sleep    1
            RPA.SAP.Click Element    ${btnContabilizarMIGO}
            ${numDocumentoMaterialMigo} =        RPA.SAP.Get Value    ${numeroDocumentoMaterialMIGO}
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    1    ${btnAtras}
            # Transacción 6: IQ09 -  Visualización número serial
            RPA.Windows.Send Keys    keys=${transaccionIQ09}
            CapturaPantalla
            Sleep    1
            RPA.SAP.Click Element    ${btnCheckTransaccion}
            Sleep    1
            RPA.SAP.Click Element    ${btnNumeroSerieIQ09}
            RPA.Excel.Files.Open Workbook    ${pathExcel}
            ${row}=    RPA.Excel.Files.Read Worksheet    header=true
            ${next}=    RPA.Excel.Files.Find Empty Row
            Log    ${row}    console=True
            FOR    ${counter}    IN RANGE    2    ${next}
                ${column}=    RPA.Excel.Files.Get cell value    ${counter}    A
                RPA.SAP.Input Text    /app/con[0]/ses[0]/wnd[1]/usr/tabsTAB_STRIP/tabpSIVA/ssubSCREEN_HEADER:SAPLALDB:3010/tblSAPLALDBSINGLE/txtRSCSEL_255-SLOW_I[1,${counter-2}]      ${column}
            END
            CapturaPantalla
            Sleep    1
            RPA.SAP.Click Element    ${btnGuardarNumerosSerieIQ09}
            Sleep    1
            RPA.SAP.Click Element    ${btnValidarStock}
            Sleep    1
            CapturaPantalla
            CANTIDAD_CLICK_ELEMENTO_RPA_SAP    2    ${btnAtras}
            RPA.FileSystem.Create File
            ...    ..\\SAP\\Resources\\rpa_validacion_traslado.txt
            ...    content=Validación Stock traslado - ${transaccionMB52}\n CódigoMaterial: ${codigoMaterial}\n CAV: ${centroOrigenMaterial}\n LibreUtilización: ${txtLibreUtilizacion}\n\n\nInicio traslado material - ${transaccionME21N}\n Centro Origen: ${centroOrigenMaterial}\n Org.Compras: ${orgCompras} - ${textoOrgCompra}\n GrupoCompras: ${grupoCompras} - ${textoGrupoCompra}\n Sociedad: ${sociedad} - ${textoSociedad}\n\n Centro Destino: ${centroDestinoMaterial} - ${textoCavDestino}\n CodigoMaterial: ${codigoMaterial}\n CantidadPedidoMaterial: ${cantidadPedidoMaterial}\n\n ${txtNumeroPedidoSAP}\n\n\n Inicio Pedidos De Compras - ${transaccionVL10B}\n Pto.expedic/Pto.recepción: ${centroOrigenMaterial}\n DocumentoCompra: ${txtIdNumeroPedidoSAPME21N}\n\n NÚMERO DOCUMENTO COMERCIAL: ${obtenerIdNumeroVL10B}\n\n\n Entr.Traslado ${obtenerIdNumeroVL10B} - ${transaccionVL02N}\n ${txtNumeroTrasladoVL02N}\n\n\n Transacción ${transaccionMIGO}\n ${numDocumentoMaterialMigo}
            ...    encoding=utf-8
            ...    overwrite=True
            CERRAR_APLICATIVO_SAP
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
