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
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    BD: TDatabase;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    usuario: TEdit;
    Label5: TLabel;
    PASS: TEdit;
    Tablas: TComboBox;
    Label6: TLabel;
    CQDsTablas: TDataSource;
    Alias: TComboBox;
    Label3: TLabel;
    CQAux: TQuery;
    DBTablas: TDBGrid;
    grid: TStringGrid;
    Label7: TLabel;
    SQLC: TMemo;
    DBSaies: TDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Lim: TCheckBox;
    DSSaies: TDataSource;
    QSaies: TQuery;
    Q: TQuery;
    CLAVE: TLabel;
    ClaveCQ: TLabel;
    clavesaies: TLabel;
    Tabla: TLabel;
    numerica: TCheckBox;
    rel: TCheckBox;
    barra: TGauge;
    LLAVECQ: TComboBox;
    LLAVESAIES: TComboBox;
    Label8: TLabel;
    CQTablas: TQuery;
    CQ: TQuery;
    aux: TQuery;
    enum: TLabel;
    EBD: TLabel;
    Label19: TLabel;
    TabSheet5: TTabSheet;
    Lista: TFileListBox;
    dire: TDirectoryListBox;
    GCQ: TStringGrid;
    PER: TEdit;
    barrac: TProgressBar;
    empl: TLabel;
    CQD: TQuery;
    DSCQD: TDataSource;
    TabSheet8: TTabSheet;
    DBGrid1: TDBGrid;
    DATOS: TStringGrid;
    GINDX: TStringGrid;
    Label32: TLabel;
    Shape2: TShape;
    tp: TLabel;
    td: TLabel;
    timbrado: TCheckBox;
    DBGrid2: TDBGrid;
    QD: TQuery;
    DSQD: TDataSource;
    periodos: TCheckBox;
    ListarEmpl: TSpeedButton;
    Button7: TSpeedButton;
    button8: TSpeedButton;
    Button6: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure SpeedButton1Click(Sender: TObject);
    procedure TablasChange(Sender: TObject);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gridDblClick(Sender: TObject);
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    function numCampos(g:TstringGrid):integer;
    procedure direChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure copiarGrid(g:TstringGrid);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    Function  buscaClaveBin(cadena:string):string;
    Function  buscaClave(cadena:string):string;
    function buscaConcepto(empieza:string; tipo:string; concepto:string; empl:string):string;
    function buscaConcepto2(empieza:string; tipo:string; concepto:string; empl:string; perded:string):string;
    function sumaConceptos(empieza:string; tipo:string; concepto:string; empl:string):real;
    procedure ListarEmplMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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


procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
EBD.Caption:='...';
bd.Connected:=false;
BD.AliasName:=alias.text;
BD.Params.Clear;
bd.Params.Add('USER NAME='+usuario.text);
bd.Params.Add('PASSWORD='+PASS.text);
bd.Connected:=true;
EBD.Caption:='Conectado a '+alias.text;



end;

procedure TFDetalle.TablasChange(Sender: TObject);
var
x:integer;
begin
  inherited;
  Q.close;
  Q.sql.text:='SELECT * FROM CQTABLAS WHERE TABLA='+#39+STR_(Tablas.text,'-')+#39;
  Q.open;
  sqlc.text:=Q.fieldbyname('SQL').asstring;
  clave.Caption:=Q.fieldbyname('CLAVE').asstring;
  claveCQ.Caption:=Q.fieldbyname('CLAVECQ').asstring;
  claveSaies.Caption:=Q.fieldbyname('CLAVESAIES').asstring;
  tabla.Caption:=Q.fieldbyname('OBJETO').asstring;


  CQTablas.Close;
  CQTablas.SQL.text:='SELECT * FROM '+STR_(Tablas.text,'-');
  CQTablas.Open;

  limpiagrid(grid);
  grid.RowCount:=2;
  for x:=0 to dbTablas.Columns.Count-1 do
      begin
        grid.cells[0,grid.rowcount-1]:='N';
        grid.cells[1,grid.rowcount-1]:=UPPERCASE(dbtablas.Columns.Items[x].DisplayName);
        grid.RowCount:= grid.RowCount+1;
     end;
  grid.RowCount:= grid.RowCount-1;

LLAVECQ.items.clear;
for x:=0 to DBTABLAS.Columns.Count-1 do
   begin
     llavecq.items.add(DBTABLAS.Columns.Items[x].DisplayName);
   end;
end;


procedure TFDetalle.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  Columna:=acol;
  linea:=arow;
end;

procedure TFDetalle.gridDblClick(Sender: TObject);
begin
  inherited;
IF COLUMNA=0 THEN
   if grid.Cells[0,linea]='S' then
      grid.Cells[0,linea]:='N'
   else
      grid.Cells[0,linea]:='S';
 grid.Refresh;

end;

procedure TFDetalle.gridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < Grid.FixedRows) or (ACol < Grid.FixedCols) then
    Grid.Canvas.Brush.Color := clBtnFace
  else
    Grid.Canvas.Brush.Color := clWhite;

  if Grid.Cells[0,ARow]='N' then
           Grid.Canvas.Brush.Color := $00BDFDF9;

  if Grid.Cells[0,ARow]='S' then
       begin
          grid.Canvas.Font.Style:=[fsBold];
          Grid.Canvas.Brush.Color :=$00AEF0E0;
       end;

  Grid.Canvas.FillRect(Rect);
  Texto := Grid.Cells[acol,ARow];
  DrawText( Grid.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;


procedure TFDetalle.SpeedButton2Click(Sender: TObject);
VAR
X:INTEGER;
begin
  inherited;
   QSaies.close;
   QSaies.sql.text:=SQLC.lines.Text;
   QSaies.open;

   LLAVESAIES.items.clear;
    for x:=0 to DBSAIES.Columns.Count-1 do
   begin
     llaveSAIES.items.add(DBSAIES.Columns.Items[x].DisplayName);
   end;
   
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

procedure TFDetalle.direChange(Sender: TObject);
begin
  inherited;
  lista.Directory:=dire.Directory;

end;

procedure TFDetalle.Button4Click(Sender: TObject);
var
x,y:integer;
cadPer:String;
begin
  inherited;
  limpiagrid(gcq);
  limpiagrid(gindx);
  limpiagrid(datos);
  gcq.rowcount:=1;
  gindx.rowcount:=1;
  datos.rowcount:=2;
  tp.Caption:='...';
  td.Caption:='...';
  empl.caption:='...';

  q.Close;
  q.SQL.text:='select T.DIMG_CLAVE, SUBSTR(T.DIMG_CLAVE,LENGTH(T.DIMG_CLAVE),1),'+
  #39+'P'+#39+',T.DIMG_CLAVE from PDIMGRUPOS t WHERE T.DIMG_ACTIVO='+#39+'S'+#39+
  ' ORDER BY  T.DIMG_ORDEN ';
  savetofilelog(q.sql.text);
  q.open;

  gcq.ColCount:=3;
  gcq.rowCount:=4;
  while not (q.Eof) do
     begin
       gcq.cells[gcq.ColCount,0]:=q.fields[0].asstring;    //CONCEPTO SAIES
       gcq.cells[gcq.ColCount,1]:=q.fields[1].asstring;    //MOVIMIENTO GRAVADO O EXENTO
       gcq.cells[gcq.ColCount,2]:=q.fields[2].asstring;    // PERCEPCION O DEDUCCION
       gcq.cells[gcq.ColCount,3]:=q.fields[3].asstring;    //DESCRIP COMPLETA
       gcq.ColCount:=gcq.ColCount+1;
       q.Next;
     end;

  cq.close;
  cq.sql.text:='select distinct(d.idempleado),'+
               'E.RFC+'+
               'right('+#39+'00'+#39+'+cast(DATEPART(yy,e.fechanacimiento) as varchar),2)+'+
               'right('+#39+'00'+#39+'+cast(DATEPART(mm,e.fechanacimiento) as varchar),2)+'+
               'right('+#39+'00'+#39+'+cast(DATEPART(dd,e.fechanacimiento) as varchar),2)+'+
               'e.homoclave, e.codigoempleado, e.nombrelargo '+
               'from nom10007 d, nom10001 e where d.idempleado=e.idempleado'+
               ' order by d.idempleado';
  savetofilelog(cq.sql.text);
  cq.open;
  while not (cq.Eof) do
     begin
       gcq.cells[0,gcq.rowcount]:=cq.fields[0].asstring;
       gcq.cells[1,gcq.rowcount]:=cq.fields[1].asstring;
       gcq.cells[2,gcq.rowcount]:=cq.fields[3].asstring;
       gcq.rowcount:=gcq.rowcount+1;
       cq.Next;
     end;

     barrac.Position:=0;
     barrac.Max:= gcq.rowcount;

     if periodos.Checked then   cadPer:='' else cadPer:=' and d.idperiodo in ('+PER.TEXT+')';

     if not(timbrado.Checked) then
        begin
           cqD.close;
           cqD.sql.text:='select D.idempleado, e.NUMEROCONCEPTO, SUM(D.importetotal) AS TOTAL, '+
           'SUM(D.importe1) AS GRAVADO, SUM(D.importe2) AS EXENTO from nom10007 d, nom10004 e '+
           'WHERE D.IDCONCEPTO=E.IDCONCEPTO ' +cadPer+
           'GROUP BY  D.idempleado, e.NUMEROCONCEPTO'+
           ' order by d.idempleado, e.NUMEROCONCEPTO';
           savetofilelog(cqd.sql.text);
           CQD.OPEN;
       end
     else
       begin
           cqD.close;
           cqD.sql.text:='select D.idempleado, F.Numeroconcepto, SUM(D.importetotal) AS TOTAL, '+
           'SUM(D.importe1) AS GRAVADO, SUM(D.importe2) AS EXENTO from nom10007 d, nom10043 e, nom10004 F '+
           'WHERE d.idperiodo=e.IdPeriodo and d.idempleado=e.idempleado and e.Estado=3 '+
           ' AND D.IDCONCEPTO=F.IDCONCEPTO '  + cadPer +
           'GROUP BY  D.idempleado, F.Numeroconcepto'+
           ' order by d.idempleado, F.Numeroconcepto';
           CQD.OPEN;
       end;

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
barrac.position:=0;
barrac.max:=g.rowcount-1;
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
        barrac.position:=barrac.position+1;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
barrac.position:=0;
END;


procedure TFDetalle.Button6Click(Sender: TObject);
begin
  inherited;
copiarGrid(gcq);
AbrirExcel('hola');
end;

procedure TFDetalle.Button7Click(Sender: TObject);
var
x,y:integer;
idempl:string;
ge:string;
cad:string;
begin
  inherited;

      cqd.First;
      datos.Cells[0,datos.RowCount-1]:='EMPL';
      datos.Cells[1,datos.RowCount-1]:='CONCEPTO';
      datos.Cells[2,datos.RowCount-1]:='TOTAL';
      datos.Cells[3,datos.RowCount-1]:='GRAVADO';
      datos.Cells[4,datos.RowCount-1]:='EXENTO';


      idempl:=cqd.fieldbyname('idempleado').asstring;
      gindx.Cells[0,gindx.RowCount-1]:=idempl;
      gindx.Cells[1,gindx.RowCount-1]:=inttostr(datos.RowCount-1);
      gindx.RowCount:=gindx.RowCount+1;
barrac.Max:=cqd.RecordCount;
barrac.Position:=0;
while not(cqd.eof) do
   begin
      datos.Cells[0,datos.RowCount-1]:=cqd.fieldbyname('idempleado').asstring;
      datos.Cells[1,datos.RowCount-1]:=cqd.fieldbyname('numeroconcepto').asstring;
      datos.Cells[2,datos.RowCount-1]:=cqd.fieldbyname('total').asstring;
      datos.Cells[3,datos.RowCount-1]:=cqd.fieldbyname('gravado').asstring;
      datos.Cells[4,datos.RowCount-1]:=cqd.fieldbyname('exento').asstring;
      if idempl<> cqd.fieldbyname('idempleado').asstring then
         begin
             idempl:=cqd.fieldbyname('idempleado').asstring;
             gindx.Cells[0,gindx.RowCount-1]:=idempl;
             gindx.Cells[1,gindx.RowCount-1]:=inttostr(datos.RowCount-1);
             gindx.RowCount:=gindx.RowCount+1;
         end;
      datos.rowcount:=datos.rowcount+1;
      barrac.Position:=barrac.Position+1;
      cqd.next;
   end;
end;


Function TFDetalle.buscaClave(cadena:string):string;
var
x:integer;
numero:string;

begin
   for x:=lapos to gindx.RowCount-1 do
      begin
         if cadena=gindx.cells[0,x] then
            begin
               numero:=gindx.cells[1,x];
               lapos:=x;
               break;
            end;
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


function TFDETALLE.sumaConceptos(empieza:string; tipo:string; concepto:string; empl:string):real;
var
x:integer;
ncol:integer;
monto:real;
begin

   if tipo='G' then ncol:=3;
   if tipo='E' then ncol:=4;
   if (tipo<>'G') and (tipo<>'E') then ncol:=2;
   monto:=0;
   for x:=strtoint(empieza) to datos.rowcount-1 do
       begin
           if datos.cells[0,x]<>empl then
              break;
           if pos(datos.cells[1,x]+',',concepto)>0 then
                 monto:=monto+strtofloat(datos.cells[ncol,x]);
       end;
sumaConceptos:=monto;
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
           if     empl='PO00003' THEN SHOWMESSAGE(datos.cells[1,x]+'='+concepto);
           if (datos.cells[1,x]=concepto) and (datos.cells[5,x]=perded) then
              begin
                 monto:=datos.cells[ncol,x];
                 break;
              end;

       end;
buscaConcepto2:=monto;
end;

procedure TFDetalle.Button8Click(Sender: TObject);
var
x,y:integer;
posempl:string;
percep,deduc:real;
cad:string;
begin
  inherited;

 for x:=3 to  gcq.colcount-1 do
    begin
            q.close;
            q.sql.text:='select DIMR_CONCEPTO from pdimrelgrupos s where s.dimr_grupo='+
            #39+GCQ.Cells[x,0]+#39;
            q.open;
            cad:='';
            while not(q.eof) do
               begin
                   cad:=cad+q.fields[0].asstring+',';
                   q.next;
               end;
           GCQ.Cells[x,3]:=cad;
   end;



barrac.Position:=0;
barrac.Max:=gcq.rowcount-4;
lapos:=0;
for y:=4 to  gcq.rowcount-1 do
    begin
       for x:=3 to  gcq.colcount-1 do
          begin
              posempl:=buscaClave(gcq.cells[0,y]);
              if posempl<>'' then
                 begin
                     gcq.cells[x,y]:=floattostr(SumaConceptos(posempl,gcq.cells[x,1],gcq.cells[x,3],gcq.cells[0,y]));
                 end;
          end;
       barrac.Position:=barrac.Position+1;
       empl.Caption:='Empleado'+gcq.cells[1,y];
       empl.Update;
       gcq.Update;
    end;

    {
percep:=0;
deduc:=0;
barrac.position:=0;
barrac.max:= gcq.colcount-1;
for x:=3 to gcq.colcount-1 do
   begin
       gcq.cells[x,gcq.rowcount]:=floattostr(sumacolGrid(gcq,x));
       if  gcq.cells[x,2]='P' then
          percep:=percep+strtofloat(gcq.cells[x,gcq.rowcount])
       else
          deduc:=deduc+strtofloat(gcq.cells[x,gcq.rowcount]);
       barrac.position:= barrac.position+1;
   end;
gcq.rowcount:=gcq.rowcount+1;
tp.caption:='Percepción: '+formatfloat('#,#0.00',percep);
td.caption:='Deducción: '+formatfloat('#,#0.00',deduc);    }


end;

procedure TFDetalle.ListarEmplMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   ListarEmpl.Glyph.Assign(nil);
  ListarEmpl.Glyph.get(2,ListarEmpl.Glyph);
end;

end.
