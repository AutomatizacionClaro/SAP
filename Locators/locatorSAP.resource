*** Variables ***
${nvaLoginSAP}         /app/con[0]/ses[0]/wnd[0]
${txtUsuario}          /usr/txtRSYST-BNAME
${txtClave}            /usr/pwdRSYST-BCODE
${btnLogin}            /tbar[0]/btn[0]
${vnaSesionAbierta}    /app/con[0]/ses[0]/wnd[1]
${rbtnOpcionDos}    /usr/radMULTI_LOGON_OPT2
${btnCheckOK}    /tbar[0]/btn[0]

# Ventana Selección transacción
${txtTransaccion}          ${nvaLoginSAP}/tbar[0]/okcd
${btnCheckTransaccion}     ${nvaLoginSAP}/tbar[0]/btn[0]
${btnAtras}                ${nvaLoginSAP}/tbar[0]/btn[3]
# Grabar
${btnGrabarTransaccion}     ${nvaLoginSAP}/tbar[0]/btn[11]
${btnGrabarRetenerME21N}     /app/con[0]/ses[0]/wnd[1]/usr/btnSPOP-VAROPTION1
${btnGrabarTratarME21N}     /app/con[0]/ses[0]/wnd[1]/usr/btnSPOP-VAROPTION2
${btnGrabarTratarAceptarME21N}     /app/con[0]/ses[0]/wnd[1]/tbar[0]/btn[0]

# Ventana MB52
${txtMaterialMb52}             ${nvaLoginSAP}/usr/ctxtMATNR-LOW
${txtCentroMb52}               ${nvaLoginSAP}/usr/ctxtWERKS-LOW
${btnValidarStock}             ${nvaLoginSAP}/tbar[1]/btn[8]
# Visualizar Stock MB52
${txtLibreUtilizado}           ${nvaLoginSAP}/usr/lbl[73,5]

#Ventana ME21N
${pedidoTrasladoME21N}         /app/con[0]/ses[0]/wnd[0]/usr/subSUB0:SAPLMEGUI:0016/subSUB0:SAPLMEGUI:0030/subSUB1:SAPLMEGUI:1105/cmbMEPO_TOPLINE-BSART
${centroSuministradoME21N}     ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB0:SAPLMEGUI:0030/subSUB1:SAPLMEGUI:1105/ctxtMEPO_TOPLINE-SUPERFIELD
${orgCompraME21N}              ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB1:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1102/tabsHEADER_DETAIL/tabpTABHDT9/ssubTABSTRIPCONTROL2SUB:SAPLMEGUI:1221/ctxtMEPO1222-EKORG
${valorOrgCompraME21N}         ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB1:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1102/tabsHEADER_DETAIL/tabpTABHDT9/ssubTABSTRIPCONTROL2SUB:SAPLMEGUI:1221/txtMEPO1222-EKOTX
${grupoComprasME21N}           ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB1:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1102/tabsHEADER_DETAIL/tabpTABHDT9/ssubTABSTRIPCONTROL2SUB:SAPLMEGUI:1221/ctxtMEPO1222-EKGRP
${valorGrupoComprasME21N}      ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB1:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1102/tabsHEADER_DETAIL/tabpTABHDT9/ssubTABSTRIPCONTROL2SUB:SAPLMEGUI:1221/txtMEPO1222-EKNAM
${sociedadME21N}               ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB1:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1102/tabsHEADER_DETAIL/tabpTABHDT9/ssubTABSTRIPCONTROL2SUB:SAPLMEGUI:1221/ctxtMEPO1222-BUKRS
${valorSociedadME21N}          ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB1:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1102/tabsHEADER_DETAIL/tabpTABHDT9/ssubTABSTRIPCONTROL2SUB:SAPLMEGUI:1221/txtMEPO1222-BUTXT
#Ventana ME21N Tabla registro material
${filaCodigoMaterial}          ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB2:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1211/tblSAPLMEGUITC_1211/ctxtMEPO1211-EMATN[4,0]
${filaCantidadPedido}          ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB2:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1211/tblSAPLMEGUITC_1211/txtMEPO1211-MENGE[6,0]
${filaLote}                    ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB2:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1211/tblSAPLMEGUITC_1211/ctxtMEPO1211-CHARG[8,0]
${filaCavDestino}              ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB2:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1211/tblSAPLMEGUITC_1211/ctxtMEPO1211-NAME1[10,0]
${filaAlmacen}                 ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB2:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1211/tblSAPLMEGUITC_1211/ctxtMEPO1211-LGOBE[11,0]
#Ventana ME21N Tabla datos cav destino
${opcionDireccionEntregaME21N}       /app/con[0]/ses[0]/wnd[0]/usr/subSUB0:SAPLMEGUI:0019/subSUB3:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1301/subSUB2:SAPLMEGUI:1303/tabsITEM_DETAIL/tabpTABIDT15
${filaDireccionCavDestino}     /app/con[0]/ses[0]/wnd[0]/usr/subSUB0:SAPLMEGUI:0015/subSUB3:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1301/subSUB2:SAPLMEGUI:1303/tabsITEM_DETAIL/tabpTABIDT15/ssubTABSTRIPCONTROL1SUB:SAPLMEGUI:1330/ssubADDRESS:SAPLMMDA:0200/ssubADDRESS:SAPLSZA1:0300/subCOUNTRY_SCREEN:SAPLSZA1:0301/txtADDR1_DATA-NAME1
${panelNumeroPedidoSAP}              /app/con[0]/ses[0]/wnd[0]/sbar/pane[0]
${numIdPedidoSAP}              /app/con[0]/ses[0]/wnd[1]/usr/subSUB0:SAPLMEGUI:0003/ctxtMEPO_SELECT-EBELN

# Ventana VL10B
${txtPtoExpedicPtoRecepcionVL10B}    ${nvaLoginSAP}/usr/ctxtST_VSTEL-LOW
${tablaPedidosComprasVL10B}          ${nvaLoginSAP}/usr/tabsTABSTRIP_ORDER_CRITERIA/tabpS0S_TAB5
${txtDocumentoComprasVL10B}    ${nvaLoginSAP}/usr/tabsTABSTRIP_ORDER_CRITERIA/tabpS0S_TAB5/ssub%_SUBSCREEN_ORDER_CRITERIA:RVV50R10C:1030/ctxtST_EBELN-LOW
${btnFondoVL10B}               ${nvaLoginSAP}/tbar[1]/btn[19]
${btnVisualizarSuprimirEntregasVL10B}               ${nvaLoginSAP}/tbar[1]/btn[20]
${idTransaccionVL10B}         /app/con[0]/ses[0]/wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV50A:1502/ctxtLIKP-VBELN

# Ventana VL02N
${txtEntregaSalidaVL02N}    ${nvaLoginSAP}/usr/ctxtLIKP-VBELN
${tablaResumenPosicionesVL02N}    ${nvaLoginSAP}/usr/tabsTAXI_TABSTRIP_OVERVIEW/tabpT\01
${menuDetallesVL02N}             ${nvaLoginSAP}/mbar/menu[3]
${menuDetallesNumeroSerieVL02N}             ${menuDetallesVL02N}/menu[2]

