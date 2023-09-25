
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

*** Keywords ***
CANTIDAD_CLICK_ELEMENTO

    [Arguments]    ${cantClicks}  ${rutaElemento}

        FOR  ${i}  IN RANGE  0  ${cantClicks}
            RPA.SAP.Click Element    ${rutaElemento}
            Sleep  1s      
            Exit For Loop If    ${i} == ${CantClicks}
        END