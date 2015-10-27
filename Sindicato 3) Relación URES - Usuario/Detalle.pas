unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria ;

  type

  TFDetalle = class(TPFDetalle)
    Label9: TLabel;
    USUARIO: TDBEdit;
    Label4: TLabel;
    Label1: TLabel;
    URES: TDBEdit;
    Label2: TLabel;
    LURES_USUARIO: TEdit;
    LURES_URES: TEdit;
    Label3: TLabel;
    NUM: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure NUMKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;

implementation


//uses Repo;

{$R *.DFM}





procedure TFDetalle.FormCreate(Sender: TObject);
begin
// Data := TdmDatos.Create(FDetalle) ;
 inherited;
 Height := 250;
 Width :=  554 ;
end;




procedure TFDetalle.NUMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
KEY:=#0;
end;

end.
