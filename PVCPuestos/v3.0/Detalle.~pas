unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask;

type
  TFDetalle = class(TPFDetalle)
    PageCon: TPageControl;
    TabDatos: TTabSheet;
    TabHisto: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Psto: TDBEdit;
    Categ: TDBEdit;
    Descrip: TDBEdit;
    Sueldo: TDBEdit;
    Inicio: TDBEdit;
    LVCPU_Psto: TEdit;
    QHist: TQuery;
    DSHist: TDataSource;
    dbgSueldos: TDBGrid;
    QHistSUELDO: TFloatField;
    QHistDESDE: TDateTimeField;
    QHistHASTA: TDateTimeField;
    qPsto: TQuery;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure vPsto(Sender : TField) ;
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
  height := 280 ;
  width :=  460 ;
  FModulo.Query1.FieldByName('VCPU_Psto').OnValidate := vPsto ;
end;

procedure TFDetalle.Inivar ;
begin
 PageCon.ActivePage := TabDatos ;
 vPsto(nil) ;

 if modo= 3
 then TabHisto.Free
 else QHist.Open ;
end ;

procedure TFDetalle.vPsto(Sender : TField) ;
begin
 qPsto.Close ;
 qPsto.Open ;
 if qPsto.FieldByName('FPago').AsString= 'H'
 then Label3.Caption := '  Sueldo x HSM :'
 else Label3.Caption := 'Sueldo Mensual :'
end ;

end.
