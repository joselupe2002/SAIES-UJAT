unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids;

type
  TFDetalle = class(TPFDetalle)
    PagCon: TPageControl;
    TabMovi: TTabSheet;
    TabCrit: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Movi: TDBEdit;
    FecFin: TDBEdit;
    PerDed: TDBRadioGroup;
    LVMOV_Conp: TEdit;
    Conp: TDBEdit;
    Descrip: TDBEdit;
    FecIni: TDBEdit;
    Expr: TDBMemo;
    Quin: TDBRadioGroup;
    Texto: TDBMemo;
    Mes: TDBComboBox;
    qDetalle: TQuery;
    dsDetalle: TDataSource;
    dbcgDetalle: TDBCtrlGrid;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    TPlaza: TDBEdit;
    URes: TDBEdit;
    TPsto: TDBEdit;
    Psto: TDBEdit;
    LTPlaza: TDBEdit;
    LURes: TDBEdit;
    LTPsto: TDBEdit;
    LPsto: TDBEdit;
    qDetalleTPLAZA: TStringField;
    qDetalleURES: TStringField;
    qDetalleTPSTO: TStringField;
    qDetallePSTO: TStringField;
    qTPlaza: TQuery;
    qURes: TQuery;
    qTPsto: TQuery;
    qPuestos: TQuery;
    qDetalleLTPlaza: TStringField;
    qDetalleLURes: TStringField;
    qDetalleLTPsto: TStringField;
    qDetalleLPsto: TStringField;
    qdDetalle: TQuery;
    qiDetalle: TQuery;
    Label13: TLabel;
    qTempl: TQuery;
    qDetalleTEMPL: TStringField;
    qDetalleLTEmpl: TStringField;
    TEmpl: TDBEdit;
    LTEmpl: TDBEdit;
    SPIUJAT: TDBEdit;
    Label14: TLabel;
    qDetalleSPIUJAT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure GrabaDetalle ;

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
 height := 500 ;
 width := 510 ;
 qDetalleSPIUJAT.ValidChars := ['S','N'] ;
end;

procedure TFDetalle.Inivar ;
begin
 PagCon.ActivePageIndex := 0 ;
 qDetalle.Open ;
 if modo= 3 then
  begin
   FModulo.Query1['VMOV_Mes'] := '00' ;
   FModulo.Query1['VMOV_PerDed'] := 'P' ;
   FModulo.Query1['VMOV_Quin'] := 'A' ;
   FModulo.Query1['VMOV_FecIni'] := Date ;
  end ;

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
    Perded.Enabled := False ;
    Quin.Enabled := False ;
    Mes.Enabled := False ;

    Conp.TabStop := False ;
    Conp.ReadOnly := True ;
    Conp.Color := ClMenu ;

    Descrip.TabStop := False ;
    Descrip.ReadOnly := True ;
    Descrip.Color := ClMenu ;

    Expr.TabStop := False ;
    Expr.ReadOnly := True ;
    Expr.Color := ClMenu ;

    FecIni.TabStop := False ;
    FecIni.ReadOnly := True ;
    FecIni.Color := ClMenu ;
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

end ;

procedure TFDetalle.GrabaInsert ;
begin
 QInsert.ExecSql ;
 GrabaDetalle ;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 QUpdate.ExecSql ;
 GrabaDetalle ;
end ;

procedure TFDetalle.GrabaDetalle ;
begin
 qiDetalle.ParamByName('Movi').AsInteger :=
  FModulo.Query1.FieldByName('VMOV_Movi').AsInteger ;
 qdDetalle.ExecSql ;
 qDetalle.First ;
 while not qDetalle.eof do
  begin
   qiDetalle.ExecSql ;
   qDetalle.Next ;
  end ;
end ;


end.
