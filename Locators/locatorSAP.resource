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
${btnValidarStock}    ${nvaLoginSAP}/tbar[1]/btn[8]

