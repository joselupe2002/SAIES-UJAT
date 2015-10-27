unit BRepo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PRepo, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, libreria, QRPrntr,
  ImgList, Menus, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, modulo, clipbrd;

type
  TFBRepo = class(TPFRepo)
    QTemp: TQuery;
    Label2: TLabel;
    QRLabel6: TQRLabel;
    DataSource1: TDataSource;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QDirigido: TQuery;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QcopiaU: TQuery;
    QcopiaD: TQuery;
    QcopiaT: TQuery;
    QRDBText16: TQRDBText;
    QDirigidoNOMDIRIGIDO: TStringField;
    QDirigidoPUESTODIRIGIDO: TStringField;
    QDirigidoURESDIRIGIDO: TStringField;
    QcopiaDNOMCOPIAD: TStringField;
    QcopiaTNOMCOPIAT: TStringField;
    QcopiaUNOMCOPIAU: TStringField;
    Detalle: TQRBand;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QTempVNOM_NOMB: TFloatField;
    QTempCONT: TStringField;
    QTempNOMBRE: TStringField;
    QTempFECHA: TStringField;
    QTempMOTIVO: TMemoField;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape8: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape4: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape5: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape9: TQRShape;
    QTempEMPL: TStringField;
    QTempNOMB: TFloatField;
    QTempPUESTO: TStringField;
    QTempURES: TStringField;
    QTempFINICIO: TStringField;
    QRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    Quser: TQuery;
    QuserUSER: TStringField;
    QuserSYSDATE: TDateTimeField;
    QRDBText18: TQRDBText;
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
  FBRepo: TFBRepo;
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


procedure TFBRepo.FormCreate(Sender: TObject);
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

QUSER.CLOSE;
QUSER.OPEN;

{LUniv.Caption := 'Universidad Juárez Autónoma de Tabasco' ;}
// Caption := 'Generando Reporte...' ;
{ nivel := -1 ;
 Recurre('') ;
 QTemp.First ;}
end;

end.
