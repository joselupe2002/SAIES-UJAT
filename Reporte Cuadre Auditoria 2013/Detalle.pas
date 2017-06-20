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
    TabSheet9: TTabSheet;
    Label33: TLabel;
    TipoNom2: TComboBox;
    Label34: TLabel;
    periodo2: TComboBox;
    anio2: TEdit;
    Label35: TLabel;
    periodofin2: TEdit;
    Label36: TLabel;
    empl2: TLabel;
    tp2: TLabel;
    td2: TLabel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Shape3: TShape;
    gcq2: TStringGrid;
    BitBtn1: TBitBtn;
    DBGrid2: TDBGrid;
    QD: TQuery;
    DSQD: TDataSource;
    barrac2: TProgressBar;
    barrap: TGauge;
    barrac: TProgressBar;
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

    procedure periodo2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TipoNom2Change(Sender: TObject);
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




procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 626;
 Width :=  967 ;

 anio2.text:=formatdatetime('YYYY',now);



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
                   S := S + TAB; //esta condición es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           S := S + CR;
        barrap.progress:=barrap.progress+1;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
Showmessage('Registros copiados --> Abra Excel y presione CTRL + V');
barrac.position:=0;
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
   if tipo='G' then ncol:=3;
   if tipo='E' then ncol:=4;
   if (tipo<>'G') and (tipo<>'E') then ncol:=2;
   monto:='0';


   for x:=strtoint(empieza) to datos.rowcount-1 do
       begin
           if datos.cells[0,x]<>empl then
              break;
           if datos.cells[1,x]=concepto then
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

procedure TFDetalle.periodo2Change(Sender: TObject);
begin
  inherited;
  PERIODOFIN2.Clear;
  IF copy(periodo2.text,1,2)='01' then
     periodofin2.text:='15/'+copy(periodo2.text,4,2)+'/'+FORMATDATETIME('YYYY',DATE);
  IF copy(periodo2.text,1,2)='16' then
     begin
       q.close;
       q.sql.text:='select to_char(trunc(last_day('+
                    #39+periodo2.text+'/'+FORMATDATETIME('YYYY',DATE)+#39+')),'+#39+'DD'+#39+')  from dual';
       q.open;
       periodofin2.text:=q.fields[0].asstring+'/'+copy(periodo2.text,4,2)+'/'+FORMATDATETIME('YYYY',DATE);
     end;

end;

procedure TFDetalle.BitBtn1Click(Sender: TObject);
var
x,y:integer;
begin
  inherited;
  limpiagrid(gcq2);
  limpiagrid(gindx);
  limpiagrid(datos);
  gcq2.rowcount:=1;
  gindx.rowcount:=1;
  datos.rowcount:=2;
  tp2.Caption:='...';
  td2.Caption:='...';
  empl2.caption:='...';

  q.Close;
  q.SQL.text:='select distinct(B.IDCONP), B.MOV, B.PERDED, b.PERDED||'+#39+'_'+#39+
  '||B.idconp||'+#39+'_'+#39+'||b.descrip||'+#39+'_'+#39+'||B.MOV'+
  ' from CONCEPTOS_AUDIT2013 B'+
  ' where quenom in ('+quenom+')'+
  ' order by B.PERDED DESC, B.IDCONP ASC ';
  savetofilelog(q.sql.text);
  q.open;
  gcq2.ColCount:=3;
  gcq2.rowCount:=4;
  while not (q.Eof) do
     begin
       gcq2.cells[gcq2.ColCount,0]:=q.fields[0].asstring;
       gcq2.cells[gcq2.ColCount,1]:=q.fields[1].asstring;
       gcq2.cells[gcq2.ColCount,2]:=q.fields[2].asstring;
       gcq2.cells[gcq2.ColCount,3]:=q.fields[3].asstring;
       gcq2.ColCount:=gcq2.ColCount+1;
       q.Next;
     end;

  q.close;
  q.sql.text:='select distinct(d.VDPA_EMPLR) AS VDPA_EMPL, d.VDPA_EMPLR,'+
  ' T.PERS_APEPAT||'+#39+' '+#39+'||T.PERS_APEMAT||'+#39+' '+#39+'||T.PERS_NOMBRE'+
  ' from CQPVDPAGOSAUDIT2013 d, FPERSONAS T where '+
  //' to_date(D.VDPA_PERIODO) BETWEEN '+#39+PERIODO2.text+'/'+anio2.text+#39+' AND '+#39+periodofin2.text+#39+
  '  d.VDPA_EMPLR=T.PERS_PERSONA '+
  ' AND d.vdpa_QUENOM IN ('+quenom+')'+
  ' AND (D.VDPA_EMPLR IN (SELECT A.EMPL FROM PDIMFINAL_2013 A WHERE A.ENVIAR='+#39+'S'+#39+')'+
  ' or '+
  ' D.VDPA_EMPL IN (SELECT A.EMPL FROM PDIMFINAL_2013 A WHERE A.ENVIAR='+#39+'S'+#39+')) '+
  ' ORDER BY VDPA_EMPLR ';
  savetofilelog(q.sql.text);
  q.open;

  while not (q.Eof) do
     begin
       gcq2.cells[0,gcq2.rowcount]:=q.fields[0].asstring;
       gcq2.cells[1,gcq2.rowcount]:=q.fields[1].asstring;
       gcq2.cells[2,gcq2.rowcount]:=q.fields[2].asstring;
       gcq2.rowcount:=gcq2.rowcount+1;
       q.Next;
     end;

     barrac2.Position:=0;
     barrac2.Max:= gcq2.rowcount;

     qD.close;
     qD.sql.text:='SELECT S.VDPA_EMPLR as idempleado, S.VDPA_CONP as idconcepto, S.VDPA_PERDED AS PERDED, SUM(S.VDPA_MONTO) AS TOTAL, '+
     'DECODE((SELECT COUNT(*) FROM PISPTGRAVAXLEY Z WHERE Z.ISPT_CONP=S.VDPA_CONP),0,0,SUM(S.VDPA_MONTO)) AS GRAVADO,'+
     'DECODE((SELECT COUNT(*) FROM PISPTGRAVAXLEY Z WHERE Z.ISPT_CONP=S.VDPA_CONP),0,SUM(S.VDPA_MONTO),0) AS EXENTO'+
     ' FROM CQPVDPAGOSAUDIT2013 S WHERE '+
     ' S.VDPA_QUENOM IN ('+quenom+')'+
     ' AND to_date(S.VDPA_PERIODO) BETWEEN '+#39+PERIODO2.text+'/'+anio2.text+#39+' AND '+#39+periodofin2.text+#39+
     ' AND (S.VDPA_EMPLR IN (SELECT A.EMPL FROM PDIMFINAL_2013 A WHERE A.ENVIAR='+#39+'S'+#39+')'+
     ' or '+
     ' S.VDPA_EMPL IN (SELECT A.EMPL FROM PDIMFINAL_2013 A WHERE A.ENVIAR='+#39+'S'+#39+'))'+

     ' GROUP BY S.VDPA_EMPLR, S.VDPA_CONP, S.VDPA_PERDED '+
     ' ORDER BY S.VDPA_EMPLR, S.VDPA_CONP, S.VDPA_PERDED ';
     savetofilelog(qd.sql.text);
     QD.OPEN;


end;


procedure TFDetalle.Button9Click(Sender: TObject);
var
x:integer;
idempl:string;
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
barrac2.Max:=qd.RecordCount;
barrac2.Position:=0;
while not(qd.eof) do
   begin
      datos.Cells[0,datos.RowCount-1]:=qd.fieldbyname('idempleado').asstring;
      datos.Cells[1,datos.RowCount-1]:=qd.fieldbyname('idconcepto').asstring;
      datos.Cells[2,datos.RowCount-1]:=qd.fieldbyname('total').asstring;
      datos.Cells[3,datos.RowCount-1]:=qd.fieldbyname('gravado').asstring;
      datos.Cells[4,datos.RowCount-1]:=qd.fieldbyname('exento').asstring;
      datos.Cells[5,datos.RowCount-1]:=qd.fieldbyname('PERDED').asstring;
      if idempl<> qd.fieldbyname('idempleado').asstring then
         begin
             idempl:=qd.fieldbyname('idempleado').asstring;
             gindx.Cells[0,gindx.RowCount-1]:=idempl;
             gindx.Cells[1,gindx.RowCount-1]:=inttostr(datos.RowCount-1);
             gindx.RowCount:=gindx.RowCount+1;
         end;
      datos.rowcount:=datos.rowcount+1;
      barrac2.Position:=barrac2.Position+1;
      qd.next;
   end;
end;


procedure TFDetalle.Button10Click(Sender: TObject);
var
x,y:integer;
posempl:string;
percep,deduc:real;
begin
  inherited;
barrac2.Position:=0;
barrac2.Max:=gcq2.rowcount-4;
lapos:=0;
for x:=4 to  gcq2.rowcount-1 do
    begin
       for y:=3 to  gcq2.colcount-1 do
          begin
              posempl:=buscaClave(gcq2.cells[0,x]);
              if posempl<>'' then
                 begin
                     gcq2.cells[y,x]:=buscaConcepto2(posempl,gcq2.cells[y,1],gcq2.cells[y,0],gcq2.cells[0,x],gcq2.cells[y,2]);
                 end;
          end;
       barrac2.Position:=barrac2.Position+1;
       empl2.Caption:='Empleado'+gcq2.cells[1,x];
       empl2.Update;
       gcq2.Update;
    end;

percep:=0;
deduc:=0;
barrac2.position:=0;
barrac2.max:= gcq2.colcount-1;
for x:=3 to gcq2.colcount-1 do
   begin
       gcq2.cells[x,gcq2.rowcount]:=floattostr(sumacolGrid(gcq2,x));
       if  gcq2.cells[x,2]='P' then
          percep:=percep+strtofloat(gcq2.cells[x,gcq2.rowcount])
       else
          deduc:=deduc+strtofloat(gcq2.cells[x,gcq2.rowcount]);
       barrac2.position:= barrac2.position+1;
   end;
gcq2.rowcount:=gcq2.rowcount+1;
tp2.caption:='Percepción: '+formatfloat('#,#0.00',percep);
td2.caption:='Deducción: '+formatfloat('#,#0.00',deduc);

//==================AGREGANDO CLAVE SAT =========================

for y:=3 to  gcq2.colcount-1 do
  begin
     q.Close;
     q.sql.text:='select CONS_CVESAT from PCONCEPTO A WHERE A.CONC_CONP='+#39+gcq2.cells[y,0]+#39;
     Q.Open;
     gcq2.cells[y,0]:=q.fields[0].asstring;
  end;
//==================AGREGANDO CLAVE SAT =========================

end;


procedure TFDetalle.Button11Click(Sender: TObject);
begin
  inherited;
copiarGrid(gcq2);
end;

procedure TFDetalle.GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
lin:=arow;
col:=acol;
end;

procedure TFDetalle.TipoNom2Change(Sender: TObject);
begin
  inherited;
if str_(tiponom2.text,'-')='OJ' then quenom:=CHR(39)+'O'+CHR(39)+','+CHR(39)+'C'+CHR(39)+','+
                                             CHR(39)+'E'+CHR(39)+','+CHR(39)+'PO'+CHR(39)+','+
                                             CHR(39)+'FO'+CHR(39)+','+CHR(39)+'FP'+CHR(39);
                                             
if str_(tiponom2.text,'-')='O' then quenom:=CHR(39)+'O'+CHR(39)+','+CHR(39)+'C'+CHR(39)+','+
                                             CHR(39)+'E'+CHR(39)+','+CHR(39)+'FO'+CHR(39);

if str_(tiponom2.text,'-')='V' then quenom:=CHR(39)+'V'+CHR(39)+','+CHR(39)+'FV'+CHR(39);

if str_(tiponom2.text,'-')='H' then quenom:=CHR(39)+'H'+CHR(39)+','+CHR(39)+'FH'+CHR(39);

if str_(tiponom2.text,'-')='J' then quenom:=CHR(39)+'PO'+CHR(39)+','+CHR(39)+'FP'+CHR(39);

if str_(tiponom2.text,'-')='N' then quenom:=CHR(39)+'N'+CHR(39)+','+CHR(39)+'FN'+CHR(39);

if str_(tiponom2.text,'-')='%' then quenom:=CHR(39)+'O'+CHR(39)+','+CHR(39)+'C'+CHR(39)+','+
                                            CHR(39)+'E'+CHR(39)+','+CHR(39)+'PO'+CHR(39)+','+
                                            CHR(39)+'FO'+CHR(39)+','+CHR(39)+'FP'+CHR(39)+','+
                                            CHR(39)+'V'+CHR(39)+','+CHR(39)+'FV'+CHR(39)+','+
                                            CHR(39)+'N'+CHR(39)+','+CHR(39)+'FN'+CHR(39)+','+
                                            CHR(39)+'H'+CHR(39)+','+CHR(39)+'FH'+CHR(39);

end;

end.
