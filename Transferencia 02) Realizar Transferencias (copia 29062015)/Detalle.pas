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
    PageControl1: TPageControl;
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
    rep: TComboBox;
    Label9: TLabel;
    DGR: TDBGrid;
    DsRep: TDataSource;
    Qrep: TQuery;
    Label10: TLabel;
    RegRep: TLabel;
    Label12: TLabel;
    montorep: TLabel;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    bancos: TComboBox;
    grid: TStringGrid;
    s: TQuery;
    Label13: TLabel;
    totalg: TLabel;
    qBancos: TQuery;
    SpeedButton2: TSpeedButton;
    Tick: TEkRTF;
    det: TQuery;
    Qp: TQuery;
    TabSheet4: TTabSheet;
    grupo: TComboBox;
    Label14: TLabel;
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
    GNom: TStringGrid;
    Label19: TLabel;
    NomFec: TComboBox;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Shape1: TShape;
    Label5: TLabel;
    Tipo: TComboBox;
    Label1: TLabel;
    NOMINA: TEdit;
    RNOMINA: TEdit;
    Label3: TLabel;
    Inicia: TEdit;
    Termina: TEdit;
    Label4: TLabel;
    RelPagos: TSpeedButton;
    Label20: TLabel;
    CURES: TComboBox;
    curesd: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    NUMREG: TEdit;
    ImageList1: TImageList;
    ImageList2: TImageList;
    TabSheet7: TTabSheet;
    Label23: TLabel;
    CuaNom: TComboBox;
    Label24: TLabel;
    TotalGN: TLabel;
    GridN: TStringGrid;
    Label25: TLabel;
    MonNom: TLabel;
    MonNomc: TLabel;
    GridB: TStringGrid;
    Label26: TLabel;
    ANIO: TEdit;
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
    TabSheet8: TTabSheet;
    Label32: TLabel;
    RepGrup: TComboBox;
    SpeedButton8: TSpeedButton;
    GridRepGr: TStringGrid;
    Label33: TLabel;
    totalRepGR: TLabel;
    Tick2: TEkRTF;
    T: TQuery;
    agrupa: TCheckBox;
    Label34: TLabel;
    PROG: TProgressBar;
    PMENUTRA: TPopupMenu;
    ExportaraExcel1: TMenuItem;
    GenerarReporte1: TMenuItem;
    Label35: TLabel;
    barra: TProgressBar;
    SpeedButton9: TSpeedButton;
    Label36: TLabel;
    pagoCanc: TEdit;
    SpeedButton1: TSpeedButton;
    Shape2: TShape;
    netoE: TLabel;
    Label37: TLabel;
    DJG: TLabel;
    Label39: TLabel;
    NETOG: TLabel;
    PReportes: TPopupMenu;
    ExportarTodos1: TMenuItem;
    VerReporte1: TMenuItem;
    MenTrans: TPopupMenu;
    GenerarTodasTransferencias1: TMenuItem;
    GenerarTodosHSBC1: TMenuItem;
    TabSheet9: TTabSheet;
    CatReportes: TScrollBox;
    LosGrupos: TScrollBox;
    elGrupo: TScrollBox;
    NGrupo: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure TipoChange(Sender: TObject);
    procedure NOMINAChange(Sender: TObject);
    procedure RelPagosClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure repChange(Sender: TObject);
    procedure DGRDblClick(Sender: TObject);
    procedure bancosChange(Sender: TObject);
    Function CalculaSQL(reporte:string;tipo:string):string;
    procedure DGDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DGRDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ImprimeRep(Mostrar:boolean);
    procedure TickScanRecord(ScanInfo: TEkScanInfo);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure grupoChange(Sender: TObject);
    procedure genSanClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ExportarHSBC(abrir:boolean);
    procedure NomFecChange(Sender: TObject);
    procedure GNomKeyPress(Sender: TObject; var Key: Char);
    procedure GNomKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GNomSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
      procedure getDescripGrid;
      FUNCTION  getNomina(tipo:string; col:integer):string;
    procedure CURESChange(Sender: TObject);
    procedure curesdChange(Sender: TObject);
    procedure GridGrDblClick(Sender: TObject);
    procedure CuaNomChange(Sender: TObject);
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
    procedure RepGrupChange(Sender: TObject);
    procedure TabSheet8Enter(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ImprimeRepGr;
    procedure GridRepGrDblClick(Sender: TObject);
    procedure GridNSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ExportaraExcel1Click(Sender: TObject);
    procedure GenerarReporte1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure pagoCancChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ExportarTodos1Click(Sender: TObject);
    procedure VerReporte1Click(Sender: TObject);
    procedure GenerarTodasTransferencias1Click(Sender: TObject);
    procedure GenerarTodosHSBC1Click(Sender: TObject);
    procedure GenerartodosSantander1Click(Sender: TObject);
    procedure LimpiarScroll(lista: TScrollBox);
    procedure ClickGrupo(sender:tobject);
    procedure quitarReporte( Sender: TObject);
    procedure addReporteGrupo(sender:Tobject);
    procedure Button2Click(Sender: TObject);
    procedure cargaSinGrupos;
procedure CargaLosGrupos;
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure buscarEmplClick(Sender: TObject);
    procedure QuitarCuenta1Click(Sender: TObject);
    procedure ColocarHSBC1Click(Sender: TObject);
    procedure ColocarBancomer1Click(Sender: TObject);
    procedure ColocarSantander1Click(Sender: TObject);
    procedure emplBusKeyPress(Sender: TObject; var Key: Char);
    procedure ExportarreportedeCuentas1Click(Sender: TObject);
    procedure VertodoslosPagos1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
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


  private
    { Private declarations }
    iComponenteX, iComponenteY: Integer;
    bMoviendo: Boolean;
  public
    { Public declarations }
  end;

var
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

 ANIO.TEXT:= formatdatetime('yyyy',now);
 VUres:='URESP';
 VURES_DESC:='URESP_DESC';
 cURES.TEXT:='URESP';
 cURESD.text:='URESP_DESC';


 gridgr.Cells[0,0]:='CUENTA';
 gridgr.Cells[1,0]:='EMPL';
 gridgr.Cells[2,0]:='NOMBRE';
 gridgr.Cells[3,0]:='MONTO';

 GRID.CELLS[0,0]:='Reporte';
 GRID.CELLS[1,0]:='Monto';

 GRIDn.CELLS[0,0]:='Reporte';
 GRIDn.CELLS[1,0]:='Monto';

 GRIDB.CELLS[0,0]:='Banco';
 GRIDB.CELLS[1,0]:='Monto';

 GridRepGr.Cells[0,0]:='REPORTE';
 GridRepGr.Cells[1,0]:='MONTO';
 GridRepGr.Cells[2,0]:='NO.';

 gnom.Cells[0,0]:='Tip';
 gnom.Cells[1,0]:='Núm.';
 gnom.Cells[2,0]:='Descripción';
 gnom.Cells[3,0]:='Inicia';
 gnom.Cells[4,0]:='Termina';

 gnom.Cells[0,1]:='O';
 gnom.Cells[0,1]:='C';
 gnom.Cells[0,1]:='H';
 gnom.Cells[0,1]:='N';
 gnom.Cells[0,1]:='V';
    TABU:=FALSE;
 //cARGAMOS LAS NOMINAS
   q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNOMINAS WHERE NOMI_TIPO='+#39+'O'+#39;
   savetofilelog(q.sql.text);
   Q.open;
   gnom.Cells[0,1]:='O';
   gnom.cells[1,1]:=q.fields[0].asstring;
   ling:=1; colg:=1; getDescripGrid;

   Q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNOMINAS WHERE NOMI_TIPO='+#39+'C'+#39;
   savetofilelog(q.sql.text);
   Q.open;
   gnom.Cells[0,2]:='C';
   gnom.cells[1,2]:=q.fields[0].asstring;
   ling:=2; colg:=1; getDescripGrid;

   Q.Close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PHNOMINAS';
   savetofilelog(q.sql.text);
   Q.open;
   gnom.Cells[0,3]:='H';
   gnom.cells[1,3]:=q.fields[0].asstring;
   ling:=3; colg:=1; getDescripGrid;

   q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNNOMINAS';
   savetofilelog(q.sql.text);
   Q.open;
   gnom.Cells[0,4]:='N';
   gnom.cells[1,4]:=q.fields[0].asstring;
   ling:=4; colg:=1; getDescripGrid;

   q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PINOMINAS';
   savetofilelog(q.sql.text);
   Q.open;
   gnom.Cells[0,5]:='V';
   gnom.cells[1,5]:=q.fields[0].asstring;
   ling:=5; colg:=1; getDescripGrid;

   savetofilelog('termine');
   fechagen:=NomFec.text+'/'+ANIO.TEXT;
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
   q.close;
   if str_(tipo.text,'-')='O' then
       q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNOMINAS WHERE NOMI_TIPO='+#39+'O'+#39;
   if str_(tipo.text,'-')='C' then
       q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNOMINAS WHERE NOMI_TIPO='+#39+'C'+#39;
   if str_(tipo.text,'-')='H' then
       q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PHNOMINAS';
   if str_(tipo.text,'-')='N' then
       q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNNOMINAS';
    if str_(tipo.text,'-')='V' then
       q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PINOMINAS';

   Q.open;
   NOMINA.TEXT:=q.fields[0].asstring;

end;

procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
  q.close;
   if (str_(tipo.text,'-')='O') OR (str_(tipo.text,'-')='C') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='H' then
       q.sql.text:='SELECT * FROM PHNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='N' then
       q.sql.text:='SELECT * FROM PNNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='V' then
       q.sql.text:='SELECT * FROM PINOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;

  q.open;
  RNOMINA.Text:=q.fieldbyname('NOMI_DESCRIP').asstring;
  inicia.Text:=q.fieldbyname('NOMI_FECINI').asstring;
  termina.Text:=q.fieldbyname('NOMI_FECFIN').asstring;

  qcuentas.close;
  qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
  'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
  'OBS, CANCELADO, NPAGO FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+' ORDER BY EMPL';
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
  montop.caption:=formatfloat('#0.00',q.Fields[0].asfloat);

  q.close;
  q.sql.text:='SELECT sum(TRAN_NETO) FROM PTRANSFERNOM T  WHERE T.TRAN_NOMINA='+NOMINA.text+
  ' AND TRAN_TEMPL<>'+#39+'P'+#39;
  q.Open;
  montoe.caption:=formatfloat('#0.00',q.Fields[0].asfloat);

  RelPagos.Enabled:=true;
  q.close;
  q.sql.text:='SELECT COUNT(*) FROM PTRANSFERNOM WHERE TRAN_NOMINA='+NOMINA.TEXT;
  Q.open;
  if q.fields[0].asinteger>0 then
      RelPagos.Enabled:=false;


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
      if Application.MessageBox('Está nómina ya se encuentra traspada, ¿Desea volver hacer el proceso?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
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
        'OBS, CANCELADO, NPAGO FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+' ORDER BY EMPL';
        savetofileLog(QCuentas.sql.text);
        qCuentas.Open;
        NOMINAChange(nil);
     end;
end;

procedure TFDetalle.TabSheet2Enter(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='SELECT DISTINCt(TRAN_NOMBRE) FROM PTRANREPORT WHERE TRAN_TIPONOM='+#39+STR_(TIPO.TEXT,'-')+#39+
  ' AND TRAN_ACTIVO='+#39+'S'+#39;
  Q.open;
  rep.Clear;
  while not(q.eof) do
     begin
        rep.Items.Add(q.fields[0].asstring);
        q.next;
     end;

end;

Function TFDetalle.CalculaSQL(reporte:string;tipo:string):string;
var
cadUres:string;
cadTpsto:string;
cadSfdo:string;
cadTempl:String;
cadEmpl:string;
cadsql:string;
cadPrin:String;
cadCount:String;
CadSum: String;
cadCondEmpl:string;
elbanco:string;
apos1,apos2:string;
VpstoNull:string;
VEsDJ:string;
begin

  q.close;
  q.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_NOMBRE='+#39+reporte+#39;
  Q.open;

   //Si es un reporte de cheque se elimina todo por que es un cheque
  IF q.fieldbyname('tran_cheque').asstring='S' then begin elbanco:='BANCO IS NULL '; apos1:=''; apos2:=''; end
  else begin apos1:=#39; apos2:=#39; elbanco:=' BANCO='; end;

  IF q.fieldbyname('tran_ESDEPED').asstring='S' then  VpstoNull:='' else VpstoNull:=' AND PSTO IS NOT NULL ';

  IF q.fieldbyname('tran_ESDJ').asstring='S' then  VEsDJ:=' AND EMPL LIKE '+#39+'DJ%'+#39 else VEsDJ:=' AND EMPL NOT LIKE '+#39+'DJ%'+#39;


  if (tipo='G') or (tipo='R2') Then
      cadPrin:='SELECT SUBSTR('+VURES+',1,2) AS UR, SUBSTR('+VURES+',3,5) AS ES, '+
      ' S.'+VURES_DESC+' AS DESCURES, S.EMPL AS EMPL, S.NOMBRE AS NOMBRE, '+
      ' S.CUENTA AS CUENTA, S.CANCELADO, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  '+
      elbanco+apos1+Q.fieldbyname('TRAN_BANCO').asstring+apos2+
      ' AND NOMINA='+#39+GETNOMINA(Q.fieldbyname('TRAN_TIPONOM').asstring,1)+#39+
      VpstoNull+VEsDJ;
      //' AND CANCELADO='+#39+'N'+#39;

  if tipo='C' then
      cadPrin:='SELECT count(*) FROM PVTRANSFERNOM S WHERE '+elbanco+apos1+
                Q.fieldbyname('TRAN_BANCO').asstring+apos2+
                ' AND NOMINA='+#39+GETNOMINA(Q.fieldbyname('TRAN_TIPONOM').asstring,1)+#39+
                VpstoNull+VEsDJ;
                //' AND TRAN_CANCEL='+#39+'N'+#39;

  if tipo='S' then
      cadPrin:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE '+elbanco+apos1+
                Q.fieldbyname('TRAN_BANCO').asstring+apos2+
                ' AND NOMINA='+#39+GETNOMINA(Q.fieldbyname('TRAN_TIPONOM').asstring,1)+#39+
                VpstoNull+VEsDJ;
                //' AND TRAN_CANCEL='+#39+'N'+#39;

  //Para el Reporte Encabezado
  if tipo='R' then
      cadPrin:='SELECT distinct('+VURES+') AS URES,S.'+VURES_DESC+' AS DESCURES FROM PVTRANSFERNOM S WHERE  '+
      elbanco+apos1+Q.fieldbyname('TRAN_BANCO').asstring+apos2+
      ' AND NOMINA='+#39+GETNOMINA(Q.fieldbyname('TRAN_TIPONOM').asstring,1)+#39+
      VpstoNull+VEsDJ;

  if (tipo='TR') Then
      cadPrin:='SELECT  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, SUM(S.MONTO) AS MONTO FROM PVTRANSFERNOM S WHERE  '+
      elbanco+apos1+Q.fieldbyname('TRAN_BANCO').asstring+apos2+
      ' AND MONTO>0 AND CANCELADO='+#39+'N'+#39+
      ' AND NOMINA='+#39+GETNOMINA(Q.fieldbyname('TRAN_TIPONOM').asstring,1)+#39+
      VpstoNull+VEsDJ;

  cadsql:='';
  cadUres:=CHR(39)+stringReplace(q.fieldbyname('tran_uresp').asstring,',',#39+','+#39,[rfReplaceAll])+CHR(39);
  IF q.fieldbyname('tran_uresp').asstring<>'' then
     cadSQL:=cadSQL+' AND URESP IN ('+cadUres+')';

  cadTpsto:=CHR(39)+stringReplace(q.fieldbyname('tran_tpsto').asstring,',',#39+','+#39,[rfReplaceAll])+CHR(39);
  IF q.fieldbyname('tran_tpsto').asstring<>'' then
     cadSQL:=cadSQL+' AND TPSTO IN ('+cadTPsto+')';

  cadSfdo:=CHR(39)+stringReplace(q.fieldbyname('tran_sfdo').asstring,',',#39+','+#39,[rfReplaceAll])+CHR(39);
  IF q.fieldbyname('tran_sfdo').asstring<>'' then
     cadSQL:=cadSQL+' AND SFDO IN ('+cadSfdo+')';

  cadTempl:=CHR(39)+stringReplace(q.fieldbyname('tran_TEMPL').asstring,',',#39+','+#39,[rfReplaceAll])+CHR(39);
  IF q.fieldbyname('tran_TEMPL').asstring<>'' then
     cadSQL:=cadSQL+' AND TEMPL IN ('+cadTempl+')';


  IF q.fieldbyname('tran_ESDEPED').asstring='S' then
     cadSQL:=cadSQL+' AND PSTO IS NULL ';

  cadEmpl:=q.fieldbyname('tran_empl').asstring;
  cadCondEmpl:=copy(cadempl,1,pos(':',cadempl)-1);
  cadEmpl:=copy(cadempl,pos(':',cadempl)+1,length(cadempl));
  cadEmpl:=CHR(39)+stringReplace(cadempl,',',#39+','+#39,[rfReplaceAll])+CHR(39);
  IF q.fieldbyname('tran_empl').asstring<>'' then
     cadSQL:=cadSQL+' '+CADcondEmpl+'( EMPL IN ('+cadEmpl+')'+
     ' AND NOMINA='+#39+GETNOMINA(Q.fieldbyname('TRAN_TIPONOM').asstring,1)+#39+')';



  if tipo='G' then
     CadPrin:=CadPrin+' '+CADSQL+' GROUP BY SUBSTR(S.'+VURES+',1,2), SUBSTR(S.'+VURES+',3,5), '+
              ' S.'+VURES_DESC+', S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2,4';

  if tipo='R2' then
     CadPrin:=CadPrin+' '+CADSQL;

  if (tipo='C') or (tipo='S') or (tipo='R') then
     CadPrin:=CadPrin+' '+CADSQL;

  if tipo='TR' then
     CadPrin:=CadPrin+' '+CADSQL+' GROUP BY  EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA'+
              ' ORDER BY 2';

calculaSql:=CadPrin;


end;


procedure TFDetalle.repChange(Sender: TObject);
begin
  inherited;


  Qrep.close;
  QRep.sql.text:=calculasql(rep.text,'G');
  savetofilelog(qrep.sql.text);
  qRep.open;
  NOP.Caption:=inttostr(qrep.recordcount);

  Q.close;
  Q.sql.text:=calculasql(rep.text,'C');
  savetofilelog(q.sql.text);
  q.open;
  regrep.caption:=q.Fields[0].asstring;

  Q.close;
  Q.sql.text:=calculasql(rep.text,'S');
  savetofilelog(q.sql.text);
  q.open;
  montorep.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

end;

procedure TFDetalle.DGRDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qrep);
end;



procedure TFDetalle.bancosChange(Sender: TObject);
var
Vtotal,Vdj:real;
begin
  inherited;
  LIMPIAGRID(grid);
  grid.rowcount:=2;

    qBancos.close;
  qBancos.sql.text:='SELECT count(*) FROM PTRANREPORT WHERE TRAN_BANCO='+#39+STR_(bancoS.text,'-')+#39+
  ' AND TRAN_TIPONOM='+#39+str_(tipo.text,'-')+#39+' AND TRAN_ACTIVO='+#39+'S'+#39;
  SAVETOFILELOG(QBancos.SQL.TEXT);
  qBancos.open;

  barra.Max:=qbancos.fields[0].asinteger;
  barra.Position:=0;

  qBancos.close;
  qBancos.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_BANCO='+#39+STR_(bancoS.text,'-')+#39+
  ' AND TRAN_TIPONOM='+#39+str_(tipo.text,'-')+#39+' AND TRAN_ACTIVO='+#39+'S'+#39+
  ' ORDER BY TRAN_NOMBRE';
  SAVETOFILELOG(QBancos.SQL.TEXT);
  qBancos.open;


  while not (qBancos.eof) do
     begin
        s.close;
        s.sql.text:=calculasql(QBancos.fieldbyname('TRAN_NOMBRE').asstring,'S');
        S.open;
        grid.cells[0,grid.rowcount-1]:=QBancos.fieldbyname('TRAN_NOMBRE').asstring;
        grid.cells[1,grid.rowcount-1]:=formatfloat('#,#0.00',S.Fields[0].asfloat);

        QBancos.next;
        barra.Position:=barra.position+1;
        grid.RowCount:=grid.RowCount+1;

     end;
   vdj:=sumacolGridInicia(Grid,1,0,str_(tipo.text,'-')+'_DJ_');
   djg.caption:=formatfloat('#,#0.00',vdj);
   vtotal:=sumacolGrid(Grid,1);
   totalg.caption:=formatfloat('#,#0.00',vtotal);
   vtotal:=vtotal-vdj;
   netog.caption:=formatfloat('#,#0.00',vtotal);


   barra.Position:=0;
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



procedure TFDetalle.ImprimeRep(Mostrar:boolean);
var
vis:string;
venci:string;
Q:Tquery;
Subtotal, total, isr:real;
TipoNom:string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;


if not(fileexists(ExtractFiledir(Paramstr(0))+'\RepTransfer.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPTRANSFER','rtf');

  q.close;
  q.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_NOMBRE='+#39+REP.TEXT+#39;
  savetofilelog(q.sql.text);
  Q.open;
  tiponom:=Q.fieldbyname('TRAN_TIPONOM').asstring;

  Tick.ClearVars;
  Tick.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  Tick.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  Tick.CreateVar('INICIA',GETNOMINA(tiponom,3));
  Tick.CreateVar('TERMINA',GETNOMINA(tiponom,4));

  Q.close;
  q.sql.text:='SELECT USER FROM DUAL';
  q.OPEN;
  Tick.CreateVar('USER',Q.fields[0].asstring);

  Tick.CreateVar('NUMNOMINA',GETNOMINA(tiponom,1));
  Tick.CreateVar('NOMBRE',REP.text);


  qP.close;
  qP.sql.text:=calculasql(rep.text,'R');
  savetofilelog('==============='+qP.sql.text);
  qP.open;

  det.close;
  det.sql.text:=calculasql(rep.text,'R2')+' AND '+VURES+'='+#39+QP.fieldbyname('URES').asstring+#39+
               ' GROUP BY SUBSTR(S.'+VURES+',1,2), SUBSTR(S.'+VURES+',3,5), '+
              ' S.'+VURES_DESC+', S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
              ' ORDER BY 1,2';
  savetofilelog(DET.sql.text);
  det.open;

  CreateDir('c:\Transferencias\');
  CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
  CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\');
  CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\'+str_(tipo.text,'-')+'_'+nomina.text+'\');

  Tick.InFile:=ExtractFiledir(Paramstr(0))+'\RepTransfer.rtf';
  Tick.OutFile:='c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Reportes\'+str_(tipo.text,'-')+'_'+nomina.text+'\'+rep.text+'.rtf';

  if mostrar then Tick.ExecuteOpen([QP, det],SW_SHOW)

  else
     begin
        Tick.Execute([QP, det]);
     end;
  // ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;



procedure TFDetalle.ImprimeRepGr;
var
vis:string;
venci:string;
Q:Tquery;
Subtotal, total, isr:real;
tipoNom,SQLJ:string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;


if not(fileexists(ExtractFiledir(Paramstr(0))+'\RepTransferGr.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPTRANSFERGR','rtf');

  Q.close;
  q.sql.text:='SELECT USER FROM DUAL';
  q.OPEN;
  Tick2.CreateVar('USER',Q.fields[0].asstring);


  q.close;
  q.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_GRUPO='+#39+str_(Repgrup.text,'-')+#39;
  savetofilelog(q.sql.text);
  Q.open;
  tiponom:=Q.fieldbyname('TRAN_TIPONOM').asstring;

  Tick2.ClearVars;
  Tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  Tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  Tick2.CreateVar('INICIA',GETNOMINA(tiponom,3));
  Tick2.CreateVar('TERMINA',GETNOMINA(tiponom,4));
  Tick2.CreateVar('NUMNOMINA',GETNOMINA(tiponom,1));
  Tick2.CreateVar('NOMBRE',REP.text);


  Q.FIRST;
  While not (q.eof) do
     begin
        SQLJ:=SQLJ + '('+calculasql(Q.fieldbyname('TRAN_NOMBRE').asstring,'S')+') UNION ';
        Q.next;
     end;
  sqlj:='SELECT '+copy(sqlj,1,length(sqlj)-7)+' FROM DUAL';

  qP.close;
  qP.sql.text:=sqlj;
  savetofilelog(qP.sql.text);
  qP.open;

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\RepTransferGr.rtf';
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepTransferGr.rtf';

  Tick2.ExecuteOpen([QP],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;



procedure TFDetalle.TickScanRecord(ScanInfo: TEkScanInfo);
begin
   if scaninfo.Number=1 then
     begin
        det.close;
        det.sql.text:=calculasql(rep.text,'R2')+' AND '+VURES+'='+#39+QP.fieldbyname('URES').asstring+#39+
                     ' GROUP BY SUBSTR(S.'+VURES+',1,2), SUBSTR(S.'+VURES+',3,5), '+
                    ' S.'+VURES_DESC+', S.EMPL, S.NOMBRE,S.CUENTA, S.CANCELADO'+
                    ' ORDER BY 1,2';
        savetofilelog(DET.sql.text);
        det.open;
     end;
end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
ImprimeRep(true);
end;



procedure TFDetalle.ExportarHSBC(abrir:boolean);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
nombre:string;
begin
CreateDir('c:\Transferencias\');
CreateDir('c:\Transferencias\'+stringReplace(fechaGen,'/','',[rfReplaceAll])+'\');
CreateDir('c:\Transferencias\'+stringReplace(fechaGen,'/','',[rfReplaceAll])+'\HSBC\');
CrearFile('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\HSBC\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk');

ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

showmessage('Exportar....'+GRUPO.TEXT);

ExcelApplication1.Workbooks.Open('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\HSBC\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk',
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


 // if not(abrir) then
     ExcelApplication1.Quit;
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
begin
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
                               '99'+gridgr.cells[0,x]+
                               '          '+
                               colocaceros(stringReplace(gridgr.cells[3,x],'.','',[rfReplaceAll]),15)+
                               colocaespacios(nombre,40)+
                               '001001');
                    cont:=cont+1;
                 end; //para
             CreateDir('c:\Transferencias\');
             CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
             CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\');
             filtran.SaveToFile('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'('+inttostr(empieza)+'_'+inttostr(HASTA)+')'+'.TXT');

             if abrir then
             ShellExecute(handle, 'open', PChar('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Bancomer\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'('+inttostr(empieza)+'_'+inttostr(HASTA)+')'+'.TXT'), nil, nil, SW_show);
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
begin
  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  nombFile:=copy(GRUPO.TEXT,1,21)+'X'+stringReplace(nomfec.TEXT,'/','',[rfReplaceAll])+anio.text;
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

  bancost:=copy(grupo.text,pos('-', grupo.text)+1,length(grupo.text));

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

procedure TFDetalle.TabSheet4Enter(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='SELECT DISTINCT(TRAN_GRUPO), TRAN_BANCO FROM PTRANREPORT WHERE TRAN_TIPONOM='+#39+str_(tipo.text,'-')+#39+
  ' AND TRAN_ACTIVO='+#39+'S'+#39;
  Q.open;
  grupo.Items.clear;
  while not(q.eof) do
     begin
        grupo.Items.Add(q.fields[0].asstring+'-'+Q.fields[1].asstring);
        q.next;
     end;
end;

procedure TFDetalle.grupoChange(Sender: TObject);
var cad:string;
SQL:string;
begin
  inherited;
  try strtodate(nomfec.text+'/'+anio.text); except
      showmessage('No se ha elegido un periodo para nomina o el Año no es correcto');  EXIT;
  end;

  LIMPIAGRID(gridGr);
  gridGr.rowcount:=2;
  gridgr.FixedRows:=1;
  gridgr.Cells[0,0]:='CUENTA';
  gridgr.Cells[1,0]:='EMPL';
  gridgr.Cells[2,0]:='NOMBRE';
  gridgr.Cells[3,0]:='MONTO';


  qGr.close;
  qGr.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_GRUPO='+#39+str_(grupo.text,'-')+#39;
  SAVETOFILELOG(QGr.SQL.TEXT);
  qGr.open;
  CAD:='SELECT EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA, SUM(MONTO) AS MONTO FROM (';
  if agrupa.Checked then
     begin
        while not (qGr.eof) do
           begin
              sql:=calculasql(QGr.fieldbyname('TRAN_NOMBRE').asstring,'TR');
              sql:=copy(sql,1,pos('ORDER BY',SQL)-1);
              cad:=cad+SQL+' UNION ';
              QGR.next;
           end;
        cad:=copy(cad,1,length(cad)-7);
        CAD:=CAD+') GROUP BY EMPL, NOMBRE, NOMBRES, APEPAT, APEMAT, CUENTA';
        savetofilelog(cad);
        s.close;
        s.sql.text:=cad;
        S.open;
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
        gridGr.RowCount:=gridGR.RowCount-1;
     end

  else
     begin
        while not (qGr.eof) do
           begin
              s.close;
              s.sql.text:=calculasql(QGr.fieldbyname('TRAN_NOMBRE').asstring,'TR');
              S.open;
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
              QGr.next;
           end;
         if (QGR.recordcount)>0 then
             gridGr.RowCount:=gridGR.RowCount-1;
     end;

   totalGR.caption:=formatfloat('#0.00',sumacolGrid(gridGr,3));
   Sortgrid(GRIDGR,2,1);
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
begin
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
                          colocaceros(gridgr.cells[1,x],7)+
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

       CreateDir('c:\Transferencias\');
       CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
       CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Santander\');
       filtran.SaveToFile('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Santander\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.TXT');

       if abrirSan then
          ShellExecute(handle, 'open', PChar('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\Santander\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.TXT'), nil, nil, SW_show);
       PSAN.visible:=false;
end;

procedure TFDetalle.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  PSAN.Visible:=false;
end;

procedure TFDetalle.NomFecChange(Sender: TObject);

begin
  inherited;
  fechagen:=NomFec.text+'/'+ANIO.TEXT;
  LIMPIAGRID(gnom);
 //cARGAMOS LAS NOMINAS
   q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNOMINAS WHERE NOMI_TIPO='+#39+'O'+#39+
   ' AND NOMI_FECINI='+#39+fechaGen+#39;
   Q.open;
   gnom.Cells[0,1]:='O';
   gnom.cells[1,1]:=q.fields[0].asstring;
   ling:=1; colg:=1; getDescripGrid;

   Q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNOMINAS WHERE NOMI_TIPO='+#39+'C'+#39+
   ' AND NOMI_FECINI='+#39+FechaGen+#39;
   Q.open;
   gnom.Cells[0,2]:='C';
   gnom.cells[1,2]:=q.fields[0].asstring;
   ling:=2; colg:=1; getDescripGrid;

   Q.Close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PHNOMINAS WHERE '+
   'NOMI_FECINI='+#39+FechaGen+#39;
   Q.open;
   gnom.Cells[0,3]:='H';
   gnom.cells[1,3]:=q.fields[0].asstring;
   ling:=3; colg:=1; getDescripGrid;

   q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PNNOMINAS WHERE '+
   'NOMI_FECINI='+#39+Fechagen+#39;
   Q.open;
   gnom.Cells[0,4]:='N';
   gnom.cells[1,4]:=q.fields[0].asstring;
   ling:=4; colg:=1; getDescripGrid;

   q.close;
   q.sql.text:='SELECT MAX(NOMI_NOMINA) FROM PINOMINAS WHERE '+
   'NOMI_FECINI='+#39+Fechagen+#39;
   Q.open;
   gnom.Cells[0,5]:='V';
   gnom.cells[1,5]:=q.fields[0].asstring;
   ling:=5; colg:=1; getDescripGrid;
end;


FUNCTION  TFDETALLE.getNomina(tipo:string; col:integer):string;
var
x:integer;
begin
   for x:=1 to gnom.rowcount-1 do
       if tipo=gnom.Cells[0,x] then
          break;
   getNomina:= gnom.Cells[col,x];

end;



procedure TFDETALLE.getDescripGrid;
var
NewCol:integer;
tipo:string;
Tnomina:string;
begin
  IF TABU THEN newCol:=colg-1 else newcol:=colg;
  if NewCol=1 then
      begin
         if gnom.Cells[0,ling]='O' then TNOMINA:='PNOMINAS';
         if gnom.Cells[0,ling]='C' then TNOMINA:='PNOMINAS';
         if gnom.Cells[0,ling]='N' then TNOMINA:='PNNOMINAS';
         if gnom.Cells[0,ling]='H' then TNOMINA:='PHNOMINAS';
         if gnom.Cells[0,ling]='V' then TNOMINA:='PINOMINAS';
         q.close;
         q.sql.text:='SELECT * FROM '+TNOMINA+' WHERE NOMI_NOMINA='+#39+gnom.Cells[1,ling]+#39;
         SavetofileLog(q.sql.text);
         Q.open;
         gnom.Cells[2,LING]:=q.fieldbyname('NOMI_DESCRIP').asstring;
         gnom.cells[3,ling]:=q.fieldbyname('NOMI_FECINI').asstring;
         gnom.cells[4,ling]:=q.fieldbyname('NOMI_FECFIN').asstring;
     end;
  tabu:=false;
end;

procedure TFDetalle.GNomKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
IF (KEY=#13) and (colg=1) then
   getDescripGrid;

if (colg=0) or (colg=2) or (colg=3) or (colg=4) then
   key:=#0;

end;

procedure TFDetalle.GNomKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
IF ((colg-1=1)) AND (KEY=9) then
    begin
       tabu:=true; getDescripGrid;
   end;

end;

procedure TFDetalle.GNomSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
Ling:=aROW;
colg:=aCOL;

end;

procedure TFDetalle.CURESChange(Sender: TObject);
begin
  inherited;  if cures.text='URESP' then begin VURES:='URESP'; curesd.Text:= 'URESP_DESC'; end;
  if cures.text='URES' then begin curesd.Text:= 'URES_DESC'; VURES:='URES'; end;
end;

procedure TFDetalle.curesdChange(Sender: TObject);
begin
  inherited;
 if curesd.text='URESP_DESC' then begin curesd.Text:= 'URESP';  VURES_DESC:='URESP_DESC';   end;
  if curesd.text='URES_DESC' then begin curesd.Text:= 'URES';   VURES_DESC:='URES_DESC'; end;
end;                                        

procedure TFDetalle.GridGrDblClick(Sender: TObject);
begin
  inherited;
ExportarGrXLS(GridGr);
end;

procedure TFDetalle.CuaNomChange(Sender: TObject);
begin
  inherited;
  LIMPIAGRID(gridN);
  GridN.rowcount:=2;

  qBancos.close;
  qBancos.sql.text:='SELECT count(*) FROM PTRANREPORT WHERE TRAN_tiponom='+#39+STR_(CuaNom.text,'-')+#39+
  ' AND TRAN_ACTIVO='+#39+'S'+#39;
  qBancos.open;
  barra.Max:=qbancos.fields[0].asinteger;
  barra.Position:=0;

  qBancos.close;
  qBancos.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_tiponom='+#39+STR_(CuaNom.text,'-')+#39+
  ' AND TRAN_ACTIVO='+#39+'S'+#39;
  SAVETOFILELOG(QBancos.SQL.TEXT);
  qBancos.open;


  while not (qBancos.eof) do
     begin
        s.close;
        s.sql.text:=calculasql(QBancos.fieldbyname('TRAN_NOMBRE').asstring,'S');
        S.open;
        if S.Fields[0].asfloat>0 then
           begin
              GridN.cells[0,GridN.rowcount-1]:=QBancos.fieldbyname('TRAN_NOMBRE').asstring;
              GridN.cells[1,GridN.rowcount-1]:=formatfloat('#,#0.00',S.Fields[0].asfloat);
              GridN.RowCount:=GridN.RowCount+1;
           end;
        QBancos.next;
        barra.Position:=barra.Position+1;
     end;
   totalGN.caption:=formatfloat('#,#0.00',sumacolGrid(gridN,1));

//Los que estan Sin cheque
Qbancos.close;
qbancos.sql.text:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE  NOMINA='+#39+
GETNOMINA(STR_(CuaNom.text,'-'),1)+#39+ ' and s.CUENTA is null and s.EMPL NOT LIKE '+#39+'DJ%'+#39;
SAVETOFILELOG(QBancos.SQL.TEXT);
QBancos.open;
GridN.cells[0,GridN.rowcount-1]:='SIN CHEQUE EMPLEADOS';
GridN.cells[1,GridN.rowcount-1]:=formatfloat('#,#0.00',QBANCOS.Fields[0].asfloat);
GridN.RowCount:=GridN.RowCount+1;

//Los que estan Sin cheque
Qbancos.close;
qbancos.sql.text:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE  NOMINA='+#39+
GETNOMINA(STR_(CuaNom.text,'-'),1)+#39+ ' and s.CUENTA is null and s.EMPL NOT LIKE '+#39+'DJ%'+#39;
SAVETOFILELOG(QBancos.SQL.TEXT);
QBancos.open;
GridN.cells[0,GridN.rowcount-1]:='SIN CHEQUE DJ';
GridN.cells[1,GridN.rowcount-1]:=formatfloat('#,#0.00',QBANCOS.Fields[0].asfloat);

//Monto total de la nomina con cancelados
Qbancos.close;
qbancos.sql.text:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE  NOMINA='+#39+
GETNOMINA(STR_(CuaNom.text,'-'),1)+#39+ ' and s.EMPL NOT LIKE '+#39+'DJ%'+#39;
SAVETOFILELOG(QBancos.SQL.TEXT);
QBancos.open;
monnom.caption:=formatfloat('#,#0.00',QBANCOS.Fields[0].asfloat);

//Monto total de la nomina quitando cancelados
Qbancos.close;
qbancos.sql.text:='SELECT sum(MONTO) FROM PVTRANSFERNOM S WHERE  NOMINA='+#39+
GETNOMINA(STR_(CuaNom.text,'-'),1)+#39+ ' AND CANCELADO='+#39+'N'+#39+
' and s.EMPL NOT LIKE '+#39+'DJ%'+#39;
SAVETOFILELOG(QBancos.SQL.TEXT);
QBancos.open;
monnomC.caption:=formatfloat('#,#0.00',QBANCOS.Fields[0].asfloat);

//Los Bancos
 LIMPIAGRID(gridB);
 GRIDB.ROWCOUNT:=2;
qbancos.close;
qbancos.sql.text:='SELECT NVL(BANCO_D,'+#39+'CHEQUE'+#39+'), sum(MONTO) FROM PVTRANSFERNOM S WHERE  NOMINA='+#39+
GETNOMINA(STR_(CuaNom.text,'-'),1)+#39+
' and s.EMPL NOT LIKE '+#39+'DJ%'+#39+
' GROUP BY BANCO_D';
SAVETOFILELOG(QBancos.SQL.TEXT);
QBancos.open;

  while not (qBancos.eof) do
     begin
        GridB.cells[0,GridB.rowcount-1]:=QBancos.fields[0].asstring;
        GridB.cells[1,GridB.rowcount-1]:=formatfloat('#,#0.00',qbancos.Fields[1].asfloat);
        QBancos.next;
        Gridb.RowCount:=Gridb.RowCount+1;
        barra.Position:=barra.Position+1;
     end;
GridB.cells[0,GridB.rowcount-1]:='TOTAL';
GridB.cells[1,GridB.rowcount-1]:=formatfloat('#,#0.00',sumacolGrid(gridB,1));

barra.Position:=0;
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
rep.Text:=gridN.Cells[0,ling];
ImprimeRep(true);


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

procedure TFDetalle.RepGrupChange(Sender: TObject);
begin
  inherited;
  try strtodate(nomfec.text+'/'+anio.text); except
      showmessage('No se ha elegido un periodo para nomina o el Año no es correcto');  EXIT;
  end;

  LIMPIAGRID(GridRepGr);
  GridRepGr.rowcount:=2;
  qGr.close;
  qgr.sql.text:='SELECT * FROM PTRANREPORT WHERE TRAN_GRUPO='+#39+str_(Repgrup.text,'-')+#39+
  ' ORDER BY TRAN_NOMBRE';
  SAVETOFILELOG(Qgr.SQL.TEXT);
  qGr.open;


  while not (qGr.eof) do
     begin
        s.close;
        s.sql.text:=calculasql(QGr.fieldbyname('TRAN_NOMBRE').asstring,'S');
        S.open;
        T.close;
        T.sql.text:=calculasql(QGr.fieldbyname('TRAN_NOMBRE').asstring,'C');
        T.open;
        while not(s.eof) do
           begin
              GridRepGr.cells[0,GridRepGr.rowcount-1]:=QGr.fieldbyname('TRAN_NOMBRE').asstring;
              GridRepGr.cells[1,GridRepGr.rowcount-1]:=formatfloat('#0,00.00',S.fields[0].asfloat);
              GridRepGr.cells[2,GridRepGr.rowcount-1]:=T.fields[0].asstring;
              GridRepGr.rowcount:= GridRepGr.rowcount+1;
              s.nexT;
           end;
        QGr.next;
     end;
   if (S.recordcount)>0 then
       GridRepGr.RowCount:=GridRepGr.RowCount-1;

   totalRepGR.caption:=formatfloat('#0,00.00',sumacolGrid(GridRepGr,1));

end;

procedure TFDetalle.TabSheet8Enter(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='SELECT DISTINCT(TRAN_GRUPO), TRAN_BANCO FROM PTRANREPORT WHERE TRAN_ACTIVO='+#39+'S'+#39;;
  Q.open;
  Repgrup.Items.clear;
  while not(q.eof) do
     begin
        Repgrup.Items.Add(q.fields[0].asstring+'-'+Q.fields[1].asstring);
        q.next;
     end;

end;

procedure TFDetalle.SpeedButton8Click(Sender: TObject);
begin
  inherited;
ImprimeRepGr;
end;

procedure TFDetalle.GridRepGrDblClick(Sender: TObject);
begin
  inherited;
 exportarGrXLS(gridRepGr);
end;

procedure TFDetalle.GridNSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
   Ling:=Arow;
end;

procedure TFDetalle.ExportaraExcel1Click(Sender: TObject);
begin
  inherited;
exportarGrXLS(gridN);
end;

procedure TFDetalle.GenerarReporte1Click(Sender: TObject);
begin
  inherited;
rep.Text:=gridN.Cells[0,ling];
ImprimeRep(true);
end;

procedure TFDetalle.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  qBancos.close;
  qBancos.sql.text:='SELECT TRAN_NOMBRE FROM PTRANREPORT WHERE TRAN_tiponom='+#39+STR_(TIPO.text,'-')+#39;
  SAVETOFILELOG(QBancos.SQL.TEXT);
  qBancos.open;
  barra.Max:=qbancos.RecordCount;
  barra.Position:=0;

  s.close;
  s.sql.text:='UPDATE PTRANREPORT SET TRAN_ACTIVO='+#39+'N'+#39+' WHERE TRAN_tiponom='+#39+STR_(TIPO.text,'-')+#39;
  s.execsql;

  WHILE NOT(qbancos.eof) do
     begin
       s.sql.text:=calculasql(QBancos.fieldbyname('TRAN_NOMBRE').asstring,'S');
       S.open;
       if S.Fields[0].asfloat>0 then
          begin
             s.close;
             s.sql.text:='UPDATE PTRANREPORT SET TRAN_ACTIVO='+#39+'S'+#39+' WHERE TRAN_NOMBRE='+#39+Qbancos.fielDS[0].asstring+#39;
             s.ExecSQL;
          end;
       qbancos.next;
       barra.Position:=barra.Position+1;
     end;
barra.Position:=0;
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
end;

procedure TFDetalle.ExportarTodos1Click(Sender: TObject);
var
x:integer;
begin
  inherited;
  TabSheet2Enter(nil);
  if (tipo.Text<>'') and  (NomFec.Text<>'') then
     begin
        barra.Position:=0;
        barra.Max:=rep.items.count-1;
         for x:=0 to rep.items.count-1 do
            begin
               rep.Text:=rep.items[x];
               ImprimeRep(false);
               barra.position:=barra.position+1;
            end;
     end
  else
     Showmessage('Debe seleccionar el tipo de Nómina y el Periodo de las Nóminas con que debe trabajar');
end;

procedure TFDetalle.VerReporte1Click(Sender: TObject);
begin
  inherited;
   ImprimeRep(true);
end;

procedure TFDetalle.GenerarTodasTransferencias1Click(Sender: TObject);
var
bancost:string;
x:integer;
begin
  inherited;
barra.position:=0;
barra.Max:=grupo.Items.count-1;
for x:=0 to grupo.Items.count-1 do
  begin
      grupo.Text:=grupo.Items[x];
      grupoChange(nil);

      bancost:=copy(grupo.text,pos('-', grupo.text)+1,length(grupo.text));

      //Para archivo de 02 - Bancomer
      if bancost='02' then
         exportarBancomer(false);

      barra.position:=barra.position+1;
  end;
  barra.position:=0;

end;

procedure TFDetalle.GenerarTodosHSBC1Click(Sender: TObject);
var
bancost:string;
x:integer;
begin
  inherited;
barra.position:=0;
barra.Max:=grupo.Items.count-1;
for x:=0 to grupo.Items.count-1 do
  begin
      grupo.Text:=grupo.Items[x];
      grupoChange(nil);

      bancost:=copy(grupo.text,pos('-', grupo.text)+1,length(grupo.text));

       //Para archivo de 01 - HSBC
      if bancost='01' then
           ExportarHSBC(false);

      barra.position:=barra.position+1;
  end;
  barra.position:=0;

end;

procedure TFDetalle.GenerartodosSantander1Click(Sender: TObject);
var
bancost:string;
x:integer;
begin
  inherited;
barra.position:=0;
barra.Max:=grupo.Items.count-1;
for x:=0 to grupo.Items.count-1 do
  begin
      grupo.Text:=grupo.Items[x];
      grupoChange(nil);

      bancost:=copy(grupo.text,pos('-', grupo.text)+1,length(grupo.text));


     //Para archivo de 03 - Santander
      if bancoST='03' then
         exportarSantander;

      barra.position:=barra.position+1;
  end;
  barra.position:=0;

end;


//--------------------------ACOMODAR LOS GRUPOS TRANSFERENCIAS -----------------------------------------

procedure TFDetalle.quitarReporte( Sender: TObject);
var
suParent:TWinControl;
begin
    suParent:= (Sender as Tpanel).parent;
   (Sender as Tpanel).parent:=catReportes;
   (Sender as Tpanel).align:=alTop;
   q.close;
   q.sql.text:='UPDATE PTRANREPORT A SET TRAN_GRUPO='+#39+#39+
   ' WHERE TRAN_ID='+COPY((sender as Tpanel).NAME,2,LENGTH((sender as Tpanel).NAME));
   Q.execsql;
   (sender as Tpanel).ondblclick:=addReportegrupo;

   if elgrupo.ControlCount<=0 then
      begin
         CargaLosGrupos;
         ngrupo.Caption:='';
      end;
end;



procedure TFDetalle.LimpiarScroll(lista: TScrollBox);
var
   i : integer;
begin
  for i := lista.ControlCount -1  downto 0 do
      begin
         Lista.Controls[i].Free;
      end;
end;


procedure TFDetalle.ClickGrupo(sender:Tobject);
var
elPanel:Tpanel;
begin
  limpiarScroll(elGrupo);
  q.close;
  q.sql.text:='SELECT TRAN_ID, TRAN_NOMBRE FROM PTRANREPORT WHERE TRAN_TIPONOM='+#39+STR_(TIPO.TEXT,'-')+#39+
  ' AND TRAN_GRUPO = '+#39+(sender as TPanel).caption+#39+' ORDER BY TRAN_NOMBRE';
  Q.open;

  nGrupo.Caption:=(sender as TPanel).caption;
while not(q.eof) do
     begin
        elPanel:=TPanel.create(elGrupo);
        elpanel.parent:=elGrupo;
        elPanel.visible:=true;
        elPanel.align:=Altop;
        elPanel.Height:=20;
        elPanel.Width:=200;
        elPanel.font.Size:=7;
        elPanel.Font.Style:=[fsBold];
        elPanel.Name:='R'+q.Fields[0].asstring;
        elPanel.Caption:=q.fields[1].asstring;
        elPanel.hint:=q.fields[1].asstring;
        elPanel.showhint:=true;
        elpanel.OnDblClick := quitarReporte;
        elPanel.Alignment:=taLeftJustify;
        q.next;
     end;

end;


       
procedure TFDetalle.addReporteGrupo(sender:Tobject);
var
suParent:TWinControl;
begin
if ngrupo.caption<>'' then
   begin
       suParent:= (Sender as Tpanel).parent;
       (Sender as Tpanel).parent:=elGrupo;
       (Sender as Tpanel).align:=alTop;
       q.close;
       q.sql.text:='UPDATE PTRANREPORT A SET TRAN_GRUPO='+#39+nGrupo.Caption+#39+
       ' WHERE TRAN_ID='+COPY((sender as Tpanel).NAME,2,LENGTH((sender as Tpanel).NAME));
       Q.execsql;
       (sender as Tpanel).ondblclick:=quitarReporte;

   end
else
  showmessage('Primero debe crear un nuevo grupo o elegir un grupo ya existente');
end;




procedure TFDetalle.CargaLosGrupos;
var
elPanel:Tpanel;
begin
 limpiarScroll(losGrupos);
  q.close;
  q.sql.text:='SELECT DISTINCT(TRAN_GRUPO) FROM PTRANREPORT WHERE TRAN_TIPONOM='+#39+STR_(TIPO.TEXT,'-')+#39+
  ' AND TRAN_ACTIVO='+#39+'S'+#39+' ORDER BY TRAN_GRUPO';
  Q.open;
  rep.Clear;
  while not(q.eof) do
     begin
        elPanel:=TPanel.create(losGrupos);
        elpanel.parent:=losGrupos;
        elPanel.visible:=true;
        elPanel.align:=Altop;
        elPanel.Height:=20;
        elPanel.Width:=200;
        elPanel.font.Size:=7;
        elPanel.Font.Style:=[fsBold];
        elPanel.name:='G'+inttostr(losGrupos.controlcount);
        elPanel.Caption:=q.fields[0].asstring;
        elPanel.hint:=q.fields[0].asstring;
        elPanel.Alignment:=taLeftJustify;
        elPanel.showhint:=true;
        elpanel.OnDblClick:=clickGrupo;
        q.next;
     end;
end;

procedure TFDetalle.cargaSinGrupos;
var
elPanel:Tpanel;
begin
 limpiarScroll(catReportes);
  q.close;
  q.sql.text:='SELECT TRAN_ID, TRAN_NOMBRE FROM PTRANREPORT WHERE TRAN_TIPONOM='+#39+STR_(TIPO.TEXT,'-')+#39+
  ' AND TRAN_ACTIVO='+#39+'S'+#39+
  ' AND TRAN_GRUPO IS NULL ORDER BY TRAN_NOMBRE';
  Q.open;
  rep.Clear;
  while not(q.eof) do
     begin
        elPanel:=TPanel.create(catReportes);
        elpanel.parent:=catReportes;
        elPanel.visible:=true;
        elPanel.align:=Altop;
        elPanel.Height:=20;
        elPanel.Width:=200;
        elPanel.font.Size:=7;
        elPanel.Font.Style:=[fsBold];
        elPanel.Alignment:=taLeftJustify;
        elPanel.Name:='R'+q.Fields[0].asstring;
        elPanel.Caption:=q.fields[1].asstring;
        elPanel.hint:=q.fields[1].asstring;
        elPanel.showhint:=true;
        elPanel.OnDblClick:=addReportegrupo;
        q.next;
     end;

end;

procedure TFDetalle.Button2Click(Sender: TObject);
begin
  inherited;
limpiarScroll(losGrupos);
end;

procedure TFDetalle.SpeedButton10Click(Sender: TObject);
var
cad:string;
begin
  inherited;
   if inputquery('Creación de Grupo','Nombre del Nuevo Grupo',cad)  then
      BEGIN
         ngrupo.caption:=cad;
         limpiarScroll(elGrupo);
      End;
end;

procedure TFDetalle.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if elGrupo.Controlcount>0 then
      if Application.MessageBox('Seguro que desea eliminar el Grupo completo','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
         begin
             q.close;
             q.sql.text:='UPDATE PTRANREPORT A SET TRAN_GRUPO='+#39+#39+
             ' WHERE TRAN_GRUPO='+#39+NGRUPO.CAPTION+#39;
             Q.execsql;
             cargalosGrupos;
             cargaSinGrupos;
             ngrupo.caption:='';
             limpiarScroll(elGrupo);
         end;
end;

procedure TFDetalle.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  cargaSinGrupos;
  cargaLosGrupos;

end;

procedure TFDetalle.buscarEmplClick(Sender: TObject);
begin
  inherited;
        qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
        'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
        'OBS, CANCELADO, NPAGO FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+
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
  qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, BANCO, '+
        'BANCO_D AS BANCOD, CUENTA, URES, TPSTO AS TIPO_PSTO, MONTO, NOMINA, '+
        'OBS, CANCELADO, NPAGO FROM PVTRANSFERNOM T  WHERE NOMINA='+NOMINA.text+' ORDER BY EMPL';
        savetofileLog(QCuentas.sql.text);
        qCuentas.Open;
end;

procedure TFDetalle.PageControl1Change(Sender: TObject);
begin
  inherited;
   if pageControl1.ActivePageIndex=7 then
       dir.Directory:='C:\Transferencias';
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
begin
   CopiarExcel(gridh,arch.FileName);
end;

procedure TFDetalle.verificaSantander;
begin
   CopiarExcel(gridh,arch.FileName);
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
var
bancost:string;
x:integer;
begin
  inherited;
barra.position:=0;
barra.Max:=grupo.Items.count-1;
for x:=0 to grupo.Items.count-1 do
  begin
      grupo.Text:=grupo.Items[x];
      grupoChange(nil);

      bancost:=copy(grupo.text,pos('-', grupo.text)+1,length(grupo.text));

      abrirSan:=false;
     //Para archivo de 03 - Santander
      if bancoST='03' then
         genSanClick(nil);

      barra.position:=barra.position+1;
  end;
  barra.position:=0;

end;


End.
