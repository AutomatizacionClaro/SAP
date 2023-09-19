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
    #RPA.SAP.Click Element    ${pedidoTrasladoMe21n}
    
    