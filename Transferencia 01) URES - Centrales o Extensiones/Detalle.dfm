�
 TFDETALLE 0�
  TPF0�	TFDetalleFDetalleLeft�Top� HorzScrollBar.Range VertScrollBar.Range 
AutoScrollCaptionFDetalleClientHeight� ClientWidth*PixelsPerInch`
TextHeight � TLabelLabel7Left� Top� Width� HeightBiDiModebdRightToLeftCaptionTipo (CENTRAL / DIVISION)ParentBiDiMode  �
TStatusBar
StatusBar1Top� Width*Height  �TDBGrid	GValValidTop   �TStringGridGQBETop  �TPanelPCapturaWidth*Height� 	Font.NameArial
Font.StylefsBold 
ParentFont TLabelLabel1LeftTopWidthHeightBiDiModebdRightToLeftCaptionUresParentBiDiMode  TLabelLabel2Left� TopWidthAHeightBiDiModebdRightToLeftCaptionDescripci�nParentBiDiMode  TLabelLabel3LeftTop0Width{HeightBiDiModebdRightToLeftCaptionDescripci�n de la UresParentBiDiMode  TLabelLabel4LeftTopXWidthIHeightBiDiModebdRightToLeftCaptionUres de PagoParentBiDiMode  TLabelLabel5Left� TopXWidthAHeightBiDiModebdRightToLeftCaptionDescripci�nParentBiDiMode  TLabelLabel6LeftTop� Width� HeightBiDiModebdRightToLeftCaptionTipo (CENTRAL / DIVISION)ParentBiDiMode  TLabelLabel8Left� Top� WidthDHeightBiDiModebdRightToLeftCaptionUres CuentaParentBiDiMode  TDBEditURESLeftTopWidthqHeight	DataField	TRAN_URES
DataSourceModDSTabOrder   TEdit
LTRAN_URESTag	Left� TopWidth�HeightColorclSilverTabOrderOnChangeLTRAN_URESChange  TDBEditTRAN_DESCRIPLeftTop@WidthHeight	DataFieldTRAN_DESCRIP
DataSourceModDSTabOrder  TDBEditURESPLeftTophWidthqHeight	DataField
TRAN_URESP
DataSourceModDSTabOrder  TEditLTRAN_URESPTag	Left� TophWidth�HeightColorclSilverTabOrder  TDBEditAREALeftTop� Width� Height	DataField	TRAN_AREA
DataSourceModDSTabOrder  TDBEditURESALeft� Top� Width� Height	DataField
TRAN_URESA
DataSourceModDSTabOrder   �TToolBarToolBar1Width*  �TQueryQUpdateSQL.StringsUPDATE PTRANSURES SETTRAN_DESCRIP=:TRAN_DESCRIP,TRAN_URESP=:TRAN_URESP,TRAN_AREA=:TRAN_AREA,TRAN_URESA=:TRAN_URESA,Where TRAN_URES= :TRAN_URES 	ParamDataDataType	ftUnknownNameTRAN_DESCRIP	ParamType	ptUnknown DataType	ftUnknownName
TRAN_URESP	ParamType	ptUnknown DataType	ftUnknownName	TRAN_AREA	ParamType	ptUnknown DataType	ftUnknownName
TRAN_URESA	ParamType	ptUnknown DataType	ftUnknownName	TRAN_URES	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO SURESUSER $ (URES_NUM, URES_USUARIO, URES_URES)VALUES0 (SSQURESUSER.nextval,:URES_USUARIO, :URES_URES) 	ParamDataDataType	ftUnknownNameURES_USUARIO	ParamType	ptUnknown DataType	ftUnknownName	URES_URES	ParamType	ptUnknown     