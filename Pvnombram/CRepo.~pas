unit CRepo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PRepo, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, libreria, QRPrntr,
  ImgList, Menus, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, modulo, clipbrd;

type
  TFCRepo = class(TPFRepo)
    QTemp: TQuery;
    Label2: TLabel;
    DataSource1: TDataSource;
    QRDBText5: TQRDBText;
    QDirigido: TQuery;
    QcopiaU: TQuery;
    QcopiaD: TQuery;
    QcopiaT: TQuery;
    QDirigidoNOMDIRIGIDO: TStringField;
    QDirigidoPUESTODIRIGIDO: TStringField;
    QDirigidoURESDIRIGIDO: TStringField;
    QcopiaDNOMCOPIAD: TStringField;
    QcopiaTNOMCOPIAT: TStringField;
    QcopiaUNOMCOPIAU: TStringField;
    Detalle: TQRBand;
    QRShape1: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText7: TQRDBText;
    TipoC: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    QTempVNOM_NOMB: TFloatField;
    QTempCONT: TStringField;
    QTempEMPL: TStringField;
    QTempNOMBRE: TStringField;
    QTempNOMB: TFloatField;
    QTempDIRECCION: TMemoField;
    QTempSEXO: TStringField;
    QTempNACIONALIDAD: TStringField;
    QTempESTADO_CIVIL: TStringField;
    QTempPROFESION: TStringField;
    QTempTPSTO: TStringField;
    QTempPUESTO: TStringField;
    QTempCATEGO: TStringField;
    QTempSUELDO: TStringField;
    QTempURES: TStringField;
    QTempFECHA: TStringField;
    QTempFINGRESO: TStringField;
    QTempMOTIVO: TMemoField;
    QTempNOMBRAMIENTO: TMemoField;
{    procedure Recurre(Pred : String) ;
    procedure QTempUpdateRecord(DataSet: TDataSet; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);}
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FCRepo: TFCRepo;
// nivel : Integer ;
implementation

{$R *.DFM}

{procedure TFRepo.QTempUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  inherited;
 UpDateAction := uaApplied ;
end;}

{procedure TFRepo.Recurre(Pred : String) ;
var mQuery : TQuery ;
 nPred : String ;
begin
 nivel := nivel+ 1 ;
 mQuery := TQuery.Create(nil) ;
 mQuery.DataBaseName := 'Sistema' ;
 with mquery.Sql do
 begin
  Add('Select Prog_Funcion As Funcion, Prog_Prog As Prog, ') ;
  Add( 'Prog_Descrip As Descrip, Prog_Ent_Data As Entra') ;
  Add('From FProgram') ;
  if Pred= ''
  then Add('Where Prog_PProg is Null')
  else Add('Where Prog_PProg= '''+ Pred+ '''') ;
  Add('ORDER BY Prog_Funcion, Prog_Prog') ;
 end ;

 mQuery.Open ;
 mQuery.First ;
 while not mQuery.eof do
 begin
  nPred := mQuery.FieldByName('Prog').AsString ;
  QTemp.Append ;
  QTemp['Funcion'] := mQuery.FieldByName('Funcion').AsString ;
  QTemp['Prog'] := Replicate(' ',nivel*2)+ nPred ;
  QTemp['Descrip'] := mQuery.FieldByName('Descrip').AsString ;
  QTemp['Entra'] := mQuery.FieldByName('Entra').AsString ;
  QTemp.Post ;

  QCheca.Close ;
  QCheca.ParamByName('Prog').AsString := nPred ;
  QCheca.Open ;
  QCheca.First ;
  if not QCheca.Eof
  then recurre(nPred) ;
  mQuery.Next ;
 end ;

 nivel := nivel - 1 ;
 mQuery.Free ;
end ;}


procedure TFCRepo.FormCreate(Sender: TObject);
begin
  inherited;

{qtemp.close;
qtemp.open;}

QTEMP.CLOSE;
QTEMP.Params.ParamValues['NOMBRA'] := clipboard.AsText ;
QTEMP.OPEN;

QDIRIGIDO.CLOSE;
QDIRIGIDO.Params.ParamValues['NOMBRA'] := clipboard.AsText ;
QDIRIGIDO.OPEN;

QcopiaU.CLOSE;
QcopiaU.Params.ParamValues['NOMBRA'] := clipboard.AsText ;
QcopiaU.OPEN;

QcopiaD.CLOSE;
QcopiaD.Params.ParamValues['NOMBRA'] := clipboard.AsText ;
QcopiaD.OPEN;

QcopiaT.CLOSE;
QcopiaT.Params.ParamValues['NOMBRA'] := clipboard.AsText ;
QcopiaT.OPEN;
{LUniv.Caption := 'Universidad Juárez Autónoma de Tabasco' ;}
// Caption := 'Generando Reporte...' ;
{ nivel := -1 ;
 Recurre('') ;
 QTemp.First ;}
end;

end.
