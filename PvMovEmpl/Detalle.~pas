unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFDetalle = class(TPFDetalle)
    PagCon: TPageControl;
    Tab1: TTabSheet;
    Tab2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Empl: TDBEdit;
    Conp: TDBEdit;
    Descrip: TDBEdit;
    LVMOV_EMPL: TEdit;
    LVMOV_Conp: TEdit;
    Acum: TDBEdit;
    FecIni: TDBEdit;
    Movi: TDBEdit;
    FecFin: TDBEdit;
    Total: TDBEdit;
    Expr: TDBMemo;
    PerDed: TDBRadioGroup;
    Quin: TDBRadioGroup;
    Texto: TDBMemo;
    AntTerc: TDBCheckBox;
    Difer: TDBCheckBox;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SFdo: TDBEdit;
    Prog: TDBEdit;
    URes: TDBEdit;
    LVMOV_SFdo: TEdit;
    LVMOV_Prog: TEdit;
    LVMOV_URes: TEdit;
    Label15: TLabel;
    Banco: TDBEdit;
    LVMOV_Banco: TEdit;
    Label16: TLabel;
    Susp: TDBCheckBox;
    Label17: TLabel;
    Cnta: TDBEdit;
    LVMOV_Cnta: TEdit;
    Label18: TLabel;
    SCta: TDBEdit;
    LScta: TEdit;
    QSCta: TQuery;
    QAuxi: TQuery;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure CntaValida(Sender: TField);
    procedure SctaValida(Sender: TField);
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
 height := 545 ;
 width := 465 ;
 FModulo.Query1.FieldByName('VMOV_Cnta').OnValidate := CntaValida ;
 FModulo.Query1.FieldByName('VMOV_SCta').OnValidate := SCtaValida ;
end;

procedure TFDetalle.Inivar ;
begin
 PagCon.ActivePage := Tab1 ;
 if modo= 3 then
  begin
   FModulo.Query1['VMOV_FecIni'] := Date ;
   FModulo.Query1['VMOV_PerDed'] := 'D' ;
   FModulo.Query1['VMOV_Quin'] := 'A' ;
   FModulo.Query1['VMOV_AntTerc'] := 'N' ;
   FModulo.Query1['VMOV_Difer'] := 'N' ;
   FModulo.Query1['VMOV_Susp'] := 'N' ;
  end ;
 SCTAValida(nil) ;

 // Validamos para cuando ya se halla aplicado
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
   Empl.TabStop := False ;
   Empl.ReadOnly := True ;
   Empl.Color := clMenu ;

   Conp.TabStop := False ;
   Conp.ReadOnly := True ;
   Conp.Color := clMenu ;

   Descrip.TabStop := False ;
   Descrip.ReadOnly := True ;
   Descrip.Color := clMenu ;

   PerDed.Enabled := False ;
   Quin.Enabled := False ;

   AntTerc.TabStop := False ;
   AntTerc.ReadOnly := True ;
   AntTerc.Color := clMenu ;

   Difer.TabStop := False ;
   Difer.ReadOnly := True ;
   Difer.Color := clMenu ;

   FecIni.TabStop := False ;
   FecIni.ReadOnly := True ;
   FecIni.Color := clMenu ;

   Expr.TabStop := False ;
   Expr.ReadOnly := True ;
   Expr.Color := clMenu ;
 end ;

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
 FModulo.Query1['VMOV_Nombre'] := LVMOV_EMPL.Text ;

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
