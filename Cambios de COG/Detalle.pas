unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria ;

  type
   mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;

  TFDetalle = class(TPFDetalle)
    Label9: TLabel;
    Label4: TLabel;
    numdoc: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    COG: TDBEdit;
    Label5: TLabel;
    PROY: TDBComboBox;
    COGANT: TDBComboBox;
    NUMREG: TDBComboBox;
    Q: TQuery;
    Label6: TLabel;
    monto: TEdit;
    Shape1: TShape;
    Label7: TLabel;
    SCTANUE: TDBEdit;
    SCTAANT: TDBEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure PROYEnter(Sender: TObject);
    procedure COGANTEnter(Sender: TObject);
    procedure NUMREGEnter(Sender: TObject);
    procedure NUMREGChange(Sender: TObject);
    procedure numdocChange(Sender: TObject);
    procedure PROYChange(Sender: TObject);
    procedure COGANTChange(Sender: TObject);
    procedure COGChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;

implementation


//uses Repo;

{$R *.DFM}


procedure LimpiafileLog(s:string);
begin

end;


 {===============================================================================
 Graba una cadena al archivo LOG que se encuentra en la carpeta File
 ===============================================================================}
procedure savetofileLog(s:string);
begin

end;


 {===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin

end;


 {===============================================================================
 Procedimiento de Movimiento de Columna de un StringGrid
 ===============================================================================}
procedure mygrid.MoveColumn(FromIndex, ToIndex: Integer);
begin
  inherited;
end;


{===============================================================================
 Procedimiento de Movimiento de Linea de un StringGrid
 ===============================================================================}
procedure mygrid.MoveRow(FromIndex, ToIndex: Integer);
begin
  inherited;
end;

Procedure LimpiaGrid(g:TStringGrid);
begin

end;

{===============================================================================
 Procedimiento para Borrar una Linea de un StringGrid
 ===============================================================================}
procedure borra_row(sender:tobject; lin:integer);
begin
end;

{===============================================================================
 Procedimiento Limpia una Linea de un StringGrid
 ===============================================================================}
procedure limpia_linea(sender:tobject;linea:integer);

begin
end;




procedure TFDetalle.FormCreate(Sender: TObject);
begin
// Data := TdmDatos.Create(FDetalle) ;
 inherited;
 Height := 261;
 Width :=  554 ;
end;

procedure TFDetalle.GrabaInsert ;
begin
 qInsert.ExecSql ;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 qUpdate.ExecSql ;
end ;



procedure TFDetalle.PROYEnter(Sender: TObject);
begin
  inherited;
  proy.items.clear;
  q.close;
  q.SQL.TEXT:='SELECT DISTINCT(A.DODO_PROY) FROM FINANZAS.AFDODOCXP A WHERE '+
  'A.DODO_POLID='#39+NUMDOC.TEXT+#39+' ORDER BY A.DODO_PROY';
  Q.open;
  while not(q.eof) do
     begin
        PROY.Items.Add(q.fields[0].asstring);
        q.next;
     end;
end;

procedure TFDetalle.COGANTEnter(Sender: TObject);
begin
  inherited;
  COGANT.items.clear;
  q.close;
  q.SQL.TEXT:='SELECT DISTINCT(A.DODO_COG) FROM FINANZAS.AFDODOCXP A WHERE '+
  'A.DODO_POLID='#39+NUMDOC.TEXT+#39+
  ' AND A.DODO_PROY='+#39+PROY.TEXT+#39+' ORDER BY A.DODO_cog';
  Q.open;
  while not(q.eof) do
     begin
        COGANT.Items.Add(q.fields[0].asstring);
        q.next;
     end;

end;

procedure TFDetalle.NUMREGEnter(Sender: TObject);
begin
  inherited;
 NUMREG.items.clear;
  q.close;
  q.SQL.TEXT:='SELECT DISTINCT(DODO_RNGID) FROM FINANZAS.AFDODOCXP A WHERE '+
  'A.DODO_POLID='#39+NUMDOC.TEXT+#39+
  ' AND A.DODO_PROY='+#39+PROY.TEXT+#39+
  ' AND A.DODO_COG='#39+COGANT.TEXT+#39+' ORDER BY A.DODO_rngid';
  Q.open;
  while not(q.eof) do
     begin
        NUMREG.Items.Add(q.fields[0].asstring);
        q.next;
     end;
end;

procedure TFDetalle.NUMREGChange(Sender: TObject);
begin
  inherited;
   MONTO.CLEAR;
  Q.CLOSE;
  Q.SQL.TEXT:='SELECT DISTINCT(DODO_PUNIT), DODO_CNTA FROM FINANZAS.AFDODOCXP A WHERE '+
  'A.DODO_RNGID='#39+NUMREG.TEXT+#39;
  Q.open;
  monto.text:=formatfloat('#,#0.00',q.fields[0].asfloat);
  SCTAANT.Field.AsString:=Q.Fields[1].asstring;




end;

procedure TFDetalle.numdocChange(Sender: TObject);
begin
  inherited;
   MONTO.CLEAR;
end;

procedure TFDetalle.PROYChange(Sender: TObject);
begin
  inherited;
 MONTO.CLEAR;
end;

procedure TFDetalle.COGANTChange(Sender: TObject);
begin
  inherited;
 MONTO.CLEAR;
end;

procedure TFDetalle.COGChange(Sender: TObject);
begin
  inherited;
   IF copy(SCTAANT.TEXT,1,4)='2111' then
     begin
        q.close;
        q.sql.text:='SELECT DISTINCT(S.SUBCTA_PASIVO) FROM PMATREL S WHERE S.COG='+#39+COG.TEXT+#39;
        q.OPEN;
        SCTANUE.Field.AsString:=Q.Fields[0].asstring;

     end;
end;

end.
