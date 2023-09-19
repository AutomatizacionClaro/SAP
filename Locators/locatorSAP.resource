*** Variables ***
${nvaLoginSAP}         /app/con[0]/ses[0]/wnd[0]
${txtUsuario}          /usr/txtRSYST-BNAME
${txtClave}            /usr/pwdRSYST-BCODE
${btnLogin}            /tbar[0]/btn[0]
${vnaSesionAbierta}    /app/con[0]/ses[0]/wnd[1]
${rbtnOpcionDos}    /usr/radMULTI_LOGON_OPT2
${btnCheckOK}    /tbar[0]/btn[0]
# Ventana Selección transacción
${txtTransaccion}    ${nvaLoginSAP}/tbar[0]/okcd
${btnCheckTransaccion}    ${nvaLoginSAP}/tbar[0]/btn[0]
# Ventana MB52
${txtMaterialMb52}    ${nvaLoginSAP}/usr/ctxtMATNR-LOW
${txtCentroMb52}    ${nvaLoginSAP}/usr/ctxtWERKS-LOW
${btnValidarStock}    ${nvaLoginSAP}/tbar[1]/btn[8]
#Ventana ME21N
#${pedidoTrasladoMe21n}    ${nvaLoginSAP}/usr/subSUB0:SAPLMEGUI:0013/subSUB2:SAPLMEVIEWS:1100/subSUB2:SAPLMEVIEWS:1200/subSUB1:SAPLMEGUI:1211/tblSAPLMEGUITC_1211/txtMEPO1211-NETPR[14,4]
${pedidoTrasladoMe21n}    /usr/subSUB0:SAPLMEGUI:0013/subSUB0:SAPLMEGUI:0030/subSUB1:SAPLMEGUI:1105/cmbMEPO_TOPLINE-BSART


