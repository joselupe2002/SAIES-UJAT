�
 TFDETALLE 04  TPF0�	TFDetalleFDetalleLeft�Top� HorzScrollBar.Range VertScrollBar.Range 
AutoScrollCaptionFDetalleClientHeight� ClientWidth{PixelsPerInch`
TextHeight � TLabelLabel7Left� Top� WidthHeightCaptionBanco  �
TStatusBar
StatusBar1Top� Width{Height  �TDBGrid	GValValidTop   �TStringGridGQBETop  �TPanelPCapturaWidth{Height� Ctl3D	Font.NameArial
Font.StylefsBold ParentCtl3D
ParentFont TLabelLabel1Left	TopWidthBHeightCaptionConsecutivo :Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel3LeftTop0WidthHeightBiDiModebdRightToLeftCaptionIniciaParentBiDiMode  TLabelLabel5LeftXTop0Width-HeightBiDiModebdRightToLeftCaptionTerminaParentBiDiMode  TLabelLabel2Left� Top0Width4HeightBiDiModebdRightToLeftCaption	No. HorasParentBiDiMode  TLabelLabel4Left� Top0Width(HeightBiDiModebdRightToLeftCaptionNo. MinParentBiDiMode  TSpeedButtonSpeedButton1Left� TopXWidthyHeightCaptionCalcular Horas y MinOnClickSpeedButton1Click  TLabelLabel6LeftPTopWidthAHeightBiDiModebdRightToLeftCaptionDescripci�nParentBiDiMode  TLabelLabel8LeftTophWidth HeightBiDiModebdRightToLeftCaptionTurnoParentBiDiMode  TDBEditCLAVETagLeftTopWidthAHeightColorclSilver	DataField
EVHO_CLAVE
DataSourceModDSFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontReadOnly	TabOrder  TDBComboBoxINICIALeftTop@WidthIHeight	DataFieldEVHO_INICIA
DataSourceModDS
ItemHeightItems.Strings01:0002:0003:0004:0005:0006:0007:0008:0009:0010:0011:0012:0013:0014:0015:0016:0017:0018:0019:0020:0021:0022:0023:00 TabOrder  TDBComboBoxTERMINALeftXTop@WidthAHeight	DataFieldEVHO_TERMINA
DataSourceModDS
ItemHeightItems.Strings01:0002:0003:0004:0005:0006:0007:0008:0009:0010:0011:0012:0013:0014:0015:0016:0017:0018:0019:0020:0021:0022:0023:00 TabOrder  TDBEditHORASLeft� Top@Width9HeightColor��� 	DataField
EVHO_HORAS
DataSourceModDSFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontReadOnly	TabOrder  TDBEditMINLeft� Top@Width9HeightColor��� 	DataFieldEVHO_MIN
DataSourceModDSFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontReadOnly	TabOrder  TDBEditDESCRIPLeftPTopWidth!Height	DataFieldEVHO_DESCRIP
DataSourceModDSTabOrder   TDBEditTURNOTag	LeftTopvWidthAHeight	DataField
EVHO_TURNO
DataSourceModDSFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrderOnChangeTURNOChange  TEditLEVHO_TURNOTag	LeftPTopvWidth#HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameArial
Font.Style 
ParentFontReadOnly	TabOrder   �TToolBarToolBar1Width{  �TQueryQUpdateSQL.StringsUPDATE PEVHORARIOS SETEVHO_INICIA =:EVHO_INICIA,EVHO_TERMINA =:EVHO_TERMINA,EVHO_HORAS=:EVHO_HORAS,EVHO_MIN=:EVHO_MIN,EVHO_DESCRIP=:EVHO_DESCRIP,EVHO_TURNO=:EVHO_TURNOWhere EVHO_CLAVE= :EVHO_CLAVE 	ParamDataDataType	ftUnknownNameEVHO_INICIA	ParamType	ptUnknown DataType	ftUnknownNameEVHO_TERMINA	ParamType	ptUnknown DataType	ftUnknownName
EVHO_HORAS	ParamType	ptUnknown DataType	ftUnknownNameEVHO_MIN	ParamType	ptUnknown DataType	ftUnknownNameEVHO_DESCRIP	ParamType	ptUnknown DataType	ftUnknownName
EVHO_TURNO	ParamType	ptUnknown DataType	ftUnknownName
EVHO_CLAVE	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PEVHORARIOS) (EVHO_CLAVE, EVHO_DESCRIP, EVHO_INICIA, .EVHO_TERMINA, EVHO_HORAS, EVHO_MIN,EVHO_TURNO)VALUESC (PSQEVHORARIOS.NEXTVAL,:EVHO_DESCRIP,:EVHO_INICIA, :EVHO_TERMINA, ":EVHO_HORAS,:EVHO_MIN,:EVHO_TURNO)  	ParamDataDataType	ftUnknownNameEVHO_DESCRIP	ParamType	ptUnknown DataType	ftUnknownNameEVHO_INICIA	ParamType	ptUnknown DataType	ftUnknownNameEVHO_TERMINA	ParamType	ptUnknown DataType	ftUnknownName
EVHO_HORAS	ParamType	ptUnknown DataType	ftUnknownNameEVHO_MIN	ParamType	ptUnknown DataType	ftUnknownName
EVHO_TURNO	ParamType	ptUnknown    �TQueryQValLeftH  TQueryqCachedUpdates	OnUpdateRecordQValUpdateRecordDatabaseNameSistemaLeft�    