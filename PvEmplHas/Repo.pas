unit Repo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PRepo, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, libreria, QRPrntr,
  ImgList, Menus, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, modulo, clipbrd, jpeg,
  Grids, DBGrids;

type
  TFRepo = class(TPFRepo)
    QRLabel4: TQRLabel;
    QTemp: TQuery;
    Label2: TLabel;
    QRLabel5: TQRLabel;
    DataSource1: TDataSource;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QFOTO: TQuery;
    QTempEMPL: TStringField;
    QTempRFC: TStringField;
    QTempNOMBRE: TStringField;
    QTempCURP: TStringField;
    QTempNUMSS: TStringField;
    QTempFOTO: TBlobField;
    QTempDIR: TMemoField;
    QTempTEL: TStringField;
    QTempSEXO: TStringField;
    QTempFNACI: TDateTimeField;
    QTempEDOCIV: TStringField;
    QTempESCOLARIDAD: TStringField;
    QTempDESCRIPCION: TStringField;
    QTempFINGRESO: TDateTimeField;
    QTempFECHA: TStringField;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel32: TQRLabel;
    FOTO: TQRImage;
    QFOTOPERS_FOTO: TBlobField;
    QTempANTIG: TStringField;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QPstoUrA: TQuery;
    QPstoUrAPSTO: TStringField;
    QPstoUrAURES: TStringField;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QPstoUrD: TQuery;
    QRDBText7: TQRDBText;
    QPstoDet: TQuery;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QEsdeped: TQuery;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QTempCORREO: TStringField;
    QTempCALIDAD: TStringField;
    QEsdepedESDEPED: TStringField;
    QRLabel16: TQRLabel;
    QRDBText17: TQRDBText;
    QPstoUrDPSTO2: TStringField;
    QPstoUrDURES2: TStringField;
    QPstoUrDTPLAZA2: TStringField;
    QPstoUrDSUELDO2: TFloatField;
    QPstoUrDHORAS2: TFloatField;
    QPstoDetPSTO3: TStringField;
    QPstoDetURES3: TStringField;
    QPstoDetTPLAZA3: TStringField;
    QPstoDetSUELDO3: TFloatField;
    QPstoDetHORAS3: TFloatField;
    QRDBText27: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel19: TQRLabel;
    Qescolaridad: TQuery;
    QescolaridadESCOLARIDAD: TStringField;
    QescolaridadABREVIATURA: TStringField;
    QescolaridadPROFESION: TStringField;
    QescolaridadUNIVERSIDAD: TStringField;
    QescolaridadFECHA_OBTENCION: TDateTimeField;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel20: TQRLabel;
    GroupHeaderBand1: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel33: TQRLabel;
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
var mjpg : TJPEGImage ;
begin
  inherited;

{qtemp.close;
qtemp.open;}

QTEMP.CLOSE;
QTEMP.Params.ParamValues['PERSONA'] := clipboard.AsText ;
//SHOWMESSAGE( QTEMP.Params.ParamValues['PERSONA']);
QTEMP.OPEN;

QPstoUrA.CLOSE;
QPstoUrA.Params.ParamValues['EMPL'] := clipboard.AsText ;
QPstoUrA.OPEN;

QPstoUrD.CLOSE;
QPstoUrD.Params.ParamValues['EMPL'] := clipboard.AsText ;
QPstoUrD.OPEN;

QPstoDet.CLOSE;
QPstoDet.Params.ParamValues['EMPL'] := clipboard.AsText ;
QPstoDet.OPEN;

QESDEPED.CLOSE;
QESDEPED.Params.ParamValues['EMPL'] := clipboard.AsText ;
QESDEPED.OPEN;

Qescolaridad.CLOSE;
Qescolaridad.Params.ParamValues['EMPL'] := clipboard.AsText ;
Qescolaridad.OPEN;


  QFoto.ParamByName('EMPL').AsString := clipboard.AsText ;
  QFoto.Close ;
  QFoto.Open ;

  if not QFoto.EOF then
   begin
    mjpg := TJPEGImage.Create ;
    if FileExists('45e#tmp.JPG')
    then DeleteFile('45e#tmp.JPG') ;
    TBlobField(QFoto.FieldByName('Pers_Foto')).SaveToFile('45e#tmp.JPG');
    mjpg.LoadFromFile('45e#tmp.JPG');
    Foto.Picture.assign(mjpg) ;
    mjpg.Free ;
   end ;



{QcopiaU.CLOSE;
QcopiaU.Params.ParamValues['EVENTUAL'] := clipboard.AsText ;
QcopiaU.OPEN;}

{LUniv.Caption := 'Universidad Juárez Autónoma de Tabasco' ;}
// Caption := 'Generando Reporte...' ;
{ nivel := -1 ;
 Recurre('') ;
 QTemp.First ;}
end;

end.
