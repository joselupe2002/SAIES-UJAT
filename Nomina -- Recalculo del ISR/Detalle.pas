unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList;

  type
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    Q: TQuery;
    DsCuentas: TDataSource;
    QCuentas: TQuery;
    DsRep: TDataSource;
    Qrep: TQuery;
    s: TQuery;
    QISR: TQuery;
    Tick: TEkRTF;
    ImageList2: TImageList;
    DSISR: TDataSource;
    QInfo: TQuery;
    dsInfo: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    SpeedButton1: TSpeedButton;
    Label19: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    nempl: TLabel;
    NomFec: TComboBox;
    Anio: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet6: TTabSheet;
    Shape2: TShape;
    Shape1: TShape;
    Label5: TLabel;
    nocu: TLabel;
    Label6: TLabel;
    DGCuadre: TDBGrid;
    dgISR: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    nempl2: TLabel;
    NomFec2: TComboBox;
    Anio2: TEdit;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    TabSheet7: TTabSheet;
    Shape3: TShape;
    Shape4: TShape;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    TabSheet8: TTabSheet;
    DBGrid8: TDBGrid;
    DsCuentas2: TDataSource;
    Qcuentas2: TQuery;
    Label11: TLabel;
    Label15: TLabel;
    DsCuadre: TDataSource;
    QCuadre: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure DGRDblClick(Sender: TObject);
    procedure NomFecChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DGCuadreDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure NumError;
    procedure DGCuadreDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure NomFec2Change(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure Seleccionar1Click(Sender: TObject);
  private
    { Private declarations }
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
   cad:string;
fechaGen:string;
implementation


//uses Repo;

{$R *.DFM}




procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 596;
 Width :=  667 ;

 ANIO.TEXT:=formatdatetime('yyyy',now);
 ANIO2.TEXT:=formatdatetime('yyyy',now);

end;

procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;


procedure TFDetalle.Seleccionar1Click(Sender: TObject);
begin
 if GQBE.Visible then                             // Selecciona QBE
 else if GValValid.Visible then Selec_Seleccion   // Selecciona Seleccion
 else Selec_Captura ;         // Selecciona Captura
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


procedure TFDetalle.DGRDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qrep);
end;

procedure TFDetalle.NumError;
begin
   nocu.caption:='0';
   While not (qcuadre.eof) do
    begin
      if trunc(qcuadre.fieldbyname('NEWISR').asfloat)<>trunc(qcuadre.fieldbyname('ISR').asfloat) then
         nocu.caption:=inttostr(strtoint(nocu.caption)+1);
         qcuadre.next;
    end;

end;


procedure TFDetalle.NomFecChange(Sender: TObject);

begin
  inherited;
  fechagen:=NomFec.text+'/'+anio.text;
  qcuentas.close;
  qcuentas.sql.text:='SELECT EMPL, GETISRMONTO(GRAV) AS NEWISR,B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+
  #39+' '+#39+'||B.PERS_APEMAT AS NOMBRE, GRAV, ISR  FROM ('+
  'SELECT S.ISRP_EMPL AS EMPL, COUNT(*) AS NUMPAG, SUM(S.ISRP_BASE_GRAV) GRAV, '+
  'SUM(S.ISRP_ISR) AS ISR FROM PISRPAGOS S '+
  ' WHERE S.ISRP_FECHA='+#39+NOMfEC.TEXT+'/'+anio.TEXT+#39+' GROUP BY S.ISRP_EMPL '+
  ') A, FPERSONAS  B WHERE NUMPAG>1 AND A.EMPL=B.PERS_PERSONA';
  Qcuentas.open;
  nempl.caption:=inttostr(qcuentas.recordcount);

   //Nominas afectadas
  q.close;
  q.SQL.text:='select distinct( s.isrp_nomina) from pisrpagos s where s.isrp_fecha='+
  #39+NOmfec.text+'/'+anio.text+#39;
  Q.open;
  cad:='';
  while not(q.eof) do
     begin
        cad:=cad+q.fields[0].asstring+',';
        q.next;
     end;
  cad:=copy(cad,1,length(cad)-1);


  //Datos de registros afectados y cuadrados
  qCuadre.close;
  qCuadre.sql.text:='SELECT EMPL, B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+#39+' '+#39+
  '||B.PERS_APEMAT AS NOMBRE,GRAV, ISR_ANT, getisrmonto(GRAV) AS NEWISR, '+
  'getmontoconc('+#39+cad+#39+','+#39+'058'+#39+',empl) as ISR, '+
  'getmontoconc('+#39+cad+#39+','+#39+'010'+#39+',empl) as credsal '+
  ' FROM ( SELECT S.ISRP_EMPL AS EMPL, COUNT(*) AS NUMPAG, SUM(S.ISRP_BASE_GRAV) '+
  ' GRAV, SUM(S.ISRP_ISR) AS ISR_ANT FROM PVISRPAGOS S WHERE S.ISRP_FECHA='+
  #39+NOmfec.text+'/'+anio.text+#39+' GROUP BY S.ISRP_EMPL '+
  ') A, FPERSONAS B WHERE A.EMPL=B.PERS_PERSONA AND NUMPAG>1 ORDER BY EMPL';
  Savetofilelog(qCuadre.sql.text);
  qCuadre.open;
  numerror;

  qISR.close;
  qISR.SQL.TEXT:='SELECT SUBSTR(EMPL,1,10) AS EMPL, SUBSTR(EJECSQL,1,15) AS MOVIMIENTO FROM PISRRECALCULO A WHERE A.TIPOREG LIKE '+
  #39+'ERROR:'+nomfec.text+'/'+anio.text+#39;
  qISR.open;

  qInfo.close;
  qInfo.SQL.TEXT:='SELECT PAGO, TENIA, QUEDO,AGREGO,ISRTOTAL,EMPL, NEWPAGO,TIPO,NOMINA FROM PISRRECALCULO A WHERE A.TIPOREG='+
  #39+'INFO'+#39+' AND NOMINA IN ('+CAD+')' ;
  qInfo.open;


end;


procedure TFDetalle.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  QREP.CLOSE;
  Qrep.sql.text:='SELECT * FROM PISRPAGOS WHERE ISRP_EMPL='+#39+Qcuentas.fieldbyname('EMPL').asstring+#39+
  ' AND ISRP_FECHA='+#39+NOMFEC.TEXT+'/'+ANIO.TEXT+#39;;
  Qrep.open;

end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);

begin
  inherited;
  if nomfec.Text<>'' then
     begin
      q.close;
      Q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_FECINI='+#39+NOmfec.text+'/'+anio.text+#39;
      Q.open;
      if q.fieldbyname('nomi_contab').asstring='N' then
         begin
             if Application.MessageBox('¿Seguro que desea correr Recalculo ISR afectará los registros de Nómna?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
                 begin
                      q.close;
                      q.sql.text:='SELECT COUNT(*)  FROM PISRRECALCULO s  WHERE S.NOMINA IN ('+
                      cad+')';
                      Savetofilelog(q.sql.text);
                      q.open;
                      if q.fields[0].asinteger<=0 then
                         begin
                            Q.close;
                            q.SQL.text:='CALL  recalculaisr('+#39+NOmfec.text+'/'+anio.text+#39+')';
                            q.ExecSQL;

                            qCuadre.close;
                            qcuadre.open;
                            numerror;

                            QISR.Close;
                            qisr.open;
                            qinfo.close;
                            qinfo.open;
                         end
                      else
                         Showmessage('Ya existen registros de nominas '+cad+'para este periodo que se hizo el recalculo del ISR, NO SE DEBE CORRER DOS VECES');
                 end;
           end
      else
        Showmessage('La nómina ya esta contabilizada no se puede correr recalculo de ISR');
    end
  else
     Showmessage('Debe elegir un periodo de nomina correcto');





end;

procedure TFDetalle.DGCuadreDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  try
    If (trunc(QCuadre.FieldByName('NEWISR').asfloat) <> trunc(QCuadre.FieldByName('ISR').asfloat)) Then
      DGCuadre.Canvas.Brush.Color := $004540FF
    Else
       DgCuadre.canvas.Brush.Color := CLWHITE;
    DgCuadre.Canvas.Font.Color := clBlack;
    DgCuadre.Canvas.FillRect(Rect);
    DgCuadre.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  except
  end;

end;

procedure TFDetalle.DGCuadreDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qcuadre);
end;

procedure TFDetalle.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qcuentas);
end;

procedure TFDetalle.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QInfo);
end;

procedure TFDetalle.NomFec2Change(Sender: TObject);
begin
  inherited;
  fechagen:=NomFec2.text+'/'+ anio2.text;
  qcuentas2.close;
  QCuentas2.sql.text:='SELECT *  FROM ( SELECT t.ISRP_EMPL AS EMPL,'+
  'u.pers_nombre||'+#39+' '+#39+'||u.pers_apepat||'+#39+' '+#39+'||u.pers_apemat as NOMBRE,'+
  'COUNT(*) AS NUM_PUESTOS, SUM(T.ISRP_BASE_GRAV) AS GRAV_PAGOS, sum(t.isrp_isr) AS ISR_PAGOS, '+
  'getisrmontomens(SUM(T.ISRP_BASE_GRAV),t.ESHAS) AS NEW_ISR_TABLA_MENS, '+
  '(SELECT SUM(B.isrp_isr) FROM PvISRPAGOS B WHERE '+
  ' B.ISRP_EMPL=T.ISRP_EMPL AND B.ISRP_FECHA='+#39+NOMfEC2.TEXT+'/'+anio2.TEXT+#39+') AS ISR_2DA, '+
  ' getmontoconcMes('+#39+copy(nomfec2.text,4,2)+#39+','+#39+anio2.text+#39+','+#39+'058'+#39+',t.ISRP_EMPL) AS ISR_EN_PAGOS_REALES'+
  ' FROM PvISRPAGOS T, fpersonas u WHERE t.ISRP_EMPL=u.pers_persona and T.ISRP_MES='+
  ' TO_CHAR(to_date('+#39+NOMfEC2.TEXT+'/'+anio2.TEXT+#39+'),'+#39+'MM'+#39+') AND T.ISRP_ANIO='+
  ' TO_CHAR(to_date('+#39+NOMfEC2.TEXT+'/'+anio2.TEXT+#39+'),'+#39+'YYYY'+#39+')'+
  ' group by t.ISRP_EMPL, '+
  ' u.pers_nombre||'+#39+' '+#39+'||u.pers_apepat||'+#39+' '+#39+'||u.pers_apemat, t.ESHAS)'+
  ' WHERE NEW_ISR_TABLA_MENS>0  ';
  savetofilelog(qcuentas2.sql.text);
  Qcuentas2.open;
  nempl2.caption:=inttostr(qcuentas2.recordcount);

   //Nominas afectadas
  q.close;
  q.SQL.text:='select distinct( s.isrp_nomina) from pisrpagos s where s.isrp_fecha='+
  #39+NOmfec2.text+'/'+anio2.text+#39;
  savetofilelog(qcuentas2.sql.text);
  Q.open;

  cad:='';
  while not(q.eof) do
     begin
        cad:=cad+q.fields[0].asstring+',';
        q.next;
     end;
  cad:=copy(cad,1,length(cad)-1);


  //Datos de registros afectados y cuadrados
  qCuadre.close;
  qCuadre.sql.text:='SELECT EMPL, B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+#39+' '+#39+
  '||B.PERS_APEMAT AS NOMBRE,GRAV, ISR_ANT, getisrmontoMens(GRAV, A.ESHAS) AS NEWISR, '+
  'getmontoconcMes('+#39+copy(nomfec2.text,4,2)+#39+','+#39+anio2.text+#39+','+#39+'058'+#39+',EMPL) as ISR, '+
  'getmontoconcMes('+#39+copy(nomfec2.text,4,2)+#39+','+#39+anio2.text+#39+','+#39+'010'+#39+',EMPL) as credsal '+
  ' FROM ( SELECT S.ISRP_EMPL AS EMPL, ESHAS, COUNT(*) AS NUMPAG, SUM(S.ISRP_BASE_GRAV) '+
  ' GRAV, SUM(S.ISRP_ISR) AS ISR_ANT FROM PVISRPAGOS S WHERE to_char(S.ISRP_FECHA,'+#39+'MM'+#39+')='+
   #39+copy(NOmfec2.text,4,2)+#39+' GROUP BY S.ISRP_EMPL, ESHAS '+
  ') A, FPERSONAS B WHERE A.EMPL=B.PERS_PERSONA';
  Savetofilelog(qCuadre.sql.text);
  qCuadre.open;
  numerror;

  qISR.close;
  qISR.SQL.TEXT:='SELECT SUBSTR(EMPL,1,10) AS EMPL, SUBSTR(EJECSQL,1,15) AS MOVIMIENTO FROM PISRRECALCULO A WHERE A.TIPOREG LIKE '+
  #39+'CXC:'+nomfec2.text+'/'+anio2.text+#39;
  qISR.open;

  qInfo.close;
  qInfo.SQL.TEXT:='SELECT PAGO, TENIA, QUEDO,AGREGO,ISRTOTAL,EMPL, NEWPAGO,TIPO,NOMINA FROM PISRRECALCULO A WHERE A.TIPOREG='+
  #39+'INFO'+#39+' AND NOMINA IN ('+CAD+')' ;
  savetofilelog(qinfo.sql.text);
  qInfo.open;

end;

procedure TFDetalle.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  QREP.CLOSE;
  Qrep.sql.text:='SELECT * FROM PISRPAGOS WHERE ISRP_EMPL='+#39+Qcuentas2.fieldbyname('EMPL').asstring+#39+
  ' AND TO_CHAR(ISRP_FECHA,'+#39+'MM'+#39+')='+#39+COPY(NOMFEC2.TEXT,4,2)+#39+
  ' AND TO_CHAR(ISRP_FECHA,'+#39+'YYYY'+#39+')='+#39+ANIO2.TEXT+#39;
  savetofilelog(qREP.SQL.TEXT);
  Qrep.open;
end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if nomfec2.Text<>'' then
     begin
      q.close;
      Q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_FECINI='+#39+NOmfec2.text+'/'+anio2.text+#39;
      Q.open;
      if q.fieldbyname('nomi_contab').asstring='N' then
         begin
             if Application.MessageBox('¿Seguro que desea correr Recalculo ISR afectará los registros de Nómna?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
                 begin
                      q.close;
                      q.sql.text:='SELECT COUNT(*)  FROM PISRRECALCULO s  WHERE S.NOMINA IN ('+
                      cad+')';
                      Savetofilelog(q.sql.text);
                      q.open;
                      if q.fields[0].asinteger<=0 then
                         begin
                            Q.close;
                            q.SQL.text:='CALL  recalculaisrMes('+#39+NOmfec2.text+'/'+anio2.text+#39+')';
                            q.ExecSQL;

                            qCuadre.close;
                            qcuadre.open;
                            numerror;

                            QISR.Close;
                            qisr.open;
                            qinfo.close;
                            qinfo.open;
                         end
                      else
                         Showmessage('Ya existen registros de nominas '+cad+'para este periodo que se hizo el recalculo del ISR, NO SE DEBE CORRER DOS VECES');
                 end;
           end
      else
        Showmessage('La nómina ya esta contabilizada no se puede correr recalculo de ISR');
    end
  else
     Showmessage('Debe elegir un periodo de nomina correcto');

end;

procedure TFDetalle.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qcuentas2);
end;

End.
