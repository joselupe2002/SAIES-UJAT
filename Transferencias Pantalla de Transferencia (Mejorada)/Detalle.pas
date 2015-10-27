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
    SpeedButton2: TSpeedButton;
    Tick: TEkRTF;
    det: TQuery;
    TabSheet4: TTabSheet;
    GridGr: TStringGrid;
    Label15: TLabel;
    totalGr: TLabel;
    QGr: TQuery;
    SpeedButton3: TSpeedButton;
    PSAN: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    fecha1: TDateTimePicker;
    fecha2: TDateTimePicker;
    genSan: TSpeedButton;
    Label18: TLabel;
    cuentasan: TEdit;
    SpeedButton5: TSpeedButton;
    NOP: TLabel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Shape1: TShape;
    Label5: TLabel;
    Tipo: TComboBox;
    Label1: TLabel;
    RNOMINA: TEdit;
    Label3: TLabel;
    Inicia: TEdit;
    Termina: TEdit;
    Label4: TLabel;
    RelPagos: TSpeedButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
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
    Button1: TButton;
    Tick2: TEkRTF;
    T: TQuery;
    PROG: TProgressBar;
    PMENUTRA: TPopupMenu;
    ExportaraExcel1: TMenuItem;
    GenerarReporte1: TMenuItem;
    barra: TProgressBar;
    colocaProy: TSpeedButton;
    Label36: TLabel;
    pagoCanc: TEdit;
    SpeedButton1: TSpeedButton;
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
    TabSheet10: TTabSheet;
    SpeedButton13: TSpeedButton;
    arch: TFileListBox;
    dir: TDirectoryListBox;
    bancoV: TComboBox;
    Label41: TLabel;
    Unidad: TDriveComboBox;
    totales: TListBox;
    Label42: TLabel;
    GridH: TStringGrid;
    Label43: TLabel;
    tf: TLabel;
    Shape3: TShape;
    mt: TLabel;
    GenerartodosSantander: TMenuItem;
    ConfigurarSantander1: TMenuItem;
    NomFec: TComboBox;
    ANIO: TEdit;
    Label19: TLabel;
    Label21: TLabel;
    nomina: TComboBox;
    colocaArea: TSpeedButton;
    Label20: TLabel;
    Label32: TLabel;
    elsfdo: TComboBox;
    laarea: TComboBox;
    Label33: TLabel;
    elbanco: TComboBox;
    Label34: TLabel;
    seraDJ: TCheckBox;
    ExpAllReport: TSpeedButton;
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
    NUMREG: TEdit;
    Label35: TLabel;
    Qp: TQuery;
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
    procedure ImprimeRep(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean);
    procedure TickScanRecord(ScanInfo: TEkScanInfo);
    procedure SpeedButton3Click(Sender: TObject);
    procedure genSanClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ExportarHSBC(abrir:boolean);
    procedure NomFecChange(Sender: TObject);
    procedure GNomSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridGrDblClick(Sender: TObject);
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
    procedure Button1Click(Sender: TObject);
    procedure GridNSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GenerarReporte1Click(Sender: TObject);
    procedure colocaProyClick(Sender: TObject);
    procedure pagoCancChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
    procedure SpeedButton13Click(Sender: TObject);
    procedure verificaHSBC;
    procedure verificaBancomer;
    procedure verificaSantander;
    procedure bancoVChange(Sender: TObject);
    procedure archClick(Sender: TObject);
    procedure totalesClick(Sender: TObject);
    procedure archDblClick(Sender: TObject);
    procedure dirChange(Sender: TObject);
    procedure ConfigurarSantander1Click(Sender: TObject);
    procedure GenerartodosSantanderClick(Sender: TObject);
    procedure DGDblClick(Sender: TObject);
    procedure BuscaNominas;
    procedure abrirCuentas;
    procedure ANIOChange(Sender: TObject);
    procedure colocaAreaClick(Sender: TObject);
   FUNCTION calculasql(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string):STRING;
    procedure TabOpChange(Sender: TObject);
    procedure sacaReportes;
    procedure sacaReportesT;
    procedure elrubroChange(Sender: TObject);
    procedure elsfdoChange(Sender: TObject);
    procedure laareaChange(Sender: TObject);
    procedure elbancoChange(Sender: TObject);
    procedure ExpAllReportClick(Sender: TObject);
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

  private
    { Private declarations }
    iComponenteX, iComponenteY: Integer;
    bMoviendo: Boolean;
  public
    { Public declarations }
  end;

var
  rubrorep,sfdorep,arearep,bancorep:string;
  djrep:boolean;
  FDetalle: TFDetalle;
  FMain : TFMain ;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;
  vures:string;
   VURES_DESC:STRING;
fechaGen:string;
abrirSan:boolean;
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

 GRID.CELLS[0,0]:='Banco';
 GRID.CELLS[1,0]:='Monto';
 GRID.CELLS[2,0]:='Monto-Cancel';
 GRIDDJ.CELLS[0,0]:='Banco';
 GRIDDJ.CELLS[1,0]:='Monto';
 GRIDDJ.CELLS[2,0]:='Monto-Cancel';


 GRIDB.CELLS[0,0]:='Rubro';
 GRIDB.CELLS[1,0]:='Sfdo';
 GRIDB.CELLS[2,0]:='Área';
 GRIDB.CELLS[3,0]:='Monto';


    TABU:=FALSE;
 //cARGAMOS LAS NOMINAS


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
end;

FUNCTION TFDetalle.calculasql(rubro:string;sfdo:string;area:string; banco:string; dj:boolean; Tipo:string):STRING;
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
      QRep.sql.text:=calculasql(elrubro.text,elsfdo.text,laArea.text,str_(elbanco.text,'-'),SeraDJ.checked,'G');
      savetofilelog(qrep.sql.text);
      qRep.open;
      NOP.Caption:=inttostr(qrep.recordcount);

      Q.close;
      Q.sql.text:=calculasql(elrubro.text,elsfdo.text,laArea.text,str_(elbanco.text,'-'),SeraDJ.checked,'C');
      savetofilelog(q.sql.text);
      q.open;
      regrep.caption:=q.Fields[0].asstring;

      Q.close;
      Q.sql.text:=calculasql(elrubro.text,elsfdo.text,laArea.text,str_(elbanco.text,'-'),SeraDJ.checked,'S');
      savetofilelog(q.sql.text);
      q.open;
      montorep.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);
  end;
end;



procedure TFDetalle.sacaReportesT;
begin

if (elrubrot.text<>'') and (elsfdot.text<>'') and (laAreat.text<>'') and (elBancot.text<>'') then
  begin
      LIMPIAGRID(gridGr);
      gridGr.rowcount:=2;
      gridgr.FixedRows:=1;
      gridgr.Cells[0,0]:='CUENTA';
      gridgr.Cells[1,0]:='EMPL';
      gridgr.Cells[2,0]:='NOMBRE';
      gridgr.Cells[3,0]:='MONTO';

      S.close;
      s.sql.text:=calculasql(elrubrot.text,elsfdot.text,laAreat.text,str_(elbancot.text,'-'),SeraDJt.checked,'TR');
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



procedure TFDetalle.ImprimeRep(VRubro:string; Vsfdo:string; Varea:string; Vbanco:String; Vdj:boolean; Mostrar:boolean);
var
vis:string;
venci:string;
Q:Tquery;
Subtotal, total, isr:real;
TipoNom:string;
esDJ:STRING;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;

esdj:='';
IF seraDJ.Checked then esdj:='DJ';
if not(fileexists(ExtractFiledir(Paramstr(0))+'\RepTransfer.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPTRANSFER','rtf');

  tiponom:=str_(tipo.text,'-');

  rubrorep:=vrubro;sfdoRep:=vsfdo;areaRep:=Varea; bancorep:=vbanco; djRep:=vdj;
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
  qP.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'R');
  savetofilelog('==============='+qP.sql.text);
  qP.open;

  det.close;
  det.sql.text:=calculasql(vrubro,vsfdo,varea,str_(vbanco,'-'),vDJ,'R2')+
              ' AND URESP='+#39+QP.fieldbyname('URES').asstring+#39+
              ' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
  savetofilelog(DET.sql.text);
  det.open;

  CreateDir('c:\Transferencias\');
  CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
  CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\');
 // CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\'+str_(tipo.text,'-')+'_'+nomina.text+'\');

  Tick.InFile:=ExtractFiledir(Paramstr(0))+'\RepTransfer.rtf';
  Tick.OutFile:='c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\'+vBanco+' '+vArea+' '+vrubro+' '+vsfdo+' '+esDJ+'.rtf';

  if mostrar then Tick.ExecuteOpen([QP, det],SW_SHOW)

  else
     begin
        Tick.Execute([QP, det]);
     end;
  // ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;



procedure TFDetalle.TickScanRecord(ScanInfo: TEkScanInfo);
begin
   if scaninfo.Number=1 then
     begin
        det.close;
        det.sql.text:=calculasql(rubroRep,sfdoRep,areaRep,str_(bancoRep,'-'),djRep,'R2')+
              ' AND URESP='+#39+QP.fieldbyname('URES').asstring+#39+
              ' GROUP BY SUBSTR(S.URESP,1,2), SUBSTR(S.URESP,3,5), '+
              ' S.URESP_DESC, S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
        savetofilelog(DET.sql.text);
        det.open;
     end;
end;

procedure TFDetalle.ExportarHSBC(abrir:boolean);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
nombre:string;
grupo:string;
begin

grupo:=elBancot.Text+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text;

CreateDir('c:\Transferencias\');
CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll])+'\');
CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(fechaGen,'/','',[rfReplaceAll])+'\HSBC\');
CrearFile('C:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\HSBC\'+GRUPO+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk');

ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

showmessage('Exportar....'+GRUPO);

ExcelApplication1.Workbooks.Open('C:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\HSBC\'+GRUPO+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk',
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

 // ExcelApplication1.Save('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk');


  if not(abrir) then
     begin
        //ExcelApplication1.Save;

        ExcelWorkbook1.Save;
        ExcelApplication1.Quit;
        //ExcelApplication1.quit;
     end;
//ShellExecute(handle, 'open', PChar('C:\Transferencias\'+stringReplace(inicia.text,'/','',[rfReplaceAll])+'\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk'), nil, nil, SW_show);

// ExcelWorksheet1.Disconnect;
// ExcelWorkbook1.Disconnect;
// ExcelApplication1.Disconnect;
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
begin

        grupo:=elBancot.Text+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text;
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

             CreateDir('c:\Transferencias\');
             CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
             CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\');
             filtran.SaveToFile('C:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\'+GRUPO+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'('+inttostr(empieza)+'_'+inttostr(HASTA)+')'+'.TXT');

             if abrir then
             ShellExecute(handle, 'open', PChar('C:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\'+GRUPO+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'('+inttostr(empieza)+'_'+inttostr(HASTA)+')'+'.TXT'), nil, nil, SW_show);
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
bancost:string;
nombFile:String;
grupo:string;
begin
  grupo:=elBancot.Text+' '+laareat.Text+' '+elrubrot.Text+' '+elsfdot.Text;
  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  nombFile:=copy(GRUPO,1,21)+'X'+stringReplace(nomfec.TEXT,'/','',[rfReplaceAll])+anio.text;
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

procedure tfdetalle.exportarSantander;
begin
         psan.Visible:=true;
         fecha1.date:=date;
         fecha2.date:=date;
         q.close;
         q.sql.text:='SELECT TRAN_CUENTA FROM PTRANBANCOS WHERE TRAN_CLAVE='+#39+'03'+#39;
         q.OPEN;
         Cuentasan.Text:=q.FIELDS[0].ASSTRING;
end;

procedure TFDetalle.SpeedButton3Click(Sender: TObject);
var
bancost:string;
begin

  bancost:=STR_(elbancot.text,'-');

   //Para archivo de 01 - HSBC
  if bancost='01' then
       ExportarHSBC(true);

  //Para archivo de 02 - Bancomer
  if bancost='02' then
     exportarBancomer(true);

 //Para archivo de 03 - Santander
  if bancoST='03' then
     begin
       exportarSantander;
       abrirSan:=true;
       gensan.Enabled:=true;
     end;


end;

procedure TFDetalle.genSanClick(Sender: TObject);
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
ContFil:integer;
bancost:string;
grupo:string;
begin
  grupo:=elBancot.Text+' '+laarea.Text+' '+elrubrot.Text+' '+elsfdo.Text;
  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  filtran.Add('1'+colocaceros(inttostr(contFil),5)+'E'+
               formatdatetime('mmddyyyy',fecha1.date)+
              colocaespacios(cuentasan.text,16)+
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
                          colocaespacios(apemat,30)+
                          colocaespacios(apemat,20)+
                          colocaespacios(nombre,30)+
                          colocaespacios(gridgr.cells[0,x],16)+
                          colocaceros(stringReplace(gridgr.cells[3,x],'.','',[rfReplaceAll]),18));
              contFil:=ContFil+1;
           end;

       filtran.Add('3'+colocaceros(inttostr(contFil),5)+
                   colocaceros(inttostr(contFil-2),5)+
                   colocaceros(stringReplace(totalgr.caption,'.','',[rfReplaceAll]),18));

       CreateDir('c:\Transferencias\');
       CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
       CreateDir('c:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Santander\');
       filtran.SaveToFile('C:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Santander\'+GRUPO+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.TXT');

       if abrirSan then
          ShellExecute(handle, 'open', PChar('C:\Transferencias\'+str_(tipo.text,'-')+'_'+nomina.text+'_'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Santander\'+GRUPO+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.TXT'), nil, nil, SW_show);
       PSAN.visible:=false;
end;

procedure TFDetalle.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  PSAN.Visible:=false;
end;




procedure TFDetalle.BuscaNominas;
var
   TPNOMINAS:String;
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

procedure TFDetalle.GridGrDblClick(Sender: TObject);
begin
  inherited;
ExportarGrXLS(GridGr);
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
exportaRsantander;
end;

procedure TFDetalle.bhsbcClick(Sender: TObject);
begin
  inherited;
exportaRHSBC(true);

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

procedure TFDetalle.Button1Click(Sender: TObject);
begin
  inherited;
 GRIDGR.rowcount:=6;

 Gridgr.cells[3,1]:='0.01';
 Gridgr.cells[3,2]:='0.01';
 Gridgr.cells[3,3]:='0.01';
 Gridgr.cells[3,4]:='0.01';
 Gridgr.cells[3,5]:='0.01';
 totalGR.caption:=formatfloat('#0.00',sumacolGrid(gridGr,3));

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
cad:string;
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

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
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
for x:=1 to 2 do
   begin
      if x=1 then cadDJ:=' AND S.EMPL NOT LIKE '+#39+'DJ%'+#39 ;
      if x=2 then begin cadDJ:=' AND S.EMPL LIKE '+#39+'DJ%'+#39; seraDJ.Checked:=TRUE; end;

      Q.close;
      q.sql.text:='select count(*) from (select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.tran_descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.tran_descrip)'+
      '  from pvtransfernom s, ptranbancos t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      cadDJ+
      ' and s.BANCO=t.tran_clave(+)  and s.banco='+#39+banco+#39+')' ;
      q.open;
      barra.Position:=0;
      barra.Max:=q.fields[0].asinteger;

      Q.close;
      q.sql.text:='select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.tran_descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.tran_descrip)'+
      '  from pvtransfernom s, ptranbancos t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      caddj+
      ' and s.BANCO=t.tran_clave(+)'+
      ' and s.banco='+#39+banco+#39;
      savetofilelog(q.sql.text);
      q.open;
      while not(q.eof) do
         begin
            elrubrot.text:=q.fields[0].asstring;
            elsfdot.text:=q.fields[1].asstring;
            laareat.text:=q.fields[2].asstring;
            elbancot.text:=q.fields[3].asstring+'-'+q.fields[4].asstring;
            sacaReportest;
            
            if banco='01' then
               ExportarHSBC(false);

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
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO='+#39+'01'+#39+
  ', TRAN_BANCOD='+#39+'HSBC'+#39+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;
  Qcuentas.close;
  qcuentas.open;
end;

procedure TFDetalle.ColocarBancomer1Click(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO='+#39+'02'+#39+
  ', TRAN_BANCOD='+#39+'BANCOMER'+#39+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;
  Qcuentas.close;
  qcuentas.open;
end;

procedure TFDetalle.ColocarSantander1Click(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE PTRANSFERNOM SET TRAN_BANCO='+#39+'03'+#39+
  ', TRAN_BANCOD='+#39+'SANTANDER'+#39+
  ' WHERE TRAN_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND TRAN_NPAGO='+#39+Qcuentas.fieldbyname('NPAGO').asstring+#39;
  Q.execsql;
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

procedure TFDetalle.verificaHSBC;
var
x:integer;
begin
   totales.Clear;
   for x:=0 to arch.Items.Count-1 do
      begin
          arch.ItemIndex:=x;
          Xls_To_StringGrid(gridh,arch.FileName);
          totales.items[x]:=formatfloat('#,#0.00',sumacolgridofCero(gridh,1));
      end;
   arch.ItemIndex:=0;
   totales.itemIndex:=0;
end;


procedure TFDetalle.verificaBancomer;
var
lis:TstringList;
x,y:integer;
suma:real;
cad:string;
begin
   lis:=TStringList.Create();
   totales.clear;
   for x:=0 to arch.Items.Count-1 do
      begin
          arch.ItemIndex:=x;
          lis.LoadFromFile(arch.FileName);
          suma:=0;
          for y:=0 to lis.Count-1 do
              begin
                  cad:=copy(lis.Strings[y],48,15);
                  cad:=copy(cad,1,13)+'.'+copy(cad,14,2);
                  suma:=suma+strtofloat(cad);
              end;
          totales.items[x]:=formatfloat('#,#0.00',suma);
      end;
end;

procedure TFDetalle.verificaSantander;
var
lis:TstringList;
x,y:integer;
suma:real;
cad:string;
begin
   lis:=TStringList.Create();
   totales.clear;
   for x:=0 to arch.Items.Count-1 do
      begin
          arch.ItemIndex:=x;
          lis.LoadFromFile(arch.FileName);
          suma:=0;
          for y:=0 to lis.Count-1 do
              begin
                  cad:=copy(lis.Strings[y],110,18);
                  cad:=copy(cad,1,16)+'.'+copy(cad,17,2);
                  suma:=suma+strtofloat(cad);
              end;
          totales.items[x]:=formatfloat('#,#0.00',suma);
      end;
end;

procedure TFDetalle.SpeedButton13Click(Sender: TObject);
var
x:integer;
suma:real;
begin
  inherited;
  if str_(bancov.text,'-')='01' then
     verificaHSBC;
  if str_(bancov.text,'-')='02' then
     verificaBancomer;
  if str_(bancov.text,'-')='03' then
     verificaSantander;

  suma:=0;
  for x:=0 to totales.Items.Count-1 do
       suma:=suma+strtofloattes(totales.items[x]);
  mt.caption:=formatfloat('#,#0.00',suma);
end;

procedure TFDetalle.bancoVChange(Sender: TObject);
begin
  inherited;


  if str_(bancov.text,'-')='01' then
     arch.Mask:='*.slk';
  if str_(bancov.text,'-')='02' then
     arch.Mask:='*.txt';
  if str_(bancov.text,'-')='03' then
     arch.Mask:='*.txt';

  dir.Directory:='C:\Transferencias';
end;

procedure TFDetalle.archClick(Sender: TObject);
begin
  inherited;
totales.itemIndex:=arch.ItemIndex;
end;

procedure TFDetalle.totalesClick(Sender: TObject);
begin
  inherited;
arch.ItemIndex:=totales.itemIndex;
end;

procedure TFDetalle.archDblClick(Sender: TObject);
begin
  inherited;
  Xls_To_StringGrid(gridh,arch.FileName);
  //totales.items[arch.ItemIndex]:=formatfloat('#,#0.00',sumacolgridofCero(gridh,1));
  tf.caption:=formatfloat('#,#0.00',sumacolgridofCero(gridh,1));

end;

procedure TFDetalle.dirChange(Sender: TObject);
begin
  inherited;
totales.Clear;
tf.Caption:='0.00';
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
      q.sql.text:='SELECT DISTINCT(A.BANCO), B.tran_descrip  from pvtransfernom a, ptranbancos B WHERE '+
      ' A.BANCO=B.tran_clave AND NOMINA='+#39+Nomina.text+#39+
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
sacaReportes;
end;

procedure TFDetalle.ExpAllReportClick(Sender: TObject);
var
x:integer;
caddj:string;
begin
  inherited;
for x:=1 to 2 do
   begin
      if x=1 then cadDJ:=' AND S.EMPL NOT LIKE '+#39+'DJ%'+#39 ;
      if x=2 then begin cadDJ:=' AND S.EMPL LIKE '+#39+'DJ%'+#39; seraDJ.Checked:=TRUE; end;

      Q.close;
      q.sql.text:='select count(*) from (select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.tran_descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.tran_descrip)'+
      '  from pvtransfernom s, ptranbancos t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      cadDJ+
      ' and s.BANCO=t.tran_clave(+))' ;
      q.open;
      barra.Position:=0;
      barra.Max:=q.fields[0].asinteger;

      Q.close;
      q.sql.text:='select distinct(s.rubro) AS RUBRO,s.sfdo, s.area,'+
      ' decode(s.BANCO,null,'+#39+'99'+#39+',s.banco) AS BANCO,'+
      ' decode(t.tran_descrip,null,'+#39+'CHEQUE EFECTIVO'+#39+',t.tran_descrip)'+
      '  from pvtransfernom s, ptranbancos t'+
      ' where s.NOMINA='+#39+nomina.text+#39+
      caddj+
      ' and s.BANCO=t.tran_clave(+)' ;
      q.open;
      while not(q.eof) do
         begin
            elrubro.text:=q.fields[0].asstring;
            elsfdo.text:=q.fields[1].asstring;
            laarea.text:=q.fields[2].asstring;
            elbanco.text:=q.fields[3].asstring+'-'+q.fields[4].asstring;
            ImprimeRep(elrubro.text,elsfdo.text,laArea.text,elbanco.text,seradj.Checked,false);
            q.next;
            barra.Position:=barra.Position+1;
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
begin
  inherited;

  if esDJcUAD.Checked THEN CadDJ:=' AND EMPL  LIKE '+#39+'DJ%'+#39
  else   CadDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;

  q.close;
  q.sql.text:='SELECT DISTINCT(RUBRO),SFDO,AREA '+
  'FROM PVTRANSFERNOM WHERE NOMINA='+#39+nomina.text+#39+' AND  DECODE(BANCO,NULL,'+#39+'99'+#39+',BANCO)='+
  #39+str_(bancoCuad.text,'-')+#39;
  q.open;
  limpiagrid(gridb);
  gridb.rowcount:=2;
  while not (q.eof) do
    begin
       gridb.cells[0,gridb.rowcount-1]:=q.fields[0].asstring;
       gridb.cells[1,gridb.rowcount-1]:=q.fields[1].asstring;
       gridb.cells[2,gridb.rowcount-1]:=q.fields[2].asstring;
       gridb.rowcount:=gridb.rowcount+1;
       q.next;
    end;
  gridb.rowcount:=gridb.rowcount-1;
  barra.position:=0;
  barra.max:=gridB.rowcount-1;
  for x:=1 to gridB.rowcount-1 do
     begin
        q.close;
        q.sql.text:='SELECT SUM(MONTO) FROM PVTRANSFERNOM WHERE '+
        'NOMINA='+#39+NOMINA.TEXT+#39+
        ' AND RUBRO='+#39+GRIDb.CELLS[0,X]+#39+
        ' AND SFDO='+#39+GRIDb.CELLS[1,X]+#39+
        ' AND AREA='+#39+GRIDb.CELLS[2,X]+#39+
        ' AND DECODE(BANCO,null,'+#39+'99'+#39+',banco)='+#39+STR_(bancoCuad.text,'-')+#39+
        CADDJ;
        Q.open;
        gridB.cells[3,x]:=formatfloat('#,#0.00',q.Fields[0].asfloat);
        barra.Position:=barra.Position+1;
     end;
  totalrep.caption:=formatfloat('#,#0.00',sumacolgrid(gridB,3));
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
ImprimeRep(gridb.cells[0,ling],gridb.cells[1,ling],gridb.cells[2,ling],bancoCuad.text,esDJCuad.Checked,true);
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
      ImprimeRep(gridb.cells[0,x],gridb.cells[1,x],gridb.cells[2,x],bancoCuad.text,esDJCuad.Checked,false);
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
      q.sql.text:='SELECT DISTINCT(A.BANCO), B.tran_descrip  from pvtransfernom a, ptranbancos B WHERE '+
      ' A.BANCO=B.tran_clave AND NOMINA='+#39+Nomina.text+#39+
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
begin
  inherited;
sacaReportest;
end;

End.
