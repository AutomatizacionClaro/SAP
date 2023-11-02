*** Settings ***
Resource  ../keywords/abrirSAP.resource
Resource  ../keywords/loginSAP.resource
Resource    ../Keywords/transaccion_mb52.resource
Resource    ../Keywords/transaccion_me21n.resource
Resource    ../Keywords/transaccion_vl10b.resource
Resource    ../Keywords/transaccion_vl02n.resource
Resource    ../Keywords/transaccion_iq09.resource    
Resource    ../Keywords/lectura_excel.resource    
Resource    ../Keywords/rpa_validacion_traslado_material.resource
Resource    ../Utils/funciones.resource

*** Test Cases ***
Autenticacion Login SAP
  abrir_sap
  login_sap

Transaccion MB52 - Validar Stock SAP
# Inserta: Código del material - CAV
    abrir_sap
    login_sap
    mb52 - validar stock material    70048876  C108

Transaccion ME21N - Traslado Material SAP
# Inserta: CAV_origen - Org_compras - grupo_compras - sociedad - codigo_material - cantidad_pedido - CAV_destino
    abrir_sap
    login_sap
    me21n - inicio traslado material    C108  CO06  T09  CO15  70048076  1  C127

Transaccion VL10B - Pedidos de compras
# por completar
    abrir_sap
    login_sap
    vl10b - pedidos de compras    C108  4201367423

Crear Imeis
# cantidadImei
  Crear IMEI  1

Leer Excel
  lectura_excel_prueba    

Transaccion VL02N prueba
    abrir_sap
    login_sap
    vl02n - entrada traslado   2101621270

RPA Validación Stock y Traslado del material
# Inserta: codigo_material - CAV_origen - Org_compras - grupo_compras - sociedad - cantidad_pedido - CAV_destino
    abrir_sap
    login_sap
    RPA Validación y Proceso de traslado del material     70046968  C108  CO06  T09  CO15  2  C127