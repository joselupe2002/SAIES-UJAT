�
 TFDETALLE 0�  TPF0�	TFDetalleFDetalleLeft�Top� HorzScrollBar.Range VertScrollBar.Range 
AutoScrollCaptionFDetalleClientHeight� ClientWidth4PixelsPerInch`
TextHeight �
TStatusBar
StatusBar1Top� Width4Height  �TDBGrid	GValValidTop   �TStringGridGQBETop  �TPanelPCapturaWidth4Heights	Font.NameArial
Font.StylefsBold 
ParentFont TLabelLabel9LeftTopWidthHeightBiDiModebdRightToLeftCaptionClaveParentBiDiMode  TLabelLabel4Left� TopWidthAHeightBiDiModebdRightToLeftCaptionDescripci�nParentBiDiMode  TLabelLabel1LeftTop8Width� HeightBiDiModebdRightToLeftCaptionCuenta de TransferenciaParentBiDiMode  TDBEditCLAVELeftTop WidthqHeight	DataField
TRAN_CLAVE
DataSourceModDSTabOrder   TDBEditDESCRIPLeft� Top Width�Height	DataFieldTRAN_DESCRIP
DataSourceModDSTabOrder  TDBEditCUENTALeftTopHWidth� Height	DataFieldTRAN_CUENTA
DataSourceModDSTabOrder   �TToolBarToolBar1Width4  �TQueryQUpdateSQL.StringsUPDATE PTRANBANCOS SETTRAN_DESCRIP =:TRAN_DESCRIP,TRAN_CUENTA=:TRAN_CUENTAWhere TRAN_CLAVE= :TRAN_CLAVE 	ParamDataDataType	ftUnknownNameTRAN_DESCRIP	ParamType	ptUnknown DataType	ftUnknownNameTRAN_CUENTA	ParamType	ptUnknown DataType	ftUnknownName
TRAN_CLAVE	ParamType	ptUnknown    �TQueryQInsertSQL.StringsINSERT INTO PTRANBANCOS ' (TRAN_CLAVE, TRAN_DESCRIP,TRAN_CUENTA)VALUES* (:TRAN_CLAVE, :TRAN_DESCRIP,:TRAN_CUENTA) 	ParamDataDataType	ftUnknownName
TRAN_CLAVE	ParamType	ptUnknown DataType	ftUnknownNameTRAN_DESCRIP	ParamType	ptUnknown DataType	ftUnknownNameTRAN_CUENTA	ParamType	ptUnknown     