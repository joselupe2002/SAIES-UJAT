�
 TFSUELDO 0�  TPF0�TFSueldoFSueldoLeft� TopxWidth^Height CaptionFSueldoPixelsPerInch`
TextHeight �
TStatusBar
StatusBar1Top� WidthN  �TPanelPCapturaWidthNHeight�  TPageControlPagConLeftTopWidthJHeight� 
ActivePageTabNuevoAlignalClientTabOrder  	TTabSheetTabNuevoCaptionNuevo Sueldo TLabelLabel1LeftPTopWidth'HeightCaptionSueldo :  TLabelLabel2Left@Top8Width7HeightCaptionA Partir de :  TLabelLabel5Left� TopUWidth!HeightCaption3.0.0.1  TDBEditSueldoLeft� TopWidthyHeight	DataFieldVCPU_Sueldo
DataSourceModDSTabOrder   TDBEditIniLeft� Top8WidthyHeight	DataFieldVCPU_Ini
DataSourceModDSTabOrder   	TTabSheetTabBorraCaptionBorra Actual
ImageIndex TButtonButton1LeftXTopWidth� Height9CaptionBorra Sueldo ActualFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnClickAceptar1Click     �TToolBarToolBar1WidthN  �TQueryQUpdateSQL.StringsInsert INTO PHSPuestos$ (SPUE_Spue, SPUE_Psto, SPUE_Categ,   SPUE_Sueldo, SPUE_Ini)Values.(PSQSPUESTOS.NextVal, :VCPU_Psto, :VCPU_Categ, :VCPU_Sueldo, :VCPU_Ini) 	ParamDataDataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown DataType	ftUnknownName
VCPU_Categ	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Sueldo	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Ini	ParamType	ptUnknown    �TQueryQInsertSQL.StringsDelete From PHSPUESTOSWhere SPUE_Spue= ( Select CPUE_Spue From PHCPUESTOS Where CPUE_Psto= :VCPU_Psto  And CPUE_Categ= :VCPU_Categ) 	ParamDataDataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown DataType	ftUnknownName
VCPU_Categ	ParamType	ptUnknown    TQueryQAntDatabaseNameSistema
DataSourceModDSSQL.StringsSelect SPUE_Sueldo As Sueldo, SPUE_Ini As IniFrom PHSPUESTOSWhere SPUE_Spue= ( Select CPUE_Spue  From PHCPUESTOS  Where CPUE_Psto= :VCPU_Psto"      And CPUE_Categ= :VCPU_Categ) Left&TopG	ParamDataDataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown DataType	ftUnknownName
VCPU_Categ	ParamType	ptUnknown     