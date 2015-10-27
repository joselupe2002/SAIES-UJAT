unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, ekbasereport, ekrtf ;


type
   GridEnUso=class(TStringGrid)
  public
  //  procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;

  TFDetalle = class(TPFDetalle)
    qNomb: TQuery;
    dsNomb: TDataSource;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    NombT: TDBEdit;
    Label10: TLabel;
    EMPL: TDBEdit;
    Label11: TLabel;
    pSto: TDBEdit;
    Label2: TLabel;
    CVECATEG: TDBEdit;
    FechaBaja: TDBEdit;
    Label7: TLabel;
    FechaIngreso: TDBEdit;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CVEURES: TDBEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    GridPresta: TStringGrid;
    Label17: TLabel;
    Consec: TDBEdit;
    GridPagos: TStringGrid;
    Label6: TLabel;
    TPFINIQ: TDBEdit;
    LVPFI_TPFINIQ: TEdit;
    NOMBRE: TDBEdit;
    PUESTO: TDBEdit;
    LCATEGORIA: TDBEdit;
    URESDES: TDBEdit;
    dsPrestacion: TDataSource;
    qPrestacion: TQuery;
    GroupBox3: TGroupBox;
    ELABORO: TDBEdit;
    REVISO: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    dsDeduc: TDataSource;
    qDeduccion: TQuery;
    Label19: TLabel;
    COMENTARIO: TDBEdit;
    Label20: TLabel;
    BtAgregaLin: TButton;
    BtCalcular: TButton;
    BtElimina: TButton;
    qFiniq: TQuery;
    Label23: TLabel;
    qConcepto: TQuery;
       DsConcep: TDataSource;
    Label24: TLabel;
    Label25: TLabel;
    Label8: TLabel;
    Tltotales: TLabel;
    LbSdiario: TLabel;
    GridDeduc: TStringGrid;
    TPSTO: TDBEdit;
    Label21: TLabel;
    UltimoSldo: TDBEdit;
    ISRULTSLDO: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    labe: TLabel;
    ISRPERCEP: TDBEdit;
    Label28: TLabel;
    ISRIDLAB: TDBEdit;
    GroupBox4: TGroupBox;
    TOTINGRE: TDBEdit;
    ISRREMUN: TDBEdit;
    OTROD: TDBEdit;
    NETOPG: TDBEdit;
    Label22: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Antiguedad: TDBEdit;
    Label4: TLabel;
    Dias: TDBEdit;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    Label32: TLabel;
    Tick2: TEkRTF;
    TasaVin: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure GrabaDetalle;   override ;
      procedure GrabaUpdate ; override ;
    procedure cVNom(Sender : TField) ;
    procedure GridPrestaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridPrestaKeyPress(Sender: TObject; var Key: Char);
    procedure FechaBajaChange(Sender: TObject);
    procedure BtAgregaLinClick(Sender: TObject);
    procedure BtEliminaClick(Sender: TObject);
   
    procedure GridPrestaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   { procedure GridDeducKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);     }
    procedure GridPagosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);                           
    procedure BtCalcularClick(Sender: TObject);

    procedure GridPagosKeyPress(Sender: TObject; var Key: Char);
    procedure GridPagosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridDeducSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridDeducKeyPress(Sender: TObject; var Key: Char);
    procedure GridDeducKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CARGA_CALCULOS(GRIDPAGOS:TstringGrid;GRIDDEDUC:TstringGrid; QVAL:TQUERY);
    procedure CARGA_CALCULOS2(GRIDPAGOS:TstringGrid;GRIDDEDUC:TstringGrid; QVAL:TQUERY);
    procedure ENCABEZADOS(GridDE:TStringGrid; GridPG:TStringGrid);
    PROCEDURE CARGAPRESTACION(qPrestacion:tquery; GridPresta:TstringGrid) ;
    procedure NombTChange(Sender: TObject);




    //procedure FechaBajaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  LING, COLG,LINGP,COLGP : INTEGER;
    nombregrid: TStringGrid;
    SeqPresta: INTEGER;
    SalDia: real;
    totalPercep: real;
    LINGd: integer;
    COLGd: integer;

implementation

{$R *.DFM}


procedure GridEnUso.MoveRow(FromIndex, ToIndex: Integer);
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


Procedure InicializaGrid(NombGrid:TStringGrid);
var
x,y:integer;
begin
 for x:=1 to NombGrid.RowCount-1 do
   for y:=0 to  NombGrid.ColCount-1 do
       NombGrid.cells[y,x]:='';

end;

procedure borraRenglon(sender:tobject; linea:integer);
begin
   with GridEnUso(sender) do
   begin
      rowmoved(linea,rowcount-1);
      rows[rowcount-1].clear;
      rowcount:=rowcount-1;
   end;
end;

Function strtofloatTes(c:string):real;
begin
  c:=StringReplace(c,',','',[rfReplaceAll]);
  strtofloatTes:=strtofloat(c);
end;


Function ValidaNumero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.',#13] then ValidaNumero:=key else ValidaNumero:=#7;
end;

PROCEDURE TFDetalle.ENCABEZADOS(GridDE:TStringGrid; GridPG:TStringGrid);
BEGIN
       // encabezado deducciones    COL,LIN
 GridDE.cells[0,0]:='CVE';
 GridDE.cells[1,0]:='CONCEPTO';
 GridDE.cells[2,0]:='INGRESO TOTAL';
 GridDE.cells[3,0]:='INGRESO EXENTO';
 GridDE.cells[4,0]:='INGRESO GRAVADO';
if modo = 3 then
begin
 GridDE.ROWCOUNT:=7;
 GridDE.cells[0,1]:='045';
 GridDE.cells[0,2]:='039';
 GridDE.cells[0,3]:='031';
 GridDE.cells[0,4]:='027';
 GridDE.cells[0,5]:='018';
 GridDE.cells[0,6]:='055';
 GridDE.cells[0,7]:='029';
 GridDE.cells[1,1]:='Prima Vacacional';
 GridDE.cells[1,2]:='Aguinaldo';
 GridDE.cells[1,3]:='Días 31';
 GridDE.cells[1,4]:='Bono Navideño';
 GridDE.cells[1,5]:='Vacaciones';
 GridDE.cells[1,6]:='Anticipo Por Ayuda Fallecimiento';
 GridDE.cells[1,7]:='Gastos Funerales';
  GridDE.ROWCOUNT:= GridDE.ROWCOUNT+1;
  GridPG.ROWCOUNT:=3;
 GridPG.cells[0,1]:='156';
 GridPG.cells[0,2]:='162';
 GridPG.cells[1,1]:='Prima de Antiguedad';
 GridPG.cells[1,2]:='Bono Extraordinario';
  GridPG.ROWCOUNT:=GridPG.ROWCOUNT+1;
  BtCalcular.Enabled:=true;
end ;

 { GridDeduc.cells[1,5]:='GASTOS FUN';
 GridDeduc.cells[1,6]:='% VINCULADO';
 GridDeduc.cells[0,2]:='Préstamo Personal UJAT';
 GridDeduc.cells[0,3]:='Pensión Alimenticia';
 GridDeduc.cells[0,4]:='Beca Institucional';
 GridDeduc.cells[0,5]:='Beca PROMEP';
 GridDeduc.cells[0,6]:='Diplomados/Cursos Múltiples';
 GridDeduc.cells[0,7]:='Adeudo INFONAVIT(UJAT)';
 GridDeduc.cells[0,8]:='Adeudo FONACOT(UJAT)';
 GridDeduc.cells[0,9]:='Adeudo Servicios Médicos';
 GridDeduc.cells[0,10]:='Salarios Pagados Demás';
 GridDeduc.cells[0,11]:='Anticipo Por Ayuda Fallecimiento';   }
   // pagos a realizar

 GridPG.cells[0,0]:='CVE';
  GridPG.cells[1,0]:='CONCEPTO';
  GridPG.cells[2,0]:='INGRESO TOTAL';
  GridPG.cells[3,0]:='INGRESO EXENTO';
  GridPG.cells[4,0]:='INGRESO GRAVADO';
END;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 inherited;
 Height := 850 ;
 Width :=  850 ;
 GridPresta.cells[0,0]:='CVE';
 GridPresta.cells[1,0]:='DESCRIPCION';
 GridPresta.cells[2,0]:='IMPORTE';

 ENCABEZADOS(GRIDDEDUC,GRIDPAGOS);
     FModulo.Query1.FieldByName('VPFI_NombRAM').OnValidate := cVNom ;
 end;



procedure TFDetalle.Inivar ;
begin

  { if FModulo.Query1.FieldByName('VPFI_CONSEC').IsNull then
  begin
   qVal.Close;
   qVal.Sql.Clear;
   qVal.Sql.Add('Select PSQPFINIQ.Nextval as siguiente From Dual');
   qVal.Open;
  FModulo.Query1.FieldByName('VPFI_CONSEC').AsInteger := Qval['SIGUIENTE'] ;
 end ;   }


 if modo= 3   then                  //inserta then //FModulo.Query1['VFAL_Goce'] := 'N' ;
   begin
  cVNom(nil) ;
  InicializaGrid(gridpresta);
  GRIDPRESTA.ROWCOUNT:= 2;
  GridPresta.cells[0,0]:='   PRESTACIONES   ';
  InicializaGrid(GridDeduc);
  InicializaGrid(gridPAGOS);
  ENCABEZADOS(GRIDDEDUC,GRIDPAGOS);
  TOTINGRE.TEXT:='';
  iSRREMUN.TEXT:= '';
  OTROD.TEXT:= '';
  NETOPG.TEXT:= '';
  Ultimosldo.text:= '';
  isrultsldo.text:= '';
  TasaVin.text:= '';
  ISRIDLAB.TEXT:=  '';
  ISRPERCEP.TEXT:=  '';
  BtCalcular.Enabled:=true;
  end ;
  if modo=1 then       //editar
  begin
    CARGAPRESTACION(qprestacion,GRIDPRESTA);
    CARGA_CALCULOS2(gridpagos,griddeduc,qval);

  end;
end ;

procedure TFDetalle.DesInivar ;   //pasar datos de variables a campos para grabar
begin
 if FModulo.Query1.FieldByName('VPFI_CONSEC').IsNull then
  begin
   qVal.Close;
   qVal.Sql.Clear;
   qVal.Sql.Add('Select PSQPFINIQ.Nextval as siguiente From Dual');
   qVal.Open;
  FModulo.Query1.FieldByName('VPFI_CONSEC').AsInteger := Qval['SIGUIENTE'] ;
 end ;

 FModulo.Query1['VPFI_NOEMPL'] := qNomb.FieldByName('Empl').AsString ;
  FModulo.Query1['VPFI_Nombre'] := qNomb.FieldByName('Nombre').AsString ;
                      //  TPSTO.TEXT:=qNomb.FieldByName('tpsto').AsString;
  FModulo.Query1['VPFI_TPSTO'] := qNomb.FieldByName('tpsto').AsString ;
  FModulo.Query1['VPFI_CATEGORIA'] :=qNomb.FieldByName('CVECATEG').AsString ;
  FModulo.Query1['VPFI_CVEURES'] := qNomb.FieldByName('VPFI_CVEURES').AsString ;
  FModulo.Query1['VPFI_FECHAINGRE'] := qNomb.FieldByName('VPFI_FECHAINGRE').AsString ;
  FModulo.Query1['VPFI_FECHABAJA'] := qNomb.FieldByName('VPFI_FECHABAJA').AsString ;
 { FModulo.Query1['VPFI_ISRULTSLDO'] := qNomb.FieldByName('VPFI_ISRULTSLDO').AsString ;
  FModulo.Query1['VPFI_TASAVINCU'] := qNomb.FieldByName('VPFI_TASAVINCU').AsString ;
  FModulo.Query1['VPFI_ISRLAB'] := qNomb.FieldByName('VPFI_ISRLAB').AsString ;
  FModulo.Query1['VPFI_ISRPERCEP'] := qNomb.FieldByName('VPFI_ISRPERCEP').AsString ;  }
  FModulo.Query1['VPFI_ISRULTSLDO'] := ISRULTSLDO.text;
  FModulo.Query1['VPFI_TASAVINCU']:= tasavin.text ;
  FModulo.Query1['VPFI_ISRLAB']:= ISRIDLAB.Text;
  FModulo.Query1['VPFI_ISRPERCEP']:= ISRPERCEP.text ;
    FModulo.Query1['VPFI_NETOPERC']:= TOTINGRE.TEXT ;
 // FModulo.Query1['VPFI_PSLDOMEN'] := qNomb.FieldByName('VPFI_SUELDO').AsString ;
 // FModulo.Query1['VPFI_PSLDOMEN'] :=  UltimoSldo.Text; // ,PFIN_SLDOINTEGRADO

{ puesto.text:= qNomb.FieldByName('puesto').AsString ;
  LCATEGORIA.TEXT :=qNomb.FieldByName('CATEGORIA').AsString ;
  URESDES.TEXT:=   qNomb.FieldByName('LDESURES').AsString ;

 //  showmessage(FModulo.Query1['VPFI_Nombre'] );     }
 FModulo.Query1['VPFI_PERMISO_SG'] :='0';
 FModulo.Query1['VPFI_FALTAS'] :='0';
 { FModulo.Query1['VPFI_PRIMA_ANTI'] :='0';
 FModulo.Query1['VPFI_PRIMA_VAC'] :='0';
 FModulo.Query1['VPFI_AGUINALDO'] :='0';
 FModulo.Query1['VPFI_DIAS31'] :='0';
 FModulo.Query1['VPFI_BONONAV'] :='0';
 FModulo.Query1['VPFI_VACACIONES'] :='0';
 FModulo.Query1['VPFI_BONOEXTRA'] :='0';  }
 FModulo.Query1['VPFI_DECONOMICOS'] :='0';
 //FModulo.Query1['VPFI_PADICION'] :='0';
 //FModulo.Query1['VPFI_GASTOSFUN'] :='0';

end ;



procedure TFDetalle.cVNom(Sender : TField) ;
begin
 qNomb.Close ;
 qNomb.Open ;
 // FModulo.Query1['VPFI_TPSTO'] := qNomb.FieldByName('TPSTO').AsString  ;

// showmessage(FModulo.Query1.FieldByName('VPFI_NOEMPL').AsString);
  // FModulo.Query1.FieldByName('VPFI_TPSTO').AsString := 'D';
 //FModulo.Query1['VPFI_TPSTO']:= 'D';      //PARA EJEMPLO
       
 end ;

procedure TFDetalle.GridPrestaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
LING:=AROW;
COLG:=ACOL;

end;

procedure TFDetalle.GridPrestaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  IF COLG = 2 THEN
   // KEY:=#0;
   KEY:=ValidaNumero(key)
   else
    KEY:=#7;
 end;

 Function SumaColGrid(g:TstringGrid;Col:Integer):real;
var x:integer;
sum:real;
val:real;

begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
       //   showmessage(g.cells[col,x]);
          if trim(g.cells[col,x])<> '' then
            begin
               try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
               sum:=sum+val;
           end;
      end;
      totalPercep:=sum;
     Saldia:=(sum/30);
SumaColGrid:=sum;
end;

PROCEDURE TFDetalle.CARGAPRESTACION(qPrestacion:tquery; GridPresta:TstringGrid) ;
BEGIN
  IF MODO=1 THEN
  BEGIN
   qval.close;
  qval.SQL.text:= 'SELECT pfinp_cveconcep,conc_descrip,pfinp_monto from PFINPRESTACIONES,pconcepto '
  +' where pfinp_noconsec =' + quotedstr(consec.TEXT )
  + ' and pfinp_cveconcep= conc_conp and pfinp_tipopercep='+ quotedstr('P') ;
  showmessage(qval.SQL.text);
  END;
  qval.open;
  while not (qVal.eof) do
  begin
    GridPresta.cells[0,GridPresta.ROWCOUNT-1]:= qVal.FIELDS[0].ASSTRING ;
    GridPresta.cells[1,GridPresta.ROWCOUNT-1]:= qVal.FIELDS[1].ASSTRING ;
    GridPresta.cells[2,GridPresta.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[2].ASSTRING));
    GridPresta.ROWCOUNT:=GridPresta.ROWCOUNT+1;
    qVal.Next;
  end ;
  Tltotales.caption :=formatfloat('#,0.00',sumacolgrid(gridpresta,2));
 LbSdiario.caption:=formatfloat('#,0.00',Saldia);
 UltimoSldo.text:=  Tltotales.caption;

END;

procedure TFDetalle.CARGA_CALCULOS2(GRIDPAGOS:TstringGrid;GRIDDEDUC:TstringGrid; QVAL:TQUERY);
VAR
    VAL: REAL;
begin
    InicializaGrid(GridDeduc);
    InicializaGrid(gridPAGOS);
    ENCABEZADOS(GRIDDEDUC,GRIDPAGOS);
    qval.close;
    Qval.sql.clear;
     qVal.SQL.text:= 'SELECT pfinp_cveconcep,conc_descrip,pfinp_monto, PFINP_IMP_GRAVA,PFINP_IMP_EXENTO from PFINPRESTACIONES,pconcepto '
  +' where pfinp_noconsec =' + quotedstr(consec.TEXT )
  + ' and pfinp_cveconcep= conc_conp and pfinp_tipopercep='+ quotedstr('PF') ;
    //    showmessage(qVal.SQL.text);
    QVAL.OPEN;   //carga pagos
  while not (qVal.eof) do
  begin
    GridDeduc.cells[0,GridDeduc.ROWCOUNT-1]:= qVal.FIELDS[0].ASSTRING ;
    GridDeduc.cells[1,GridDeduc.ROWCOUNT-1]:= qVal.FIELDS[1].ASSTRING ;
    GridDeduc.cells[2,GridDeduc.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[2].ASSTRING));
    GridDeduc.cells[3,GridDeduc.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[4].ASSTRING)); //exent
    GridDeduc.cells[4,GridDeduc.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[3].ASSTRING)); //grava
    GridDeduc.ROWCOUNT:= GridDeduc.ROWCOUNT+1;
    qVal.Next;
  end ;
   GridDeduc.RowCount:=GridDeduc.RowCount + 1;
      GridDeduc.cells[1,GridDeduc.ROWCOUNT-1]:='T O T A L E S';
     GridDeduc.cells[2,GridDeduc.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridDeduc,2));
     GridDeduc.cells[3,GridDeduc.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridDeduc,3));
     GridDeduc.cells[4,GridDeduc.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridDeduc,4));

    qval.close;   Qval.sql.clear;
     qVal.SQL.text:= 'SELECT pfinp_cveconcep,conc_descrip,pfinp_monto, PFINP_IMP_GRAVA,PFINP_IMP_EXENTO from PFINPRESTACIONES,pconcepto '
  +' where pfinp_noconsec =' + quotedstr(consec.TEXT )
  + ' and pfinp_cveconcep= conc_conp(+) and pfinp_tipopercep=' + quotedstr('PG') ;
        showmessage(qVal.SQL.text);
    QVAL.OPEN;   //carga pagos
        while not (qVal.eof) do
  begin
   GridPagos.cells[0,GridPagos.ROWCOUNT-1]:= qVal.FIELDS[0].ASSTRING ;
   GridPagos.cells[1,GridPagos.ROWCOUNT-1]:= qVal.FIELDS[1].ASSTRING ;
   GridPagos.cells[2,GridPagos.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[2].ASSTRING));
   GridPagos.cells[3,GridPagos.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[4].ASSTRING)); //exent
   GridPagos.cells[4,GridPagos.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qVal.FIELDS[3].ASSTRING)); //grava
   GridPagos.ROWCOUNT:= GridPagos.ROWCOUNT+1;
   qVal.Next;
  end ;
    GridPagos.cells[1,GridPagos.ROWCOUNT-1]:='T O T A L E S';
     GridPagos.cells[2,GridPagos.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridPagos,2));
     GridPagos.cells[3,GridPagos.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridPagos,3));
     GridPagos.cells[4,GridPagos.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridPagos,4));
      // GridDeduc.cells[4,7]:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[11].ASSTRING)); //'GASTOS FUN';
         //totales
     TOTINGRE.text:=FormatFloat('###,###,###,##0.00',StrTofloat(TOTINGRE.text));
      isrultsldo.text:= FormatFloat('###,###,###,##0.00',StrTofloat(isrultsldo.text));
    // ISRIDLAB.TEXT:= FormatFloat('###,###,###,##0.00', ISRIDLAB.text);
     ISRPERCEP.TEXT:= FormatFloat('###,###,###,##0.00',StrTofloat(ISRPERCEP.TEXT));
    iSRREMUN.TEXT:=  FormatFloat('###,###,###,##0.00', StrTofloat(ISRIDLAB.text)+ StrTofloat(ISRPERCEP.text));
    OTROD.TEXT:='0';
  NETOPG.TEXT:= FormatFloat('###,###,###,##0.00',StrTofloatTes(TOTINGRE.TEXT) - ( StrTofloatTes(ISRREMUN.TEXT) + StrTofloatTes(OTROD.TEXT))) ;
END ;

procedure TFDetalle.CARGA_CALCULOS(GRIDPAGOS:TstringGrid;GRIDDEDUC:TstringGrid; QVAL:TQUERY);
VAR
    VAL: REAL;
begin
    InicializaGrid(GridDeduc);
    InicializaGrid(gridPAGOS);
    ENCABEZADOS(GRIDDEDUC,GRIDPAGOS);
    qval.close;
    Qval.sql.clear;
     qVal.SQL.text:= 'SELECT * from detfiniq where detf_nombram =' + quotedstr(NOMBT.TEXT )
    +' AND  detf_tpsto='+ quotedstr(TPSTO.TEXT ) +' AND DETF_CATEGO='+ quotedstr(CVECATEG.TEXT) ;
        showmessage(qVal.SQL.text);
    QVAL.OPEN;   //carga pagos
      GridPagos.cells[2,1]:=FormatFloat('###,###,###,##0.00',StrTofloatTes(QVAL.FIELDS[6].ASSTRING)); //montoprima
      GridPagos.cells[2,2]:=FormatFloat('###,###,###,##0.00',StrTofloatTES(QVAL.FIELDS[13].ASSTRING)); //bonoextra
      GridPagos.cells[3,1]:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[8].ASSTRING)); //EXETOmontoprima
      GridPagos.cells[4,1]:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[7].ASSTRING)); //GRAVADOrima
      GridPagos.cells[4,2]:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[13].ASSTRING)); //GRAVAdoBonoextra
      GridPagos.RowCount:=GridPagos.RowCount + 1;
     //carga TOTALES  COL,LIN
     GridDeduc.cells[2,1]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[9].ASSTRING));//primavac
     GridDeduc.cells[2,2]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[14].ASSTRING));//'Aguinaldo
     GridDeduc.cells[2,3]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[18].ASSTRING));//dia31
     GridDeduc.cells[2,4]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[17].ASSTRING));//BONONAV
     GridDeduc.cells[2,5]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[12].ASSTRING));//vacaiones
      //PARTE EXENTA
     GridDeduc.cells[3,1]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[11].ASSTRING));//primavac
     GridDeduc.cells[3,2]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[16].ASSTRING));//'Aguinaldo
     GridDeduc.cells[3,3]:= '0';//dia31
     GridDeduc.cells[3,4]:= '0';//BONONAV
     GridDeduc.cells[3,5]:= '0';//vacaiones
     // GRAVADO
     GridDeduc.cells[4,1]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[10].ASSTRING));//primavac
     GridDeduc.cells[4,2]:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[15].ASSTRING));//'Aguinaldo
     GridDeduc.cells[4,3]:= '0';//dia31
     GridDeduc.cells[4,4]:= '0';//BONONAV
     GridDeduc.cells[4,5]:= '0';//vacaiones
     // GridDeduc.cells[4,7]:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[11].ASSTRING)); //'GASTOS FUN';
     GridDeduc.RowCount:=GridDeduc.RowCount + 1;
     //totales
     Ultimosldo.text:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[5].ASSTRING));
     isrultsldo.text:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[20].ASSTRING));
     TasaVin.text:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[21].ASSTRING));
     ISRIDLAB.TEXT:=FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[22].ASSTRING));
     ISRPERCEP.TEXT:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[23].ASSTRING));
     GridDeduc.cells[1,GridDeduc.ROWCOUNT-1]:='T O T A L E S';
     GridDeduc.cells[2,GridDeduc.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridDeduc,2));
     GridDeduc.cells[3,GridDeduc.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridDeduc,3));
     GridDeduc.cells[4,GridDeduc.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridDeduc,4));
     GridPagos.cells[1,GridPagos.ROWCOUNT-1]:='T O T A L E S';
     GridPagos.cells[2,GridPagos.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridPagos,2));
     GridPagos.cells[3,GridPagos.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridPagos,3));
     GridPagos.cells[4,GridPagos.ROWCOUNT-1]:= formatfloat('#,0.00',sumacolgrid(GridPagos,4));
                //totales
     TOTINGRE.TEXT:= FormatFloat('###,###,###,##0.00',StrTofloat(QVAL.FIELDS[6].ASSTRING) + StrTofloat(QVAL.FIELDS[13].ASSTRING)
  + StrTofloat(QVAL.FIELDS[14].asString)  + StrTofloat(QVAL.FIELDS[18].ASSTRING) + StrTofloat(QVAL.FIELDS[17].ASSTRING)
  + StrTofloat(QVAL.FIELDS[12].ASSTRING) + StrTofloat(QVAL.FIELDS[9].ASSTRING));
     //GridDeduc.cells[2,GridDeduc.ROWCOUNT-1] +   GridPagos.cells[2,GridPagos.ROWCOUNT-1];
    iSRREMUN.TEXT:=  FormatFloat('###,###,###,##0.00', StrTofloat(QVAL.FIELDS[22].ASSTRING)+ StrTofloat(QVAL.FIELDS[23].ASSTRING));
    OTROD.TEXT:='0';
   NETOPG.TEXT:= FormatFloat('###,###,###,##0.00',StrTofloatTes(TOTINGRE.TEXT) - ( StrTofloatTes(ISRREMUN.TEXT) + StrTofloatTes(OTROD.TEXT))) ;
END ;

procedure TFDetalle.FechaBajaChange(Sender: TObject);
VAR
X:integer;

begin
  inherited;
   // calcular antiguedad

  IF TRIM(FECHAINGRESO.TEXT) <> '' THEN
    BEGIN
   qVal.close;
   qVal.SQL.text:= 'SELECT CALCULA_ANTIG('+ quotedstr(FECHABAJA.TEXT) +','
  + quotedstr(FECHAINGRESO.TEXT )+',' + ' 1) FROM DUAL ';
    QVAL.OPEN;
   ANTIGUEDAD.TEXT:=  QVAL.FIELDS[0].ASSTRING;
    qVal.close;
   qVal.SQL.text:= 'SELECT CALCULA_ANTIG('+ quotedstr(FECHABAJA.TEXT) +','
   + quotedstr(FECHAINGRESO.TEXT )+',' + ' 0) FROM DUAL ';
    QVAL.OPEN;
   DIAS.TEXT:=  QVAL.FIELDS[0].ASSTRING;
  // ANTIGUEDAD.TEXT:= inttostr(trunc(strtodate(FECHABAJA.TEXT)-strtodate(FECHAINGRESO.TEXT)/365));
   qVal.close;
  //***CARGA PRESTACIONES   col 0 lin 1
 IF MODO =3 THEN
 BEGIN
   GridPresta.cells[0,GridPresta.ROWCOUNT-1]:='001';
   GridPresta.cells[1,GridPresta.ROWCOUNT-1]:='SUELDO MENSUAL';
   GridPresta.cells[2,GridPresta.ROWCOUNT-1]:=FormatFloat('###,###,###,##0.00',StrToFloat(qNomb.FieldByName('VPFI_SUELDO').AsString));
   GridPresta.ROWCOUNT:=GridPresta.ROWCOUNT+1;
 // TPSTO.text := qNomb.FieldByName('TPSTO').AsString ;
  qprestacion.ParamByName('VPFI_TPSTO').AsString := qNomb.FieldByName('TPSTO').AsString ;
    // TPSTO.text := qprestacion.ParamByName('VPFI_TPSTO').AsString;
  qprestacion.ParamByName('VPFI_NOEMPL').AsString := qNomb.FieldByName('Empl').AsString ;
    // CARGAPRESTACION(qPrestacion,GridPresta);
  qPrestacion.open;
  while not (qPrestacion.eof) do
  begin
    GridPresta.cells[0,GridPresta.ROWCOUNT-1]:= qPrestacion.FIELDS[1].ASSTRING ;
    GridPresta.cells[1,GridPresta.ROWCOUNT-1]:= qPrestacion.FIELDS[2].ASSTRING ;
    GridPresta.cells[2,GridPresta.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(qPrestacion.FIELDS[3].ASSTRING));
    GridPresta.ROWCOUNT:=GridPresta.ROWCOUNT+1;
    qpRESTACION.Next;
  end ;
 qPrestacion.close; 
 //AGREGA QUINQUENIO
     totalpercep:=strToFloat(qNomb.FieldByName('VPFI_SUELDO').asString) ;
 qVal.close;
 qVal.SQL.text:= 'SELECT NOM$ANTIG( '+ quotedstr(qNomb.FieldByName('EMPL').AsString )+','+ quotedstr(qNomb.FieldByName('TPSTO').AsString)+',' +
        floatToStr(totalpercep)
  +','+ '0 ,' + quotedstr(qNomb.FieldByName('PSTO').AsString ) + ','  + quotedstr(qNomb.FieldByName('CVECATEG').AsString ) +','
  + '0 ,'+ '0 ) FROM DUAL ';
 QVAL.OPEN;
        // showmessage( intToStr(QVAL.FIELDS[0].ASInteger));
  GridPresta.cells[0,GridPresta.ROWCOUNT-1]:='041';
  GridPresta.cells[1,GridPresta.ROWCOUNT-1]:='QUINQUENIO';
  GridPresta.cells[2,GridPresta.ROWCOUNT-1]:= FormatFloat('###,###,###,##0.00',StrToFloat(QVAL.FIELDS[0].ASSTRING));
  GridPresta.ROWCOUNT:=GridPresta.ROWCOUNT+1;

 // suma de lineas
 Tltotales.caption :=formatfloat('#,0.00',sumacolgrid(gridpresta,2));
 LbSdiario.caption:=formatfloat('#,0.00',Saldia);
 END;
end;

end;



procedure TFDetalle.BtAgregaLinClick(Sender: TObject);
begin
  inherited;
//agrega linea
{ if tipos.Text ='D' then
   begin
    GridDeduc.cells[0,GridDeduc.ROWCOUNT-1]:= conp.text;
  GridDeduc.cells[1,GridDeduc.ROWCOUNT-1]:= descripcion.text;
  GridDeduc.cells[2,GridDeduc.ROWCOUNT-1]:=importe.Text;
  GridDeduc.RowCount:=GridDeduc.RowCount+1;
 end ;
 IF  tipos.Text ='PG' then
   begin
     GridPagos.cells[0,GridPagos.ROWCOUNT-1]:= conp.text;
  //GridPagos.cells[1,GridPagos.ROWCOUNT-1]:= descripcion.text;
  GridPagos.cells[2,GridPagos.ROWCOUNT-1]:=importe.Text;
  GridPagos.RowCount:=GridPagos.RowCount+1;
  end   }

end;

procedure TFDetalle.BtEliminaClick(Sender: TObject);
begin
  inherited;

  if (Sender is TstringGrid) then
     showmessage(TstringGrid(Sender).Name);

end;

 procedure TFDetalle.GridPrestaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
     if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borrarenglon((sender as TstringGrid),linG);
           if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpiaGrid((sender as TstringGrid));
      end;

 end;

procedure TFDetalle.GridPagosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key=46) AND  (linGP<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borrarenglon((sender as TstringGrid),linGP);
           if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpiaGrid((sender as TstringGrid));
          end;
    end;

procedure TFDetalle.BtCalcularClick(Sender: TObject);
 var
    VAL: REAL;
begin

  inherited;
       //borra calculo si existe
   if modo=3 then           //INSERTAR
     begin
     qVal.close;
     qVal.Sql.Clear;        // totalpercep:= strtofloatTes(TlTotales.caption);
     qVal.SQL.text:= 'delete from detfiniq where detf_nombram =' + quotedstr(NOMBT.TEXT )
       +' AND  detf_tpsto='+ quotedstr(TPSTO.TEXT ) +' AND DETF_CATEGO='+quotedstr(CVECATEG.TEXT)  ;
                           // FloatToStr    strtofloat
    {  qVal.SQL.text:= 'SELECT PRIMA_FINIQ('+ floatToStr(totalPercep) +
     ',' + quotedstr(NOMBT.TEXT )+ ',' +' 0 ) FROM DUAL ';   }
//     QVAL.OPEN;
      QVAL.ExecSQL;

     //IMPORTE.TEXT:=  QVAL.FIELDS[0].ASSTRING;
    // GridPagos.cells[2,2]:= QVAL.FIELDS[0].ASSTRING;
        qVal.close;    qVal.Sql.Clear;
      qVal.SQL.text:= 'CALL CAL_PRIMAFINIQ('+ quotedstr(NOMBT.TEXT) + ',' +   quotedstr(TPFINIQ.TEXT) + ',' +
          '1  )' ;
        //  showmessage(qVal.SQL.text);
      QVAL.ExecSQL;
       qVal.close;        qVal.Sql.Clear;
      // showmessage((GridPagos.cells[2,2]));
      try val:=strtofloatTes(GridPagos.cells[2,2]) except val:=0; end;
      qVal.SQL.text:= 'CALL CAL_ISRFINIQ('+ quotedstr(NOMBT.TEXT) + ',' +
    quotedstr(tpsto.TEXT) + ',' + quotedstr(psto.TEXT) + ',' +
    quotedstr(Cvecateg.TEXT) + ',' + quotedstr(TPFINIQ.TEXT) + ',' +  floattoStr(VAL) + ')'  ;

      QVAL.ExecSQL;
 end;
 CARGA_CALCULOS(GRIDPAGOS,GRIDdEDUC,QVAL) ;
if modo = 1 then
begin
    CARGA_CALCULOS2(GRIDPAGOS,GRIDdEDUC,QVAL) ;
end;

end;



procedure TFDetalle.GrabaDetalle ;
var
A: integer;
monto1: real;
gravado:real;
exento:real;
begin
//SHOWMESSAGE('ENTRO A GRABADETALLE');
qFINIQ.Close ;
 qFINIQ.Open ;
  qFINIQ.First ;
 IF MODO = 2 THEN //edita
   BEGIN
    If qFiniq.RecordCount > 1 then
        begin
           // showmessage(inttostr(Qdetalle.recordcount));
         FOR A:=1 to GridPresta.rowcount-1 do
          begin
            if (GridPresta.cells[0,A]<>'') then
             begin
              qVal.close;
             { qVal.sql.text:='INSERT INTO PFINPRESTACIONES (PFINP_SEQUENCIA,PFINP_NOCONSEC,PFINP_TIPOPERCEP,'+
              'PFINP_CVECONCEP,PFINP_MONTO,PFINP_ANT_FALLEC,PFINP_DESC_ADIC,PFINP_USUARIO,PFINP_FECHA) values ('+
               'SeqPresta'+','+  consec.text +','+ 'P'+','+
                +'''+ GridPresta.cells[0,A]+'','+
               #39+GridPresta.cells[2,A]+#39+','+ '0.00','0.00'+','+  user, sysdate +' )' ;}
               qVal.EXECSQL;
             end;
          end;
         end
     Else //qfiniq
         begin
          showmessage(' No se pueden Agregar Movimientos a un finiquito concluido');
      end;

     END
 ELSE   //inserta
    begin

     FOR A:=1 to GridPresta.rowcount-1 do
         begin
          qVal.Close;   qVal.Sql.Clear;
          qVal.Sql.Add('Select PSQDPRESTACION.Nextval as NumSig From Dual');  //genera la sequencia de prestaciones empl
          qVal.Open;
            SeqPresta:= Qval['NumSig'] ;
        if (GridPresta.cells[0,a]<>'') then
              begin
             try monto1:=strtofloatTes(GridPresta.cells[2,A]) except monto1:=0; end;
             qVal.close;
             qVal.Sql.Clear;   //monto   GridPresta.cells[2,A]
            qVal.Sql.Add ('INSERT INTO PFINPRESTACIONES (PFINP_SEQUENCIA,PFINP_NOCONSEC,PFINP_TIPOPERCEP,'+
            'PFINP_CVECONCEP,PFINP_MONTO,PFINP_IMP_GRAVA,PFINP_IMP_EXENTO,PFINP_ANT_FALLEC,PFINP_DESC_ADIC,PFINP_USUARIO, '+
            ' PFINP_FECHA) values ('+ inttostr(SeqPresta) + ','+ CONSEC.text +','+ quotedstr('P') +','
            + #39+ GridPresta.cells[0,A]+#39+','
            + floatToStr(monto1)+ ','+ '0' +','+'0'+','  +'0'+',' +'0'+','
             + quotedstr('USER') +','+ quotedstr(dateToStr(date())) + ')');
           //  showmessage(Qval.SQL.TEXT);
              QVal.ExecSQL;
              end;
         end;   //for        //strtoint   DATETOSTR(date())
        //Carga prestaciones finales PF
          FOR A:=1 to GridDeduc.rowcount-1 do
         begin
          qVal.Close;   qVal.Sql.Clear;
          qVal.Sql.Add('Select PSQDPRESTACION.Nextval as NumSig From Dual');  //genera la sequencia de prestaciones empl
          qVal.Open;
            SeqPresta:= Qval['NumSig'] ;
            // showmessage(GridDeduc.cells[2,a]);
        if (GridDeduc.cells[2,a]<>'0.00') and (GridDeduc.cells[2,a]<> '') and (GridDeduc.cells[1,a] <> 'T O T A L E S') then
              begin
             try monto1:=strtofloatTes(GridDeduc.cells[2,A]) except monto1:=0; end;
             try exento:=strtofloatTes(GridDeduc.cells[3,A]) except exento:=0; end;
              try gravado:=strtofloatTes(GridDeduc.cells[4,A]) except gravado:=0; end;
             qVal.close;
             qVal.Sql.Clear;   //monto   GridPresta.cells[2,A]
            qVal.Sql.Add ('INSERT INTO PFINPRESTACIONES (PFINP_SEQUENCIA,PFINP_NOCONSEC,PFINP_TIPOPERCEP,'+
            'PFINP_CVECONCEP,PFINP_MONTO, PFINP_IMP_EXENTO,PFINP_IMP_GRAVA,PFINP_ANT_FALLEC,PFINP_DESC_ADIC,'+
            ' PFINP_USUARIO, PFINP_FECHA) values ('+ inttostr(SeqPresta) + ','+ CONSEC.text +','+ quotedstr('PF') +','
            + #39+ GridDeduc.cells[0,A]+#39+','
            + floatToStr(monto1)+ ','
              + floatToStr(exento)+ ','
           + floatToStr(gravado)+ ','
            + '0' +','+'0'+','
            + quotedstr('USER') +','+ quotedstr(dateToStr(date())) + ')');
           //  showmessage(Qval.SQL.TEXT);
              QVal.ExecSQL;
              end;
         end;   //for        //strtoint   DATETOST

     //carga pagos idm. laboral   PG
         FOR A:=1 to GridPagos.rowcount-1 do
         begin
          qVal.Close;   qVal.Sql.Clear;
          qVal.Sql.Add('Select PSQDPRESTACION.Nextval as NumSig From Dual');  //genera la sequencia de prestaciones empl
          qVal.Open;
            SeqPresta:= Qval['NumSig'] ;
            showmessage(GridPagos.cells[2,a]);
        if (GridPagos.cells[2,a]<>'') and (GridPagos.cells[2,a]<>'0.00') and (GridPagos.cells[1,a] <> 'T O T A L E S')then
              begin
             try monto1:=strtofloatTes(GridPagos.cells[2,A]) except monto1:=0; end;
              try exento:=strtofloatTes(GridPagos.cells[3,A]) except exento:=0; end;
              try gravado:=strtofloatTes(GridPagos.cells[4,A]) except gravado:=0; end;
             qVal.close;
             qVal.Sql.Clear;   //monto   GridPresta.cells[2,A]
            qVal.Sql.Add ('INSERT INTO PFINPRESTACIONES (PFINP_SEQUENCIA,PFINP_NOCONSEC,PFINP_TIPOPERCEP,'+
            'PFINP_CVECONCEP,PFINP_MONTO, PFINP_IMP_EXENTO,PFINP_IMP_GRAVA,PFINP_ANT_FALLEC,PFINP_DESC_ADIC,'+
           ' PFINP_USUARIO, PFINP_FECHA) values ('+ inttostr(SeqPresta) + ','+ CONSEC.text +','+ quotedstr('PG') +','
            + #39+ GridPagos.cells[0,A]+#39+','
            + floatToStr(monto1)+ ','
             + floatToStr(exento)+ ','
           + floatToStr(gravado)+ ','
              //     + #39+ GridPagos.cells[3,A]+#39+','
             + '0' +','+'0'+','
            + quotedstr('USER') +','+ quotedstr(dateToStr(date())) + ')');
          //   showmessage(Qval.SQL.TEXT);
              QVal.ExecSQL;
              end;
         end;   //for


     end;

end;


procedure TFDetalle.GrabaUpdate ;
begin
 IF MODO= 2  THEN
   BEGIN
 // SHOWMESSAGE('graba update');
    GRABADETALLE;
   END
 ELSE
   BEGIN
    //SHOWMESSAGE(QUPDATE.SQL.TEXT);
     QUpdate.ExecSql ; // Ejecutamos el insert
     GRABADETALLE;
   END
end ;

procedure TFDetalle.GridPagosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    // KEY:=#0;
  if ((colgP =2))  and (linGp<>(sender as TstringGrid).rowcount-1)  then
   key:=ValidaNumero(key)
   else
    KEY:=#7;
     //showmessage(key);
end;

procedure TFDetalle.GridPagosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;

LINGP:=AROW;
COLGP:=ACOL;

end;


procedure TFDetalle.GridDeducSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
 LINGd:=AROW;
 COLGd:=ACOL;
end;

procedure TFDetalle.GridDeducKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //valida el renglon y columna donde se escribe

   IF COLGd = 2 THEN
     KEY:=ValidaNumero(key)
   else
    KEY:=#7;

end;

procedure TFDetalle.GridDeducKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    //valida si borra con ESC linea o limpia
  if (key=46) AND  (LINGd<>(sender as TstringGrid).rowcount-1)  then
     if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borrarenglon((sender as TstringGrid),LINGd);
           if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpiaGrid((sender as TstringGrid));
      end;

 end;

procedure TFDetalle.NombTChange(Sender: TObject);
begin
  inherited;
  qNomb.Close ;
 qNomb.Open ;
EMPL.TEXT := qNomb.FieldByName('Empl').AsString ;
Nombre.TEXT:= qNomb.FieldByName('Nombre').AsString ;
//showmessage(qNomb.FieldByName('Nombre').AsString);
//showmessage(inttostr(Qdetalle.recordcount))
  PSTO.TEXT:=  qNomb.FieldByName('psto').AsString ;
   puesto.text:= qNomb.FieldByName('Puesto').AsString ;
 TPSTO.TEXT:= qNomb.FieldByName('tpsto').AsString ;
 CVECATEG.TEXT:=qNomb.FieldByName('CVECATEG').AsString ;
 Lcategoria.TEXT:= qNomb.FieldByName('CATEGORIA').AsString ;
 CVEURES.TEXT:= qNomb.FieldByName('VPFI_CVEURES').AsString ;
 URESDES.TEXT:=qNomb.FieldByName('LDESURES').AsString ;
 FECHAINGRESO.TEXT := qNomb.FieldByName('VPFI_FECHAINGRE').AsString ;
 FECHABAJA.TEXT := qNomb.FieldByName('VPFI_FECHABAJA').AsString ;
 // showmessage(FModulo.Query1.FieldByName('VPFI_ISRPERCEP').AsString);
 {ISRPERCEP.Text:= FModulo.Query1.FieldByName('VPFI_ISRPERCEP').AsString;
 ISRULTSLDO.text:= FModulo.Query1.FieldByname('VPFI_ISRULTSLDO').AsString ;
 tasavin.text:= FModulo.Query1.FieldByname('VPFI_TASAVINCU').AsString  ;
 ISRIDLAB.Text:= FModulo.Query1.FieldByname('VPFI_ISRLAB').AsString ;  }
// UltimoSldo.Text:= FModulo.Query1['VPFI_PSLDOMEN'] ;
 //:= qNomb.FieldByName('VPFI_SUELDO').AsString ;
  //Antiguedad.text:=qNomb.FieldByName('ANTIGUEDAD').ASSTRING ;

   end;

end.
