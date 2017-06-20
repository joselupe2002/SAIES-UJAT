unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main,
  shellapi, OleServer, Excel97, Comobj, ImgList, Gauges, FileCtrl,ClipBrd;

  type
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    PagePrin: TPageControl;
    TabSheet1: TTabSheet;
    Q: TQuery;
    obsp: TMemo;
    aux: TQuery;
    Panel1: TPanel;
    periodo: TComboBox;
    anio: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    obserror: TMemo;
    JuntarNom: TSpeedButton;
    Shape1: TShape;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    PeriodoFin: TEdit;
    enum: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    DsEmpl: TDataSource;
    QD: TQuery;
    DSQD: TDataSource;
    PCuadre: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    g: TStringGrid;
    GFon: TStringGrid;
    barrap: TGauge;
    JuntarHAS: TSpeedButton;
    Label40: TLabel;
    TipoNom: TComboBox;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    TabSheet3: TTabSheet;
    gOrigen: TStringGrid;
    TabSheet4: TTabSheet;
    GHoras: TStringGrid;
    Label4: TLabel;
    HET1: TLabel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    fondos: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btnEmpleados: TSpeedButton;
    SpeedButton8: TSpeedButton;
    btnDeduc: TSpeedButton;
    btnPercep: TSpeedButton;
    QEmpl: TQuery;
    TabSheet2: TTabSheet;
    dbEmpl: TDBGrid;
    sqlEmpl: TMemo;
    BitBtn3: TBitBtn;
    nempl: TLabel;
    Label3: TLabel;
    btnSQLEmpl: TBitBtn;
    elSQLEmpl: TMemo;
    obtSQL: TCheckBox;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Memo1: TMemo;
    dbPer: TDBGrid;
    sqlPer: TMemo;
    BitBtn4: TBitBtn;
    btnSQLpER: TBitBtn;
    elSQLPer: TMemo;
    QDed: TQuery;
    QPer: TQuery;
    DSDed: TDataSource;
    DSPer: TDataSource;
    Label5: TLabel;
    nper: TLabel;
    BitBtn5: TBitBtn;
    btnSQLDed: TBitBtn;
    DBDED: TDBGrid;
    Label6: TLabel;
    nded: TLabel;
    elSQLDED: TMemo;
    sqlded: TMemo;
    TabSheet9: TTabSheet;
    GgrEx: TStringGrid;
    TG: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    TE: TLabel;
    TP: TLabel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    PrimaEx: TLabel;
    primaGr: TLabel;
    PrimaMonto: TLabel;
    PrimaTotal: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btnGruardaP: TBitBtn;
    SaveF: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    function numCampos(g:TstringGrid):integer;
    procedure SpeedButton4Click(Sender: TObject);
    procedure TipoNomChange(Sender: TObject);

    procedure SumarNominas;

    procedure copiarGrid(g:TstringGrid);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure JuntarNomClick(Sender: TObject);
    procedure periodoChange(Sender: TObject);
    procedure gDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure JuntarHASClick(Sender: TObject);
    procedure fondosClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure gOrigenDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GFonDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnEmpleadosClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ExportarXLS(Q:TQuery; nombre:string; elmax:integer);
    procedure btnSQLEmplClick(Sender: TObject);
    procedure elSQLEmplDblClick(Sender: TObject);
    procedure btnSQLpERClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnSQLDedClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnPercepClick(Sender: TObject);
    procedure btnDeducClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GuardaFile(elSQL:Tquery; nombreF:string; numReg:integer);
    procedure btnGruardaPClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  FMain : TFMain ;
  linea,columna:INTEGER;
  Quenom:string;
  Lapos:integer;
  lin,col:integer;
implementation


//uses Repo;

{$R *.DFM}


procedure TFdetalle.ExportarXLS(Q:TQuery; nombre:string; elmax:integer);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(pchar(extractfiledir(paramstr(0))+'\'+nombre+'.xlsx')); except end;
crearFile(extractfiledir(paramstr(0))+'\'+nombre+'.xlsx');

ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);
ExcelWorksheet1:=TExcelWorksheet.create(nil);
barrap.Progress:=0;
barrap.MaxValue:=elMax;
showmessage('Exportar....');

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\'+nombre+'.xlsx',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelApplication1.Visible[id]:=false;
  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  for x:=0 to q.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=q.Fields[x].FullName;
     end;

  y:=0;
  q.first;

  while not(q.eof) do
     begin
       y:=y+1;
        for x:=0 to q.Fields.Count-1  do
            begin
                if x=1 then
                     ExcelWorksheet1.Cells.Item[y+1,x+1].value:=CHR(39)+q.fields[x].asstring
                else
                     ExcelWorksheet1.Cells.Item[y+1,x+1].value:=q.fields[x].asstring;

            end;
        barrap.Progress:= barrap.Progress+1;
        q.next;
     end;


ExcelApplication1.Visible[id]:=true;
ExcelWorksheet1.Disconnect;
ExcelWorkbook1.Disconnect;
ExcelApplication1.Disconnect;
end;



procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 626;
 Width :=  967 ;
 anio.text:=formatdatetime('YYYY',now);

 G.CELLS[0,0]:='APLICACION';
 G.CELLS[1,0]:='PERCEPCION';
 G.CELLS[2,0]:='DEDUCCIÓN';
 G.CELLS[0,1]:='SAIES';
 G.CELLS[0,2]:='NOM1008';
 G.CELLS[0,3]:='NOM1007';

 Gfon.CELLS[0,0]:='FONDO';
 Gfon.CELLS[1,0]:='PERCEPCION';
 GFON.CELLS[2,0]:='DEDUCCIÓN';

 gorigen.cells[0,0]:='FEDERAL';
 gorigen.cells[1,0]:='PROPIO';
 gorigen.cells[2,0]:='SUMA';




end;

procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFDetalle.Cancelar1Click(Sender: TObject);
begin
 close ;
end;

function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;

end;


function TFDetalle.numCampos(g:TstringGrid):integer;
var
c,x:integer;

begin
   c:=0;
   for x:=1 to g.rowcount-1 do
      if g.cells[0,x]='S' then
         c:=c+1;
   numcampos:=c
end;

procedure TFDetalle.SumarNominas;
var
x:integer;
total:reAL;
totald:real;
totGr:real;
totEx:real;
begin
IF tiponom.Text<>'' then
BEGIN
  q.close;
  Q.sql.text:='SELECT SUM(A.VDPA_MONTO) FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')';
  SAVETOFILELOG(q.sql.text);
  q.open;
  g.cells[1,1]:=Formatfloat('#,#0.00',q.fields[0].asfloat);



  q.close;
  Q.sql.text:='SELECT SUM(A.VDPA_MONTO) FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'D'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39+
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')';
  q.open;

  g.cells[2,1]:=Formatfloat('#,#0.00',q.fields[0].asfloat);


  total:=0;
  totald:=0;
  //Por fondos
  q.close;
  Q.sql.text:='SELECT a.vdpa_sfdo, SUM(A.VDPA_MONTO) FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+') group by a.vdpa_sfdo';
  SAVETOFILELOG(q.sql.text);
  q.open;

  x:=1;
  while not (q.eof) do
     begin
         gFon.cells[0,x]:=q.fields[0].asstring;
         gFon.cells[1,x]:=Formatfloat('#,#0.00',q.fields[1].asfloat);
         total:= total+q.fields[1].asfloat;
         X:=X+1;
         q.next;
     end;
  gfon.Rowcount:=x;

  totald:=0;
  q.close;
  Q.sql.text:='SELECT a.vdpa_sfdo, SUM(A.VDPA_MONTO) FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'D'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39+
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+') group by a.vdpa_sfdo';
  q.open;
  x:=1;
  while not (q.eof) do
     begin
         gFon.cells[2,x]:=Formatfloat('#,#0.00',q.fields[1].asfloat);
         totald:=totald+q.fields[1].asfloat;
         x:=x+1;
         q.next;
     end;
  gfon.RowCount:=gfon.RowCount+1;
  gFon.cells[1,x]:=Formatfloat('#,#0.00',total);
  gFon.cells[2,x]:=Formatfloat('#,#0.00',totald);


  //Clasificacion de Montos Gravados / Excentos
  total:=0; totgr:=0; totEx:=0;
  limpiagrid(GgrEx);
  GgrEx.rowcount:=2;
  q.close;
  Q.sql.text:=' SELECT  A.VDPA_CONP, a.vdpa_descrip, SUM(A.VDPA_MONTO) MONTO, '+
  'SUM(A.VDPA_GRAVADO) AS GR, SUM(a.Vdpa_Exento) AS ex FROM FE_CQPVDPAGOS A '+
  ' WHERE A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +' AND A.VDPA_PERDED='+#39+'P'+#39+
  ' GROUP BY A.VDPA_CONP,a.vdpa_descrip, A.VDPA_PERDED ORDER BY A.VDPA_PERDED DESC ';
  q.open;
  while not (q.eof) do
     begin
          GgrEx.cells[0,GgrEx.rowcount-1]:=q.fields[0].asstring;
          GgrEx.cells[1,GgrEx.rowcount-1]:=q.fields[1].asstring;
          GgrEx.cells[2,GgrEx.rowcount-1]:=Formatfloat('#,#0.00',q.fields[2].asfloat);
          GgrEx.cells[3,GgrEx.rowcount-1]:=Formatfloat('#,#0.00',q.fields[3].asfloat);
          GgrEx.cells[4,GgrEx.rowcount-1]:=Formatfloat('#,#0.00',q.fields[4].asfloat);
          totgr:=totgr+q.fields[3].asfloat;
          totEx:=totEx+q.fields[4].asfloat;
          q.next;
          GgrEx.rowcount:=GgrEx.rowcount+1;
     end;
  GgrEx.cells[2,3]:=Formatfloat('#,#0.00',total);
  tg.Caption:= Formatfloat('#,#0.00',totgr);
  te.Caption:= Formatfloat('#,#0.00',totex);
  tp.Caption:= Formatfloat('#,#0.00',totgr+totex);



  limpiagrid(gOrigen);
  gorigen.rowcount:=2;
  //Monto por ingreso Federal
  q.close;
  Q.sql.text:='SELECT SUM(FED), SUM(PRO) FROM (SELECT AVG(A.VDPA_MONTOF) AS FED, AVG(A.VDPA_MONTOP) AS PRO '+
  ' FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')'+
  ' GROUP BY A.VDPA_PAGO )';
  SAVETOFILELOG(q.sql.text);
  q.open;
  Gorigen.cells[0,1]:=Formatfloat('#,#0.00',q.fields[0].asfloat);
  Gorigen.cells[1,1]:=Formatfloat('#,#0.00',q.fields[1].asfloat);
  Gorigen.cells[2,1]:=Formatfloat('#,#0.00',q.fields[0].asfloat+q.fields[1].asfloat);
  gorigen.rowcount:= gorigen.rowcount+2;

  q.close;
  Q.sql.text:='SELECT ORIGEN, SUM(MONTO) FROM ( '+
  'SELECT A.VDPA_ORIGEN AS ORIGEN, DECODE(A.VDPA_ORIGEN,'+#39+'IM'+#39+',AVG(A.VDPA_MONTOF+A.VDPA_MONTOP),'+
  #39+'IF'+#39+',AVG(A.VDPA_MONTOF),'+#39+'IP'+#39+',AVG(A.VDPA_MONTOP)) AS MONTO '+
  ' FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+') GROUP BY A.VDPA_ORIGEN, A.VDPA_PAGO )'+
  ' GROUP BY ORIGEN';
  SAVETOFILELOG(q.sql.text);
  q.open;
  TOTAL:=0;
  while not (q.eof) do
     begin
          Gorigen.cells[0,gorigen.rowcount-1]:=q.fields[0].asstring;
          Gorigen.cells[1,gorigen.rowcount-1]:=Formatfloat('#,#0.00',q.fields[1].asfloat);
          total:=Total+q.fields[1].asfloat;
          q.next;
          gorigen.rowcount:=gorigen.rowcount+1;
     end;
  Gorigen.cells[2,3]:=Formatfloat('#,#0.00',total);


  //Grid de las Horas Extras
  total:=0;
  limpiagrid(gHoras);
  //Monto por ingreso Federal
  q.close;
  Q.sql.text:='SELECT SUM(A.VDPA_MONTO) AS MONTO, SUM(ROUND(A.VDPA_MONTOH2,2)) AS DOBLES,'+
  'SUM(ROUND(A.VDPA_MONTOH3,2)) AS TRIPLES,SUM(A.VDPA_GRAVADO) AS GRAVADO, '+
  'SUM(A.VDPA_EXENTO) AS EXENTO, sum(A.VDPA_GRAVADO+a.vdpa_exento) as TOTAL_GREX '+
  ' FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_CONP IN ('+#39+'021'+#39+')'+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39;
  q.open;
  gHoras.cells[0,0]:='Monto';
  gHoras.cells[1,0]:=Formatfloat('#,#0.00',q.fields[0].asfloat);
  gHoras.cells[0,1]:='Dobles';
  gHoras.cells[1,1]:=Formatfloat('#,#0.00',q.fields[1].asfloat);
  gHoras.cells[0,2]:='Triples';
  gHoras.cells[1,2]:=Formatfloat('#,#0.00',q.fields[2].asfloat);
  gHoras.cells[0,3]:='Gravado';
  gHoras.cells[1,3]:=Formatfloat('#,#0.00',q.fields[3].asfloat);
  gHoras.cells[0,4]:='Excento';
  gHoras.cells[1,4]:=Formatfloat('#,#0.00',q.fields[4].asfloat);
  gHoras.cells[0,5]:='Total';
  gHoras.cells[1,5]:=Formatfloat('#,#0.00',q.fields[5].asfloat);

  q.close;
  q.sql.text:='SELECT SUM(A.VDPA_MONTO) '+
  ' FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_CONP IN ('+#39+'021'+#39+')'+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')';
  q.open;
  het1.caption:= Formatfloat('#,#0.00',q.fields[0].asfloat);


  // para cuadrar la Prima Dominical
  primaGr.caption:='0.00';
  primaEx.caption:='0.00';
  primaMonto.caption:='0.00';
  primaTotal.caption:='0.00';
  q.close;
  q.sql.text:='SELECT SUM(A.VDPA_MONTO), SUM(A.VDPA_GRAVADO), sum(A.VDPA_EXENTO) '+
  'FROM FE_CQPVDPAGOS A WHERE A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_CONP IN ('+#39+'032'+#39+') AND A.VDPA_MOVI<>8';
  q.OPEN;
  primaGr.caption:=Formatfloat('#,#0.00',q.fields[1].asfloat);;
  primaEx.caption:=Formatfloat('#,#0.00',q.fields[2].asfloat);
  primaMonto.caption:=Formatfloat('#,#0.00',q.fields[0].asfloat);
  primaTotal.caption:=Formatfloat('#,#0.00',q.fields[1].asfloat+q.fields[2].asfloat);

end
else
  Showmessage('Debe elegir el tipo de nomina con el que se va trabajar');
 end;



procedure TFDetalle.SpeedButton4Click(Sender: TObject);

begin
  inherited;
IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call FE_COLOCAFONDO(to_date('+#39+periodo.text+'/'+anio.text+#39+'))';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Clasificando por Federal, Propio o Mixto');
              q.execsql;
              Showmessage('Se clasifico pagos por Federal, Propio o Mixto para el periodo: '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que se trabajará');

end;


procedure TFDetalle.TipoNomChange(Sender: TObject);
begin
  inherited;
if str_(tiponom.text,'-')='HON' then quenom:=CHR(39)+'HO'+CHR(39)+','+CHR(39)+'O'+CHR(39)+','+
                                             CHR(39)+'N'+CHR(39)+','+CHR(39)+'E'+CHR(39)+','+
                                             CHR(39)+'FO'+CHR(39)+','+CHR(39)+'C'+CHR(39);
if str_(tiponom.text,'-')='V' then quenom:=CHR(39)+'V'+CHR(39)+','+CHR(39)+'FV'+CHR(39);
if str_(tiponom.text,'-')='H' then quenom:=CHR(39)+'H'+CHR(39)+','+CHR(39)+'FH'+CHR(39);
if str_(tiponom.text,'-')='J' then quenom:=CHR(39)+'PO'+CHR(39)+','+CHR(39)+'FP'+CHR(39);
if str_(tiponom.text,'-')='D' then quenom:=CHR(39)+'DI'+CHR(39);

if str_(tiponom.text,'-')='%' then quenom:=CHR(39)+'HO'+CHR(39)+','+CHR(39)+'O'+CHR(39)+','+
                                   CHR(39)+'N'+CHR(39)+','+CHR(39)+'E'+CHR(39)+','+
                                   CHR(39)+'V'+CHR(39)+','+CHR(39)+'FV'+CHR(39)+','+
                                   CHR(39)+'H'+CHR(39)+','+CHR(39)+'FH'+CHR(39)+','+
                                   CHR(39)+'PO'+CHR(39)+','+CHR(39)+'FP'+CHR(39)+','+
                                   CHR(39)+'DI'+CHR(39)+','+CHR(39)+'FO'+CHR(39)+','+CHR(39)+'C'+CHR(39);


end;

procedure  TFDetalle.copiarGrid(g:TstringGrid);
const
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.
var
R, C: integer; // R= de row Fila, y C= de columna
S: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
{Cuadricula es el nombre del componente StringGrid}
S := '';
barrap.progress:=0;
barrap.MaxValue:=g.rowcount-1;
for R := 0 to G.RowCount - 1 do
    begin
        for C := 0 to G.ColCount - 1 do
            begin
                S := S + stringReplace(TRIM(G.Cells[C, R]),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < G.ColCount - 1 then
                   S := S + TAB; //esta condición es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           S := S + CR;
        barrap.progress:=barrap.progress+1;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
Showmessage('Registros copiados --> Abra Excel y presione CTRL + V');

END;


procedure TFDetalle.Button9Click(Sender: TObject);
var
x:integer;
idempl:string;
begin
  inherited;

end;


procedure TFDetalle.Button12Click(Sender: TObject);
begin
  inherited;

  Q.close;
  q.sql.text:=' UPDATE NOM10007RFC A SET  '+
  ' A.APEPAT=(SELECT EMPL_APEPAT FROM PEMPLHAS S WHERE S.EMPL_PERSONA=A.EMPL), '+
  ' A.APEMAT=(SELECT EMPL_APEMAT FROM PEMPLHAS S WHERE S.EMPL_PERSONA=A.EMPL), '+
  ' A.NOMBRE=(SELECT EMPL_NOMBRE FROM PEMPLHAS S WHERE S.EMPL_PERSONA=A.EMPL)  '+
  ' WHERE A.EMPL  LIKE '+#39+'P%'+#39;
  savetofilelog(q.sql.text);
  q.ExecSQL;

  Q.close;
  q.sql.text:='UPDATE NOM10007RFC A SET  '+
  'A.APEPAT=(SELECT PERS_APEPAT FROM FPERSONAS S WHERE S.PERS_PERSONA=A.EMPL), '+
  'A.APEMAT=(SELECT PERS_APEMAT FROM FPERSONAS S WHERE S.PERS_PERSONA=A.EMPL),  '+
  'A.NOMBRE=(SELECT PERS_NOMBRE FROM FPERSONAS S WHERE S.PERS_PERSONA=A.EMPL)  '+
  ' WHERE A.EMPL LIKE '+#39+'0%'+#39+
  ' OR A.EMPL  LIKE '+#39+'PO%'+#39+
  ' OR A.EMPL  LIKE '+#39+'PV%'+#39+
  ' OR A.EMPL  LIKE '+#39+'PA%'+#39+
  ' OR A.EMPL  LIKE '+#39+'V%'+#39+
  ' OR A.EMPL  LIKE '+#39+'S%'+#39;
  savetofilelog(q.sql.text);
  q.execsql;



end;

procedure TFDetalle.GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
lin:=arow;
col:=acol;
end;

procedure TFDetalle.JuntarNomClick(Sender: TObject);
begin
  inherited;
if Application.MessageBox('¿Seguro que desea correr el proceso de traspasar los detalles de Pagos. SE PERDERAN LOS DATOS DE ESTE PERIODO?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call FE_CQGrabarDetPagos(to_date('+#39+periodo.text+'/'+anio.text+#39+'),'+#39+periodofin.text+#39+')';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Juntando Nominas....');
              q.execsql;

              Showmessage('Se movieron los registros de las nominas con fecha de inicio '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que s etrabajará');
  end;

end;

procedure TFDetalle.periodoChange(Sender: TObject);
begin
  inherited;


  IF copy(periodo.text,1,2)='01' then
     periodofin.text:='15/'+copy(periodo.text,4,2)+'/'+FORMATDATETIME('YYYY',DATE);
  IF copy(periodo.text,1,2)='16' then
     begin
       q.close;
       q.sql.text:='select to_char(trunc(last_day('+
                    #39+periodo.text+'/'+FORMATDATETIME('YYYY',DATE)+#39+')),'+#39+'DD'+#39+')  from dual';
       q.open;
       periodofin.text:=q.fields[0].asstring+'/'+copy(periodo.text,4,2)+'/'+FORMATDATETIME('YYYY',DATE);
     end;

end;

procedure TFDetalle.gDblClick(Sender: TObject);
begin
  inherited;
SumarNominas;
end;

procedure TFDetalle.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if pcuadre.ActivePageIndex=0 then
     exportarGrXLS(G);
  if pcuadre.ActivePageIndex=1 then
     exportarGrXLS(Gfon);
  if pcuadre.ActivePageIndex=2 then
     exportarGrXLS(ggrEx);
  if pcuadre.ActivePageIndex=3 then
     exportarGrXLS(gOrigen);
    if pcuadre.ActivePageIndex=4 then
     exportarGrXLS(GhORAS);
end;

procedure TFDetalle.BitBtn2Click(Sender: TObject);
begin
  inherited;
sumarNominas;
end;

procedure TFDetalle.JuntarHASClick(Sender: TObject);
begin
  inherited;
if Application.MessageBox('¿Seguro que desea correr el proceso de traspasar los detalles de Pagos. SE PERDERAN LOS DATOS DE ESTE PERIODO?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call FE_CQGrabarDetPagosHAS(to_date('+#39+periodo.text+'/'+anio.text+#39+'),'+#39+periodofin.text+#39+')';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Juntando Nominas....');
              q.execsql;

              Showmessage('Se movieron los registros de las nominas con fecha de inicio '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que s etrabajará');
  end;

end;

procedure TFDetalle.fondosClick(Sender: TObject);
begin
  inherited;
  IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call CALL FE_GRAVEX(to_date('+#39+periodo.text+'/'+anio.text+#39+'))';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Clasificando montos por Gravados y Excentos');
              q.execsql;
              Showmessage('Se clasificarón los montos (Gravados y Excentos): '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que se trabajará');
end;

procedure TFDetalle.SpeedButton8Click(Sender: TObject);
begin
  inherited;
IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call FE_determinaHEX(to_date('+#39+periodo.text+'/'+anio.text+#39+'))';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Calculando Número de Horas Extras por periodo');
              q.execsql;
              Showmessage('Se calculo las Horas Extras para el periodo: '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que se trabajará');
end;

procedure TFDetalle.gOrigenDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  TEXTO:string;
begin
  if (ACol=2) and (arow>0) then
  begin
     Texto := (Sender as TstringGrid).Cells[acol,ARow];
     (Sender as TstringGrid).Canvas.font.Color := clBlue;
     (Sender as TstringGrid).Canvas.font.Size := 12;
    DrawText( (Sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);

  end;

  if (ACol=0) and (arow>2) then
  begin
     Texto := (Sender as TstringGrid).Cells[acol,ARow];
     (Sender as TstringGrid).Canvas.font.Color := clGreen;
     (Sender as TstringGrid).Canvas.font.Size := 12;
    DrawText( (Sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);

  end;
end;

procedure TFDetalle.GFonDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  TEXTO:string;
begin
  if (arow=(Sender as TstringGrid).rowcount-1) then
  begin
     Texto := (Sender as TstringGrid).Cells[acol,ARow];
     (Sender as TstringGrid).Canvas.font.Color := clBlue;
     (Sender as TstringGrid).Canvas.font.Size := 12;
    DrawText( (Sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);

  end;
end;

procedure TFDetalle.btnEmpleadosClick(Sender: TObject);
var
cad:string;
begin
  inherited;

IF OBTSQL.Checked  then
   begin
      qEmpl.close;
      cad:=stringreplace(sqlEmpl.text,':LASNOM',QUENOM,[rfReplaceAll, rfIgnoreCase]);
      cad:=stringreplace(CAD,':PERIODO',#39+periodo.text+'/'+anio.text+#39,[rfReplaceAll, rfIgnoreCase]);
      qEmpl.sql.text:= CAD;
      sqlEmpl.SelectAll;
      sqlempl.CopyToClipboard;
      btnSQLEmplClick(nil);
   end
else
   begin
      q.close;
      q.sql.text:='SELECT count(DISTINCT(j.vdpa_pago)) FROM FE_CQPVDPAGOS J, FPERSONAS K, PATREMPL L '+
      ' WHERE J.VDPA_PERIODO='+#39+periodo.text+'/'+anio.text+#39+' AND J.VDPA_EMPL=K.PERS_PERSONA '+
      ' AND K.PERS_PERSONA=L.ATRE_EMPL AND J.VDPA_QUENOM IN ('+QUENOM+')';
      q.open;
      NEMPL.caption:=q.fields[0].asstring;

      qEmpl.close;
      cad:=stringreplace(sqlEmpl.text,':LASNOM',QUENOM,[rfReplaceAll, rfIgnoreCase]);
      cad:=stringreplace(CAD,':PERIODO',#39+periodo.text+'/'+anio.text+#39,[rfReplaceAll, rfIgnoreCase]);
      qEmpl.sql.text:= CAD;
      qEmpl.open;
   end;
pagePrin.ActivePageIndex:=1;
end;


procedure exportarGridExcel (mGrid : tdbgrid);
var
  rangoExcel : Excel97.range;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  mTabla : tdataset;
  aplicacionExcel : TExcelApplication;
begin

  aplicacionExcel := TExcelApplication.Create(nil);
  mTabla := mGrid.datasource.dataset;
  aplicacionExcel.Visible[0] := true;
  aplicacionExcel.workbooks.add(NULL, 0);
  rangoExcel := aplicacionExcel.ActiveCell;
  for i:= 0 to mTabla.Fields.Count - 1 do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;
  //aplicamos un autoformato de Excel a las filas y columnas añadidas
  rangoExcel.AutoFormat(10, NULL, NULL, NULL, NULL, NULL, NULL);
  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.First;
      fila := 2;
      while not mTabla.Eof do
      begin
        rangoExcel := aplicacionExcel.Range['A' + inttostr(fila), 'A' + inttostr(fila)];
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
        end;
        mTabla.Next;
        Inc(fila);
      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
      mTabla.EnableControls;
    end;
    //se podría formatear para dejar con mejor aspecto
    //rangoExcel:=aplicacionExcel.Range['A1','E'+inttostr(row-1)];
   //rangoExcel.AutoFormat(3,NULL,NULL,NULL,NULL,NULL,NULL);
 end;

procedure TFDetalle.BitBtn3Click(Sender: TObject);
begin
  inherited;
ExportarXLS(QeMPL,'Empleados',strtoint(nempl.caption));
//exportarGridExcel(dbEmpl);
end;

procedure TFDetalle.btnSQLEmplClick(Sender: TObject);
begin
  inherited;
   DBempl.Visible:=false;
   elsqlempl.Align:=alBottom;
   elsqlempl.Height:=450;
   elsqlempl.Visible:=true;
   elsqlempl.Text:=qEmpl.SQL.text;

end;

procedure TFDetalle.elSQLEmplDblClick(Sender: TObject);
begin
  inherited;
   elsqlempl.Visible:=false;
   dbEmpl.Visible:=true;
end;

procedure TFDetalle.btnSQLpERClick(Sender: TObject);
begin
  inherited;
    DBPer.Visible:=false;
   elsqlPer.Align:=alBottom;
   elsqlPer.Height:=450;
   elsqlPer.Visible:=true;
   elsqlPer.Text:=qPer.SQL.text;
end;


procedure TFDetalle.GuardaFile(elSQL:Tquery; nombreF:string; numReg:integer);
var
x:integer;
y:integer;
cad:string;
F: TextFile;

begin
   barrap.MaxValue:=numReg;
   barrap.Progress:=0;
   if FileExists(nombreF) then
      DeleteFile(nombreF);
   AssignFile( F, nombreF );
   Rewrite( F );
   Elsql.First;
   while not (elSQL.eof) do
      begin
         cad:='';
         for y:=0 to elSQL.FieldCount-1 do
            begin
               cad:=cad+trim(elSQL.fields[y].asstring)+',';
            end;
         cad:=copy(cad,1,length(cad)-1);
         Writeln( F, cad );
         barrap.Progress:=barrap.Progress+1;
      ELSQL.NEXT;
      end;
   closeFile(f);
   BARRAp.Progress:=0;
end;

procedure TFDetalle.BitBtn4Click(Sender: TObject);
begin
  inherited;
ExportarXLS(QPer,'Percepciones',strtoint(nper.caption));
end;

procedure TFDetalle.btnSQLDedClick(Sender: TObject);
begin
  inherited;
    DBDed.Visible:=false;
   elsqlDed.Align:=alBottom;
   elsqlDed.Height:=450;
   elsqlDed.Visible:=true;
   elsqlDed.Text:=qDed.SQL.text;
end;

procedure TFDetalle.BitBtn5Click(Sender: TObject);
begin
  inherited;
ExportarXLS(QDed,'Deducciones',strtoint(nded.caption));
end;

procedure TFDetalle.btnPercepClick(Sender: TObject);
var
cad:string;
begin
  inherited;
IF OBTSQL.Checked  then
   begin
      QPer.close;
      cad:=stringreplace(sqlPer.text,':LASNOM',QUENOM,[rfReplaceAll, rfIgnoreCase]);
      cad:=stringreplace(CAD,':PERIODO',#39+periodo.text+'/'+anio.text+#39,[rfReplaceAll, rfIgnoreCase]);
      QPer.sql.text:= CAD;
      sqlPer.SelectAll;
      sqlPer.CopyToClipboard;
      btnSQLPerClick(nil);
   end
else
   begin

      Q.close;
      q.sql.text:='select count(*) from (SELECT a.vdpa_conp FROM FE_CQPVDPAGOS A '+
      ' WHERE A.VDPA_PERIODO='+#39+periodo.text+'/'+anio.text+#39+' AND A.VDPA_PERDED='+#39+'P'+#39+
      ' AND A.VDPA_QUENOM  IN ('+QUENOM+') GROUP BY A.VDPA_PAGO, A.VDPA_CONP) ';
      Savetofilelog(q.sql.text);
      q.OPEN;
      nper.caption:=q.fields[0].asstring;

      qper.close;
      cad:=stringreplace(sqlPer.text,':LASNOM',QUENOM,[rfReplaceAll, rfIgnoreCase]);
      cad:=stringreplace(CAD,':PERIODO',#39+periodo.text+'/'+anio.text+#39,[rfReplaceAll, rfIgnoreCase]);
      qper.sql.text:= CAD;
      qper.open;
   end;
pagePrin.ActivePageIndex:=2;
end;

procedure TFDetalle.btnDeducClick(Sender: TObject);
var
cad:string;
begin
  inherited;
IF OBTSQL.Checked  then
   begin
      QDed.close;
      cad:=stringreplace(sqlDed.text,':LASNOM',QUENOM,[rfReplaceAll, rfIgnoreCase]);
      cad:=stringreplace(CAD,':PERIODO',#39+periodo.text+'/'+anio.text+#39,[rfReplaceAll, rfIgnoreCase]);
      qDed.sql.text:= CAD;
      sqlDed.SelectAll;
      sqlDed.CopyToClipboard;
      btnSQLDedClick(nil);
   end
else
   begin
      Q.close;
      q.sql.text:='select count(*) from (SELECT a.vdpa_conp FROM FE_CQPVDPAGOS A '+
      ' WHERE A.VDPA_PERIODO='+#39+periodo.text+'/'+anio.text+#39+' AND A.VDPA_PERDED='+#39+'D'+#39+
      ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
      ' AND A.VDPA_QUENOM  IN ('+QUENOM+') GROUP BY A.VDPA_PAGO, A.VDPA_CONP) ';
      SAVETOFILELOG(Q.SQL.TEXT);
      q.OPEN;
      nded.caption:=q.fields[0].asstring;


      qDed.close;
      cad:=stringreplace(sqlDed.text,':LASNOM',QUENOM,[rfReplaceAll, rfIgnoreCase]);
      cad:=stringreplace(CAD,':PERIODO',#39+periodo.text+'/'+anio.text+#39,[rfReplaceAll, rfIgnoreCase]);
      qDed.sql.text:= CAD;
      qDed.open;
   end;
pagePrin.ActivePageIndex:=3;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call FE_CUADRAPRIMADOM(to_date('+#39+periodo.text+'/'+anio.text+#39+'))';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Calculando Prima Dominical por periodo');
              q.execsql;
              Showmessage('Se calculo las Prima Dominical para el periodo: '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que se trabajará');

end;

procedure TFDetalle.btnGruardaPClick(Sender: TObject);
begin
  inherited;
 if savef.Execute then
           guardaFile(qper,savef.filename,strtoint(nper.caption));
end;

end.
