unit recibos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls,  EKrtf,
  shellapi, ekbasereport, Libreria;

type
  TFRecibos = class(TPFDetalle)
    PagCon: TPageControl;
    TabBorra: TTabSheet;
    Button1: TButton;
    TNOM: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    fecini: TEdit;
    fecfin: TEdit;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Conc: TComboBox;
    Label5: TLabel;
    FeciniC: TEdit;
    FecFinC: TEdit;
    Label6: TLabel;
    VisConc: TButton;
    TickConc: TEkRTF;
    QConc: TQuery;
    SConc: TQuery;
    TabSheet2: TTabSheet;
    Cogc: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    FecIniG: TEdit;
    Label9: TLabel;
    FecFinG: TEdit;
    Button2: TButton;
    TabSheet3: TTabSheet;
    Label10: TLabel;
    inipol: TEdit;
    Label11: TLabel;
    finpol: TEdit;
    Button3: TButton;
    dsPolFn: TDataSource;
    QPolFN: TQuery;
    DBGrid1: TDBGrid;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ImprimeRep;
    procedure ImprimeRepConc;
    procedure ImprimeRepCog;
    procedure TabSheet1Enter(Sender: TObject);
    procedure VisConcClick(Sender: TObject);
    procedure TickConcScanRecord(ScanInfo: TEkScanInfo);
    procedure TabSheet2Enter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;






implementation

{$R *.DFM}

procedure TFRecibos.FormCreate(Sender: TObject);

begin
  inherited;
  fecini.text:=datetostr(date);
  fecfin.text:=datetostr(date);
  width:=469;
  height:=313;
end;


procedure savetofileLog(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
if not(fileexists(extractfiledir(paramstr(0))+'\log.txt')) then
    l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.LoadFromFile(extractfiledir(paramstr(0))+'\log.txt');
l.Add(DATETOSTR(DATE)+' '+TIMETOSTR(NOW)+ '--> '+s);
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;

procedure devRTF(q:TQuery;tabla:string;campoF:string;campo:string;valor:string;Extension:String);
var
   Fblob:TBlobField;
   aux:TQuery;
begin
    AUX := TQuery.Create(Application) ;
    aux.DataBaseName := 'Sistema' ;
    aux.close;
    aux.sql.text:='SELECT '+campof+' FROM '+TABLA+' WHERE '+campo+'='+#39+UPPERCASE(valor)+#39+
    ' and '+campof+' is not null';
    aux.open;
    if not(aux.eof) then
      begin
         FBlob:= aux.Fields[0] as TBlobField;
         FBlob.SaveToFile(extractfiledir(paramstr(0))+'\'+valor+'.'+extension);
      end;
   aux.close;
end;



 {===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin
   if pos(separador,cad)>0 then
      str_:=copy(cad,1,pos(separador,cad)-1)
   else
      str_:=cad;
end;


procedure TFRecibos.ImprimeRepConc;
var
vis:string;
venci:string;

Subtotal, total, isr:real;
begin

//if not(fileexists(ExtractFiledir(Paramstr(0))+'\REPCONC.rtf')) then
  devRTF(qconc,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPCONC','rtf');
  TickConc.ClearVars;

  TickConc.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TickConc.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TickConc.CreateVar('CONCEPTO',CONC.TEXT);
  Qconc.close;
  qconc.sql.text:='SELECT USER FROM DUAL';
  qconc.OPEN;
  TickConc.CreateVar('USER',Qconc.fields[0].asstring);

  qconc.close;
  Qconc.sql.text:='SELECT DISTINCT(CONC_CONP) AS CONP, CONC_DESCRIP AS CONPD from pconcepto, PVMOVFUENOM, PMOVFNPDPAGOSR '+
              ' WHERE DPAG_MOVI= VMOV_SEQ  '+
              ' AND  DPAG_CONP= CONC_CONP  '+
              ' AND VMOV_FECHAMOV>='+#39+FECINIC.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFINC.TEXT+#39+
              ' AND CONC_CONP like '+#39+'%'+str_(conc.text,'-')+'%'+#39+
              ' ORDER BY CONC_CONP';
  savetofilelog(Qconc.sql.text);
  Qconc.open;


  sconc.close;
  sconc.sql.text:='SELECT T.VMOV_SFONDO as ures, U.SFON_DESCRIP as uresd,  S.DPAG_CONP as conp, V.CONC_DESCRIP as conpd, '+
              'T.VMOV_PERS AS PERS, T.VMOV_NOMBRE ||'+#39+'('+#39+'||T.VMOV_SEQ||'+#39+')'+#39+' AS PERSD, '+
              'DECODE(S.DPAG_PERDED,'+#39+'P'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS PERCEPCION,'+
              'DECODE(S.DPAG_PERDED,'+#39+'D'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS DEDUCCION,'+
              'getPolizasOP(T.VMOV_SEQ,S.DPAG_SCTA) as POLID '+
              'FROM PMOVFNPDPAGOSR S, PVMOVFUENOM T, FSFONDOS U, PCONCEPTO V '+
              ' WHERE S.DPAG_MOVI= T.VMOV_SEQ '+
              ' AND T.VMOV_SFONDO=U.SFON_SFDO '+
              ' AND S.DPAG_CONP=V.CONC_CONP   '+
              ' AND T.VMOV_FECHAMOV>='+#39+FECINIC.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFINC.TEXT+#39+
              ' AND s.dpag_conp ='+#39+qconc.fieldbyname('CONP').asstring+#39+
              ' ORDER BY T.VMOV_SFONDO, S.DPAG_CONP, VMOV_FECHAMOV';
  savetofilelog(sconc.sql.text);
  sconc.open;


  TickConc.InFile:=ExtractFiledir(Paramstr(0))+'\RepConc.rtf';
  TickConc.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepConc.rtf';

  TickConc.ExecuteOpen([Qconc,Sconc],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;






procedure TFRecibos.ImprimeRepCog;
var
vis:string;
venci:string;
Subtotal, total, isr:real;

begin

//if not(fileexists(ExtractFiledir(Paramstr(0))+'\REPCONC.rtf')) then
  devRTF(qconc,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPCOG','rtf');
  TickConc.ClearVars;

  TickConc.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TickConc.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TickConc.CreateVar('CONCEPTO',CONC.TEXT);
  Qconc.close;
  qconc.sql.text:='SELECT USER FROM DUAL';
  qconc.OPEN;
  TickConc.CreateVar('USER',Qconc.fields[0].asstring);

  qconc.close;
  Qconc.sql.text:='SELECT DISTINCT(DPAG_SCTA) AS CONP, '+
  '(SELECT DISTINCT(VMAT_DESCRIPCLASIF) FROM fvmatclasif Z WHERE Z.VMAT_FCLASIF=DPAG_SCTA) '+
  ' AS CONPD from PVMOVFUENOM, PMOVFNPDPAGOSR '+
              ' WHERE DPAG_MOVI= VMOV_SEQ  '+
              ' AND VMOV_FECHAMOV>='+#39+FECINIG.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFING.TEXT+#39+
              ' AND DPAG_SCTA like '+#39+'%'+str_(COGC.text,'-')+'%'+#39+
              ' ORDER BY DPAG_SCTA';
  savetofilelog(Qconc.sql.text);
  Qconc.open;


  sconc.close;
  sconc.sql.text:='SELECT T.VMOV_URESFN as ures, U.URES_DESCRIP as uresd,  S.DPAG_CONP as conp,'+
              'T.VMOV_PERS AS PERS, T.VMOV_NOMBRE AS PERSD, '+
              'DECODE(S.DPAG_PERDED,'+#39+'P'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS PERCEPCION,'+
              'DECODE(S.DPAG_PERDED,'+#39+'D'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS DEDUCCION '+
              'FROM PMOVFNPDPAGOSR S, PVMOVFUENOM T, FURES U'+
              ' WHERE S.DPAG_MOVI= T.VMOV_SEQ '+
              ' AND T.VMOV_URESFN=U.URES_URES '+
              ' AND T.VMOV_FECHAMOV>='+#39+FECINIG.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFING.TEXT+#39+
              ' AND s.dpag_SCTA ='+#39+qconc.fieldbyname('CONP').asstring+#39+
              ' ORDER BY S.DPAG_SCTA, VMOV_FECHAMOV';
  savetofilelog(sconc.sql.text);
  sconc.open;


  TickConc.InFile:=ExtractFiledir(Paramstr(0))+'\RepCog.rtf';
  TickConc.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepCog.rtf';

  TickConc.ExecuteOpen([Qconc,Sconc],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


procedure TFRecibos.ImprimeRep;
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s:Tquery;
Subtotal, total, isr:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;

if not(fileexists(ExtractFiledir(Paramstr(0))+'\REPDETFN.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPDETFN','rtf');
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));



  q.close;
  q.sql.text:='SELECT  T.*, VMOV_TPER-VMOV_TDED AS VMOV_TOTAL  FROM PVMOVFUENOM_REP T WHERE '+
  ' VMOV_TIPONOM LIKE '+
  #39+Str_(TNOM.TEXT,'-')+#39 + ' AND VMOV_FECHAMOV>='+#39+FECINI.TEXT+#39+
  ' AND VMOV_FECHAMOV<='+#39+FECFIN.TEXT+#39+
  ' ORDER BY VMOV_FECHAMOV, VMOV_SEQ';
  savetofilelog(q.sql.text);
  q.open;


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\RepDetFN.rtf';
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepDetFN.rtf';

  Tick2.ExecuteOpen([Q],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


///Recibos normales
procedure TFRecibos.Button1Click(Sender: TObject);

begin
  inherited;
  ImprimeRep;
end;



///////esdeped
procedure TFRecibos.Button2Click(Sender: TObject);

begin
  inherited;
ImprimeRepCog;

end;





////jubilados y pensionados
procedure TFRecibos.TabSheet1Enter(Sender: TObject);
VAR
Q:Tquery;
begin
  inherited;
    q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;

q.close;
q.sql.text:='SELECT * FROM PCONCEPTO ';
Q.OPEN;
conc.Clear;
while not(q.eof) do
  begin
    conc.Items.Add(q.fieldbyname('CONC_CONP').asstring+'-'+q.fieldbyname('CONC_DESCRIP').asstring);
    q.next;
  end;
conc.Items.Add('%-Todos');
end;

procedure TFRecibos.VisConcClick(Sender: TObject);
begin
  inherited;
ImprimeRepConc;
end;

procedure TFRecibos.TickConcScanRecord(ScanInfo: TEkScanInfo);
begin
  inherited;
   if (scaninfo.Number=1) AND (PAGCON.ActivePageIndex=1) then
      begin
           sconc.close;
           sconc.sql.text:='SELECT T.VMOV_SFONDO as ures, U.SFON_DESCRIP as uresd,  S.DPAG_CONP as conp, V.CONC_DESCRIP as conpd, '+
              'T.VMOV_PERS AS PERS, T.VMOV_NOMBRE ||'+#39+'('+#39+'||T.VMOV_SEQ||'+#39+')'+#39+' AS PERSD, '+
              'DECODE(S.DPAG_PERDED,'+#39+'P'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS PERCEPCION,'+
              'DECODE(S.DPAG_PERDED,'+#39+'D'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS DEDUCCION,'+
              'getPolizasOP(T.VMOV_SEQ,S.DPAG_SCTA) as POLID '+
              'FROM PMOVFNPDPAGOSR S, PVMOVFUENOM T, FSFONDOS U, PCONCEPTO V '+
              ' WHERE S.DPAG_MOVI= T.VMOV_SEQ '+
              ' AND T.VMOV_SFONDO=U.SFON_SFDO '+
              ' AND S.DPAG_CONP=V.CONC_CONP   '+
              ' AND T.VMOV_FECHAMOV>='+#39+FECINIC.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFINC.TEXT+#39+
              ' AND s.dpag_conp ='+#39+qconc.fieldbyname('CONP').asstring+#39+
              ' ORDER BY T.VMOV_SFONDO, S.DPAG_CONP, VMOV_FECHAMOV';
          savetofilelog(sconc.sql.text);
          sconc.open;
     end;
     if (scaninfo.Number=1) AND (PAGCON.ActivePageIndex=2) then
      begin
            sCONC.close;
            sconc.sql.text:='SELECT T.VMOV_URESFN as ures, U.URES_DESCRIP as uresd,  S.DPAG_CONP as conp, '+
              'T.VMOV_PERS AS PERS, T.VMOV_NOMBRE AS PERSD, '+
              'DECODE(S.DPAG_PERDED,'+#39+'P'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS PERCEPCION,'+
              'DECODE(S.DPAG_PERDED,'+#39+'D'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS DEDUCCION '+
              'FROM PMOVFNPDPAGOSR S, PVMOVFUENOM T, FURES U'+
              ' WHERE S.DPAG_MOVI= T.VMOV_SEQ '+
              ' AND T.VMOV_URESFN=U.URES_URES '+
              ' AND T.VMOV_FECHAMOV>='+#39+FECINIG.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFING.TEXT+#39+
              ' AND s.dpag_SCTA ='+#39+qconc.fieldbyname('CONP').asstring+#39+
              ' ORDER BY S.DPAG_SCTA, VMOV_FECHAMOV';
            sconc.open;
      end;


end;

procedure TFRecibos.TabSheet2Enter(Sender: TObject);
VAR
Q:Tquery;
begin
  inherited;
    q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;

q.close;
q.sql.text:='SELECT DISTINCT(z.VMAT_FCLASIF) AS CLAVE, VMAT_DESCRIPCLASIF  AS DESCRIP FROM fvmatclasif Z ';
Q.OPEN;
coGC.Clear;
while not(q.eof) do
  begin
    coGc.Items.Add(q.fieldbyname('CLAVE').asstring+'-'+q.fieldbyname('DESCRIP').asstring);
    q.next;
  end;
cogc.Items.Add('%-Todos');
end;




procedure TFRecibos.DBGrid1DblClick(Sender: TObject);
begin
ExportarXLS(QPolFN);


end;

procedure TFRecibos.Button3Click(Sender: TObject);
begin
  inherited;
  qpolfn.Close;
  qpolfn.SQL.text:='select s.VMOV_seq AS NUM_PAGOFN, s.VMOV_cancel AS CANCELADO, '+
  't.poli_polid AS NUM_POLIZA, t.poli_descrip AS DESCRIPCION_POL, '+
  't.poli_fecha AS FECHA_PAGO, S.VMOV_TRANSFER AS TRANSFERENCIA, S.VMOV_NETO AS MONTO, '+
  'T.POLI_FECHA AS FECHA_POLIZA, getordpagofn(s.VMOV_seq)  as ORDENES_PAGO from pVmovfuenom s, fpolizas t, '+
  ' PMOVFNPPAGOSR U  where s.VMOV_contabilizado='+#39+'S'+#39+' AND S.VMOV_SEQ=U.PAGO_MOVFN  '+
  ' and  ((t.poli_descrip LIKE  s.VMOV_seq||'+#39+'\_%'+#39+' ESCAPE '+#39+'\'+#39+')'+
  ' or t.poli_descrip LIKE '+#39+'%('+#39+'||s.VMOV_seq||'+#39+')%'+#39+
  ' or t.poli_descrip LIKE '+#39+'%('+#39+'||U.PAGO_PAGO||'+#39+')%'+#39+') and '+
  ' t.poli_tipdoc='+#39+'CP'+#39+' AND S.VMOV_FECHAMOV>='+#39+inipol.text+#39+
  ' AND S.VMOV_FECHAMOV<='+#39+finpol.text+#39+' order by s.VMOV_SEQ  ';
  savetofilelog(qpolFn.sql.text);
  qpolFn.Open;
end;

procedure TFRecibos.Button4Click(Sender: TObject);
begin
  inherited;
   sconc.close;
   sconc.sql.text:='SELECT S.DPAG_SCTA, T.VMOV_URESFN as ures, U.URES_DESCRIP as uresd,  S.DPAG_CONP as conp,'+
              'T.VMOV_PERS AS PERS, T.VMOV_NOMBRE AS PERSD, '+
              'DECODE(S.DPAG_PERDED,'+#39+'P'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS PERCEPCION,'+
              'DECODE(S.DPAG_PERDED,'+#39+'D'+#39+',S.DPAG_MONTO,'+#39+''+#39+') AS DEDUCCION '+
              'FROM PMOVFNPDPAGOSR S, PVMOVFUENOM T, FURES U'+
              ' WHERE S.DPAG_MOVI= T.VMOV_SEQ '+
              ' AND T.VMOV_URESFN=U.URES_URES '+
              ' AND T.VMOV_FECHAMOV>='+#39+FECINIG.TEXT+#39+
              ' AND VMOV_FECHAMOV<='+#39+FECFING.TEXT+#39+
              ' ORDER BY S.DPAG_SCTA, VMOV_FECHAMOV';
  savetofilelog(sconc.sql.text);
  sconc.open;
  ExportarXLS(SCONC);
end;

end.
