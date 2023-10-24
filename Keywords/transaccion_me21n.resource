*** Comments ***
Inicio traslado del material transacción ME21N


*** Settings ***
Library     RPA.SAP
Library     RPA.Windows
Library     RPA.FileSystem
Library     RPA.Desktop
Library     RPA.RobotLogListener
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource


*** Keywords ***
transaccion_me21n
    [Arguments]    ${centroOrigenMaterial}    ${orgCompras}    ${grupoCompras}    ${sociedad}
    ...    ${codigoMaterial}    ${cantidadPedidoMaterial}    ${centroDestinoMaterial}
    RPA.Windows.Send Keys    keys=${transaccionME21N}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    CapturaPantalla
    Sleep    2
    # Lista carrito Pedido_traslado
    RPA.SAP.Select From List By Label    ${pedidoTrasladoME21N}    ${pedidoTraslado}
    RPA.SAP.Input Text    ${centroSuministradoME21N}    ${centroOrigenMaterial}
    CapturaPantalla
    Sleep    1
    RPA.Windows.Send Keys    keys={ENTER}
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
    CapturaPantalla
    Sleep    1
    RPA.SAP.Input Text    ${filaCavDestino}    ${centroDestinoMaterial}
    Sleep    1
    RPA.SAP.Input Text    ${filaAlmacen}    ${almacen}
    Sleep    1
    RPA.Windows.Send Keys    keys={ENTER}
    Sleep    2
    ${ElementoPresente} =    Run Keyword And Return Status
    ...    Element Should Be Present
    ...    ${opcionDireccionEntregaME21N}
    IF    ${ElementoPresente} == $True
        RPA.SAP.Click Element    ${opcionDireccionEntregaME21N}
        ${textoCavDestino} =    RPA.SAP.Get Value    ${filaDireccionCavDestino}
        CapturaPantalla
    END
    RPA.SAP.Click Element    ${btnGrabarTransaccion}
    ${GrabarElementoErroneo} =    Run Keyword And Return Status
    ...    Element Should Be Present
    ...    ${btnGrabarRetenerME21N}
    IF    ${GrabarElementoErroneo} == $True
        RPA.SAP.Click Element    ${btnGrabarTratarME21N}
        CapturaPantalla
        Sleep    2
        RPA.SAP.Click Element    ${btnGrabarTratarAceptarME21N}
        Sleep    1
        CapturaPantalla
        CERRAR_APLICATIVO_SAP
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\transaccion_me21n.txt
        ...    content=Transacción ME21N - Traslado material de un CAV a un punto directo\n\n FALLIDO!
        ...    encoding=utf-8
        ...    overwrite=True
    ELSE
        CapturaPantalla
        Sleep    1
        RPA.Windows.Send Keys    keys={ENTER}
        CapturaPantalla
        Sleep    2
        ${txtNumeroPedidoSAP} =    RPA.SAP.Get Value    ${panelNumeroPedidoSAP}
        RPA.Desktop.Press Keys    shift    F5
        CapturaPantalla
        Sleep    1
        ${txtIdNumeroPedidoSAP} =    RPA.SAP.Get Value    ${numIdPedidoSAP}
        Log    ${txtIdNumeroPedidoSAP}    console=True
        Sleep    1
        RPA.FileSystem.Create File
        ...    ..\\SAP\\Resources\\transaccion_me21n.txt
        ...    content=Transacción ME21N - Traslado material de un CAV a un punto directo\n\n Centro Origen: ${centroOrigenMaterial}\n Org.Compras: ${orgCompras} - ${textoOrgCompra}\n GrupoCompras: ${grupoCompras} - ${textoGrupoCompra}\n Sociedad: ${sociedad} - ${textoSociedad}\n\n Centro Destino: ${centroDestinoMaterial} - ${textoCavDestino}\n CodigoMaterial: ${codigoMaterial}\n CantidadPedidoMaterial: ${cantidadPedidoMaterial}\n\n Ejecución exitosa!\n\n ${txtNumeroPedidoSAP}
        ...    encoding=utf-8
        ...    overwrite=True
        RPA.Desktop.Press Keys    alt    F4
        CapturaPantalla
        Sleep    1
        CANTIDAD_CLICK_ELEMENTO    2    ${btnAtras}
        CERRAR_APLICATIVO_SAP
    END
