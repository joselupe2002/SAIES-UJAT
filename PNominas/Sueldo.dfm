�
 TFSUELDO 0p  TPF0�TFSueldoFSueldoLeft� TopxWidth^Height CaptionFReciboPixelsPerInch`
TextHeight �
TStatusBar
StatusBar1Top� WidthV  �TPanelPCapturaWidthVHeight�  TPageControlPagConLeftTopWidthRHeight� 
ActivePageTabBorraAlignalClientTabOrder  	TTabSheetTabBorraCaptionGenera Recibos
ImageIndex TButtonButton1LeftXTopWidth� Height9CaptionGenera RecibosFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnClickAceptar1Click     �TToolBarToolBar1WidthV  �TQueryQUpdateSQL.Strings    �TQueryQInsertSQL.Strings    TQueryQPERCEPDatabaseNameSAIESPSessionNameDefaultSQL.StringsSelect dpag_conp as Cve, dpag_Descrip as Concepto, dpag_Monto as MontoFrom PDPAGOSWhere DPAG_PAGO = :PAGOAND DPAG_PERDED = 'P'ORDER BY DPAG_CONP Left Top� 	ParamDataDataType	ftUnknownNamePAGO	ParamType	ptUnknown    TQueryQDEDUCDatabaseNameSAIESPSessionNameDefaultSQL.StringsSelect  dpag_conp as Cve, dpag_Descrip as Concepto, dpag_Monto as MontoFrom PDPAGOSWhere DPAG_PAGO = :PAGOAND DPAG_PERDED = 'D'ORDER BY DPAG_CONP Left� Top� 	ParamDataDataType	ftUnknownNamePAGO	ParamType	ptUnknown    TQuery	QEncabezaDatabaseNameSAIESPSessionNameDefaultSQL.StringsSelect *From PvEncRecNomWhere nomina = :nominaOrder By Ures, SueldoM, Nombre Left� TopX	ParamDataDataType	ftUnknownNamenomina	ParamType	ptUnknown    TSaveDialogGuardar
DefaultExt*.txtFileName
Nomina.txtFilter*.txtTitleGuardar RecibosLeft TopX   