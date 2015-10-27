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
    Label17: TLabel;
    Label19: TLabel;
    q: TQuery;
    QPrin: TQuery;
    Label2: TLabel;
    page: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LISTA: TStringGrid;
    BitBtn1: TBitBtn;
    GRID: TStringGrid;
    AG: TBitBtn;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    PER: TEdit;
    NOM: TEdit;
    CATEG: TEdit;
    RCATEG: TEdit;
    NOMB: TEdit;
    RNOMB: TEdit;
    Label11: TLabel;
    TURNO: TEdit;
    Rturno: TEdit;
    Label12: TLabel;
    SFDO: TEdit;
    RSFDO: TEdit;
    Label1: TLabel;
    Puesto: TEdit;
    puestod: TEdit;
    INICIA: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    termina: TEdit;
    Shape1: TShape;
    Label7: TLabel;
    URES: TEdit;
    RURES: TEdit;
    Label8: TLabel;
    Label13: TLabel;
    PROG: TEdit;
    RPROG: TEdit;
    Label14: TLabel;
    sldo: TEdit;
    Shape2: TShape;
    TabSheet4: TTabSheet;
    Label6: TLabel;
    VPSTO: TEdit;
    RVPSTO: TEdit;
    Lista2: TStringGrid;
    Label15: TLabel;
    numsol: TEdit;
    NUMDET: TEdit;
    Label16: TLabel;
    Label18: TLabel;
    NumReg: TEdit;
    Label20: TLabel;
    EL: TBitBtn;
    m: TLabel;
    BitBtn2: TBitBtn;
    TabSheet5: TTabSheet;
    Label21: TLabel;
    GRIDNP: TStringGrid;
    agnp: TBitBtn;
    elnp: TBitBtn;
    BitBtn3: TBitBtn;
    Shape3: TShape;
    Label22: TLabel;
    Shape4: TShape;
    Label23: TLabel;
    Shape5: TShape;
    Label24: TLabel;
    Shape6: TShape;
    Label25: TLabel;
    procedure FechaKeyPress(Sender: TObject; var Key: Char);
    procedure Inivar ; OVERRIDE;
    procedure PuestoChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PERChange(Sender: TObject);
        procedure Acepta_Seleccion ; override;
    function RNombre : String ; OVERRIDE;
    procedure CATEGChange(Sender: TObject);
    procedure LISTADblClick(Sender: TObject);
    procedure LISTASelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LISTADrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TURNOChange(Sender: TObject);
    procedure SFDOChange(Sender: TObject);
    procedure URESChange(Sender: TObject);
    procedure PROGChange(Sender: TObject);
    procedure NOMBChange(Sender: TObject);
    procedure GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GRIDKeyPress(Sender: TObject; var Key: Char);
    procedure GRIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    procedure getDescripGridNP;
procedure getDescripGrid;
    procedure AGClick(Sender: TObject);
    procedure ELClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure GRIDNPDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GRIDNPKeyPress(Sender: TObject; var Key: Char);
    procedure GRIDNPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRIDNPSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure agnpClick(Sender: TObject);
    procedure elnpClick(Sender: TObject);
    Procedure GuardaNp;
    procedure BitBtn3Click(Sender: TObject);
    procedure Lista2DblClick(Sender: TObject);
    procedure Lista2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Lista2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure VPSTOKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  Ling, colg:integer;
  Ling2, colg2:integer;
  Lingnp, colgnp:integer;
   TABUnp:BOOLEAN;
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


procedure TFDETALLE.getDescripGrid;
var
NewCol:integer;
tipo:string;
begin


  IF TABU THEN newCol:=colg-1 else newcol:=colg;

  if NewCol=1 then
      begin
         Q.close;
         q.sql.text:='SELECT * FROM SVBOLSAEVEN WHERE '+
         ' VBOL_NUMERO='+#39+GRID.cells[newcol,ling]+#39;
         SAVETOFILELOG(Q.SQL.TEXT);
         Q.open;
         GRID.cells[2,ling]:=q.fieldbyname('VBOL_NOMBRE').asstring+' '+q.fieldbyname('VBOL_APEPAT').asstring +' '+q.fieldbyname('VBOL_APEMAT').asstring;

         q.close;
         q.sql.text:='SELECT * FROM SVNOMBRAM S WHERE S.EMPL='+#39+GRID.cells[NEWCOL,ling]+#39;
         SAVETOFILELOG(Q.SQL.TEXT);
         q.open;
         GRID.cells[7,Ling]:=q.fieldbyname('PUESTO').asstring;
         GRID.cells[8,ling]:=q.fieldbyname('INICIA').asstring;
         GRID.cells[9,ling]:=q.fieldbyname('TERMINA').asstring;
         GRID.cells[11,ling]:=q.fieldbyname('TIPO').asstring;
      end;

  TABU:=FALSE;
end;




procedure TFDETALLE.getDescripGridNP;
var
NewCol:integer;
tipo:string;
begin


  IF TABUnp THEN newCol:=colgNP-1 else newcol:=colgNP;

  if NewCol=0 then
      begin
         Q.close;
         q.sql.text:='SELECT * FROM SVBOLSAEVEN WHERE '+
         ' VBOL_NUMERO='+#39+GRIDNP.cells[newcol,lingNP]+#39;
         SAVETOFILELOG(Q.SQL.TEXT);
         Q.open;
         GRIDNP.cells[1,lingNP]:=q.fieldbyname('VBOL_NOMBRE').asstring+' '+q.fieldbyname('VBOL_APEPAT').asstring +' '+q.fieldbyname('VBOL_APEMAT').asstring;

         q.close;
         q.sql.text:='SELECT SGETBOLSAS('+#39+GRIDNP.cells[newcol,lingNP]+#39+') FROM DUAL';
         q.open;
         GRIDNP.cells[2,LingNP]:=q.fields[0].asstring;
         GUARDANP;
      end;

  TABUnp:=FALSE;
end;


Procedure TFDetalle.GuardaNp;
var
x:integer;
begin
q.close;
q.sql.text:='DELETE FROM SCASTIGADOS S WHERE S.CAST_NOREG='+#39+numreg.text+#39;
Q.execsql;
for x:=1 to gridnp.rowcount-2 do
   begin
      q.close;
      q.sql.text:='INSERT INTO SCASTIGADOS (CAST_NOREG, CAST_EMPL,CAST_NOMBRE, CAST_BOLSAS) VALUES ('+
      #39+numreg.text+#39+','+
      #39+gridnp.cells[0,x]+#39+','+
      #39+gridnp.cells[1,x]+#39+','+
      #39+gridnp.cells[2,x]+#39+')';
      Q.ExecSQL;
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

  if (VControl is TEdit)  and (vcontrol.Name='PER')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

  if (VControl is TEdit)  and (vcontrol.Name='CATEG')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

 if (VControl is TEdit)  and (vcontrol.Name='TURNO')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

  if (VControl is TEdit)  and (vcontrol.Name='VPSTO')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  and ((colg=6) or (colg=7)) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString;
    end;

    if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  AND (colg=1) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString;
       TStringGrid(VControl).cells[colg+1,Ling]:=QVal.Fields[1].AsString+' '+QVal.Fields[2].AsString+' '+QVal.Fields[3].AsString;
    end;

    if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  AND (colg=18) then
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRIDNP')  AND (colgNP=0) then
    begin
       TStringGrid(VControl).cells[colgNP,LingNP]:=QVal.Fields[0].AsString;
       TStringGrid(VControl).cells[colgNP+1,LingNP]:=QVal.Fields[1].AsString+' '+QVal.Fields[2].AsString+' '+QVal.Fields[3].AsString;

       q.close;
       q.sql.text:='SELECT SGETBOLSAS('+#39+GRIDNP.cells[0,lingNP]+#39+') FROM DUAL';
       q.open;
       TStringGrid(VControl).cells[2,LingNP]:=q.fields[0].asstring;
       GuardaNp;
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


function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 IF RESULT='PER' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('PERS_PERSONA As PERSONA,');
       Vsql.Add('SUBSTR(PERS_APEPAT,1,100) As PATERNO,');
       Vsql.Add('SUBSTR(PERS_APEMAT,1,100) As MATERNO,');
       Vsql.Add('SUBSTR(PERS_NOMBRE,1,100) As NOMBRE');
       Vsql.Add('FROM FPERSONAS');
       Vsql.Add('WHERE PERS_EMPLEADO='+#39+'S'+#39);
       Vsql.Add('AND LENGTH(PERS_PERSONA)=5');
       SavetofileLog(vsql.text);
     end;

  IF RESULT='CATEG' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('CPUE_CATEG As CATEGORIA,');
       Vsql.Add('CPUE_DESCRIP As DESCRIPCION,');
       Vsql.Add('CPUE_PSTO As PUESTO');
       Vsql.Add('FROM PCPUESTOS');
       Vsql.Add('WHERE CPUE_PSTO='+#39+PUESTO.TEXT+#39);
       Vsql.Add('ORDER BY CPUE_CATEG');
       SavetofileLog(vsql.text);
     end;

  IF RESULT='TURNO' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('TURN_CVETURNO As TURNO,');
       Vsql.Add('TURN_DESCRIP As DESCRIPCION');
       Vsql.Add('FROM PTURNO');
       SavetofileLog(vsql.text);
     end;


  IF RESULT='VPSTO' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('PUES_PSTO As PUESTO,');
       Vsql.Add('PUES_DESCRIP As DESCRIPCION');
       Vsql.Add('FROM PPUESTOS');
       Vsql.Add('WHERE PUES_TPSTO='+#39+'A'+#39);
       SavetofileLog(vsql.text);
     end;

if (result= 'GRID') and (colg=5) and (linG>0) and (linG<>grid.rowcount-1)  then
 begin
  VSql.add('SELECT ');
  VSql.add('PUES_PSTO AS PUESTO,');
  VSql.add('PUES_DESCRIP AS DESCRIPCION');
  VSql.add('FROM PPUESTOS');
  VSql.add('WHERE PUES_TPSTO IN ('+#39+'A'+#39+','+#39+'G'+#39+')');
  VSql.add('ORDER BY PUESTO');
 end;

if (result= 'GRID') and ((colg=6) OR (COLG=7)) and (linG>0) and (linG<>grid.rowcount-1)  then
 begin
  VSql.add('SELECT ');
  VSql.add('PUES_PSTO AS PUESTO,');
  VSql.add('PUES_DESCRIP AS DESCRIPCION');
  VSql.add('FROM PPUESTOS');
  VSql.add('WHERE PUES_TPSTO IN ('+#39+'A'+#39+','+#39+'G'+#39+')');
  VSql.add('ORDER BY PUESTO');
 end;

 if (result= 'GRID') and (colg=1) and (linG>0) and (linG<>grid.rowcount-1)  then
 begin
  VSql.add('SELECT ');
  VSql.add('VBOL_NUMERO AS NUMERO,');
  VSql.add('VBOL_NOMBRE AS NOMBRE,');
  VSql.add('VBOL_APEPAT AS APELLIDO_PATERNO,');
  VSql.add('VBOL_APEMAT AS APELLIDO_MATERNO');
  VSql.add('FROM SVBOLSAEVEN');
 end;


  if (result= 'GRIDNP') and (colgNP=0) and (linGNP>0) and (linGNP<>gridNP.rowcount-1)  then
 begin
  VSql.add('SELECT ');
  VSql.add('VBOL_NUMERO AS NUMERO,');
  VSql.add('VBOL_NOMBRE AS NOMBRE,');
  VSql.add('VBOL_APEPAT AS APELLIDO_PATERNO,');
  VSql.add('VBOL_APEMAT AS APELLIDO_MATERNO');
  VSql.add('FROM SVBOLSAEVEN');
 end;

  if (result= 'GRID') and (colg=18) and (linG>0) and (linG<>grid.rowcount-1)  then
     begin
       Vsql.Add('Select');
       Vsql.Add('TURN_CVETURNO As TURNO,');
       Vsql.Add('TURN_DESCRIP As DESCRIPCION');
       Vsql.Add('FROM PTURNO');
       SavetofileLog(vsql.text);
     end;

end;



procedure TFDetalle.Inivar ;
begin
PUESTO.TEXT:=FModulo.Query1.FieldByName('VSOL_PUESTO').ASSTRING;
PUESTOD.TEXT:=FModulo.Query1.FieldByName('VSOL_PUESTOD').ASSTRING;
INICIA.TEXT:=FModulo.Query1.FieldByName('VSOL_INICIA').ASSTRING;
TERMINA.TEXT:=FModulo.Query1.FieldByName('VSOL_TERMINA').ASSTRING;
URES.TEXT:=FModulo.Query1.FieldByName('VSOL_URES').ASSTRING;
nomb.TEXT:=FModulo.Query1.FieldByName('VSOL_nomb').ASSTRING;
NUMSOL.TEXT:=FModulo.Query1.FieldByName('VSOL_SOLICITUD').ASSTRING;
NUMDET.TEXT:=FModulo.Query1.FieldByName('VSOL_NUMDET').ASSTRING;
NUMREG.TEXT:=FModulo.Query1.FieldByName('VSOL_NUMERO').ASSTRING;
turno.Text:=FModulo.Query1.FieldByName('VSOL_TURNO').ASSTRING;
PROG.TEXT:='5103';
SFDO.TEXT:='1101';
CATEG.Text:='A';

LISTA.Cells[0,0]:='Quitar';
LISTA.Cells[1,0]:='No.';
LISTA.Cells[2,0]:='Nombre';
LISTA.Cells[3,0]:='Antiguedad';
LISTA.Cells[4,0]:='Inicia';
LISTA.Cells[5,0]:='Termina';
LISTA.Cells[6,0]:='Puesto_Ocupa';
LISTA.Cells[7,0]:='Orden';

LISTA2.Cells[0,0]:='Quitar';
LISTA2.Cells[1,0]:='No.';
LISTA2.Cells[2,0]:='Nombre';
LISTA2.Cells[3,0]:='Antiguedad';
LISTA2.Cells[4,0]:='Termina';
LISTA2.Cells[5,0]:='Puesto_Ocupa';
LISTA2.Cells[6,0]:='Orden';

grid.Cells[0,0]:='No.';
grid.Cells[1,0]:='Empl';
grid.Cells[2,0]:='Nombre';
grid.Cells[3,0]:='Inicia';
grid.Cells[4,0]:='Termina';
grid.Cells[5,0]:='Escalafon';
grid.Cells[6,0]:='Puesto';
grid.Cells[7,0]:='Anterior';
grid.Cells[8,0]:='Iniciaba';
grid.Cells[9,0]:='Terminaba';
grid.Cells[10,0]:='Nombramiento';
grid.Cells[11,0]:='Eventualidad';
grid.Cells[12,0]:='Tipo';
grid.Cells[13,0]:='Nombre Sustituye';
grid.Cells[14,0]:='Categ Sust.';
grid.Cells[15,0]:='URES';
grid.Cells[16,0]:='PROG';
grid.Cells[17,0]:='SFDO';
grid.Cells[18,0]:='Turno';


gridNP.Cells[0,0]:='Empl';
gridnP.Cells[1,0]:='Nombre';
gridnP.Cells[2,0]:='Puestos';

end ;

procedure TFDetalle.FechaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=#0;
end;

procedure TFDetalle.PuestoChange(Sender: TObject);
begin
  inherited;
  q.Close;
  q.sql.text:='select * from svbolsas t WHERE T.VBOL_PSTO='+#39+PUESTO.TEXT+#39+
  ' order by VBOL_DIAS DESC, VBOL_FHINGRESO ASC';
  q.open;
  lista.rowcount:=2;
  limpiagrid(lista);
  while not (q.eof) do
     begin
        lista.cells[0,lista.rowcount-1]:='N';
        lista.cells[1,lista.rowcount-1]:=q.fieldbyname('VBOL_EMPL').asstring;
        lista.cells[2,lista.rowcount-1]:=q.fieldbyname('VBOL_NOMBRE').asstring;
        lista.cells[3,lista.rowcount-1]:=q.fieldbyname('VBOL_DIAS').asstring;
        lista.cells[4,lista.rowcount-1]:=q.fieldbyname('VBOL_fecMin').asstring;
        lista.cells[5,lista.rowcount-1]:=q.fieldbyname('VBOL_fecmax').asstring;
        lista.cells[6,lista.rowcount-1]:=q.fieldbyname('VBOL_PSTOALTO').asstring;
        lista.cells[7,lista.rowcount-1]:=q.fieldbyname('vbol_ordenpstoalto').asstring;
        lista.rowcount:=lista.rowcount+1;
        q.next;
     end;

  //QUITAR LOS CASTIGADOS
  limpiagrid(Gridnp);
  Gridnp.rowcount:=2;
  q.CLOSE;
  Q.SQL.TEXT:='SELECT * FROM SCASTIGADOS WHERE CAST_NOREG='+#39+FModulo.Query1.FieldByName('VSOL_NUMERO').ASSTRING+#39;
  Q.open;
  while not(q.eof) do
    begin
       gridNP.cells[0,gridnp.rowcount-1]:=q.fieldbyname('CAST_EMPL').asstring;
       gridNP.cells[1,gridnp.rowcount-1]:=q.fieldbyname('CAST_NOMBRE').asstring;
       gridNP.cells[2,gridnp.rowcount-1]:=q.fieldbyname('CAST_BOLSAS').asstring;
       q.NEXT;
       GRIDNP.ROWCOUNT:=GRIDNP.ROWCOUNT+1;


       ling:=buscaenGrid(LISTA,1,q.fieldbyname('CAST_EMPL').asstring);
       if ling<>-1 then
           LISTA.cells[0,ling]:='S';

    end;


   q.CLOSE;
   Q.SQL.TEXT:='SELECT * FROM SPROPUESTAS WHERE PROP_CANCEL='+#39+'N'+#39+
   ' AND PROP_REALIZADA='+#39+'N'+#39;
   Q.open;
   WHILE NOT(Q.EOF) DO
      begin
          ling:=buscaenGrid(LISTA,1,q.fieldbyname('PROP_EMPL').asstring);
          if ling<>-1 then
             LISTA.cells[8,ling]:='S';
          Q.next;
      end;



end;

procedure TFDetalle.BitBtn1Click(Sender: TObject);
var x:integer;
begin
  inherited;

Q.close;
q.sql.text:='DELETE FROM PMENSAJES';
Q.execsql;

Q.close;
q.sql.text:='DELETE FROM STEMPORAL';
Q.execsql;

//S crea la bolsa de eventuales Temporal
q.close;
q.SQL.text:='CALL ScreaBolsaTem('+#39+pUESTO.text+#39+','+
#39+inicia.TEXT+#39+')';
Q.execsql;

//Se indica que todos estan libres
q.close;
q.sql.text:='UPDATE SBOLSATEM SET OCUPADO='+#39+'N'+#39;
Q.execsql;
for x:=1 to LISTA.rowcount-1 do
   begin
     if lista.cells[0,x]='S' THEN
        begin
           q.close;
           {q.sql.text:='UPDATE SBOLSATEM SET OCUPADO='+#39+'S'+#39+
           ' WHERE EMPL='+#39+lista.cells[1,x]+#39;}
           
           SAVETOFILELOG(Q.sql.text);
           Q.execsql;
        end;
   end;

  Q.close;
  q.sql.text:='DELETE FROM SCAMBIOS WHERE CAMB_NMOV='+#39+NUMREG.TEXT+#39;
  Q.execsql;

  Q.close;
  q.sql.text:='DELETE FROM SPLAZAS WHERE PLAZ_SOLICIT='+#39+NUMREG.TEXT+#39;
  Q.execsql;
   Q.close;
  q.sql.text:='DELETE FROM SNOMBRAM WHERE NOMB_SOLICIT='+#39+NUMREG.TEXT+#39;
  Q.execsql;
  Q.close;
  q.sql.text:='DELETE FROM SPLAZPROG WHERE PLAZ_SOLICIT='+#39+NUMREG.TEXT+#39;
  Q.execsql;
  Q.close;
  q.sql.text:='DELETE FROM SEVENTUAL WHERE EVEN_SOLICIT='+#39+NUMREG.TEXT+#39;
  Q.execsql;

  q.close;
  q.SQL.text:='CALL sBuscaEvenC('+#39+pUESTO.text+#39+','+
  #39+inicia.TEXT+#39+','+#39+termina.TEXT+#39+
  ','+#39+SFDO.TEXT+#39+
  ','+#39+URES.TEXT+#39+
  ','+#39+PROG.TEXT+#39+
  ','+#39+CATEG.TEXT+#39+
  ','+#39+nomb.TEXT+#39+
  ','+#39+NUMSOL.TEXT+#39+
  ','+#39+NUMDET.TEXT+#39+
  ','+#39+turno.TEXT+#39+
  ','+#39+NUMREG.TEXT+#39+
  ','+#39+'0'+#39+
  ','+#39+Nomb.TEXT+#39+
  ','+#39+'BASE'+#39+
  ','+#39+rnomb.Text+#39+')';

  Q.execsql;

  Q.close;
  q.sql.text:='SELECT * FROM STEMPORAL ORDER BY ORDEN';
  Q.open;
  limpiagrid(grid);
  grid.rowcount:=2;
  while not (q.eof) do
     begin
        grid.cells[0,grid.rowcount-1]:=q.fieldbyname('ORDEN').asstring;
        grid.cells[1,grid.rowcount-1]:=q.fieldbyname('EMPL').asstring;
        grid.cells[2,grid.rowcount-1]:=q.fieldbyname('NOMBRE').asstring;
        grid.cells[3,grid.rowcount-1]:=q.fieldbyname('INICIA').asstring;
        grid.cells[4,grid.rowcount-1]:=q.fieldbyname('TERMINA').asstring;
        grid.cells[5,grid.rowcount-1]:=q.fieldbyname('ESCALAFON').asstring;
        grid.cells[6,grid.rowcount-1]:=q.fieldbyname('PUESTO').asstring;
        grid.cells[7,grid.rowcount-1]:=q.fieldbyname('PUESTOANT').asstring;
        grid.cells[8,grid.rowcount-1]:=q.fieldbyname('INIANT').asstring;
        grid.cells[9,grid.rowcount-1]:=q.fieldbyname('FINANT').asstring;
        grid.cells[10,grid.rowcount-1]:=q.fieldbyname('SUSNOMBRAM').asstring;
        grid.cells[11,grid.rowcount-1]:=q.fieldbyname('SUSEVEN').asstring;
        grid.cells[12,grid.rowcount-1]:=q.fieldbyname('SUSTTIPO').asstring;
        grid.cells[13,grid.rowcount-1]:=q.fieldbyname('SUSNOMBRE').asstring;
        grid.cells[14,grid.rowcount-1]:=q.fieldbyname('SUSCATEG').asstring;
        grid.cells[15,grid.rowcount-1]:=q.fieldbyname('SUSURES').asstring;
        grid.cells[16,grid.rowcount-1]:=q.fieldbyname('SUSSFDO').asstring;
        grid.cells[17,grid.rowcount-1]:=q.fieldbyname('SUSPROG').asstring;
        grid.cells[18,grid.rowcount-1]:=q.fieldbyname('SUSTURNO').asstring;
        q.next;
        grid.rowcount:=grid.rowcount+1;
     end;
  PER.text:=grid.cells[0,1];

  page.ActivePageIndex:=1;
end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
  inherited;
   Width := 807 ;
   Height := 613 ;
end;

procedure TFDetalle.PERChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FINANZAS.FPERSONAS WHERE PERS_PERSONA='+#39+PER.TEXT+#39;
  Q.open;
  nom.text:=q.fieldbyname('PERS_APEPAT').asstring+' '+
            q.fieldbyname('PERS_APEMAT').asstring+' '+
            q.fieldbyname('PERS_NOMBRE').asstring;
end;

procedure TFDetalle.CATEGChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PCPUESTOS WHERE CPUE_CATEG='+#39+CATEG.TEXT+#39+
  ' AND CPUE_PSTO='+#39+PUESTO.TEXT+#39;
  Q.open;
  RCATEG.text:=q.fieldbyname('CPUE_DESCRIP').asstring;

  //bUSCAMOS EL SUELDO
  Q.CLOSE;
  q.sql.text:='SELECT SPUE_SUELDO FROM ('+
                      'SELECT SPUE_SUELDO FROM PSPUESTOS S WHERE S.SPUE_PSTO='+
                      #39+puesto.text+#39+' AND S.SPUE_CATEG='+#39+categ.text+#39+
                      ' ORDER BY SPUE_INI DESC) WHERE  ROWNUM<=1 ';
  q.open;
  sldo.text:=q.fieldbyname('spue_sueldo').asstring;

end;

procedure TFDetalle.LISTADblClick(Sender: TObject);
begin
  inherited;
  IF lista.Cells[0,ling]='N' then
     begin
        lista.Cells[0,ling]:='S';
        gridnp.rowcount:=Gridnp.rowcount+1;
        gridnp.Cells[0,gridnp.rowcount-2]:=lista.cells[1,ling];
        gridnp.Cells[1,gridnp.rowcount-2]:=lista.cells[2,ling];
        colgnp:=0;
        lingnp:= gridnp.rowcount-2;
        getdescripgridnp;
     end
  else
     begin
        lista.Cells[0,ling]:='N';
        lingnp:=buscaenGrid(gridnp,0, lista.Cells[1,ling]);
        if lingnp<>-1 then
           elnpClick(nil);
     end;
  lista.Refresh;
end;

procedure TFDetalle.LISTASelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
   LING:=AROW;
   Colg:=colg;
end;

procedure TFDetalle.LISTADrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < Grid.FixedRows) or (ACol < Grid.FixedCols) then
    lista.Canvas.Brush.Color := clBtnFace
  else
    lista.Canvas.Brush.Color := clWhite;

  if lista.Cells[0,ARow]='N' then
           lista.Canvas.Brush.Color := $00BDFDF9;

  if lista.Cells[0,ARow]='S' then
       begin
          lista.Canvas.Font.Style:=[fsBold];
          lista.Canvas.Brush.Color :=$00AEF0E0;
       end;

  if lista.Cells[8,ARow]='S' then
           lista.Canvas.Brush.Color := $00FFDDDD;

  lista.Canvas.FillRect(Rect);
  Texto := lista.Cells[acol,ARow];
  DrawText( lista.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;


procedure TFDetalle.TURNOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PTURNO WHERE TURN_CVETURNO='+#39+TURNO.TEXT+#39;
  Q.open;
  RTURNO.text:=q.fieldbyname('TURN_DESCRIP').asstring;

end;

procedure TFDetalle.SFDOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FSFONDOS WHERE SFON_SFDO='+#39+SFDO.TEXT+#39;
  Q.open;
  RSFDO.text:=q.fieldbyname('SFON_DESCRIP').asstring;

end;

procedure TFDetalle.URESChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FURES WHERE URES_URES='+#39+URES.TEXT+#39;
  Q.open;
  RURES.text:=q.fieldbyname('URES_DESCRIP').asstring;

end;

procedure TFDetalle.PROGChange(Sender: TObject);
var
x:integer;
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FPROGRAM WHERE PROG_PROG='+#39+PROG.TEXT+#39;
  Q.open;
  RPROG.text:=q.fieldbyname('PROG_DESCRIP').asstring;
end;

procedure TFDetalle.NOMBChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM pvnombram WHERE vnom_nomb='+#39+NOMB.TEXT+#39;
  Q.open;
  RNOMB.text:=q.fieldbyname('VNOM_NOMBRE').asstring;
  PER.TEXT:= q.fieldbyname('VNOM_EMPL').asstring;


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

procedure TFDetalle.GRIDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (colg=7) OR (colg=8) or (colg=2) and (colg=3) then
     key:=Kfecha(KEY);
  if colg=2 then
     key:=#0;
  IF (KEY=#13) and ((colg=1) OR (colg=6)) then
     getDescripGrid;
  IF (linG=(sender as TstringGrid).rowcount-1)  THEN
     KEY:=#0;

end;

procedure TFDetalle.GRIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1) and (modo<>1) then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

IF (COLG=0) AND  (KEY=9) AND (linG=(sender as TstringGrid).rowcount-1) THEN
     begin agClick(nil);   end;

 if (key=45) and (modo<>1)  then //F2 ...Agregar
     agClick(nil);

IF ((colg-1=0) OR (colg-1=6) ) AND (KEY=9) then
    begin
       tabu:=true; getDescripGrid;
   end;

IF (COLG=0) AND  (KEY=9) and  (modo<>1)  AND (linG=(sender as TstringGrid).rowcount-1) AND ((sender as TstringGrid).rowcount>2) THEN
     begin agClick(nil);   end;



end;

procedure TFDetalle.GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
ling:=arow;
colg:=acol;
IF ACOL=0 THEN
   m.caption:='1) Orden en el cual se creará el Nombramiento';
IF ACOL=1 THEN
   m.caption:='2) Número del empleado que realizará la eventualidad.. Oprima la tecla F8 para buscar los empleados';
IF ACOL=2 THEN
   m.caption:='3) Nombre del empleado que realizará la eventualidad';
IF ACOL=3 THEN
   m.caption:='4) Fecha en la que iniciará a laboral el personal que se solicita (dd/mm/aaaa)';
IF ACOL=4 THEN
   m.caption:='5) Fecha en la que terminará de laborar el personal que se solicita (dd/mm/aaaa)';
IF ACOL=6 THEN
   m.caption:='7) Puesto que ocupará en la Eventulidad (F8 para buscar el puesto)';
IF ACOL=5 THEN
   m.caption:='6) S indica que el puesto es por escalafon N indica que era un empleado libre';
IF ACOL=7 THEN
   m.caption:='8) Puesto que tenia el empleado anteriormente si fuera por Escalafón (F8 para buscar Puestos)';
IF ACOL=8 THEN
   m.caption:='9) Fecha en la que iniciaba el nombramiento anterior (dd/mm/aaaa)';
IF ACOL=9 THEN
   m.caption:='10) Fecha en la que terminaba el nombramiento anterior (dd/mm/aaaa)';
IF ACOL=10 THEN
   m.caption:='11) Número de nombramiento que esta sustituyendo';
IF ACOL=11 THEN
   m.caption:='12) Número de eventualidad que sustituye';
IF ACOL=12 THEN
   m.caption:='13) Indica si el nombramiento era de Base o Eventualidad';
IF ACOL=13 THEN
   m.caption:='14) Nombre del empleado que se esta sustituyendo';
IF ACOL=14 THEN
   m.caption:='15) Categoria del Empleado que se esta Sustituyendo';
IF ACOL=15 THEN
   m.caption:='16) Clave de Unidad Responsable';
IF ACOL=16 THEN
   m.caption:='17) Clave de Subfondo';
IF ACOL=17 THEN
   m.caption:='18) Clave de Programa';
IF ACOL=18 THEN
   m.caption:='19) Turno en el que trabajará';


end;

procedure TFDetalle.AGClick(Sender: TObject);
begin
  inherited;
IF MODO<>1 THEN
   BEGIN
      q.close;
      q.sql.text:='SELECT SQSORDEN.nextval FROM DUAL';
      Q.open;
      grid.cells[0,Grid.rowcount-1]:=q.Fields[0].asstring;
      GRID.Rowcount:=Grid.rowcount+1;
   end;
end;

procedure TFDetalle.ELClick(Sender: TObject);
begin
  inherited;
IF MODO<>1 THEN
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (GRID.rowcount>2) then
                borra_row(GRID,linG);
         if  (GRID.rowcount=2) then
                limpia_linea(GRID,2);
      end;

end;

procedure TFDetalle.BitBtn2Click(Sender: TObject);
VAR X:INTEGER;
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE SSOLICITUDES SET SOLI_CORRIDO='+#39+'S'+#39+
  ', SOLI_FECASIG=SYSDATE '+
  ', SOLI_USERASIG=USER '+

  ' WHERE SOLI_NUMERO='+#39+NumReg.text+#39;
  savetofilelog(q.sql.text);
  q.execsql;

  q.close;
  q.sql.text:='UPDATE  STEMPORAL SET ENVIADO='+#39+'S'+#39+
  ' WHERE NUMDET='+#39+NumReg.text+#39;
  savetofilelog(q.sql.text);
  q.execsql;

  Q.close;
  q.sql.text:='DELETE FROM SPROPUESTAS S WHERE PROP_numdet='+#39+NUMREG.TEXT+#39;
  savetofilelog(q.sql.text);
  q.execsql;

  for x:=1 to grid.ROWCount-2 do
    begin
       q.close;
       q.sql.text:='INSERT INTO SPROPUESTAS '+
       '(PROP_ORDEN,PROP_EMPL,PROP_INICIA,PROP_TERMINA, PROP_NOMBRE, PROP_PUESTO, '+
       'PROP_ESCALAFON,PROP_NUMSOL, PROP_NUMDET,PROP_ENVIADO, '+
       'PROP_PUESTOANT,PROP_INIANT,PROP_FINANT, PROP_NOMBRAM, PROP_EVENTUALIDAD,'+
       'PROP_TIPO, PROP_NUMREG, PROP_SUSNOMBRE, PROP_SUSCATEG, '+
       'PROP_URES, PROP_SFDO, PROP_PROG,PROP_TURNO) VALUES ('+
        #39+GRID.CElls[0,x]+#39+','+
       #39+GRID.CElls[1,x]+#39+','+
       #39+GRID.CElls[3,x]+#39+','+
       #39+GRID.CElls[4,x]+#39+','+
       #39+GRID.CElls[2,x]+#39+','+
       #39+GRID.CElls[6,x]+#39+','+
       #39+GRID.CElls[5,x]+#39+','+
       #39+NUMSOL.Text+#39+','+
       #39+NUMDET.Text+#39+','+
       #39+'S'+#39+','+
       #39+GRID.CElls[7,x]+#39+','+
       #39+GRID.CElls[8,x]+#39+','+
       #39+GRID.CElls[9,x]+#39+','+
       #39+GRID.CElls[10,x]+#39+','+
       #39+GRID.CElls[11,x]+#39+','+
       #39+GRID.CElls[12,x]+#39+','+
       #39+NUMREG.Text+#39+','+
       #39+GRID.CElls[13,x]+#39+','+
       #39+GRID.CElls[14,x]+#39+','+
       #39+GRID.CElls[15,x]+#39+','+
       #39+GRID.CElls[16,x]+#39+','+
       #39+GRID.CElls[17,x]+#39+','+
       #39+GRID.CElls[18,x]+#39+')';

       savetofilelog(q.sql.text);

       Q.execsql;

    end;

  CLOSE;
  fmodulo.Refrescar1Click(nil);
end;

procedure TFDetalle.GRIDNPDrawCell(Sender: TObject; ACol, ARow: Integer;
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


procedure TFDetalle.GRIDNPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (colgNP=1) or (colgNP=2)  then
     key:=#0;
  IF (KEY=#13) and ((colgNP=0)) then
     getDescripGridNP;
  IF (linGNP=(sender as TstringGrid).rowcount-1)  THEN
     KEY:=#0;

end;

procedure TFDetalle.GRIDNPKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (key=46) AND  (linGNP<>(sender as TstringGrid).rowcount-1) and (modo<>1) then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                begin borra_row((sender as TstringGrid),linGnp); GuardaNp; end;
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                begin limpia_linea((sender as TstringGrid),2);  GuardaNp; end;
      end;

IF (COLGnp=0) AND  (KEY=9) AND (linGnp=(sender as TstringGrid).rowcount-1) THEN
     begin agnpClick(nil);   end;

 if (key=45) and (modo<>1)  then //F2 ...Agregar
     agnpClick(nil);

IF ((colgnp-1=0)) AND (KEY=9) then
    begin
       tabunp:=true; getDescripGridnp;
   end;

IF (COLGnp=0) AND  (KEY=9) and  (modo<>1)  AND (linGnp=(sender as TstringGrid).rowcount-1) AND ((sender as TstringGrid).rowcount>2) THEN
     begin agnpClick(nil);   end;

end;

procedure TFDetalle.GRIDNPSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
lingnp:=arow;
colgnp:=acol;

end;

procedure TFDetalle.agnpClick(Sender: TObject);
begin
  inherited;
IF MODO<>1 THEN   GRIDnp.Rowcount:=Gridnp.rowcount+1;

end;

procedure TFDetalle.elnpClick(Sender: TObject);
begin
  inherited;
IF MODO<>1 THEN
   if Application.MessageBox('¿Seguro que desea Borrar el Registro para que ahora se tome en cuenta?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (GRIDnp.rowcount>2) then
                begin borra_row(GRIDnp,linGnp);    GuardaNp end;
         if  (GRIDnp.rowcount=2) then
                begin limpia_linea(GRIDnp,2);   GuardaNp end;
      end;


end;

procedure TFDetalle.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='DELETE FROM SCASTIGADOS WHERE CAST_NOREG='+#39+NUMREG.TEXT+#39;
  Q.execsql;
  LIMPIAGRID(GRIDNP);
  GRIDNP.RowCount:=2;
end;

procedure TFDetalle.Lista2DblClick(Sender: TObject);
begin
  inherited;
  IF Lista2.Cells[0,ling2]='N' then
     begin
        Lista2.Cells[0,ling2]:='S';
        gridnp.rowcount:=Gridnp.rowcount+1;
        gridnp.Cells[0,gridnp.rowcount-2]:=Lista2.cells[1,ling2];
        gridnp.Cells[1,gridnp.rowcount-2]:=Lista2.cells[2,ling2];
        colgnp:=0;
        lingnp:= gridnp.rowcount-2;
        getdescripgridnp;
     end
  else
     begin
        Lista2.Cells[0,ling2]:='N';
        lingnp:=buscaenGrid(gridnp,0, Lista2.Cells[1,ling2]);
        if lingnp<>-1 then
           elnpClick(nil);
     end;
  Lista2.Refresh;

end;

procedure TFDetalle.Lista2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < Grid.FixedRows) or (ACol < Grid.FixedCols) then
    Lista2.Canvas.Brush.Color := clBtnFace
  else
    Lista2.Canvas.Brush.Color := clWhite;

  if Lista2.Cells[0,ARow]='N' then
           Lista2.Canvas.Brush.Color := $00BDFDF9;

  if Lista2.Cells[0,ARow]='S' then
       begin
          Lista2.Canvas.Font.Style:=[fsBold];
          Lista2.Canvas.Brush.Color :=$00AEF0E0;
       end;
  if lista2.Cells[8,ARow]='S' then
           lista2.Canvas.Brush.Color := $00FFDDDD;

  Lista2.Canvas.FillRect(Rect);
  Texto := Lista2.Cells[acol,ARow];
  DrawText( Lista2.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;


procedure TFDetalle.Lista2SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  LING2:=AROW;
  COLG:=ACOL;
end;

procedure TFDetalle.VPSTOKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  IF KEY=#13 THEN
    BEGIN
      Q.close;
      q.sql.text:='SELECT * FROM PPUESTOS WHERE PUES_PSTO='+#39+VPSTO.TEXT+#39;
      Q.open;
      RVPSTO.text:=q.fieldbyname('PUES_DESCRIP').asstring;


      q.Close;
      q.sql.text:='select * from svbolsas t WHERE T.VBOL_PSTO='+#39+VPSTO.TEXT+#39+
      ' order by VBOL_DIAS DESC, VBOL_FHINGRESO ASC';
      q.open;
      LISTA2.rowcount:=2;
      limpiagrid(lista2);
      while not (q.eof) do
         begin
            LISTA2.cells[0,LISTA2.rowcount-1]:='N';
            LISTA2.cells[1,LISTA2.rowcount-1]:=q.fieldbyname('VBOL_EMPL').asstring;
            LISTA2.cells[2,LISTA2.rowcount-1]:=q.fieldbyname('VBOL_NOMBRE').asstring;
            LISTA2.cells[3,LISTA2.rowcount-1]:=q.fieldbyname('VBOL_DIAS').asstring;
            LISTA2.cells[4,LISTA2.rowcount-1]:=q.fieldbyname('VBOL_fecmax').asstring;
            LISTA2.cells[5,LISTA2.rowcount-1]:=q.fieldbyname('VBOL_PSTOALTO').asstring;
            LISTA2.cells[6,LISTA2.rowcount-1]:=q.fieldbyname('vbol_ordenpstoalto').asstring;
            LISTA2.rowcount:=LISTA2.rowcount+1;
            q.next;
         end;

      //Verificar los castigados
      q.CLOSE;
      Q.SQL.TEXT:='SELECT * FROM SCASTIGADOS WHERE CAST_NOREG='+#39+FModulo.Query1.FieldByName('VSOL_NUMERO').ASSTRING+#39;
      Q.open;
      while not(q.eof) do
         begin
           ling2:=buscaenGrid(LISTA2,1,q.fieldbyname('CAST_EMPL').asstring);
           if ling2<>-1 then
              LISTA2.cells[0,ling2]:='S';
            Q.next;
         end;

   q.CLOSE;
   Q.SQL.TEXT:='SELECT * FROM SPROPUESTAS WHERE PROP_CANCEL='+#39+'N'+#39+
   ' AND PROP_REALIZADA='+#39+'N'+#39;
   Q.open;
   WHILE NOT(Q.EOF) DO
      begin
          ling2:=buscaenGrid(LISTA2,1,q.fieldbyname('PROP_EMPL').asstring);
          if ling2<>-1 then
             LISTA2.cells[8,ling2]:='S';
          Q.next;
      end;

    END;
end;

end.
