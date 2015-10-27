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
    PagCon: TPageControl;
    TabDatos: TTabSheet;
    Label4: TLabel;
    NUMERO: TDBEdit;
    LVBOL_NUMERO: TEdit;
    Q: TQuery;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    participacion: TDBCheckBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    s: TQuery;
    rfc: TEdit;
    curp: TEdit;
    telefono: TEdit;
    correo: TEdit;
    genero: TEdit;
    DIRECCION: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    CONTACTOS: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    activo: TEdit;
    Fecha: TDBEdit;
    Label9: TLabel;
    GRID: TStringGrid;
    agPres: TSpeedButton;
    GRIDP: TStringGrid;
    agPresp: TSpeedButton;
    QPrin: TQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    M: TLabel;
    mp: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    function RNombre : String ; override;
    procedure Acepta_Seleccion ; override;
    procedure NUMEROChange(Sender: TObject);
    procedure GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GRIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure agPresClick(Sender: TObject);
    procedure getDescripGrid;
    procedure GRIDKeyPress(Sender: TObject; var Key: Char);
    procedure GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GRIDPDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GRIDPKeyPress(Sender: TObject; var Key: Char);
    procedure GRIDPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDPSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure agPrespClick(Sender: TObject);
    procedure getDescripGridP;
    procedure cargaDetalle;
    procedure cargaDetalleP;
    procedure grabaDetalleP;
    procedure grabaDetalle;
    procedure Inivar ; OVERRIDE;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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
var
l:TstringList;
begin
l:=TStringList.create();
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;


 {===============================================================================
 Graba una cadena al archivo LOG que se encuentra en la carpeta File
 ===============================================================================}
procedure savetofileLog(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
if not(fileexists(extractfiledir(paramstr(0))+'\log.txt')) then
    l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.LoadFromFile(extractfiledir(paramstr(0))+'\log.txt');
l.Add(DATETOSTR(DATE)+' '+TIMETOSTR(NOW)+ '--> '+s);
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;


 {===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin
   if pos(separador,cad)>0 then
      str_:=copy(cad,1,pos(separador,cad)-1)
   else
      str_:=cad;
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


procedure TFDetalle.Acepta_Seleccion ;
var campo : TField ;
begin

 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRID')
 then TStringGrid(VControl).cells[Colg,Ling]:=QVal.Fields[0].asstring+'-'+QVal.Fields[1].asstring  ;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRIDP')
 then TStringGrid(VControl).cells[Colgp,Lingp]:=QVal.Fields[0].asstring+'-'+QVal.Fields[1].asstring ;


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


procedure TFDetalle.Inivar ;
begin

LimpiafileLog('');
  IF (MODO=1) OR (MODO=2) THEN
     BEGIN
      cargaDetalle;
      cargaDetallep;
     END;


end ;



function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;
 IF RESULT='NUMERO' THEN
     begin
       Vsql.Add('SELECT');
       Vsql.Add('PERS_Persona As Persona,');
       Vsql.Add('TRIM(SUBSTR(PERS_NOMBRE||'+#39+' '+#39+ '||PERS_APEPAT||'+#39+' '+#39+'||PERS_APEMAT,1,90)) As Descrip,');
       Vsql.Add('PERS_Empleado As Empleado,');
       Vsql.Add('PERS_Nombre As Nombre,');
       Vsql.Add('PERS_ApePat As ApePat,');
       Vsql.Add('PERS_ApeMat As ApeMat');
       Vsql.Add('From FINANZAS.FPersonas');
     end;
if (result= 'GRID') and (colg=0) and (linG<>grid.rowcount-1)  then
 begin
   VSql.add('SELECT');
   VSql.add('CATC_CLAVE AS PERSONA,');
   VSql.add('CATC_DESCRIP AS CURSO');
   VSql.add('FROM SCATCURSOS ');
end;

if (result= 'GRIDP') and (colgP=0) and (linGP<>gridp.rowcount-1)  then
 begin
   VSql.add('SELECT');
   VSql.add('PUES_PSTO AS PUESTO,');
   VSql.add('PUES_DESCRIP AS DESCRIPCION');
   VSql.add('FROM PPUESTOS ');
   VSql.add('WHERE PUES_TPSTO IN ('+#39+'A'+#39+','+#39+'G'+#39+')');
   VSql.add('ORDER BY PUESTO');
end;


end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
// Data := TdmDatos.Create(FDetalle) ;
 inherited;
 Height := 666 ;
 Width :=  591 ;
 IF MODO=3 then
    BEGIN
      fecHA.FIELD.asstring:=formatdatetime('dd/mm/yyyy',date);
    end;
 GRID.CELLS[0,0]:='CURSO';
 GRID.CELLS[1,0]:='FECHA (DD/MM/YYYY)';
 GRID.CELLS[2,0]:='VENCIMIENTO (DD/MM/YYYY)';
 TABU:=FALSE;
 Ling:=1;
 colg:=0;
 LingP:=1;
 ColgP:=0;
end;

procedure TFDetalle.cargaDetalle;
begin

QPrin.close;
QPrin.sql.text:='SELECT * FROM SBOLCURSOS WHERE BOLC_EMPL='+#39+numero.text+#39+
' ORDER BY BOLC_CURSO';
SAVETOFILELOG(QPrin.sql.text);
QPrin.OPEN;
limpiagrid(grid);
grid.rowcount:=2;
QPrin.first;
while not(QPrin.eof) do
  begin
     grid.cells[0,grid.rowcount-1]:=QPrin.fieldbyname('BOLC_CURSO').asstring;
     colg:=0; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;
     grid.cells[1,grid.rowcount-1]:=QPrin.fieldbyname('BOLC_FECHA').asstring;
     grid.cells[2,grid.rowcount-1]:=QPrin.fieldbyname('BOLC_FVENCE').asstring;
     QPrin.next;
     grid.rowcount:=grid.rowcount+1;
  end;
end;


procedure TFDetalle.cargaDetallep;
begin

QPrin.close;
QPrin.sql.text:='SELECT * FROM SBOLPSTO WHERE BOLP_EMPL='+#39+numero.text+#39+
' ORDER BY BOLP_PSTO';
SAVETOFILELOG(QPrin.sql.text);
QPrin.OPEN;
limpiagrid(gridP);
gridp.rowcount:=2;
QPrin.first;
while not(QPrin.eof) do
  begin
     gridp.cells[0,gridp.rowcount-1]:=QPrin.fieldbyname('BOLP_PSTO').asstring;
     colgP:=0; lingP:=gridp.rowcount-1; TABU:=FALSE; getdescripGridP;
     QPrin.next;
     gridp.rowcount:=gridp.rowcount+1;
  end;
end;


procedure TFDetalle.grabaDetalleP;
var
x:integer;
NS:INTEGER;

begin
q.close;
q.sql.text:='DELETE FROM SBOLPSTO WHERE BOLp_EMPL='+#39+NUMERO.Text+#39;
Q.ExecSQL;

for x:=1 to gridp.rowcount-1 do
   begin
      if (gridp.cells[0,x]<>'') OR (gridp.cells[1,x]<>'') then
         begin
            Q.close;
            q.sql.text:='INSERT INTO SBOLPSTO (bolP_empl,bolp_psto)'+
            ' values ('+
            #39+NUMERO.TEXT+#39+','+
            #39+str_(gridp.cells[0,x],'-')+#39+')';
            SAVETOFILELOG(q.sql.text);
            q.EXECSQL;
         end;
   end;

end;



procedure TFDetalle.grabaDetalle;
var
x:integer;
NS:INTEGER;

begin
q.close;
q.sql.text:='DELETE FROM SBOLCURSOS WHERE BOLC_EMPL='+#39+NUMERO.Text+#39;
Q.ExecSQL;

for x:=1 to grid.rowcount-1 do
   begin
      if (grid.cells[0,x]<>'') then
         begin
            Q.close;
            q.sql.text:='INSERT INTO SBOLCURSOS (bolc_empl,bolc_curso, bolc_fecha, bolc_fvence)'+
            ' values ('+
            #39+NUMERO.TEXT+#39+','+
            #39+str_(grid.cells[0,x],'-')+#39+','+
            #39+grid.cells[1,x]+#39+','+
            #39+grid.cells[2,x]+#39+')';
            SAVETOFILELOG(q.sql.text);
            q.EXECSQL;
         end;
   end;
end;



procedure TFDetalle.GrabaInsert ;
begin
 qInsert.ExecSql ;
 GrabaDetalle ;
 GrabaDetalleP ;
 limpiagrid(grid);
 grid.rowcount:=2;
 limpiagrid(gridp);
 gridp.rowcount:=2;
 PAGcON.ActivePageIndex:=0;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 qUpdate.ExecSql ;
 GrabaDetalle ;
 GrabaDetalleP ;
 limpiagrid(grid);
 grid.rowcount:=grid.rowcount+1;
 limpiagrid(gridp);
 gridp.rowcount:=gridp.rowcount+1;

end ;

procedure TFDetalle.NUMEROChange(Sender: TObject);
begin
  inherited;
  s.close;
  s.sql.text:='SELECT * FROM PVEMPLDOS WHERE VEMP_EMPL='+#39+NUMERO.TEXT+#39;
  s.open;

  RFC.text:=S.fieldbyname('VEMP_RFC').asstring;
  CURP.text:=S.fieldbyname('VEMP_CURP').asstring;
  TELEFONO.text:=S.fieldbyname('VEMP_TELEFONO').asstring;
  CORREO.text:=S.fieldbyname('VEMP_EMAIL').asstring;
  GENERO.text:=S.fieldbyname('VEMP_SEXO').asstring;
  CONTACTOS.text:=S.fieldbyname('VEMP_CONTACTOS').asstring;
  DIRECCION.text:=S.fieldbyname('VEMP_DIRECCION').asstring;
  ACTIVO.text:=S.fieldbyname('VEMP_ACTIVO').asstring;
  TRY PARTICIPACION.Field.AsString:='N'; EXCEPT END;
  IF FECHA.TEXT='' THEN
      fecHA.FIELD.asstring:=formatdatetime('dd/mm/yyyy',date);

end;

procedure TFDetalle.GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < (sender as TstringGrid).FixedRows) or (ACol < (sender as TstringGrid).FixedCols) then
    (sender as TstringGrid).Canvas.Brush.Color := clBtnFace
  else
    (sender as TstringGrid).Canvas.Brush.Color := CLWHITE;

  if ARow=(sender as TstringGrid).RowCount-1 then
           (sender as TstringGrid).Canvas.Brush.Color := $00C1E8BF;

  (sender as TstringGrid).Canvas.Font.Size:=8;
  (sender as TstringGrid).Canvas.Font.Style:=[fsbold];
  (sender as TstringGrid).Canvas.Font.Color:=clblack;
  (sender as TstringGrid).Canvas.FillRect(Rect);
  Texto := (sender as TstringGrid).Cells[acol,ARow];
  DrawText( (sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);
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
         q.sql.text:='SELECT * FROM SCATCURSOS WHERE CATC_CLAVE='+#39+str_(GRID.cells[NEWCOL,ling],'-')+#39;
         Q.OPEN;
         GRID.cells[0,ling]:=q.fieldbyname('CATC_CLAVE').asstring+'-'+q.fieldbyname('CATC_DESCRIP').asstring;
       END;

  TABU:=FALSE;
end;


procedure TFDETALLE.getDescripGridP;
var
NewCol:integer;
tipo:string;
begin
  IF TABU THEN newCol:=ColgP-1 else newcol:=ColgP;
  if NewCol=0 then
      begin

         Q.close;
         q.sql.text:='SELECT * FROM PPUESTOS WHERE PUES_PSTO='+#39+str_(GRIDp.cells[NEWCOL,LingP],'-')+#39;
         Q.OPEN;
         GRIDp.cells[0,LingP]:=q.fieldbyname('PUES_PSTO').asstring+'-'+q.fieldbyname('PUES_DESCRIP').asstring;
       END;

  TABU:=FALSE;
end;



procedure TFDetalle.GRIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

 if (key=45) then //F2 ...Agregar
     agPresClick(nil);

IF ((colg-1=0) OR (colg-1=2) OR (colg-1=3) ) AND (KEY=9) then
    begin
       tabu:=true; getDescripGrid;
   end;


 IF (COLG=0) AND  (KEY=9) AND (linG=(sender as TstringGrid).rowcount-1) AND ((sender as TstringGrid).rowcount>2) THEN
     begin agPresClick(nil);   end;

end;

procedure TFDetalle.agPresClick(Sender: TObject);
begin
  inherited;
Grid.RowCount:=grid.RowCount+1;
end;

procedure TFDetalle.GRIDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
IF (KEY=#13) and (colg=0) and (linG<>(sender as TstringGrid).rowcount-1)  then
   getDescripGrid;

if ((colg=1) OR (colg=2) ) and (linG<>(sender as TstringGrid).rowcount-1)  then
   key:=kfecha(key);

IF (linG=(sender as TstringGrid).rowcount-1)  THEN
   KEY:=#0;


end;

procedure TFDetalle.GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
Ling:=aROW;
colg:=aCOL;
IF COLG=0 THEN
   m.caption:='F8 - Para buscar la clave de Cursos que el empleado ha tomado';
IF COLG=1 THEN
   m.caption:='Fecha en la cual se tomo el curso Formato (dd/mm/yyyy)';
IF COLG=2 THEN
   m.caption:='Fecha de vencimiento del curso Formato (dd/mm/yyyy)';

end;

procedure TFDetalle.GRIDPDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < (sender as TstringGrid).FixedRows) or (ACol < (sender as TstringGrid).FixedCols) then
    (sender as TstringGrid).Canvas.Brush.Color := clBtnFace
  else
    (sender as TstringGrid).Canvas.Brush.Color := CLWHITE;

  if ARow=(sender as TstringGrid).RowCount-1 then
           (sender as TstringGrid).Canvas.Brush.Color := $00C1E8BF;

  (sender as TstringGrid).Canvas.Font.Size:=8;
  (sender as TstringGrid).Canvas.Font.Style:=[fsbold];
  (sender as TstringGrid).Canvas.Font.Color:=clblack;
  (sender as TstringGrid).Canvas.FillRect(Rect);
  Texto := (sender as TstringGrid).Cells[acol,ARow];
  DrawText( (sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);
end;


procedure TFDetalle.GRIDPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
IF (KEY=#13) and (ColgP=0) and (LingP<>(sender as TstringGrid).rowcount-1)  then
   getDescripGridP;

IF (LingP=(sender as TstringGrid).rowcount-1)  THEN
   KEY:=#0;

end;

procedure TFDetalle.GRIDPKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if (key=46) AND  (LingP<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),LingP);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

 if (key=45) then //F2 ...Agregar
     agPresPClick(nil);

IF ((ColgP-1=0)) AND (KEY=9) then
    begin
       tabu:=true; getDescripGridP;
   end;


 IF (ColgP=0) AND  (KEY=9) AND (LingP=(sender as TstringGrid).rowcount-1) AND ((sender as TstringGrid).rowcount>2) THEN
     begin agPresClick(nil);   end;

end;

procedure TFDetalle.GRIDPSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
LingP:=aROW;
colgP:=aCOL;
IF COLGp=0 THEN
   mp.caption:='F8 - Para buscar la clave de Puesto que el empleado puede ocupar';
end;

procedure TFDetalle.agPrespClick(Sender: TObject);
begin
  inherited;
GridP.RowCount:=gridP.RowCount+1;

end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin

if   (LingP<>gridp.rowcount-1)  then
      begin
         if  gridP.rowcount>2 then
                borra_row(gridp,LingP);
         if  (gridp.rowcount=2) then
                limpia_linea(gridp,2);
      end;

END;

end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
        if   (Ling<>grid.rowcount-1)  then
            begin
               if  grid.rowcount>2 then
                      borra_row(grid,Ling);
               if  (grid.rowcount=2) then
                      limpia_linea(grid,2);
            end;
     END;
end;

end.
