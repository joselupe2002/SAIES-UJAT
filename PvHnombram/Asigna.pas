unit Asigna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, clipbrd;

type
  TFAsigna = class(TPFDetalle)
    PagCon: TPageControl;
    TabNuevo: TTabSheet;
    Label1: TLabel;
    losciclos: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure GrabaUpdate ; override ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsigna: TFAsigna;

implementation

{$R *.DFM}

procedure TFAsigna.FormCreate(Sender: TObject);
var
  x:integer;
  cadena:String[100];
begin
  inherited;
 height := 204 ;
 width := 576 ;


 Qval.SQL.Clear;
 Cadena := 'Select Cicl_Ciclo ||''_''|| Cicl_Descrip As Ciclo From Eciclos';
 Qval.SQL.Add(Cadena);
 Qval.Open;

 If Qval.RecordCount > 0 then
    for x:=1 to Qval.recordcount do
     begin
      losciclos.Items.Add(Qval.Fields.FieldByName('Ciclo').AsString);
      Qval.Next;
     end;

end;

procedure TFAsigna.GrabaUpdate ;
begin

  if trim(losciclos.text) <> '' then
   begin
    Qinsert.Params.ParamValues['VCON_NOMB'] := clipboard.AsText;
    Qinsert.Params.ParamValues['VCON_CICLOE'] := trim(copy(losciclos.text,1,7));
    QInsert.ExecSql ;
   end
   else
     begin
     showmessage('Debe elegir un Ciclo Escolar');
     Exit;
     end;

{  Fmodulo.Query1.FieldByName('VCPU_Sueldo').AsCurrency :=
   QAnt.FieldByName('Sueldo').AsCurrency ;
  FModulo.Query1.FieldByName('VCPU_Ini').AsDateTime :=
   QAnt.FieldByName('Ini').AsDateTime ;}

end ;

end.
