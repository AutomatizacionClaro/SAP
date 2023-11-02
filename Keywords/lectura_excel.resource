*** Comments ***
Validación stock material transacción MB52
Inicio traslado del material transacción ME21N
Pedido de compras transacción VL10B


*** Settings ***
Library     RPA.SAP
Library     RPA.Tables
Library     RPA.Excel.Files
Resource    ../Variables/Constantes.resource


*** Keywords ***
lectura_excel_prueba
    RPA.Excel.Files.Open Workbook    ${pathExcel}
    ${row}=    RPA.Excel.Files.Read Worksheet    header=true
    ${next}=    RPA.Excel.Files.Find Empty Row
    FOR    ${counter}    IN RANGE    2    ${next}
        ${column}=    RPA.Excel.Files.Get cell value    ${counter}    A
        Log    ${column}    console=True
    END
    RPA.Excel.Files.Close Workbook
