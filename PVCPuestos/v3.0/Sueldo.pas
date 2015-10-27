unit Sueldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFSueldo = class(TPFDetalle)
    PagCon: TPageControl;
    TabNuevo: TTabSheet;
    TabBorra: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Sueldo: TDBEdit;
    Ini: TDBEdit;
    Button1: TButton;
    QAnt: TQuery;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GrabaUpdate ; override ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSueldo: TFSueldo;

implementation

{$R *.DFM}

procedure TFSueldo.FormCreate(Sender: TObject);
begin
  inherited;
 height := 256 ;
 width := 350 ;
end;

procedure TFSueldo.GrabaUpdate ;
begin
 if PagCon.ActivePage= TabNuevo
 then QUpdate.ExecSql
 else begin
  QInsert.ExecSql ;
  QAnt.Open ;
  Fmodulo.Query1.FieldByName('VCPU_Sueldo').AsCurrency :=
   QAnt.FieldByName('Sueldo').AsCurrency ;
  FModulo.Query1.FieldByName('VCPU_Ini').AsDateTime :=
   QAnt.FieldByName('Ini').AsDateTime ;
 end ;
end ;

end.
