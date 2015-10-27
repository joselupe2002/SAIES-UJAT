unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFDetalle = class(TPFDetalle)
    Label1: TLabel;
    Label3: TLabel;
    PerDed: TDBRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Acum: TDBEdit;
    FecIni: TDBEdit;
    Total: TDBEdit;
    Movi: TDBEdit;
    FecFin: TDBEdit;
    Nomb: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    LVMOV_Conp: TEdit;
    Conp: TDBEdit;
    Descrip: TDBEdit;
    QVNomb: TQuery;
    Empl: TDBEdit;
    Expr: TDBMemo;
    Label13: TLabel;
    Quin: TDBRadioGroup;
    Texto: TDBMemo;
    Label2: TLabel;
    dsNomb: TDataSource;
    NEmpl: TDBEdit;
    URes: TDBEdit;
    NURes: TDBEdit;
    Psto: TDBEdit;
    NPsto: TDBEdit;
    QAuxi: TQuery;
    QSCta: TQuery;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Cnta: TDBEdit;
    SCta: TDBEdit;
    LVMOV_Cnta: TEdit;
    LScta: TEdit;
    Susp: TDBCheckBox;
    Gravable: TDBCheckBox;
    Label17: TLabel;
    CantGrav: TDBEdit;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cNomb(Sender : TField) ;
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure CntaValida(Sender: TField) ;
    procedure SctaValida(Sender: TField) ;
    function rnombre : String ; override ;

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
 height := 712 ;
 width := 475 ;
 Fmodulo.Query1.FieldByName('VMOV_Nomb').OnChange := cNomb ;
 FModulo.Query1.FieldByName('VMOV_Cnta').OnValidate := CntaValida ;
 FModulo.Query1.FieldByName('VMOV_SCta').OnValidate := SCtaValida ;
end;


procedure TFDetalle.Inivar ;
begin
 SCTAValida(nil) ;

 if modo= 3 then
  begin
   FModulo.Query1['VMOV_Quin'] := 'A' ;
   FModulo.Query1['VMOV_PerDed'] := 'D' ;
   FModulo.Query1['VMOV_FecIni'] := Date ;
   FModulo.Query1['VMOV_Susp'] := 'N' ;
   FModulo.Query1['VMOV_Gravable'] := 'N';
  end ;

 cNomb(nil) ;

 if modo= 2 then
  begin
   qVal.Close ;
   qVal.Sql.Clear ;
   qVal.DataSource := ModDs ;
   qVal.Sql.Add('SELECT * FROM PDPAGOS Where DPAG_Movi= :VMOV_Movi') ;
   qVal.Open ;
  end ;

 if (modo= 2) and not qVal.Eof then
  begin
   Nomb.TabStop := False ;
   Nomb.ReadOnly := True ;
   Nomb.Color := clMenu ;

   Perded.Enabled := False ;
   Quin.Enabled := False ;

   Conp.TabStop := False ;
   Conp.ReadOnly := True ;
   Conp.Color := clMenu ;

   Descrip.TabStop := False ;
   Descrip.ReadOnly := True ;
   Descrip.Color := clMenu ;

   FecIni.TabStop := False ;
   FecIni.ReadOnly := True ;
   FecIni.Color := clMenu ;

   Expr.TabStop := False ;
   Expr.ReadOnly := True ;
   Expr.Color := clMenu ;
  end ;
 qVal.DataSource := nil ;
end ;

procedure TFDetalle.DesInivar ;
begin
 if FModulo.Query1.FieldByName('VMOV_Movi').IsNull then
 begin
  QVal.Close ;
  QVal.Sql.Clear ;
  QVal.SQL.Add('Select PSQMovims.NextVal as Sigue From Dual') ;
  QVal.Open ;
  FModulo.Query1['VMOV_Movi'] := QVal['Sigue'] ;
 end ;

 if FModulo.Query1.FieldByName('VMOV_Descrip').AsString= ''
 then FModulo.Query1['VMOV_Descrip'] := LVMOV_Conp.Text ;

 FModulo.Query1['VMOV_Empl'] := Empl.Text ;
 FModulo.Query1['VMOV_Nombre'] := NEmpl.Text ;
end ;


procedure TFDetalle.cNomb(Sender : TField) ;
begin
 QVNomb.Close ;
 QVNomb.Open ;
end ;

procedure TFDetalle.CntaValida(Sender: TField);
begin
 FModulo.Query1.FieldByName('VMOV_SCta').Clear ;
end;


procedure TFDetalle.SCTAValida(Sender: TField);
begin
 QSCta.Close ;
 QSCta.Open ;
 LSCta.Text := qSCta.FieldByName('LScta').AsString ;
end;

function TFDetalle.Rnombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;
 QAuxi.Close ;
 QAuxi.Open ;

 if (result= 'SCta') and not QAuxi.eof then
  if QAuxi.FieldByName('Auxi').AsString = 'x'
  then VSql.Add('Select SUBC_SCta As SCta, SUBC_Descrip As Descripcion '+
        'From FSUBCUEN Where SUBC_ICta= '''+
        QAuxi.FieldByName('ICta').AsString + '''')
  else
   VSQL.Add('Select AUXI_Clave As Clave, AUXI_Descrip As Descripcion ' +
        'From '+ QAuxi.FieldByName('Auxi').AsString ) ;
end ;


end.
