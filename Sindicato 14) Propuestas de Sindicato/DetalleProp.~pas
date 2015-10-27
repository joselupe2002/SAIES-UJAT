unit DetalleProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, libreria,
  DetalleNombram;

  type
   mygrid=class(TStringGrid)
      public
        procedure MoveColumn(FromIndex, ToIndex: Longint);
        procedure MoveRow(FromIndex, ToIndex: Longint);
      end;

  TFDetalleProp = class(TPFDetalle)
    Label17: TLabel;
    Label19: TLabel;
    q: TQuery;
    QPrin: TQuery;
    Label2: TLabel;
    page: TPageControl;
    TabSheet2: TTabSheet;
    GRID: TStringGrid;
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
    m: TLabel;
    BitBtn2: TBitBtn;
    MenAplic: TPopupMenu;
    SuspenderNombramiento1: TMenuItem;
    CrearLicenciaaNombramiento1: TMenuItem;
    PLICEN: TPanel;
    Label6: TLabel;
    TIPOLIC: TEdit;
    RTIPOLIC: TEdit;
    Panel2: TPanel;
    Label21: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    goce: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label22: TLabel;
    descrip: TEdit;
    CancelarEventualidad1: TMenuItem;
    Peven: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    DIRIGIDO: TEdit;
    RDIRIGIDO: TEdit;
    Panel3: TPanel;
    Label25: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    cont: TEdit;
    Label26: TLabel;
    feccont: TDateTimePicker;
    Label27: TLabel;
    Label28: TLabel;
    COPIAU: TEdit;
    RCOPIAU: TEdit;
    Label29: TLabel;
    COPIAD: TEdit;
    RCOPIAD: TEdit;
    Label30: TLabel;
    COPIAT: TEdit;
    RCOPIAT: TEdit;
    CrearEventualidad1: TMenuItem;
    empl: TEdit;
    Label31: TLabel;
    nombram: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    iniev: TEdit;
    Label34: TLabel;
    finev: TEdit;
    motivo: TMemo;
    crea: TBitBtn;
    Label35: TLabel;
    CAT: TEdit;
    RCAT: TEdit;
    Label36: TLabel;
    PSTO: TEdit;
    RPSTO: TEdit;
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
    procedure GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
procedure getDescripGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure SuspenderNombramiento1Click(Sender: TObject);
    procedure CrearLicenciaaNombramiento1Click(Sender: TObject);
    procedure TIPOLICChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CancelarEventualidad1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CrearEventualidad1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DIRIGIDOChange(Sender: TObject);
    procedure COPIAUChange(Sender: TObject);
    procedure COPIADChange(Sender: TObject);
    procedure COPIATChange(Sender: TObject);
    procedure nombramChange(Sender: TObject);
    procedure creaClick(Sender: TObject);
    procedure PSTOChange(Sender: TObject);
    procedure CATChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalleProp: TFDetalleProp;
  FNomb: TFNombram;
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


procedure TFDetalleProp.getDescripGrid;
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




procedure TFDetalleProp.Acepta_Seleccion ;
var campo : TField ;
begin

 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

 if (VControl is TEdit)  and (vcontrol.Name='TIPOLIC')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

  if (VControl is TEdit)  and (vcontrol.Name='DIRIGIDO')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

  if (VControl is TEdit)  and (vcontrol.Name='COPIAU')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

  if (VControl is TEdit)  and (vcontrol.Name='COPIAD')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

   if (VControl is TEdit)  and (vcontrol.Name='COPIAT')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

    if (VControl is TEdit)  and (vcontrol.Name='CAT')
 then TeDIT(VControl).TEXT:=QVal.Fields[0].Value  ;

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


function TFDetalleProp.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;


  IF RESULT='TIPOLIC' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('TLIC_TLICEN As TIPO,');
       Vsql.Add('TLIC_DESCRIP As DESCRIPCION');
       Vsql.Add('FROM PTLICEN');
       SavetofileLog(vsql.text);
     end;

  IF RESULT='CAT' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('CPUE_CATEG AS CATEGORIA,');
       Vsql.Add('CPUE_DESCRIP AS DESCRIPCION');
       Vsql.Add('FROM PCPUESTOS');
       Vsql.Add('WHERE CPUE_PSTO='+#39+PSTO.TEXT+#39);
       SavetofileLog(vsql.text);
     end;



end;



procedure TFDetalleProp.Inivar ;
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
grid.Cells[13,0]:='Nombre Sustituye';
grid.Cells[14,0]:='Categoria';
grid.Cells[15,0]:='URES';
grid.Cells[16,0]:='Programa';
grid.Cells[17,0]:='SubFondo';
grid.Cells[18,0]:='Turno';
grid.Cells[19,0]:='Creada';
grid.Cells[20,0]:='Nomb_Creado';
grid.Cells[21,0]:='Even_Creado';


BitBtn2Click(NIL);
end ;

procedure TFDetalleProp.FechaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=#0;
end;

procedure TFDetalleProp.BitBtn1Click(Sender: TObject);
var x:integer;
cgoce:string;
nlicen:integer;
begin
  inherited;
   if (rtipolic.text<>'') then
       begin
          q.close;
          q.sql.text:='SELECT PSQLICENCIA.NEXTVAL FROM DUAL ';
          Q.open;
          nlicen:=q.fields[0].asinteger;

          Cgoce:='N';
          if goce.Checked then cgoce:='S';

          q.close;
          q.sql.text:='INSERT INTO PLICENCIA (lice_lice,lice_tlicen,lice_nomb,'+
          'lice_goce,lice_ini,lice_fin,lice_texto,lice_inir,lice_finr)'+
          ' VALUES ('+inttostr(nlicen)+','+
          #39+tipolic.text+#39+','+
          #39+grid.cells[10,ling]+#39+','+
          #39+CGOCE+#39+','+
          #39+grid.cells[3,ling]+#39+','+
          #39+grid.cells[4,ling]+#39+','+
          #39+descrip.text+#39+','+
          #39+grid.cells[3,ling]+#39+','+
          #39+grid.cells[4,ling]+#39+')';
          savetofilelog(q.sql.text);
          Q.execsql;
          showmessage('Se creo la Licencia No. '+inttostr(nlicen)+' Para el Nombramiento No.'+ grid.cells[10,ling]+ ' Se ha suspendido');
          PLICEN.VISIBLE:=FALSE;
          TIPOLIC.CLEAR;
          DESCRIP.Clear;
     end
   else
   showmessage('No se ha llenado la información completa');
end;

procedure TFDetalleProp.FormCreate(Sender: TObject);
begin
  inherited;
   Width := 807 ;
   Height := 613 ;
end;

procedure TFDetalleProp.PERChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FINANZAS.FPERSONAS WHERE PERS_PERSONA='+#39+PER.TEXT+#39;
  Q.open;
  nom.text:=q.fieldbyname('PERS_APEPAT').asstring+' '+
            q.fieldbyname('PERS_APEMAT').asstring+' '+
            q.fieldbyname('PERS_NOMBRE').asstring;
end;

procedure TFDetalleProp.CATEGChange(Sender: TObject);
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

procedure TFDetalleProp.TURNOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PTURNO WHERE TURN_CVETURNO='+#39+TURNO.TEXT+#39;
  Q.open;
  RTURNO.text:=q.fieldbyname('TURN_DESCRIP').asstring;

end;

procedure TFDetalleProp.SFDOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FSFONDOS WHERE SFON_SFDO='+#39+SFDO.TEXT+#39;
  Q.open;
  RSFDO.text:=q.fieldbyname('SFON_DESCRIP').asstring;

end;

procedure TFDetalleProp.URESChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FURES WHERE URES_URES='+#39+URES.TEXT+#39;
  Q.open;
  RURES.text:=q.fieldbyname('URES_DESCRIP').asstring;

end;

procedure TFDetalleProp.PROGChange(Sender: TObject);
var
x:integer;
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FPROGRAM WHERE PROG_PROG='+#39+PROG.TEXT+#39;
  Q.open;
  RPROG.text:=q.fieldbyname('PROG_DESCRIP').asstring;
end;

procedure TFDetalleProp.NOMBChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM pvnombram WHERE vnom_nomb='+#39+NOMB.TEXT+#39;
  Q.open;
  RNOMB.text:=q.fieldbyname('VNOM_NOMBRE').asstring;
  PER.TEXT:= q.fieldbyname('VNOM_EMPL').asstring;

end;

procedure TFDetalleProp.GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < (sender as TstringGrid).FixedRows) or (ACol < (sender as TstringGrid).FixedCols) then
    (sender as TstringGrid).Canvas.Brush.Color := clBtnFace
  else
    (sender as TstringGrid).Canvas.Brush.Color := CLWHITE;

  IF  (sender as TstringGrid).Cells[19,AROW]='S' THEN
      (sender as TstringGrid).Canvas.Brush.Color := $00FFDDDD;


  if ARow=(sender as TstringGrid).RowCount-1 then
           (sender as TstringGrid).Canvas.Brush.Color := $00C1E8BF;

  (sender as TstringGrid).Canvas.Font.Size:=8;
  (sender as TstringGrid).Canvas.Font.Style:=[fsbold];
  (sender as TstringGrid).Canvas.Font.Color:=clblack;
  (sender as TstringGrid).Canvas.FillRect(Rect);
  Texto := (sender as TstringGrid).Cells[acol,ARow];
  DrawText( (sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);
end;

procedure TFDetalleProp.GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
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
   m.caption:='14) Nombre de la persona que se esta sustituyendo';
IF ACOL=14 THEN
   m.caption:='15) Categoria que tenia el nombramiento que se sustituye';
IF ACOL=15 THEN
   m.caption:='16) Unidad Responsable a la que pertenece el nombramiento ';
IF ACOL=16 THEN
   m.caption:='17) Programa  al que pertenece el nombramiento';
IF ACOL=17 THEN
   m.caption:='18) Subfondo al que pertenece el nombramiento';
IF ACOL=18 THEN
   m.caption:='19) Turno';
IF ACOL=19 THEN
   m.caption:='20) S ya se creo la eventualidad N no se ha creado la Eventualidad';
IF ACOL=20 THEN
   m.caption:='21) Número de nombramiento suspendido que se creó o al que sustituye';
IF ACOL=21 THEN
   m.caption:='22) Número de eventualidad que se creó para esta propuesta';

end;

procedure TFDetalleProp.BitBtn2Click(Sender: TObject);

begin
 Q.CLOSE;
  Q.sql.text:='select * from spropuestas  where prop_numsol='+#39+numsol.text+#39+
  ' and prop_numdet='+#39+numdet.text+#39+
  ' and prop_numreg='+#39+numreg.text+#39+
  ' ORDER BY PROP_ORDEN';
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
        grid.cells[13,grid.rowcount-1]:=q.fieldbyname('PROP_SUSNOMBRE').asstring;
        grid.cells[14,grid.rowcount-1]:=q.fieldbyname('PROP_SUSCATEG').asstring;
        grid.cells[15,grid.rowcount-1]:=q.fieldbyname('PROP_URES').asstring;
        grid.cells[16,grid.rowcount-1]:=q.fieldbyname('PROP_PROG').asstring;
        grid.cells[17,grid.rowcount-1]:=q.fieldbyname('PROP_SFDO').asstring;
        grid.cells[18,grid.rowcount-1]:=q.fieldbyname('PROP_TURNO').asstring;
        grid.cells[19,grid.rowcount-1]:=q.fieldbyname('PROP_REALIZADA').asstring;
        grid.cells[20,grid.rowcount-1]:=q.fieldbyname('PROP_NOMBCRE').asstring;
        grid.cells[21,grid.rowcount-1]:=q.fieldbyname('PROP_EVENCRE').asstring;

        q.next;
        GRID.ROWCOUNT:=GRID.ROWCOUNT+1;
     end;
end;

procedure TFDetalleProp.SuspenderNombramiento1Click(Sender: TObject);
begin
  inherited;
if Application.MessageBox(pchar('Seguro que desea Suspender el nombramiento No. '+grid.cells[10,ling]),'Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      if grid.cells[10,ling]<>'' then
        begin
          q.close;
          q.sql.text:='UPDATE PNOMBRAM S SET S.NOMB_SUSP='+#39+'S'+#39+
          ' WHERE S.NOMB_NOMB='+#39+grid.cells[10,ling]+#39;
          Q.execsql;
          showmessage('El nombramiento No. '+ grid.cells[10,ling]+ ' Se ha suspendido');
        end
      else
        Showmessage('No hay nombramiento que suspender');
   end;
end;

procedure TFDetalleProp.CrearLicenciaaNombramiento1Click(Sender: TObject);
var
nlicen:integer;
begin
  inherited;
if Application.MessageBox(pchar('Seguro que desea Crear una Licencia para el nombramiento No. '+grid.cells[10,ling]),'Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      if grid.cells[10,ling]<>'' then
        begin
           PLICEN.VISIBLE:=true;
           plicen.SetFocus;
        end
      else
        Showmessage('No hay nombramiento que suspender');
   end;
end;

procedure TFDetalleProp.TIPOLICChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PTLICEN WHERE TLIC_TLICEN='+#39+TIPOLIC.TEXT+#39;
  Q.open;
  RTIPOLIC.text:=q.fieldbyname('TLIC_DESCRIP').asstring;

end;

procedure TFDetalleProp.BitBtn3Click(Sender: TObject);
begin
  inherited;
PLICEN.VISIBLE:=FALSE;
TIPOLIC.CLEAR;
end;

procedure TFDetalleProp.CancelarEventualidad1Click(Sender: TObject);
begin
  inherited;
if Application.MessageBox(pchar('Seguro que desea Cancelar la Evetualidad No. '+grid.cells[11,ling]),'Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      if (grid.cells[11,ling]<>'') and (grid.cells[11,ling]<>'0') then
        begin
          q.close;
          q.sql.text:='UPDATE PEVENTUAL S SET S.EVEN_CONT='+#39+'CANCELADO'+#39+
          ' WHERE S.EVEN_EVEN='+#39+grid.cells[11,ling]+#39;
          Q.execsql;
          showmessage('La Eventualidad No. '+ grid.cells[11,ling]+ ' Se ha Cancelado');
        end
      else
        Showmessage('No hay eventualidad que cancelar');
   end;

end;

procedure TFDetalleProp.BitBtn5Click(Sender: TObject);
begin
  inherited;
Peven.VISIBLE:=FALSE;
cont.CLEAR;
motivo.Clear;
dirigido.Clear;
copiau.clear;
copiad.clear;
copiat.clear;

end;

procedure TFDetalleProp.CrearEventualidad1Click(Sender: TObject);
begin
  inherited;
if grid.cells[19,Ling]='N' THEN
  begin
      empl.Text:=grid.cells[1,ling];
      nombram.Text:=grid.cells[10,ling];
      iniev.Text:=grid.cells[3,ling];
      finev.Text:=grid.cells[4,ling];
      psto.Text:=grid.cells[6,ling];
      cat.Text:=grid.cells[14,ling];

      feccont.date:=Date;
      PEVEN.VISIBLE:=TRUE;
      cont.setfocus;
  end
else
  Showmessage('Ya se creo la eventualidad de este registro');
end;

procedure TFDetalleProp.BitBtn4Click(Sender: TObject);
VAR
nev:integer;
nnomb:integer;
begin
  inherited;
q.close;
q.sql.text:='SELECT DECODE(MAX(S.VEVE_EVEN),NULL,0,MAX(S.VEVE_EVEN)) FROM PVEVENTUAL S WHERE S.VEVE_EMPL='+#39+EMPL.TEXT+#39+
' AND S.VEVE_FECINI='+#39+INIEV.TEXT+#39+
' AND S.VEVE_FECFIN='+#39+FINEV.TEXT+#39+' AND S.VEVE_CONT NOT LIKE '+#39+'%CANCELADO%'+#39+
' AND S.VEVE_CVEPUESTO='+#39+PSTO.text+#39;
SAVETOFILELOG(Q.sql.text);
Q.open;

if q.fields[0].asinteger=0 then
   begin
       if (cont.text<>'') and (empl.text<>'') and (nombram.text<>'') and
          (motivo.text<>'') and (dirigido.text<>'') and (copiau.text<>'') and (copiad.text<>'')
          and (copiat.text<>'') then
           begin

              q.close;
              q.sql.text:='SELECT PSQEVENTUAL.NEXTVAL FROM DUAL ';
              Q.open;
              nev:=q.fields[0].asinteger;

              q.close;
              q.sql.text:='INSERT INTO PEVENTUAL '+
              '(EVEN_Even, EVEN_Empl, EVEN_Nomb, EVEN_FecIni, EVEN_FecFin, '+
              'Even_Cont, Even_Fecha, Even_Motivo, Even_Dirigido, Even_CopiaU, '+
              'Even_CopiaD, Even_CopiaT, Even_Usu, Even_Fec)'+
              'VALUES ('+
              #39+inttostr(nev)+#39+','+
              #39+empl.text+#39+','+
              #39+nombram.text+#39+','+
              #39+iniev.text+#39+','+
              #39+finev.text+#39+','+
              #39+cont.Text+#39+','+
              #39+datetostr(feccont.date)+#39+','+
              #39+motivo.Text+#39+','+
              #39+dirigido.Text+#39+','+
              #39+copiau.text+#39+','+
              #39+copiad.text+#39+','+
              #39+copiat.text+#39+','+
              'user,sysdate'+')';
              savetofilelog(q.sql.text);
              q.execsql;
              Showmessage ('Se creo la eventualidad No. '+inttostr(nev)+' para el empleado '+empl.text);
              Q.close;
              q.sql.text:='UPDATE SPROPUESTAS S SET S.PROP_REALIZADA='+#39+'S'+#39+','+
              ' PROP_NOMBCRE='+#39+NOMBRAM.Text+#39+','+
              ' PROP_EVENCRE='+#39+inttostr(nev)+#39+
              ' WHERE S.PROP_ORDEN='+#39+grid.cells[0,Ling]+#39;
              SAVETOFILELOG(Q.sql.text);
              Q.execsql;

              BitBtn2Click(NIL);
              grid.cells[19,Ling]:='S';
              grid.cells[20,Ling]:=NOMBRAM.text;
              grid.cells[21,Ling]:=inttostr(nev);



              PEVEN.Visible:=false;
              motivo.Clear;
              cont.Clear;
              iniev.clear;
              finev.clear;
              dirigido.clear;
              copiau.clear;
              copiad.clear;
              copiat.clear;
              nombram.clear;
              empl.clear;
         end
       else
       showmessage('No se ha llenado la información completa para crear la eventualidad');
   end
else
   showmessage('Ya existe la eventualidad '+q.FIELDS[0].ASSTRING+' para este empleado en la misma fecha de inicio y fin');

end;

procedure TFDetalleProp.DIRIGIDOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PVNOMBRAM WHERE VNOM_NOMB='+#39+DIRIGIDO.TEXT+#39;
  Q.open;
  RDIRIGIDO.text:=q.fieldbyname('VNOM_NOMBRE').asstring;

end;

procedure TFDetalleProp.COPIAUChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PVNOMBRAM WHERE VNOM_NOMB='+#39+COPIAU.TEXT+#39;
  Q.open;
  RCOPIAU.text:=q.fieldbyname('VNOM_NOMBRE').asstring;
end;

procedure TFDetalleProp.COPIADChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PVNOMBRAM WHERE VNOM_NOMB='+#39+COPIAD.TEXT+#39;
  Q.open;
  RCOPIAD.text:=q.fieldbyname('VNOM_NOMBRE').asstring;
end;

procedure TFDetalleProp.COPIATChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM FPERSONAS WHERE PERS_PERSONA='+#39+COPIAT.TEXT+#39;
  Q.open;
  RCOPIAT.text:=q.fieldbyname('PERS_NOMBRE').asstring+' '+q.fieldbyname('PERS_APEPAT').asstring+
  ' '+q.fieldbyname('PERS_APEMAT').asstring;
end;

procedure TFDetalleProp.nombramChange(Sender: TObject);
begin
  inherited;
  if (nombram.Text<>'0') and (nombram.Text<>'') then
     crea.enabled:=false
  else
     crea.enabled:=true;

end;

procedure TFDetalleProp.creaClick(Sender: TObject);
var
nnomb:integer;
NPLAZA:INTEGER;
ndescrip: string;
begin
  inherited;
q.close;
q.sql.text:='SELECT DECODE(MAX(VNOM_NOMB),null,0,MAX(VNOM_NOMB)) FROM PVNOMBRAM  S  WHERE S.VNOM_EMPL='+#39+empl.text+#39+
'AND S.VNOM_INI='+#39+iniev.text+#39+' AND S.VNOM_FIN='+#39+finev.text+#39+
' AND VNOM_PSTO='+#39+Psto.text+#39;
SAVETOFILELOG(Q.sql.text);
q.OPEN;

IF (Q.FIELDS[0].ASINTEGER=0) then
   begin
      if (empl.text<>'') and (cat.text<>'') and (inicia.text<>'') and (termina.text<>'')
         and (psto.text<>'') AND (MOTIVO.TEXT<>'') then
        begin
        // SE CREA UNA PLAZA
         q.close;
         q.sql.text:='SELECT PSQPLAZAS.NEXTVAL FROM DUAL ';
         Q.open;
         nPLAZA:=q.fields[0].asinteger;

         Q.CLOSE;
         Q.SQL.TEXT:='INSERT INTO PPLAZAS (plaz_plaza, plaz_tplaza, plaz_ures,'+
                     'plaz_psto,plaz_ini,plaz_fin,plaz_status,plaz_usu,'+
                     'plaz_fec,plaz_promep,plaz_area,plaz_cveturno ) VALUES ('+
                     #39+INTTOSTR(NPLAZA)+#39+','+
                     #39+'I'+#39+','+
                     #39+grid.cells[15,Ling]+#39+','+
                     #39+grid.cells[6,Ling]+#39+','+
                     #39+iniev.text+#39+','+
                     #39+finev.text+#39+','+
                     #39+'C'+#39+',USER,SYSDATE,'+
                     #39+'N'+#39+','+
                     #39+'N'+#39+','+
                     #39+grid.cells[18,LING]+#39+')';
         SAVETOFILELOG(Q.SQL.TEXT);
         Q.execsql;

         //Insertamos en PPLAZPROG
         Q.close;
         q.sql.text:='INSERT INTO PPLAZPROG (plaz_plaza,plaz_sfdo,plaz_ures,plaz_prog,'+
                     'plaz_porc) VALUES ('+
                     #39+inttostr(nplaza)+#39+','+
                     #39+'1101'+#39+','+
                     #39+grid.cells[15,Ling]+#39+','+
                     #39+'5103'+#39+','+
                     #39+'100'+#39+')';
         SAVETOFILELOG(Q.SQL.TEXT);
         q.execsql;

         //Insertamos el nombramiento

         q.close;
         q.sql.text:='SELECT PSQNOMBRAM.NEXTVAL FROM DUAL ';
         Q.open;
         nnomb:=q.fields[0].asinteger;
         q.close;
         q.sql.Text:='SELECT PUES_DESCRIP FROM PPUESTOS  WHERE PUES_PSTO='+#39+grid.cells[6,Ling]+#39;
         Q.OPEN;
         ndescrip:=q.fields[0].asstring;


         q.close;
         q.sql.text:='INSERT INTO PNOMBRAM (nomb_nomb,nomb_plaza,nomb_empl,nomb_descrip,'+
                     'nomb_susp,nomb_ini,nomb_fin, nomb_spiujat,'+
                     'nomb_fecha,nomb_categ,nomb_usu,nomb_fec,'+
                     'nomb_ingreso,nomb_baja, NOMB_TEXTO) values ('+
                     #39+inttostr(nnomb)+#39+','+
                     #39+inttostr(nplaza)+#39+','+
                     #39+grid.cells[1,Ling]+#39+','+
                     #39+ndescrip+#39+','+
                     #39+'S'+#39+','+
                     #39+INIEV.TEXT+#39+','+
                     #39+FINEV.TEXT+#39+','+
                     #39+'N'+#39+',SYSDATE,'+
                     #39+CATEG.TEXT+#39+',USER,SYSDATE,'+
                     #39+INIEV.TEXT+#39+','+
                     #39+FINEV.TEXT+#39+','+
                     #39+MOTIVO.TEXT+#39+')';
         SAVETOFILELOG(Q.SQL.TEXT);
         q.ExecSQL;

         NOMBRAM.TEXT:=INTTOSTR(NNOMB);
        end
      else
        Showmessage('Para crear el Nombramiento suspendido se necesita que llene Empleado, Categoria, Incia, Termina, Puesto y Motivo')
   end
else
  begin
   Showmessage('Al parecer ya existe el nombramiento '+q.fields[0].asstring+' creado para este empleado en la misma fecha de inicio y fin');
   nombram.text:=q.fields[0].asstring;
  end;
end;

procedure TFDetalleProp.PSTOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PPUESTOS WHERE PUES_PSTO='+#39+PSTO.TEXT+#39;
  Q.open;
  RPSTO.text:=q.fieldbyname('PUES_DESCRIP').asstring;

end;

procedure TFDetalleProp.CATChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT * FROM PCPUESTOS S WHERE S.CPUE_PSTO='+#39+PSTO.TEXT+#39+
  ' AND CPUE_CATEG='+#39+CAT.TEXT+#39;
  Q.open;
  RCAT.text:=q.fieldbyname('CPUE_DESCRIP').asstring;

end;

end.
