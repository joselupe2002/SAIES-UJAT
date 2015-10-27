unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFDetalle = class(TPFDetalle)
    Panel1: TPanel;
    Pago: TDBEdit;
    Tipo: TDBEdit;
    Nomina: TDBEdit;
    Label24: TLabel;
    Label2: TLabel;
    Fecha: TDBEdit;
    FecCancel: TDBEdit;
    Label4: TLabel;
    PagCon: TPageControl;
    TabDatos: TTabSheet;
    TabDetalle: TTabSheet;
    Cheque: TDBEdit;
    Label8: TLabel;
    CtaBco: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Banco: TDBEdit;
    LVPAG_Banco: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Percs: TDBEdit;
    Dedus: TDBEdit;
    Neto: TDBEdit;
    Ambos: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    QDetalle: TQuery;
    DSDetalle: TDataSource;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    Psto: TDBEdit;
    LVPAG_Psto: TEdit;
    Label16: TLabel;
    LCateg: TEdit;
    Categ: TDBEdit;
    Label17: TLabel;
    LVPAG_URes: TEdit;
    URes: TDBEdit;
    Empl: TDBEdit;
    LVPAG_Empl: TEdit;
    Label1: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Nomb: TDBEdit;
    Label6: TLabel;
    TPlaza: TDBEdit;
    LVPAG_TPlaza: TEdit;
    LVPAG_Nomb: TEdit;
    QDetalleDPAGO: TFloatField;
    QDetallePERDED: TStringField;
    QDetalleCONP: TStringField;
    QDetalleDESCRIP: TStringField;
    QDetalleMONTO: TFloatField;
    QDetalleMOVI: TFloatField;
    QDetalleDIAS: TFloatField;
    QDetalleTMOVI: TStringField;
    Label5: TLabel;
    Dias: TDBEdit;
    TPsto: TDBEdit;
    LVPAG_TPsto: TEdit;
    Label7: TLabel;
    Label20: TLabel;
    FDias: TDBEdit;
    Label21: TLabel;
    NomPer: TDBEdit;
    Label3: TLabel;
    LVPAG_TEmpl: TEdit;
    TabPolis: TTabSheet;
    dbgPolCan: TDBGrid;
    qPolCan: TQuery;
    dsPolCan: TDataSource;
    qPolCanDescrip: TStringField;
    qPolCanPolid: TFloatField;
    TabCursos: TTabSheet;
    dbgCursos: TDBGrid;
    qCursos: TQuery;
    dsCursos: TDataSource;
    qCursosCURS_Ciclo: TStringField;
    qCursosCURS_Carrera: TStringField;
    qCursosCURS_Materia: TStringField;
    qCursosMATE_Descrip: TStringField;
    qCursosCURS_URes: TStringField;
    Label22: TLabel;
    Quejas: TQuery;
    DSQuejas: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

{$R *.DFM}

procedure TFDetalle.FormCreate(Sender: TObject) ;
begin
 inherited ;
 Height := 515 ;
 Width := 610 ;

 if not FModulo.Query1.FieldByName('VPAG_FecCancel').IsNull
 then FecCancel.Color := clRed ;

 cadena := FModulo.Query1.FieldByName('VPAG_TEmpl').AsString ;
 QDetalle.Open ;
 qPolCan.Open ;
 qCursos.Open ;
 PagCon.ActivePage := TabDatos ;

 Quejas.Open;
 if Quejas.FieldByName('Cuenta_quejas').AsInteger > 0 then
         ShowMessage('Tienes ' + Quejas.FieldByName('Cuenta_quejas').AsString + ' queja(s) en status Pendiente');

end;

end.
