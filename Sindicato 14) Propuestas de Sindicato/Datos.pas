unit Datos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmDatos = class(TDataModule)
    ModDS: TDataSource;
    qPlaza: TQuery;
    dsPlaza: TDataSource;
    qDescCateg: TQuery;
    qReem: TQuery;
    dsReem: TDataSource;
    procedure QDetalleUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

{$R *.DFM}

procedure TdmDatos.QDetalleUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
 UpdateAction := uaApplied ;
end;

end.
