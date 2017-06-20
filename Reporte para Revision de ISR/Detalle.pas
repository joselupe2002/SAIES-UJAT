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
    PageControl1: TPageControl;
    BD: TDatabase;
    CQDsTablas: TDataSource;
    CQAux: TQuery;
    DSSaies: TDataSource;
    QSaies: TQuery;
    Q: TQuery;
    CQTablas: TQuery;
    CQ: TQuery;
    aux: TQuery;
    CQD: TQuery;
    DSCQD: TDataSource;
    TabSheet8: TTabSheet;
    DBGrid1: TDBGrid;
    DATOS: TStringGrid;
    GINDX: TStringGrid;
    DBGrid2: TDBGrid;
    QD: TQuery;
    DSQD: TDataSource;
    TabSheet12: TTabSheet;
    Label37: TLabel;
    EJER: TEdit;
    Label38: TLabel;
    barrap: TGauge;
    Button5: TButton;
    GCQT: TStringGrid;
    emplt: TLabel;
    tpt: TLabel;
    tdt: TLabel;
    Label39: TLabel;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    PopupMenu1: TPopupMenu;
    SumarColumna1: TMenuItem;
    SumarTodaslasColumnas1: TMenuItem;
    PERIODO: TComboBox;
    barrac2: TProgressBar;
    SpeedButton1: TSpeedButton;
    TPSTO: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    function numCampos(g:TstringGrid):integer;
    procedure copiarGrid(g:TstringGrid);
    Function  buscaClaveBin(cadena:string):string;
    Function  buscaClave(cadena:string):string;
    function buscaConcepto(empieza:string; tipo:string; concepto:string; empl:string):string;
    function buscaConcepto2(empieza:string; tipo:string; concepto:string; empl:string; perded:string):string;
    procedure Button5Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SumarColumna1Click(Sender: TObject);
    procedure SumarTodaslasColumnas1Click(Sender: TObject);
    procedure PERIODOChange(Sender: TObject);
    procedure calculaPeriodo;
    procedure EJERChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  elPeriodo:string;
implementation


//uses Repo;

{$R *.DFM}




procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 626;
 Width :=  967 ;



   ejer.Text:=formatdatetime('YYYY',now);


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


procedure TFDetalle.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  Columna:=acol;
  linea:=arow;
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
                   S := S + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           S := S + CR;
        barrap.progress:=barrap.progress+1;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
Showmessage('Registros copiados --> Abra Excel y presione CTRL + V');
barrap.progress:=0;
END;


Function TFDetalle.buscaClave(cadena:string):string;
var
x:integer;
numero:string;
cuantos:integer;

begin
  cuantos:=0;
   for x:=lapos to gindx.RowCount-1 do
      begin

         if cadena=gindx.cells[0,x] then
            begin
               numero:=gindx.cells[1,x];
               lapos:=x;
               break;
            end;

        cuantos:=cuantos+1;
         if cuantos>3 then break;
      end;
   buscaClave:=numero;
end;



Function TFDetalle.buscaClaveBin(cadena:string):string;
var
valor:integer;
encontrado:boolean;
x:integer;
primero, ultimo, centro, valBus:integer;
descrip:string;
Begin
   encontrado:=false;
   descrip:='';

   try valor:=strtoint(cadena); except valor:=0; end;
   if valor>0 then
      begin
         centro:=0; primero:=0; ultimo:=gindx.rowCount-1;

         while ((primero<=ultimo) and not(encontrado)) do
            begin
                centro:=(primero+ultimo) div 2;

                if gindx.cells[0,centro]=cadena then
                   begin
                      encontrado:=true;
                      Descrip:=gindx.cells[1,centro];
                      break;
                   end
                else
                   begin

                       if (strtoint(gindx.cells[0,centro])>strtoint(cadena)) then
                           ultimo:=centro-1
                       else
                          primero:=centro+1;
                   end;
            end;
       end
   else
      encontrado:=false;
 buscaClaveBin:=descrip;

end;

function TFDETALLE.buscaConcepto(empieza:string; tipo:string; concepto:string; empl:string):string;
var
x:integer;
ncol:integer;
monto:string;
begin
   ncol:=2;
   for x:=strtoint(empieza) to datos.rowcount-1 do
       begin
           if datos.cells[0,x]<>empl then
              break;
           if (datos.cells[1,x]=concepto) and (datos.cells[5,x]=tipo) then
              begin
                 monto:=datos.cells[ncol,x];
                 break;
              end;

       end;
buscaConcepto:=monto;
end;



function TFDETALLE.buscaConcepto2(empieza:string; tipo:string; concepto:string; empl:string; perded:string):string;
var
x:integer;
ncol:integer;
monto:string;
begin
   if tipo='G' then ncol:=3;
   if tipo='E' then ncol:=4;
   if (tipo<>'G') and (tipo<>'E') then ncol:=2;


   monto:='0';
   for x:=strtoint(empieza) to datos.rowcount-1 do
       begin
           if datos.cells[0,x]<>empl then
              break;
        //   if     empl='PO00003' THEN SHOWMESSAGE(datos.cells[1,x]+'='+concepto);
           if (datos.cells[1,x]=concepto) and (datos.cells[5,x]=perded) then
              begin
                 monto:=datos.cells[ncol,x];
                 break;
              end;

       end;
buscaConcepto2:=monto;
end;

procedure TFDetalle.Button5Click(Sender: TObject);
var
x,y:integer;
LP:STRING;
FilTpsto:string;
begin
  inherited;
  limpiagrid(gcqT);
  limpiagrid(gindx);
  limpiagrid(datos);
  gcqT.rowcount:=1;
  gindx.rowcount:=1;
  datos.rowcount:=2;
  
  tpt.Caption:='...';
  tdt.Caption:='...';
  emplt.caption:='...';


  q.Close;
  q.SQL.text:=' SELECT COUNT(*) FROM ( '+
              ' SELECT CONP, DESCRIP, NATURALEZA, ENLANOMINA FROM  PVCONC_REVISR A '+
              ' WHERE A.NOMINA IN (SELECT A.NOMI_NOMINA FROM PNOMINAS A WHERE A.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              ' UNION '+
              ' SELECT CONP, DESCRIP, NATURALEZA, ENLANOMINA FROM  PVCONC_REVISR A '+
              ' WHERE A.NOMINA IN (SELECT A.NOMI_NOMINA FROM PnNOMINAS A WHERE A.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              ' UNION '+
              ' SELECT CONP, DESCRIP, NATURALEZA, ENLANOMINA FROM  PVCONC_REVISR A '+
              ' WHERE A.NOMINA IN (SELECT A.NOMI_NOMINA FROM PhNOMINAS A WHERE A.NOMI_FECINI>='+#39+elPeriodo+#39+'))';
  savetofilelog(q.sql.text);
  q.open;
  barrap.MaxValue:=q.fields[0].asinteger;
  barrap.Progress:=0;


  q.Close;
  q.sql.text:='SELECT CONP, DESCRIP, NATURALEZA, ENLANOMINA FROM  PVCONC_REVISR A '+
              ' WHERE A.NOMINA IN (SELECT A.NOMI_NOMINA FROM PNOMINAS A WHERE A.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              ' UNION '+
              ' SELECT CONP, DESCRIP, NATURALEZA, ENLANOMINA FROM  PVCONC_REVISR A '+
              ' WHERE A.NOMINA IN (SELECT A.NOMI_NOMINA FROM PnNOMINAS A WHERE A.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              ' UNION '+
              ' SELECT CONP, DESCRIP, NATURALEZA, ENLANOMINA FROM  PVCONC_REVISR A '+
              ' WHERE A.NOMINA IN (SELECT A.NOMI_NOMINA FROM PhNOMINAS A WHERE A.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              ' UNION '+
              ' SELECT '+#39+'058-M'+#39+','+#39+'ISR SUBSIDIADO'+#39+','+#39+'D'+#39+','+#39+'D'+#39+' FROM DUAL'+
              ' ORDER BY 4 DESC, 1 ASC';
  savetofilelog(q.sql.text);
  q.open;

  GCQT.ColCount:=3;
  GCQT.rowCount:=4;
  while not (q.Eof) do
     begin
       GCQT.cells[GCQT.ColCount,0]:=q.fields[0].asstring;
       GCQT.cells[GCQT.ColCount,1]:=q.fields[0].asstring+'_'+q.fields[1].asstring;
       GCQT.cells[GCQT.ColCount,2]:=q.fields[2].asstring; //naturaleza del concepto
       GCQT.cells[GCQT.ColCount,3]:=q.fields[3].asstring; //Como salio en la nomina
       GCQT.ColCount:=GCQT.ColCount+1;
       barrap.Progress:=barrap.Progress+1;
       q.Next;
     end;


  FilTpsto:='';
  if TPSTO.TEXT<>'' then filTpsto:=' AND S.TPSTO IN ('+TPSTO.TEXT+')';
  q.close;
  q.sql.text:='SELECT COUNT (*) FROM ( '+
              'SELECT EMPL, NOMBRE FROM PVEMPL_REVISR S WHERE  '+
              ' S.NOMINA IN (SELECT H.NOMI_NOMINA FROM PNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              FilTpsto+
              ' UNION '+
              'SELECT EMPL, NOMBRE FROM PVEMPL_REVISR S WHERE  '+
              ' S.NOMINA IN (SELECT H.NOMI_NOMINA FROM PnNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              FilTpsto+
              ' UNION '+
              'SELECT EMPL, NOMBRE FROM PVEMPL_REVISR S WHERE  '+
              ' S.NOMINA IN (SELECT H.NOMI_NOMINA FROM PhNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              FilTpsto+')';
  savetofilelog(q.sql.text);
  q.open;
  barrap.MaxValue:=q.fields[0].asinteger;
  barrap.Progress:=0;

  q.close;
  q.sql.text:='SELECT EMPL FROM PVEMPL_REVISR S WHERE  '+
              ' S.NOMINA IN (SELECT H.NOMI_NOMINA FROM PNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              FilTpsto+
              ' UNION '+
              'SELECT EMPL FROM PVEMPL_REVISR S WHERE  '+
              ' S.NOMINA IN (SELECT H.NOMI_NOMINA FROM PnNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              FilTpsto+
              ' UNION '+
              'SELECT EMPL FROM PVEMPL_REVISR S WHERE  '+
              ' S.NOMINA IN (SELECT H.NOMI_NOMINA FROM PhNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
              FilTpsto+ ' ORDER BY 1 ';
  savetofilelog(q.sql.text);
  q.open;

  while not (q.Eof) do
     begin
       GCQT.cells[0,GCQT.rowcount]:=q.fields[0].asstring;
       qsaies.Close;
       qsaies.SQL.text:='SELECT getNameEmpl('+#39+q.fields[0].asstring+#39+') FROM DUAL';
       qsaies.open;
       GCQT.cells[1,GCQT.rowcount]:=qsaies.fields[0].asstring;
       GCQT.cells[2,GCQT.rowcount]:=q.fields[0].asstring;
       GCQT.rowcount:=GCQT.rowcount+1;
        barrap.Progress:= barrap.Progress+1;
       q.Next;
     end;

  //aGREGANDO LOS NOMBRES





     QD.CLOSE;
     Qd.sql.text:='SELECT A.EMPL AS IDEMPLEADO, A.CONP AS IDCONCEPTO, A.ENLANOMINA AS PERDED,  SUM(A.MONTO) AS TOTAL FROM PCONP_REVISR A '+
     ' WHERE A.NOMINA IN (SELECT H.NOMI_NOMINA FROM PNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+
     ' UNION '+
     ' SELECT H.NOMI_NOMINA FROM PNNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+
     ' UNION '+
     ' SELECT H.NOMI_NOMINA FROM PHNOMINAS H WHERE H.NOMI_FECINI>='+#39+elPeriodo+#39+')'+
     ' GROUP BY A.EMPL, A.CONP, A.ENLANOMINA order BY A.EMPL, A.CONP, A.ENLANOMINA ';
     qd.open;

    { qD.close;
     qD.sql.text:='SELECT s.codigoempl as idempleado, B.conc_conp as idconcepto, B.conc_perded AS PERDED,  '+
     'SUM(S.IMPORTETOTAL) AS TOTAL,'+
     'decode( B.conc_perded,'+#39+'P'+#39+',SUM(S.IMPORTE1),SUM(S.IMPORTETOTAL)) AS GRAVADO,'+
     'decode( B.conc_perded,'+#39+'P'+#39+',SUM(S.IMPORTE2),0) AS EXENTO '+
     'FROM NOM10007 S, NOM10007RFC T, CQVPCONCEPTO B  WHERE '+
     ' B.conc_conp=S.NUMEROCONCEPTO-200 '+
     ' AND S.CODIGOEMPL=T.EMPL '+
     ' AND S.QUENOM IN ('+LASNOMINAS.TEXT+')'+lp+
     ' AND S.TIMBRADO='+#39+'S'+#39+
     ' GROUP BY S.CODIGOEMPL, B.CONC_CONP, B.conc_perded  '+
     ' ORDER BY S.CODIGOEMPL, B.CONC_CONP,  B.conc_perded  ';
     savetofilelog(qd.sql.text);
     QD.OPEN;  }



end;

procedure TFDetalle.Button14Click(Sender: TObject);
VAR X:INTEGER;
idempl:STRING;
begin
  inherited;
      qd.First;
      datos.Cells[0,datos.RowCount-1]:='EMPL';
      datos.Cells[1,datos.RowCount-1]:='CONCEPTO';
      datos.Cells[2,datos.RowCount-1]:='TOTAL';
      datos.Cells[3,datos.RowCount-1]:='GRAVADO';
      datos.Cells[4,datos.RowCount-1]:='EXENTO';
      datos.Cells[5,datos.RowCount-1]:='PERDED';
      idempl:=qd.fieldbyname('idempleado').asstring;
      gindx.Cells[0,gindx.RowCount-1]:=idempl;
      gindx.Cells[1,gindx.RowCount-1]:=inttostr(datos.RowCount-1);
      gindx.RowCount:=gindx.RowCount+1;

BARRAP.MaxValue:=qd.RecordCount;
BARRAP.Progress:=0;
while not(qd.eof) do
   begin
      datos.Cells[0,datos.RowCount-1]:=qd.fieldbyname('idempleado').asstring;
      datos.Cells[1,datos.RowCount-1]:=qd.fieldbyname('idconcepto').asstring;
      datos.Cells[2,datos.RowCount-1]:=qd.fieldbyname('total').asstring;
      datos.Cells[3,datos.RowCount-1]:=qd.fieldbyname('TOTAL').asstring;
      datos.Cells[4,datos.RowCount-1]:=qd.fieldbyname('TOTAL').asstring;
      datos.Cells[5,datos.RowCount-1]:=qd.fieldbyname('PERDED').asstring;
      if idempl<> qd.fieldbyname('idempleado').asstring then
         begin
             idempl:=qd.fieldbyname('idempleado').asstring;
             gindx.Cells[0,gindx.RowCount-1]:=idempl;
             gindx.Cells[1,gindx.RowCount-1]:=inttostr(datos.RowCount-1);
             gindx.RowCount:=gindx.RowCount+1;
         end;
      datos.rowcount:=datos.rowcount+1;
      barrap.Progress:=barrap.Progress+1;
      qd.next;
   end;

end;

procedure TFDetalle.Button15Click(Sender: TObject);
var
x,y:integer;
posempl:string;
percep,deduc:real;
begin
  inherited;
barrap.Progress:=0;
barrap.MaxValue:=gcqt.rowcount-4;
lapos:=0;
for x:=4 to  GCQT.rowcount-1 do
    begin
       posempl:=buscaClave(GCQT.cells[0,x]);
       for y:=3 to  GCQT.colcount-1 do
          begin

              if posempl<>'' then
                 begin
                     GCQT.cells[y,x]:=buscaConcepto(posempl,GCQT.cells[y,3],GCQT.cells[y,0],GCQT.cells[0,x]);
                 end;
          end;
       barrap.Progress:=barrap.Progress+1;
       emplt.Caption:='Empleado'+GCQT.cells[0,x];
       emplt.Update;
       GCQT.Update;
    end;




end;


procedure TFDetalle.Button16Click(Sender: TObject);
begin
  inherited;
copiarGrid(gcqt);
end;

procedure TFDetalle.GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
lin:=arow;
col:=acol;
end;

procedure TFDetalle.SumarColumna1Click(Sender: TObject);
var
x:integer;
num,suma:real;
begin
  inherited;
  suma:=0;
for x:=4 to  GCQT.rowcount-1 do
  begin
   try num:=strtofloat(GCQT.Cells[col,x]); except num:=0; end;
   suma:=suma+num;
  end;
showmessage('Suma:'+formatfloat('#,#0.00',suma));

end;

procedure TFDetalle.SumarTodaslasColumnas1Click(Sender: TObject);
VAR
X,y:INTEGER;
begin

  inherited;
       barrap.Progress:=0;
       barrap.MaxValue:=gcqt.rowcount-4;
       for y:=3 to  GCQT.colcount-1 do
           begin
              GCQT.cells[Y,GCQT.RowCount]:=formatfloat('#,#0.00',SumaColGridDesdeLinea(GCQT,y,4));
              barrap.progress:=barrap.progress+1;
           end;
       GCQT.RowCount:=GCQT.RowCount+1;

end;


procedure TFDetalle.calculaPeriodo;
begin
elPeriodo:=periodo.text+'/'+ejer.Text;
end;

procedure TFDetalle.PERIODOChange(Sender: TObject);
begin
  inherited;
        calculaPeriodo;
end;

procedure TFDetalle.EJERChange(Sender: TObject);
begin
  inherited;
calculaPeriodo;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if elPeriodo<>'' then
     begin
        Q.Close;
        q.SQL.text:='CALL PGRABACONP_REVISR('+#39+elPeriodo+#39+')';
        q.execsql;
    end;
end;

end.