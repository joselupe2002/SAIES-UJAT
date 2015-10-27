unit Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFCancela = class(TPFDetalle)
    Label1: TLabel;
    FecCancel: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCancela: TFCancela;

implementation

{$R *.DFM}

procedure TFCancela.FormCreate(Sender: TObject);
begin
  inherited;
 Height := 180 ;
 Width := 340 ;
 FModulo.Query1['NOMI_FecCancel'] :=
  FModulo.Query1.FieldByName('NOMI_Fecha').AsDateTime ;
end;

end.
