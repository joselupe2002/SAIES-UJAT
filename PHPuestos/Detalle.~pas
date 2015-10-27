unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, DBCGrids;

type
  TFDetalle = class(TPFDetalle)
    PageCon: TPageControl;
    TabDatos: TTabSheet;
    TabCateg: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Puesto: TDBEdit;
    Descrip: TDBEdit;
    TPSto: TDBEdit;
    Suel_Alt: TDBCheckBox;
    Texto: TDBMemo;
    LPUES_TPsto: TEdit;
    DBGrid1: TDBGrid;
    QCateg: TQuery;
    DSCateg: TDataSource;
    QCategCPUE_CATEG: TStringField;
    QCategCPUE_DESCRIP: TStringField;
    QCategCPUE_SUELDO: TFloatField;
    QCategCPUE_INI: TDateTimeField;
    Label5: TLabel;
    Conpp: TDBEdit;
    LPUES_Conp: TEdit;
    Label3: TLabel;
    CatDefa: TDBEdit;
    Profesor: TDBCheckBox;
    FPago: TDBRadioGroup;
    Label4: TLabel;
    LPUES_Categ_Defa: TEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure vProfe(Sender : TField) ;
    function RNombre : String ; override ;
    function rCampo(Sender:TField) : String ; override ;
    procedure GrabaInsert ; override ;

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
 Height := 440 ;
 Width :=  520 ;
 FModulo.Query1.FieldByName('PUES_Profe').OnValidate := vProfe ;
end;

procedure TFDetalle.Inivar ;
begin
 if modo= 3 then
  begin
   FModulo.Query1['PUES_Suel_Alt'] := 'N' ;
   FModulo.Query1['PUES_Profe'] := 'N' ;
   FModulo.Query1['PUES_FPago'] := 'M' ;

   TabCateg.Free ;
   TabDatos.TabVisible := False ;

   CatDefa.ReadOnly := True ;
   CatDefa.TabStop := False ;
   CatDefa.Color := clMenu ;
  end
 else QCateg.Open ;
 PageCon.ActivePage := TabDatos ;
end ;

procedure TFDetalle.vProfe(Sender : TField) ;
begin
 FPago.TabStop := True ;
 FPago.ReadOnly := False ;

 if FModulo.Query1.FieldByName('PUES_Profe').AsString= 'S' then
  begin
   FModulo.Query1.FieldByName('PUES_Fpago').AsString := 'H' ;
   FPago.TabStop := False ;
   FPago.ReadOnly := True ;
  end ;

end ;

function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 if result= 'CatDefa' then with VSql do
  begin
   Add('SELECT');
   Add(' CPUE_Categ As Categoria,'  );
   Add(' CPUE_Descrip As Descripcion' );
   Add('From PHCPUESTOS');
   Add('Where CPUE_Psto= '''+
     FModulo.Query1.FieldByName('PUES_Psto').AsString+ '''' );
  end ;
end ;

function TFDetalle.RCampo(Sender : TField) : String ;
begin
 VSql.Clear ;
 result := copy(Sender.FieldName,6,30) ;
 if result= 'CATEG_DEFA' then with VSql do
  begin
   Add('SELECT');
   Add(' CPUE_Categ As Categoria,'  );
   Add(' CPUE_Descrip As Descripcion' );
   Add('From PHCPUESTOS');
   Add('Where CPUE_Psto= '''+
     FModulo.Query1.FieldByName('PUES_Psto').AsString+ '''' );
  end ;
end ;

procedure TFDetalle.GrabaInsert ;
begin
 inherited ;

// Sembramos el nuevo valor de la Categoria x Default
 qVal.Close ;
 qVal.Sql.Clear ;
 qVal.DataSource := ModDs ;
 qVal.Sql.Add('SELECT CPUE_Categ As Categ') ;
 qVal.Sql.Add('From PHCPUESTOS') ;
 qVal.Sql.Add('Where CPUE_Psto= :PUES_Psto') ;
 qVal.Open ;
 FModulo.Query1['PUES_Categ_Defa'] := QVal.FieldByName('Categ').AsString ;

 qVal.Close ;
 qVal.Sql.Clear ;
 qVal.DataSource := nil ;
end ;



end.
