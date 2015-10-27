unit Repo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PRepo, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, libreria, QRPrntr,
  ImgList, Menus, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, modulo, clipbrd;

type
  TFRepo = class(TPFRepo)
    QRLabel4: TQRLabel;
    Detalle: TQRBand;
    QTemp: TQuery;
    Label2: TLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DataSource1: TDataSource;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QDirigido: TQuery;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QcopiaU: TQuery;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QcopiaD: TQuery;
    QcopiaT: TQuery;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText16: TQRDBText;
    QDirigidoNOMDIRIGIDO: TStringField;
    QDirigidoPUESTODIRIGIDO: TStringField;
    QDirigidoURESDIRIGIDO: TStringField;
    QcopiaDNOMCOPIAD: TStringField;
    QcopiaTNOMCOPIAT: TStringField;
    QcopiaUNOMCOPIAU: TStringField;
    QTempVNOM_NOMB: TFloatField;
    QTempCONT: TStringField;
    QTempFECHA: TStringField;
    QTempEMPL: TStringField;
    QTempNOMBRE: TStringField;
    QTempNOMB: TFloatField;
    QTempPUESTO: TStringField;
    QTempURES: TStringField;
    QTempFINICIO: TStringField;
    QTempFIN: TStringField;
    QTempMOTIVO: TMemoField;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
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
  FRepo: TFRepo;
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


procedure TFRepo.FormCreate(Sender: TObject);
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
