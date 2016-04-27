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
    Tick: TEkRTF;
    ImageList2: TImageList;
    QInfo: TQuery;
    dsInfo: TDataSource;
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
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    laNomina: TComboBox;
    Label7: TLabel;
    msgNomina: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure DGRDblClick(Sender: TObject);
    procedure NomFecChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure Seleccionar1Click(Sender: TObject);
    procedure CargaDatosNomina;
    procedure laNominaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
TPnomina:string;
numNomina:String;
Tpvdpagos:STRING;
implementation


//uses Repo;

{$R *.DFM}




procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 596;
 Width :=  800 ;

 ANIO.TEXT:=formatdatetime('yyyy',now);

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

procedure TFDetalle.CargaDatosNomina;
var
cadSQL:String;
begin
  fechagen:=NomFec.text+'/'+anio.text;
  if str_(laNomina.text,'-')='O' then begin TPNomina:='PNOMINAS';  Tpvdpagos:='PVDPAGOS'; end;
  if str_(laNomina.text,'-')='C' then begin TPNomina:='PNOMINAS';  Tpvdpagos:='PVDPAGOS'; end;
  if str_(laNomina.text,'-')='H' then begin TPNomina:='PHNOMINAS'; Tpvdpagos:='PVHDPAGOS'; end;
  if str_(laNomina.text,'-')='N' then begin TPNomina:='PNNOMINAS'; Tpvdpagos:='PVNDPAGOS'; end;
  if str_(laNomina.text,'-')='V' then begin TPNomina:='PINOMINAS'; Tpvdpagos:='PVIDPAGOS'; end;

  cadSQL:='SELECT NOMI_NOMINA FROM '+TPNomina+' where NOMI_FECINI='+#39+fechagen+#39+
          ' and NOMI_TIPO='+#39+'O'+#39;

  if str_(laNomina.text,'-')='C' then
         cadSQL:='SELECT NOMI_NOMINA FROM '+TPNomina+' where NOMI_FECINI='+#39+fechagen+#39+
                 ' and NOMI_TIPO='+#39+'C'+#39;
  Savetofilelog(cadSQL);


  Q.Close;
  q.sql.text:=CADSQL;
  Q.open;
  IF not(Q.Eof) then
      begin
        Numnomina:=q.fields[0].asstring;
        MsgNomina.caption:='Nomina: '+q.fields[0].asstring;

        qcuentas.close;
        qcuentas.sql.text:='SELECT EMPL, NOMBRE, PAGO,MOVI,DJ,DJ_NEW, DJ_NEW-DJ AS DIF,MOV_ISR FROM ('+
                           'select s.VDPA_Empl as empl, t.pers_nombre||'+#39+' '+#39+
                           '||t.pers_apepat||'+#39+' '+#39+'||t.pers_apemat as nombre,'+
                           's.VDPA_Pago AS PAGO, s.VDPA_Movi AS MOVI, sum(s.VDPA_Monto) AS DJ, '+
                           'evaluaexpr(s.VDPA_Movi,s.VDPA_Pago,'+#39+str_(laNomina.text,'-')+#39+') AS DJ_NEW, '+
                           '(select COUNT(*) from PISRRECALCULO t where t.nomina=S.VDPA_Nomina and t.empl=S.VDPA_Empl) AS MOV_ISR '+
                           ' from '+Tpvdpagos+' s, fpersonas t  where S.VDPA_Empl=T.PERS_PERSONA '+
                           ' AND s.VDPA_Conp='+#39+'061'+#39+
                           ' And s.VDPA_Nomina='+Numnomina+
                           ' and s.VDPA_PerDed='+#39+'D'+#39+
                           ' group by s.VDPA_Empl, t.pers_nombre||'+#39+' '+#39+
                           '||t.pers_apepat||'+#39+' '+#39+'||t.pers_apemat, s.VDPA_Pago, s.VDPA_Movi,  S.VDPA_Nomina)'+
                           ' WHERE MOV_ISR<>0  and DJ<>DJ_NEW';
        savetofilelog(qcuentas.sql.text);

        Qcuentas.open;
        NEMPL.Caption:=inttostr(QCUENTAS.RECORDCOUNT);

       qinfo.close;
       qinfo.SQL.text:='SELECT * FROM PDJRECALCULO S WHERE S.NOMINA='+NumNomina;
       qinfo.open;
       Savetofilelog(qinfo.sql.text);

  end
  else
     Showmessage('No existe Nómina para este periodo del tipo '+lanomina.text);


end;

procedure TFDetalle.NomFecChange(Sender: TObject);


begin
  inherited;
cargaDatosNomina;

end;


procedure TFDetalle.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  QREP.CLOSE;
  Qrep.sql.text:='select * from PISRRECALCULO t where t.nomina='+NUMNOMINA+
  ' and t.empl='+#39+qcuentas.Fields[0].asstring+#39;
  SavetofileLog(Qrep.sql.text);
  Qrep.open;

end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
VAR
TPNOMINAS:STRING;
begin
  inherited;

if nomfec.Text<>'' then
   begin
      if str_(laNomina.text,'-')='O' then tpnominas:='PNOMINAS';
      if str_(laNomina.text,'-')='C' then tpnominas:='PNOMINAS';
      if str_(laNomina.text,'-')='N' then tpnominas:='PNNOMINAS';
      if str_(laNomina.text,'-')='H' then tpnominas:='PHNOMINAS';
      if str_(laNomina.text,'-')='V' then tpnominas:='PINOMINAS';
      q.close;
      Q.sql.text:='SELECT * FROM '+TPNOMINAS+' WHERE NOMI_NOMINA='+NumNomina;
      Q.open;
      if q.fieldbyname('nomi_contab').asstring='N' then
         begin
             if Application.MessageBox('¿Seguro que desea correr Recalculo DJ afectará los registros de Nómna?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
                 begin
                    q.close;
                    q.sql.text:='SELECT COUNT(*)  FROM PDJRECALCULO s  WHERE S.NOMINA='+NumNomina;
                    Savetofilelog(q.sql.text);
                    q.open;
                    if q.fields[0].asinteger<=0 then
                       begin
                          Q.close;
                          q.SQL.text:='CALL  recalculaDJ('+NumNomina+')';
                          q.ExecSQL;

                          qCUentas.close;
                          qCuentas.open;

                          qinfo.close;
                          qinfo.SQL.text:='SELECT * FROM PDJRECALCULO S WHERE S.NOMINA='+NumNomina;
                          qinfo.open;
                       end
                    else
                       Showmessage('Ya existen registros de nominas '+cad+'para este periodo que se hizo el recalculo del DJ, NO SE DEBE CORRER DOS VECES');
                 end;
         end
      else
        Showmessage('La nómina ya esta contabilizada no se puede correr recalculo de DJ');
    end
else
     Showmessage('Debe elegir un periodo de nomina correcto');





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

procedure TFDetalle.laNominaChange(Sender: TObject);
begin
  inherited;
cargaDatosNomina;
end;

procedure TFDetalle.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  try
    If (Qcuentas.FieldByName('MOV_ISR').AsString='0') Then
      DBGrid1.Canvas.Brush.Color := $004540FF
    Else
       DBGrid1.canvas.Brush.Color := CLWHITE;
    DBGrid1.Canvas.Font.Color := clBlack;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  except
  end;
end;

End.
