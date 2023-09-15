*** Settings ***
Library    Screenshot    ..\\SAP\\Images
Library    OperatingSystem

*** Keywords ***
Screenshot
    Sleep    1s
    Screenshot.Take Screenshot
    