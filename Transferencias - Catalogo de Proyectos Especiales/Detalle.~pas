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
    NOMINA: TDBEdit;
    Label4: TLabel;
    Numero: TDBEdit;
    Label1: TLabel;
    q: TQuery;
    RTRAN_NOMINA: TEdit;
    Label2: TLabel;
    RUBRO: TDBComboBox;
    Label3: TLabel;
    SFDO: TDBComboBox;
    Label5: TLabel;
    AREA: TDBComboBox;
    Label6: TLabel;
    BANCO: TDBComboBox;
    Label7: TLabel;
    PROYECTO: TDBComboBox;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    function rnombre : String ; override ;
    procedure NOMINAChange(Sender: TObject);
    procedure RUBROChange(Sender: TObject);
    procedure SFDOChange(Sender: TObject);
    procedure AREAChange(Sender: TObject);
    procedure BANCOChange(Sender: TObject);
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


function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;


 IF RESULT='NOMINA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As NOMINA,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add('NOMI_FECINI As Inica,');
       Vsql.Add('NOMI_FECFIN As Termina');
       Vsql.Add('FROM TODANOMINAS');
       Vsql.Add('Where NOMI_FECINI>='+#39+'01/01/2015'+#39);
       Vsql.Add('AND NOMI_NOMINA IN (SELECT DISTINCT(TRAN_NOMINA) FROM PTRANSFERNOM)');
       SavetofileLog(vsql.text);
     end;




end;


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
 Height := 322;
 Width :=  626 ;

 //q.close;
 //q.sql.text:='SELECT

end;

procedure TFDetalle.GrabaInsert ;
begin
 qInsert.ExecSql ;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 qUpdate.ExecSql ;
end ;



procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
  RTRAN_NOMINA.TEXT:='';
  IF NOMINA.TEXT<>'' THEN
     BEGIN
        Q.CLOSE;
        q.sql.text:='select * from todanominas where nomi_nomina='+#39+nomina.text+#39+
        ' and nomi_nomina in (SELECT DISTINCT(TRAN_NOMINA) FROM PTRANSFERNOM)';
        q.OPEN;
     END;
  try RTRAN_NOMINA.TEXT:= Q.fieldbyname('NOMI_DESCRIP').asstring; EXCEPT END;
  if rtran_nomina.text<>'' then
     begin
       q.Close;
       q.sql.text:='SELECT DISTINCT(TRAN_RUBRO) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+#39+NOMINA.TEXT+#39;
       Q.open;
       rubro.clear;
       while not (q.eof) do
         begin
            rubro.Items.add(q.fields[0].asstring);
            q.next;
         end;

     end;

end;

procedure TFDetalle.RUBROChange(Sender: TObject);
begin
  inherited;
       q.Close;
       q.sql.text:='SELECT DISTINCT(TRAN_SFDO) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+#39+NOMINA.TEXT+#39+
       ' AND TRAN_RUBRO='+#39+RUBRO.TEXT+#39;
       Q.open;
       SFDO.clear;
       while not (q.eof) do
         begin
            SFDO.Items.add(q.fields[0].asstring);
            q.next;
         end;
end;

procedure TFDetalle.SFDOChange(Sender: TObject);
begin
  inherited;
       q.Close;
       q.sql.text:='SELECT DISTINCT(TRAN_AREA) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+#39+NOMINA.TEXT+#39+
       ' AND TRAN_RUBRO='+#39+RUBRO.TEXT+#39+
       ' AND TRAN_SFDO='+#39+SFDO.TEXT+#39;
       Q.open;
       AREA.clear;
       while not (q.eof) do
         begin
            AREA.Items.add(q.fields[0].asstring);
            q.next;
         end;
end;

procedure TFDetalle.AREAChange(Sender: TObject);
begin
  inherited;
       q.Close;
       q.sql.text:='SELECT DISTINCT(TRAN_BANCO) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+#39+NOMINA.TEXT+#39+
       ' AND TRAN_RUBRO='+#39+RUBRO.TEXT+#39+
       ' AND TRAN_SFDO='+#39+SFDO.TEXT+#39+' AND TRAN_AREA='+#39+AREA.TEXT+#39;
       Q.open;
       BANCO.clear;
       while not (q.eof) do
         begin
            BANCO.Items.add(q.fields[0].asstring);
            q.next;
         end;
end;

procedure TFDetalle.BANCOChange(Sender: TObject);
begin
  inherited;
       q.Close;
       q.sql.text:='SELECT DISTINCT(TRAN_PROY) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+#39+NOMINA.TEXT+#39+
       ' AND TRAN_RUBRO='+#39+RUBRO.TEXT+#39+
       ' AND TRAN_SFDO='+#39+SFDO.TEXT+#39+
       ' AND TRAN_AREA='+#39+AREA.TEXT+#39+
       ' AND TRAN_BANCO='+#39+BANCO.TEXT+#39;
       Q.open;
       PROYECTO.clear;
       while not (q.eof) do
         begin
            PROYECTO.Items.add(q.fields[0].asstring);
            q.next;
         end;
end;

end.
