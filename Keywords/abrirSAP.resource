***settings***
Library  RPA.SAP
Library    Screenshot    ..\\SAP\\Images
#Library  WhiteLibrary
Library    RPA.Windows


***keywords***

abrir_sap
#   WhiteLibrary.Launch Application   saplogon.exe
    Windows Run   saplogon.exe