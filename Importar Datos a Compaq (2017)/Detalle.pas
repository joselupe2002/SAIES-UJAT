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
    obsp: TMemo;
    aux: TQuery;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    periodo: TComboBox;
    anio: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    obserror: TMemo;
    SpeedButton8: TSpeedButton;
    JuntarNom: TSpeedButton;
    Shape1: TShape;
    Label9: TLabel;
    Label12: TLabel;
    pcq: TEdit;
    Label13: TLabel;
    PeriodoFin: TEdit;
    enum: TLabel;
    Label14: TLabel;
    EBD: TLabel;
    pan: TPanel;
    Label15: TLabel;
    emit: TLabel;
    pagnom: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    sinpag: TLabel;
    TabSheet3: TTabSheet;
    SpeedButton9: TSpeedButton;
    Label19: TLabel;
    TabSheet4: TTabSheet;
    SpeedButton10: TSpeedButton;
    gtim: TStringGrid;
    SpeedButton11: TSpeedButton;
    gpen: TStringGrid;
    TabSheet5: TTabSheet;
    Lista: TFileListBox;
    Button3: TButton;
    dire: TDirectoryListBox;
    tipoper: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    periodocq: TComboBox;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Cuadre: TStringGrid;
    Label22: TLabel;
    TOTSAIES: TLabel;
    Label24: TLabel;
    TOT8: TLabel;
    Label25: TLabel;
    TOT7: TLabel;
    CUADREP: TStringGrid;
    Label23: TLabel;
    TPSAIES: TLabel;
    Label27: TLabel;
    TP7: TLabel;
    Label29: TLabel;
    TP8: TLabel;
    CUADRED: TStringGrid;
    Label26: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    TD8: TLabel;
    TD7: TLabel;
    TDSaies: TLabel;
    SpeedButton12: TSpeedButton;
    Button4: TButton;
    GCQ: TStringGrid;
    PER: TEdit;
    barrac: TProgressBar;
    empl: TLabel;
    Button6: TButton;
    CQD: TQuery;
    DSCQD: TDataSource;
    TabSheet8: TTabSheet;
    DBGrid1: TDBGrid;
    DATOS: TStringGrid;
    GINDX: TStringGrid;
    Button8: TButton;
    Label31: TLabel;
    regimen: TComboBox;
    Label32: TLabel;
    Shape2: TShape;
    Button7: TButton;
    tp: TLabel;
    td: TLabel;
    timbrado: TCheckBox;
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
    fondos: TSpeedButton;
    PageControl3: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    g: TStringGrid;
    GFon: TStringGrid;
    TabSheet12: TTabSheet;
    Button2: TButton;
    Label37: TLabel;
    UPeriodos: TEdit;
    Uejer: TEdit;
    Label38: TLabel;
    barrap: TGauge;
    Button5: TButton;
    GCQT: TStringGrid;
    emplt: TLabel;
    tpt: TLabel;
    tdt: TLabel;
    LasNominas: TEdit;
    Button12: TButton;
    Button13: TButton;
    Label39: TLabel;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    JuntarHAS: TSpeedButton;
    Label40: TLabel;
    PopupMenu1: TPopupMenu;
    SumarColumna1: TMenuItem;
    SumarTodaslasColumnas1: TMenuItem;
    NOM1: TEdit;
    Gauge1: TGauge;
    Shape4: TShape;
    TipoNom: TComboBox;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    procedure SumarNominas;
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
    procedure SpeedButton3Click(Sender: TObject);
    function numCampos(g:TstringGrid):integer;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure JuntarNomClick(Sender: TObject);
    procedure periodoChange(Sender: TObject);
    procedure gDblClick(Sender: TObject);
    procedure TipoNomChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure CuadreDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure AliasChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure gtimDblClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure gpenDblClick(Sender: TObject);
    procedure direChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure tipoperChange(Sender: TObject);
    procedure periodocqChange(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure copiarGrid(g:TstringGrid);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    Function  buscaClaveBin(cadena:string):string;
    Function  buscaClave(cadena:string):string;
    function buscaConcepto(empieza:string; tipo:string; concepto:string; empl:string):string;
    function buscaConcepto2(empieza:string; tipo:string; concepto:string; empl:string; perded:string):string;
    procedure TipoNom2Change(Sender: TObject);
    procedure periodo2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure fondosClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure JuntarHASClick(Sender: TObject);
    procedure GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SumarColumna1Click(Sender: TObject);
    procedure SumarTodaslasColumnas1Click(Sender: TObject);
    procedure grabaHoras(tipo:string; empl:string; numHoras:string);

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
 anio.text:=formatdatetime('YYYY',now);
 anio2.text:=formatdatetime('YYYY',now);
 G.CELLS[0,0]:='APLICACION';
 G.CELLS[1,0]:='PERCEPCION';
 G.CELLS[2,0]:='DEDUCCIÓN';
 G.CELLS[0,1]:='SAIES';
 G.CELLS[0,2]:='NOM1008';
 G.CELLS[0,3]:='NOM1007';

 Gfon.CELLS[0,0]:='FONDO';
 Gfon.CELLS[1,0]:='PERCEPCION';
 GFON.CELLS[2,0]:='DEDUCCIÓN';


 Cuadre.cells[0,0]:='CONP';
 Cuadre.cells[1,0]:='DESCRIPCIÓN';
 Cuadre.cells[2,0]:='SAIES';
 Cuadre.cells[3,0]:='NOM10007';
 Cuadre.cells[4,0]:='NOM10008';

   uejer.Text:=formatdatetime('YYYY',now);


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
EBD.Caption:=alias.text+'...';
   panel1.Enabled:=true;

Q.close;
q.sql.text:='SELECT * FROM CQTABLAS';
Q.open;
tablas.clear;
While not(q.eof) do
  begin
    tablas.items.add(q.fieldbyname('TABLA').asstring+'-'+q.fieldbyname('DESCRIP').asstring);
    q.next;
  end;


CQ.close;
cq.sql.text:='SELECT * FROM NOM10023';
CQ.open;
tipoper.Clear;
While not(cq.eof) do
  begin
    tipoper.items.add(cq.fieldbyname('idtipoperiodo').asstring+'-'+cq.fieldbyname('nombretipoperiodo').asstring);
    cq.next;
  end;


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

procedure TFDetalle.SpeedButton3Click(Sender: TObject);
var
columnas, cadSQ:String;
ValclaveCQ:string;
x:integer;
begin
  inherited;
if dbsaies.Columns.Count=numcampos(grid) then
   begin
    if lim.Checked then
       begin
         cqAux.close;
         cqAux.sql.text:='DELETE FROM '+STR_(Tablas.text,'-');
         try CqAux.ExecSQL; EXCEPT  on E: Exception do
                           Obserror.Lines.add( 'Borrando datos de Tabla: '+E.Message+#13+'----------------------------------------'+
                                          cQAux.SQL.TEXT+#13+
                                          '----------------------------------------' ) END;
       end;

    barra.MaxValue:=qsaies.RecordCount;
    barra.Progress:=0;
    WHILE NOT (QSaies.EOF) DO
       BEGIN
          CqTablas.close;
          if NOT(numerica.checked) then
              CQTablas.sql.text:='SELECT count(*) FROM '+STR_(Tablas.text,'-')+' WHERE '+LLAVECQ.TEXT+'='+
              #39+QSAIES.FIELDbyname(llavesaies.text).asstring+#39
          else
              CQTablas.sql.text:='SELECT count(*) FROM '+STR_(Tablas.text,'-')+' WHERE '+LLAVECQ.TEXT+'='+
              QSAIES.FIELDbyname(llavesaies.text).asstring;
          CQTablas.open;

          if (CQTablas.Fields[0].asinteger<=0) then
              begin
                  cadsQ:='INSERT INTO '+STR_(Tablas.text,'-')+ ' (';
                  columnas:='';
                  for x:=1 to grid.rowcount-1 do
                     begin
                        if grid.Cells[0,x]='S' then
                           columnas:=COLUMNAS+grid.Cells[1,x]+',';
                     end;
                  columnas:=copy(columnas,1,length(columnas)-1);
                  cadSQ:=cadSQ+columnas+')'+ ' VALUES (';

                  columnas:='';
                  for x:=0 to dbSaies.Columns.Count-1 do
                        columnas:=columnas+#39+qSaies.fieldbyname(dbsaies.Columns.Items[x].DisplayName).asstring+#39+',';
                  columnas:=copy(columnas,1,length(columnas)-1);

                  cadSQ:=cadSQ+columnas+')';
                  obsP.lines.add(cadsq);
                  CQAUX.CLOSE;
                  CQAux.sql.text:=cadsq;
                  try CQAux.ExecSQL; EXCEPT  on E: Exception do
                                   Obserror.Lines.add( 'Insertando Datos en Compaq: '+E.Message+#13+'----------------------------------------'+
                                                  cqaux.SQL.TEXT+#13+
                                                  '----------------------------------------' ) END;

              end;
           qSaies.Next;
           barra.Progress:=barra.Progress+1;
       end;

    if rel.checked then
      begin
          barra.MaxValue:=qsaies.RecordCount;
          barra.Progress:=0;
          QSAIES.First;
          WHILE NOT (QSaies.EOF) DO
             BEGIN

                 CQAux.Close;
                 if NOT(numerica.checked) then
                     CQAux.sql.text:='SELECT '+claveCQ.Caption+' FROM '+STR_(Tablas.text,'-')+' WHERE '+ clave.caption+'='+#39+
                     qSaies.fieldbyname(CLAVESAIES.CAPTION).asstring+#39
                 else
                     CQAux.sql.text:='SELECT '+claveCQ.Caption+' FROM '+STR_(Tablas.text,'-')+' WHERE '+ clave.caption+'='+
                     qSaies.fieldbyname(CLAVESAIES.CAPTION).asstring;

                 obsP.lines.add(CQAux.sql.text);
                 TRY CQAux.Open;  EXCEPT  on E: Exception do
                                 Obserror.Lines.add( 'Buscando si el registro Existe: '+E.Message+#13+'----------------------------------------'+
                                                CQAUX.SQL.TEXT+#13+
                                                '----------------------------------------' ) END;
                 Valclavecq:=CQAux.fields[0].asstring;

                 q.close;
                 q.sql.text:='DELETE FROM CQRELTAB WHERE SAIES='+#39+qSaies.fieldbyname(CLAVESAIES.CAPTION).asstring+#39+
                 ' AND TABLA ='+#39+tabla.caption+#39;
                 obsP.lines.add(q.sql.text);
                 q.EXECSQL;

                 q.close;
                 q.sql.text:='INSERT INTO CQRELTAB (SAIES, COMPAQ, TABLA) VALUES ('+
                             #39+qSaies.fieldbyname(CLAVESAIES.CAPTION).asstring+#39+','+
                             #39+Valclavecq+#39+','+
                             #39+tabla.caption+#39+')';
                 obsP.lines.add(q.sql.text);
                 try q.execsql;  EXCEPT  on E: Exception do
                                 Obserror.Lines.add( E.Message+#13+'----------------------------------------'+
                                                Q.SQL.TEXT+#13+
                                                '----------------------------------------' ) END;
                 QSaies.next;
                 barra.Progress:=barra.Progress+1;
             END;
       end;
    end
  else
     Showmessage('El número de campos de la consulta no coincide con los campos seleccionados de la tabla de Compaq');
end;

procedure TFDetalle.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  SUMARNOMINAS;
end;

procedure TFDetalle.grabaHoras(tipo:string; empl:string;numHoras:string);
VAR
cadHoras:string;
begin
   cq.close;
   cq.sql.text:='INSERT INTO dbo.nom10010 (idperiodo,idempleado,idtipoincidencia,'+
   'idtarjetaincapacidad,idtcontrolvacaciones,fecha,valor,timestamp) VALUES ('+
   #39+PCQ.TEXT+#39+','+
   #39+empl+#39+','+
   #39+tipo+#39+','+
   #39+''+#39+','+
   #39+''+#39+','+
   #39+periOdo.text+'/'+ANIO.text+#39+','+
   #39+numhoras+#39+','+
   #39+DATETOSTR(NOW)+#39+')';
   savetofilelog(cq.sql.text);
   CQ.execsql;
   cadHoras:='CHORASEXTRAS'+tipo;

   cq.close;
   cq.sql.texT:='UPDATE NOM10034 SET '+cadHoras+'='+numhoras+' where idempleado='+empl+' and cidperiodo='+PCQ.TEXT;
   cq.EXECSQL;

end;

procedure TFDetalle.SpeedButton6Click(Sender: TObject);
var
sql:string;
tablacq:string;
vtipo:string;
TPVDPAGOS:STRING;
idempleado:string;
num:integer;
begin
IF (tiponom.Text<>'') AND (TIPOPER.TEXT<>'') AND (PERIODOCQ.TEXT<>'') then
   begin
       SQL:='SELECT COUNT(DISTINCT(VDPA_EMPL)) '+
          ' FROM CQPVDPAGOS S, FPERSONAS U, CQVPATREMPL V WHERE S.VDPA_PERIODO='+#39+periodo.text+'/'+anio.text+#39+
          ' AND S.VDPA_Empl=U.PERS_PERSONA '+
          ' AND S.VDPA_Empl=V.ATRE_EMPL(+)'+
          ' AND S.VDPA_QUENOM IN ('+QUENOM+')';
      q.close;
      q.sql.text:=sql;
      savetofilelog(q.sql.text);
      q.Open;
      barrap.MaxValue:=Q.fields[0].asinteger;
      enum.caption:= Q.fields[0].asstring;
      obsP.lines.Clear;

      SQL:='SELECT DISTINCT(VDPA_EMPL) AS IDEMPLEADO, A.CQ AS IDDEPARTAMENTO, B.CQ AS IDPUESTO,'+
           STR_(TIPOPER.TEXT,'-')+' AS IDTIPOPERIODO, S.VDPA_TURNO AS IDTURNO, S.VDPA_Empl AS CODIGOEMPLEADO, SUBSTR(U.PERS_NOMBRE,1,40) AS NOMBRE,'+
           'SUBSTR(U.PERS_APEPAT,1,40) AS APELLIDOPATERNO, SUBSTR(U.PERS_APEMAT,1,40) AS APELLIDOMATERNO,'+
           'SUBSTR(U.PERS_APEPAT||'+#39+' '+#39+'||U.PERS_APEMAT||'+#39+' '+#39+'||U.PERS_NOMBRE,1,120) AS NOMBRELARGO,'+
           'V.ATRE_FNACI AS FECHANACIMIENTO,'+#39+' '+#39+' AS LUGARNACIMIENTO,'+
           'DECODE(V.ATRE_EDOCIV,'+#39+'G'+#39+','+#39+'C'+#39+','+#39+'H'+#39+','+#39+'D'+#39+
           ','+#39+'A'+#39+','+#39+'S'+#39+','+#39+'I'+#39+','+#39+'V'+#39+','+#39+'C'+#39+') AS ESTADOCIVIL,'+
           'U.PERS_SEXO AS SEXO, SUBSTR(V.ATRE_CURP,1,4) AS CURPI, SUBSTR(V.ATRE_CURP,11,10) AS CURPF,'+
           'nvl(V.ATRE_NUMSS,'+#39+'99999999999'+#39+') AS NUMEROSEGUROSOCIAL,'+#39+'0'+#39+' AS UMF, SUBSTR(U.PERS_RFC,1,4) AS RFC,'+
           'SUBSTR(U.PERS_RFC,11,5) AS HOMOCLAVE,S.VDPA_CUENTA AS CUENTAPAGOELECTRONICO, '+
            #39+'0'+#39+' AS SUCURSALPAGOELECTRONICO, S.VDPA_BANCO AS BANCOPAGOELECTRONICO,'+#39+'A'+#39+' AS ESTADOEMPLEADO, '+
           ' S.vdpa_sdodiario AS SUELDODIARIO,'+
           'U.PERS_FEC AS FECHASUELDODIARIO, 0 AS SUELDOVARIABLE,U.PERS_FEC AS FECHASUELDOVARIABLE,'+
           '0 AS SUELDOPROMEDIO, U.PERS_FEC AS FECHASUELDOPROMEDIO, 0 AS SUELDOINTEGRADO, U.PERS_FEC AS '+
           ' FECHASUELDOINTEGRADO,1 AS CALCULADO,1 AS AFECTADO,1 AS CALCULADOEXTRAORDINARIO,'+
           '1 AS AFECTADOEXTRAORDINARIO,0 AS interfazcheqpaqw,0 AS MODIFICACIONNETO,'+
           'cqfinirellab('+'VDPA_EMPL'+','+#39+periodo.text+'/'+anio.text+#39+') AS FECHAALTA,'+
           #39+'0'+#39+' AS CUENTACW, S.VDPA_CONTRATO AS TIPOCONTRATO,'+#39+'F'+#39+' AS BASECOTIZACIONIMSS,'+
           #39+'S'+#39+' AS TIPOEMPLEADO,S.VDPA_FORMAPAGO AS FORMAPAGO,'+
           #39+'E'+#39+' AS BASEPAGO,'+
           #39+'B'+#39+' AS ZONASALARIO,0 AS CALCULOPTU,0 AS CALCULOAGUINALDO, 0 AS MODIFICACIONSALARIOIMSS, '+
           '1 AS ALTAIMSS,0 AS BAJAIMSS,0 AS CAMBIOCOTIZACIONIMSS,'+#39+'0'+#39+' AS EXPEDIENTE,SUBSTR(U.PERS_TELEFONO,1,40) AS TELEFONO,'+
           '0 AS CODIGOPOSTAL,U.PERS_DIRECCION AS DIRECCION,'+#39+'0'+#39+' AS POBLACION,'+
           #39+'TAB'+#39+' AS ESTADO,'+#39+' '+#39+' AS NOMBREPADRE,'+#39+' '+#39+' AS NOMBREMADRE,'+#39+'0'+#39+' AS NUMEROAFORE,'+
           #39+'30/12/1899'+#39+' AS FECHABAJA,0 AS SUELDOBASELIQUIDACION,'+
           '0 AS AJUSTEALNETO,'+
           '2 AS CIDREGISTROPATRONAL,'+#39+'A_'+#39+' AS CESTADOEMPLEADOPERIODO,U.PERS_FEC AS CFECHASUELDOMIXTO,'+
           '0 AS CSUELDOMIXTO,'+#39+'0'+#39+' AS NUMEROFONACOT,'+
           'V.ATRE_EMAIL AS CORREOELECTRONICO, S.VDPA_REGIMEN AS TIPOREGIMEN, S.VDPA_CLABE AS CLABEINTERBANCARIA,'+
           #39+'27'+#39+' AS ENTIDADFEDERATIVA, S.VDPA_HORAS1 AS HORAS1, S.VDPA_HORAS2 AS HORAS2, S.VDPA_HORAS3 AS HORAS3, s.vdpa_dias as dias'+
          ' FROM CQPVDPAGOS S,  FPERSONAS U, CQVPATREMPL V, VCQURES A, VCQPSTO B WHERE S.VDPA_PERIODO='+#39+periodo.text+'/'+anio.text+#39+
          ' AND S.VDPA_URES=A.URES '+
          ' AND S.VDPA_PSTO=B.PSTO '+
          ' AND S.VDPA_Empl=U.PERS_PERSONA '+
          ' AND S.VDPA_Empl=V.ATRE_EMPL(+)'+
          ' AND S.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
          ' AND S.VDPA_QUENOM IN ('+QUENOM+')';
          savetofilelog(q.sql.text);
          showmessage('bien');
      q.close;
      q.sql.text:=sql;
      savetofilelog(q.sql.text);
      q.Open;
      barrap.Progress:=0;

      num:=1;
      //Verificamos que no exista el registro nom10034 del periodo
      cq.close;
      cq.sql.text:='DELETE FROM dbo.nom10034 WHERE CIDPERIODO='+PCQ.text;
      Cq.execsql;

      while not(q.eof) do
         begin

             CQ.close;
             cq.sql.text:='SELECT COUNT(*) FROM NOM10001 WHERE CODIGOEMPLEADO='+#39+Q.Fields[0].asstring+#39;
             savetofilelog(Cq.sql.text);
             cq.Open;

             if cq.fields[0].asinteger<=0 then //No existe el registro se inserta
                begin
                    cq.close;
                    cq.sql.text:='INSERT INTO nom10001 (iddepartamento, idpuesto, idtipoperiodo,'+
                                 'idturno, codigoempleado, nombre, apellidopaterno,'+
                                 'apellidomaterno, nombrelargo, fechanacimiento, lugarnacimiento,'+
                                 'estadocivil, sexo, curpi, curpf, numerosegurosocial, umf, rfc,'+
                                 'homoclave, cuentapagoelectronico, sucursalpagoelectronico,'+
                                 'bancopagoelectronico, estadoempleado, sueldodiario, fechasueldodiario,'+
                                 'sueldovariable, fechasueldovariable, sueldopromedio, fechasueldopromedio,'+
                                 'sueldointegrado, fechasueldointegrado, calculado, afectado,'+
                                 'calculadoextraordinario, afectadoextraordinario,'+
                                 'interfazcheqpaqw, modificacionneto, fechaalta, cuentacw,'+
                                 'tipocontrato, basecotizacionimss, tipoempleado, basepago,'+
                                 'formapago, zonasalario, calculoptu, calculoaguinaldo,'+
                                 'modificacionsalarioimss, altaimss, bajaimss, cambiocotizacionimss,'+
                                 'expediente, telefono, codigopostal, direccion, poblacion, estado,'+
                                 'nombrepadre, nombremadre, numeroafore, fechabaja, causabaja, '+
                                 'sueldobaseliquidacion,campoextra1, campoextra2, campoextra3, '+
                                 'fechareingreso, ajustealneto, timestamp,cidregistropatronal, '+
                                 'ccampoextranumerico1, ccampoextranumerico2, ccampoextranumerico3,'+
                                 'ccampoextranumerico4, ccampoextranumerico5, cestadoempleadoperiodo, '+
                                 'cfechasueldomixto,csueldomixto, NumeroFonacot, CorreoElectronico, '+
                                 'TipoRegimen, ClabeInterbancaria, ENTIDADFEDERATIVA) VALUES ( '+
                                  #39+Q.fieldbyname('IDDEPARTAMENTO').asstring+#39+','+
                                  #39+Q.fieldbyname('IDPUESTO').asstring+#39+','+
                                  #39+Q.fieldbyname('IDTIPOPERIODO').asstring+#39+','+
                                  #39+Q.fieldbyname('idturno').asstring+#39+','+
                                  #39+Q.fieldbyname('codigoempleado').asstring+#39+','+
                                  #39+copy(Q.fieldbyname('nombre').asstring,1,40)+#39+','+
                                  #39+copy(Q.fieldbyname('apellidopaterno').asstring,1,40)+#39+','+
                                  #39+copy(Q.fieldbyname('apellidomaterno').asstring,1,40)+#39+','+
                                  #39+copy(Q.fieldbyname('nombrelargo').asstring,1,120)+#39+','+
                                  #39+Q.fieldbyname('fechanacimiento').asstring+#39+','+
                                  #39+Q.fieldbyname('lugarnacimiento').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('estadocivil').asstring,1,1)+#39+','+
                                  #39+COPY(Q.fieldbyname('SEXO').asstring,1,1)+#39+','+
                                  #39+COPY(Q.fieldbyname('CURPI').asstring,1,6)+#39+','+
                                  #39+COPY(Q.fieldbyname('CURPF').asstring,1,8)+#39+','+
                                  #39+COPY(Q.fieldbyname('numerosegurosocial').asstring,1,11)+#39+','+
                                  #39+Q.fieldbyname('umf').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('RFC').asstring,1,4)+#39+','+
                                  #39+COPY(Q.fieldbyname('homoclave').asstring,1,4)+#39+','+
                                  #39+COPY(Q.fieldbyname('cuentapagoelectronico').asstring,1,20)+#39+','+
                                  #39+COPY(Q.fieldbyname('sucursalpagoelectronico').asstring,1,50)+#39+','+
                                  #39+Q.fieldbyname('bancopagoelectronico').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('estadoempleado').asstring,1,1)+#39+','+
                                  #39+Q.fieldbyname('sueldodiario').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('sueldovariable').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('sueldopromedio').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('sueldointegrado').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('calculado').asstring+#39+','+
                                  #39+Q.fieldbyname('afectado').asstring+#39+','+
                                  #39+Q.fieldbyname('calculadoextraordinario').asstring+#39+','+
                                  #39+Q.fieldbyname('afectadoextraordinario').asstring+#39+','+
                                  #39+Q.fieldbyname('interfazcheqpaqw').asstring+#39+','+
                                  #39+Q.fieldbyname('modificacionneto').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('cuentacw').asstring+#39+','+
                                  #39+Q.fieldbyname('tipocontrato').asstring+#39+','+
                                  #39+Q.fieldbyname('basecotizacionimss').asstring+#39+','+
                                  #39+Q.fieldbyname('tipoempleado').asstring+#39+','+
                                  #39+Q.fieldbyname('basepago').asstring+#39+','+
                                  #39+Q.fieldbyname('formapago').asstring+#39+','+
                                  #39+Q.fieldbyname('zonasalario').asstring+#39+','+
                                  #39+Q.fieldbyname('calculoptu').asstring+#39+','+
                                  #39+Q.fieldbyname('calculoaguinaldo').asstring+#39+','+
                                  #39+Q.fieldbyname('modificacionsalarioimss').asstring+#39+','+
                                  #39+Q.fieldbyname('altaimss').asstring+#39+','+
                                  #39+Q.fieldbyname('bajaimss').asstring+#39+','+
                                  #39+Q.fieldbyname('cambiocotizacionimss').asstring+#39+','+
                                  #39+Q.fieldbyname('expediente').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('telefono').asstring,1,20)+#39+','+
                                  #39+Q.fieldbyname('codigopostal').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('direccion').asstring,1,50)+#39+','+
                                  #39+COPY(Q.fieldbyname('poblacion').asstring,1,50)+#39+','+
                                  #39+COPY(Q.fieldbyname('estado').asstring,1,20)+#39+','+
                                  #39+Q.fieldbyname('nombrepadre').asstring+#39+','+
                                  #39+Q.fieldbyname('nombremadre').asstring+#39+','+
                                  #39+Q.fieldbyname('numeroafore').asstring+#39+','+
                                  #39+Q.fieldbyname('fechabaja').asstring+#39+','+
                                  #39+''+#39+','+
                                  #39+Q.fieldbyname('sueldobaseliquidacion').asstring+#39+','+
                                  #39+''+#39+','+
                                  #39+''+#39+','+
                                  #39+''+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('ajustealneto').asstring+#39+','+
                                  #39+DATETOSTR(DATE)+#39+','+
                                  #39+Q.fieldbyname('cidregistropatronal').asstring+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+Q.fieldbyname('cestadoempleadoperiodo').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('csueldomixto').asstring+#39+','+
                                  #39+Q.fieldbyname('NumeroFonacot').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('CorreoElectronico').asstring,1,60)+#39+','+
                                  #39+Q.fieldbyname('TipoRegimen').asstring+#39+','+
                                  #39+Q.fieldbyname('ClabeInterbancaria').asstring+#39+','+
                                  #39+Q.fieldbyname('entidadfederativa').asstring+#39+')';
                    TRY Cq.execsql;
                        obsP.Lines.Add(inttostr(num)+' Se inserto Empleado --> '+q.fields[0].asstring);
                    except  on E: Exception  do begin obsError.Lines.Add('Error empleado '+q.fields[0].asstring+' '+E.Message); savetofilelog(cq.sql.text); end; end;

                    num:=num+1;
                end
             else
                 begin
                     cq.close;
                     cq.sql.text:='UPDATE nom10001 SET '+
                     'APELLIDOPATERNO='+#39+copy(Q.fieldbyname('apellidopaterno').asstring,1,40)+#39+','+
                     'APELLIDOMATERNO='+#39+copy(Q.fieldbyname('apellidomaterno').asstring,1,40)+#39+','+
                     'NOMBRE='+#39+copy(Q.fieldbyname('nombre').asstring,1,40)+#39+','+
                     'NOMBRELARGO='+#39+copy(Q.fieldbyname('nombrelargo').asstring,1,120)+#39+','+
                     'CURPI='+#39+COPY(Q.fieldbyname('CURPI').asstring,1,6)+#39+','+
                     'CURPF='+#39+COPY(Q.fieldbyname('CURPf').asstring,1,8)+#39+','+
                     'RFC='+#39+COPY(Q.fieldbyname('RFC').asstring,1,4)+#39+','+
                     'HOMOCLAVE='+#39+COPY(Q.fieldbyname('HOMOCLAVE').asstring,1,4)+#39+','+
                     'TIPOREGIMEN='+#39+Q.fieldbyname('TipoRegimen').asstring+#39+','+
                     'TIPOCONTRATO='+#39+Q.fieldbyname('TipoContrato').asstring+#39+','+
                     'FECHAALTA='+#39+Q.fieldbyname('FechaAlta').asstring+#39+','+
                     'FECHANACIMIENTO='+#39+Q.fieldbyname('FECHANACIMIENTO').asstring+#39+','+
                     'FORMAPAGO='+#39+Q.fieldbyname('FORMAPAGO').asstring+#39+','+
                     'CORREOELECTRONICO='+#39+COPY(Q.fieldbyname('CorreoElectronico').asstring,1,60)+#39+','+
                     'CALCULADO=1,'+
                     'AFECTADO=1,'+
                     'SUELDODIARIO='+#39+Q.fieldbyname('SUELDODIARIO').asstring+#39+','+
                     'SUELDOINTEGRADO='+#39+Q.fieldbyname('SUELDOINTEGRADO').asstring+#39+','+
                     'CUENTAPAGOELECTRONICO='+#39+Q.fieldbyname('CUENTAPAGOELECTRONICO').asstring+#39+','+
                     'CLABEINTERBANCARIA='+#39+Q.fieldbyname('CLABEINTERBANCARIA').asstring+#39+','+
                     'BANCOPAGOELECTRONICO='+#39+Q.fieldbyname('BANCOPAGOELECTRONICO').asstring+#39+','+
                     'numerosegurosocial='+#39+COPY(Q.fieldbyname('numerosegurosocial').asstring,1,11)+#39+
                     ' WHERE codigoempleado='+#39+Q.fieldbyname('codigoempleado').asstring+#39;
                     cq.EXECSQL;
                     obsp.Lines.Add('Ya existia en Tabla Empleado Se actualizo-->'+q.fields[0].asstring);
                 end;

            CQ.Close;
            CQ.SQL.TEXT:='SELECT IDEMPLEADO FROM  nom10001 B where  b.codigoempleado='+#39+Q.fieldbyname('codigoempleado').asstring+#39;
            CQ.open;
            IDEMPLEADO:=CQ.fields[0].asstring;

            cq.close;
            cq.sql.text:='INSERT INTO dbo.nom10034 (idempleado, idtipoperiodo, cidperiodo, iddepartamento, '+
            'idpuesto, idturno, estadocivil, umf, cuentapagoelectronico, sucursalpagoelectronico, '+
            'bancopagoelectronico, estadoempleado, sueldodiario, fechasueldodiario, sueldovariable, '+
            'fechasueldovariable, sueldopromedio, fechasueldopromedio, sueldointegrado, fechasueldointegrado,'+
            'calculado, afectado, calculadoextraordinario, afectadoextraordinario, interfazcheqpaqw, '+
            'modificacionneto, fechaalta, cuentacw, tipocontrato, basecotizacionimss, tipoempleado, basepago,'+
            ' formapago, zonasalario, modificacionsalarioimss,altaimss, bajaimss, cambiocotizacionimss, '+
            'telefono, codigopostal, direccion, poblacion, estado, numeroafore, fechabaja, causabaja, '+
            'sueldobaseliquidacion, campoextra1, campoextra2, campoextra3, fechareingreso,'+
            'ajustealneto, timestamp, cidregistropatronal, cestadoempleadoperiodo, ccampoextranumerico1, '+
            'ccampoextranumerico2, ccampoextranumerico3, ccampoextranumerico4, ccampoextranumerico5, '+
            'cdiastrabajados, cdiaspagados, cdiascotizados, cdiasausencia, cdiasincapacidades, '+
            'cdiasvacaciones, cdiaspropseptimos, chorasextras1,  chorasextras2, chorasextras3, '+
            'cfechasueldomixto, csueldomixto, cfechacorte, CorreoElectronico, ClabeInterbancaria) values ('+
             #39+idempleado+#39+','+
             #39+Q.fieldbyname('IDTIPOPERIODO').asstring+#39+','+
             #39+PCQ.text+#39+','+
             #39+Q.fieldbyname('IDDEPARTAMENTO').asstring+#39+','+
             #39+Q.fieldbyname('IDPUESTO').asstring+#39+','+
             #39+Q.fieldbyname('idturno').asstring+#39+','+
             #39+COPY(Q.fieldbyname('estadocivil').asstring,1,1)+#39+','+
             #39+Q.fieldbyname('umf').asstring+#39+','+
             #39+COPY(Q.fieldbyname('cuentapagoelectronico').asstring,1,20)+#39+','+
             #39+COPY(Q.fieldbyname('sucursalpagoelectronico').asstring,1,50)+#39+','+
             #39+Q.fieldbyname('bancopagoelectronico').asstring+#39+','+
             #39+COPY(Q.fieldbyname('estadoempleado').asstring,1,1)+#39+','+
             #39+Q.fieldbyname('sueldodiario').asstring+#39+','+
             #39+Q.fieldbyname('fechaalta').asstring+#39+','+
              #39+Q.fieldbyname('sueldovariable').asstring+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+
              #39+Q.fieldbyname('sueldopromedio').asstring+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+
              #39+Q.fieldbyname('sueldointegrado').asstring+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+
              #39+Q.fieldbyname('calculado').asstring+#39+','+
              #39+Q.fieldbyname('afectado').asstring+#39+','+
              #39+Q.fieldbyname('calculadoextraordinario').asstring+#39+','+
              #39+Q.fieldbyname('afectadoextraordinario').asstring+#39+','+
              #39+Q.fieldbyname('interfazcheqpaqw').asstring+#39+','+
              #39+Q.fieldbyname('modificacionneto').asstring+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+
              #39+Q.fieldbyname('cuentacw').asstring+#39+','+
              #39+Q.fieldbyname('tipocontrato').asstring+#39+','+
              #39+Q.fieldbyname('basecotizacionimss').asstring+#39+','+
              #39+Q.fieldbyname('tipoempleado').asstring+#39+','+
              #39+Q.fieldbyname('basepago').asstring+#39+','+
              #39+Q.fieldbyname('formapago').asstring+#39+','+
              #39+Q.fieldbyname('zonasalario').asstring+#39+','+
              #39+Q.fieldbyname('modificacionsalarioimss').asstring+#39+','+
              #39+Q.fieldbyname('altaimss').asstring+#39+','+
              #39+Q.fieldbyname('bajaimss').asstring+#39+','+
              #39+Q.fieldbyname('cambiocotizacionimss').asstring+#39+','+
              #39+COPY(Q.fieldbyname('telefono').asstring,1,20)+#39+','+
              #39+Q.fieldbyname('codigopostal').asstring+#39+','+
              #39+COPY(Q.fieldbyname('direccion').asstring,1,50)+#39+','+
              #39+COPY(Q.fieldbyname('poblacion').asstring,1,50)+#39+','+
              #39+COPY(Q.fieldbyname('estado').asstring,1,20)+#39+','+
              #39+Q.fieldbyname('numeroafore').asstring+#39+','+
              #39+Q.fieldbyname('fechabaja').asstring+#39+','+
              #39+''+#39+','+
              #39+Q.fieldbyname('sueldobaseliquidacion').asstring+#39+','+
              #39+''+#39+','+
              #39+''+#39+','+
              #39+''+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+
              #39+Q.fieldbyname('ajustealneto').asstring+#39+','+
              #39+DATETOSTR(DATE)+#39+','+
              #39+Q.fieldbyname('cidregistropatronal').asstring+#39+','+
              #39+Q.fieldbyname('cestadoempleadoperiodo').asstring+#39+','+
              #39+'0'+#39+','+
              #39+'0'+#39+','+
              #39+'0'+#39+','+
              #39+'0'+#39+','+
              #39+'0'+#39+','+
              #39+Q.fieldbyname('dias').asstring+#39+','+
              #39+Q.fieldbyname('dias').asstring+#39+','+
              #39+Q.fieldbyname('dias').asstring+#39+','+
              #39+'0'+#39+','+ //Días de ausencias
              #39+'0'+#39+','+  //Días de incapacidades
              #39+'0'+#39+','+  //Días de vacaciones
              #39+'0'+#39+','+  //Días Septimo dias proporcionales
              #39+Q.fieldbyname('horas1').asstring+#39+','+
              #39+Q.fieldbyname('horas2').asstring+#39+','+
              #39+Q.fieldbyname('horas3').asstring+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+ //Fecha sueldo Mixto
              #39+Q.fieldbyname('csueldomixto').asstring+#39+','+
              #39+Q.fieldbyname('fechaalta').asstring+#39+','+   //Fecha corte
              #39+COPY(Q.fieldbyname('CorreoElectronico').asstring,1,60)+#39+','+
              #39+Q.fieldbyname('ClabeInterbancaria').asstring+#39+')';
              TRY Cq.execsql;
                  obsP.Lines.Add('Se inserto Detalle de empleado--> '+q.fields[0].asstring);
              except  on E: Exception  do begin obsError.Lines.Add('Error empleado '+q.fields[0].asstring+' '+E.Message);  savetofilelog(cq.sql.text); end; end;


             barrap.Progress:=barraP.Progress+1;
             q.next;
         end;

       //Estableciendo relación entre Compaq y SAIES
         aux.close;
         aux.sql.text:='DELETE FROM CQRELTAB WHERE TABLA='#39+'FPERSONAS'+#39;
         Aux.ExecSQL;
         cq.close;
         CQ.SQL.TEXT:='SELECT COUNT(*) FROM NOM10001';
         CQ.open;
         barrap.Progress:=0;
         barrap.MaxValue:=cq.fields[0].asinteger;
          cq.close;
         CQ.SQL.TEXT:='SELECT * FROM NOM10001';
         CQ.open;

         while not(cq.eof) do
            begin
               //Verificamos que no exista el registro
               aux.sql.text:='INSERT INTO CQRELTAB (SAIES,COMPAQ,TABLA) VALUES ('+
               #39+CQ.Fieldbyname('codigoempleado').asString+#39+','+
               #39+CQ.Fieldbyname('idempleado').asString+#39+','+
               #39+'FPERSONAS'+#39+')';
               TRY Aux.ExecSQL;
               except  on E: Exception  do begin obsError.Lines.Add('Error Insertando'+CQ.Fieldbyname('codigoempleado').asString+' '+E.Message);end; end;
               obsp.Lines.Add('Se inserto relación Empleados --> '+CQ.Fieldbyname('codigoempleado').asString);
                barrap.Progress:=barraP.Progress+1;
               cQ.next;
            end;

      CQ.Close;
      cq.SQL.TEXT:='DELETE FROM  nom10010 where  idperiodo='+pcq.text;
      CQ.execsql;

      //Insertando Incidencias de las Faltas
      q.close;
      q.sql.text:='select * from cqpvdpagos s where s.vdpa_conp in ('+#39+'021'+#39+') and VDPA_PERIODO='+#39+periOdo.text+'/'+ANIO.text+#39;
      Q.open;
      while not(q.eof) do
         begin
            CQ.Close;
            CQ.SQL.TEXT:='SELECT IDEMPLEADO FROM  nom10001 B where  b.codigoempleado='+#39+Q.fieldbyname('VDPA_EMPL').asstring+#39;
            CQ.open;
            IDEMPLEADO:=CQ.fields[0].asstring;
            if q.FieldByName('VDPA_HORAS1').asinteger>0 then
                grabaHoras('1',IDEMPLEADO,q.FieldByName('VDPA_HORAS1').ASSTRING);
            if q.FieldByName('VDPA_HORAS2').asinteger>0 then
                grabaHoras('2',IDEMPLEADO,q.FieldByName('VDPA_HORAS2').ASSTRING);
            if q.FieldByName('VDPA_HORAS3').asinteger>0 then
                grabaHoras('3',IDEMPLEADO,q.FieldByName('VDPA_HORAS3').ASSTRING);

             q.next;
         end;
   end
else
  Showmessage('Elija el tipo de nómina a procesar Y/O TIpo de periodo de COMPAC');
end;



procedure TFDetalle.SpeedButton8Click(Sender: TObject);
begin
  inherited;
IF tiponom.Text<>'' then
BEGIN

  CQ.close;
  cq.sql.text:='DELETE FROM nom10005';
  CQ.execsql;
  obsP.Lines.Add('Borrando tabla de movimientos automáticos al empleado...');

  cq.Close;
  Cq.sql.text:='DELETE FROM nom10008';
  cq.execsql;
  obsP.Lines.Add('Borrando tabla de movimientos al empleado...');

  Q.close;
  q.sql.text:='select count(*) from cqVpvdpagos a, CQRELTAB B, CQRELTAB C where a.VDPA_periodo='+
   #39+periOdo.text+'/'+ANIO.text+#39+' AND (A.VDPA_Conp=B.SAIES AND B.TABLA='+#39+'PCONCEPTO'+#39+
   ') AND (A.VDPA_Empl=C.SAIES AND C.TABLA='+#39+'FPERSONAS'+#39+')'+
   ' and vdpa_quenom in ('+quenom+') ';
   SAVETOFILElog(Q.sql.text);
  q.OPEN;
  ENUM.caption:=Q.fields[0].asstring;
  barrap.MaxValue:=Q.fields[0].asinteger;

  q.Close;
  q.sql.text:='select '+PCQ.TEXT+' as idperiodo, C.COMPAQ AS idempleado, b.COMPAQ AS idconcepto, '+
  '0 as idmovtopermanente,sum(A.VDPA_Monto) importeTotal, decode(b.compaq,3,15,0) as valor,'+
  'DECODE(A.VDPA_PERDED,'+#39+'P'+#39+',DECODE(A.VDPA_GRAVADO,'+#39+'S'+#39+',SUM(A.vdpa_monto),0),0) as importe1,'+
  'DECODE(A.VDPA_PERDED,'+#39+'P'+#39+',DECODE(A.VDPA_GRAVADO,'+#39+'N'+#39+',SUM(A.vdpa_monto),0),0) as importe2, '+
  'DECODE(A.VDPA_PERDED,'+#39+'P'+#39+',DECODE(A.VDPA_GRAVADO,'+#39+'S'+#39+',SUM(A.vdpa_monto),0),0) as importe3, '+
  '0 as importe4, 0 as importetotalreportado,'+
  '0 as importe1reportado, 0 as importe2reportado, 0 as importe3reportado, 0 as importe4reportado,'+
   #39+periOdo.text+'/'+ANIO.text+#39+'  as fecha from cqVpvdpagos a, CQRELTAB B, CQRELTAB C where a.VDPA_periodo='+
   #39+periOdo.text+'/'+ANIO.text+#39+' AND (A.VDPA_Conp=B.SAIES AND B.TABLA='+#39+'PCONCEPTO'+#39+
   ') AND (A.VDPA_Empl=C.SAIES AND C.TABLA='+#39+'FPERSONAS'+#39+') '+
   'and vdpa_quenom in ('+quenom+') '+
   'group by C.COMPAQ , B.COMPAQ, a.vdpa_perded, A.VDPA_GRAVADO'+
   ' UNION '+
   ' select '+PCQ.TEXT+' as idperiodo, f.COMPAQ AS idempleado, '+#39+'1'+#39+' as idconcepto,'+
   '0 as idmovtopermanente, sum(DECODE(D.VDPA_PERDED,'+#39+'P'+#39+',D.VDPA_MONTO,0))- '+
   'sum(DECODE(D.VDPA_PERDED,'+#39+'D'+#39+',D.VDPA_MONTO,0)) AS importe1, 0 as valor, '+
   '0 as importe1,0 as importe2, '+
   '0 as importe3,0 as importe4, 0 as importetotalreportado, 0 as importe1reportado, 0 as importe2reportado,'+
   '0 as importe3reportado, 0 as importe4reportado, '+#39+periOdo.text+'/'+ANIO.text+#39+'  as fecha '+
   'from CQpvDpagos d,  CQRELTAB f where d.VDPA_PERIODO='+#39+periOdo.text+'/'+ANIO.text+#39+
   'AND (d.VDPA_Empl=f.SAIES AND f.TABLA='+#39+'FPERSONAS'+#39+') '+
   'and vdpa_quenom in ('+quenom+') group by f.COMPAQ '+
   ' UNION '+
   ' select '+PCQ.TEXT+' as idperiodo, f.COMPAQ AS idempleado, '+#39+'2'+#39+' as idconcepto,'+
   '0 as idmovtopermanente, 0 AS importe1, 0 as valor, 0 as importe1,0 as importe2, '+
   '0 as importe3,0 as importe4, 0 as importetotalreportado, 0 as importe1reportado, 0 as importe2reportado,'+
   '0 as importe3reportado, 0 as importe4reportado, '+#39+periOdo.text+'/'+ANIO.text+#39+'  as fecha '+
   'from CQpvDpagos d,  CQRELTAB f where d.VDPA_PERIODO='+#39+periOdo.text+'/'+ANIO.text+#39+
   'AND (d.VDPA_Empl=f.SAIES AND f.TABLA='+#39+'FPERSONAS'+#39+') '+
   'and vdpa_quenom in ('+quenom+') group by f.COMPAQ ';

   SAVETOFILELOG(q.sql.text);
   q.open;
   barrap.MinValue:=0;
   BARRAP.Progress:=0;
   while not(q.eof) do
      begin
         cq.close;
         cq.sql.text:='INSERT INTO dbo.nom10008 (idperiodo, idempleado, idconcepto, idmovtopermanente, '+
         'importetotal, valor, importe1, importe2, importe3, importe4, importetotalreportado, '+
         'importe1reportado, importe2reportado, importe3reportado, importe4reportado, timestamp) VALUES ('+
         Q.FIELDS[0].ASSTRING+','+
         Q.FIELDS[1].ASSTRING+','+
         Q.FIELDS[2].ASSTRING+','+
         Q.FIELDS[3].ASSTRING+','+
         Q.FIELDS[4].ASSTRING+','+
         Q.FIELDS[5].ASSTRING+','+
         Q.FIELDS[6].ASSTRING+','+
         Q.FIELDS[7].ASSTRING+','+
         Q.FIELDS[8].ASSTRING+','+
         Q.FIELDS[9].ASSTRING+','+
         Q.FIELDS[10].ASSTRING+','+
         Q.FIELDS[11].ASSTRING+','+
         Q.FIELDS[12].ASSTRING+','+
         Q.FIELDS[13].ASSTRING+','+
         Q.FIELDS[14].ASSTRING+','+
         DATETIMETOSTR(DATE)+')';
         TRY Cq.execsql;
             obsP.Lines.Add('Movimiento Registrado--> Empleado '+q.fields[1].asstring+'Concepto '+q.fields[2].asstring);
         except  on E: Exception  do begin obsError.Lines.Add('Error Insertando'+q.fields[1].asstring+' '+E.Message);  savetofilelog(cq.sql.text); end; end;
         Q.NEXT;
         BARRAP.Progress:=BARRAP.Progress+1;
      end;
  CQ.close;
  cq.sql.text:='UPDATE nom10001 SET calculado=1';
  CQ.execsql;
  obsP.Lines.Add('Calculando la nómina...');

 SumarNominas;
end
else
  showmessage('Elija el tipo de nómina con el que se va trabajar');

end;


procedure TFDetalle.SumarNominas;
var
x:integer;
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
         X:=X+1;
         q.next;
     end;
  gfon.Rowcount:=x;

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
         x:=x+1;
         q.next;
     end;


end
else
  Showmessage('Debe elegir el tipo de nomina con el que se va trabajar');
 end;




procedure TFDetalle.JuntarNomClick(Sender: TObject);
begin
  inherited;
if Application.MessageBox('¿Seguro que desea correr el proceso de juntar nóminas ORDINARIA Y NG se perderá historico?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call CQGrabarDetPagos(to_date('+#39+periodo.text+'/'+anio.text+#39+'),'+#39+periodofin.text+#39+')';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Juntando Nominas....');
              q.execsql;

              Q.Close;
              q.sql.text:='call CQCUADRAHORAS('+#39+periOdo.text+'/'+ANIO.text+#39+')';
              obsp.Lines.Add('Calculando las Horas Extras');
              q.Execsql;

              sumarNominas;
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
  pcq.text:=inttostr((periodo.ItemIndex+1)) ;
  if str_(tiponom.text,'-')='H' then begin pcq.text:=inttostr(strtoint(pcq.text) div 2) ;end;


  PERIODOFIN.Clear;


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
  SHOWMESSAGE('SUMARE');
  SumaRNominas;
  cq.close;
  cq.sql.text:='SELECT count(*) FROM NOM10043 WHERE IdPeriodo='+pcq.text+' AND UUID<>'+#39+#39;
  cq.open;
  emit.caption:=cq.fields[0].asstring;

  cq.close;
  cq.sql.text:='SELECT count(DISTINCT(nom10007.IDEMPLEADO)) FROM nom10007 WHERE IDPERIODO='+pcq.text;
  cq.open;
  pagnom.caption:=cq.fields[0].asstring;

  cq.close;
  cq.sql.text:='SELECT count(*) FROM nom10001 WHERE nom10001.idempleado NOT IN '+
  '( SELECT nom10007.IDEMPLEADO FROM nom10007 WHERE IDPERIODO='+pcq.text+')';
  cq.open;
  sinpag.caption:=cq.fields[0].asstring;


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


end;

procedure TFDetalle.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='SELECT A.VDPA_CONP, decode(a.vdpa_conp,'+#39+'061'+#39+','+#39+'TERCERO DJ'+#39+',A.VDPA_DESCRIP), SUM(A.VDPA_MONTO) FROM CQPVDPAGOS A WHERE '+//A.VDPA_PERDED='+#39+'P'+#39+
  '  A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')'+
  ' GROUP BY A.VDPA_CONP, decode(a.vdpa_conp,'+#39+'061'+#39+','+#39+'TERCERO DJ'+#39+',A.VDPA_DESCRIP)';
  SAVETOFILELOG(Q.SQL.TEXT);
  q.OPEN;
  limpiagrid(cuadre);
  cuadre.rowcount:=2;
  WHILE NOT(q.eof) do
     begin
       cuadre.Cells[0,cuadre.RowCount-1]:=q.fields[0].asstring;
       cuadre.Cells[1,cuadre.RowCount-1]:=q.fields[1].asstring;
       cuadre.Cells[2,cuadre.RowCount-1]:=formatfloat('#,#0.0',q.fields[2].asfloat);


       cq.Close;
       cq.sql.text:='SELECT sum(nom10007.importetotal) FROM nom10007, nom10004 WHERE  '+
       'nom10007.idconcepto=nom10004.idconcepto '+//AND nom10004.tipoconcepto='+#39+'P'+#39+
       ' and nom10004.numeroconcepto='+inttostr(Q.fields[0].asinteger+200)+
       ' and nom10007.idperiodo='+#39+pcq.text+#39;
       savetofilelog(cq.sql.text);
       cq.open;
       cuadre.Cells[3,cuadre.RowCount-1]:=formatfloat('#,#0.0',Cq.fields[0].asfloat);

       cq.Close;
       cq.sql.text:='SELECT sum(nom10008.importetotal) FROM nom10008, nom10004 WHERE  '+
       'nom10008.idconcepto=nom10004.idconcepto '+//AND nom10004.tipoconcepto='+#39+'P'+#39+
       ' and nom10004.numeroconcepto='+inttostr(Q.fields[0].asinteger+200)+
       ' and nom10008.idperiodo='+#39+pcq.text+#39;
       savetofilelog(cq.sql.text);
       cq.open;
       cuadre.Cells[4,cuadre.RowCount-1]:=formatfloat('#,#0.0',Cq.fields[0].asfloat);

       cuadre.rowcount:=cuadre.rowcount+1;
       q.next;
     end;


totsaies.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADRE,2));
tot7.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADRE,3));
tot8.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADRE,4));




 { q.close;
  q.sql.text:='SELECT a.vdpa_nomina, a.vdpa_empl, Z.PREL_EMPL, a.vdpa_monto FROM PVHDPAGOS a, phnominas x, prel_emplhas Z '+
  ' WHERE A.VDPA_Empl IN (select b.prel_emplhas from prel_emplhas b) '+
  ' AND A.VDPA_Nomina=x.nomi_nomina and x.nomi_fecini='+#39+periodo.text+'/'+anio.text+#39+
  ' AND  VDPA_PERDED='+#39+'P'+#39+
  ' AND VDPA_EMPL=Z.PREL_EMPLHAS '+
  ' AND VDPA_PAGO NOT IN (SELECT CANC_PAGO FROM PCANCELPAGO)';
  q.Open;


  has.cells[0,0]:='Nomina';
  has.cells[1,0]:='Empl_HAS';
  has.cells[2,0]:='Empl';
  has.cells[3,0]:='Monto';


  limpiagrid(HAS);
  HAS.rowcount:=2;

  while not (q.eof) do
     begin
        has.Cells[0,has.RowCount-1]:=q.fields[0].asstring;
        has.Cells[1,has.RowCount-1]:=q.fields[1].asstring;
        has.Cells[2,has.RowCount-1]:=q.fields[2].asstring;
        has.Cells[3,has.RowCount-1]:=formatfloat('#,#0.0',q.fields[3].asfloat);
        has.rowcount:=has.rowcount+1;
        q.next;
     end;
 thas.caption:=formatfloat('#,#0.0',sumacolgrid(has,3));
 }


end;

procedure TFDetalle.CuadreDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin
  inherited;
  try
    If (CUADRE.Cells[2,arow]=CUADRE.Cells[4,arow]) or  (CUADRE.Cells[2,arow]=CUADRE.Cells[3,arow]) Then
      cuadre.Canvas.Brush.Color := CLWHITE
    Else
       cuadre.canvas.Brush.Color := $004540FF;
  cuadre.Canvas.FillRect(Rect);
  Texto := cuadre.Cells[acol,ARow];
  DrawText( cuadre.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);
  except
  end;

end;

procedure TFDetalle.AliasChange(Sender: TObject);
begin
  inherited;
 if alias.text='SoloHAS' then
    TipoNom.text:='H-Honorarios';
 if alias.text='Vinculacion' then
     TipoNom.text:='V-Vinculación';
 if alias.text='OrdinariaHasNG' then
     TipoNom.text:='HON-Nominas Ordinarias (HN)';
 if alias.text='SoloHAS2015' then
    TipoNom.text:='H-Honorarios 2015';
 if alias.text='Vinculacion2015' then
     TipoNom.text:='V-Vinculación 2015';
 if alias.text='OrdinariaNG2015' then
     TipoNom.text:='HON-Nominas Ordinarias (HN) 2015';
 if alias.text='Jubilados2015' then
     TipoNom.text:='J-Jubilados 2015';
  if alias.text='Difuntos2015' then
     TipoNom.text:='D-Difuntos 2015';
 TipoNomChange(nil);
end;

procedure TFDetalle.Button2Click(Sender: TObject);

begin
  inherited;


    CQ.CLOSE;
    CQ.sql.text:='SELECT count(*) frOM NOM10007 A, nom10004 B, nom10001 c '+
                 ' WHERE A.idconcepto=B.idconcepto and a.idempleado=c.idempleado '+
                 ' AND A.IDPERIODO IN ('+UPeriodos.text+')';
    cq.OPEN;

    barrap.MaxValue:=cq.fields[0].asinteger;
    barrap.Progress:=0;

    CQ.CLOSE;
    CQ.sql.text:=' SELECT A.idmovtopdo, A.idperiodo,A.idempleado, B.codigoempleado, '+
                 ' A.idconcepto, C.numeroconcepto,  A.idmovtopermanente,importetotal,'+
                 ' a.valor, a.importe1, a.importe2, a.importe3, a.importe4 '+
                 ' FROM NOM10007 A, NOM10001 B, NOM10004 C  WHERE A.idempleado=B.idEMPLEADO'+
                 ' AND A.idconcepto=C.idconcepto '+
                 ' AND A.IDPERIODO IN ('+UPeriodos.text+')';
    cq.OPEN;

    Q.CLOSE;
    q.sql.text:='DELETE FROM  NOM10007 WHERE IDPERIODO  IN ('+UPeriodos.text+') AND ANIO='+#39+uejer.text+#39;
    Q.execsql;

    WHILE NOT CQ.EOF DO
       BEGIN
          Q.CLOSE;
          q.sql.text:='insert into nom10007 (idmovtopdo, idperiodo, idempleado, codigoempl, idconcepto, '+
          'numeroconcepto, idmovtopermanente, importetotal, valor, importe1, importe2, importe3, importe4, QUENOM, anio) '+
          ' values ('+
          #39+cq.fields[0].asstring+#39+','+
          #39+cq.fields[1].asstring+#39+','+
          #39+cq.fields[2].asstring+#39+','+
          #39+cq.fields[3].asstring+#39+','+
          #39+cq.fields[4].asstring+#39+','+
          #39+cq.fields[5].asstring+#39+','+
          #39+cq.fields[6].asstring+#39+','+
          #39+cq.fields[7].asstring+#39+','+
          #39+cq.fields[8].asstring+#39+','+
          #39+cq.fields[9].asstring+#39+','+
          #39+cq.fields[10].asstring+#39+','+
          #39+cq.fields[11].asstring+#39+','+
          #39+cq.fields[12].asstring+#39+','+
          #39+STR_(TIPOnOM.text,'-')+#39+','+
          #39+uejer.text+#39+')';
          q.execsql;
          cQ.next;
          barrap.Progress:=barrap.Progress+1;
          barrap.Update;
       END;




end;

procedure TFDetalle.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  cq.Close;
  cq.sql.text:='SELECT nom10002.idperiodo, (SELECT count(*) FROM nom10001, NOM10043 '+
                ' WHERE nom10001.idempleado IN (SELECT nom10007.IDEMPLEADO FROM nom10007 WHERE IDPERIODO=nom10002.idperiodo)'+
                ' AND nom10001.idempleado=NOM10043.idempleado AND NOM10043.IdPeriodo=nom10002.idperiodo AND NOM10043.Enviado=1) ENVIADOS,'+
                ' (SELECT count(*) FROM nom10001, NOM10043 '+
                ' WHERE nom10001.idempleado IN (SELECT nom10007.IDEMPLEADO FROM nom10007 WHERE IDPERIODO=nom10002.idperiodo)'+
                ' AND nom10001.idempleado=NOM10043.idempleado AND NOM10043.IdPeriodo=nom10002.idperiodo AND NOM10043.Enviado=0) no_ENVIADOS,'+
                ' (SELECT count(*) FROM nom10001, NOM10043'+
                ' WHERE nom10001.idempleado IN (SELECT nom10007.IDEMPLEADO FROM nom10007 WHERE IDPERIODO=nom10002.idperiodo)'+
                ' AND nom10001.idempleado=NOM10043.idempleado AND NOM10043.IdPeriodo=nom10002.idperiodo) TOTAL '+
                ' FROM nom10002 ORDER BY nom10002.idperiodo ';
  cq.open;
  limpiagrid(gtim);
  gtim.cells[0,0]:='Periodo';
  gtim.cells[1,0]:='ENVIADOS';
  gtim.cells[2,0]:='NO ENVIADOS';
  gtim.cells[3,0]:='TOTAL';
  gtim.RowCount:=2;
  while not(cq.eof) do
    begin
       gtim.cells[0,gtim.rowcount-1]:=CQ.FieldByName('idperiodo').asstring;
       gtim.cells[1,gtim.rowcount-1]:=CQ.FieldByName('enviados').asstring;
       gtim.cells[2,gtim.rowcount-1]:=CQ.FieldByName('no_envIados').asstring;
       gtim.cells[3,gtim.rowcount-1]:=CQ.FieldByName('total').asstring;
       cq.next;
       gtim.rowcount:=   gtim.rowcount+1;
    end;
end;

procedure TFDetalle.gtimDblClick(Sender: TObject);
begin
  inherited;
exportarGrXLS(GTIM);
end;

procedure TFDetalle.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  cq.Close;
  cq.sql.text:='SELECT nom10002.idperiodo, (SELECT count(*) FROM nom10001, NOM10043 '+
               ' WHERE nom10001.idempleado IN (SELECT IDEMPLEADO FROM NOM10043 WHERE IdPeriodo=nom10002.idperiodo AND UUID='+#39+#39+
               ' AND  idempleado IN (SELECT nom10007.IDEMPLEADO FROM nom10007 WHERE IDPERIODO=nom10002.idperiodo)) '+
               ' AND nom10001.idempleado=NOM10043.idempleado AND NOM10043.IdPeriodo=nom10002.idperiodo) AS FALTAN_TIMBRAR '+
               ' FROM nom10002 ORDER BY nom10002.idperiodo  ';
  cq.open;
  limpiagrid(gpen);
  GPEN.cells[0,0]:='PERIODO';
  gpen.cells[1,0]:='PENDIENTE';
  gpen.RowCount:=2;
  while not(cq.eof) do
    begin
       gpen.cells[0,gpen.rowcount-1]:=CQ.FieldByName('idperiodo').asstring;
       gpen.cells[1,gpen.rowcount-1]:=CQ.FieldByName('FALTAN_TIMBRAR').asstring;
       cq.next;
       gpen.rowcount:=   gpen.rowcount+1;
    end;

end;

procedure TFDetalle.gpenDblClick(Sender: TObject);
begin
  inherited;
exportarGrXLS(GPEN);

end;

procedure TFDetalle.direChange(Sender: TObject);
begin
  inherited;
  lista.Directory:=dire.Directory;

end;

procedure TFDetalle.Button3Click(Sender: TObject);
var
x:integer;
id:string;
empl:string;
uidd:string;
f:TstringList;
begin
  inherited;
  {for x:=0 to lista.Items.Count-1 do
     begin
        empl:=copy(lista.items[x],1,pos('-',lista.items[x])-1);
        uidd:=copy(lista.items[x], pos('-',lista.items[x])+1,LENGTH(lista.items[x]));
        uidd:=copy(uidd, 1,POS('.',uidd)-1);

        cq.Close;
        cq.SQL.text:='SELECT idempleado FROM NOM10001 WHERE codigoempleado='+#39+EMPL+#39;
        cq.open;
        id:=cq.fields[0].asstring;
        cq.close;
        cq.sql.text:='UPDATE NOM10043 SET GUIDDOCUMENTODSL='+#39+UIDD+#39+','+
        'Estado=3'+
        ' WHERE IDEMPLEADO='+ID+' AND IDPERIODO=24';
        Cq.execsql;
     end;     }
   f:=TstringList.create();
   f.LoadFromFile(dire.Directory+'\'+'listado.txt');
   for x:=0 to f.Count-1 do
      begin
           empl:=copy(f.Strings[x],1,pos('|',f.strings[x])-1);
           uidd:=copy(f.Strings[x], pos('*',f.strings[x])+1,LENGTH(f.strings[x]));
           cq.Close;
           cq.SQL.text:='SELECT idempleado FROM NOM10001 WHERE codigoempleado='+#39+EMPL+#39;
           cq.open;
           id:=cq.fields[0].asstring;
           cq.close;
           cq.sql.text:='UPDATE NOM10043 SET UUID='+#39+UIDD+#39+
           ' WHERE IDEMPLEADO='+ID+' AND IDPERIODO=24';
           Cq.execsql;


      end;


end;

procedure TFDetalle.tipoperChange(Sender: TObject);
begin
  inherited;
CQ.close;
cq.sql.text:='SELECT * FROM NOM10002 where idtipoperiodo='+str_(tipoper.text,'-')+
             ' and EJERCICIO='+ANIO.TEXT;
savetofilelog(cq.sql.text);
CQ.open;
PERIODOCQ.Clear;
While not(Cq.eof) do
  begin
    PERIODOCQ.items.add(cq.fieldbyname('IDPERIODO').asstring+'-'+Cq.fieldbyname('FECHAINICIO').asstring+' A' +
    Cq.fieldbyname('fechafin').asstring);
    cq.next;
  end;
end;

procedure TFDetalle.periodocqChange(Sender: TObject);
begin
  inherited;
PCQ.Text:=STR_(PERIODOCQ.TEXT,'-');
end;

procedure TFDetalle.SpeedButton12Click(Sender: TObject);
begin
  inherited;
//Cuadre por empleados
  q.close;
  q.sql.text:='SELECT A.VDPA_EMPL, SUM(A.VDPA_MONTO) FROM CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'P'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')'+
  ' GROUP BY A.VDPA_EMPL';
  SAVETOFILELOG(Q.SQL.TEXT);
  q.OPEN;
  limpiagrid(cuadreP);
  cuadreP.rowcount:=2;
  WHILE NOT(q.eof) do
     begin
       cuadreP.Cells[0,cuadreP.RowCount-1]:=q.fields[0].asstring;
       cuadreP.Cells[1,cuadreP.RowCount-1]:=formatfloat('#,#0.0',q.fields[1].asfloat);

       cq.Close;
       cq.sql.text:='SELECT sum(nom10007.importetotal) FROM nom10007, nom10004, NOM10001 WHERE  '+
       'nom10007.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'P'+#39+
       ' AND nom10001.idempleado=nom10007.idempleado '+
       ' and nom10001.codigoempleado='+#39+q.fields[0].asstring+#39+
       ' and nom10007.idperiodo='+#39+pcq.text+#39;
       savetofilelog(cq.sql.text);
       cq.open;
       cuadrep.Cells[2,cuadrep.RowCount-1]:=formatfloat('#,#0.0',Cq.fields[0].asfloat);

       cq.Close;
       cq.sql.text:='SELECT sum(nom10008.importetotal) FROM nom10008, nom10004, NOM10001 WHERE  '+
       'nom10008.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'P'+#39+
       ' AND nom10001.idempleado=nom10008.idempleado '+
       ' and nom10001.codigoempleado='+#39+q.fields[0].asstring+#39+
       ' and nom10008.idperiodo='+#39+pcq.text+#39;
       savetofilelog(cq.sql.text);
       cq.open;
       cuadrep.Cells[3,cuadrep.RowCount-1]:=formatfloat('#,#0.0',Cq.fields[0].asfloat);

       cuadreP.rowcount:=cuadreP.rowcount+1;
       q.next;
     end;
tPSaies.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADREp,1));
tp7.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADREp,2));
tp8.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADREp,3));


//Cuadre por empleados
  q.close;
  q.sql.text:='SELECT A.VDPA_EMPL, SUM(A.VDPA_MONTO) FROM CQPVDPAGOS A WHERE A.VDPA_PERDED='+#39+'D'+#39+
  ' AND A.VDPA_PERIODO='+#39+PERIODO.text+'/'+anio.text+#39 +
  ' AND A.VDPA_EMPL NOT LIKE '+#39+'DJ%'+#39+
  ' AND A.VDPA_QUENOM IN ('+QUENOM+')'+
  ' GROUP BY A.VDPA_EMPL';
  SAVETOFILELOG(Q.SQL.TEXT);
  q.OPEN;
  limpiagrid(cuadreD);
  cuadreD.rowcount:=2;
  WHILE NOT(q.eof) do
     begin
       cuadreD.Cells[0,cuadreD.RowCount-1]:=q.fields[0].asstring;
       cuadreD.Cells[1,cuadreD.RowCount-1]:=formatfloat('#,#0.0',q.fields[1].asfloat);

       cq.Close;
       cq.sql.text:='SELECT sum(nom10007.importetotal) FROM nom10007, nom10004, NOM10001 WHERE  '+
       'nom10007.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'D'+#39+
       ' AND nom10001.idempleado=nom10007.idempleado '+
       ' and nom10001.codigoempleado='+#39+q.fields[0].asstring+#39+
       ' and nom10007.idperiodo='+#39+pcq.text+#39;
       savetofilelog(cq.sql.text);
       cq.open;
       cuadreD.Cells[2,cuadreD.RowCount-1]:=formatfloat('#,#0.0',Cq.fields[0].asfloat);

       cq.Close;
       cq.sql.text:='SELECT sum(nom10008.importetotal) FROM nom10008, nom10004, NOM10001 WHERE  '+
       'nom10008.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'D'+#39+
       ' AND nom10001.idempleado=nom10008.idempleado '+
       ' and nom10001.codigoempleado='+#39+q.fields[0].asstring+#39+
       ' and nom10008.idperiodo='+#39+pcq.text+#39;
       savetofilelog(cq.sql.text);
       cq.open;
       cuadreD.Cells[3,cuadreD.RowCount-1]:=formatfloat('#,#0.0',Cq.fields[0].asfloat);

       cuadreD.rowcount:=cuadreD.rowcount+1;
       q.next;
     end;
tDSaies.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADRED,1));
tD7.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADRED,2));
tD8.caption:=formatfloat('#,#0.00',SUMACOLGRID(CUADRED,3));
end;

procedure TFDetalle.Button4Click(Sender: TObject);
var
x,y:integer;
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

  cq.Close;
  cq.SQL.text:='select B.IDCONP, B.MOV, B.PERDED, b.PERDED+'+#39+'_'+#39+
  '+CONVERT(varchar(50),B.IDCONPSAIES)+'+#39+'_'+#39+'+b.descrip+'+#39+'_'+#39+'+B.MOV'+
  ' from CONCEPTOS B'+
  ' order by B.PERDED DESC, B.IDCONP ASC ';
  savetofilelog(cq.sql.text);
  cq.open;
  gcq.ColCount:=3;
  gcq.rowCount:=4;
  while not (cq.Eof) do
     begin
       gcq.cells[gcq.ColCount,0]:=cq.fields[0].asstring;
       gcq.cells[gcq.ColCount,1]:=cq.fields[1].asstring;
       gcq.cells[gcq.ColCount,2]:=cq.fields[2].asstring;
       gcq.cells[gcq.ColCount,3]:=cq.fields[3].asstring;
       gcq.ColCount:=gcq.ColCount+1;
       cq.Next;
     end;

  cq.close;
  cq.sql.text:='select distinct(d.idempleado), e.codigoempleado, e.nombrelargo  '+
  ' from nom10007 d, nom10001 e where d.idempleado=e.idempleado '+
  ' and e.TIPOREGIMEN IN ('+str_(regimen.text,'-')+') order by d.idempleado';
  savetofilelog(cq.sql.text);
  cq.open;
  while not (cq.Eof) do
     begin
       gcq.cells[0,gcq.rowcount]:=cq.fields[0].asstring;
       gcq.cells[1,gcq.rowcount]:=cq.fields[1].asstring;
       gcq.cells[2,gcq.rowcount]:=cq.fields[2].asstring;
       gcq.rowcount:=gcq.rowcount+1;
       cq.Next;
     end;

     barrac.Position:=0;
     barrac.Max:= gcq.rowcount;

     if not(timbrado.Checked) then
        begin
           cqD.close;
           cqD.sql.text:='select D.idempleado, D.idconcepto, SUM(D.importetotal) AS TOTAL, '+
           'SUM(D.importe1) AS GRAVADO, SUM(D.importe2) AS EXENTO from nom10008 d  '+
           'WHERE d.idperiodo in ('+PER.TEXT+')'+
           'GROUP BY  D.idempleado, D.idconcepto'+
           ' order by d.idempleado, d.idconcepto';
           savetofilelog(cqd.sql.text);
           CQD.OPEN;
       end
     else
       begin
           cqD.close;
           cqD.sql.text:='select D.idempleado, D.idconcepto, SUM(D.importetotal) AS TOTAL, '+
           'SUM(D.importe1) AS GRAVADO, SUM(D.importe2) AS EXENTO from nom10007 d, nom10043 e  '+
           'WHERE d.idperiodo in ('+PER.TEXT+')'+
           ' and d.idperiodo=e.IdPeriodo and d.idempleado=e.idempleado and e.Estado=3 '+
           'GROUP BY  D.idempleado, D.idconcepto'+
           ' order by d.idempleado, d.idconcepto';
           savetofilelog(cqd.sql.text);
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


procedure TFDetalle.Button6Click(Sender: TObject);
begin
  inherited;
copiarGrid(gcq);
end;

procedure TFDetalle.Button7Click(Sender: TObject);
var
x:integer;
idempl:string;
begin
  inherited;
      savetofilelog(cqd.sql.text);
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
      datos.Cells[1,datos.RowCount-1]:=cqd.fieldbyname('idconcepto').asstring;
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

procedure TFDetalle.Button8Click(Sender: TObject);
var
x,y:integer;
posempl:string;
percep,deduc:real;
begin
  inherited;
barrac.Position:=0;
barrac.Max:=gcq.rowcount-4;
lapos:=0;
for x:=4 to  gcq.rowcount-1 do
    begin
       for y:=3 to  gcq.colcount-1 do
          begin
              posempl:=buscaClave(gcq.cells[0,x]);
              if posempl<>'' then
                 begin
                     gcq.cells[y,x]:=buscaConcepto(posempl,gcq.cells[y,1],gcq.cells[y,0],gcq.cells[0,x]);
                 end;
          end;
       barrac.Position:=barrac.Position+1;
       empl.Caption:='Empleado'+gcq.cells[1,x];
       empl.Update;
       gcq.Update;
    end;

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
td.caption:='Deducción: '+formatfloat('#,#0.00',deduc);


//==================AGREGANDO CLAVE SAT =========================

for y:=3 to  gcq.colcount-1 do
  begin


     cq.Close;
     cq.sql.text:='select CLAVEAGRUPADORASAT from NOM10004 A WHERE A.IDCONCEPTO='+#39+gcq.cells[y,0]+#39;
     cQ.Open;
     //gcq.cells[y,0]:=gcq.cells[y,0]+'|'+q.fields[0].asstring+'|';
     gcq.cells[y,0]:=Cq.fields[0].asstring;
  end;      
//==================AGREGANDO CLAVE SAT =========================


end;

procedure TFDetalle.TipoNom2Change(Sender: TObject);
begin
  inherited;
if str_(tiponom2.text,'-')='HON' then quenom:=CHR(39)+'HO'+CHR(39)+','+CHR(39)+'O'+CHR(39)+','+
                                             CHR(39)+'N'+CHR(39)+','+CHR(39)+'E'+CHR(39)+','+
                                             CHR(39)+'FO'+CHR(39)+','+CHR(39)+'C'+CHR(39);
if str_(tiponom2.text,'-')='V' then quenom:=CHR(39)+'V'+CHR(39)+','+CHR(39)+'FV'+CHR(39);
if str_(tiponom2.text,'-')='H' then quenom:=CHR(39)+'H'+CHR(39)+','+CHR(39)+'FH'+CHR(39);
if str_(tiponom2.text,'-')='J' then quenom:=CHR(39)+'PO'+CHR(39)+','+CHR(39)+'FP'+CHR(39);

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
  ' from CONCEPTOS B'+
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
  q.sql.text:='select distinct(d.VDPA_EMPL), d.VDPA_EMPL,'+
  ' T.PERS_APEPAT||'+#39+' '+#39+'||T.PERS_APEMAT||'+#39+' '+#39+'||T.PERS_NOMBRE'+
  ' from CQPVDPAGOS d, FPERSONAS T where '+
  ' to_date(D.VDPA_PERIODO) BETWEEN '+#39+PERIODO2.text+'/'+anio2.text+#39+' AND '+#39+periodofin2.text+#39+
  ' AND d.VDPA_EMPL=T.PERS_PERSONA '+
  ' AND d.vdpa_QUENOM IN ('+quenom+')';
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
     qD.sql.text:='SELECT S.VDPA_EMPL as idempleado, S.VDPA_CONP as idconcepto, S.VDPA_PERDED AS PERDED, SUM(S.VDPA_MONTO) AS TOTAL, '+
     'DECODE((SELECT COUNT(*) FROM PISPTGRAVAXLEY Z WHERE Z.ISPT_CONP=S.VDPA_CONP),0,0,SUM(S.VDPA_MONTO)) AS GRAVADO,'+
     'DECODE((SELECT COUNT(*) FROM PISPTGRAVAXLEY Z WHERE Z.ISPT_CONP=S.VDPA_CONP),0,SUM(S.VDPA_MONTO),0) AS EXENTO'+
     ' FROM CQPVDPAGOS S WHERE '+
     ' S.VDPA_QUENOM IN ('+quenom+')'+
     ' AND to_date(S.VDPA_PERIODO) BETWEEN '+#39+PERIODO2.text+'/'+anio2.text+#39+' AND '+#39+periodofin2.text+#39+
     ' GROUP BY S.VDPA_EMPL, S.VDPA_CONP, S.VDPA_PERDED '+
     ' ORDER BY S.VDPA_EMPL, S.VDPA_CONP, S.VDPA_PERDED ';
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

procedure TFDetalle.fondosClick(Sender: TObject);
begin
  inherited;

  Q.Close;
  q.sql.text:='call CQFORMADEPAGO('+#39+periOdo.text+'/'+ANIO.text+#39+')';
  obsp.Lines.Add('Agregando forma de pago a Transferencia....');
  q.Execsql;


  if str_(tiponom.Text,'-')='H' then
     begin
        q.Close;
        q.sql.text:='call CQCambiosHas('+#39+periodo.text+'/'+anio.text+#39+')';
        SavetofileLog(q.sql.text);
        q.execsql;
        Showmessage('Se Agruparon Percepciones HAS a un Solo concepto');
     end;

              q.Close;
              q.sql.text:='call CQColocaFondo('+#39+periodo.text+'/'+anio.text+#39+','+#39+STR_(TIPOnOM.TEXT,'-')+#39+')';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Agrupando por Fondos....');
              q.execsql;
              Showmessage('Se crearon los conceptos de fondos');
              sumarNominas;


end;

procedure TFDetalle.Button5Click(Sender: TObject);
var
x,y:integer;
LP:STRING;
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
  q.SQL.text:='select count(distinct(B.IDCONP)) '+
  ' from CONCEPTOSJUNTOS B';
  savetofilelog(q.sql.text);
  q.open;
  barrap.MaxValue:=q.fields[0].asinteger;
  barrap.Progress:=0;


  q.Close;
  q.SQL.text:='select distinct(B.IDCONP), B.MOV, B.PERDED, b.PERDED||'+#39+'_'+#39+
  '||B.idconp||'+#39+'_'+#39+'||b.descrip||'+#39+'_'+#39+'||B.MOV'+
  ' from CONCEPTOSJUNTOS B'+
  ' order by B.PERDED DESC, B.IDCONP ASC ';
  savetofilelog(q.sql.text);
  q.open;
  GCQT.ColCount:=3;
  GCQT.rowCount:=4;
  while not (q.Eof) do
     begin
       GCQT.cells[GCQT.ColCount,0]:=q.fields[0].asstring;
       GCQT.cells[GCQT.ColCount,1]:=q.fields[1].asstring;
       GCQT.cells[GCQT.ColCount,2]:=q.fields[2].asstring;
       GCQT.cells[GCQT.ColCount,3]:=q.fields[3].asstring;
       GCQT.ColCount:=GCQT.ColCount+1;
       barrap.Progress:=barrap.Progress+1;
       q.Next;
     end;


  q.close;
  q.sql.text:='select count(*) from NOM10007RFC t ';
  savetofilelog(q.sql.text);
  q.open;
  barrap.MaxValue:=q.fields[0].asinteger;
  barrap.Progress:=0;

  q.close;
  q.sql.text:='select DISTINCT(RFC), (SELECT (C.EMPL) FROM NOM10007RFC C WHERE C.RFC=T.RFC AND ROWNUM<=1) AS EMPL,'+
  ' APEPAT||'+#39+' '+#39+'||APEMAT||'+#39+' '+#39+'||NOMBRE'+
  ' from NOM10007RFC t order by RFC';
  savetofilelog(q.sql.text);
  q.open;


  while not (q.Eof) do
     begin
       GCQT.cells[0,GCQT.rowcount]:=q.fields[1].asstring;
       GCQT.cells[1,GCQT.rowcount]:=q.fields[0].asstring;
       GCQT.cells[2,GCQT.rowcount]:=q.fields[2].asstring;
       GCQT.rowcount:=GCQT.rowcount+1;
        barrap.Progress:= barrap.Progress+1;
       q.Next;
     end;

     barrac2.Position:=0;
     barrac2.Max:= gcq2.rowcount;

     IF uperiodos.Text='%' then lp:=''
     else lp:=' AND S.idperiodo IN ('+uperiodos.TEXT+')';

     //Cuando los empleados HAS y Ordinaria se juntaban
     qD.close;
     qD.sql.text:='SELECT S.RFC as idempleado, B.conc_conp as idconcepto, B.conc_perded AS PERDED,  '+
     'SUM(S.IMPORTETOTAL) AS TOTAL,'+
     'decode( B.conc_perded,'+#39+'P'+#39+',SUM(S.IMPORTE1),SUM(S.IMPORTETOTAL)) AS GRAVADO,'+
     'decode( B.conc_perded,'+#39+'P'+#39+',SUM(S.IMPORTE2),0) AS EXENTO '+
     'FROM '+NOM1.TEXT+' S, VNOM10007RFC T, CQVPCONCEPTO B  WHERE '+
     ' B.conc_conp=S.NUMEROCONCEPTO-200 '+
     ' AND S.RFC=T.RFC '+
     ' AND S.QUENOM IN ('+LASNOMINAS.TEXT+')'+lp+
     ' AND S.TIMBRADO='+#39+'S'+#39+
     ' GROUP BY S.RFC, B.CONC_CONP, B.conc_perded  '+
     ' ORDER BY S.RFC, B.CONC_CONP,  B.conc_perded  ';
     savetofilelog(qd.sql.text);
     QD.OPEN;

     { JUNTOS POR CODIGO DE EMPLEADOS
     qD.close;
     qD.sql.text:='SELECT s.codigoempl as idempleado, B.conc_conp as idconcepto, B.conc_perded AS PERDED,  '+
     'SUM(S.IMPORTETOTAL) AS TOTAL,'+
     'decode( B.conc_perded,'+#39+'P'+#39+',SUM(S.IMPORTE1),SUM(S.IMPORTETOTAL)) AS GRAVADO,'+
     'decode( B.conc_perded,'+#39+'P'+#39+',SUM(S.IMPORTE2),0) AS EXENTO '+
     'FROM '+NOM1.TEXT+' S, NOM10007RFC T, CQVPCONCEPTO B  WHERE '+
     ' B.conc_conp=S.NUMEROCONCEPTO-200 '+
     ' AND S.CODIGOEMPL=T.EMPL '+
     ' AND S.QUENOM IN ('+LASNOMINAS.TEXT+')'+lp+
     ' AND S.TIMBRADO='+#39+'S'+#39+
     ' GROUP BY S.CODIGOEMPL, B.CONC_CONP, B.conc_perded  '+
     ' ORDER BY S.CODIGOEMPL, B.CONC_CONP,  B.conc_perded  ';
     savetofilelog(qd.sql.text);
     QD.OPEN;  }



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

procedure TFDetalle.Button13Click(Sender: TObject);
begin
  inherited;
//cOBVERTIMOS LOS RFC
  Q.close;
  q.sql.text:='DELETE FROM NOM10007RFC';
  Q.execsql;

  Q.close;
  q.sql.text:=' DELETE FROM PCQRFCUNION';
  Q.execsql;

  q.close;
  q.sql.text:='INSERT INTO PCQRFCUNION SELECT DISTINCT(A.RFC), A.CODIGOEMPL FROM '+NOM1.TEXT+' A';
  Q.execsql;


  q.close;
  q.sql.text:='SELECT count(*) from (select DISTINCT(RFC), CODIGOEMPL FROM  '+NOM1.TEXT+')';
  Q.open;
  barrap.Progress:=0;
  barrap.MaxValue:= q.fields[0].asinteger;

  q.close;
  q.sql.text:='select DISTINCT(RFC),(SELECT DISTINCT(X.EMPL) FROM PCQRFCUNION X  '+
  ' WHERE X.RFC=Y.RFC AND ROWNUM<=1) AS EMPL FROM  PCQRFCUNION Y order by RFC  ';
  SAVETOFILELOG(Q.SQL.TEXT);
  Q.open;

  while not(q.eof) do
     begin
        aux.Close;
        aux.sql.text:='INSERT INTO NOM10007RFC (EMPL,RFC) VALUES ('+
        #39+Q.fields[1].asstring+#39+','+
        #39+Q.fields[0].asstring+#39+')';
        try aux.execsql; except end;
        barrap.Progress:=barrap.Progress+1;
        q.next;
     end;

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
       posempl:=buscaClave(GCQT.cells[1,x]);
       for y:=3 to  GCQT.colcount-1 do
          begin

              if posempl<>'' then
                 begin
                     GCQT.cells[y,x]:=buscaConcepto(posempl,GCQT.cells[y,1],GCQT.cells[y,0],GCQT.cells[1,x]);
                 end;
          end;
       barrap.Progress:=barrap.Progress+1;
       emplt.Caption:='Empleado'+GCQT.cells[0,x];
       emplt.Update;
       GCQT.Update;
    end;

{
percep:=0;
deduc:=0;
barrap.progress:=0;
barrap.maxvalue:= GCQT.colcount-1;
for x:=3 to GCQT.colcount-1 do
   begin
       GCQT.cells[x,GCQT.rowcount]:=floattostr(sumacolGrid(GCQT,x));
       if  GCQT.cells[x,2]='P' then
          percep:=percep+strtofloat(GCQT.cells[x,GCQT.rowcount])
       else
          deduc:=deduc+strtofloat(GCQT.cells[x,GCQT.rowcount]);
      barrap.Progress:=barrap.Progress+1;
   end;
GCQT.rowcount:=GCQT.rowcount+1;
tpt.caption:='Percepción: '+formatfloat('#,#0.00',percep);
tdt.caption:='Deducción: '+formatfloat('#,#0.00',deduc);
                                                            }

//==================AGREGANDO CLAVE SAT =========================
for y:=3 to  gcqt.colcount-1 do
  begin
     q.Close;
     q.sql.text:='select CONS_CVESAT from PCONCEPTO A WHERE A.CONC_CONP='+#39+gcqt.cells[y,0]+#39;
     Q.Open;
     gcqt.cells[y,0]:=q.fields[0].asstring;
  end;
//==================AGREGANDO CLAVE SAT =========================


end;


procedure TFDetalle.Button16Click(Sender: TObject);
begin
  inherited;
copiarGrid(gcqt);
end;

procedure TFDetalle.JuntarHASClick(Sender: TObject);
begin
if Application.MessageBox('¿Seguro que desea correr el proceso de juntar nóminas HAS se perderá historico?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      IF tiponom.Text<>'' then
      BEGIN
        if periodofin.text<>'' then
           begin
              q.Close;
              q.sql.text:='call CQGrabarDetPagosHAS(to_date('+#39+periodo.text+'/'+anio.text+#39+'),'+#39+periodofin.text+#39+')';
              SavetofileLog(q.sql.text);
              obsp.Lines.Add('Juntando Nominas....');
              q.execsql;

              Q.Close;
              q.sql.text:='call CQFORMADEPAGO('+#39+periOdo.text+'/'+ANIO.text+#39+')';
              obsp.Lines.Add('Agregando forma de pago a Transferencia....');
              q.Execsql;

              sumarNominas;
              Showmessage('Se movieron los registros de las nominas con fecha de inicio '+periodo.text+'/'+anio.text);
          end
        else
          showmessage('Debe capturar el periodo final de la nomina');
      END
        Else
          showmessage('Debe elegir el tipo de nomina con que s etrabajará');
  end;


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

end.
