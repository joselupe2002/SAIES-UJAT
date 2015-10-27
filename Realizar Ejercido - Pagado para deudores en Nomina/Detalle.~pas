unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, Buttons,OleServer, Excel97, Comobj, libreria;

type
  TFDetalle = class(TPFDetalle)
    PAGE: TPageControl;
    TabSheet1: TTabSheet;
    EFECHADEV: TLabel;
    Label5: TLabel;
    FECHADEV: TDBEdit;
    NOMINA: TDBEdit;
    QPer: TQuery;
    DsPer: TDataSource;
    DsDed: TDataSource;
    QDed: TQuery;
    Q: TQuery;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    qpol: TQuery;
    dspol: TDataSource;
    QDetPol: TQuery;
    DSDetPol: TDataSource;
    TabSheet5: TTabSheet;
    dg: TDBGrid;
    QError: TQuery;
    dserror: TDataSource;
    Shape1: TShape;
    DsCog: TDataSource;
    QCog: TQuery;
    DSDeudor: TDataSource;
    qdeudor: TQuery;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    grupo: TDBGrid;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    Monto: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tipo: TDBEdit;
    Label8: TLabel;
    TIPONOM: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure dgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QordenesDblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBDEUDORESDblClick(Sender: TObject);
    function RNombre : String ; override;
    procedure NOMINAChange(Sender: TObject);
     procedure Acepta_Seleccion ;  override;
    procedure NOMINAKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  TipoDet:string;
  HAY:Integer;
implementation

{$R *.DFM}


procedure TFDetalle.Acepta_Seleccion ;
var campo : TField ;
begin

 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

  if (VControl is TDBEdit)  and (vcontrol.Name='NOMINA') then
    begin
       tipo.Field.asstring:=QVal.Fields[2].AsString;
    end;




 if campo <> nil then
 begin
  campo.DataSet.Edit ;
  campo.Value := QVal.Fields[0].Value ;
 end ;
 QVal.Close ;
 GValValid.Hide ;
 PCaptura.Show ;
 VControl.SetFocus ;


end ;



function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 IF RESULT='NOMINA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Nomina,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add(#39+'O'+#39+' As TipNom,');
       Vsql.Add('NOMI_TIPO As Tipo');
       Vsql.Add('FROM PNOMINAS');
       Vsql.Add('WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39);
       Vsql.Add('UNION');
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Nomina,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add(#39+'N'+#39+' As TipNom,');
       Vsql.Add('NOMI_TIPO As Tipo');
       Vsql.Add('FROM PNNOMINAS');
       Vsql.Add('WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39);
       Vsql.Add('UNION');
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Nomina,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add(#39+'H'+#39+' As TipNom,');
       Vsql.Add('NOMI_TIPO As Tipo');
       Vsql.Add('FROM PHNOMINAS');
       Vsql.Add('WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39);
       Vsql.Add('UNION');
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Nomina,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add(#39+'I'+#39+' As TipNom,');
       Vsql.Add('NOMI_TIPO As Tipo');
       Vsql.Add('FROM PINOMINAS');
       Vsql.Add('WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39);
       Vsql.Add('UNION');
      Vsql.Add('Select');
       Vsql.Add('MOVF_SEQ As Nomina,');
       Vsql.Add('SUBSTR(MOVF_DESCRIP,1,100) As Descripcion,');
       Vsql.Add(#39+'F'+#39+' As TipNom,');
       Vsql.Add(#39+'FN'+#39+' As Tipo');
       Vsql.Add('FROM PMOVFUENOM');
       Vsql.Add('WHERE MOVF_CONTABILIZADO='+#39+'S'+#39);

       savetofileLOG(vsql.text);

     end;
end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
  inherited;
 Height := 504 ;
 Width := 1067 ;

 IF MODO=1 THEN
    begin
       speedbutton1.Enabled:=false;
       speedbutton2.Enabled:=false;
       QPOL.Close;
       qpol.sql.text:='SELECT * FROM FPOLIZAS A WHERE A.POLI_DESCRIP LIKE '+
       #39+'%EJER-PAG-DEUD%('+#39+'||'+#39+nomina.text+#39+'||'+#39+')%'+#39;
       qpol.OPEN;
    end;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
var
pagado:string;
vcadpag:STRING;
begin
  inherited;
if (nomina.Text<>'') and (tipo.Text<>'') and (fechadev.Text<>'') then
   begin
       q.close;
       q.sql.text:='DELETE FROM PPOLIZASCAN S WHERE POLI_PAGO='+NOMINA.TEXT;
       savetofileLOG(Q.SQL.text);
       Q.execsql;

        q.close;
        q.SQL.text:='CALL REGPAGADEUD('+#39+NOMINA.TEXT+#39+','+#39+FECHADEV.TEXT+#39+','+
        #39+tipo.text+#39+')';
        savetofileLOG(Q.SQL.text);
        Q.execsql;

        qpol.close;
        qpol.sql.text:='SELECT * FROM PPOLIZASCAN WHERE POLI_PAGO='+#39+NOMINA.text+#39;
        savetofileLOG(QPOL.SQL.text);
        QPOL.open;
        qdetpol.Close;

        qdetpol.sql.text:='SELECT DETM_RNGID AS NUMREN, DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        savetofileLOG(QDETPOL.SQL.text);
        qdetpol.open;

        qded.close;
        qded.sql.text:='SELECT DETM_CNTA AS CUENTA, sum(DETM_MONTO) AS MONTO'+
        ' FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' group by  DETM_CNTA'+
        ' ORDER BY DETM_cnta';
        savetofileLOG(QDed.SQL.text);
        qded.open;

        qerror.close;
        qerror.sql.text:='SELECT ERRO_DESCRIP AS MENSAJE, ERRO_TIPO AS TIPO FROM PERRORESCAN '+
        'WHERE ERRO_PAGO='+#39+NOMINA.text+#39+' ORDER BY ERRO_DESCRIP';
        Qerror.open;

   end
  else
    showmessage('No se han capturado todos los datos necesarios');
end;

procedure TFDetalle.DBGrid1CellClick(Column: TColumn);
var tabla:string;
begin
  inherited;
  if HAY>0 then tabla:='FDETMOVI' else tabla:='PDETMOVICAN';
     BEGIN
      qdetpol.sql.text:='SELECT DETM_RNGID AS NUMREN, DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM '+TABLA+' WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        qdetpol.open;

        qded.close;
        qded.sql.text:='SELECT DETM_CNTA AS CUENTA, sum(DETM_MONTO) AS MONTO'+
        ' FROM '+TABLA+' WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' group by  DETM_CNTA'+
        ' ORDER BY DETM_cnta';
        savetofileLOG(QDed.SQL.text);
        qded.open;
      END;


end;

procedure TFDetalle.dgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  try
     if (Qerror.fieldbyname('TIPO').asstring)='ERROR' THEN
         Dg.canvas.Brush.Color:=$00E6EAFF;
     if (Qerror.fieldbyname('TIPO').asstring)='ACTUALIZA' THEN
         Dg.canvas.Brush.Color:=$00F1F9D5;
      if (QError.fieldbyname('TIPO').asstring)='ADVERTENCIA' THEN
         Dg.canvas.Brush.Color:=CLwhite;

     dg.Canvas.Font.Color:=clblack;
     Dg.Canvas.FillRect(Rect);
     Dg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
except end;
end;


procedure CrearFile(fi:string);
var
  Excel: OleVariant;
  Libro: OleVariant;
  Hoja: OleVariant;

begin
 if not(fileexists(fi)) then
    begin
        Excel := ComObj.CreateOleObject('Excel.Application');
        Libro := Excel.WorkBooks.Add;
        Hoja := Libro.ActiveSheet;
        Hoja.Cells[1, 1] := '';

        Libro.SaveAs(fi);
        Excel.Quit;
    end;
end;



procedure ExportarXLS(Q:TQuery);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(extractfiledir(paramstr(0))+'\File.xlsx'); except end;
crearFile(extractfiledir(paramstr(0))+'\File.xlsx');
ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;
               showmessage('Exportar....');

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xlsx',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);
  
  ExcelApplication1.Visible[id]:=true;
  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  for x:=0 to q.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=q.Fields[x].FullName;
     end;

  y:=0;
  q.first;

  while not(q.eof) do
     begin
       y:=y+1;
        for x:=0 to q.Fields.Count-1  do
            begin
               ExcelWorksheet1.Cells.Item[y+1,x+1].value:=q.fields[x].asstring;

            end;
        q.next;
     end;

// ExcelWorksheet1.Disconnect;
// ExcelWorkbook1.Disconnect;
// ExcelApplication1.Disconnect;
end;



procedure TFDetalle.QordenesDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QCOG);
end;

procedure TFDetalle.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qded);
end;

procedure TFDetalle.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qdetPol);
end;

procedure TFDetalle.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qPol);
end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
var pagado:string;
vcadpag: string;
begin
  inherited;
if Application.MessageBox('Seguro que desea Realizar polizar Ejercido-Pagado para Deudores','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDYES then
         begin
             q.Close;
             q.sql.text:='INSERT INTO PPAGADEUD '+
             '(PAGA_NUMERO,PAGA_NOMINA, PAGA_FECHADEV,PAGA_TIPO) VALUES ('+
             'PSQDEVFALTAS.nextval,'+
             #39+nomina.TEXT+#39+','+
             #39+fechadev.TEXT+#39+','+
             #39+TIPO.TEXT+#39+')';
             Q.execsql;

             Showmessage('Se ha efectuado el Ejercido - Pagado');
             close;
         end;

end;

procedure TFDetalle.DBDEUDORESDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qdeudor);

end;

procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
TRY FECHADEV.field.asstring:=DATETOSTR(DATE); EXCEPT END;


end;

procedure TFDetalle.NOMINAKeyPress(Sender: TObject; var Key: Char);
VAR
VPPROYNOM,Tppagos,TPdpagos,TPDPPAGOS,TPPOLNOMI,otroParam:string;
begin
  inherited;
  IF KEY=#13 then
    begin

        Q.close;
        q.sql.text:='SELECT TIPO,NOMI_TIPO FROM ('+
                    'Select NOMI_NOMINA,NOMI_TIPO,'+#39+'O'+#39+ 'AS TIPO FROM PNOMINAS WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39+
                    ' UNION '+
                    'Select NOMI_NOMINA,NOMI_TIPO,'+#39+'N'+#39+ 'AS TIPO FROM PNNOMINAS WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39+
                    ' UNION '+
                    'Select NOMI_NOMINA,NOMI_TIPO,'+#39+'H'+#39+ 'AS TIPO FROM PHNOMINAS WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39+
                    ' UNION '+
                    'Select NOMI_NOMINA,NOMI_TIPO,'+#39+'V'+#39+ 'AS TIPO FROM PINOMINAS WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39+
                    ' UNION '+
                    ' Select MOVF_SEQ AS NOMI_NOMINA,'+#39+'F'+#39+','+#39+'F'+#39+ 'AS TIPO FROM PMOVFUENOM )'+
                    ' WHERE NOMI_NOMINA='+#39+NOMINA.TEXT+#39;
        SAVEtofilelog(q.sql.text);
        Q.open;
        tipo.field.AsString:=q.Fields[0].asstring;

        if q.Fields[1].asstring='O' then
            TIPONOM.Text:= q.Fields[0].asstring
        else
            TIPONOM.Text:= q.Fields[1].asstring;

        otroParam:='';
        if TIPO.TEXT='O' then begin otroParam:=',TPST_RUBRO'; VPPROYNOM:='PPROYNOM'; Tppagos:='PPAGOS'; TPdpagos:='PDPAGOS'; TPDPPAGOS:='PDPPAGOS'; TPPOLNOMI:='PPOLNOMI'; END;
        if TIPO.TEXT='H' then begin otroParam:=',TPST_RUBRO'; VPPROYNOM:='PPROYNOM_HAS'; Tppagos:='PHPAGOS'; TPdpagos:='PHDPAGOS'; TPDPPAGOS:='PHDPPAGOS'; TPPOLNOMI:='PHPOLNOMI'; END;
        if TIPO.TEXT='N' then begin otroParam:=',TPST_RUBRO'; VPPROYNOM:='PPROYNOM_NG'; Tppagos:='PNPAGOS'; TPdpagos:='PNDPAGOS'; TPDPPAGOS:='PNDPPAGOS'; TPPOLNOMI:='PNPOLNOMI'; END;
        if TIPO.TEXT='V' then begin otroParam:=',TPST_RUBRO'; VPPROYNOM:='PPROYNOM'; Tppagos:='PIPAGOS'; TPdpagos:='PIDPAGOS'; TPDPPAGOS:='PIDPPAGOS'; TPPOLNOMI:='PIPOLNOMI'; END;
        if TIPO.TEXT='F' then begin VPPROYNOM:=''; Tppagos:=''; TPdpagos:=''; TPDPPAGOS:=''; TPPOLNOMI:='PPOLNOMI'; END;



        IF tipo.text<>'F' then//Nominas normales
           begin
            qcog.Close;
            Qcog.sql.Text:='SELECT  RUBRO, SFDO, URES, PROG, TMOVI, Proy, SUM(Monto) As Monto '+
            'FROM (SELECT L.TPST_RUBRO AS RUBRO,DPAG_DPago DPago,TRIM(DPPA_Sfdo)  Sfdo, '+
            'DPPA_Prog Prog,f.URES_PURES_PRES URES, '+
            'SUBSTR('+VPPROYNOM+'(DPPA_Prog,f.URES_PURES_PRES,TRIM(DPPA_Sfdo), '+
            'TO_CHAR(SYSDATE,'+#39+'YYYY'+#39+')'+otroparam+'),1,30) PROY,DPAG_Cnta Cnta,DPAG_Scta Scta, '+
            'DECODE(DPAG_PerDed,  '+#39+'D'+#39+', DECODE(DPAG_Signo, 1, '+#39+'A'+#39+', '+#39+'C'+#39+'), '+
            'DECODE(DPAG_Signo, 1, '+#39+'C'+#39+', '+#39+'A'+#39+') ) As TMovi, '+
            'DPAG_Monto As Monto,'+#39+'c'+#39+' As tt '+
            'FROM '+TPDPAGOS+','+TPDPPAGOS+', fures f, pconcepto g,'+TPPAGOS+',PTPSTORUBROS L'+
            ' WHERE '+
            '(PAGO_TEMPL=L.TPST_TEMPL and PAGO_TPSTO=L.TPST_TPSTO AND L.TPST_TNOMINA='+#39+TIPONOM.Text+#39+')'+
            ' AND PAGO_Pago= DPAG_Pago And DPPA_Pago(+)= DPAG_Pago And pago_nomina='+#39+NOMINA.text+#39+
            'and dpag_cnta LIKE '+#39+'1123%'+#39+' and F.ures_ures = pago_ures(+) '+
            'and g.conc_conp = dpag_conp (+)) GROUP BY  RUBRO, SFDO, URES, PROG, TMOVI, PROY  ORDER BY  rubro,SFDO, ures, prog';
            SAVEtofilelog(qCOG.sql.text);
           end
        else   //Pagos Fuera de Nomina
           begin
            qcog.close;
            qcog.sql.text:='SELECT  0, SFDO, URES, PROG, TMOVI, Proy, SUM(Monto) As Monto '+
            'FROM (SELECT h.pago_nomina, DPAG_DPago DPago,H.PAGO_SFDO Sfdo,H.PAGO_PROG Prog,'+
            'H.PAGO_URES URES, A.DPAG_PROY PROY, DPAG_Cnta Cnta,DPAG_Scta Scta,'+
            'DECODE(DPAG_PerDed,  '+#39+'D'+#39+', DECODE(DPAG_Signo, 1, '+#39+'A'+#39+', '+#39+'C'+#39+'), '+
            'DECODE(DPAG_Signo, 1, '+#39+'C'+#39+', '+#39+'A'+#39+') ) As TMovi, '+
            'DPAG_Monto As Monto,'+#39+'c'+#39+' As tt '+
            'FROM PMOVFNPDPAGOSR A, fures f, pconcepto g,PMOVFNPPAGOSR H'+
            ' WHERE '+
            '  PAGO_Pago= DPAG_Pago And pago_nomina='+#39+nomina.text+#39+
            ' and dpag_cnta LIKE '+#39+'1123%'+#39+' and f.ures_ures = pago_ures(+)'+
            ' and g.conc_conp = dpag_conp (+)) '+
            ' GROUP BY  SFDO, URES, PROG, TMOVI, PROY  ORDER BY  SFDO, ures, prog ';
            SAVEtofilelog(qCOG.sql.text);
          end;
        QCOG.OPEN;


        IF tipo.text<>'F' then//Nominas normales
           begin
              q.Close;
              Q.sql.Text:='SELECT SUM(Monto)'+
              'FROM (SELECT DPAG_DPago DPago,TRIM(DPPA_Sfdo)  Sfdo, '+
              'DPPA_Prog Prog,f.URES_PURES_PRES URES, '+
              'PPROYNOM(DPPA_Prog,f.URES_PURES_PRES,TRIM(DPPA_Sfdo), '+
              'TO_CHAR(SYSDATE,'+#39+'YYYY'+#39+')) PROY,DPAG_Cnta Cnta,DPAG_Scta Scta, '+
              'DECODE(DPAG_PerDed,  '+#39+'D'+#39+', DECODE(DPAG_Signo, 1, '+#39+'A'+#39+', '+#39+'C'+#39+'), '+
              'DECODE(DPAG_Signo, 1, '+#39+'C'+#39+', '+#39+'A'+#39+') ) As TMovi, '+
              'DPAG_Monto As Monto,'+#39+'c'+#39+' As tt '+
              'FROM '+TPDPAGOS+','+TPDPPAGOS+', fures f, pconcepto g,'+TPPAGOS+
              ' WHERE PAGO_Pago= DPAG_Pago And DPPA_Pago(+)= DPAG_Pago And pago_nomina='#39+NOMINA.text+#39+
              'and dpag_cnta LIKE '+#39+'1123%'+#39+' and f.ures_ures = pago_ures(+) '+
              'and g.conc_conp = dpag_conp (+))';
              SAVEtofilelog(q.sql.text);
              Q.open;
           end
        else
           begin
              q.close;
              q.sql.text:='SELECT SUM(Monto) As Monto '+
              'FROM (SELECT h.pago_nomina, DPAG_DPago DPago,H.PAGO_SFDO Sfdo,H.PAGO_PROG Prog,'+
              'H.PAGO_URES URES, A.DPAG_PROY PROY, DPAG_Cnta Cnta,DPAG_Scta Scta,'+
              'DECODE(DPAG_PerDed,  '+#39+'D'+#39+', DECODE(DPAG_Signo, 1, '+#39+'A'+#39+', '+#39+'C'+#39+'), '+
              'DECODE(DPAG_Signo, 1, '+#39+'C'+#39+', '+#39+'A'+#39+') ) As TMovi, '+
              'DPAG_Monto As Monto,'+#39+'c'+#39+' As tt '+
              'FROM PMOVFNPDPAGOSR A, fures f, pconcepto g,PMOVFNPPAGOSR H '+
              ' WHERE PAGO_Pago= DPAG_Pago And pago_nomina='+#39+nomina.text+#39+
              ' and dpag_cnta LIKE '+#39+'1123%'+#39+' and f.ures_ures = pago_ures(+)'+
              ' and g.conc_conp = dpag_conp (+)) '+
              ' GROUP BY SFDO, URES, PROG, TMOVI, PROY  ORDER BY  SFDO, ures, prog ';
              SAVEtofilelog(q.sql.text);
              q.open;
           end;
        monto.Caption:=formatfloat('#,#0.00',q.fields[0].asfloat);

        //MOSTRAMOS SI HAY POLIZAS
        qpol.close;
        qpol.sql.text:='SELECT COUNT(*) FROM FPOLIZAS WHERE POLI_DESCRIP LIKE '+#39+'EP-DEUD('+NOMINA.text+')%'+#39;
        savetofileLOG(QPOL.SQL.text);
        QPOL.open;
        HAY:=qPOL.FIELDS[0].ASINTEGER;

        IF HAY>0 THEN
           BEGIN
              qpol.close;
              qpol.sql.text:='SELECT * FROM FPOLIZAS WHERE POLI_DESCRIP LIKE '+#39+'EP-DEUD('+NOMINA.text+')%'+#39;
              savetofileLOG(QPOL.SQL.text);
              QPOL.open;
              qdetpol.Close;
           END;
        {qdetpol.sql.text:='SELECT DETM_RNGID AS NUMREN, DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM FDETMOVI WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        savetofileLOG(QDETPOL.SQL.text);
        qdetpol.open;  }
 end;

end;

procedure TFDetalle.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QCOG);
end;

end.
