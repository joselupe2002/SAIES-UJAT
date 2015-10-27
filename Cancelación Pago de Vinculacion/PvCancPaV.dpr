library PvCancPaV;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Modulo,
  Forms,
  DBTables,
  Dialogs,
  Windows,
  ekrtf,
  libreria,
  Detalle in 'Detalle.pas' {FDetalle},
  PDetalle in '..\bin\PDETALLE.pas' {PFDetalle};

{$R *.res}



//===========================ACUSE PARA CANCELACION===============================
procedure ImprimeAcuse(xmodulo: TFmodulo; Rep:String;Numero:string; Tnomina:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
tppagos, tpdpagos: string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  qA := TQuery.Create(Application) ;
  qA.DataBaseName := 'Sistema' ;
  qp := TQuery.Create(Application) ;
  qp.DataBaseName := 'Sistema' ;
  qd := TQuery.Create(Application) ;
  qd.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','ACUSECANCEL','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIA',formatdatetime('dd',date));
  tick2.CreateVar('MES',formatdatetime('mm',date));
  tick2.CreateVar('ANIO',formatdatetime('yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  tick2.CreateVar('NREC',NUMERO);


  Qa.close;
  qa.sql.text:='SELECT * FROM PCANCELPAGO A WHERE A.CANC_PAGO='+#39+Numero+#39;
  qA.OPEN;
  //tIPO DE PAGO
  IF Qa.fieldbyname('CANC_FPAGO').asstring='0' then
     tick2.CreateVar('FPAGO','TRANSFERENCIA');
  IF Qa.fieldbyname('CANC_FPAGO').asstring='1' then
     tick2.CreateVar('FPAGO','CHEQUE');
  IF Qa.fieldbyname('CANC_FPAGO').asstring='2' then
     tick2.CreateVar('FPAGO','EFECTIVO');

  tick2.CreateVar('OBS',QA.Fieldbyname('CANC_OBS').asstring);
  tick2.CreateVar('ccp',QA.Fieldbyname('CANC_ccp').asstring);
   tick2.CreateVar('FOLIO',QA.Fieldbyname('CANC_NUMERO').asstring);


  //Checamos cual es el puesto
  Q.close;
  q.sql.text:='SELECT * FROM PVPAGOS WHERE PAGO_PAGO='+NUMERO;
  Q.open;

  s.close;
  s.sql.text:='SELECT PUES_DESCRIP FROM PIPUESTOS WHERE PUES_PSTO='+#39+q.fieldbyname('PAGO_PSTO').asstring+#39;
  S.OPEN;
  tick2.CreateVar('PUESTO',S.fieldbyname('PUES_DESCRIP').asstring);

  //cHECAMOS LA URES
  s.close;
  s.sql.text:='SELECT URES_DESCRIP FROM FURES WHERE URES_URES='+#39+q.fieldbyname('PAGO_URES').asstring+#39;
  S.OPEN;
  tick2.CreateVar('URES',S.fieldbyname('URES_DESCRIP').asstring);

  //Nombre del empleado
  s.close;
  s.sql.text:='select PERS_NOMBRE||'+#39+' '+#39+'||PERS_APEPAT||'+#39+' '+#39+'||PERS_APEMAT from FPERSONAS S WHERE S.PERS_PERSONA='+#39+q.fieldbyname('PAGO_EMPL').asstring+#39;
  S.OPEN;
  tick2.CreateVar('NOMBRE',S.fieldS[0].asstring);


  S.close;
  S.sql.text:='SELECT sum(dpag_monto) as percep FROM PIDPAGOS WHERE DPAG_PAGO='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'P'+#39;
  S.OPEN;
  totPer:=S.fieldbyname('PERCEP').asfloat;
  tick2.CreateVar('TPER',Formatfloat('#,#0.00',TOTper));

  S.close;
  S.sql.text:='SELECT sum(dpag_monto) as deduc FROM PIDPAGOS WHERE DPAG_PAGO='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'D'+#39;
  S.OPEN;
  totDed:=S.fieldbyname('DEDUC').asfloat;
  tick2.CreateVar('TDED',Formatfloat('#,#0.00',TOTDED));
  tick2.CreateVar('TNET',Formatfloat('#,#0.00',TOTPER-TOTDED));


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RAcuseCancel.rtf';

  Tick2.ExecuteOpen([Q],SW_SHOW)
end;



function impRep(xmodulo: TFmodulo) : TForm;
begin
        imprimeAcuse(xmodulo,'acusecancel.rtf',xmodulo.Query1.FieldByName('VCAN_Pago').AsString,xmodulo.Query1.FieldByName('VCAN_TNOMINA').AsString)
end;


procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;

 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.Sql.Add ('Delete From PICancPago Where Canc_Pago = '''+
  xmodulo.Query1.FieldByName('CANC_PAGO').AsString+ '''' );
 try
  BQuery.ExecSql ;
  xModulo.Query1.Delete ;
  BQuery.Free ;
 except
  on E: Exception do
  begin
   BQuery.Free ;
   MessageDlg(E.Message ,mtError, [mbOK], 0 ) ;
  end ;
 end ;
end ;

function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  1,2,3 : result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Cancelación de Pago','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;

exports Detalle, impRep;

begin
end.
