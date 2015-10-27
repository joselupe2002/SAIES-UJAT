unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask;

type
  TFDetalle = class(TPFDetalle)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    EmplH: TDBEdit;
    Persona: TDBEdit;
    Texto: TDBMemo;
    LVMOV_EMPLH: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Movi: TDBEdit;
    LVMOV_Persona: TEdit;
    Expr: TDBMemo;
    Label3: TLabel;
    Acum: TDBEdit;
    FecIni: TDBEdit;
    FecFin: TDBEdit;
    Total: TDBEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
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
 Height := 400 ;
 Width := 475 ;
end;

procedure TFDetalle.Inivar ;
begin
 if modo= 3 then
 FModulo.Query1['VMOV_FecIni'] := Date ;

// Validamos para cuando ya se halla aplicado
 if modo= 2 then
  begin
   qVal.Close ;
   qVal.Sql.Clear ;
   qVal.DataSource := ModDs ;
   qVal.Sql.Add('SELECT * FROM PHDPAGOS Where DPAG_Movi= :VMOV_Movi') ;
   qVal.Open ;
  end ;

 if (modo= 2) and not qVal.Eof then
 begin
  EmplH.TabStop := False ;
  EmplH.ReadOnly := True ;
  EmplH.Color := clMenu ;

  Persona.TabStop := False ;
  Persona.ReadOnly := True ;
  Persona.Color := clMenu ;

  Texto.TabStop := False ;
  Texto.ReadOnly := True ;
  Texto.Color := clMenu ;

  Expr.TabStop := False ;
  Expr.ReadOnly := True ;
  Expr.Color := clMenu ;

  FecIni.TabStop := False ;
  FecIni.ReadOnly := True ;
  FecIni.Color := clMenu ;
 end ;

end ;

procedure TFDetalle.DesInivar ;
begin
 if  FModulo.Query1.FieldByName('VMOV_Movi').IsNull then
  begin
   QVal.Close ;
   QVal.Sql.Clear ;
   QVal.Sql.Add('Select PSQMovims.NextVal As Sigue From Dual') ;
   QVal.Open ;
   FModulo.Query1['VMOV_Movi'] := QVal['Sigue'] ;
 //  FModulo.Query1['VMOV_Nombre'] := LVMOV_EmplH.Text ;
   QVal.Close ;
  end ;

 FModulo.Query1['VMOV_Nombre'] := LVMOV_EmplH.Text ;
//showmessage(FModulo.Query1['VMOV_Nombre'].asString);
end ;

end.
  