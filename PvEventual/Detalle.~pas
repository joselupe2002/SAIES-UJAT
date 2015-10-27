unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids ;

  type
  TFDetalle = class(TPFDetalle)
    PagCon: TPageControl;
    TabDatos: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Nomb: TDBEdit;
    URes: TDBEdit;
    Psto: TDBEdit;
    Empl_Nomb: TDBEdit;
    Nomina: TDBEdit;
    Even: TDBEdit;
    Empl: TDBEdit;
    LVEVE_Empl: TEdit;
    LVEVE_Nomb: TEdit;
    Nombre: TDBEdit;
    LURes: TDBEdit;
    LPsto: TDBEdit;
    FecIni: TDBEdit;
    FecFin: TDBEdit;
    TabGuardias: TTabSheet;
    qGuardias: TQuery;
    qGuardiasDIAS: TDateTimeField;
    qGuardiasTURNO: TStringField;
    qGuardiasLTurno: TStringField;
    dsGuardias: TDataSource;
    qdGuardias: TQuery;
    qiGuardias: TQuery;
    qTurnos: TQuery;
    dbgGuardias: TDBGrid;
    Label10: TLabel;
    Cont: TDBEdit;
    Label11: TLabel;
    Fecha: TDBEdit;
    Label12: TLabel;
    Motivo: TDBMemo;
    Label9: TLabel;
    DIRIGIDO: TDBEdit;
    LVEVE_DIRIGIDO: TEdit;
    Label13: TLabel;
    COPIAU: TDBEdit;
    LVEVE_COPIAU: TEdit;
    Label14: TLabel;
    COPIAD: TDBEdit;
    LVEVE_COPIAD: TEdit;
    Label15: TLabel;
    COPIAT: TDBEdit;
    LVEVE_COPIAT: TEdit;
    Label16: TLabel;
    qNomb: TQuery;
    dsNomb: TDataSource;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Ingreso: TDBEdit;
    Baja: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure cVNom(Sender : TField) ;
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure GrabaDetalle ; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

uses Repo;

//uses Repo;

{$R *.DFM}




procedure TFDetalle.FormCreate(Sender: TObject);
begin
// Data := TdmDatos.Create(FDetalle) ;
 inherited;

 Height := 666 ;
 Width :=  591 ;

 FModulo.Query1.FieldByName('VEVE_Nomb').OnValidate := cVNom ;

end;

procedure TFDetalle.Inivar ;
begin
 if ModDs.DataSet= nil
 then ModDs.DataSet := FModulo.Query1 ;

 if modo=1 then
  begin
   dbgGuardias.ReadOnly := True ;
   dbgGuardias.Color := clMenu ;
  end ;

 PagCon.ActivePage := TabDatos ;
 qNomb.Open ;
 qGuardias.Open ;
end ;


procedure TFDetalle.DesInivar ;
begin
 if FModulo.Query1.FieldByName('VEVE_Even').IsNull then
 begin
  QVal.Close ;
  QVal.Sql.Clear ;
  QVal.Sql.Add('Select PsqEventual.NextVal As Sigue From Dual') ;
  QVal.Open ;
  FModulo.Query1['VEVE_Even'] := QVal['Sigue'] ;
 end ;

 FModulo.Query1['VEVE_Nombre'] := LVEVE_Empl.Text ;
end ;


procedure TFDetalle.cVNom(Sender : TField) ;
begin
 qNomb.Close ;
 QNomb.Open ;
end ;

procedure TFDetalle.GrabaInsert ;
begin
 qInsert.ExecSql ;
 GrabaDetalle ;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 qUpdate.ExecSql ;
 GrabaDetalle ;
end ;

procedure TFDetalle.GrabaDetalle ;
begin
 qdGuardias.ExecSql ;
 qiGuardias.ParamByName('Even').AsInteger := FModulo.Query1['VEVE_Even'] ;
 qGuardias.First ;
 while not qGuardias.eof do
  begin
   qiGuardias.ExecSql ;
   qGuardias.Next ;
  end ;
end ;


end.
