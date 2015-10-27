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
    TabSheet2: TTabSheet;
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
    procedure FechaKeyPress(Sender: TObject; var Key: Char);
    procedure Inivar ; OVERRIDE;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PERChange(Sender: TObject);
        procedure Acepta_Seleccion ; override;
    function RNombre : String ; OVERRIDE;
    procedure CATEGChange(Sender: TObject);
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
procedure getDescripGrid;
    procedure BitBtn2Click(Sender: TObject);
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
         q.sql.text:='SELECT * FROM SVNOMBRAM S WHERE S.EMPL='+#39+GRID.cells[0,ling]+#39;
         q.open;
         GRID.cells[6,Ling]:=q.fieldbyname('PUESTO').asstring;
         GRID.cells[7,ling]:=q.fieldbyname('INICIA').asstring;
         GRID.cells[8,ling]:=q.fieldbyname('TERMINA').asstring;

      end;

  TABU:=FALSE;
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

  if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  and ((colg=5) or (colg=6)) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString;
    end;

    if (VControl is TStringGrid)  and (vcontrol.Name='GRID')  AND (colg=1) then
    begin
       TStringGrid(VControl).cells[colg,Ling]:=QVal.Fields[0].AsString;
       TStringGrid(VControl).cells[colg+1,Ling]:=QVal.Fields[1].AsString+' '+QVal.Fields[2].AsString+' '+QVal.Fields[3].AsString;
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

if (result= 'GRID') and (colg=6) and (linG>0) and (linG<>grid.rowcount-1)  then
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

PROG.TEXT:='5103';
SFDO.TEXT:='1101';
CATEG.Text:='A';


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



end ;

procedure TFDetalle.FechaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=#0;
end;

procedure TFDetalle.BitBtn1Click(Sender: TObject);
var x:integer;
begin
  inherited;
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



IF ((colg-1=0) OR (colg-1=6) ) AND (KEY=9) then
    begin
       tabu:=true; getDescripGrid;
   end;



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


end;

procedure TFDetalle.BitBtn2Click(Sender: TObject);

begin
 Q.CLOSE;
  Q.sql.text:='select * from spropuestas  where prop_numsol='+#39+numsol.text+#39+
  ' and prop_numdet='+#39+numdet.text+#39+
  ' and prop_numreg='+#39+numreg.text+#39;
  SAVETOFILELOG(Q.sql.text);
  q.Open;
  limpiagrid(grid);
  grid.rowcount:=2;
  while not (q.eof) do
     begin
        grid.cells[0,grid.rowcount-1]:=q.fieldbyname('PROP_ORDEN').asstring;
        grid.cells[1,grid.rowcount-1]:=q.fieldbyname('PROP_EMPL').asstring;
        grid.cells[2,grid.rowcount-1]:=q.fieldbyname('PROP_NOMBRE').asstring;
        grid.cells[3,grid.rowcount-1]:=q.fieldbyname('PROP_INICIA').asstring;
        grid.cells[4,grid.rowcount-1]:=q.fieldbyname('PROP_TERMINA').asstring;
        grid.cells[5,grid.rowcount-1]:=q.fieldbyname('PROP_ESCALAFON').asstring;
        grid.cells[6,grid.rowcount-1]:=q.fieldbyname('PROP_PUESTO').asstring;
        grid.cells[7,grid.rowcount-1]:=q.fieldbyname('PROP_PUESTOANT').asstring;
        grid.cells[8,grid.rowcount-1]:=q.fieldbyname('PROP_INIANT').asstring;
        grid.cells[9,grid.rowcount-1]:=q.fieldbyname('PROP_FINANT').asstring;
        grid.cells[10,grid.rowcount-1]:=q.fieldbyname('PROP_NOMBRAM').asstring;
        grid.cells[11,grid.rowcount-1]:=q.fieldbyname('PROP_EVENTUALIDAD').asstring;
        grid.cells[12,grid.rowcount-1]:=q.fieldbyname('PROP_TIPO').asstring;
        q.next;
        GRID.ROWCOUNT:=GRID.ROWCOUNT+1;
     end;
end;

end.
