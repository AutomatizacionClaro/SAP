*** Settings ***
# Library    WhiteLibrary
Library     RPA.Windows


*** Keywords ***
abrir_sap
#    WhiteLibrary.Launch Application    saplogon.exe
    Windows Run    saplogon.exe
