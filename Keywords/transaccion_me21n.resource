# Validación traslado del material transacción ME21N

*** Settings ***
Library  RPA.SAP
#Library  WhiteLibrary
Library  RPA.Windows
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource
Resource    ../Scripts/Script.resource

*** Keywords ***

transaccion_me21n
     [Arguments]    #${centroOrigen}  ${orgCompras}  ${grupoCompras}  ${sociedad}  ${grupoCompras}
    RPA.Windows.Send Keys    keys=${transaccionME21N}
    RPA.SAP.Click Element    ${btnCheckTransaccion}
    Sleep    2
    # Lista carrito Pedido_traslado
    RPA.Windows.Send Keys    keys={UP}  
    RPA.Windows.Send Keys    keys={RIGHT}
    Sleep    1  
    RPA.Windows.Send Keys    keys={UP}  
    RPA.Windows.Send Keys    keys={UP}  
    RPA.Windows.Send Keys    keys={UP}  
    RPA.Windows.Send Keys    keys={UP}  
    RPA.Windows.Send Keys    keys={ENTER}  
    #
    RPA.SAP.Input Text    ${centroSuministradoME21N}  C108
    RPA.Windows.Send Keys    keys={ENTER} 
    RPA.SAP.Input Text    ${orgCompraME21N}  CO06
    Sleep    1  
    RPA.SAP.Input Text    ${grupoComprasME21N}  T13
    Sleep    1  
    RPA.SAP.Input Text    ${sociedadME21N}  CO06
    RPA.Windows.Send Keys    keys={ENTER}
    #${orgCompra} =     RPA.SAP.Get Value    ${valorOrgCompraME21N}
    #${grupoCompra} =     RPA.SAP.Get Value    ${valorGrupoComprasME21N}
    #${sociedad} =     RPA.SAP.Get Value    ${valorSociedadME21N}
    RPA.SAP.Input Text    ${filaCodigoMaterial}  70047935
    RPA.SAP.Input Text    ${filaCantidadPedido}  1
    RPA.SAP.Input Text    ${filaLote}           ${lote}
    RPA.SAP.Input Text    ${filaCavDestino}  C100
    RPA.SAP.Input Text    ${filaAlmacen}        ${almacen}
    RPA.Windows.Send Keys    keys={ENTER}


    


    
    