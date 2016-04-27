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
    CUENTA: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CONVENIO: TDBEdit;
    RUBRO: TDBComboBox;
    Label5: TLabel;
    NUMREG: TDBEdit;
    BANCO: TDBComboBox;
    SFDO: TDBComboBox;
    Q: TQuery;
    AREA: TDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PROY: TDBComboBox;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure RUBROChange(Sender: TObject);
    procedure AREAChange(Sender: TObject);
    procedure SFDOChange(Sender: TObject);
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
 Height := 274;
 Width :=  590 ;
 Q.CLOSE;
 q.sql.text:='SELECT DISTINCT(A.TRAN_RUBRO) FROM PTRANSFERNOM A ORDER BY 1';
 Q.open;
 rubro.ITEMS.Clear;
 while not (q.eof) do
   begin
      rubro.Items.Add(q.fields[0].asstring);
      q.next;
   end;
 Rubro.items.add('%-Cuenta Default');

 Q.CLOSE;
 q.sql.text:='SELECT DISTINCT(CLAVE||'#39+'-'+#39+'||DESCRIP) FROM PTRANSFERNOM B, PCONTBANCTRANS A WHERE A.CLAVE IS NOT NULL '+
 ' AND CLAVE=B.TRAN_BANCO '+
 ' ORDER BY 1';
  savetofilelog(q.sql.text);
 Q.open;
 BANCO.ITEMS.Clear;
 while not (q.eof) do
   begin
      BANCO.Items.Add(q.fields[0].asstring);
      q.next;
   end;
  BANCO.Items.ADD('%-Todos');


 

 

end;

procedure TFDetalle.GrabaInsert ;
begin
 qInsert.ExecSql ;
 RUBRO.SETFOCUS;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 qUpdate.ExecSql ;
end ;



procedure TFDetalle.RUBROChange(Sender: TObject);
begin
  inherited;
 Q.CLOSE;
 q.sql.text:='SELECT DISTINCT(B.TRAN_SFDO) FROM PTRANSFERNOM B where b.TRAN_RUBRO LIKE '+#39+STR_(RUBRO.TEXT,'-')+#39+' ORDER BY 1';
 Q.open;
 SFDO.ITEMS.Clear;
 while not (q.eof) do
   begin
      SFDO.Items.Add(q.fields[0].asstring);
      q.next;
   end;
 SFDO.Items.ADD('%-Todos');
end;

procedure TFDetalle.AREAChange(Sender: TObject);
begin
  inherited;
Q.CLOSE;
 q.sql.text:='SELECT DISTINCT(TRAN_PROY) FROM PTRANSFERNOM B WHERE  '+
 ' B.TRAN_RUBRO LIKE '+#39+STR_(RUBRO.TEXT,'-')+#39+
 ' AND B.TRAN_SFDO LIKE '+#39+STR_(SFDO.TEXT,'-')+#39+
 ' AND B.TRAN_AREA LIKE '+#39+STR_(AREA.TEXT,'-')+#39+
 ' AND B.TRAN_BANCO LIKE '+#39+STR_(BANCO.TEXT,'-')+#39+
 ' AND TO_CHAR(B.TRAN_FECHA ,'+#39+'YYYY'+#39+')='+#39+formatdatetime('YYYY',NOW)+#39+
 ' ORDER BY 1';
 SAVETOFILELOG(Q.sql.text);
 Q.open;
 PROY.ITEMS.Clear;
 while not (q.eof) do
   begin
      PROY.Items.Add(q.fields[0].asstring);
      q.next;
   end;
  PROY.Items.ADD('%-Todos');


 
end;

procedure TFDetalle.SFDOChange(Sender: TObject);
begin
  inherited;
 Q.CLOSE;
 q.sql.text:='SELECT DISTINCT(B.TRAN_AREA) FROM PTRANSFERNOM B '+
 ' WHERE TRAN_RUBRO LIKE '+#39+STR_(RUBRO.TEXT,'-')+#39+
 ' AND TRAN_SFDO LIKE'+#39+STR_(SFDO.TEXT,'-')+#39+
 ' AND TRAN_AREA IS NOT NULL '+
 ' ORDER BY 1';
 savetofilelog(q.sql.text);
 Q.open;
 AREA.ITEMS.Clear;
 while not (q.eof) do
   begin
      AREA.Items.Add(q.fields[0].asstring);
      q.next;
   end;
 AREA.Items.ADD('%-Todos');
end;

end.
