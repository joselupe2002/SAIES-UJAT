�
 TFDETALLE 0�  TPF0�	TFDetalleFDetalleLeft� TopvWidth�HeightCaptionFDetallePixelsPerInch`
TextHeight �
TStatusBar
StatusBar1Top� Width�  �TPanelPCapturaWidth�Height�  TPageControlPageConLeftTopWidth�Height� 
ActivePageTabHistoAlignalClientHotTrack	TabOrder  	TTabSheetTabDatosCaptionDatos TLabelLabel1Left3TopWidth'HeightCaptionPuesto :  TLabelLabel2Left'Top1Width3HeightCaptionCategoria :  TLabelLabel3LeftTopQWidthRHeightCaptionSueldo Mensual :  TLabelLabel4Left+TopQWidthHeightCaptionInicio :  TLabelLabel5Left`TopxWidth!HeightCaption3.0.0.1  TDBEditPstoTagLeftcTopWidthQHeight	DataField	VCPU_Psto
DataSourceModDSTabOrder   TDBEditCategTagLeftcTop1WidthQHeight	DataField
VCPU_Categ
DataSourceModDSTabOrder  TDBEditDescripLeft� Top1Width� HeightCharCaseecUpperCase	DataFieldVCPU_Descrip
DataSourceModDSTabOrder  TDBEditSueldoLeftcTopQWidthQHeight	DataFieldVCPU_Sueldo
DataSourceModDSTabOrder  TDBEditInicioLeftSTopQWidthQHeight	DataFieldVCPU_Ini
DataSourceModDSTabOrder  TEdit
LVCPU_PstoTag	Left� TopWidth� HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   	TTabSheetTabHistoCaptionHistorico Sueldos
ImageIndex TDBGrid
dbgSueldosLeft Top Width�Height� AlignalClientColorclMenu
DataSourceDSHistReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style      �TToolBarToolBar1Width�  �TQueryQUpdateSessionNameDefaultSQL.StringsUPDATE PVHCPUESTOS Set VCPU_Descrip= :VCPU_Descrip, VCPU_Sueldo= :VCPU_Sueldo, VCPU_Ini= :VCPU_IniWhere VCPU_Psto= :VCPU_Psto  And VCPU_Categ= :VCPU_Categ  	ParamDataDataType	ftUnknownNameVCPU_Descrip	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Sueldo	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Ini	ParamType	ptUnknown DataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown DataType	ftUnknownName
VCPU_Categ	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PVHCPUESTOS<(VCPU_Psto, VCPU_Categ, VCPU_Descrip, VCPU_Sueldo, VCPU_Ini)VALUESA(:VCPU_Psto, :VCPU_Categ, :VCPU_Descrip, :VCPU_Sueldo, :VCPU_Ini) 	ParamDataDataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown DataType	ftUnknownName
VCPU_Categ	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Descrip	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Sueldo	ParamType	ptUnknown DataType	ftUnknownNameVCPU_Ini	ParamType	ptUnknown    TQueryQHistDatabaseNameSistema
DataSourceModDSSQL.StringsSELECT A.SPUE_SPue As Num, A.SPUE_Sueldo As Sueldo, A.SPUE_Ini As Desde, B.SPUE_Ini - 1 As HastaFROM PHSPUESTOS A, PHSPUESTOS BWhere A.SPUE_Psto= :VCPU_Psto And A.SPUE_Categ= :VCPU_Categ! And B.SPUE_Antes(+)= A.SPUE_SpueORDER By A.SPUE_Spue Left� Top� 	ParamDataDataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown DataType	ftUnknownName
VCPU_Categ	ParamType	ptUnknown   TFloatFieldQHistSUELDODisplayLabelSueldo	FieldNameSUELDOcurrency	  TDateTimeField
QHistDESDEDisplayLabelDesde	FieldNameDESDE  TDateTimeField
QHistHASTADisplayLabelHasta	FieldNameHASTA   TDataSourceDSHistAutoEditDataSetQHistLeft� Top�   TQueryqPstoDatabaseNameSistema
DataSourceModDSSQL.StringsSELECT PUES_Fpago As FPagoFROM PHPUESTOSWhere PUES_Psto= :VCPU_Psto LeftbTop	ParamDataDataType	ftUnknownName	VCPU_Psto	ParamType	ptUnknown     