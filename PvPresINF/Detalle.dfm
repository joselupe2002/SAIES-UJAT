�
 TFDETALLE 0�
  TPF0�	TFDetalleFDetalleLeft\Top� Width&HeightCaptionFDetallePixelsPerInch`
TextHeight �
TStatusBar
StatusBar1Top� Width  �TPanelPCapturaWidthHeight� 
Font.ColorclBlack
ParentFont TLabelLabel3LeftTop(Width5HeightCaption
Empleado :  TLabelLabel2Left(TopWidth%HeightCaptionMovim :  TLabelLabel1LeftTopxWidthBHeightCaptionFecha Inicial :  TLabelLabel5Left@TopxWidth=HeightCaptionFecha Final :  TLabelLabel4LeftHTopPWidth5HeightCaptionCuota Fija :  TLabelLabel6Left�TopWidthHeightCaptionV3700  TDBEditEmplTagLeftXTop(WidthyHeight	DataField	VPRE_Empl
DataSourceModDSTabOrder   TDBEditMoviLeftXTopWidthyHeightTabStopColorclMenu	DataField	VPRE_Movi
DataSourceModDSReadOnly	TabOrder  TEdit
LVPRE_EmplTag	Left� Top(Width)HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditFecIniLeftXTopxWidthyHeight	DataFieldVPRE_FecIni
DataSourceModDSTabOrder  TDBEditFecFinLeft�TopxWidthyHeight	DataFieldVPRE_FecFin
DataSourceModDSTabOrder  TDBRadioGroupPorcLeftTop@Width9Height1Columns	DataField	VPRE_Porc
DataSourceModDSItems.Strings20 %25 %	25 % Fijo30 % TabOrderValues.Strings1234   TDBEditCuotaFLeft�TopPWidthyHeight	DataFieldVPRE_CuotaF
DataSourceModDSTabOrder   �TToolBarToolBar1Width  �TQueryQUpdateSQL.StringsUPDATE PPRESINF SET PRES_Empl=  :VPRE_Empl, PRES_Porc=  :VPRE_Porc, PRES_CuotaF= :VPRE_CuotaF, PRES_FecIni=  :VPRE_FecIni, PRES_FecFin=  :VPRE_FecFinWhere PRES_Movi=  :VPRE_Movi 	ParamDataDataType	ftUnknownName	VPRE_Empl	ParamType	ptUnknown DataType	ftUnknownName	VPRE_Porc	ParamType	ptUnknown DataType	ftUnknownNameVPRE_CuotaF	ParamType	ptUnknown DataType	ftUnknownNameVPRE_FecIni	ParamType	ptUnknown DataType	ftUnknownNameVPRE_FecFin	ParamType	ptUnknown DataType	ftUnknownName	VPRE_Movi	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PPRESINF< (PRES_Movi, PRES_Empl, PRES_Porc, PRES_CuotaF, PRES_FecIni,  PRES_FecFin)VALUESA (:VPRE_Movi, :VPRE_Empl, :VPRE_Porc, :VPRE_CuotaF, :VPRE_FecIni,  :VPRE_FecFin) 	ParamDataDataType	ftUnknownName	VPRE_Movi	ParamType	ptUnknown DataType	ftUnknownName	VPRE_Empl	ParamType	ptUnknown DataType	ftUnknownName	VPRE_Porc	ParamType	ptUnknown DataType	ftUnknownNameVPRE_CuotaF	ParamType	ptUnknown DataType	ftUnknownNameVPRE_FecIni	ParamType	ptUnknown DataType	ftUnknownNameVPRE_FecFin	ParamType	ptUnknown     