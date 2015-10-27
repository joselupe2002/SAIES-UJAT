unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, libreria ;

  type
   mygrid=class(TStringGrid)
      public
        procedure MoveColumn(FromIndex, ToIndex: Longint);
        procedure MoveRow(FromIndex, ToIndex: Longint);
      end;

  TFDetalle = class(TPFDetalle)
    PagCon: TPageControl;
    TabDatos: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Numero: TDBEdit;
    URES: TDBEdit;
    LVSOL_URES: TEdit;
    Label11: TLabel;
    Fecha: TDBEdit;
    Label12: TLabel;
    OBS: TDBMemo;
    Label17: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    GRID: TStringGrid;
    DESCRIP: TDBEdit;
    q: TQuery;
    m: TLabel;
    QPrin: TQuery;
    Label3: TLabel;
    OBSRH: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure Acepta_Seleccion ;  override;
    function RNombre : String ; override;
    procedure Inivar ; OVERRIDE;
    procedure GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grabaDetalle;
    procedure GRIDKeyPress(Sender: TObject; var Key: Char);
    procedure getDescripGrid;
    procedure cargaDetalle;
    procedure GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FechaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  Ling, colg:integer;
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
var
x,y:integer;
begin
 for x:=1 to g.RowCount-1 do
   for y:=0 to g.ColCount-1 do
       g.cells[y,x]:='';

end;

{===============================================================================
 Procedimiento para Borrar una Linea de un StringGrid
 ===============================================================================}
procedure borra_row(sender:tobject; lin:integer);
begin
   with mygrid(sender) do
   begin
      rowmoved(lin,rowcount-1);
      rows[rowcount-1].clear;
      rowcount:=rowcount-1;
   end;
end;

{===============================================================================
 Procedimiento Limpia una Linea de un StringGrid
 ===============================================================================}
procedure limpia_linea(sender:tobject;linea:integer);
var
x:integer;
begin
   with mygrid(sender) do
     begin
        for x:=0 to colcount-1 do
            cells[x,linea]:='';
     end;
end;


procedure TFDetalle.cargaDetalle;
begin

QPrin.close;
QPrin.sql.text:='SELECT * FROM psolevendet WHERE sole_solicitud='+#39+numero.text+#39+
' ORDER BY sole_nomb, sole_psto';
SAVETOFILELOG(QPrin.sql.text);
QPrin.OPEN;
limpiagrid(grid);
grid.rowcount:=2;
QPrin.first;
while not(QPrin.eof) do
  begin
     grid.cells[0,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_NOMB').asstring;
     colg:=0; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;
     grid.cells[1,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_PSTO').asstring;
     colg:=1; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;
     grid.cells[2,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_CANT').asstring;
     grid.cells[3,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_AUTORIZADO').asstring;

     grid.cells[4,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_INI').asstring;
     grid.cells[5,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_FIN').asstring;

     grid.cells[6,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_DIAINI').asstring;
          colg:=6; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;

     grid.cells[7,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_DIAFIN').asstring;
          colg:=7; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;

     grid.cells[8,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_HORAINI').asstring;
     grid.cells[9,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_HORAFIN').asstring;
     colg:=9; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;

     grid.cells[10,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_MOTIVO').asstring;
     colg:=10; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;

     grid.cells[11,grid.rowcount-1]:=QPrin.fieldbyname('SOLE_TURNO').asstring;

     QPrin.next;
     grid.rowcount:=grid.rowcount+1;
  end;
end;


procedure TFDETALLE.getDescripGrid;
var
NewCol:integer;
tipo:string;
begin

  IF TABU THEN newCol:=colg-1 else newcol:=colg;

  if NewCol=0 then
      begin
         Q.close;
         q.sql.text:='SELECT * FROM PVNOMBRAM, PPUESTOS WHERE SYSDATE BETWEEN VNOM_Ini AND VNOM_Fin '+
         'AND VNOM_PSTO=PUES_PSTO AND VNOM_TPsto IN ('+#39+'A'+#39+','+#39+'G'+#39+') AND vnom_ures= '+
         #39+ures.field.asstring+#39+ ' AND VNOM_NOMB='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
         SAVETOFILELOG(Q.SQL.TEXT);
         Q.open;
         GRID.cells[0,ling]:=q.fieldbyname('VNOM_NOMB').asstring+'-'+q.fieldbyname('VNOM_NOMBRE').asstring;
         GRID.cells[1,ling]:=q.fieldbyname('VNOM_PSTO').asstring+'-'+q.fieldbyname('PUES_DESCRIP').asstring;
      end;

 if NewCol=1 then
      begin
         Q.CLOSE;
         Q.sql.text:='SELECT * FROM PPUESTOS S WHERE PUES_PSTO='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
         q.OPEN;
         GRID.cells[1,ling]:=q.fieldbyname('PUES_PSTO').asstring+'-'+q.fieldbyname('PUES_DESCRIP').asstring;
      end;

  if NewCol=6 then
      begin
         Q.CLOSE;
         Q.sql.text:='SELECT * FROM SDIASEM S WHERE DIAS_CLAVE='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
         q.OPEN;
         GRID.cells[6,ling]:=q.fieldbyname('DIAS_CLAVE').asstring+'-'+q.fieldbyname('DIAS_DESCRIP').asstring;
      end;

  if NewCol=7 then
      begin
         Q.CLOSE;
         Q.sql.text:='SELECT * FROM SDIASEM S WHERE DIAS_CLAVE='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
         q.OPEN;
         GRID.cells[7,ling]:=q.fieldbyname('DIAS_CLAVE').asstring+'-'+q.fieldbyname('DIAS_DESCRIP').asstring;
      end;

    if NewCol=10 then
      begin
         Q.CLOSE;
         Q.sql.text:='SELECT * FROM SCATMOTIVO S WHERE CATM_CLAVE='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
         q.OPEN;
         GRID.cells[10,ling]:=q.fieldbyname('CATM_CLAVE').asstring+'-'+q.fieldbyname('CATM_DESCRIP').asstring;
      end;


  TABU:=FALSE;
end;


procedure TFDetalle.Inivar ;
begin

LimpiafileLog('');
  IF (MODO=1) OR (MODO=2) THEN
      cargaDetalle;


end ;


procedure TFDetalle.Acepta_Seleccion ;
var campo : TField ;
begin

 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

 if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  and (colg=0) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString+'-'+QVal.Fields[1].AsString;
       TStringGrid(VControl).cells[1,Ling]:=QVal.Fields[5].AsString+'-'+QVal.Fields[6].AsString;
       TStringGrid(VControl).cells[2,Ling]:='1';
    end;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  and (colg=1) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString+'-'+QVal.Fields[1].AsString;
    end;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  and (colg=1) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString+'-'+QVal.Fields[1].AsString;
    end;

    if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  and ((colg=5) or (colg=6)) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString+'-'+QVal.Fields[1].AsString;
    end;


 if campo <> nil then
 begin
  campo.DataSet.Edit ;
  campo.Value := QVal.Fields[0].Value ;
 end ;
 QVal.Close ;
 GValValid.Hide ;
 PCaptura.Show ;
 VControl.SetFocus ;


end ;



procedure TFDetalle.grabaDetalle;
var
x:integer;
NS:INTEGER;

begin
q.close;
q.sql.text:='DELETE FROM PSOLEVENDET WHERE SOLE_SOLICITUD='+#39+NUMERO.Text+#39;
Q.ExecSQL;
for x:=1 to grid.rowcount-1 do
   begin
      if (grid.cells[0,x]<>'') OR (grid.cells[1,x]<>'') then
         begin
            Q.close;
            q.sql.text:='INSERT INTO PSOLEVENDET (SOLE_numero,SOLE_SOLICITUD,sole_nomb,'+
            'Sole_psto,SOLE_CANT,SOLE_AUTORIZADO,sole_ini,sole_fin,SOLE_DIAINI, SOLE_DIAFIN, sole_motivo, '+
            'SOLE_HORAINI, SOLE_HORAFIN, SOLE_TURNO ) values ('+
            'PSQSOLEVENDET.nextval'+','+
            #39+NUMERO.TEXT+#39+','+
            #39+str_(grid.cells[0,x],'-')+#39+','+
            #39+str_(grid.cells[1,x],'-')+#39+','+
            #39+grid.cells[2,x]+#39+','+
            #39+grid.cells[3,x]+#39+','+

            #39+grid.cells[4,x]+#39+','+
            #39+grid.cells[5,x]+#39+','+
            #39+STR_(grid.cells[6,x],'-')+#39+','+
            #39+str_(grid.cells[7,x],'-')+#39+','+
            #39+str_(grid.cells[10,x],'-')+#39+','+
            #39+grid.cells[8,x]+#39+','+
            #39+grid.cells[9,x]+#39+','+
            #39+STR_(grid.cells[11,x],'-')+#39+')';

            SAVETOFILELOG(Q.sql.text);
            q.EXECSQL;
         end;
   end;

end;



function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;
 IF RESULT='URES' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('URES_URES AS URES,');
       Vsql.Add('URES_DESCRIP AS DESCRIP');
       Vsql.Add('FROM FURES');
       Vsql.Add('WHERE URES_URES IN (SELECT B.URES_URES FROM SURESUSER B WHERE B.URES_USUARIO=USER)');
       //Tipos de puesto A y G de la Ordinari
     end;
 {
if (result= 'GRID') and (colg=1) and (linG>0)  then
 begin
  VSql.add('SELECT ');
  VSql.add('PUES_PSTO AS PUESTO,');
  VSql.add('PUES_DESCRIP AS DESCRIPCION');
  VSql.add('FROM PPUESTOS');
  VSql.add('WHERE PUES_TPSTO IN ('+#39+'A'+#39+','+#39+'G'+#39+')');
  VSql.add('ORDER BY PUESTO');
 end;

if (result= 'GRID') and (colg=0) and (linG>0)  then
 begin
  VSql.add('SELECT ');
  VSql.add('VNOM_NOMB NOMB,');
  VSql.add('VNOM_NOMBRE NOMBRE,');
  VSql.add('VNOM_EMPL EMPL,');
  VSql.add('VNOM_INI  INICIA,');
  VSql.add('VNOM_FIN  TERMINA,');
  VSql.add('VNOM_PSTO PSTO,');
  VSql.add('PUES_DESCRIP PSTOD');
  VSql.add('FROM PVNOMBRAM , PPUESTOS ');
  VSql.add('WHERE SYSDATE BETWEEN VNOM_Ini AND VNOM_Fin');
  VSql.add('AND VNOM_PSTO=PUES_PSTO');
  VSql.add('AND VNOM_TPsto IN ('+#39+'A'+#39+','+#39+'G'+#39+')');
  Vsql.Add('AND vnom_ures= '+#39+ures.field.asstring+#39);
  VSql.add('ORDER BY PSTO');
 end;

if (result= 'GRID') and ((colg=5) or (colg=6)) and (linG>0)  then
 begin
  VSql.add('SELECT ');
  VSql.add('DIAS_CLAVE CLAVE,');
  VSql.add('DIAS_DESCRIP DESCRIPCION');
  VSql.add('FROM SDIASEM');
 end;       }


end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
// Data := TdmDatos.Create(FDetalle) ;
 inherited;
 TABU:=FALSE;
 Height := 666 ;
 Width :=  851 ;

 IF MODO=3 then
    BEGIN
      fecHA.FIELD.asstring:=formatdatetime('dd/mm/yyyy',date);
    end;

 grid.Cells[0,0]:='1) Nombramiento que Sustituye (Opcional)';
 grid.Cells[1,0]:='2) Puesto que se solicita';
 grid.Cells[2,0]:='3) No. Personas';
 grid.Cells[3,0]:='4) Autorizados';

 grid.Cells[4,0]:='5) Fecha Ini.';
 grid.Cells[5,0]:='6) Fecha Fin';
 grid.Cells[6,0]:='7) Día Inicia';
  grid.Cells[7,0]:='8) Día Termina';
 grid.Cells[8,0]:='9) Hora Inicia';
  grid.Cells[9,0]:='10) Hora Termina';
 grid.Cells[10,0]:='11) Motivo de la solicitud';
 COLG:=0;
 lING:=1;


end;

procedure TFDetalle.GrabaInsert ;
begin
 IF MODO=3 THEN
     begin
        Q.CLOSE;
        q.sql.text:='SELECT PSQSolEven.NEXTVAL FROM DUAL';
        q.OPEN;
        NUMERO.FIELD.Asstring:=Q.FIELDS[0].ASSTRING;
     end;

 qInsert.ExecSql ;
 GrabaDetalle ;
 Limpiagrid(grid);
 GRID.ROWCOUNT:=2;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
  qUpdate.ExecSql ;
  GrabaDetalle ;
  Limpiagrid(grid);
  GRID.ROWCOUNT:=2;
end ;



procedure TFDetalle.GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
ling:=arow;
colg:=acol;
IF ACOL=0 THEN
   m.caption:='1) Número de Nombramiento del empleado que se sustituye (si asi se requiere).. Oprima la tecla F8 para buscar los nombramientos de la URES Seleccionada';
IF ACOL=1 THEN
   m.caption:='2) Clave del Puesto que se solicita (Oprima F8 para ver el catálogo de puestos)';
IF ACOL=2 THEN
   m.caption:='3) No. de solicitudes o personas que se requieren para dicho puesto';
IF ACOL=3 THEN
   m.caption:='4) Fecha en la que iniciará a laboral el personal que se solicita (dd/mm/aaaa)';
IF ACOL=4 THEN
   m.caption:='5) Fecha en la que terminará de laborar el personal que se solicita (dd/mm/aaaa)';
IF ACOL=5 THEN
   m.caption:='6) F8 para buscar el día de la semana en que empieza su periodo laboral p.e. si es de Lunes a Viernes, se coloca 1-Lunes';
IF ACOL=6 THEN
   m.caption:='7) F8 para buscar el día de la semana en que termina su periodo laboral p.e. si es de Lunes a Viernes, se coloca 5-Viernes';

IF ACOL=7 THEN
   m.caption:='8) Hora en la que iniciará a laborar cada día el personal solicitado Formato HH:MM';
IF ACOL=8 THEN
   m.caption:='9) Hora en la que terminará de laborar cada día el personal solicitado Formato HH:MM';
IF ACOL=9 THEN
   m.caption:='10) Motivo por el cual se solicita a este puesto en específico';

IF ACOL=3 THEN
  GRID.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColMoving,goEditing,goTabs]
else
    GRID.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColMoving];

end;

procedure TFDetalle.GRIDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (colg<>3) then
     key:=#0;
  if (colg=3) then
     key:=Knumero(key);
  IF (linG=(sender as TstringGrid).rowcount-1)  THEN
      KEY:=#0;
end;

procedure TFDetalle.GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < Grid.FixedRows) or (ACol < Grid.FixedCols) then
    Grid.Canvas.Brush.Color := clBtnFace
  else
    Grid.Canvas.Brush.Color := clWhite;

  if ARow=(sender as TstringGrid).RowCount-1 then
           (sender as TstringGrid).Canvas.Brush.Color := $00C1E8BF;

  if Grid.Cells[0,ARow]='' then
           Grid.Canvas.Brush.Color := $00BDFDF9;

  if acol=3 then
       begin
          grid.Canvas.Font.Style:=[fsBold];
          Grid.Canvas.Brush.Color :=$00AEF0E0;
       end;

  Grid.Canvas.FillRect(Rect);
  Texto := Grid.Cells[acol,ARow];
  DrawText( Grid.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;


procedure TFDetalle.FechaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=#0;
end;

end.
