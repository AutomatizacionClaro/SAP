*** Settings ***
Library     Screenshot    ..\\SAP\\Images
Library     OperatingSystem


*** Keywords ***
CapturaPantalla
    Sleep    1s
    Screenshot.Take Screenshot
