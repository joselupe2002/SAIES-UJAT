�
 TFDETALLE 0�  TPF0�	TFDetalleFDetalleLeft�Top� Width�Height�CaptionFDetallePixelsPerInch`
TextHeight �
TStatusBar
StatusBar1TopCWidth�  �TPanelPCapturaWidth�Height& TLabelLabel1LeftTop1Width5HeightCaption
Empleado :  TLabelLabel2LeftTopQWidth-HeightCaption	Persona :  TLabelLabel4LeftTopqWidth!HeightCaptionTexto :  TLabelLabel5LeftTop� Width4HeightCaptionExpresion :  TLabelLabel7LeftTopWidth%HeightCaptionMovim :  TLabelLabel3Left(TopWidth;HeightCaptionAcumulado :  TLabelLabel6LeftTop� WidthHeightCaptionTotal :  TLabelLabel8Left Top� WidthBHeightCaptionFecha Inicial :  TLabelLabel9LeftTopWidth=HeightCaptionFecha Final :  TLabelLabel10Left� TopWidth+HeightCaption	V 1.0.1.3  TDBEditEmplHLeft@Top1WidthYHeight	DataField
VMOV_EMPLH
DataSourceModDSTabOrder   TDBEditPersonaLeft@TopQWidthYHeight	DataFieldVMOV_Persona
DataSourceModDSTabOrder  TDBMemoTextoLeft@TopqWidth�Height1	DataField
VMOV_Texto
DataSourceModDSTabOrder  TEditLVMOV_EMPLHTag	Left� Top1Width!HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditMoviLeft@TopWidthYHeightTabStopColorclMenu	DataField	VMOV_Movi
DataSourceModDSFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TEditLVMOV_PersonaTag	Left� TopPWidth!HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder	  TDBMemoExprLeft@Top� Width�Height)	DataField	VMOV_Expr
DataSourceModDSTabOrder  TDBEditAcumLefthTopWidthYHeightTabStopColorclMenu	DataField	VMOV_Acum
DataSourceModDSFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder
  TDBEditFecIniLeftHTop� WidthyHeight	DataFieldVMOV_FecIni
DataSourceModDSTabOrder  TDBEditFecFinLeftHTopWidthyHeight	DataFieldVMOV_FecFin
DataSourceModDSTabOrder  TDBEditTotalLeft@Top� WidthiHeight	DataField
VMOV_Total
DataSourceModDSTabOrder   �TToolBarToolBar1Width�  �TQueryQUpdateSQL.StringsUPDATE PVHMOVTERC SET VMOV_EMPLH= :VMOV_EmplH, VMOV_Persona= :VMOV_Persona, VMOV_Texto= :VMOV_Texto, VMOV_Expr= :VMOV_Expr, VMOV_Total= :VMOV_Total, VMOV_FecIni= :VMOV_FecIni, VMOV_FecFin= :VMOV_FecFinWHERE VMOV_Movi= :VMOV_Movi 	ParamDataDataType	ftUnknownName
VMOV_Emplh	ParamType	ptUnknown DataType	ftUnknownNameVMOV_Persona	ParamType	ptUnknown DataType	ftUnknownName
VMOV_Texto	ParamType	ptUnknown DataType	ftUnknownName	VMOV_Expr	ParamType	ptUnknown DataType	ftUnknownName
VMOV_Total	ParamType	ptUnknown DataType	ftUnknownNameVMOV_FecIni	ParamType	ptUnknown DataType	ftUnknownNameVMOV_FecFin	ParamType	ptUnknown DataType	ftUnknownName	VMOV_Movi	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PVHMOVTERC&(VMOV_Movi, VMOV_EmplH, VMOV_Persona, = VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin)VALUES)(:VMOV_Movi, :VMOV_EmplH, :VMOV_Persona, B :VMOV_Texto, :VMOV_Expr, :VMOV_Total, :VMOV_FecIni, :VMOV_FecFin) 	ParamDataDataType	ftUnknownName	VMOV_Movi	ParamType	ptUnknown DataType	ftUnknownName
VMOV_Emplh	ParamType	ptUnknown DataType	ftUnknownNameVMOV_Persona	ParamType	ptUnknown DataType	ftUnknownName
VMOV_TEXTO	ParamType	ptUnknown DataType	ftUnknownName	VMOV_Expr	ParamType	ptUnknown DataType	ftUnknownName
VMOV_Total	ParamType	ptUnknown DataType	ftUnknownNameVMOV_FecIni	ParamType	ptUnknown DataType	ftUnknownNameVMOV_FecFin	ParamType	ptUnknown     