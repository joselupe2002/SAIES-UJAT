unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids ;

type
  TFDetalle = class(TPFDetalle)
    Label3: TLabel;
    Empl: TDBEdit;
    Label2: TLabel;
    Movi: TDBEdit;
    LVPRE_Empl: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    FecIni: TDBEdit;
    FecFin: TDBEdit;
    Porc: TDBRadioGroup;
    Label4: TLabel;
    CuotaF: TDBEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

{$R *.DFM}


procedure TFDetalle.FormCreate(Sender: TObject);
begin
 inherited;
 Height := 260 ;
 Width :=  550 ;
end;

procedure TFDetalle.Inivar ;
begin
 if modo=3 then
  BEGIN
   FModulo.Query1.FieldByName('VPRE_Porc').AsString := '2' ;
   FModulo.Query1.FieldByName('VPRE_FECINI').AsString := '01/01/2002' ;
  END;
end ;



procedure TFDetalle.DesInivar ;
begin
 if FModulo.Query1.FieldByName('VPRE_Movi').IsNull then
 begin
  QVal.Close ;
  QVal.Sql.Clear ;
  QVal.Sql.Add('Select PsqMovims.NextVal As Sigue From Dual') ;
  QVal.Open ;
  FModulo.Query1['VPRE_Movi'] := QVal['Sigue'] ;
 end ;

 FModulo.Query1['VPRE_Nombre'] := LVPRE_Empl.Text ;
end ;


end.
