
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

    [Arguments]    ${cantTabs}  ${elementoLocalizador}

        FOR  ${i}  IN RANGE  0  ${cantTabs}
            RPA.SAP.Click Element    ${elementoLocalizador}
            Sleep  1s      
            Exit For Loop If    ${i} == ${CantTabs}
        END