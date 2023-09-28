# Validación traslado del material transacción ME21N

*** Settings ***
Library     RPA.SAP
#Library  WhiteLibrary
Library     RPA.Windows
Library     Screenshot    ..\\SAP\\Images
Library     RPA.FileSystem
Library     RPA.Desktop
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource
Resource    ../Utils/funciones.resource

*** Keywords ***

transaccion_me21n
     [Arguments]    ${centroOrigenMaterial}  ${orgCompras}  ${grupoCompras}  ${sociedad}    
     ...  ${codigoMaterial}  ${cantidadPedidoMaterial}  ${centroDestinoMaterial}
    RPA.Windows.Send Keys    keys=${transaccionME21N}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    Sleep    2
    # Lista carrito Pedido_traslado
    RPA.SAP.Select From List By Label    ${pedidoTrasladoME21N}    ${pedidoTraslado}
    RPA.SAP.Input Text    ${centroSuministradoME21N}  ${centroOrigenMaterial}   #C108
    Sleep    1  
    RPA.Windows.Send Keys    keys={ENTER} 
    RPA.SAP.Input Text    ${orgCompraME21N}  ${orgCompras}  #CO06
    Sleep    1  
    RPA.SAP.Input Text    ${grupoComprasME21N}  ${grupoCompras}  #T13
    Sleep    1  
    RPA.SAP.Input Text    ${sociedadME21N}  ${sociedad}  #CO06
    Sleep    1  
    RPA.Windows.Send Keys    keys={ENTER}
    ${textoOrgCompra} =     RPA.SAP.Get Value    ${valorOrgCompraME21N}
    ${textoGrupoCompra} =     RPA.SAP.Get Value    ${valorGrupoComprasME21N}
    ${textoSociedad} =     RPA.SAP.Get Value    ${valorSociedadME21N}
    RPA.SAP.Input Text    ${filaCodigoMaterial}  ${codigoMaterial}  #70047935
    Sleep    1
    RPA.SAP.Input Text    ${filaCantidadPedido}  ${cantidadPedidoMaterial}  #1
    Sleep    1
    RPA.SAP.Input Text    ${filaLote}           ${lote}
    Sleep    1
    RPA.SAP.Input Text    ${filaCavDestino}  ${centroDestinoMaterial}  #C100
    Sleep    1
    RPA.SAP.Input Text    ${filaAlmacen}        ${almacen}
    Sleep    1
    RPA.Windows.Send Keys    keys={ENTER}
    Sleep    2 
    ${textoCavDestino} =     RPA.SAP.Get Value    ${filaDireccionCavDestino}
    RPA.SAP.Click Element    ${btnGrabarTransaccion} 
    Sleep    1
    RPA.Windows.Send Keys    keys={ENTER}
    Sleep    2
    ${txtNumeroPedidoSAP}=  RPA.SAP.Get Value  ${panelNumeroPedidoSAP}
    RPA.Desktop.Press Keys  shift  F5
    Sleep    1 
    ${txtIdNumeroPedidoSAP}=  RPA.SAP.Get Value  ${numIdPedidoSAP}
    Log        ${txtIdNumeroPedidoSAP}  console=True
    Sleep    1 
    RPA.FileSystem.Create File    ..\\SAP\\Resources\\transaccion_me21n.txt    
    ...    content=Transacción ME21N - Traslado material de un CAV a un punto directo\n\n Centro Origen: ${centroOrigenMaterial}\n Org.Compras: ${orgCompras} - ${textoOrgCompra}\n GrupoCompras: ${grupoCompras} - ${textoGrupoCompra}\n Sociedad: ${sociedad} - ${textoSociedad}\n\n Centro Destino: ${centroDestinoMaterial} - ${textoCavDestino}\n CodigoMaterial: ${codigoMaterial}\n CantidadPedidoMaterial: ${cantidadPedidoMaterial}\n\n Ejecución exitosa!\n\n ${txtNumeroPedidoSAP}       
    ...    encoding=utf-8    overwrite=True
    RPA.Desktop.Press Keys    alt  F4
    Sleep    1
    CANTIDAD_CLICK_ELEMENTO    2    ${btnAtras}
    CERRAR_APLICATIVO_SAP


    


    
    