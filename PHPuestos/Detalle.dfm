�
 TFDETALLE 0�  TPF0�	TFDetalleFDetalleLeft� TopxWidthHeight�CaptionFDetallePixelsPerInch`
TextHeight �
TStatusBar
StatusBar1TopoWidth   �TPanelPCapturaWidth HeightR TPageControlPageConLeftTopWidth�HeightN
ActivePageTabDatosAlignalClientHotTrack	TabOrder  	TTabSheetTabDatosCaptionDatos TLabelLabel1Left;TopWidth'HeightCaptionPuesto :  TLabelLabel2Left1Top0Width1HeightCaption
T Puesto :  TLabelLabel6LeftATop� Width!HeightCaptionTexto :  TLabelLabel5Left.TopPWidth4HeightCaption
Concepto :  TLabelLabel3Left(Top� Width<HeightCaptionCateg Defa :  TLabelLabel4LeftTop� WidthNHeightCaptionForma de Pago :  TLabelLabel7LeftpTophWidthHeightCaptionV3002  TDBEditPuestoTagLeftjTopWidthaHeight	DataField	PUES_Psto
DataSourceModDSTabOrder   TDBEditDescripLeft� TopWidth� HeightCharCaseecUpperCase	DataFieldPUES_Descrip
DataSourceModDSTabOrder  TDBEditTPStoLeftjTop0WidthaHeight	DataField
PUES_TPsto
DataSourceModDSTabOrder  TDBCheckBoxSuel_AltLeft� ToppWidth\Height	AlignmenttaLeftJustifyCaptionSueldo Alterno :	DataFieldPUES_Suel_Alt
DataSourceModDSTabOrderValueCheckedSValueUncheckedN  TDBMemoTextoLeftjTop� WidthWHeightH	DataField
PUES_Texto
DataSourceModDSTabOrder  TEditLPUES_TPstoTag	Left� Top0Width� HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder	  TDBEditConppLeftjTopPWidthaHeight	DataField	PUES_Conp
DataSourceModDSTabOrder  TEdit
LPUES_ConpTag	Left� TopPWidth� HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder
  TDBEditCatDefaLeftjTop� Width_Height	DataFieldPUES_Categ_Defa
DataSourceModDSTabOrder  TDBCheckBoxProfesorLeft4ToppWidthDHeight	AlignmenttaLeftJustifyCaption
Profesor :	DataField
PUES_Profe
DataSourceModDSTabOrderValueCheckedSValueUncheckedN  TDBRadioGroupFPagoLeftkTop� Width� Height!Columns	DataField
PUES_FPago
DataSourceModDSItems.StringsMensual	Por Horas TabOrderValues.StringsMH   TEditLPUES_Categ_DefaTag	Left� Top� Width� HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   	TTabSheetTabCategCaption
Categorias
ImageIndex TDBGridDBGrid1Left Top Width�Height6AlignalClientColorclMenu
DataSourceDSCategReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style      �TToolBarToolBar1Width   �TQueryQUpdateSQL.StringsUPDATE PHPUESTOS SET PUES_Descrip= :PUES_Descrip, PUES_Texto= :PUES_Texto, PUES_TPsto= :PUES_TPsto, PUES_FPago= :PUES_FPago, PUES_Suel_Alt= :PUES_Suel_Alt, PUES_Profe= :PUES_Profe, PUES_Conp= :PUES_Conp," PUES_Categ_Defa= :PUES_Categ_DefaWhere PUES_Psto= :PUES_Psto 	ParamDataDataType	ftUnknownNamePUES_Descrip	ParamType	ptUnknown DataType	ftUnknownName
PUES_Texto	ParamType	ptUnknown DataType	ftUnknownName
PUES_TPsto	ParamType	ptUnknown DataType	ftUnknownName
PUES_FPago	ParamType	ptUnknown DataType	ftUnknownNamePUES_Suel_Alt	ParamType	ptUnknown DataType	ftUnknownName
PUES_Profe	ParamType	ptUnknown DataType	ftUnknownName	PUES_Conp	ParamType	ptUnknown DataType	ftUnknownNamePUES_Categ_Defa	ParamType	ptUnknown DataType	ftUnknownName	PUES_Psto	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PHPUESTOS3 (PUES_Psto, PUES_Descrip, PUES_Texto, PUES_TPsto, D  PUES_FPago, PUES_Suel_Alt, PUES_Profe, PUES_Conp, PUES_Categ_Defa)VALUES7 (:PUES_Psto, :PUES_Descrip, :PUES_Texto, :PUES_TPsto, I  :PUES_FPago, :PUES_Suel_Alt, :PUES_Profe, :PUES_Conp, :PUES_Categ_Defa) 	ParamDataDataType	ftUnknownName	PUES_PSTO	ParamType	ptUnknown DataType	ftUnknownNamePUES_Descrip	ParamType	ptUnknown DataType	ftUnknownName
PUES_Texto	ParamType	ptUnknown DataType	ftUnknownName
PUES_TPSTO	ParamType	ptUnknown DataType	ftUnknownName
PUES_FPago	ParamType	ptUnknown DataType	ftUnknownNamePUES_Suel_Alt	ParamType	ptUnknown DataType	ftUnknownName
PUES_Profe	ParamType	ptUnknown DataType	ftUnknownName	PUES_Conp	ParamType	ptUnknown DataType	ftUnknownNamePUES_Categ_Defa	ParamType	ptUnknown    TQueryQCategDatabaseNameSistema
DataSourceModDSSQL.StringsSelect CPUE_Categ, CPUE_Descrip, SPUE_Sueldo As CPUE_Sueldo, SPUE_Ini As CPUE_IniFrom PHCPUESTOS, PHSPUESTOSWhere CPUE_Psto= :PUES_Psto   And SPUE_SPue= CPUE_SPue LeftbTop	ParamDataDataType	ftUnknownName	PUES_Psto	ParamType	ptUnknown   TStringFieldQCategCPUE_CATEGDisplayLabel	Categoria	FieldName
CPUE_CATEGOriginPCPUESTOS.CPUE_CATEGSize
  TStringFieldQCategCPUE_DESCRIPDisplayLabelDescripcion	FieldNameCPUE_DESCRIPOriginPCPUESTOS.CPUE_DESCRIPSize#  TFloatFieldQCategCPUE_SUELDODisplayLabelSueldo	FieldNameCPUE_SUELDOOriginPCPUESTOS.CPUE_SUELDOcurrency	  TDateTimeFieldQCategCPUE_INIDisplayLabelInicio	FieldNameCPUE_INIOriginPCPUESTOS.CPUE_INI   TDataSourceDSCategDataSetQCategLeft�Top   