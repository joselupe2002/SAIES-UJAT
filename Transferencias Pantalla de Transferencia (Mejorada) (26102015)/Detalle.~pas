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
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DsCuentas: TDataSource;
    QCuentas: TQuery;
    Label6: TLabel;
    totreg: TLabel;
    Label8: TLabel;
    montoe: TLabel;
    Label7: TLabel;
    montop: TLabel;
    DG: TDBGrid;
    elrubro: TComboBox;
    Label9: TLabel;
    DGR: TDBGrid;
    DsRep: TDataSource;
    Qrep: TQuery;
    Label10: TLabel;
    RegRep: TLabel;
    Label12: TLabel;
    montorep: TLabel;
    TabSheet3: TTabSheet;
    grid: TStringGrid;
    s: TQuery;
    Label13: TLabel;
    totalg: TLabel;
    qBancos: TQuery;
    Tick: TEkRTF;
    det: TQuery;
    TabSheet4: TTabSheet;
    GridGr: TStringGrid;
    Label15: TLabel;
    totalGr: TLabel;
    QGr: TQuery;
    PSAN: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    genSan: TSpeedButton;
    Label18: TLabel;
    SpeedButton5: TSpeedButton;
    NOP: TLabel;
    bbancomer: TSpeedButton;
    bsit: TSpeedButton;
    bsantander: TSpeedButton;
    bhsbc: TSpeedButton;
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
    Tick2: TEkRTF;
    T: TQuery;
    PROG: TProgressBar;
    PMENUTRA: TPopupMenu;
    ExportaraExcel1: TMenuItem;
    GenerarReporte1: TMenuItem;
    barra: TProgressBar;
    Label36: TLabel;
    pagoCanc: TEdit;
    CancPago: TSpeedButton;
    Shape2: TShape;
    netoE: TLabel;
    MenTrans: TPopupMenu;
    GenerarTodasTransferencias1: TMenuItem;
    GenerarTodosHSBC1: TMenuItem;
    emplBus: TEdit;
    buscarEmpl: TSpeedButton;
    PCambioCta: TPopupMenu;
    QuitarCuenta1: TMenuItem;
    ColocarHSBC1: TMenuItem;
    ColocarBancomer1: TMenuItem;
    ColocarSantander1: TMenuItem;
    VertodoslosPagos1: TMenuItem;
    ExportarreportedeCuentas1: TMenuItem;
    GenerartodosSantander: TMenuItem;
    ConfigurarSantander1: TMenuItem;
    Label20: TLabel;
    Label32: TLabel;
    elsfdo: TComboBox;
    laarea: TComboBox;
    Label33: TLabel;
    elbanco: TComboBox;
    Label34: TLabel;
    seraDJ: TCheckBox;
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
    SpeedButton4: TSpeedButton;
    TOTALGSC: TLabel;
    TotalDjSc: TLabel;
    Qp: TQuery;
    Label5: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RelPagos: TSpeedButton;
    colocaProy: TSpeedButton;
    Label19: TLabel;
    Label21: TLabel;
    colocaArea: TSpeedButton;
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
    Label37: TLabel;
    elProy: TComboBox;
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
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    progr: TProgressBar;
    Qe: TQuery;
    QCta: TQuery;
    Label42: TLabel;
    CancelC: TCheckBox;
    CancelR: TCheckBox;
    GenerarTodosHSBCNuevo1: TMenuItem;
    SpeedButton11: TSpeedButton;
    genHSBCtxt: TSpeedButton;
    GenerartodosHSBCNuevotxt1: TMenuItem;
    SpeedButton12: TSpeedButton;
    Leyenda: TLabel;
    btnSc: TSpeedButton;
    ExportarReporteCuadre1: TMenuItem;
    SpeedButton2: TSpeedButton;
    PYJCH: TSpeedButton;
    PYJTR: TSpeedButton;
    ExportarDatosaExcel1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure TipoChange(Sender: TObject);
    procedure NOMINAChange(Sender: TObject);
    procedure RelPagosClick(Sender: TObject);
    procedure DGRDblClick(Sender: TObject);
    procedure DGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DGRDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ImprimeRep(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean; vproy:string);
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
    procedure colocaProyClick(Sender: TObject);
    procedure pagoCancChange(Sender: TObject);
    procedure CancPagoClick(Sender: TObject);
    procedure GenerarTodosHSBC1Click(Sender: TObject);
    procedure GenerartodosSantander1Click(Sender: TObject);
    procedure buscarEmplClick(Sender: TObject);
    procedure QuitarCuenta1Click(Sender: TObject);
    procedure ColocarHSBC1Click(Sender: TObject);
    procedure ColocarBancomer1Click(Sender: TObject);
    procedure ColocarSantander1Click(Sender: TObject);
    procedure emplBusKeyPress(Sender: TObject; var Key: Char);
    procedure ExportarreportedeCuentas1Click(Sender: TObject);
    procedure VertodoslosPagos1Click(Sender: TObject);
    procedure ConfigurarSantander1Click(Sender: TObject);
    procedure GenerartodosSantanderClick(Sender: TObject);
    procedure DGDblClick(Sender: TObject);
    procedure BuscaNominas;
    procedure abrirCuentas;
    procedure ANIOChange(Sender: TObject);
    procedure colocaAreaClick(Sender: TObject);
   FUNCTION calculasql(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string; Proy:string):STRING;
    procedure TabOpChange(Sender: TObject);
    procedure sacaReportes;
    procedure sacaReportesT;
    procedure elrubroChange(Sender: TObject);
    procedure elsfdoChange(Sender: TObject);
    procedure laareaChange(Sender: TObject);
    procedure elbancoChange(Sender: TObject);
    procedure GridDJDblClick(Sender: TObject);
    procedure BancoCuadChange(Sender: TObject);
    procedure GridBSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ImprimirReporte1Click(Sender: TObject);
    procedure ImprimirTodoslosReportes1Click(Sender: TObject);
    procedure elRubroTChange(Sender: TObject);
    procedure elSfdoTChange(Sender: TObject);
    procedure laAreaTChange(Sender: TObject);
    procedure seraDJClick(Sender: TObject);
    procedure GenerarLayaout(Banco:String);
    procedure GenerarTodasTransferencias1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    FUNCTION calculasql_e(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string; PROY:STRING):STRING;
    procedure elProyChange(Sender: TObject);
    procedure elBancoTChange(Sender: TObject);
    procedure antesExportarHSBC;
    procedure genHSBCClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ReporteExcel(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean; vproy:string);
    procedure btnScClick(Sender: TObject);
    procedure ConfigurarHSBC1Click(Sender: TObject);
    procedure ExportarHSBCNew(abrir:boolean);
    procedure GenerarTodosHSBCNuevo1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure exportarHSBCNewTxt(abrir:boolean);
    procedure genHSBCtxtClick(Sender: TObject);
    procedure GenerartodosHSBCNuevotxt1Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ReporteExcelxArea(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean; vproy:string);
 function DameNombre(accion:string; extension:string; cuentaTran:string):string;
    procedure SpeedButton10Click(Sender: TObject);
    procedure ExportaCuadre;
    function dameCtaBanco(xrubro:string;xsfdo:string;xarea:string;xproy:string;xbanco:string):string;
    procedure ExportarReporteCuadre1Click(Sender: TObject);
    procedure ColocaBorde(hoja:TExcelWorksheet;lin:integer;col:integer);
    procedure FormatoTitulo(hoja:TExcelWorksheet;lin:integer;col:integer);
    procedure SpeedButton2Click(Sender: TObject);
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
 Width :=  806 ;

 nomfec.text:='01/'+formatdatetime('MM',NOW);
 fechagen:=NomFec.text+'/'+ANIO.TEXT;
 ANIO.TEXT:= formatdatetime('yyyy',now);


 gridgr.Cells[0,0]:='CUENTA';
 gridgr.Cells[1,0]:='EMPL';
 gridgr.Cells[2,0]:='NOMBRE';
 gridgr.Cells[3,0]:='MONTO';
 gridgr.Cells[gridgr.colcount-1,0]:='SEL';

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
       relPagos.Visible:=false;
       colocaProy.Visible:=false;
       colocaArea.Visible:=false;
       cancPago.Visible:=false;
       buscarempl.visible:=false;
       btnsc.Visible:=false;
        pcambiocta.Items.Enabled:=false;
        QuitarCuenta1.Visible:=FALSE;
        ColocarHSBC1.Visible:=FALSE;
        ColocarSantander1.Visible:=FALSE;
        ColocarBancomer1.Visible:=FALSE;
        TabSheet4.Visible:=false;
        TabSheet4.Enabled:=false;
    end;



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


procedure TFDetalle.abrirCuentas;
begin
        qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
        'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
        'OBS, CANCELADO, NPAGO, RUBRO, SFDO, AREA, PROY FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+' ORDER BY EMPL';
        savetofileLog(QCuentas.sql.text);
        qCuentas.Open;

        q.close;
        q.sql.text:='SELECT count(*) FROM PTRANSFERNOM T  WHERE T.TRAN_NOMINA='+NOMINA.text;
        q.Open;
        totreg.caption:=q.Fields[0].AsString;

        q.close;
        q.sql.text:='SELECT sum(TRAN_NETO) FROM PTRANSFERNOM T  WHERE T.TRAN_NOMINA='+NOMINA.text+
        ' AND TRAN_TEMPL='+#39+'P'+#39;
        q.Open;
        montop.caption:=formatfloat('#0,0.00',q.Fields[0].asfloat);

        q.close;
        q.sql.text:='SELECT sum(TRAN_NETO) FROM PTRANSFERNOM T  WHERE T.TRAN_NOMINA='+NOMINA.text+
        ' AND TRAN_TEMPL<>'+#39+'P'+#39;
        q.Open;
        montoe.caption:=formatfloat('#0,0.00',q.Fields[0].asfloat);
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

        abrirCuentas;

        q.close;
        q.sql.text:='select count(*) from ptransfernom s where s.tran_banco is not null and s.tran_cuenta is null '+
                    ' and s.tran_nomina='+#39+NOmina.text+#39;
        q.open;
        leyenda.caption:='';
        if q.Fields[0].AsInteger>0 then
           leyenda.caption:='Existen pagos de Empleados que van por transferencia y no tienen cuenta de Transferencia';



        {RelPagos.Enabled:=true;
        q.close;
        q.sql.text:='SELECT COUNT(*) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+NOMINA.TEXT;
        Q.open;
        if q.fields[0].asinteger>0 then
            RelPagos.Enabled:=false;   }
   end;

end;

procedure TFDetalle.RelPagosClick(Sender: TObject);
var
hacer:boolean;
begin
  inherited;
  q.close;
  q.sql.text:='SELECT COUNT(*) FROM PCONTCONFIG WHERE CONT_NOMINA='+#39+NOMINA.TEXT+#39;
  Q.open;

  if q.fields[0].asinteger<=0 then
      begin
          q.close;
          q.sql.text:='SELECT COUNT(*) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+NOMINA.TEXT;
          Q.open;
          if q.fields[0].asinteger>0 then
              if Application.MessageBox('Está nómina ya se encuentra traspada, ¿Desea volver hacer el proceso, se perderán los datos?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
                  hacer:=true
              else
                  hacer:=false
          else
              hacer:=true;

          if hacer then
             begin
                q.close;
                if str_(tipo.text,'-')<>'V' then
                      q.sql.text:='CALL LLENATRANSFER('+NOMINA.TEXT+','+#39+STR_(TIPO.text,'-')+#39+')'
                else
                      q.sql.text:='CALL LLENATRANSFERVIN('+NOMINA.TEXT+')';
                q.ExecSQL;
                qcuentas.close;
                qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
                'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
                'OBS, CANCELADO, NPAGO, RUBRO, SFDO, AREA FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+' ORDER BY EMPL';
                savetofileLog(QCuentas.sql.text);
                qCuentas.Open;
                NOMINAChange(nil);
             end;
      end
  else
     Showmessage('Ya se encuentra contabilizada esta Nómina por lo tanto no puede ser modificada la Transferencia');
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
      cadPrin:='SELECT  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  ';

  cadPrin:=CadPrin+
  ' BANCO '+VBANCO+
  ' AND NOMINA='+#39+NOMINA.text+#39+VEsDJ+
  ' AND RUBRO='+#39+rubro+#39+
  ' AND SFDO='+#39+sfdo+#39+
  ' AND AREA='+#39+AREA+#39;

  if proy='%' then
     cadPrin:=CadPrin+' AND PROY NOT IN (SELECT TRAN_PROYECTO FROM PTRANEXCEPT x WHERE '+
                                        ' X.TRAN_NOMINA='+#39+NOMINA.text+#39+
                                        ' AND X.TRAN_RUBRO='+#39+rubro+#39+
                                        ' AND X.TRAN_SFDO='+#39+sfdo+#39+
                                        ' AND X.tran_AREA='+#39+AREA+#39+') '
  else
     cadPrin:=CadPrin+' AND PROY ='+#39+PROY+#39;

  if (tipo='TR') Then cadPrin:=cadPrin+' AND MONTO>0 AND CANCELADO='+#39+'N'+#39;

  if tipo='G' then
     CadPrin:=CadPrin+' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2,4';

  if tipo='TR' then
     CadPrin:=CadPrin+' GROUP BY  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA'+
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



procedure TFDetalle.sacaReportes;
begin
if (elrubro.text<>'') and (elsfdo.text<>'') and (laArea.text<>'') and (elBanco.text<>'') then
  begin
      Qrep.close;
      QRep.sql.text:=calculasql(elrubro.text,elsfdo.text,laArea.text,str_(elbanco.text,'-'),SeraDJ.checked,'G',ElProy.text);
      savetofilelog(qrep.sql.text);
      qRep.open;
      NOP.Caption:=inttostr(qrep.recordcount);

      Q.close;
      Q.sql.text:=calculasql(elrubro.text,elsfdo.text,laArea.text,str_(elbanco.text,'-'),SeraDJ.checked,'C',ElProy.text);
      savetofilelog(q.sql.text);
      q.open;
      regrep.caption:=q.Fields[0].asstring;

      Q.close;
      Q.sql.text:=calculasql(elrubro.text,elsfdo.text,laArea.text,str_(elbanco.text,'-'),SeraDJ.checked,'S',ElProy.text);
      savetofilelog(q.sql.text);
      q.open;
      montorep.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);
  end;
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
            gridGr.cells[4,gridgr.rowcount-1]:=S.fieldbyname('NOMBRES').asstring;;
            gridGr.cells[5,gridgr.rowcount-1]:=S.fieldbyname('APEPAT').asstring;;
            gridGr.cells[6,gridgr.rowcount-1]:=S.fieldbyname('APEMAT').asstring;;
            gridGr.RowCount:=gridGR.RowCount+1;
            s.nexT;
         end;
         if (s.recordcount)>0 then
             gridGr.RowCount:=gridGR.RowCount-1;

         totalGR.caption:=formatfloat('#0.00',sumacolGrid(gridGr,3));
         Sortgrid(GRIDGR,2,1);
  end;
end;


procedure TFDetalle.DGRDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qrep);
end;



procedure TFDetalle.DGDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (QCUENTAS.fieldbyname('CANCELADO').asstring)='S' THEN
      Dg.canvas.Brush.Color:=Clred
  else
      Dg.canvas.Brush.Color:=clwhite;
dg.Canvas.Font.Color:=clblack;
Dg.Canvas.FillRect(Rect);
Dg.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TFDetalle.DGRDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Qrep.fieldbyname('CANCELADO').asstring)='S' THEN
      Dgr.canvas.Brush.Color:=Clred
  else
      Dgr.canvas.Brush.Color:=clwhite;
dgr.Canvas.Font.Color:=clblack;
Dgr.Canvas.FillRect(Rect);
Dgr.DefaultDrawColumnCell(Rect,DataCol,Column,State);


end;



procedure TFDetalle.ImprimeRep(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean; vproy:string);
var
Q:Tquery;
TipoNom:string;
esDJ:STRING;
laNominaes:String;
cadCancel:string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;

esdj:='';
IF seraDJ.Checked then esdj:='DJ';

cadCancel:='';
if cancelR.Checked then cadCancel:=' AND  CANCELADO='+#39+'N'+#39;


if not(fileexists(ExtractFiledir(Paramstr(0))+'\RepTransfer.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPTRANSFER','rtf');

  tiponom:=str_(tipo.text,'-');

  rubrorep:=vrubro;sfdoRep:=vsfdo;areaRep:=Varea; bancorep:=vbanco; djRep:=vdj;proyRep:=Vproy;
  Tick.ClearVars;
  Tick.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  Tick.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  Tick.CreateVar('INICIA',inicia.text);
  Tick.CreateVar('TERMINA',termina.text);

  Q.close;
  q.sql.text:='SELECT USER FROM DUAL';
  q.OPEN;
  Tick.CreateVar('USER',Q.fields[0].asstring);

  Tick.CreateVar('NUMNOMINA',nomina.text);
  Tick.CreateVar('NOMBRE',vrubro+' Sfdo: '+vSfdo+ ' Banco:'+vbanco+' Área: '+varea);


  qP.close;
  qP.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'R',vproy);
  savetofilelog('==============='+qP.sql.text);
  qP.open;

  det.close;
  det.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'R2',vproy)+
              ' AND URESP='+#39+QP.fieldbyname('URES').asstring+#39+ cadCancel+
              ' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
  savetofilelog(DET.sql.text);
  det.open;


  laNominaes:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
  CreateDir('c:\Transferencias\');
  CreateDir('c:\Transferencias\'+laNominaes+'\');
  CreateDir('c:\Transferencias\'+laNominaes+'\'+rubroRep+'\');
  CreateDir('c:\Transferencias\'+laNominaes+'\'+rubroRep+'\Reportes\');
 // CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\'+str_(tipo.text,'-')+'_'+nomina.text+'\');

  Tick.InFile:=ExtractFiledir(Paramstr(0))+'\RepTransfer.rtf';
  Tick.OutFile:='c:\Transferencias\'+laNominaes+'\'+rubroRep+'\Reportes\'+vBanco+' '+vArea+' '+vrubro+' '+vsfdo+' '+esDJ+'_PROY_('+vproy+')'+'.rtf';

  if mostrar then Tick.ExecuteOpen([QP, det],SW_SHOW)

  else
     begin
        Tick.Execute([QP, det]);
     end;
  // ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;




procedure TFDetalle.ReporteExcel(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean; vproy:string);
var
cadCancel:string;
id:integer;
laures:string;
Subtotal, total:real;
x,y:integer;
esDJ:STRING;
elNombre,laNominaes:String;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;

begin
  esdj:='';
  IF seraDJ.Checked then esdj:='DJ';

  cadCancel:='';
  if cancelr.Checked then cadCancel:=' AND CANCELADO='+#39+'N'+#39;


  rubrorep:=vrubro;sfdoRep:=vsfdo;areaRep:=Varea; bancorep:=vbanco; djRep:=vdj;proyRep:=Vproy;
  laNominaes:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
  elNombre:=dameNombre('R','.xlsx','');

  CreateDir('c:\Transferencias\');
  CreateDir('c:\Transferencias\'+laNominaes+'\');
  CreateDir('c:\Transferencias\'+laNominaes+'\Reportes\');
  CreateDir('c:\Transferencias\'+laNominaes+'\Reportes\'+vbanco+'\');
  CreateDir('c:\Transferencias\'+laNominaes+'\Reportes\'+vbanco+'\'+rubroRep+'\');


  try deletefile('c:\Transferencias\'+laNominaes+'\Reportes\'+vbanco+'\'+rubroRep+'\'+elNombre); except end;
  CrearFile('c:\Transferencias\'+laNominaes+'\Reportes\'+vbanco+'\'+rubroRep+'\'+elNombre);

  ExcelApplication1:=TExcelApplication.create(nil);
  ExcelWorkbook1:= TExcelWorkbook.create(nil);
  ExcelWorksheet1:=TExcelWorksheet.create(nil);


  ExcelApplication1.Workbooks.Open('c:\Transferencias\'+laNominaes+'\Reportes\'+vbanco+'\'+rubroRep+'\'+elNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);


  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  progr.Position:=0;

  qe.close;
  qe.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'C',vproy);
  qe.open;
  progr.Max:=qe.fields[0].asinteger;

  qe.close;
  qe.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'R2',vproy)+
               cadCancel+
              ' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
  savetofilelog(qe.sql.text);
  qe.open;

  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  ExcelWorksheet1.Cells.Item[1,1].value:='TRANSFERENCIA '+RNOMINA.TEXT+' BANCO: '+VBANCO+' '+RUBROREP+' '+VSFDO+' '+VAREA;
  ExcelWorksheet1.Range['A1', 'H1'].MergeCells := true;

  for x:=0 to qe.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[2,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[2,x+1].value:=qe.Fields[x].FullName;
        ExcelWorksheet1.Cells.Item[2,x+1].Interior.ColorIndex :=41;
     end;


  y:=3;
  qe.first;
  subtotal:=0;
  total:=0;
  laures:=qe.fields[2].asstring;
  while not(qe.eof) do
     begin
        ExcelWorksheet1.Cells.Item[Y,8].numberformat:='$#,##0.00';
        ExcelWorksheet1.Cells.Item[Y,4].numberformat:= '@';
        ExcelWorksheet1.Cells.Item[Y,1].numberformat:= '@';
        ExcelWorksheet1.Cells.Item[Y,2].numberformat:= '@';
        ExcelWorksheet1.Cells.Item[Y,6].numberformat:= '@';

        if laures<>qe.fieldbyname('DESCURES').asstring then
           begin

              ExcelWorksheet1.Cells.Item[Y,7].Font.Bold:=true;
              ExcelWorksheet1.Cells.Item[y,7].value:='SUBTOTAL ';
              ExcelWorksheet1.Cells.Item[y,7].Interior.ColorIndex :=41;

              ExcelWorksheet1.Cells.Item[Y,8].numberformat:='$#,##0.00';
              ExcelWorksheet1.Cells.Item[Y,8].Font.Bold:=true;
              ExcelWorksheet1.Cells.Item[y,8].Interior.ColorIndex :=41;
              ExcelWorksheet1.Cells.Item[y,8].value:=formatfloat('#,0.00',SUBTOTAL);

              ExcelWorksheet1.Cells.Item[Y,4].numberformat:= '@';

              Y:=Y+1;
              ExcelWorksheet1.Cells.Item[Y,4].numberformat:= '@';
              ExcelWorksheet1.Cells.Item[Y,1].numberformat:= '@';
              ExcelWorksheet1.Cells.Item[Y,2].numberformat:= '@';
              subtotal:=0;
              laures:=qe.fieldbyname('DESCURES').asstring;
           end;

        subtotal:=subtotal+qe.fieldbyname('MONTO').asfloat;
        total:=total+qe.fieldbyname('MONTO').asfloat;
        for x:=0 to qe.Fields.Count-1  do
               ExcelWorksheet1.Cells.Item[y,x+1].value:=qe.fields[x].asstring;

        progr.Position:=progr.Position+1;
        y:=y+1;
        qe.next;

     end;

    ExcelWorksheet1.Cells.Item[Y,7].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[y,7].value:='SUBTOTAL ';
    ExcelWorksheet1.Cells.Item[Y,8].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[Y,8].numberformat:='$#,##0.00';
    ExcelWorksheet1.Cells.Item[y,8].value:=floattostr(SUBTOTAL);
    ExcelWorksheet1.Cells.Item[Y+1,7].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[y+1,7].value:='TOTAL ';
     ExcelWorksheet1.Cells.Item[Y+1,8].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[Y+1,8].numberformat:='$#,##0.00';
    ExcelWorksheet1.Cells.Item[y+1,8].value:=floattostr(total);


ExcelWorkbook1.Save;
ExcelApplication1.Quit;
ExcelWorksheet1.Disconnect;
ExcelWorkbook1.Disconnect;
ExcelApplication1.Disconnect;
end;



procedure TFDetalle.ReporteExcelxArea(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean; vproy:string);
var
cadCancel:string;
id:integer;
laures:string;
Subtotal, total:real;
x,y:integer;
esDJ:STRING;
elNombre,laNominaes:String;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;

begin
  esdj:='';
  IF seraDJ.Checked then esdj:='DJ';

  cadCancel:='';
  if cancelr.Checked then cadCancel:=' AND CANCELADO='+#39+'N'+#39;


  rubrorep:=vrubro;sfdoRep:=vsfdo;areaRep:=Varea; bancorep:=vbanco; djRep:=vdj;proyRep:=Vproy;
  laNominaes:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);
  elNombre:=dameNombre('R','.xlsx','');

  CreateDir('c:\Transferencias\');
  CreateDir('c:\Transferencias\'+laNominaes+'\');
  CreateDir('c:\Transferencias\'+laNominaes+'\Reportes_'+Varea+'\');

  try deletefile('c:\Transferencias\'+laNominaes+'\Reportes_'+Varea+'\'+elNombre); except end;
  CrearFile('c:\Transferencias\'+laNominaes+'\Reportes_'+Varea+'\'+elNombre);

  ExcelApplication1:=TExcelApplication.create(nil);
  ExcelWorkbook1:= TExcelWorkbook.create(nil);
  ExcelWorksheet1:=TExcelWorksheet.create(nil);


  ExcelApplication1.Workbooks.Open('c:\Transferencias\'+laNominaes+'\Reportes_'+Varea+'\'+elNombre,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);


  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  progr.Position:=0;

  qe.close;
  qe.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'C',vproy);
  qe.open;
  progr.Max:=qe.fields[0].asinteger;

  qe.close;
  qe.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'R2',vproy)+
               cadCancel+
              ' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
  savetofilelog(qe.sql.text);
  qe.open;


  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  ExcelWorksheet1.Cells.Item[1,1].value:='TRANSFERENCIA '+RNOMINA.TEXT+' BANCO: '+VBANCO+' '+RUBROREP+' '+VSFDO+' '+VAREA;
  ExcelWorksheet1.Range['A1', 'H1'].MergeCells := true;

  for x:=0 to qe.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[2,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[2,x+1].value:=qe.Fields[x].FullName;
        ExcelWorksheet1.Cells.Item[2,x+1].Interior.ColorIndex :=41;
     end;


  y:=3;
  qe.first;
  subtotal:=0;
  total:=0;
  laures:=qe.fields[2].asstring;
  while not(qe.eof) do
     begin
        ExcelWorksheet1.Cells.Item[Y,8].numberformat:='$#,##0.00';
        ExcelWorksheet1.Cells.Item[Y,4].numberformat:= '@';
        ExcelWorksheet1.Cells.Item[Y,1].numberformat:= '@';
        ExcelWorksheet1.Cells.Item[Y,2].numberformat:= '@';

        if laures<>qe.fieldbyname('DESCURES').asstring then
           begin

              ExcelWorksheet1.Cells.Item[Y,7].Font.Bold:=true;
              ExcelWorksheet1.Cells.Item[y,7].value:='SUBTOTAL ';
              ExcelWorksheet1.Cells.Item[y,7].Interior.ColorIndex :=41;

              ExcelWorksheet1.Cells.Item[Y,8].numberformat:='$#,##0.00';
              ExcelWorksheet1.Cells.Item[Y,8].Font.Bold:=true;
              ExcelWorksheet1.Cells.Item[y,8].Interior.ColorIndex :=41;
              ExcelWorksheet1.Cells.Item[y,8].value:=formatfloat('#,0.00',SUBTOTAL);

              ExcelWorksheet1.Cells.Item[Y,4].numberformat:= '@';

              Y:=Y+1;
              ExcelWorksheet1.Cells.Item[Y,4].numberformat:= '@';
              ExcelWorksheet1.Cells.Item[Y,1].numberformat:= '@';
              ExcelWorksheet1.Cells.Item[Y,2].numberformat:= '@';
              subtotal:=0;
              laures:=qe.fieldbyname('DESCURES').asstring;
           end;

        subtotal:=subtotal+qe.fieldbyname('MONTO').asfloat;
        total:=total+qe.fieldbyname('MONTO').asfloat;
        for x:=0 to qe.Fields.Count-1  do
               ExcelWorksheet1.Cells.Item[y,x+1].value:=qe.fields[x].asstring;

        progr.Position:=progr.Position+1;
        y:=y+1;
        qe.next;

     end;

    ExcelWorksheet1.Cells.Item[Y,7].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[y,7].value:='SUBTOTAL ';
    ExcelWorksheet1.Cells.Item[Y,8].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[Y,8].numberformat:='$#,##0.00';
    ExcelWorksheet1.Cells.Item[y,8].value:=floattostr(SUBTOTAL);
    ExcelWorksheet1.Cells.Item[Y+1,7].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[y+1,7].value:='TOTAL ';
     ExcelWorksheet1.Cells.Item[Y+1,8].Font.Bold:=true;
    ExcelWorksheet1.Cells.Item[Y+1,8].numberformat:='$#,##0.00';
    ExcelWorksheet1.Cells.Item[y+1,8].value:=floattostr(total);


ExcelWorkbook1.Save;
ExcelApplication1.Quit;
ExcelWorksheet1.Disconnect;
ExcelWorkbook1.Disconnect;
ExcelApplication1.Disconnect;
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
   if accion='R' then
      begin
         if seradj.Checked then
            nombre:=secondCad(elBanco.Text,'-')+' '+laarea.Text+' '+elrubro.Text+' '+elsfdo.Text+' DJ '
         else
            nombre:=secondCad(elBanco.Text,'-')+' '+laarea.Text+' '+elrubro.Text+' '+elsfdo.Text;

         if elProy.text<>'%' then
            nombre:=nombre+' '+copy(SecondCad(TIPO.TEXT,'-'),1,3)+' PY'+elProy.text+extension
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
  PROG.Min:=0;
  prog.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        ExcelWorksheet1.Cells.Item[y,1].value:=gridgr.cells[0,y];
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y];
        ExcelWorksheet1.Cells.Item[y,3].value:=stringReplace(RNOMINA.text,'/','',[rfReplaceAll]);
        nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
        nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,4].value:=nombre;
        y:=y+1;
        prog.Position:=prog.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  prog.Position:=0;

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
  PROG.Min:=0;
  prog.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        ExcelWorksheet1.Cells.Item[y,1].value:='ContInst LIQUIDACION TOTAL O PARCIAL DE DINERO';
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y-2];
        ExcelWorksheet1.Cells.Item[y,3].value:='MONEDA NACIONAL';
        ExcelWorksheet1.Cells.Item[y,4].value:='CHEQUES DE CAJA PARA SUCURSALES';
        ExcelWorksheet1.Cells.Item[y,8].value:='VILLAHERMOSA TAB.';
        ExcelWorksheet1.Cells.Item[y,9].value:='PRINCIPAL VILLAHERMOSA';
        ExcelWorksheet1.Cells.Item[y,10].value:='646951';
        ExcelWorksheet1.Cells.Item[y,11].value:='Persona Física';
        ExcelWorksheet1.Cells.Item[y,12].value:=stringReplace(gridgr.cells[4,y-2],'Ñ','N',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,13].value:=stringReplace(gridgr.cells[5,y-2],'Ñ','N',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,14].value:=stringReplace(gridgr.cells[6,y-2],'Ñ','N',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,19].value:=gridgr.cells[3,y-2];
        y:=y+1;
        prog.Position:=prog.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  prog.Position:=0;

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
  PROG.Min:=0;
  prog.max:=gridgr.rowcount-1;
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
        ExcelWorksheet1.Cells.Item[y,12].value:=stringReplace(gridgr.cells[4,y-2],'Ñ','N',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,13].value:=stringReplace(gridgr.cells[5,y-2],'Ñ','N',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,14].value:=stringReplace(gridgr.cells[6,y-2],'Ñ','N',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,19].value:=gridgr.cells[3,y-2];
        y:=y+1;
        prog.Position:=prog.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  prog.Position:=0;

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
  PROG.Min:=0;
  prog.max:=gridgr.rowcount-1;
  for x:=1 to gridgr.rowcount-1 do
     begin
        ExcelWorksheet1.Cells.Item[y,1].value:=gridgr.cells[0,y-1];
        ExcelWorksheet1.Cells.Item[y,2].value:=gridgr.cells[3,y-1];
        ExcelWorksheet1.Cells.Item[y,3].value:=COPY(stringReplace(RNOMINA.text,'/','',[rfReplaceAll]),1,34);
        nombre:= stringReplace(gridgr.Cells[2,x],'Ñ','N',[rfReplaceAll]);
        nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
        ExcelWorksheet1.Cells.Item[y,4].value:=COPY(nombre,1,35);
        y:=y+1;
        prog.Position:=prog.Position+1;
     end;
      ExcelApplication1.Visible[id]:=true;
  prog.Position:=0;

  if not(abrir) then
     begin

        ExcelWorkbook1.Save;
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
             nombre:=copy(nombre,1,40);

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
exportaRsantander;

end;

procedure TFDetalle.bhsbcClick(Sender: TObject);
begin
  inherited;

  exportarHSBC(true);;


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

procedure TFDetalle.colocaProyClick(Sender: TObject);
var
otroParam,VPPROYNOM:string;
begin
  inherited;
  q.close;
  otroParam:=',TRAN_RUBRO';
  if (str_(tipo.text,'-')='O') or (str_(tipo.text,'-')='C') or (str_(tipo.text,'-')='V')then
      VPPROYNOM:='PPROYNOM';
  if str_(tipo.text,'-')='N' then
      VPPROYNOM:='PPROYNOM_NG';
  if str_(tipo.text,'-')='H' then
      VPPROYNOM:='PPROYNOM_HAS';

  q.SQL.TEXT:='UPDATE PTRANSFERNOM  SET TRAN_PROY='+
       VPPROYNOM+'(TRAN_PROG, TRAN_URESPRES, TRAN_SFDO,TO_CHAR(SYSDATE,'+#39+'YYYY'+#39+')'+otroParam+')'+
      'WHERE TRAN_NOMINA='+#39+Nomina.text+#39;
  q.execsql;
  Showmessage('Se asignaron los proyectos a los registros de pago de la Nómina');
  abrirCuentas;
end;

procedure TFDetalle.pagoCancChange(Sender: TObject);
begin
  inherited;
  IF PAGOCANC.Text<>'' THEN
     BEGIN
        q.close;
        q.sql.text:='select T.TRAN_NETO from PTRANSFERNOM t where t.Tran_NPAGO='+
        PAGOcANC.Text+' AND T.TRAN_EMPL NOT LIKE '+CHR(39)+'DJ%'+CHR(39);
        Q.open;
        netoe.Caption:='Neto: '+formatfloat('#,#0.00',q.fields[0].asfloat);
    END;

end;

procedure TFDetalle.CancPagoClick(Sender: TObject);
begin
  inherited;
   q.close;
  q.sql.text:='UPDATE  PTRANSFERNOM t SET T.TRAN_CANCEL='+#39+'S'+#39+
  ' where t.Tran_NPAGO='+PAGOcANC.Text;
  Q.execsql;
  Showmessage('El pago se ha cancelado para transferencia');

  netoe.Caption:='Neto: ';
  pagocanc.text:='';
  abrirCuentas;
end;

procedure TFDetalle.GenerarLayaout(Banco:String);
var
x:integer;
caddj:string;
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
      ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco)';
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
      ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco';
      
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


            q.next;
            barra.Position:=barra.Position+1;
         end;
    end;
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

procedure TFDetalle.buscarEmplClick(Sender: TObject);
begin
  inherited;
        qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
        'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
        'OBS, CANCELADO, NPAGO, RUBRO, SFDO, AREA, PROY FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+
        ' AND EMPL='+#39+EMPLbUS.TEXT+#39+' ORDER BY EMPL';
        savetofileLog(QCuentas.sql.text);
        qCuentas.Open;

end;

procedure TFDetalle.QuitarCuenta1Click(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO=NULL, TRAN_BANCOD=NULL, TRAN_CUENTA=NULL '+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;
    Qcuentas.close;
  qcuentas.open;

end;

procedure TFDetalle.ColocarHSBC1Click(Sender: TObject);
var
laCnta:string;
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT A.CTAB_CUENTA FROM PCTABANCO A WHERE A.CTAB_EMPL='+
               #39+Qcuentas.fieldbyname('EMPL').asstring+#39+
               ' AND A.CTAB_BANCO='+#39+'01'+#39;
  Q.open;
  laCnta:=Q.fields[0].asstring;


  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO='+#39+'01'+#39+
  ', TRAN_BANCOD='+#39+'HSBC'+#39+
  ', TRAN_CUENTA='+#39+laCnta+#39+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;

  Showmessage('Se asigno Banco 01-HSBC Cuenta: '+laCnta);

  Qcuentas.close;
  qcuentas.open;
end;

procedure TFDetalle.ColocarBancomer1Click(Sender: TObject);
var
laCnta:string;
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT A.CTAB_CUENTA FROM PCTABANCO A WHERE A.CTAB_EMPL='+
               #39+Qcuentas.fieldbyname('EMPL').asstring+#39+
               ' AND A.CTAB_BANCO='+#39+'02'+#39;
  Q.open;
  laCnta:=Q.fields[0].asstring;


  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO='+#39+'02'+#39+
  ', TRAN_BANCOD='+#39+'BANCOMER'+#39+
  ', TRAN_CUENTA='+#39+laCnta+#39+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;
  Showmessage('Se asigno Banco 02-BANCOMER Cuenta: '+laCnta);

  Qcuentas.close;
  qcuentas.open;

end;

procedure TFDetalle.ColocarSantander1Click(Sender: TObject);
var
laCnta:string;
begin
  inherited;
Q.close;
  q.sql.text:='SELECT A.CTAB_CUENTA FROM PCTABANCO A WHERE A.CTAB_EMPL='+
               #39+Qcuentas.fieldbyname('EMPL').asstring+#39+
               ' AND A.CTAB_BANCO='+#39+'03'+#39;
  Q.open;
  laCnta:=Q.fields[0].asstring;


  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO='+#39+'03'+#39+
  ', TRAN_BANCOD='+#39+'SANTANDER'+#39+
  ', TRAN_CUENTA='+#39+laCnta+#39+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;

  Showmessage('Se asigno Banco 03-Santander Cuenta: '+laCnta);

  Qcuentas.close;
  qcuentas.open;
end;

procedure TFDetalle.emplBusKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if key=#13 then
    buscarEmplClick(nil);
   
end;

procedure TFDetalle.ExportarreportedeCuentas1Click(Sender: TObject);
begin
  inherited;
q.close;
q.sql.text:='SELECT EMPL, DESCRIP, MONTO FROM PTRANSOPSLDO WHERE NOMINA='+#39+NOMINA.text+#39+
' UNION ALL SELECT EMPL, DESCRIP, MONTO FROM PTRANSOPDJ WHERE NOMINA='+#39+NOMINA.text+#39+
' ORDER BY 1,2';
Q.open;
ExportarXLS(q);
end;

procedure TFDetalle.VertodoslosPagos1Click(Sender: TObject);
begin
  inherited;
  abrirCuentas;
end;

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



procedure TFDetalle.DGDblClick(Sender: TObject);
begin
  inherited;
q.Close;
q.sql.text:='SELECT count(*) FROM PVTRANSFERNOM T  WHERE NOMINA='+#39+NOMINA.text+#39;
q.OPEN;
copiarDBGridP(qCuentas,Q.Fields[0].ASINTEGER,barra);
abrirExcel('');
end;

procedure TFDetalle.ANIOChange(Sender: TObject);
begin
  inherited;
fechagen:=NomFec.text+'/'+ANIO.TEXT;
BuscaNominas;
end;

procedure TFDetalle.colocaAreaClick(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM S SET S.tran_area=(SELECT  A.area  FROM PCONTURESDIV A WHERE A.ures=S.tran_uresop) '+
  ' WHERE TRAN_NOMINA='+#39+Nomina.text+#39;
  q.Execsql;
  Showmessage('Se asignarón las áreas correspondientes a cada uno de los pagos');
  abrirCuentas;
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
      ELRUBRO.Clear;
      while not(q.eof) do
        begin
           elrubro.Items.Add(q.fields[0].asstring);
           q.next;
        end;

      q.close;
      q.sql.text:='SELECT DISTINCT(S.AREA)  FROM PCONTURESDIV S';
      Q.open;
      laArea.Clear;
      while not(q.eof) do
        begin
           laArea.Items.Add(q.fields[0].asstring);
           q.next;
        end;
   end;





if TabOp.ActivePageIndex=3 then
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

if TabOp.ActivePageIndex=2 then
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

end;

procedure TFDetalle.elrubroChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT DISTINCt(SFDO) FROM PVTRANSFERNOM WHERE NOMINA='+#39+Nomina.text+#39+
      ' AND RUBRO='+#39+elRUBRO.TEXT+#39;
      Q.open;
      elSfdo.Clear;
      while not(q.eof) do
        begin
           elSfdo.Items.Add(q.fields[0].asstring);
           q.next;
        end;

      sacaReportes;
end;

procedure TFDetalle.elsfdoChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT DISTINCt(area) FROM PVTRANSFERNOM WHERE NOMINA='+#39+Nomina.text+#39+
      ' AND RUBRO='+#39+elRUBRO.TEXT+#39+
      ' AND SFDO='+#39+elSfdo.text+#39;
      savetofilelog(q.sql.text);
      Q.open;
      laArea.Clear;
      while not(q.eof) do
        begin
           laArea.Items.Add(q.fields[0].asstring);
           q.next;
        end;
sacaReportes;
end;

procedure TFDetalle.laareaChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT DISTINCT(A.BANCO), B.descrip  from pvtransfernom a, PCONTBANCTRANS B WHERE '+
      ' A.BANCO=B.clave AND NOMINA='+#39+Nomina.text+#39+
      ' AND RUBRO='+#39+elRUBRO.TEXT+#39+
      ' AND SFDO='+#39+elSfdo.text+#39+
      ' AND AREA='+#39+laArea.text+#39;
      savetofilelog(q.sql.text);
      Q.open;
      elBanco.Clear;
      while not(q.eof) do
        begin
           elBanco.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
           q.next;
        end;
      elBanco.Items.Add('99-CHEQUE EFECTIVO');

sacaReportes;
end;

procedure TFDetalle.elbancoChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT TRAN_PROYECTO  from PTRANEXCEPT a WHERE '+
      ' A.TRAN_BANCO='+#39+str_(elBanco.text,'-')+#39+' AND TRAN_NOMINA='+#39+Nomina.text+#39+
      ' AND TRAN_RUBRO='+#39+elRUBRO.TEXT+#39+
      ' AND TRAN_SFDO='+#39+elSfdo.text+#39+
      ' AND TRAN_AREA='+#39+laArea.text+#39;
      savetofilelog(q.sql.text);
      Q.open;
      elProy.Clear;
      elProy.Items.Add('%');
      while not(q.eof) do
        begin
           ELpROY.Items.Add(q.fields[0].asstring);
           q.next;
        end;

sacaReportes;
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
  ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco';
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
                                        ' X.TRAN_NOMINA='+#39+NOMINA.text+#39+
                                        ' AND X.TRAN_RUBRO='+#39+GRIDb.CELLS[0,X]+#39+
                                        ' AND X.TRAN_SFDO='+#39+GRIDb.CELLS[1,X]+#39+
                                        ' AND X.TRAN_AREA='+#39+GRIDb.CELLS[2,X]+#39+') '
        else
           cadProy:=' AND PROY='+#39+GRIDb.CELLS[3,X]+#39;

        q.close;
        q.sql.text:='SELECT SUM(MONTO) FROM PVTRANSFERNOM WHERE '+
        'NOMINA='+#39+NOMINA.TEXT+#39+
        ' AND RUBRO='+#39+GRIDb.CELLS[0,X]+#39+
        ' AND SFDO='+#39+GRIDb.CELLS[1,X]+#39+
        ' AND AREA='+#39+GRIDb.CELLS[2,X]+#39+
        cadProy+
        ' AND DECODE(BANCO,null,'+#39+'99'+#39+',banco)='+#39+STR_(bancoCuad.text,'-')+#39+
        CADDJ+' '+cadCancel;
        savetofilelog(q.sql.text);
        Q.open;
        gridB.cells[4,x]:=formatfloat('#,#0.00',q.Fields[0].asfloat);
        barra.Position:=barra.Position+1;
     end;
  totalrep.caption:=formatfloat('#,#0.00',sumacolgrid(gridB,4));
  barra.Position:=0;
end;

procedure TFDetalle.GridBSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
Ling:=Arow;
ColG:=Acol;

end;

procedure TFDetalle.ImprimirReporte1Click(Sender: TObject);
begin
  inherited;
     ImprimeRep(gridb.cells[0,ling],gridb.cells[1,ling],gridb.cells[2,ling],bancoCuad.text,esDJCuad.Checked,true,gridb.cells[3,ling]);
end;

procedure TFDetalle.ImprimirTodoslosReportes1Click(Sender: TObject);
var
x:integer;
begin
  inherited;
  barra.position:=0;
  barra.max:=gridB.RowCount;
for x:=1 to gridB.RowCount-1 do
   begin
      ImprimeRep(gridb.cells[0,x],gridb.cells[1,x],gridb.cells[2,x],bancoCuad.text,esDJCuad.Checked,false,gridb.cells[3,ling]);
      barra.Position:=barra.position+1;
   end;
barra.Position:=0;
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

procedure TFDetalle.seraDJClick(Sender: TObject);
begin
  inherited;
sacaReportes;
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

  totalGR.caption:=formatfloat('#0.00',sumacolGrid(gridGr,3));
  Sortgrid(GRIDGR,2,1);

end;

procedure TFDetalle.elProyChange(Sender: TObject);
begin
  inherited;
sacaReportes;
end;

procedure TFDetalle.elBancoTChange(Sender: TObject);
begin
  inherited;
      q.close;
      q.sql.text:='SELECT TRAN_PROYECTO  from PTRANEXCEPT a WHERE '+
      ' A.TRAN_BANCO='+#39+str_(elBancot.text,'-')+#39+' AND TRAN_NOMINA='+#39+Nomina.text+#39+
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

procedure TFDetalle.SpeedButton8Click(Sender: TObject);
var
x:integer;
caddj:string;
cadCancel:string;

begin
  inherited;
  seraDJ.Checked:=FALSE;

  cadCancel:='';
  if cancelr.Checked then cadCancel:=' AND S.CANCELADO='+#39+'N'+#39;


for x:=1 to 2 do
   begin
      if x=1 then cadDJ:=' AND S.EMPL NOT LIKE '+#39+'DJ%'+#39 ;
      if x=2 then begin cadDJ:=' AND S.EMPL LIKE '+#39+'DJ%'+#39; seraDJ.Checked:=TRUE; end;

      Q.close;
      q.sql.text:='select count(*) from (select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.descrip),'+
      #39+'%'+#39+' AS PROY'+
      '  from pvtransfernom s, PCONTBANCTRANS t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      cadDJ+cadCancel+
      ' and s.BANCO=t.clave(+)'+
      ' UNION '+
      ' SELECT DISTINCT(RUBRO),SFDO,AREA, BANCO, A.BANCO_D, B.TRAN_PROYECTO'+
      ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+
      ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco)' ;
      savetofilelog(q.sql.text);
      q.open;
      barra.Position:=0;
      barra.Max:=q.fields[0].asinteger;

      Q.close;
      q.sql.text:='select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.descrip),'+
      #39+'%'+#39+' AS PROY'+
      '  from pvtransfernom s, PCONTBANCTRANS t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      caddj+ cadCancel+
      ' and s.BANCO=t.clave(+)'+
      ' UNION '+
      ' SELECT DISTINCT(RUBRO),SFDO,AREA, BANCO, A.BANCO_D, B.TRAN_PROYECTO'+
      ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+
      ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco';
      SAVETOFILElog(Q.sql.text);
      q.open;
      while not(q.eof) do
         begin
            elrubro.text:=q.fields[0].asstring;
            elsfdo.text:=q.fields[1].asstring;
            laarea.text:=q.fields[2].asstring;
            elbanco.text:=q.fields[3].asstring+'-'+q.fields[4].asstring;
            ELPROY.text:=q.fields[5].asstring;

            ReporteExcel(elrubro.text,elsfdo.text,laArea.text,elbanco.text,seradj.Checked,false,elproy.text);
            q.next;
            barra.Position:=barra.Position+1;
         end;
    end;
end;


procedure TFDetalle.btnScClick(Sender: TObject);
begin
  inherited;
       qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
        'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
        'OBS, CANCELADO, NPAGO, RUBRO, SFDO, AREA, PROY FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+
        ' AND CUENTA IS NULL  AND BANCO IS NOT NULL ORDER BY EMPL';
        savetofileLog(QCuentas.sql.text);
        qCuentas.Open;
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
  antesExportarHSBC;

end;

procedure TFDetalle.genHSBCtxtClick(Sender: TObject);
begin
  inherited;
  exportarHSBCNewTxt(true);
 phsbc.Visible:=false;

end;

procedure TFDetalle.GenerartodosHSBCNuevotxt1Click(Sender: TObject);
begin
  inherited;
if (referenciahsbc.Text<>'') then
   GenerarLayaout('01-NEWTXT')
else
   showmessage('No se ha configurado los datos para transferencia HSBC');
end;

procedure TFDetalle.SpeedButton12Click(Sender: TObject);
var
x:integer;
caddj:string;
cadCancel:string;
lanominaes:string;

begin
  inherited;
 seraDJ.Checked:=FALSE;

  cadCancel:='';
  if cancelr.Checked then cadCancel:=' AND S.CANCELADO='+#39+'N'+#39;

  laNominaes:=str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll]);

for x:=1 to 2 do
   begin
      if x=1 then cadDJ:=' AND S.EMPL NOT LIKE '+#39+'DJ%'+#39 ;
      if x=2 then begin cadDJ:=' AND S.EMPL LIKE '+#39+'DJ%'+#39; seraDJ.Checked:=TRUE; end;

      Q.close;
      q.sql.text:='select count(*) from (select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.descrip),'+
      #39+'%'+#39+' AS PROY'+
      '  from pvtransfernom s, PCONTBANCTRANS t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      cadDJ+cadCancel+
      ' and s.BANCO=t.clave(+)'+
      ' and s.area='+#39+laarea.text+#39+
      ' UNION '+
      ' SELECT DISTINCT(RUBRO),SFDO,AREA, BANCO, A.BANCO_D, B.TRAN_PROYECTO'+
      ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+
      ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco'+
      ' and b.tran_area='+#39+laarea.text+#39+')';
      savetofilelog(q.sql.text);

      q.open;
      barra.Position:=0;
      barra.Max:=q.fields[0].asinteger;

      Q.close;
      q.sql.text:='select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.descrip),'+
      #39+'%'+#39+' AS PROY'+
      '  from pvtransfernom s, PCONTBANCTRANS t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      caddj+ cadCancel+
      ' and s.BANCO=t.clave(+)'+
      ' and s.area='+#39+laarea.text+#39+
      ' UNION '+
      ' SELECT DISTINCT(RUBRO),SFDO,AREA, BANCO, A.BANCO_D, B.TRAN_PROYECTO'+
      ' FROM PVTRANSFERNOM a, PTRANEXCEPT B WHERE NOMINA='+#39+nomina.text+#39+
      ' and A.NOMINA||a.RUBRO||a.SFDO||a.AREA||a.BANCO =B.TRAN_NOMINA||b.tran_rubro||b.tran_sfdo||b.tran_area||b.tran_banco'+
      ' and b.tran_area='+#39+laarea.text+#39;
      SAVETOFILElog(Q.sql.text);
      q.open;
      while not(q.eof) do
         begin
            elrubro.text:=q.fields[0].asstring;
            elsfdo.text:=q.fields[1].asstring;
            laarea.text:=q.fields[2].asstring;
            elbanco.text:=q.fields[3].asstring+'-'+q.fields[4].asstring;
            ELPROY.text:=q.fields[5].asstring;

            ReporteExcelxArea(elrubro.text,elsfdo.text,laArea.text,elbanco.text,seradj.Checked,false,elproy.text);
            q.next;
            barra.Position:=barra.Position+1;
         end;
    end;
end;


procedure TFDetalle.SpeedButton10Click(Sender: TObject);
begin
  inherited;
   ReporteExcel(elrubro.text,elsfdo.text,laArea.text,elbanco.text,seradj.Checked,false,elproy.text);
   Showmessage('El reporte se exporto visualizarlo en e directorio de Transferencias');
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

                LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,str_(elbancot.text,'-'));

                elNombre:=dameNombre('T','.txt',LAcuentaBanco);

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

                LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,str_(elbancot.text,'-'));

                elNombre:=dameNombre('T','.txt',LAcuentaBanco);

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

                LAcuentaBanco:=dameCtaBanco(elrubrot.text,elsfdot.text,laareat.text,elproyt.text,str_(elbancot.text,'-'));

                elNombre:=dameNombre('T','.txt',LAcuentaBanco);

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

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
        qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
        'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
        'OBS, CANCELADO, NPAGO, RUBRO, SFDO, AREA, PROY FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+
        ' AND CANCELADO='+#39+'S'+#39+' ORDER BY EMPL';
        savetofileLog(QCuentas.sql.text);
        qCuentas.Open;
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

End.
