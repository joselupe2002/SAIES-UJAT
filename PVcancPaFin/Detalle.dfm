�
 TFDETALLE 08  TPF0�	TFDetalleFDetalleLeft� Top|Width�Height�CaptionFDetallePixelsPerInch`
TextHeight �
TStatusBar
StatusBar1Top�Width�  �TPanelPCapturaWidth�Height� TPageControlPAGELeftTopWidth�Heighty
ActivePage	TabSheet1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder  	TTabSheet	TabSheet1CaptionDatos del Pago TLabelLabel1Left3Top0WidthHeightCaptionPago :  TLabelLabel2Left'TopPWidth+HeightCaptionNombre :  TLabelLabel5Left(TopWidth)HeightCaptionNomina :  TLabelLabel6Left1Top� Width HeightCaptionTexto :  TLabelLabel4LeftToppWidthMHeightCaptionTipo de Puesto :  TLabelLabel12Left� Top0WidthHeightCaptionTipo  TDBEditPAGOTagLeftXTop0WidthIHeight	DataField	VCAN_PAGO
DataSourceModDSTabOrder OnChange
PAGOChange  TDBEditNOMBRELeftXTopPWidth�HeightCharCaseecUpperCase	DataFieldVCAN_NOMBRE
DataSourceModDSTabOrder  TDBEditNOMINATagLeftXTopWidthIHeight	DataFieldVCAN_NOMINA
DataSourceModDSTabOrder  TDBMemoTEXTOLeftXTop� Width�HeightI	DataField
VCAN_TEXTO
DataSourceModDSTabOrder  TDBCheckBoxCancelaLeftXTop� WidthIHeightCaptionCancela	DataFieldVCAN_CANCELA
DataSourceModDSEnabledTabOrderValueCheckedSValueUncheckedN  TDBEditTPSTOLeftXToppWidth�HeightCharCaseecUpperCase	DataField
VCAN_TPSTO
DataSourceModDSTabOrder  TDBEditTNOMINATagLeft� Top0Width9Height	DataFieldVCAN_TNOMINA
DataSourceModDSEnabledTabOrderOnChange
PAGOChange   	TTabSheet	TabSheet2CaptionDetalles de Pagos
ImageIndex TLabelLabel3Left Top Width~HeightCaptionPercepciones del PagoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelLabel7Left Top� WidthyHeightCaptionDeducciones del PagoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelTPLeftVTop� Width#Height	AlignmenttaRightJustifyCaption.......Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelTDLeftVTopWidth#Height	AlignmenttaRightJustifyCaption.......Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelNETOLeftVTop=Width#Height	AlignmenttaRightJustifyCaption.......Font.CharsetDEFAULT_CHARSET
Font.Color �@ Font.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelLabel8LeftTop3WidthlHeightCaption__________________  TDBGridDBGrid3Left TopWidthHeight� Color��� 
DataSourceDsPerTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameArialTitleFont.Style 
OnDblClickDBGrid3DblClick  TDBGridDBGrid4Left Top� WidthHeight� Color��� 
DataSourceDsDedTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameArialTitleFont.Style 
OnDblClickDBGrid4DblClick  TDBGridDBCogLeft TopWidthaHeight� Color��� 
DataSourceDsCogTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameArialTitleFont.Style 
OnDblClickDBGrid3DblClick   	TTabSheet	TabSheet4CaptionPolizas de Cancelaci�n
ImageIndex TLabelLabel9Left Top� WidthgHeightCaptionDetalles de PolizasFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TDBGridDBGrid1Left TopWidth�HeightiColor��� 
DataSourcedspolTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameArialTitleFont.Style OnCellClickDBGrid1CellClick
OnDblClickDBGrid1DblClick  TDBGridDBGrid2Left Top� Width�Height� Color��� 
DataSourceDSDetPolTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameArialTitleFont.Style 
OnDblClickDBGrid2DblClick   	TTabSheet	TabSheet3CaptionDeudores Diversos
ImageIndex TDBGrid
DBDEUDORESLeftTopWidthyHeightIColor��� 
DataSourceDSDeudorTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameArialTitleFont.Style      �TToolBarToolBar1Width�  �TQueryQUpdateSQL.StringsUPDATE PCANCPAGO SET CANC_CANCELA = :VCAN_CANCELA, CANC_TEXTO = :VCAN_TEXTO,  CANC_FECCANCEL=:VCAN_FECCANCEL, CANC_TIPOC=:VCAN_TIPOCWhere CANC_PAGO = :VCAN_PAGO 	ParamDataDataType	ftUnknownNameVCAN_CANCELA	ParamType	ptUnknown DataType	ftUnknownName
VCAN_TEXTO	ParamType	ptUnknown DataType	ftUnknownNameVCAN_FECCANCEL	ParamType	ptUnknown DataType	ftUnknownName
VCAN_TIPOC	ParamType	ptUnknown DataType	ftUnknownName	VCAN_PAGO	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PCANCPAGO& (CANC_PAGO, CANC_CANCELA, CANC_TEXTO)VALUES) (:VCAN_PAGO, :VCAN_CANCELA, :VCAN_TEXTO) 	ParamDataDataType	ftUnknownName	VCAN_PAGO	ParamType	ptUnknown DataType	ftUnknownNameVCAN_CANCELA	ParamType	ptUnknown DataType	ftUnknownName
VCAN_TEXTO	ParamType	ptUnknown    TQueryQPerDatabaseNameSistemaLeft�  TDataSourceDsPerDataSetQPerLeft�Top  TDataSourceDsDedDataSetQDedLeft0Top  TQueryQDedDatabaseNameSistemaLeft  TQueryQDatabaseNameSistemaLeftP  TQueryqpolDatabaseNameSistemaLeft�  TDataSourcedspolDataSetqpolLeftPTop  TQueryQDetPolDatabaseNameSistemaLeftp  TDataSourceDSDetPolDataSetQDetPolLeft�Top  TQueryQErrorDatabaseNameSistemaLeft(Top   TDataSourcedserrorDataSetQErrorLeftTop"  TDataSourceDsCogDataSetQCogLeft�Top  TQueryQCogDatabaseNameSistemaLeft�  TDataSourceDSDeudorDataSetqdeudorLeft Top  TQueryqdeudorDatabaseNameSistemaLeft    