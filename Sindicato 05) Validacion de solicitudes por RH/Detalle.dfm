�
 TFDETALLE 0h  TPF0�	TFDetalleFDetalleLeftATopWidthSHeight�CaptionFDetallePixelsPerInch`
TextHeight � TLabelLabel17LeftTop� WidthBHeightCaptionFecha Inicial :  �TLabelLabel19LeftHTop� Width=HeightCaptionFecha Final :  �
TStatusBar
StatusBar1Top8WidthKHeight  �TPanelPCapturaWidthKHeight TPageControlPagConLeftTopWidthGHeight
ActivePageTabDatosAlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  	TTabSheetTabDatosCaptionDatosFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont TLabelLabel2LeftTopWidthEHeightCaptionConsecutivo  TLabelLabel4LeftTop0Width]HeightCaptionURES que solicita  TLabelLabel11Left� TopWidthcHeightCaptionFecha de Solicitud  TLabelLabel12LeftTopHWidthSHeightCaptionObservacionesTransparent	  TLabelLabel1Left� TopWidth� HeightCaptionDescripci�n de la Solicitud   TLabelmLeftTopWWidth!HeightAutoSizeCaption......Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontWordWrap	  TLabelLabel3LeftLTopHWidth� HeightCaption!Observaciones de Recursos HumanosTransparent	  TDBEditNumeroLeftTopWidthaHeightTabStopColorclMenu	DataFieldVSOL_NUMERO
DataSourceModDSReadOnly	TabOrder  TDBEditURESTagLeftTop@WidthaHeight	DataField	VSOL_URES
DataSourceModDSEnabledTabOrder
OnKeyPressFechaKeyPress  TEdit
LVSOL_URESTag	LeftpTop@Width�HeightTabStopColorclMenuFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditFechaLeft� TopWidthiHeight	DataFieldVSOL_FechaSOL
DataSourceModDSEnabledTabOrder 
OnKeyPressFechaKeyPress  TDBMemoOBSLeftTopXWidth9HeightI	DataFieldVSOL_OBS
DataSourceModDSEnabledTabOrder  TStringGridGRIDLeftTopxWidth!Height� Hint6<INS> Insertar un registro <SUPR> Eliminar un registroBiDiModebdLeftToRightColCountDefaultRowHeight	FixedCols RowCountFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold OptionsgoFixedVertLinegoFixedHorzLine
goVertLine
goHorzLinegoRangeSelectgoColMoving	goEditinggoTabs ParentBiDiMode
ParentFontParentShowHintShowHint	TabOrder
OnDrawCellGRIDDrawCell
OnKeyPressGRIDKeyPressOnSelectCellGRIDSelectCell	ColWidths� � WT[cUTOWj@   TDBEditDESCRIPLeft� TopWidthAHeight	DataFieldVSOL_DESCRIP
DataSourceModDSEnabledTabOrder
OnKeyPressFechaKeyPress  TDBMemoOBSRHLeftHTopXWidth�HeightIColor��� 	DataField
VSOL_OBSRH
DataSourceModDSTabOrder     �TToolBarToolBar1WidthK  �TQueryQUpdateSQL.StringsUPDATE PSOLEVEN SET SOLE_OBSRH =:VSOL_OBSRH Where SOLE_NUMERO=  :VSOL_NUMERO 	ParamDataDataType	ftUnknownName
VSOL_OBSRH	ParamType	ptUnknown DataType	ftUnknownNameVSOL_NUMERO	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PSOLEVEN4 (SOLE_NUMERO,   SOLE_FechaSOL, SOLE_OBS, SOLE_URES,SOLE_DESCRIP)VALUES6 (:vsol_numero,  :VSOL_FechaSOL, :VSOL_OBS,:VSOL_URES,:VSOL_DESCRIP) 	ParamDataDataType	ftUnknownNamevsol_numero	ParamType	ptUnknown DataType	ftUnknownNameVSOL_FechaSOL	ParamType	ptUnknown DataType	ftUnknownNameVSOL_OBS	ParamType	ptUnknown DataType	ftUnknownName	VSOL_URES	ParamType	ptUnknown DataType	ftUnknownNameVSOL_DESCRIP	ParamType	ptUnknown    TQueryqCachedUpdates	OnUpdateRecordQValUpdateRecordDatabaseNamesistemaLeftjTop  TQueryQPrinCachedUpdates	OnUpdateRecordQValUpdateRecordDatabaseNamesistemaLeftJTop   