unit Datos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmDatos = class(TDataModule)
    ModDs: TDataSource;
    qDCateg: TQuery;
    qICateg: TQuery;
    qCateg: TQuery;
    qCategCATEG: TStringField;
    qCategPSTO: TStringField;
    qCategLPsto: TStringField;
    qCategDESCRIP: TStringField;
    dsCateg: TDataSource;
    qPsto: TQuery;
    qCDescrip: TQuery;
    qIFoto: TQuery;
    dsCateg2: TDataSource;
    qCateg2: TQuery;
    qCateg2PSTO2: TStringField;
    qCateg2PDESCRIP2: TStringField;
    qCateg2CATEG2: TStringField;
    qCateg2DESCRIP2: TStringField;
    qCateg2CVURES2: TStringField;
    qCateg2URES2: TStringField;
    qCateg2SUELDO: TFloatField;
    qlSubfdo: TQuery;
    procedure qCategUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qCategCATEGChange(Sender: TField);
    procedure qCategPSTOChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

{$R *.DFM}

procedure TdmDatos.qCategUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
 UpdateAction := uaApplied ;
end;

procedure TdmDatos.qCategCATEGChange(Sender: TField);
begin
 QCDescrip.Close ;
 QCDescrip.Open ;
 qCategDESCRIP.AsString := QCDescrip.FieldByName('Descrip').AsString ;
end;

procedure TdmDatos.qCategPSTOChange(Sender: TField);
begin
 qCategCATEG.Clear ;
end;

end.
