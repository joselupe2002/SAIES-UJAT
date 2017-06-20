unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList, FileCtrl;

  type
  TMovible = class( TControl );
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    Q: TQuery;
    TabOp: TPageControl;
    DsCuentas: TDataSource;
    DsRep: TDataSource;
    TabSheet3: TTabSheet;
    grid: TStringGrid;
    s: TQuery;
    Label13: TLabel;
    totalg: TLabel;
    qBancos: TQuery;
    det: TQuery;
    TabSheet4: TTabSheet;
    GridGr: TStringGrid;
    Label15: TLabel;
    totalGr: TLabel;
    PSAN: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    genSan: TSpeedButton;
    Label18: TLabel;
    SpeedButton5: TSpeedButton;
    bsit: TSpeedButton;
    PSIT: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    SpeedButton6: TSpeedButton;
    Label29: TLabel;
    SpeedButton7: TSpeedButton;
    Fecha1sit: TDateTimePicker;
    Fecha2Sit: TDateTimePicker;
    cuentasit: TEdit;
    Label30: TLabel;
    conveniosit: TEdit;
    Label31: TLabel;
    Fecha3Sit: TDateTimePicker;
    T: TQuery;
    PMENUTRA: TPopupMenu;
    ExportaraExcel1: TMenuItem;
    GenerarReporte1: TMenuItem;
    barra: TProgressBar;
    MenTrans: TPopupMenu;
    GenerarTodasTransferencias1: TMenuItem;
    GenerarTodosHSBC1: TMenuItem;
    GenerartodosSantander: TMenuItem;
    ConfigurarSantander1: TMenuItem;
    Label20: TLabel;
    Label11: TLabel;
    GridDJ: TStringGrid;
    totalDJ: TLabel;
    Label23: TLabel;
    BancoCuad: TComboBox;
    GridB: TStringGrid;
    TotalRep: TLabel;
    esDJCuad: TCheckBox;
    MenuCuad: TPopupMenu;
    ImprimirReporte1: TMenuItem;
    ImprimirTodoslosReportes1: TMenuItem;
    Label14: TLabel;
    elRubroT: TComboBox;
    elSfdoT: TComboBox;
    Label24: TLabel;
    laAreaT: TComboBox;
    Label25: TLabel;
    elBancoT: TComboBox;
    Label26: TLabel;
    SeraDJt: TCheckBox;
    TOTALGSC: TLabel;
    TotalDjSc: TLabel;
    Qp: TQuery;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label35: TLabel;
    Tipo: TComboBox;
    RNOMINA: TEdit;
    Inicia: TEdit;
    Termina: TEdit;
    NomFec: TComboBox;
    ANIO: TEdit;
    nomina: TComboBox;
    NUMREG: TEdit;
    Shape1: TShape;
    Label22: TLabel;
    elProyT: TComboBox;
    PHSBC: TPanel;
    genHSBC: TSpeedButton;
    Label40: TLabel;
    SpeedButton9: TSpeedButton;
    cuentaHSBC: TComboBox;
    Cuentasan: TComboBox;
    ConfigurarHSBC1: TMenuItem;
    Label38: TLabel;
    FechaHSBC: TDateTimePicker;
    Label39: TLabel;
    HoraHSBC: TEdit;
    ReferenciaHSBC: TEdit;
    Label41: TLabel;
    QCta: TQuery;
    Label42: TLabel;
    CancelC: TCheckBox;
    GenerarTodosHSBCNuevo1: TMenuItem;
    genHSBCtxt: TSpeedButton;
    GenerartodosHSBCNuevotxt1: TMenuItem;
    Leyenda: TLabel;
    ExportarReporteCuadre1: TMenuItem;
    ExportarDatosaExcel1: TMenuItem;
    progr: TProgressBar;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    bhsbc: TSpeedButton;
    SpeedButton11: TSpeedButton;
    bsantander: TSpeedButton;
    bbancomer: TSpeedButton;
    PYJTR: TSpeedButton;
    PYJCH: TSpeedButton;
    N1: TMenuItem;
    InvertirSeleccin1: TMenuItem;
    BtnBanTran: TSpeedButton;
    SpeedButton1: TSpeedButton;
    VerCancel: TCheckBox;
    excluidos: TCheckBox;
    excluidosc: TCheckBox;
    Button1: TButton;
    N2: TMenuItem;
    GenerarAltasdeHSBC1: TMenuItem;
    GenerararchivosaltasHSCBInd1: TMenuItem;
    GenerarArchivocsv1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure TipoChange(Sender: TObject);
    procedure NOMINAChange(Sender: TObject);
    procedure TickScanRecord(ScanInfo: TEkScanInfo);
    procedure genSanClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ExportarHSBC(abrir:boolean);
    procedure NomFecChange(Sender: TObject);
    procedure GNomSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gridDblClick(Sender: TObject);
    procedure GridNDblClick(Sender: TObject);
    procedure GridBDblClick(Sender: TObject);
    Procedure exportarBancomer(abrir:boolean);
    procedure exportarSantander;
    procedure bbancomerClick(Sender: TObject);
    procedure bsantanderClick(Sender: TObject);
    procedure bhsbcClick(Sender: TObject);
    procedure bsitClick(Sender: TObject);
    Procedure exportarSIT;
    procedure ventanaSIT;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure GridNSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GenerarReporte1Click(Sender: TObject);
    procedure GenerarTodosHSBC1Click(Sender: TObject);
    procedure GenerartodosSantander1Click(Sender: TObject);
    procedure ConfigurarSantander1Click(Sender: TObject);
    procedure GenerartodosSantanderClick(Sender: TObject);
    procedure BuscaNominas;
    procedure ANIOChange(Sender: TObject);
   FUNCTION calculasql(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string; Proy:string):STRING;
    procedure TabOpChange(Sender: TObject);
    procedure sacaReportesT;
    procedure GridDJDblClick(Sender: TObject);
    procedure BancoCuadChange(Sender: TObject);
    procedure GridBSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure elRubroTChange(Sender: TObject);
    procedure elSfdoTChange(Sender: TObject);
    procedure laAreaTChange(Sender: TObject);
    procedure GenerarLayaout(Banco:String);
    procedure GenerarTodasTransferencias1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    FUNCTION calculasql_e(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string; PROY:STRING):STRING;
    procedure elBancoTChange(Sender: TObject);
    procedure antesExportarHSBC;
    procedure genHSBCClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ConfigurarHSBC1Click(Sender: TObject);
    procedure ExportarHSBCNew(abrir:boolean);
    procedure GenerarTodosHSBCNuevo1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure exportarHSBCNewTxt(abrir:boolean);
    procedure genHSBCtxtClick(Sender: TObject);
    procedure GenerartodosHSBCNuevotxt1Click(Sender: TObject);
 function DameNombre(accion:string; extension:string; cuentaTran:string):string;
    procedure ExportaCuadre;
    function dameCtaBanco(xrubro:string;xsfdo:string;xarea:string;xproy:string;xbanco:string):string;
    procedure ExportarReporteCuadre1Click(Sender: TObject);
    procedure ColocaBorde(hoja:TExcelWorksheet;lin:integer;col:integer);
    procedure FormatoTitulo(hoja:TExcelWorksheet;lin:integer;col:integer);
    procedure ExportarPYJCheque(abrir:boolean);
    procedure PYJCHClick(Sender: TObject);
    procedure ExportarPYJTrans(abrir:boolean);
    procedure PYJTRClick(Sender: TObject);
    procedure ExportarDatosaExcel1Click(Sender: TObject);
    procedure GridGrDblClick(Sender: TObject);
    procedure GridGrSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridGrDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure elProyTChange(Sender: TObject);
    procedure SeraDJtClick(Sender: TObject);
    procedure GridGrMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      procedure CARGAcUADRES;
    procedure InvertirSeleccin1Click(Sender: TObject);
    procedure BtnBanTranClick(Sender: TObject);
    function esPorInterBancaria:string;
    procedure procesaInterbancaria(BANCO:string);

    procedure ExportarHSBC2017(abrir:boolean; nombreFile:string);
    Procedure exportarBancomerTransfer(abrir:boolean; elBancoDesc:string);
    Procedure exportarAltasCuentas(abrir:boolean;elbanco:string);
    function nombreBanco(banco:string):string;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormatoCelda(hoja:TExcelWorksheet;lin:integer;col:integer; color:integer);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure todaslasTransfer(banco:string; DJ:boolean);
    procedure GenerarAltasdeHSBC1Click(Sender: TObject);
    procedure GenerararchivosaltasHSCBInd1Click(Sender: TObject);
    procedure GenerarArchivocsv1Click(Sender: TObject);
   procedure todaslasTransferNuevas(banco:string; dj:boolean; LaFecha:string);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  proyrep,rubrorep,sfdorep,arearep,bancorep:string;
  djrep:boolean;
  FDetalle: TFDetalle;
  FMain : TFMain ;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;
  columna,linea:integer;
  vures:string;
   VURES_DESC:STRING;
fechaGen:string;
abrirSan:boolean;
abrirHSBC:BOOLEAN;
implementation


//uses Repo;

{$R *.DFM}




procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 626;
 Width :=  803 ;

 nomfec.text:='01/'+formatdatetime('MM',NOW);
 fechagen:=NomFec.text+'/'+ANIO.TEXT;
 ANIO.TEXT:= formatdatetime('yyyy',now);


 gridgr.Cells[0,0]:='CUENTA';
 gridgr.Cells[1,0]:='EMPL';
 gridgr.Cells[2,0]:='NOMBRE';
 gridgr.Cells[3,0]:='MONTO';
 gridgr.Cells[gridgr.colcount-1,0]:='SEL';
 gridgr.Cells[7,0]:='CANC';

 GRID.CELLS[0,0]:='Banco';
 GRID.CELLS[1,0]:='Monto';
 GRID.CELLS[2,0]:='Monto-Cancel';
 GRIDDJ.CELLS[0,0]:='Banco';
 GRIDDJ.CELLS[1,0]:='Monto';
 GRIDDJ.CELLS[2,0]:='Monto-Cancel';


 GRIDB.CELLS[0,0]:='Rubro';
 GRIDB.CELLS[1,0]:='Sfdo';
 GRIDB.CELLS[2,0]:='Área';
 GRIDB.CELLS[3,0]:='Proy';
 GRIDB.CELLS[3,0]:='Monto';


    TABU:=FALSE;

 //Permisos de usuario
 q.close;
 q.sql.text:='select derm_inserta, derm_edita from sdermodu s '+
            ' where s.derm_usuario=user AND S.DERM_MODULO='+#39+'PTRANSFER'+#39;
 Q.open;

 if (q.fields[0].asstring='N') or (q.fields[0].asstring='N') THEN
    begin


        TabSheet4.Visible:=false;
        TabSheet4.Enabled:=false;
    end;

  PostMessage(PROGR.Handle, $0409, 0, clgreen);

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


 IF RESULT='NOMINA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Proy,');
       Vsql.Add('NOMI_DESCRIP As Descripcion');
       Vsql.Add('FROM PNOMINAS');
       SavetofileLog(vsql.text);
     end;
end;


procedure TFDetalle.TipoChange(Sender: TObject);

begin
  inherited;
   fechagen:=NomFec.text+'/'+ANIO.TEXT;
   BuscaNominas;
   
end;


procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='';
   if (str_(tipo.text,'-')='O') OR (str_(tipo.text,'-')='C') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='H' then
       q.sql.text:='SELECT * FROM PHNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='N' then
       q.sql.text:='SELECT * FROM PNNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='V' then
       q.sql.text:='SELECT * FROM PINOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;

  if q.sql.text<>'' then
     begin
        q.open;
        RNOMINA.Text:=q.fieldbyname('NOMI_DESCRIP').asstring;
        inicia.Text:=q.fieldbyname('NOMI_FECINI').asstring;
        termina.Text:=q.fieldbyname('NOMI_FECFIN').asstring;


        q.close;
        q.sql.text:='select count(*) from ptransfernom s where s.tran_banco is not null and s.tran_cuenta is null '+
                    ' and s.tran_nomina='+#39+NOmina.text+#39;
        q.open;
        leyenda.caption:='';
        if q.Fields[0].AsInteger>0 then
           leyenda.caption:='Existen pagos de Empleados que van por transferencia y no tienen cuenta de Transferencia';
   end;

   cargaCuadres;

end;

FUNCTION TFDetalle.calculasql(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string; Proy:string):STRING;
var
VBanco:string;
VesDJ:String;
cadPrin:string;
begin
  if banco='99' THEN Vbanco:=' is null'
  else Vbanco:='='+#39+banco+#39;

  if dj THEN  VEsDJ:=' AND EMPL LIKE '+#39+'DJ%'+#39
  else VEsDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;


  if (tipo='G') or (tipo='R2') Then
      cadPrin:='SELECT SUBSTR(URESP,1,2) AS UR, SUBSTR(URESP,3,5) AS ES, '+
      ' S.URESP_DESC AS DESCURES, S.EMPL AS EMPL, S.NOMBRE AS NOMBRE, '+
      ' S.CUENTA AS CUENTA, S.CANCELADO, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';

  if tipo='C' then
      cadPrin:='SELECT count(*) FROM PVTRANSFERNOM S WHERE ';

  if tipo='S' then
      cadPrin:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE ';

//Para el Reporte Encabezado
  if tipo='R' then
      cadPrin:='SELECT distinct(URESP) AS URES,S.URESP_DESC AS DESCURES FROM PVTRANSFERNOM S WHERE  ';

  if (tipo='TR') Then
      cadPrin:='SELECT  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, CANCELADO, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';

  cadPrin:=CadPrin+
  ' BANCO '+VBANCO+
  ' AND NOMINA='+#39+NOMINA.text+#39+VEsDJ+
  ' AND RUBRO='+#39+rubro+#39+
  ' AND SFDO='+#39+sfdo+#39+
  ' AND AREA='+#39+AREA+#39;

   if not(excluidos.Checked) then
      cadPrin:=CadPrin+' AND EMPL NOT IN (SELECT DD.EMPL FROM ptransexcluir DD WHERE DD.nomina='+#39+NOMINA.text+#39+
                         ' AND DD.RUBRO ='+#39+rubro+#39+') '
   else
      cadPrin:=CadPrin+' AND EMPL IN (SELECT DD.EMPL FROM ptransexcluir DD WHERE DD.nomina='+#39+NOMINA.text+#39+
                       ' AND DD.RUBRO ='+#39+rubro+#39+')';

  if proy='%' then
     cadPrin:=CadPrin+' AND PROY NOT IN (SELECT TRAN_PROYECTO FROM PTRANEXCEPT x WHERE '+
                                        ' X.TRAN_RUBRO='+#39+rubro+#39+
                                        ' AND X.TRAN_BANCO='+#39+BANCO+#39+
                                        ' AND X.TRAN_SFDO='+#39+sfdo+#39+
                                        ' AND X.tran_AREA='+#39+AREA+#39+') '
  else
     cadPrin:=CadPrin+' AND PROY ='+#39+PROY+#39;

  if (tipo='TR') and  not(verCancel.Checked) Then cadPrin:=cadPrin+' AND MONTO>0 AND CANCELADO='+#39+'N'+#39
  else    cadPrin:=cadPrin+' AND MONTO>0';

  if tipo='G' then
     CadPrin:=CadPrin+' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2,4';

  if tipo='TR' then
     CadPrin:=CadPrin+' GROUP BY  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, CANCELADO'+
              ' ORDER BY 2';
  calculasql:=cadPrin;
end;




FUNCTION TFDetalle.calculasql_e(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string; PROY:STRING):STRING;
var
VBanco:string;
VesDJ:String;
cadPrin:string;
begin
  if banco='99' THEN Vbanco:=' is null'
  else Vbanco:='='+#39+banco+#39;

  if dj THEN  VEsDJ:=' AND EMPL LIKE '+#39+'DJ%'+#39
  else VEsDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;


  if (tipo='G') or (tipo='R2') Then
      cadPrin:='SELECT SUBSTR(URESP,1,2) AS UR, SUBSTR(URESP,3,5) AS ES, '+
      ' S.URESP_DESC AS DESCURES, S.EMPL AS EMPL, S.NOMBRE AS NOMBRE, '+
      ' S.CUENTA AS CUENTA, S.CANCELADO, s.PROY, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';

  if tipo='C' then
      cadPrin:='SELECT count(*) FROM PVTRANSFERNOM S WHERE ';

  if tipo='S' then
      cadPrin:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE ';

//Para el Reporte Encabezado
  if tipo='R' then
      cadPrin:='SELECT distinct(URESP) AS URES,S.URESP_DESC AS DESCURES FROM PVTRANSFERNOM S WHERE  ';

  if (tipo='TR') Then
      cadPrin:='SELECT  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA,PROY, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';

  cadPrin:=CadPrin+
  ' BANCO '+VBANCO+
  ' AND NOMINA='+#39+NOMINA.text+#39+VEsDJ+
  ' AND RUBRO='+#39+rubro+#39+
  ' AND SFDO='+#39+sfdo+#39+
  ' AND AREA='+#39+AREA+#39+
  ' AND PROY LIKE '+#39+'%'+PROY+'%'+#39;

  if (tipo='TR') Then cadPrin:=cadPrin+' AND MONTO>0 AND CANCELADO='+#39+'N'+#39;

  if tipo='G' then
     CadPrin:=CadPrin+' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO,S.PROY'+
              ' ORDER BY 1,2,4';

  if tipo='TR' then
     CadPrin:=CadPrin+' GROUP BY  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA,PROY'+
              ' ORDER BY 2';
  calculasql_E:=cadPrin;
end;



procedure TFDetalle.sacaReportesT;
begin

if (elrubrot.text<>'') and (elsfdot.text<>'') and (laAreat.text<>'') and (elBancot.text<>'') and (elProyt.Text<>'') then
  begin
      LIMPIAGRID(gridGr);
      gridGr.rowcount:=2;
      gridgr.FixedRows:=1;
      gridgr.Cells[0,0]:='CUENTA';
      gridgr.Cells[1,0]:='EMPL';
      gridgr.Cells[2,0]:='NOMBRE';
      gridgr.Cells[3,0]:='MONTO';

      S.close;
      s.sql.text:=calculasql(elrubrot.text,elsfdot.text,laAreat.text,str_(elbancot.text,'-'),SeraDJt.checked,'TR',ElProyt.text);
      savetofilelog(s.sql.text);
      s.open;


      while not(s.eof) do
         begin
            gridGr.cells[0,gridGR.rowcount-1]:=S.fieldbyname('CUENTA').asstring;
            gridGr.cells[1,gridGR.rowcount-1]:=S.fieldbyname('EMPL').asstring;
            gridGr.cells[2,gridgr.rowcount-1]:=S.fieldbyname('NOMBRE').asstring;
            gridGr.cells[3,gridgr.rowcount-1]:=FORMATFLOAT('#0.00',S.fieldbyname('MONTO').asfloat);
            gridGr.cells[4,gridgr.rowcount-1]:=S.fieldbyname('NOMBRES').asstring;
            gridGr.cells[5,gridgr.rowcount-1]:=S.fieldbyname('APEPAT').asstring;
            gridGr.cells[6,gridgr.rowcount-1]:=S.fieldbyname('APEMAT').asstring;
            gridGr.cells[7,gridgr.rowcount-1]:=S.fieldbyname('CANCELADO').asstring;
            gridGr.RowCount:=gridGR.RowCount+1;
            s.nexT;
         end;
         if (s.recordcount)>0 then
             gridGr.RowCount:=gridGR.RowCount-1;

         totalGR.caption:=formatfloat('#00.00',sumacolGrid(gridGr,3));
         Sortgrid(GRIDGR,2,1);
  end;
end;



procedure TFDetalle.todaslasTransfer(banco:string; dj:boolean);
var
  VEsDJ:string;
  cadPrin:String;
  vbanco:string;
begin
   LIMPIAGRID(gridGr);
   gridGr.rowcount:=2;
   gridgr.FixedRows:=1;
   gridgr.Cells[0,0]:='CUENTA';
   gridgr.Cells[1,0]:='EMPL';
   gridgr.Cells[2,0]:='NOMBRE';
   gridgr.Cells[3,0]:='MONTO';

   if banco='99' THEN Vbanco:=' is null'
   else Vbanco:='='+#39+banco+#39;

   if dj THEN  VEsDJ:=' AND EMPL LIKE '+#39+'DJ%'+#39
   else VEsDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;
   cadPrin:='SELECT  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, CANCELADO, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';
   cadPrin:=CadPrin+' BANCO '+VBANCO+' AND NOMINA='+#39+NOMINA.text+#39+VEsDJ+' AND MONTO>0'+
   ' GROUP BY  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, CANCELADO ORDER BY 2';

   S.close;
   s.sql.text:=cadPrin;
   savetofilelog(s.sql.text);
   s.open;


      while not(s.eof) do
         begin
            gridGr.cells[0,gridGR.rowcount-1]:=S.fieldbyname('CUENTA').asstring;
            gridGr.cells[1,gridGR.rowcount-1]:=S.fieldbyname('EMPL').asstring;
            gridGr.cells[2,gridgr.rowcount-1]:=S.fieldbyname('NOMBRE').asstring;
            gridGr.cells[3,gridgr.rowcount-1]:=FORMATFLOAT('#0.00',S.fieldbyname('MONTO').asfloat);
            gridGr.cells[4,gridgr.rowcount-1]:=S.fieldbyname('NOMBRES').asstring;
            gridGr.cells[5,gridgr.rowcount-1]:=S.fieldbyname('APEPAT').asstring;
            gridGr.cells[6,gridgr.rowcount-1]:=S.fieldbyname('APEMAT').asstring;
            gridGr.cells[7,gridgr.rowcount-1]:=S.fieldbyname('CANCELADO').asstring;
            gridGr.RowCount:=gridGR.RowCount+1;
            s.nexT;
         end;
         if (s.recordcount)>0 then
             gridGr.RowCount:=gridGR.RowCount-1;

         totalGR.caption:=formatfloat('#00.00',sumacolGrid(gridGr,3));
         Sortgrid(GRIDGR,2,1);
  end;



procedure TFDetalle.todaslasTransferNuevas(banco:string; dj:boolean; LaFecha:string);
var
  VEsDJ:string;
  cadPrin:String;
  vbanco:string;
begin
   LIMPIAGRID(gridGr);
   gridGr.rowcount:=2;
   gridgr.FixedRows:=1;
   gridgr.Cells[0,0]:='CUENTA';
   gridgr.Cells[1,0]:='EMPL';
   gridgr.Cells[2,0]:='NOMBRE';
   gridgr.Cells[3,0]:='MONTO';

   if banco='99' THEN Vbanco:=' is null'
   else Vbanco:='='+#39+banco+#39;

   if dj THEN  VEsDJ:=' AND EMPL LIKE '+#39+'DJ%'+#39
   else VEsDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;
   cadPrin:='SELECT  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, CANCELADO, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';
   cadPrin:=CadPrin+' BANCO '+VBANCO+' AND NOMINA='+#39+NOMINA.text+#39+VEsDJ+' AND MONTO>0'+
   '  AND (SELECT A.CTA_FEC FROM PCTABANCO A WHERE A.CTAB_CUENTA=S.CUENTA AND ROWNUM<=1)>='+#39+laFecha+#39+
   ' GROUP BY  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, CANCELADO ORDER BY 2';

   S.close;
   s.sql.text:=cadPrin;
   savetofilelog(s.sql.text);
   s.open;


      while not(s.eof) do
         begin
            gridGr.cells[0,gridGR.rowcount-1]:=S.fieldbyname('CUENTA').asstring;
            gridGr.cells[1,gridGR.rowcount-1]:=S.fieldbyname('EMPL').asstring;
            gridGr.cells[2,gridgr.rowcount-1]:=S.fieldbyname('NOMBRE').asstring;
            gridGr.cells[3,gridgr.rowcount-1]:=FORMATFLOAT('#0.00',S.fieldbyname('MONTO').asfloat);
            gridGr.cells[4,gridgr.rowcount-1]:=S.fieldbyname('NOMBRES').asstring;
            gridGr.cells[5,gridgr.rowcount-1]:=S.fieldbyname('APEPAT').asstring;
            gridGr.cells[6,gridgr.rowcount-1]:=S.fieldbyname('APEMAT').asstring;
            gridGr.cells[7,gridgr.rowcount-1]:=S.fieldbyname('CANCELADO').asstring;
            gridGr.RowCount:=gridGR.RowCount+1;
            s.nexT;
         end;
         if (s.recordcount)>0 then
             gridGr.RowCount:=gridGR.RowCount-1;

         totalGR.caption:=formatfloat('#00.00',sumacolGrid(gridGr,3));
         Sortgrid(GRIDGR,2,1);
  end;


procedure TFDetalle.TickScanRecord(ScanInfo: TEkScanInfo);
begin
   if scaninfo.Number=1 then
     begin
        det.close;
        det.sql.text:=calculasql(rubroRep,sfdoRep,areaRep,str_(bancoRep,'-'),djRep,'R2',proyrep)+
              ' AND URESP='+#39+QP.fieldbyname('URES').asstring+#39+
              ' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
        savetofilelog(DET.sql.text);
        det.open;
     end;
end;


function tfdetalle.DameNombre(accion:string; extension:string; cuentaTran:string):string;
var
nombre:string;
begin
   if accion='T' then
      begin
         if seradjt.Checked then
            nombre:=secondCad(elBancot.Text,'-')+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text+' DJ '
         else
            nombre:=secondCad(elBancot.Text,'-')+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text;

         if elProyT.text<>'%' then
            nombre:=nombre+' '+copy(SecondCad(TIPO.TEXT,'-'),1,3)+' PY'+elProyT.text+extension
         else
            nombre:=nombre+' '+copy(SecondCad(TIPO.TEXT,'-'),1,3)+extension;
      end;
      
   if accion='C' then
      begin
         if esDJCuad.Checked then
            nombre:=secondCad(elBancot.Text,'-')+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text+' DJ '
         else
            nombre:=secondCad(elBancot.Text,'-')+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text;

         if elProyT.text<>'%' then
            nombre:=nombre+' '+copy(SecondCad(TIPO.TEXT,'-'),1,3)+' PY'+elProyT.text+extension
         else
            nombre:=nombre+' '+copy(SecondCad(TIPO.TEXT,'-'),1,3)+extension;
      end;


  DameNombre:=nombre;
end;


procedure TFDetalle.ExportarHSBC(abrir:boolean);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
rutaNom:string;
rutaNombre:string;
nombre:string;
grupo:string;
begin

rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll]);

rutaNombre:=dameNombre('T','.slk','');

CreateDir('c:\Transferencias\');
CreateDir('c:\Transferencias\'+rutaNom+'\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC\'+elrubrot.text+'\');
CrearFile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC\'+elrubrot.text+'\'+rutaNombre);


ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

//showmessage('Exportar....'+GRUPO);

ExcelApplication1.Workbooks.Open('c:\Transferencias\'+rutaNom+'\Layaout\HSBC\'+elrubrot.text+'\'+rutaNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  y:=1;
  progr.Min:=0;
  progr.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        ExcelWorksheet1.Cells.Item[y,1].value:=gridgr.cells[0,y];
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y];
        ExcelWorksheet1.Cells.Item[y,3].value:=stringReplace(RNOMINA.text,'/','',[rfReplaceAll]);
        nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
        nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,4].value:=nombre;
        y:=y+1;
        progr.Position:=progr.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  progr.Position:=0;

  if not(abrir) then
     begin
        ExcelWorkbook1.Save;
        ExcelApplication1.Quit;
     end;
end;




procedure TFDetalle.ExportarPYJCheque(abrir:boolean);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
rutaNom:string;
rutaNombre:string;
nombre:string;
grupo:string;
begin

rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll]);

rutaNombre:=dameNombre('T','.xls','');

CreateDir('c:\Transferencias\');
CreateDir('c:\Transferencias\'+rutaNom+'\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\'+elrubrot.text+'\');

if not(fileexists(ExtractFiledir(Paramstr(0))+'\CHEQUE_JB.xls')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','CHEQUE_JB','xls');

copyfile(pchar(ExtractFiledir(Paramstr(0))+'\CHEQUE_JB.xls'),
         pchar('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\'+elrubrot.text+'\'+rutaNombre),false);


ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

//showmessage('Exportar....'+GRUPO);

  ExcelApplication1.Workbooks.Open('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\'+elrubrot.text+'\'+rutaNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  y:=3;
  progr.Min:=0;
  progr.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        if (gridgr.cells[7,y-2]='S') THEN FormatoCelda(ExcelWorksheet1,Y,1,38);

        ExcelWorksheet1.Cells.Item[y,1].value:='ContInst LIQUIDACION TOTAL O PARCIAL DE DINERO';
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y-2];
        ExcelWorksheet1.Cells.Item[y,3].value:='MONEDA NACIONAL';
        ExcelWorksheet1.Cells.Item[y,4].value:='CHEQUES DE CAJA PARA SUCURSALES';
        ExcelWorksheet1.Cells.Item[y,8].value:='VILLAHERMOSA TAB.';
        ExcelWorksheet1.Cells.Item[y,9].value:='PRINCIPAL VILLAHERMOSA';
        ExcelWorksheet1.Cells.Item[y,10].value:='646951';
        ExcelWorksheet1.Cells.Item[y,11].value:='Persona Física';

        if gridgr.cells[5,y-2]='XXXX' then  ExcelWorksheet1.Cells.Item[y,12].value:='' else
           ExcelWorksheet1.Cells.Item[y,12].value:=stringReplace(gridgr.cells[5,y-2],'Ñ','N',[rfReplaceAll]);

        if gridgr.cells[6,y-2]='XXXX' then  ExcelWorksheet1.Cells.Item[y,13].value:='' else
           ExcelWorksheet1.Cells.Item[y,13].value:=stringReplace(gridgr.cells[6,y-2],'Ñ','N',[rfReplaceAll]);


        if gridgr.cells[4,y-2]='XXXX' then  ExcelWorksheet1.Cells.Item[y,14].value:='' else
           ExcelWorksheet1.Cells.Item[y,14].value:=stringReplace(gridgr.cells[4,y-2],'Ñ','N',[rfReplaceAll]);


        ExcelWorksheet1.Cells.Item[y,19].value:=gridgr.cells[3,y-2];
        y:=y+1;
        progr.Position:=progr.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  progr.Position:=0;

  if not(abrir) then
     begin
        ExcelWorkbook1.Save;
        ExcelApplication1.Quit;
     end;
end;



procedure TFDetalle.ExportarPYJTrans(abrir:boolean);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
rutaNom:string;
rutaNombre:string;
nombre:string;
grupo:string;
laCtaAb,elBancoAb,egreso:string;
begin

rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll]);

rutaNombre:=dameNombre('T','.xls','');

CreateDir('c:\Transferencias\');
CreateDir('c:\Transferencias\'+rutaNom+'\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\');
CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\'+elrubrot.text+'\');

if not(fileexists(ExtractFiledir(Paramstr(0))+'\TRANS_JB.xls')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','TRANS_JB','xls');

copyfile(pchar(ExtractFiledir(Paramstr(0))+'\TRANS_JB.xls'),
         pchar('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\'+elrubrot.text+'\'+rutaNombre),false);


ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

//showmessage('Exportar....'+GRUPO);

  ExcelApplication1.Workbooks.Open('c:\Transferencias\'+rutaNom+'\Layaout\PYJ\'+elrubrot.text+'\'+rutaNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  y:=3;
  progr.Min:=0;
  progr.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        Q.close;
        q.sql.text:='SELECT CTAB_INTERBANC, CTAB_BANCORI FROM PCTABANCO WHERE CTAB_EMPL='+#39+gridgr.cells[1,y-2]+#39;
        Q.open;

        laCtaAb:=gridgr.cells[0,y-2];
        egreso:='ABONO A CUENTA DE CHEQUES';
        elbancoAb:='SANTANDER';
        if q.fields[1].asstring<>'' then  //Solo para jubilados verificamos el Banco de Origen que no sea Nulo
           begin
              egreso:='ABONO INTERBANCARIO';
              laCtaAb:=Q.fields[0].asstring;
              elbancoAb:= Q.fields[1].asstring;
           end;

        if (gridgr.cells[7,y-2]='S') THEN FormatoCelda(ExcelWorksheet1,Y,1,38);

        ExcelWorksheet1.Cells.Item[y,1].value:='ContInst LIQUIDACION TOTAL O PARCIAL DE DINERO';
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y-2];
        ExcelWorksheet1.Cells.Item[y,3].value:='MONEDA NACIONAL';
        ExcelWorksheet1.Cells.Item[y,4].value:=egreso;
        ExcelWorksheet1.Cells.Item[y,6].value:=laCtaAb;
        ExcelWorksheet1.Cells.Item[y,7].value:=elbancoAb;

        ExcelWorksheet1.Cells.Item[y,8].value:='VILLAHERMOSA TAB.';
        ExcelWorksheet1.Cells.Item[y,9].value:='';
        ExcelWorksheet1.Cells.Item[y,10].value:='646951';
        ExcelWorksheet1.Cells.Item[y,11].value:='Persona Física';

         if gridgr.cells[5,y-2]='XXXX' then  ExcelWorksheet1.Cells.Item[y,12].value:='' else
           ExcelWorksheet1.Cells.Item[y,12].value:=stringReplace(gridgr.cells[5,y-2],'Ñ','N',[rfReplaceAll]);

        if gridgr.cells[6,y-2]='XXXX' then  ExcelWorksheet1.Cells.Item[y,13].value:='' else
           ExcelWorksheet1.Cells.Item[y,13].value:=stringReplace(gridgr.cells[6,y-2],'Ñ','N',[rfReplaceAll]);


        if gridgr.cells[4,y-2]='XXXX' then  ExcelWorksheet1.Cells.Item[y,14].value:='' else
           ExcelWorksheet1.Cells.Item[y,14].value:=stringReplace(gridgr.cells[4,y-2],'Ñ','N',[rfReplaceAll]);

        ExcelWorksheet1.Cells.Item[y,19].value:=gridgr.cells[3,y-2];
        y:=y+1;
        progr.Position:=progr.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  progr.Position:=0;

  if not(abrir) then
     begin
        ExcelWorkbook1.Save;
        ExcelApplication1.Quit;
     end;
end;



procedure TFDetalle.exportarHSBCNewTxt(abrir:boolean);
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
ContFil:integer;
grupo:string;
rutaNombre:string; rutaNom:string;
elConvenioBanco:string;
LAcuentaBanco:string;

begin

qcta.close;
qcta.sql.text:='select getCuentaBanco('+#39+elRubrot.text+#39+','+
#39+elSfdot.text+#39+','+#39+laareat.text+#39+','+#39+elProyT.text+#39+','+
#39+str_(elbancot.text,'-')+#39+') FROM DUAL ';
qcta.OPEN;
elConvenioBanco:=copy(qcta.fields[0].asstring,1,pos('*',qcta.fields[0].asstring));
LAcuentaBanco:=copy(qcta.fields[0].asstring, pos('*',qcta.fields[0].asstring)+1,length(qcta.fields[0].asstring));

  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;



  filtran.Add('MXPRLFF'+colocaespacios(LAcuentaBanco,10)+
              colocaceros(stringReplace(totalgr.caption,'.','',[rfReplaceAll]),14)+
              colocaceros(inttostr(gridgr.rowcount-1),7)+
              formatdatetime('DDMMYYYY',fechahsbc.date)+
              colocaespacios(copy(horahsbc.text,1,5),5)+
              colocaespacios(copy(referenciahsbc.text,1,34),34));

  contFil:=ContFil+1;
         for x:=1 to gridgr.rowcount-1 do
           begin

             nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
             nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);

             filtran.Add(colocaceros(copy(gridgr.cells[0,contFil-1],1,10),10)+
                         colocaceros(stringReplace(gridgr.cells[3,contFil-1],'.','',[rfReplaceAll]),14)+
                         colocaespacios(COPY(stringReplace(RNOMINA.text,'/','',[rfReplaceAll]),1,34),34)+
                         colocaespacios(COPY(nombre,1,35),35));

              contFil:=ContFil+1;
           end;


      rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll]);
      rutaNombre:=dameNombre('T','.txt',LAcuentaBanco);

      CreateDir('c:\Transferencias\');
      CreateDir('c:\Transferencias\'+rutaNom+'\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_TXT\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_TXT\'+elrubrot.text+'\');
      CrearFile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_TXT\'+elrubrot.text+'\'+rutaNombre);

      filtran.SaveToFile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_TXT\'+elrubrot.text+'\'+rutaNombre);

       if abrir then
          ShellExecute(handle, 'open', PChar('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_TXT\'+elrubrot.text+'\'+rutaNombre), nil, nil, SW_show);
       PSAN.visible:=false;
end;


procedure TFDetalle.ExportarHSBCNew(abrir:boolean);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
rutaNom:string;
rutaNombre:string;
nombre:string;
grupo:string;
elConvenioBanco:string;
LAcuentaBanco:string;
begin

qcta.close;
qcta.sql.text:='select getCuentaBanco('+#39+elRubrot.text+#39+','+
#39+elSfdot.text+#39+','+#39+laareat.text+#39+','+#39+elProyT.text+#39+','+
#39+STR_(elbancot.text,'-')+#39+') FROM DUAL ';
qcta.OPEN;
elConvenioBanco:=copy(qcta.fields[0].asstring,1,pos('*',qcta.fields[0].asstring));
LAcuentaBanco:=copy(qcta.fields[0].asstring, pos('*',qcta.fields[0].asstring)+1,length(qcta.fields[0].asstring));



 rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll]);
 rutaNombre:=dameNombre('T','.csv',LAcuentaBanco);

      CreateDir('c:\Transferencias\');
      CreateDir('c:\Transferencias\'+rutaNom+'\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\'+elrubrot.text+'\');
      deletefile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\'+elrubrot.text+'\'+rutaNombre);
      CrearFile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\'+elrubrot.text+'\'+rutaNombre);




ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

//showmessage('Exportar....'+GRUPO);

ExcelApplication1.Workbooks.Open('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\'+elrubrot.text+'\'+rutaNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;


  ExcelWorksheet1.Cells.Item[1,1].value:='MXPRLF';
  ExcelWorksheet1.Cells.Item[1,2].value:='F';
  ExcelWorksheet1.Cells.Item[1,3].value:=LAcuentaBanco;
   ExcelWorksheet1.Cells.Item[1,4].value:=totalgr.Caption;
  ExcelWorksheet1.Cells.Item[1,5].value:=inttostr(gridgr.rowcount-1);
  ExcelWorksheet1.Cells.Item[1,6].value:=formatdatetime('DDMMYYYY',fechahsbc.date);
   ExcelWorksheet1.Cells.Item[1,7].value:=horahsbc.text;
    ExcelWorksheet1.Cells.Item[1,8].value:=referenciahsbc.text;

  y:=2;
  progr.Min:=0;
  progr.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        ExcelWorksheet1.Cells.Item[y,1].value:=gridgr.cells[0,y-1];
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y-1];
        ExcelWorksheet1.Cells.Item[y,3].value:=COPY(stringReplace(RNOMINA.text,'/','',[rfReplaceAll]),1,34);
        nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
        nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,4].value:=COPY(nombre,1,35);
        y:=y+1;
        progr.Position:=progr.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  progr.Position:=0;

  if not(abrir) then
     begin

        ExcelWorkbook1.Save;
        ExcelApplication1.Quit;

     end;
 ExcelWorksheet1.Disconnect;
 ExcelWorkbook1.Disconnect;
 ExcelApplication1.Disconnect;
end;



procedure TFDetalle.ExportarHSBC2017(abrir:boolean; nombreFile:string);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
rutaNom:string;
rutaNombre:string;
nombre:string;
grupo:string;
elConvenioBanco:string;
LAcuentaBanco:string;
nombreEmpl:string;
begin

 rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll]);
 if nombreFile='' then
    rutaNombre:='Reg_'+dameNombre('T','.csv',LAcuentaBanco)
 else
    rutaNombre:=nombreFile;

      CreateDir('c:\Transferencias\');
      CreateDir('c:\Transferencias\'+rutaNom+'\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\');
      CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\ALTAS_CNTA\');
      deletefile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\ALTAS_CNTA\'+rutaNombre);
      CrearFile('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\ALTAS_CNTA\'+rutaNombre);


ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

//showmessage('Exportar....'+GRUPO);

ExcelApplication1.Workbooks.Open('c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\ALTAS_CNTA\'+rutaNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;


  ExcelWorksheet1.Cells.Item[1,1].value:='AUTHBENEH';
  ExcelWorksheet1.Cells.Item[1,2].value:='ABCXXXXXXXX';
  ExcelWorksheet1.Cells.Item[1,3].value:='MX-'+formatdatetime('DDMMYYYY',fechahsbc.date)+inttostr(gridgr.rowcount);
  ExcelWorksheet1.Cells.Item[1,4].value:='';
  ExcelWorksheet1.Cells.Item[1,5].value:='';
  ExcelWorksheet1.Cells.Item[1,6].value:='';
  ExcelWorksheet1.Cells.Item[1,7].value:=inttostr(gridgr.rowcount);
  ExcelWorksheet1.Cells.Item[1,8].value:=inttostr(gridgr.rowcount-1);


  y:=2;
  progr.Min:=0;
  progr.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        nombreEmpl:= stringReplace(gridgr.Cells[2,y-1],'Ñ','N',[rfReplaceAll]);
        nombreEmpl:= stringReplace(nombreEmpl,'.','',[rfReplaceAll]);
        nombreEmpl:= stringReplace(nombreEmpl,'-','',[rfReplaceAll]);

        ExcelWorksheet1.Cells.Item[y,1].value:='BENEDET';
        ExcelWorksheet1.Cells.Item[y,2].value:='A'+gridgr.cells[1,y-1];
        ExcelWorksheet1.Cells.Item[y,3].value:=nombreEmpl; //Nombre del beneficiario
        ExcelWorksheet1.Cells.Item[y,4].value:=''; //Direccion Beneficiario 1
        ExcelWorksheet1.Cells.Item[y,5].value:='';  //Direccion Beneficiario 2
        ExcelWorksheet1.Cells.Item[y,6].value:='';  //Direccion Beneficiario 3
        ExcelWorksheet1.Cells.Item[y,7].value:='MXOP_ACH';
        ExcelWorksheet1.Cells.Item[y,8].value:='A';
        ExcelWorksheet1.Cells.Item[y,9].value:='MX';
        ExcelWorksheet1.Cells.Item[y,10].value:=gridgr.cells[0,y-1];
        ExcelWorksheet1.Cells.Item[y,11].value:='L';
        ExcelWorksheet1.Cells.Item[y,12].value:=CHR(39)+'021';
        ExcelWorksheet1.Cells.Item[y,13].value:='BID';
        ExcelWorksheet1.Cells.Item[y,14].value:='';
        ExcelWorksheet1.Cells.Item[y,15].value:='';
        y:=y+1;
        progr.Position:=progr.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  progr.Position:=0;

  if not(abrir) then
     begin
        ExcelWorkbook1.Save;
        {ExcelWorkbook1.SaveAs(
        'c:\Transferencias\'+rutaNom+'\Layaout\HSBC_NEW\ALTAS_CNTA\'+rutaNombre,
        xlCSV,
        '','',false,false,xlNochange,xlUserResolution,False,EmptyParam,EmptyParam,EmptyParam);   }
        ExcelApplication1.Quit;

     end;
 ExcelWorksheet1.Disconnect;
 ExcelWorkbook1.Disconnect;
 ExcelApplication1.Disconnect;
end;


Procedure TFDetalle.exportarBancomer(abrir:boolean);
var
filTran:TstringList;
nombre:string;
x:integer;
empieza:integer;
corte:integer;
hasta:integer;
cont:integer;
grupo:string;
rutaNombre:String;
rutaNom:string;
elConvenioBanco:string;   LAcuentaBanco:string;

begin

{qcta.close;
qcta.sql.text:='select getCuentaBanco('+#39+elRubrot.text+#39+','+
#39+elSfdot.text+#39+','+#39+laareat.text+#39+','+#39+elProyT.text+#39+','+
#39+STR_(elbancot.text,'-')+#39+') FROM DUAL ';
qcta.OPEN;
elConvenioBanco:=copy(qcta.fields[0].asstring,1,pos('*',qcta.fields[0].asstring));
LAcuentaBanco:=copy(qcta.fields[0].asstring, pos('*',qcta.fields[0].asstring)+1,length(qcta.fields[0].asstring));      }


        filtran:=TstringList.create;
        filtran.Clear;
        corte:=1;
        empieza:=1;
        while (empieza<gridgr.RowCount) do
           begin
              cont:=1;
              if (gridgr.RowCount-empieza-1)>strtoint(numreg.text) then hasta:=(strtoint(numreg.text)*corte) else hasta:=gridgr.RowCount-1;
              for x:=empieza to hasta do
                 begin
                   nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
                   nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
                   nombre:=copy(nombre,1,40);

                   filtran.Add(colocaceros(inttostr(cont),9)+
                               '                '+
                               '99'+colocaespacios(gridgr.cells[0,x],10)+
                               '          '+
                               colocaceros(stringReplace(gridgr.cells[3,x],'.','',[rfReplaceAll]),15)+
                               colocaespacios(nombre,40)+
                               '001001');
                    cont:=cont+1;
                 end; //para


             rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
             rutaNombre:=dameNombre('T','.txt',LAcuentaBanco);

             CreateDir('c:\Transferencias\');
             CreateDir('c:\Transferencias\'+rutaNom+'\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\Bancomer\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\Bancomer\'+elrubrot.text+'\');
             filtran.SaveToFile('C:\Transferencias\'+rutaNom+'\Layaout\Bancomer\'+elrubrot.text+'\'+rutaNombre);

             if abrir then
             ShellExecute(handle, 'open', PChar('C:\Transferencias\'+rutaNom+'\Layaout\Bancomer\'+elrubrot.text+'\'+rutaNombre), nil, nil, SW_show);
             empieza:=hasta+1;
             corte:=corte+1;
             filtran.clear;
         end; // while
end;



Procedure TFDetalle.exportarBancomerTransfer(abrir:boolean; elBancoDesc:string);
var
filTran:TstringList;
nombre:string;
x:integer;
empieza:integer;
corte:integer;
hasta:integer;
cont:integer;
grupo:string;
rutaNombre:String;
rutaNom:string;
elConvenioBanco:string;
LAcuentaBanco:string;

begin

qcta.close;
qcta.sql.text:='select getCuentaBanco('+#39+elRubrot.text+#39+','+
#39+elSfdot.text+#39+','+#39+laareat.text+#39+','+#39+elProyT.text+#39+','+
#39+'02'+#39+') FROM DUAL ';
qcta.OPEN;

elConvenioBanco:=copy(qcta.fields[0].asstring,1,pos('*',qcta.fields[0].asstring));
LAcuentaBanco:=copy(qcta.fields[0].asstring, pos('*',qcta.fields[0].asstring)+1,length(qcta.fields[0].asstring));


        filtran:=TstringList.create;
        filtran.Clear;
        corte:=1;
        empieza:=1;
        while (empieza<gridgr.RowCount) do
           begin
              cont:=1;
              if (gridgr.RowCount-empieza-1)>strtoint(numreg.text) then hasta:=(strtoint(numreg.text)*corte) else hasta:=gridgr.RowCount-1;
              for x:=empieza to hasta do
                 begin
                   s.close;
                   s.sql.text:='SELECT A.CTAB_INTERBANC FROM PCTABANCO A WHERE A.CTAB_EMPL='+#39+gridgr.cells[1,x]+#39;
                   s.open;
                   if s.Fields[0].asstring='' then
                      showmessage('Advertencia: El empleado '+gridgr.cells[1,x]+' No tiene cuenta Interbancaria ir a la pantalla de cuadre para actualizar cuenta');



                   nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
                   nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
                   nombre:=copy(nombre,1,30);

                   filtran.Add('PSC'+s.FIELDS[0].asstring+
                               colocaceros(LAcuentaBanco,18)+
                               'MXP'+colocaceros(gridgr.cells[3,x],16)+
                               colocaespacios(nombre,30)+
                               '40'+
                               copy(s.FIELDS[0].asstring,1,3)+
                               colocaespacios(stringReplace(RNOMINA.text,'/','',[rfReplaceAll]),30)+

                               '0160527H0                  000000000000.00');
                    cont:=cont+1;
                 end; //para


             rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
             rutaNombre:=elBancoDesc+'-'+dameNombre('T','.txt',LAcuentaBanco);

             CreateDir('c:\Transferencias\');
             CreateDir('c:\Transferencias\'+rutaNom+'\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\'+elBancoDesc+'-Inter\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\'+elBancoDesc+'-Inter\'+elrubrot.text+'\');
             filtran.SaveToFile('C:\Transferencias\'+rutaNom+'\Layaout\'+elBancoDesc+'-Inter\'+elrubrot.text+'\'+rutaNombre);

             if abrir then
             ShellExecute(handle, 'open', PChar('C:\Transferencias\'+rutaNom+'\Layaout\'+elBancoDesc+'-Inter\'+elrubrot.text+'\'+rutaNombre), nil, nil, SW_show);
             empieza:=hasta+1;
             corte:=corte+1;
             filtran.clear;
         end; // while
end;




Procedure TFDetalle.exportarAltasCuentas(abrir:boolean;elbanco:string);
var
filTran:TstringList;
nombre:string;
x:integer;
empieza:integer;
corte:integer;
hasta:integer;
cont:integer;
grupo:string;
rutaNombre:String;
rutaNom:string;

begin
        q.close;
        q.sql.text:='SELECT * FROM PTRANSFERNOM a WHERE a.TRAN_NOMINA='+nomina.text+' AND a.TRAN_RUBRO='+
        #39+elrubrot.text+#39+
        ' AND a.TRAN_EMPL NOT IN (SELECT S.TRAN_EMPL FROM PTRANSFERNOM S WHERE S.TRAN_NOMINA<'+nomina.text+
        ' AND S.TRAN_RUBRO='+#39+elrubrot.text+#39+' and s.tran_empl=a.tran_empl and s.tran_clabe=a.tran_clabe)'+
        ' AND A.TRAN_BANCO<>'+#39+elBanco+#39+
        ' AND A.TRAN_PROY IN (SELECT U.TRAN_PROYECTO  FROM PTRANEXCEPT U WHERE U.TRAN_RUBRO='+#39+elrubrot.text+#39+')';
        q.open;

        filtran:=TstringList.create;
        filtran.Clear;
        while not (q.eof) do
           begin
                   s.close;
                   s.sql.text:='SELECT A.CTAB_INTERBANC FROM PCTABANCO A WHERE A.CTAB_EMPL='+#39+q.fieldbyname('tran_empl').asstring+#39;
                   s.open;
                   if s.Fields[0].asstring='' then
                      showmessage('Advertencia: El empleado '+q.fieldbyname('tran_empl').asstring+' No tiene cuenta Interbancaria ir a la pantalla de cuadre para actualizar cuenta');

                   nombre:= stringReplace(q.fieldbyname('tran_nombre').asstring,'Ñ','N',[rfReplaceAll]);
                   nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
                   nombre:=copy(nombre,1,30);

                   filtran.Add('021'+colocaceros(s.FIELDS[0].asstring,18)+
                               'MXP'+colocaceros('80000.00',16)+
                               colocaespacios(nombre,30)+
                               colocaespacios(nombre,30)+
                               '40'+colocaespacios('',80));
                Q.NEXT;
           END;
             rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
             rutaNombre:=elrubrot.text+'.txt';

             CreateDir('c:\Transferencias\');
             CreateDir('c:\Transferencias\'+rutaNom+'\');
             CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
             filtran.SaveToFile('C:\Transferencias\'+rutaNom+'\Layaout\'+rutaNombre);

             if abrir then
             ShellExecute(handle, 'open', PChar('C:\Transferencias\'+rutaNom+'\Layaout\'+rutaNombre), nil, nil, SW_show);
end;


Procedure TFDetalle.exportarSIT;
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
ContFil:integer;
nombFile:String;
grupo:string;
begin
  grupo:=elBancot.Text+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text;
  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  nombFile:=copy(GRUPO,1,21)+'X'+stringReplace(nomfec.TEXT,'/','',[rfReplaceAll])+anio.text+'_PROY_('+elProyT.text+')';
  NOMBFILE:=stringReplace(nombfile,' ','X',[rfReplaceAll]);
  filtran.Add('H'+
               colocaceros(ConvenioSIT.text,9)+
               formatdatetime('yyyy-mm-dd',fecha1sit.date)+
               colocaespacios(nombfile,30)+
               '00'+
               soloespacios(3)+
               soloespacios(35)+
               soloespacios(22)+
               soloespacios(3)+
               soloespacios(141));
         contfil:=0;
         for x:=1 to gridgr.rowcount-1 do
           begin
             nombre:= stringReplace(gridgr.Cells[4,x],'Ñ','N',[rfReplaceAll]);
             nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
             nombre:=copy(nombre,1,40);

             apepat:= stringReplace(gridgr.Cells[5,x],'Ñ','N',[rfReplaceAll]);
             apepat:= stringReplace(apepat,'.','',[rfReplaceAll]);
             apepat:=copy(apepat,1,30);

             apemat:= stringReplace(gridgr.Cells[6,x],'Ñ','N',[rfReplaceAll]);
             apemat:= stringReplace(apemat,'.','',[rfReplaceAll]);
             apemat:=copy(apemat,1,20);


             filtran.Add( 'D'+
                          'A'+
                          colocaespacios('PAGO'+gridgr.cells[1,x],20)+
                          colocaespacios(gridgr.cells[1,x],30)+
                          'PDV'+
                          '1'+
                          Soloespacios(7)+
                          //colocaespacios('PAGO QUINCENA '+stringReplace(NomFec.text,'/','',[rfReplaceAll])+anio.text,40)+
                          soloespacios(40)+
                          COLOCAESPACIOS(copy(nombre+' '+apepat+' '+apemat,1,35),35)+Soloespacios(5)+
                          'M'+
                          'MXP'+
                          colocaceros(stringReplace(gridgr.cells[3,x],'.','',[rfReplaceAll]),15)+
                          '00'+
                          Soloespacios(40)+
                          formatdatetime('yyyy-mm-dd',fecha2sit.date)+
                          formatdatetime('yyyy-mm-dd',fecha3sit.date)+
                          soloespacios(2)+
                          soloespacios(30));
              contFil:=ContFil+1;
           end;

       filtran.Add('T'+
                   colocaceros(inttostr(contFil),5)+
                   colocaceros(stringReplace(totalgr.caption,'.','',[rfReplaceAll]),15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                  soloespacios(5));

       CreateDir('c:\Transferencias\');
       CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
       CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\');
       filtran.SaveToFile('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\'+nombFile+'.TXT');
       ShellExecute(handle, 'open', PChar('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\'+NOMBFILE+'.TXT'), nil, nil, SW_show);
       PSAN.visible:=false;
end;


procedure tfdetalle.ventanaSIT;
begin
         psit.Visible:=true;
         fecha1sit.date:=date;
         fecha2sit.date:=date;
         fecha3sit.date:=date;
         q.close;
         q.sql.text:='SELECT TRAN_CUENTA, TRAN_CONVENIO FROM PTRANBANCOS WHERE TRAN_CLAVE='+#39+'02'+#39;
         q.OPEN;
         Cuentasit.Text:=q.FIELDS[0].ASSTRING;
         CONVENIOsit.Text:=q.FIELDS[1].ASSTRING;


end;

procedure tfdetalle.antesExportarHSBC;
begin
         PHSBC.Visible:=true;
         FECHAHSBC.DATE:=Date;
         REFERENCIAHSBC.TEXT:=COPY('PAGO DE '+stringReplace(RNOMINA.text,'/','',[rfReplaceAll]),1,34);
end;


procedure tfdetalle.exportarSantander;
begin
         psan.Visible:=true;
         fecha1.date:=date;
         fecha2.date:=date;

end;

procedure TFDetalle.genSanClick(Sender: TObject);
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
ContFil:integer;
grupo:string;
rutaNombre:string; rutaNom:string;
elConvenioBanco:string;
LAcuentaBanco:string;

begin

qcta.close;
qcta.sql.text:='select getCuentaBanco('+#39+elRubrot.text+#39+','+
#39+elSfdot.text+#39+','+#39+laareat.text+#39+','+#39+elProyT.text+#39+','+
#39+str_(elbancot.text,'-')+#39+') FROM DUAL ';
qcta.OPEN;
elConvenioBanco:=copy(qcta.fields[0].asstring,1,pos('*',qcta.fields[0].asstring));
LAcuentaBanco:=copy(qcta.fields[0].asstring, pos('*',qcta.fields[0].asstring)+1,length(qcta.fields[0].asstring));


  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  filtran.Add('1'+colocaceros(inttostr(contFil),5)+'E'+
               formatdatetime('mmddyyyy',fecha1.date)+
              colocaespacios(LAcuentaBanco,16)+
              formatdatetime('mmddyyyy',fecha2.date));
  contFil:=ContFil+1;
         for x:=1 to gridgr.rowcount-1 do
           begin
             nombre:= stringReplace(gridgr.Cells[4,x],'Ñ','N',[rfReplaceAll]);
             nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
             nombre:=copy(nombre,1,30);

             apepat:= stringReplace(gridgr.Cells[5,x],'Ñ','N',[rfReplaceAll]);
             apepat:= stringReplace(apepat,'.','',[rfReplaceAll]);
             apepat:=copy(apepat,1,30);

             apemat:= stringReplace(gridgr.Cells[6,x],'Ñ','N',[rfReplaceAll]);
             apemat:= stringReplace(apemat,'.','',[rfReplaceAll]);
             apemat:=copy(apemat,1,20);


             filtran.Add('2'+colocaceros(inttostr(contFil),5)+
                          colocaceros(copy(gridgr.cells[1,x],1,7),7)+
                          colocaespacios(apepat,30)+
                          colocaespacios(apemat,20)+
                          colocaespacios(nombre,30)+
                          colocaespacios(gridgr.cells[0,x],16)+
                          colocaceros(stringReplace(gridgr.cells[3,x],'.','',[rfReplaceAll]),18));
              contFil:=ContFil+1;
           end;

       filtran.Add('3'+colocaceros(inttostr(contFil),5)+
                   colocaceros(inttostr(contFil-2),5)+
                   colocaceros(stringReplace(totalgr.caption,'.','',[rfReplaceAll]),18));

       rutaNom:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
       rutaNombre:= dameNombre('T','.txt',LAcuentaBanco);



       CreateDir('c:\Transferencias\');
       CreateDir('c:\Transferencias\'+rutaNom+'\');
       CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\');
       CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\Santander\');
       CreateDir('c:\Transferencias\'+rutaNom+'\Layaout\Santander\'+elrubrot.text+'\');
       filtran.SaveToFile('c:\Transferencias\'+rutaNom+'\Layaout\Santander\'+elrubrot.text+'\'+rutaNombre);

       if abrirSan then
          ShellExecute(handle, 'open', PChar('c:\Transferencias\'+rutaNom+'\Layaout\Santander\'+elrubrot.text+'\'+rutaNombre), nil, nil, SW_show);
       PSAN.visible:=false;
end;

procedure TFDetalle.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  PSAN.Visible:=false;
end;




procedure TFDetalle.BuscaNominas;

begin
   q.close;
   q.sql.text:='';
   if (str_(tipo.text,'-')='O') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39+ ' AND NOMI_TIPO<>'+#39+'C'+#39;
   if (str_(tipo.text,'-')='C') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39+ ' AND NOMI_TIPO='+#39+'C'+#39;
   if str_(tipo.text,'-')='H' then
       q.sql.text:='SELECT * FROM PHNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39;
   if str_(tipo.text,'-')='N' then
       q.sql.text:='SELECT * FROM PNNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39;
   if str_(tipo.text,'-')='V' then
       q.sql.text:='SELECT * FROM PINOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39;
   if q.sql.text<>'' then
      begin
          q.OPEN;
          nomina.clear;

           while not(q.eof) do
              begin
                 nomina.Items.Add(q.fields[0].asstring);
                 q.next;
              end;
      end;
   nomina.text:=NOMINA.Items[0];
   NOMINAChange(nil);
   
end;


procedure TFDetalle.NomFecChange(Sender: TObject);
begin
  inherited;
  fechagen:=NomFec.text+'/'+ANIO.TEXT;
  BuscaNominas;
end;


procedure TFDetalle.GNomSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
Ling:=aROW;
colg:=aCOL;

end;

procedure TFDetalle.gridDblClick(Sender: TObject);
begin
  inherited;
  exportarGrXLS(grid);
end;

procedure TFDetalle.GridNDblClick(Sender: TObject);
begin
  inherited;
//  exportarGrXLS(gridN);
//rep.Text:=gridN.Cells[0,ling];
//ImprimeRep(true);


end;

procedure TFDetalle.GridBDblClick(Sender: TObject);
begin
  inherited;
  exportarGrXLS(gridB);
end;

procedure TFDetalle.bbancomerClick(Sender: TObject);
begin
  inherited;
 exportaRbancomer(true);
end;

procedure TFDetalle.bsantanderClick(Sender: TObject);
begin
  inherited;
  abrirSan:=true;
  genSan.Enabled:=true;
  exportaRsantander;

end;

procedure TFDetalle.bhsbcClick(Sender: TObject);
begin
  inherited;

  exportarHSBC(true);


end;

procedure TFDetalle.bsitClick(Sender: TObject);
begin
  inherited;
ventanaSIT;
end;

procedure TFDetalle.SpeedButton7Click(Sender: TObject);
begin
  inherited;
PSIt.VISIBLE:=FALSE;
end;

procedure TFDetalle.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  exportarSIT;
  psit.Visible:=false;
end;

procedure TFDetalle.GridNSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
   Ling:=Arow;
end;

procedure TFDetalle.GenerarReporte1Click(Sender: TObject);
begin
  inherited;
//rep.Text:=gridN.Cells[0,ling];
//ImprimeRep(true);
end;



function TFDETALLE.esPorInterBancaria:string;
begin
    S.CLOSE;
    S.sql.text:='select TRAN_BANCOORI from PTRANEXCEPT WHERE '+
    'TRAN_RUBRO='+#39+elrubrot.text+#39+
    ' AND TRAN_BANCO='+#39+str_(elbancot.text,'-')+#39+
    ' AND TRAN_AREA='+#39+laAReat.text+#39+
    ' AND TRAN_SFDO='+#39+elsfdot.text+#39+
    ' AND TRAN_PROYECTO='+#39+elproyt.TEXT+#39;
    savetofilelog(s.sql.text);
    S.open;
    esPorInterBancaria:=S.FIELDS[0].asstring;
end;

procedure TFDETALLE.procesaInterbancaria(BANCO:string);
begin
 { if banco='01' then
     interbancaria de HSBC       }

  if banco='02' then
     exportarBancomerTransfer(false,'BANCOMER');

  {if banco='03' then
     interbancaria de SANTANDER  }

end;


procedure TFDetalle.GenerarLayaout(Banco:String);
var
x:integer;
caddj:string;
interbanco:string;
begin
  inherited;

seraDJT.Checked:=false;
for x:=1 to 2 do
   begin
      if x=1 then cadDJ:=' AND S.EMPL NOT LIKE '+#39+'DJ%'+#39 ;
      if x=2 then begin cadDJ:=' AND S.EMPL LIKE '+#39+'DJ%'+#39; seraDJT.Checked:=TRUE; end;

      Q.close;
      q.sql.text:='SELECT COUNT(*) FROM (select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.descrip),'+
      #39+'%'+#39+
      '  from pvtransfernom s, PCONTBANCTRANS t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      caddj+
      ' and s.BANCO=t.clave(+)'+
      ' and s.banco='+#39+STR_(banco,'-')+#39+
       ' UNION '+
      ' SELECT DISTINCT(RUBRO),SFDO,AREA, BANCO, A.BANCO_D, B.TRAN_PROYECTO'+
      ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+
      ' and a.banco='+#39+STR_(banco,'-')+#39+
      ' and a.RUBRO||a.SFDO||a.AREA||a.BANCO =b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco)';
      Q.open;
      
      barra.Position:=0;
      barra.Max:=q.fields[0].asinteger;

      Q.close;
      q.sql.text:='select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.descrip),'+
      #39+'%'+#39+
      '  from pvtransfernom s, PCONTBANCTRANS t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      caddj+
      ' and s.BANCO=t.clave(+)'+
      ' and s.banco='+#39+STR_(banco,'-')+#39+
       ' UNION '+
      ' SELECT DISTINCT(RUBRO),SFDO,AREA, BANCO, A.BANCO_D, B.TRAN_PROYECTO'+
      ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+
      ' and a.banco='+#39+STR_(banco,'-')+#39+
      ' and a.RUBRO||a.SFDO||a.AREA||a.BANCO =b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco';
      savetofilelog(q.sql.text);
      q.open;


      while not(q.eof) do
         begin
            elrubrot.text:=q.fields[0].asstring;
            elsfdot.text:=q.fields[1].asstring;
            laareat.text:=q.fields[2].asstring;
            elbancot.text:=q.fields[3].asstring+'-'+q.fields[4].asstring;
            elproyt.text:=q.fields[5].asstring;

            sacaReportest;


            if gridgr.cells[0,1]<>'' then
               begin
                    interbanco:=esPorInterBancaria;

                    if interbanco='' then
                       begin
                            if banco='01' then
                              begin
                                 abrirHSBC:=FALSE;
                                 ExportarHSBC(false);
                              end;

                            if banco='01-NEW' then
                              begin
                                 abrirHSBC:=FALSE;
                                 ExportarHSBCNEW(false);
                              end;

                            if banco='01-NEW2017' then
                              begin
                                 abrirHSBC:=FALSE;
                                 ExportarHSBC2017(false,'');
                              end;

                            if banco='01-NEWTXT' then
                              begin
                                 abrirHSBC:=FALSE;
                                 ExportarHSBCNEWtxt(false);
                              end;

                           //Para archivo de 02 - Bancomer
                           if banco='02' then
                                  exportarBancomer(false);

                           //Para archivo de 03 - Santander
                           if banco='03' then
                              begin
                                 abrirSan:=false;
                                 genSanClick(nil);
                              end;
                        end
                    else
                        procesaInterbancaria(interbanco);
               end;
             q.next;
             barra.Position:=barra.Position+1;
         end; //While
    end;  //for 1 a 2
end;


procedure TFDetalle.GenerarTodosHSBC1Click(Sender: TObject);

begin
  inherited;
GenerarLayaout('01');
end;

procedure TFDetalle.GenerartodosSantander1Click(Sender: TObject);

begin
  inherited;


end;


//--------------------------ACOMODAR LOS GRUPOS TRANSFERENCIAS -----------------------------------------

procedure TFDetalle.ConfigurarSantander1Click(Sender: TObject);
begin
  inherited;
  exportarSantander;
  genSan.enabled:=false;
end;

procedure TFDetalle.GenerartodosSantanderClick(Sender: TObject);
begin
  inherited;
GenerarLayaout('03');

end;



procedure TFDetalle.ANIOChange(Sender: TObject);
begin
  inherited;
fechagen:=NomFec.text+'/'+ANIO.TEXT;
BuscaNominas;
end;


procedure TFDETALLE.CARGAcUADRES;
var
x:integer;
begin
  q.close;
     q.sql.text:='select DECODE(s.BANCO,NULL,'+#39+'99'+#39+',S.BANCO),'+
     'DECODE( s.BANCO_D,NULL,'+#39+'CHEQUE EFECTIVO'+#39+',S.BANCO_D), sum(s.MONTO)  '+
     ' from pvtransfernom s where s.NOMINA='+#39+nomina.text+#39+
     ' and s.EMPL not like '+#39+'DJ%'+#39+
     ' GROUP BY s.BANCO, s.BANCO_D order by 1';
     q.open;
     limpiaGrid(grid);
     grid.rowcount:=2;
     while not(q.eof) do
        begin
           grid.Cells[0,grid.rowcount-1]:=q.fields[0].asstring+'-'+q.fields[1].asstring;
           grid.Cells[1,grid.rowcount-1]:=formatfloat('#0,0.00',q.fields[2].asfloat);
           q.next;
           grid.rowcount:=grid.rowcount+1;
        end;
     grid.rowcount:=grid.rowcount-1;
     totalg.caption:='Total General:    '+formatfloat('#0,0.00',sumacolgrid(grid,1));
     try grid.FixedRows:=1; except end;

     //quitando las cancelaciones
     q.close;
     q.sql.text:='select DECODE(s.BANCO,NULL,'+#39+'99'+#39+',S.BANCO),'+
     'DECODE( s.BANCO_D,NULL,'+#39+'CHEQUE EFECTIVO'+#39+',S.BANCO_D), sum(s.MONTO)  '+
     ' from pvtransfernom s where s.NOMINA='+#39+nomina.text+#39+
     ' and s.EMPL not like '+#39+'DJ%'+#39+' AND S.CANCELADO='+#39+'N'+#39+
     ' GROUP BY s.BANCO, s.BANCO_D order by 1';
     q.open;
      x:=1;
     while not(q.eof) do
        begin
           grid.Cells[2,x]:=formatfloat('#0,0.00',q.fields[2].asfloat);
           x:=x+1;
           q.next;
        end;
     totalgSC.caption:=formatfloat('#0,0.00',sumacolgrid(grid,2));


     q.close;
     q.sql.text:='select DECODE(s.BANCO,NULL,'+#39+'99'+#39+',S.BANCO),'+
     'DECODE( s.BANCO_D,NULL,'+#39+'CHEQUE EFECTIVO'+#39+',S.BANCO_D), sum(s.MONTO)  '+
     ' from pvtransfernom s where s.NOMINA='+#39+nomina.text+#39+
     ' and s.EMPL  like '+#39+'DJ%'+#39+
     ' GROUP BY s.BANCO, s.BANCO_D order by 1';
     q.open;
     limpiaGrid(gridDJ);
     gridDJ.rowcount:=2;
     while not(q.eof) do
        begin
           gridDJ.Cells[0,gridDJ.rowcount-1]:=q.fields[0].asstring+'-'+q.fields[1].asstring;
           gridDJ.Cells[1,gridDJ.rowcount-1]:=formatfloat('#0,0.00',q.fields[2].asfloat);
           q.next;
           gridDJ.rowcount:=gridDJ.rowcount+1;
        end;
     gridDJ.rowcount:=gridDJ.rowcount-1;
     totalDJ.caption:='Total General:    '+formatfloat('#0,0.00',sumacolgrid(gridDJ,1));
     try gridDj.FixedRows:=1; except end;

     //quitando DJ CANCELADOS
     q.close;
     q.sql.text:='select DECODE(s.BANCO,NULL,'+#39+'99'+#39+',S.BANCO),'+
     'DECODE( s.BANCO_D,NULL,'+#39+'CHEQUE EFECTIVO'+#39+',S.BANCO_D), sum(s.MONTO)  '+
     ' from pvtransfernom s where s.NOMINA='+#39+nomina.text+#39+
     ' and s.EMPL  like '+#39+'DJ%'+#39+
     ' AND S.CANCELADO='+#39+'N'+#39+
     ' GROUP BY s.BANCO, s.BANCO_D order by 1';
     q.open;
     X:=1;
     while not(q.eof) do
        begin

           gridDJ.Cells[2,X]:=formatfloat('#0,0.00',q.fields[2].asfloat);
           q.next;
           X:=X+1;
        end;
     gridDJ.rowcount:=gridDJ.rowcount-1;
     totalDJsc.caption:=formatfloat('#0,0.00',sumacolgrid(gridDJ,2));


end;

procedure TFDetalle.TabOpChange(Sender: TObject);
var
x:integer;
begin
  inherited;

if TabOp.ActivePageIndex=1 then
   begin

   q.close;
      q.sql.text:='SELECT DISTINCt(RUBRO) FROM PVTRANSFERNOM WHERE NOMINA='+#39+Nomina.text+#39;
      Q.open;
      ELRUBROt.Clear;
      while not(q.eof) do
        begin
           elrubrot.Items.Add(q.fields[0].asstring);
           q.next;
        end;

      q.close;
      q.sql.text:='SELECT DISTINCT(S.AREA)  FROM PCONTURESDIV S';
      Q.open;
      laAreat.Clear;
      while not(q.eof) do
        begin
           laAreat.Items.Add(q.fields[0].asstring);
           q.next;
        end;

   end;


end;

procedure TFDetalle.GridDJDblClick(Sender: TObject);
begin
  inherited;
  exportarGrXLS(gridDj);
end;

procedure TFDetalle.BancoCuadChange(Sender: TObject);
var
x:integer;
cadDJ:string;
CadCancel:string;
cadProy:string;
CadExc:string;
begin
  inherited;

  if esDJcUAD.Checked THEN CadDJ:=' AND EMPL  LIKE '+#39+'DJ%'+#39
  else   CadDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;

  cadCancel:='';
  if cancelc.Checked THEN CadCancel:=' AND CANCELADO='+#39+'N'+#39;



  q.close;
  q.sql.text:='SELECT DISTINCT(RUBRO),SFDO,AREA,'+#39+'%'+#39+
  'FROM PVTRANSFERNOM WHERE NOMINA='+#39+nomina.text+#39+' AND  DECODE(BANCO,NULL,'+#39+'99'+#39+',BANCO)='+
  #39+str_(bancoCuad.text,'-')+#39+
  ' union '+
  ' SELECT DISTINCT(RUBRO),SFDO,AREA, b.tran_proyecto '+
  ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+' AND  DECODE(BANCO,NULL,'+#39+'99'+#39+',BANCO)='+
  #39+str_(bancoCuad.text,'-')+#39+
  ' and a.RUBRO||a.SFDO||a.AREA||a.BANCO = b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco';
  savetofilelog(q.sql.text);
  q.open;
  limpiagrid(gridb);
  gridb.rowcount:=2;
  while not (q.eof) do
    begin
       gridb.cells[0,gridb.rowcount-1]:=q.fields[0].asstring;
       gridb.cells[1,gridb.rowcount-1]:=q.fields[1].asstring;
       gridb.cells[2,gridb.rowcount-1]:=q.fields[2].asstring;
       gridb.cells[3,gridb.rowcount-1]:=q.fields[3].asstring;
       gridb.rowcount:=gridb.rowcount+1;
       q.next;
    end;
  gridb.rowcount:=gridb.rowcount-1;
  barra.position:=0;
  barra.max:=gridB.rowcount-1;
  for x:=1 to gridB.rowcount-1 do
     begin
        cadProy:='';
        if gridb.cells[3,x]='%' then
           cadProy:=' AND PROY NOT IN (SELECT TRAN_PROYECTO FROM PTRANEXCEPT x WHERE '+
                                        '  X.TRAN_RUBRO='+#39+GRIDb.CELLS[0,X]+#39+
                                        ' AND X.TRAN_BANCO='+#39+str_(bancoCuad.text,'-')+#39+
                                        ' AND X.TRAN_SFDO='+#39+GRIDb.CELLS[1,X]+#39+
                                        ' AND X.TRAN_AREA='+#39+GRIDb.CELLS[2,X]+#39+') '
        else
           cadProy:=' AND PROY='+#39+GRIDb.CELLS[3,X]+#39;


       if excluidosc.checked then
          cadExc:=' AND EMPL IN (SELECT DD.EMPL FROM ptransexcluir DD WHERE DD.nomina='+#39+NOMINA.text+#39+
                         ' AND DD.RUBRO ='+#39+GRIDb.CELLS[0,X]+#39+') '
       else
          cadExc:=' AND EMPL not IN (SELECT DD.EMPL FROM ptransexcluir DD WHERE DD.nomina='+#39+NOMINA.text+#39+
                         ' AND DD.RUBRO ='+#39+GRIDb.CELLS[0,X]+#39+') ';


        q.close;
        q.sql.text:='SELECT SUM(MONTO) FROM PVTRANSFERNOM WHERE '+
        'NOMINA='+#39+NOMINA.TEXT+#39+
        ' AND RUBRO='+#39+GRIDb.CELLS[0,X]+#39+
        ' AND SFDO='+#39+GRIDb.CELLS[1,X]+#39+
        ' AND AREA='+#39+GRIDb.CELLS[2,X]+#39+
        cadProy+CadExc+

        ' AND DECODE(BANCO,null,'+#39+'99'+#39+',banco)='+#39+STR_(bancoCuad.text,'-')+#39+
        CADDJ+' '+cadCancel;
        savetofilelog(q.sql.text);
        Q.open;
        gridB.cells[4,x]:=formatfloat('#,#0.00',q.Fields[0].asfloat);
        barra.Position:=barra.Position+1;
     end;
  totalrep.caption:=formatfloat('#,#0.00',sumacolgrid(gridB,4));
  barra.Position:=0;
  progr.Position:=0;
end;

procedure TFDetalle.GridBSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
Ling:=Arow;
ColG:=Acol;

end;

procedure TFDetalle.elRubroTChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT DISTINCt(SFDO) FROM PVTRANSFERNOM WHERE NOMINA='+#39+Nomina.text+#39+
      ' AND RUBRO='+#39+elRUBROt.TEXT+#39;
      Q.open;
      elSfdot.Clear;
      while not(q.eof) do
        begin
           elSfdot.Items.Add(q.fields[0].asstring);
           q.next;
        end;
        

end;

procedure TFDetalle.elSfdoTChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT DISTINCt(area) FROM PVTRANSFERNOM WHERE NOMINA='+#39+Nomina.text+#39+
      ' AND RUBRO='+#39+elRUBROt.TEXT+#39+
      ' AND SFDO='+#39+elSfdot.text+#39;
      savetofilelog(q.sql.text);
      Q.open;
      laAreat.Clear;
      while not(q.eof) do
        begin
           laAreat.Items.Add(q.fields[0].asstring);
           q.next;
        end;


end;

procedure TFDetalle.laAreaTChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT DISTINCT(A.BANCO), B.descrip  from pvtransfernom a, PCONTBANCTRANS B WHERE '+
      ' A.BANCO=B.clave AND NOMINA='+#39+Nomina.text+#39+
      ' AND RUBRO='+#39+elRUBROt.TEXT+#39+
      ' AND SFDO='+#39+elSfdot.text+#39+
      ' AND AREA='+#39+laAreat.text+#39;
      savetofilelog(q.sql.text);
      Q.open;
      elBancot.Clear;
      while not(q.eof) do
        begin
           elBancot.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
           q.next;
        end;
      elBancot.Items.Add('99-CHEQUE EFECTIVO');



end;

procedure TFDetalle.GenerarTodasTransferencias1Click(Sender: TObject);
begin
  inherited;
GenerarLayaout('02');
end;

procedure TFDetalle.SpeedButton4Click(Sender: TObject);
var
resp:TstringGrid;
x, y:integer;
begin
  inherited;
  resp:=TstringGrid.Create(nil);
  resp.Parent:=tabOp;
  resp.ColCount:=gridgr.ColCount;
  resp.RowCount:=2;
  RESP.Visible:=FALSE;
  for x:=1 to gridgr.rowCount-1 do
      begin
         if gridgr.cells[gridgr.colcount-1, x]='X' then
            begin
                for y:=0 to gridgr.ColCount-1 do
                   resp.cells[y,resp.rowcount-1]:=gridgr.cells[y,x];
                resp.rowcount:=resp.rowcount+1;
           end;
      end;
  if resp.rowcount>2 then
     resp.rowcount:=resp.rowcount-1;
  limpiagrid(gridgr);
  gridgr.Rowcount:=2;
  for x:=1 to resp.RowCount-1 do
     begin
         for y:=0 to resp.colcount-1 do
           gridgr.Cells[y,gridgr.rowcount-1]:=resp.cells[y,x];
         gridgr.rowcount:= gridgr.rowcount+1;
     end;
  if gridgr.rowcount>2 then
     gridgr.rowcount:=gridgr.rowcount-1;
  resp.Destroy;

  totalGR.caption:=formatfloat('#00.00',sumacolGrid(gridGr,3));
  Sortgrid(GRIDGR,2,1);

end;

procedure TFDetalle.elBancoTChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT TRAN_PROYECTO  from PTRANEXCEPT a WHERE '+
      ' A.TRAN_BANCO='+#39+str_(elBancot.text,'-')+#39+
      ' AND TRAN_RUBRO='+#39+elRUBROt.TEXT+#39+
      ' AND TRAN_SFDO='+#39+elSfdot.text+#39+
      ' AND TRAN_AREA='+#39+laAreat.text+#39;
      savetofilelog(q.sql.text);
      Q.open;
      elProyt.Clear;
      elProyt.Items.Add('%');
      while not(q.eof) do
        begin
           ELpROYt.Items.Add(q.fields[0].asstring);
           q.next;
        end;
end;

procedure TFDetalle.genHSBCClick(Sender: TObject);
begin
  inherited;
  exportaRHSBCNew(true);
  phsbc.Visible:=false;
end;

procedure TFDetalle.SpeedButton9Click(Sender: TObject);
begin
  inherited;
PHSBC.Visible:=FALSE;
end;

procedure TFDetalle.ConfigurarHSBC1Click(Sender: TObject);
begin
  inherited;

   antesExportarHSBC;
   genHSBC.Enabled:=FALSE;
   genhsbctxt.Enabled:=FALSE;
end;

procedure TFDetalle.GenerarTodosHSBCNuevo1Click(Sender: TObject);
begin
  inherited;
if (referenciahsbc.Text<>'') then
    GenerarLayaout('01-NEW')
else
   showmessage('No se ha conigurado los datos para transferencia HSBC');
end;

procedure TFDetalle.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  genhsbctxt.Enabled:=true;
  genhsbc.Enabled:=true;
  antesExportarHSBC;

end;

procedure TFDetalle.genHSBCtxtClick(Sender: TObject);
begin
  inherited;
   exportarHSBCNewTxt(true);


end;

procedure TFDetalle.GenerartodosHSBCNuevotxt1Click(Sender: TObject);
begin
  inherited;
if (referenciahsbc.Text<>'') then
   GenerarLayaout('01-NEWTXT')
else
   showmessage('No se ha configurado los datos para transferencia HSBC');
end;

function TFDEtalle.dameCtaBanco(xrubro:string;xsfdo:string;xarea:string;xproy:string;xbanco:string):string;
var
NameProc:string;
begin
      nameProc:='getCuentaBanco';
      if (xbanco='02') OR (xbanco='99')  then nameProc:='getCuentaBancoSinMsg';

        qcta.close;
        qcta.sql.text:='select '+nameProc+'('+#39+xrubro+#39+','+
        #39+xsfdo+#39+','+#39+xarea+#39+','+#39+xproy+#39+','+
        #39+xbanco+#39+') FROM DUAL ';
        qcta.OPEN;

        //elConvenioBanco:=copy(qcta.fields[0].asstring,1,pos('*',qcta.fields[0].asstring));
        dameCtaBanco:=copy(qcta.fields[0].asstring, pos('*',qcta.fields[0].asstring)+1,length(qcta.fields[0].asstring));

end;

procedure TFdetalle.FormatoCelda(hoja:TExcelWorksheet;lin:integer;col:integer; color:integer);
begin
  hoja.Cells.Item[lin,col].Borders[xlTop].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlLeft].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlRight].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlBottom].weight := xlThin;
  Hoja.Cells.Item[lin,col].Interior.ColorIndex :=color;
end;


procedure TFdetalle.FormatoTitulo(hoja:TExcelWorksheet;lin:integer;col:integer);
begin
  hoja.Cells.Item[lin,col].Borders[xlTop].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlLeft].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlRight].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlBottom].weight := xlThin;
  Hoja.Cells.Item[lin,col].HorizontalAlignment:=-4108;
  Hoja.Cells.Item[lin,col].Font.Bold:=true;
  Hoja.Cells.Item[lin,col].Interior.ColorIndex :=35;
end;

procedure TFdetalle.ColocaBorde(hoja:TExcelWorksheet;lin:integer;col:integer);
begin
  hoja.Cells.Item[lin,col].Borders[xlTop].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlLeft].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlRight].weight := xlThin;
  hoja.Cells.Item[lin,col].Borders[xlBottom].weight := xlThin;
end;


function TFDETALLE.nombreBanco(banco:string):string;
begin
    if banco='01' then
       nombreBanco:='HSBC';
    if banco='02' then
       nombreBanco:='BANCOMER';
    if banco='03' then
       nombreBanco:='SANTANDER';
end;

procedure TFDetalle.ExportaCuadre;
var
cadCancel:string;
id:integer;
laures:string;
Subtotal, total:real;
x,lin:integer;
lacta:string;
elNombre,LAcuentaBanco,laNominaes:String;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
interBanco:string;
begin


  laNominaes:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);

  CreateDir('c:\Transferencias\');
  CreateDir('c:\Transferencias\'+laNominaes+'\');

  try deletefile('c:\Transferencias\'+laNominaes+'\Cuadre'+bancoCuad.Text+'.xlsx'); except end;
  CrearFile('c:\Transferencias\'+laNominaes+'\Cuadre'+bancoCuad.Text+'.xlsx');

  ExcelApplication1:=TExcelApplication.create(nil);
  ExcelWorkbook1:= TExcelWorkbook.create(nil);
  ExcelWorksheet1:=TExcelWorksheet.create(nil);


  ExcelApplication1.Workbooks.Open('c:\Transferencias\'+laNominaes+'\Cuadre'+bancoCuad.Text+'.xlsx',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  barra.Max:=gridb.rowcount-1;
  barra.Position:=0;

  //EL TITULO DE EXCEL


  ExcelWorksheet1.Range['A1', 'F1'].MergeCells := true;
  FormatoTitulo(ExcelWorksheet1,1,1);
  ExcelWorksheet1.Cells.Item[1,1].value:='REPORTE '+bancoCuad.Text;



  lin:=2;
  //SUBTITULO DEL REPORTE

  ExcelWorksheet1.Range['A2', 'F2'].MergeCells := true;
  FormatoTitulo(ExcelWorksheet1,lin,1);
  ExcelWorksheet1.Cells.Item[lin,1].value:='NOMINA '+RNOMINA.TEXT;


  lin:=lin+1;
  FormatoTitulo(ExcelWorksheet1,lin,1);
  ExcelWorksheet1.Cells.Item[lin,1].value:='Nombre_Reporte';

  FormatoTitulo(ExcelWorksheet1,lin,2);
  ExcelWorksheet1.Cells.Item[lin,2].value:='Tipo_Puesto';

  FormatoTitulo(ExcelWorksheet1,lin,3);
  ExcelWorksheet1.Cells.Item[lin,3].value:='Sfdo';

  FormatoTitulo(ExcelWorksheet1,lin,4);
  ExcelWorksheet1.Cells.Item[lin,4].value:='Area';

  FormatoTitulo(ExcelWorksheet1,lin,5);
  ExcelWorksheet1.Cells.Item[lin,5].value:='Cuenta';

  FormatoTitulo(ExcelWorksheet1,lin,6);
  ExcelWorksheet1.Cells.Item[lin,6].value:='Monto';
  lin:=lin+1;

 //Exportamos todos los rubros
  subtotal:=0;
  for x:=1 to gridb.rowcount-1 do
     begin
        if (gridb.cells[0,x]<>'BECARIOS') and  (gridb.cells[0,x]<>'PYJ SINDICALIZADO') and (gridb.cells[0,x]<>'BECARIOS NG')
            and (gridb.cells[0,x]<>'PYJ DOCENTE') and (gridb.cells[0,x]<>'PYJ CONFIANZA') AND (gridb.cells[0,x]<>'ESDEPED BECARIOS')
          then
           begin
                elrubrot.text:=gridb.cells[0,x];
                elsfdot.text:=gridb.cells[1,x];
                laareat.text:=gridb.cells[2,x];
                elbancot.text:=bancoCuad.Text;
                elproyt.text:=gridb.cells[3,x];


                interBanco:=esPorInterBancaria;
                if interBanco='' then
                   begin
                     LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,str_(elbancot.text,'-'));
                     elNombre:=dameNombre('C','.txt',LAcuentaBanco);
                   end
                else
                   begin
                     LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,interbanco);
                     elNombre:=nombreBanco(interbanco)+'-'+dameNombre('T','.txt',LAcuentaBanco);
                   end;

                colocaBorde(ExcelWorksheet1,lin,1);
                ExcelWorksheet1.Cells.Item[lin,1].value:=elNombre;

                colocaBorde(ExcelWorksheet1,lin,2);
                ExcelWorksheet1.Cells.Item[lin,2].value:=elrubrot.text;

                colocaBorde(ExcelWorksheet1,lin,3);
                ExcelWorksheet1.Cells.Item[lin,3].value:=elsfdot.text;

                colocaBorde(ExcelWorksheet1,lin,4);
                ExcelWorksheet1.Cells.Item[lin,4].value:=laAreat.text;

                colocaBorde(ExcelWorksheet1,lin,5);
                ExcelWorksheet1.Cells.Item[lin,5].value:=LAcuentaBanco;

                colocaBorde(ExcelWorksheet1,lin,6);
                ExcelWorksheet1.Cells.Item[lin,6].numberformat:='$#,##0.00';
                ExcelWorksheet1.Cells.Item[lin,6].Font.Bold:=true;
                ExcelWorksheet1.Cells.Item[lin,6].value:=gridb.cells[4,x];
                subtotal:=subtotal+ strtofloat(stringreplace(gridb.cells[4,x],',','',[rfReplaceAll]));
                lin:=lin+1;
                 barra.Position:=barra.position+1;
          end;
     end;
     ExcelWorksheet1.Cells.Item[lin,6].Interior.ColorIndex :=37;
     ExcelWorksheet1.Cells.Item[lin,5].Font.Bold:=true;
     ExcelWorksheet1.Cells.Item[lin,5].value:='Total';

     ExcelWorksheet1.Cells.Item[lin,6].Interior.ColorIndex :=37;
     ExcelWorksheet1.Cells.Item[lin,6].numberformat:='$#,##0.00';
     ExcelWorksheet1.Cells.Item[lin,6].Font.Bold:=true;
     ExcelWorksheet1.Cells.Item[lin,6].value:=floattostr(subtotal);


     //=====================Exportamos rubros Becarios ============================
     lin:=lin+3;

  ExcelWorksheet1.Range['A'+inttostr(lin), 'F'+inttostr(lin)].MergeCells := true;
  FormatoTitulo(ExcelWorksheet1,lin,1);
  ExcelWorksheet1.Cells.Item[lin,1].value:='BECARIOS';


  lin:=lin+1;
  FormatoTitulo(ExcelWorksheet1,lin,1);
  ExcelWorksheet1.Cells.Item[lin,1].value:='Nombre_Reporte';

  FormatoTitulo(ExcelWorksheet1,lin,2);
  ExcelWorksheet1.Cells.Item[lin,2].value:='Tipo_Puesto';

  FormatoTitulo(ExcelWorksheet1,lin,3);
  ExcelWorksheet1.Cells.Item[lin,3].value:='Sfdo';

  FormatoTitulo(ExcelWorksheet1,lin,4);
  ExcelWorksheet1.Cells.Item[lin,4].value:='Area';

  FormatoTitulo(ExcelWorksheet1,lin,5);
  ExcelWorksheet1.Cells.Item[lin,5].value:='Cuenta';

  FormatoTitulo(ExcelWorksheet1,lin,6);
  ExcelWorksheet1.Cells.Item[lin,6].value:='Monto';
  lin:=lin+1;

 //Exportamos todos los rubros
  subtotal:=0;
  for x:=1 to gridb.rowcount-1 do
     begin
        if (gridb.cells[0,x]='BECARIOS') or (gridb.cells[0,x]='BECARIOS NG') or (gridb.cells[0,x]='ESDEPED BECARIOS') then
           begin
                elrubrot.text:=gridb.cells[0,x];
                elsfdot.text:=gridb.cells[1,x];
                laareat.text:=gridb.cells[2,x];
                elbancot.text:=bancoCuad.Text;
                elproyt.text:=gridb.cells[3,x];

                interBanco:=esPorInterBancaria;
                if interBanco='' then
                   begin
                     LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,str_(elbancot.text,'-'));
                     elNombre:=dameNombre('C','.txt',LAcuentaBanco);
                   end
                else
                   begin
                     LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,interbanco);
                     elNombre:=nombreBanco(interbanco)+'-'+dameNombre('T','.txt',LAcuentaBanco);
                   end;

                colocaBorde(ExcelWorksheet1,lin,1);
                ExcelWorksheet1.Cells.Item[lin,1].value:=elNombre;

                colocaBorde(ExcelWorksheet1,lin,2);
                ExcelWorksheet1.Cells.Item[lin,2].value:=elrubrot.text;

                colocaBorde(ExcelWorksheet1,lin,3);
                ExcelWorksheet1.Cells.Item[lin,3].value:=elsfdot.text;

                colocaBorde(ExcelWorksheet1,lin,4);
                ExcelWorksheet1.Cells.Item[lin,4].value:=laAreat.text;

                colocaBorde(ExcelWorksheet1,lin,5);
                ExcelWorksheet1.Cells.Item[lin,5].value:=LAcuentaBanco;

                colocaBorde(ExcelWorksheet1,lin,6);
                ExcelWorksheet1.Cells.Item[lin,6].numberformat:='$#,##0.00';
                ExcelWorksheet1.Cells.Item[lin,6].Font.Bold:=true;
                ExcelWorksheet1.Cells.Item[lin,6].value:=gridb.cells[4,x];
                subtotal:=subtotal+ strtofloat(stringreplace(gridb.cells[4,x],',','',[rfReplaceAll]));
                lin:=lin+1;
                 barra.Position:=barra.position+1;
          end;
     end;
     ExcelWorksheet1.Cells.Item[lin,6].Interior.ColorIndex :=37;
     ExcelWorksheet1.Cells.Item[lin,5].Font.Bold:=true;
     ExcelWorksheet1.Cells.Item[lin,5].value:='Total';

     ExcelWorksheet1.Cells.Item[lin,6].Interior.ColorIndex :=37;
     ExcelWorksheet1.Cells.Item[lin,6].numberformat:='$#,##0.00';
     ExcelWorksheet1.Cells.Item[lin,6].Font.Bold:=true;
     ExcelWorksheet1.Cells.Item[lin,6].value:=floattostr(subtotal);



  //=====================Exportamos rubros jubilados ============================
     lin:=lin+3;

  ExcelWorksheet1.Range['A'+inttostr(lin), 'F'+inttostr(lin)].MergeCells := true;
  FormatoTitulo(ExcelWorksheet1,lin,1);
  ExcelWorksheet1.Cells.Item[lin,1].value:='JUBILADOS Y PENSIONADOS';


  lin:=lin+1;
  FormatoTitulo(ExcelWorksheet1,lin,1);
  ExcelWorksheet1.Cells.Item[lin,1].value:='Nombre_Reporte';

  FormatoTitulo(ExcelWorksheet1,lin,2);
  ExcelWorksheet1.Cells.Item[lin,2].value:='Tipo_Puesto';

  FormatoTitulo(ExcelWorksheet1,lin,3);
  ExcelWorksheet1.Cells.Item[lin,3].value:='Sfdo';

  FormatoTitulo(ExcelWorksheet1,lin,4);
  ExcelWorksheet1.Cells.Item[lin,4].value:='Area';

  FormatoTitulo(ExcelWorksheet1,lin,5);
  ExcelWorksheet1.Cells.Item[lin,5].value:='Cuenta';

  FormatoTitulo(ExcelWorksheet1,lin,6);
  ExcelWorksheet1.Cells.Item[lin,6].value:='Monto';
  lin:=lin+1;

 //Exportamos todos los rubros
  subtotal:=0;
  for x:=1 to gridb.rowcount-1 do
     begin
        if (gridb.cells[0,x]='PYJ SINDICALIZADO') or (gridb.cells[0,x]='PYJ CONFIANZA') or (gridb.cells[0,x]='PYJ DOCENTE') then
           begin
                elrubrot.text:=gridb.cells[0,x];
                elsfdot.text:=gridb.cells[1,x];
                laareat.text:=gridb.cells[2,x];
                elbancot.text:=bancoCuad.Text;
                elproyt.text:=gridb.cells[3,x];

                interBanco:=esPorInterBancaria;
                if interBanco='' then
                   begin
                     LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,str_(elbancot.text,'-'));
                     elNombre:=dameNombre('C','.txt',LAcuentaBanco);
                   end
                else
                   begin
                     LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,interbanco);
                     elNombre:=nombreBanco(interbanco)+'-'+dameNombre('T','.txt',LAcuentaBanco);
                   end;

                colocaBorde(ExcelWorksheet1,lin,1);
                ExcelWorksheet1.Cells.Item[lin,1].value:=elNombre;

                colocaBorde(ExcelWorksheet1,lin,2);
                ExcelWorksheet1.Cells.Item[lin,2].value:=elrubrot.text;

                colocaBorde(ExcelWorksheet1,lin,3);
                ExcelWorksheet1.Cells.Item[lin,3].value:=elsfdot.text;

                colocaBorde(ExcelWorksheet1,lin,4);
                ExcelWorksheet1.Cells.Item[lin,4].value:=laAreat.text;

                colocaBorde(ExcelWorksheet1,lin,5);
                ExcelWorksheet1.Cells.Item[lin,5].value:=LAcuentaBanco;

                colocaBorde(ExcelWorksheet1,lin,6);
                ExcelWorksheet1.Cells.Item[lin,6].numberformat:='$#,##0.00';
                ExcelWorksheet1.Cells.Item[lin,6].Font.Bold:=true;
                ExcelWorksheet1.Cells.Item[lin,6].value:=gridb.cells[4,x];
                subtotal:=subtotal+ strtofloat(stringreplace(gridb.cells[4,x],',','',[rfReplaceAll]));
                lin:=lin+1;
                 barra.Position:=barra.position+1;
          end;
     end;
     ExcelWorksheet1.Cells.Item[lin,6].Interior.ColorIndex :=37;
     ExcelWorksheet1.Cells.Item[lin,5].Font.Bold:=true;
     ExcelWorksheet1.Cells.Item[lin,5].value:='Total';

     ExcelWorksheet1.Cells.Item[lin,6].Interior.ColorIndex :=37;
     ExcelWorksheet1.Cells.Item[lin,6].numberformat:='$#,##0.00';
     ExcelWorksheet1.Cells.Item[lin,6].Font.Bold:=true;
     ExcelWorksheet1.Cells.Item[lin,6].value:=floattostr(subtotal);


     ExcelWorkbook1.Save;
     ExcelApplication1.Quit;
     ExcelWorksheet1.Disconnect;
     ExcelWorkbook1.Disconnect;
     ExcelApplication1.Disconnect;
     ShellExecute(handle, 'open', PChar('c:\Transferencias\'+laNominaes+'\Cuadre'+bancoCuad.Text+'.xlsx'), nil, nil, SW_show);


  
end;


procedure TFDetalle.ExportarReporteCuadre1Click(Sender: TObject);
begin
  inherited;
ExportaCuadre;
end;

procedure TFDetalle.PYJCHClick(Sender: TObject);
begin
  inherited;
ExportarPYJCheque(TRUE);
end;

procedure TFDetalle.PYJTRClick(Sender: TObject);
begin
  inherited;
ExportarPYJTrans(true);
end;

procedure TFDetalle.ExportarDatosaExcel1Click(Sender: TObject);
begin
  inherited;
ExportarGrXLS(GridGr);
end;

procedure TFDetalle.GridGrDblClick(Sender: TObject);
begin
  inherited;
   
   if gridgr.Cells[gridgr.ColCount-1,linea]='X' then
      gridgr.Cells[gridgr.ColCount-1,linea]:=''
   else
      gridgr.Cells[gridgr.ColCount-1,linea]:='X';
 gridgr.Refresh;
end;

procedure TFDetalle.GridGrSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
columna:=acol;
linea:=arow;
end;

procedure TFDetalle.GridGrDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (gridgr.Cells[gridgr.ColCount-1,ARow]='')  then
           gridgr.Canvas.Brush.Color := clWhite;

  if gridgr.Cells[gridgr.ColCount-1,ARow]='X' then
       begin
          gridgr.Canvas.Font.Style:=[fsBold];
          gridgr.Canvas.Brush.Color :=$00AEF0E0;
       end;
  if gridgr.Cells[7,ARow]='S' then
       begin
          gridgr.Canvas.Font.Style:=[fsBold];
          gridgr.Canvas.Brush.Color :=CLRED;
       end;

  gridgr.Canvas.FillRect(Rect);
  Texto := gridgr.Cells[acol,ARow];
  DrawText( gridgr.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;

procedure TFDetalle.elProyTChange(Sender: TObject);
begin
  inherited;
sacaReportest;
end;

procedure TFDetalle.SeraDJtClick(Sender: TObject);
begin
  inherited;
sacaReportest;
end;

procedure TFDetalle.GridGrMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Valor :String;
  LGcCoord: TGridCoord;
begin
  inherited;
   LGcCoord := TCustomGrid(GridGr).MouseCoord(x,y);
   if (Y <= gridgr.DefaultRowHeight) then Sortgrid(GRIDGR,LGcCoord.X,1);

end;

procedure TFDetalle.InvertirSeleccin1Click(Sender: TObject);
var
x:integer;

begin
  inherited;
  for x:=1 to gridgr.RowCount-1 do
     if gridgr.cells[gridgr.ColCount-1,x]='X' then
        gridgr.cells[gridgr.ColCount-1,x]:=''
     else
        gridgr.cells[gridgr.ColCount-1,x]:='X';
  gridgr.Refresh;
end;

procedure TFDetalle.BtnBanTranClick(Sender: TObject);
begin
  inherited;
exportarBancomerTransfer(true,'BANCOMER');
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  exportarAltasCuentas(true,'02');
end;

procedure TFDetalle.FormShow(Sender: TObject);
begin
  inherited;
 AnimateWindow( Handle, 400, AW_ACTIVATE or AW_SLIDE or AW_VER_POSITIVE );
 RedrawWindow( Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN );
end;




procedure TFDetalle.Button1Click(Sender: TObject);
var
x:integer;
begin
  inherited;

  BARRA.Max:=gridGr.Rowcount-1;


     for x:=1 to   gridGr.Rowcount-1 do
        begin

           q.close;
           q.sql.Text:='SELECT MONTO FROM PTEMESDEPEDMAL A WHERE A.EMPL='+#39+gridGr.CELLS[1,X]+#39;
           Q.open;


           if not(q.eof) then
              gridGr.CELLS[3,X]:=formatfloat('#00.00',(strtofloattes(gridGr.CELLS[3,X])-q.fields[0].asfloat));
           barra.Position:=barra.position+1;
        end;
     totalGR.caption:=formatfloat('#00.00',sumacolGrid(gridGr,3));

end;

procedure TFDetalle.GenerarAltasdeHSBC1Click(Sender: TObject);
begin
  inherited;
  todaslasTransfer('01',FALSE);
end;

procedure TFDetalle.GenerararchivosaltasHSCBInd1Click(Sender: TObject);
var
valor:string;
begin
  inherited;
  if inputquery('Búsqueda de cuentas Nuevas', 'A partir de Fecha (dd/mm/yyyy):', valor) then
      todaslasTransferNuevas('01',false,valor);
end;

procedure TFDetalle.GenerarArchivocsv1Click(Sender: TObject);
begin
  inherited;
  if (elrubrot.text<>'') and (elsfdot.text<>'') and (laAreat.text<>'') and (elBancot.text<>'') and (elProyt.Text<>'') then
       ExportarHSBC2017(true,'')
   else
       ExportarHSBC2017(true,'General'+nomina.text+'.csv');
   phsbc.Visible:=false;
end;

End.
