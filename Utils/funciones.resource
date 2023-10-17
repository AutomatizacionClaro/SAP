
*** Settings ***
Library     RPA.SAP
Library     RPA.Desktop
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource

*** Keywords ***
CANTIDAD_CLICK_ELEMENTO

    [Arguments]    ${cantClicks}  ${rutaElemento}

        FOR  ${i}  IN RANGE  0  ${cantClicks}
            RPA.SAP.Click Element    ${rutaElemento}
            Sleep  1s      
            Exit For Loop If    ${i} == ${CantClicks}
        END

CERRAR_APLICATIVO_SAP
    RPA.Desktop.Press Keys    alt  F4
    RPA.Desktop.Press Keys    tab
    Sleep  2s 
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    enter
