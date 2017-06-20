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
    Q: TQuery;
    aux: TQuery;
    SpeedButton4: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Nomina: TEdit;
    tipo: TEdit;
    descrip: TEdit;
    TPSTO: TComboBox;
    INI: TEdit;
    TER: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    NPAG: TLabel;
    Label9: TLabel;
    TPER: TLabel;
    Label11: TLabel;
    TDED: TLabel;
    Label13: TLabel;
    NETO: TLabel;
    SpeedButton1: TSpeedButton;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    QD: TQuery;
    DSQD: TDataSource;
    QDJ: TQuery;
    DSDJ: TDataSource;
    Label8: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    newNom: TEdit;
    newTipo: TEdit;
    newDescrip: TEdit;
    newIni: TEdit;
    newTer: TEdit;
    Shape1: TShape;
    Shape2: TShape;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    OBS: TMemo;
    TabSheet5: TTabSheet;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DsPagos: TDataSource;
    Qpagos: TQuery;
    QNewDJ: TQuery;
    DsNewDj: TDataSource;
    DsPacPagos: TDataSource;
    QPacPagos: TQuery;
    Label12: TLabel;
    nnpag: TLabel;
    Label17: TLabel;
    nper: TLabel;
    Label19: TLabel;
    nded: TLabel;
    Label21: TLabel;
    nneto: TLabel;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton8Click(Sender: TObject);
    procedure tipoChange(Sender: TObject);
    procedure TPSTOChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure newNomChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

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
  VPNOMINAS:STRING;
  VPVPAGOS:STRING;
  VPVDPAGOS:STRING;
  VPACPAGOS:STRING;
  lospuestos:STRING;
  newNomina:string;
  VPPAGOS:STRING;

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


procedure TFDetalle.GCQTSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
lin:=arow;
col:=acol;
end;

procedure TFDetalle.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  Q.Close;
  q.sql.text:='SELECT * FROM TODANOMINAS A WHERE A.NOMI_NOMINA='+nomina.text;
  Q.open;
  tipo.text:=q.Fieldbyname('ELTIPO').asstring;
  DESCRIP.text:=q.Fieldbyname('NOMI_DESCRIP').asstring;
  INI.text:=q.Fieldbyname('NOMI_FECINI').asstring;
  TER.text:=q.Fieldbyname('NOMI_FECFIN').asstring;

  
end;

procedure TFDetalle.tipoChange(Sender: TObject);
begin
  inherited;
  IF tipo.Text='N' THEN begin VPPAGOS:='PNPAGOS'; VPVDPAGOS:='PVNDPAGOS'; VPNOMINAS:='PNNOMINAS'; VPVPAGOS:='PVNPAGOS'; VPACPAGOS:='PNACPAGOS'; end;
  IF tipo.Text='O' THEN begin VPPAGOS:='PPAGOS'; VPVDPAGOS:='PVDPAGOS'; VPNOMINAS:='PNOMINAS'; VPVPAGOS:='PVPAGOS'; VPACPAGOS:='PACPAGOS'; end;
  IF tipo.Text='H' THEN begin VPPAGOS:='PHPAGOS'; VPVDPAGOS:='PVHDPAGOS'; VPNOMINAS:='PHNOMINAS'; VPVPAGOS:='PVHPAGOS'; VPACPAGOS:='PHACPAGOS'; end;


end;

procedure TFDetalle.TPSTOChange(Sender: TObject);
begin
  inherited;
  lospuestos:=tpsto.text;
  lospuestos:=#39+stringreplace(lospuestos, ',', #39+','+#39,[rfReplaceAll, rfIgnoreCase])+#39;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
VAR
per:real;
ded:real;
begin
  inherited;
  QD.CLOSE;
  qd.SQL.text:='SELECT VPAG_PAGO AS PAGO, VPAG_NOMINA AS NOMINA, VPAG_FECHA AS FECHA, VPAG_EMPL AS EMPL, '+
  ' VPAG_NOMBRE AS NOMBRE, VPAG_PERCS AS PERCEPCIONES, VPAG_DEDUS AS DEDUCCIONES, '+
  ' VPAG_NETO AS NETO FROM '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NOMINA.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  qD.OPEN;

  q.close;
  q.sql.text:='SELECT COUNT(*) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NOMINA.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  npag.caption:=q.Fields[0].asstring;

  q.close;
  q.sql.text:='SELECT sum(VPAG_PERCS) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NOMINA.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  per:=q.Fields[0].asfloat;
  TPER.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

  q.close;
  q.sql.text:='SELECT sum(VPAG_DEDUS) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NOMINA.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  ded:=q.Fields[0].asfloat;
  TDED.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

  NETO.Caption:= formatfloat('#,#0.00',PER-DED);


  QDJ.CLOSE;
  QDJ.SQL.TEXT:='SELECT VPAG_PAGO AS PAGO, VPAG_NOMINA AS NOMINA, VPAG_FECHA AS FECHA, '+
  ' VPAG_EMPL AS EMPL, VPAG_NOMBRE AS NOMBRE, VPAG_PERCS AS PERCEPCIONES, VPAG_DEDUS '+
  ' AS DEDUCCIONES, VPAG_NETO AS NETO FROM ' +VPVPAGOS +' S WHERE S.VPAG_Pago IN ( '+
                     'SELECT A.VDPA_Pago FROM '+VPVDPAGOS+' A WHERE A.VDPA_Descrip IN ('+
                              'SELECT '+#39+'TERCERO '+#39+'||S.VPAG_Empl FROM '+VPVPAGOS+
                              ' S WHERE S.VPAG_Nomina='+NOMINA.TEXT+
                              ' AND S.VPAG_TPsto IN ('+lospuestos+'))'+
                     ' AND A.VDPA_Nomina='+NOMINA.TEXT+')';
  QDJ.OPEN;
end;

procedure TFDetalle.SpeedButton4Click(Sender: TObject);
var
per,ded:real;
begin
  inherited;
  OBS.CLEAR;

  Q.close;
  q.sql.text:='SELECT  PSQNOMINA.NEXTVAL  FROM DUAL';
  Q.open;
  newNomina:=q.fields[0].asstring;
  OBS.Lines.ADD('Obtenemos Numero de Nómina '+newNomina);

  Q.close;
  q.sql.text:='SELECT * FROM '+VPNOMINAS+' WHERE NOMI_NOMINA='+nomina.text;
  Q.open;
  OBS.Lines.ADD('Obtenemos Datos de Nómina anterior ');


  aux.close;
  aux.sql.text:='INSERT INTO '+VPNOMINAS+' (NOMI_NOMINA, NOMI_TIPO, NOMI_FECHA, NOMI_FECINI, NOMI_FECFIN) '+
  ' VALUES ('+
  #39+newNomina+#39+','+
  #39+'E'+#39+','+
  #39+Q.fieldbyname('NOMI_FECHA').asstring+#39+','+
  #39+Q.fieldbyname('NOMI_FECINI').asstring+#39+','+
  #39+Q.fieldbyname('NOMI_FECFIN').asstring+#39+')';
  Aux.execsql;
  OBS.Lines.ADD('Se inserto la Nómina: '+newNomina);

  newNom.text:=newNomina;

  Q.close;
  q.sql.text:='UPDATE PACPAGOS S SET S.ACPA_NOMINA='+NEWNOMINA+
              ' WHERE S.ACPA_NOMINA='+NOMINA.TEXT;
  Q.execsql;

  QPacPagos.close;
  QPacPagos.SQL.text:='SELECT ACPA_PAGO AS PAGO, ACPA_DIAS AS DIAS, ACPA_PERCS AS PERC,'+
  ' ACPA_DEDUS AS DEDUS, ACPA_NOMINA AS NOMINA, ACPA_EMPL AS EMPL FROM PACPAGOS S '+
  ' WHERE S.ACPA_NOMINA='+NEWnOMINA;
  QPacPagos.OPEN;

  OBS.Lines.ADD('Se actualizo tabla PACPAGOS');

  //=================================================================
  Q.CLOSE;
  Q.SQL.TEXT:='UPDATE '+VPPAGOS+' SET PAGO_NOMINA='+NEWnOMINA+' WHERE PAGO_PAGO IN ('+
                       'SELECT VPAG_PAGO FROM '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+
                       NOMINA.TEXT+' AND S.VPAG_TPsto IN ('+lospuestos+'))';
  Q.ExecSQL;

  OBS.Lines.ADD('Se Cambiaron de Nómina los Pagos');

  QPAGOS.Close;
  qpagos.sql.text:= 'SELECT VPAG_PAGO AS PAGO, VPAG_NOMINA AS NOMINA, VPAG_FECHA AS FECHA, VPAG_EMPL AS EMPL, '+
  ' VPAG_NOMBRE AS NOMBRE, VPAG_PERCS AS PERCEPCIONES, VPAG_DEDUS AS DEDUCCIONES, '+
  ' VPAG_NETO AS NETO FROM '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+newnomina+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  SAVETOFILELOG(Qpagos.sql.text);
  QPagos.open;

  q.close;
  q.sql.text:='SELECT COUNT(*) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+newNomina+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  npag.caption:=q.Fields[0].asstring;

  q.close;
  q.sql.text:='SELECT sum(VPAG_PERCS) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+newNomina+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  per:=q.Fields[0].asfloat;
  nPER.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

  q.close;
  q.sql.text:='SELECT sum(VPAG_DEDUS) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NewNomina+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  ded:=q.Fields[0].asfloat;
  nDED.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

  nNETO.Caption:= formatfloat('#,#0.00',PER-DED);


   Q.CLOSE;
   Q.SQL.TEXT:='UPDATE '+VPPAGOS+' SET PAGO_NOMINA='+NEWnOMINA+' WHERE PAGO_PAGO IN ('+
                       'SELECT VPAG_PAGO AS PAGO FROM ' +VPVPAGOS +' S WHERE '+
                       'S.VPAG_Pago IN ( '+
                                          'SELECT A.VDPA_Pago FROM '+VPVDPAGOS+' A WHERE '+
                                          'A.VDPA_Descrip IN ('+
                                                                'SELECT '+#39+'TERCERO '+#39+
                                                                '||S.VPAG_Empl FROM '+VPVPAGOS+
                                                                ' S WHERE S.VPAG_Nomina='+newNomina+
                                                                ' AND S.VPAG_TPsto IN ('+lospuestos+'))'+
                                          ' AND A.VDPA_Nomina='+NOMINA.TEXT+'))';
  SAVETOFILELOG(q.sql.text);
  Q.ExecSQL;
  OBS.Lines.ADD('Se Cambiaron de Nómina los Pagos DJ');

  qnewdj.close;
  qnewdj.SQL.text:='SELECT VPAG_PAGO AS PAGO, VPAG_NOMINA AS NOMINA, VPAG_FECHA AS FECHA, '+
  ' VPAG_EMPL AS EMPL, VPAG_NOMBRE AS NOMBRE, VPAG_PERCS AS PERCEPCIONES, VPAG_DEDUS '+
  ' AS DEDUCCIONES, VPAG_NETO AS NETO FROM ' +VPVPAGOS +' S WHERE S.VPAG_Pago IN ( '+
                     'SELECT A.VDPA_Pago FROM '+VPVDPAGOS+' A WHERE A.VDPA_Descrip IN ('+
                              'SELECT '+#39+'TERCERO '+#39+'||S.VPAG_Empl FROM '+VPVPAGOS+
                              ' S WHERE S.VPAG_Nomina='+newNomina+
                              ' AND S.VPAG_TPsto IN ('+lospuestos+'))'+
                     ' AND A.VDPA_Nomina='+newNomina+')';
  SAVETOFILELOG(q.sql.text);
  qnewdj.OPEN;



end;

procedure TFDetalle.newNomChange(Sender: TObject);
begin
  inherited;
  Q.Close;
  q.sql.text:='SELECT * FROM TODANOMINAS A WHERE A.NOMI_NOMINA='+NewNom.text;
  Q.open;
  newtipo.text:=q.Fieldbyname('ELTIPO').asstring;
  newDESCRIP.text:=q.Fieldbyname('NOMI_DESCRIP').asstring;
  newINI.text:=q.Fieldbyname('NOMI_FECINI').asstring;
  newTER.text:=q.Fieldbyname('NOMI_FECFIN').asstring;
end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
VAR
per,ded:real;
begin
  inherited;
  QPacPagos.close;
  QPacPagos.SQL.text:='SELECT ACPA_PAGO AS PAGO, ACPA_DIAS AS DIAS, ACPA_PERCS AS PERC,'+
  ' ACPA_DEDUS AS DEDUS, ACPA_NOMINA AS NOMINA, ACPA_EMPL AS EMPL FROM PACPAGOS S '+
  ' WHERE S.ACPA_NOMINA='+NEWnOM.TEXT;
  QPacPagos.OPEN;


  QPAGOS.Close;
  qpagos.sql.text:= 'SELECT VPAG_PAGO AS PAGO, VPAG_NOMINA AS NOMINA, VPAG_FECHA AS FECHA, VPAG_EMPL AS EMPL, '+
  ' VPAG_NOMBRE AS NOMBRE, VPAG_PERCS AS PERCEPCIONES, VPAG_DEDUS AS DEDUCCIONES, '+
  ' VPAG_NETO AS NETO FROM '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+newnomina+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
   QPagos.open;


  q.close;
  q.sql.text:='SELECT COUNT(*) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NEWnOM.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  npag.caption:=q.Fields[0].asstring;

  q.close;
  q.sql.text:='SELECT sum(VPAG_PERCS) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NEWnOM.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  per:=q.Fields[0].asfloat;
  nPER.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

  q.close;
  q.sql.text:='SELECT sum(VPAG_DEDUS) FROM  '+VPVPAGOS+' S WHERE S.VPAG_Nomina='+NEWnOM.TEXT+
  ' AND S.VPAG_TPsto IN ('+lospuestos+')';
  Q.OPEN;
  ded:=q.Fields[0].asfloat;
  nDED.caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

  nNETO.Caption:= formatfloat('#,#0.00',PER-DED);

   qnewdj.close;
  qnewdj.SQL.text:='SELECT VPAG_PAGO AS PAGO, VPAG_NOMINA AS NOMINA, VPAG_FECHA AS FECHA, '+
  ' VPAG_EMPL AS EMPL, VPAG_NOMBRE AS NOMBRE, VPAG_PERCS AS PERCEPCIONES, VPAG_DEDUS '+
  ' AS DEDUCCIONES, VPAG_NETO AS NETO FROM ' +VPVPAGOS +' S WHERE S.VPAG_Pago IN ( '+
                     'SELECT A.VDPA_Pago FROM '+VPVDPAGOS+' A WHERE A.VDPA_Descrip IN ('+
                              'SELECT '+#39+'TERCERO '+#39+'||S.VPAG_Empl FROM '+VPVPAGOS+
                              ' S WHERE S.VPAG_Nomina='+NEWnOM.TEXT+
                              ' AND S.VPAG_TPsto IN ('+lospuestos+'))'+
                     ' AND A.VDPA_Nomina='+NEWnOM.TEXT+')';
  qnewdj.OPEN;

end;

end.
