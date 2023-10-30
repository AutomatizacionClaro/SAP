*** Settings ***
Library     RPA.SAP
Library     RPA.Desktop
Library     RPA.FileSystem
Library     crear_imei.py
Library     Collections
Library     String
Resource    ../Variables/Constantes.resource
Resource    ../Locators/locatorSAP.resource


*** Keywords ***
CANTIDAD_CLICK_ELEMENTO_RPA_SAP
    [Arguments]    ${cantClicks}    ${rutaElemento}

    FOR    ${i}    IN RANGE    0    ${cantClicks}
        RPA.SAP.Click Element    ${rutaElemento}
        Sleep    1s
        IF    ${i} == ${CantClicks}    BREAK
    END

CANTIDAD_CLICK_ELEMENTO_RPA_DESKTOP
    [Arguments]    ${cantEnviados}    ${teclado}

    FOR    ${i}    IN RANGE    0    ${cantEnviados}
        RPA.Desktop.Press Keys    ${teclado}
        Sleep    1s
        IF    ${i} == ${CantEnviados}    BREAK
    END

CERRAR_APLICATIVO_SAP
    RPA.Desktop.Press Keys    alt    F4
    RPA.Desktop.Press Keys    tab
    Sleep    2s
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    enter

Crear IMEI
    [Arguments]    ${cantidadImeis}

    FOR    ${i}    IN RANGE    0    ${cantidadImeis}
        ${totalImeis}=    crear_imei.generar_imei
        Log    ${totalImeis}    console=True
    END