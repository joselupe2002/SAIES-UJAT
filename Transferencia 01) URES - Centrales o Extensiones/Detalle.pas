unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria ;

  type

  TFDetalle = class(TPFDetalle)
    Label1: TLabel;
    URES: TDBEdit;
    Label2: TLabel;
    LTRAN_URES: TEdit;
    TRAN_DESCRIP: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    URESP: TDBEdit;
    LTRAN_URESP: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    AREA: TDBEdit;
    Label7: TLabel;
    URESA: TDBEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure NUMKeyPress(Sender: TObject; var Key: Char);
    procedure LTRAN_URESChange(Sender: TObject);
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
 Height := 284;
 Width :=  562 ;
end;




procedure TFDetalle.NUMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
KEY:=#0;
end;

procedure TFDetalle.LTRAN_URESChange(Sender: TObject);
begin
  inherited;
  TRAN_DESCRIP.Field.AsString:=LTRAN_URES.text;
end;

end.
