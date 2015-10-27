library PVMovFueNomI;


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
  DBTables,
  Forms,
  Dialogs,
  Windows,
  Libreria,
  EKrtf,
  shellapi,
  controls,
  StdCtrls,
  db,
  Detalle in 'Detalle.pas' {FDetalle},
  PDetalle in '..\bin\PDetalle.pas' {PFDetalle},
  Recibos in 'Recibos.pas' {FRecibos},
  Orden in 'Orden.pas' {FOrden},
  Cancela in 'Cancela.pas' {FCancela};

//  PDetalle in '..\bin\PDetalle.pas' {PFDetalle};

{$R *.res}


{===============================================================================
 Convierte una cantidad a pesos
 ===============================================================================}
function pesos (val : real) : String ;
const
   unidad:array[1..15] of string=('UN','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINCE');
   decena:array[1..9] of string=('DIEZ','VEINTE','TREINTA','CUARENTA','CINCUENTA','SESENTA','SETENTA','OCHENTA','NOVENTA');
   centena:array[1..9] of string=('CIENTO','DOSCIENTOS','TRESCIENTOS','CUATROCIENTOS','QUINIENTOS','SEISCIENTOS','SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');

var
     millon, miles, xresto,canti:Integer ;
     fmiles : Currency ;
     cadena,fracc,aux: String ;
//************************inicio de subfunción****************************///
function resto (cual : Integer) : String ;
var cade : String ;
    cent, dece, unid : Integer ;
begin
 cade := '' ;
{ Centenas }
 cent := StrToInt(FloatToStr(Int(cual/100))) ;
 if cent > 0 then cade := centena[cent]+ ' ' ;

 { Decenas }
 dece := StrToInt( FloatToStr( Int((cual - (cent * 100))/10) ) ) ;
 if dece > 0 then cade := cade+ decena[dece]+ ' ' ;

 { Unidades }
 unid := cual - ( (cent * 100) + (dece * 10)) ;
 if unid > 0 then
 case dece of
  1:
  begin
   cade := copy(cade, 1, length(cade) - 5) ;
   if (unid > 0) and (unid < 6) then
   cade := cade+ unidad[10+unid]
   else cade := cade+ 'DIECI'+ unidad[unid] ;
  end ;

  2:  cade := copy(cade, 1, length(cade)- 7) + 'VEINTI'+ unidad[unid] ;
 else
  begin
   if not ( (length(cade)= 0) or (dece= 0) ) then cade := cade+ 'y ' ;
   cade := cade+ unidad[unid] ;
  end ;
 end ;

 if (cent= 1) and (dece= 0) and (unid= 0) then cade := 'CIEN' ;

 result := Trim(cade) ;
end ;
//************************fin de subfunción****************************///

begin
 canti:=trunc(val);
 aux:=floattostr(val);

 if(pos('.',aux)>0)then
 begin
   fracc:=copy(aux,pos('.',aux)+1,2);
   if(length(fracc)=1) then fracc:=fracc+'0'
 end
 else fracc:='00';

 if canti > 999999999 then
 begin
  result := '***************' ;
  exit;
 end ;

 cadena := '' ;
{ Calcula Millones }
 millon := StrToInt( FloatToStr( INT(canti/1000000) ) ) ;
 if millon = 1 then cadena := resto(millon)+ ' MILLON ' ;
 if millon > 1 then cadena := resto(millon)+ ' MILLONES ' ;

{ Calcula Miles }
 fmiles := (canti - (millon * 1000000) )/1000 ;
 miles := StrToInt(FloatToStr( INT(fmiles))) ;
 if miles = 1 then cadena := resto(miles)+ ' MIL ' ;
 if miles > 1 then cadena := cadena+ resto(miles)+ ' MIL ' ;

{Calcula resto }
 xresto := canti - ( (millon * 1000000) + (miles * 1000) ) ;
 if xresto > 0 then cadena := cadena  + resto(xresto) ;

 if length(cadena) = 0 then cadena := 'CERO' ;

 if (canti mod 1000000)=0 then cadena:=cadena+' DE ';
 result := cadena+' PESOS '+fracc+'/100 M.N.';
end ;


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



procedure ImprimeRep(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s,QORD:Tquery;
Subtotal, total, isr:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
    qord := TQuery.Create(Application) ;
  qORD.DataBaseName := 'Sistema' ;

if not(fileexists(ExtractFiledir(Paramstr(0))+'\'+Rep)) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPFN','rtf');
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  tick2.CreateVar('NREC',Numero);

  Q.CLOSE;
  Q.sql.text:='select min(poli_polid) from fpolizas s where s.poli_descrip LIKE  '+#39+numero+'_%'+#39;
  q.open;
  tick2.CreateVar('POLIZA',Q.FIELDS[0].ASSTRING);

  q.close;
  q.sql.text:='SELECT SUM(DPAG_MONTO) FROM PVMOVFNPDPAGOSRI WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  subtotal:=q.fields[0].asfloat;
  tick2.CreateVar('SUBTOTAL',floattostr(subtotal));

  q.close;
  q.sql.text:='SELECT SUM(DPAG_MONTO) FROM PVMOVFNPDPAGOSRI  WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  ISR:=q.fields[0].asfloat;
  tick2.CreateVar('ISR',floattostr(ISR));

  tick2.CreateVar('TOTAL',floattostr(subtotal-ISR));
  tick2.CreateVar('IVA','0');

  Q.close;
  Q.sql.text:='SELECT * FROM PVMOVFUENOMI WHERE VMOV_SEQ='+#39+Numero+#39;
  Q.open;


  s.close;
  s.sql.text:='SELECT * FROM PVMOVFNPDPAGOSRI WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' ORDER BY DPAG_PERDED DESC, DPAG_CONP' ;
  s.OPEN;

  qord.close;
  qord.sql.text:='select sum(docx_total) AS MONTO from FINANZAS.afdocxpag s where s.docx_polid in '+
  '(select poln_polid from pIpolnomi a where a.poln_nomina='+#39+nUMERO+#39+')';
  QORD.OPEN;
  tick2.CreateVar('TOTALO',Qord.fields[0].asstring);

  qord.close;
  qord.sql.text:='select s.docx_polid as IDORDEN, s.docx_persona AS PERSONA, '+
  't.pers_nombre||'+#39+' '+#39+'||pers_apepat||'+#39+' '+#39+'||pers_apemat AS NOMBRE, '+
  'docx_total  AS MONTO from FINANZAS.afdocxpag s, FINANZAS.fpersonas t where s.docx_polid in '+
  '(select poln_polid from pIpolnomi a where a.poln_nomina='+#39+nUMERO+#39+')'+
  'and s.docx_persona=t.pers_persona ';
  QORD.OPEN;



  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepFN.rtf';

  Tick2.ExecuteOpen([Q,S, QORD],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;





procedure ImprimeRec(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
categad:string;
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

if not(fileexists(ExtractFiledir(Paramstr(0))+'\'+Rep)) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPRECIBO','rtf');
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  q.close;
  q.sql.text:='SELECT * FROM PVMOVFUENOMI  WHERE VMOV_SEQ='+#39+NUMERO+#39;
  q.OPEN;
  tick2.CreateVar('NREC',Q.FIELDBYNAME('VMOV_SEQ').asstring);
  tick2.CreateVar('PERIODO',Q.FIELDBYNAME('VMOV_FECINI').asstring+' AL '+Q.FIELDBYNAME('VMOV_FECFIN').asstring);


  s.close;
  s.sql.text:='SELECT * FROM PVNOMBRAMALLI WHERE VNOM_NOMB='+#39+q.fieldbyname('VMOV_NOMBS').asstring+#39;
  s.OPEN;
  tick2.CreateVar('EMPLEADO',s.fieldbyname('VNOM_EMPLI').asstring);
  tick2.CreateVar('EMPLEADOD',s.fieldbyname('VNOM_NOMBRE').asstring);
  tick2.CreateVar('PUESTO',s.fieldbyname('VNOM_PSTOID').asstring);
  tick2.CreateVar('CATEGORIA','"'+s.fieldbyname('VNOM_CATEGRDESC').asstring+'"');
  categad:='';
  tick2.CreateVar('CATEGADD',categad);
  Qa.close;
  qa.sql.text:='SELECT  A.PERS_RFC, B.ATRE_NUMSS FROM FPERSONAS A,PATREMPL B WHERE A.PERS_PERSONA(+)=B.ATRE_EMPL AND '+
  ' PERS_PERSONA='+#39+s.fieldbyname('VNOM_EMPLI').asstring+#39;
  Qa.open;
  tick2.CreateVar('RFC',QA.fieldbyname('PERS_RFC').asstring);
  tick2.CreateVar('NNS',QA.fieldbyname('ATRE_NUMSS').asstring);

  Qa.close;
  qa.sql.text:='select SPUE_SUELDO from pIspuestos t WHERE T.SPUE_PSTO='+#39+S.fieldbyname('VNOM_PSTOI').asstring+#39+
  ' AND T.SPUE_CATEG='+#39+s.fieldbyname('VNOM_CATEGR').asstring+#39;
  Qa.open;
  tick2.CreateVar('SUELDO',Qa.fieldbyname('SPUE_SUELDO').asstring);

  Qa.close;
  qa.sql.text:='SELECT SUM(DPAG_DIAS) FROM PVMOVFNPDPAGOSRI  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('DIAS',Qa.Fields[0].asstring);

  Qa.close;
  qa.sql.text:='SELECT * FROM PVMOVFNPDPAGOSRI  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('URES',Qa.fieldbyname('PAGO_URES').asstring+' '+QA.fieldbyname('PAGO_URESD').asstring);

  //Sacamos las percepciones
  qp.close;
  qp.sql.text:='SELECT * FROM PVMOVFNPDPAGOSRI WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'P'+#39+' order by dpag_conp' ;
  qp.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as percep FROM PVMOVFNPDPAGOSRI WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  totPer:=Q.fieldbyname('PERCEP').asfloat;
  tick2.CreateVar('TPER',Formatfloat('#,#0.00',TOTper));


   //Sacamos las DEDUCCIONES
  qD.close;
  qD.sql.text:='SELECT * FROM PVMOVFNPDPAGOSRI WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'D'+#39+' order by dpag_conp' ;
  qd.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as deduc FROM PVMOVFNPDPAGOSRI WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  totDed:=Q.fieldbyname('DEDUC').asfloat;
  tick2.CreateVar('TDED',Formatfloat('#,#0.00',TOTDED));

  tick2.CreateVar('TNET',Formatfloat('#,#0.00',TOTPER-TOTDED));

  tick2.CreateVar('LETRAS',PESOS(TOTPER-TOTDED));

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepRecibo.rtf';

  Tick2.ExecuteOpen([Qp,qd],SW_SHOW)
end;






procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin

 xmodulo.LMensaje := False ;
 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.Sql.Add ('Delete From PMOVFUENOMI Where MOVF_Seq= '+
 xmodulo.Query1.FieldByName('VMOV_Seq').AsString );

 if xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='N' then
    begin
       try
        BQuery.ExecSql ;
        BQUERY.Close;
        BQUERY.SQl.text:='DELETE FROM PMOVFUENOMI WHERE MOVF_PADRE='+
        #39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
        BQUERY.Execsql;
        xModulo.Refrescar1Click(NIL);
        BQuery.Free ;
       except
        on E: Exception do
        begin
         BQuery.Free ;
         OraErr(E) ;
        end ;
       end ;
    end
 else
    showmessage('No se pueden borrar los Pagos Fuera de Nomina que ya se han autorizado');
end ;



function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  2: begin
         if xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='N' THEN
             result:= TFDetalle.Create(xmodulo)
         else
             begin
               xmodulo.LMensaje := False ;
               showmessage('No se puede modificar los pagos Fuera de Nomina Autorizados');
             end;
     end;
  1:  result:= TFDetalle.Create(xmodulo) ;
  3:  result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Pago Fuera de Nomina','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;






function Autorizar(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
aux:Tquery;
begin
 if xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='N' then
    begin
       if (Application.MessageBox('Seguro que desea Autorizar el Pago Fuera de Nomina', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
          begin
               q := TQuery.Create(Application) ;
               q.DataBaseName := 'Sistema' ;
               q.close;
               q.sql.text:='SELECT VALPAGFUENOMI('+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39+') FROM DUAL';
               Q.OPEN;
               if q.Fields[0].asstring<>'TRUE' then
                  begin
                     Showmessage(q.fields[0].asstring);
                     exit
                  end
               else
                  begin
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_AUTORIZADO='+#39+'S'+#39+
                     ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
                     Q.ExecSQL;


                     aux := TQuery.Create(Application) ;
                     aux.DataBaseName := 'Sistema' ;
                     aux.SQL.TEXT:='SELECT * FROM PMOVFUENOMI WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
                     AUX.OPEN;

                     while not(aux.eof) do
                        begin

                           q.close;
                           q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_AUTORIZADO='+#39+'S'+#39+
                           ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                           Q.ExecSQL;

                           aux.next;
                        end;
                    xModulo.Refrescar1Click(NIL);
                  end;
          end;
    end
 else
    if (Application.MessageBox('El pago fuera de Nomina ya esta Autorizado ¿Desea regresar el Movimiento a NO AUTORIZADO?', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
        begin
                     q := TQuery.Create(Application) ;
                     q.DataBaseName := 'Sistema' ;
                     aux := TQuery.Create(Application) ;
                     aux.DataBaseName := 'Sistema' ;
                     
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_AUTORIZADO='+#39+'N'+#39+
                     ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
                     Q.ExecSQL;


                     aux := TQuery.Create(Application) ;
                     aux.DataBaseName := 'Sistema' ;
                     aux.SQL.TEXT:='SELECT * FROM PMOVFUENOMI WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
                     AUX.OPEN;

                     while not(aux.eof) do
                        begin

                           q.close;
                           q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_AUTORIZADO='+#39+'N'+#39+
                           ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                           Q.ExecSQL;

                           aux.next;
                        end;
                    xModulo.Refrescar1Click(NIL);
        end;
end;


function Contab(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
AUX:TQUERY;
begin
 if (xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='S') AND
    (xmodulo.Query1.FieldByName('VMOV_CONTABILIZADO').AsString ='N') and
    (xmodulo.Query1.FieldByName('VMOV_PADRE').AsString ='0') then
    begin
        if (Application.MessageBox('Seguro que desea Contabilizar el Pago Fuera de Nomina', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
           begin
              q := TQuery.Create(Application) ;
              q.DataBaseName := 'Sistema' ;
              q.close;
              q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_CONTABILIZADO='+#39+'S'+#39+
                          ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
              Q.ExecSQL;

              aux := TQuery.Create(Application) ;
              aux.DataBaseName := 'Sistema' ;
              aux.SQL.TEXT:='SELECT * FROM PMOVFUENOMI WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
              AUX.OPEN;

              while not(aux.eof) do
                  begin
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_CONTABILIZADO='+#39+'S'+#39+
                     ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                     Q.ExecSQL;
                     aux.next;
                  end;
              xModulo.Refrescar1Click(NIL);
           end;
    end
 else
        begin
             showmessage('El pago fuera de Nomina No se encuentra autorizado o ya fue contabilizado o este pago depende de otro');
        end;
end;


function impRep(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
  if (xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='S')  then
        imprimeReP(xmodulo,'RepFN.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString)
  else
        showmessage('Solo se puede imprimir Reporte para Pagos Fuera de Nomina Autorizados');
end;


function impRepDet(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
         result :=  nil ;
         result:= TFRecibos.Create(xmodulo) ;

end;



function Devengar(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
AUX:TQUERY;
begin

 if (xmodulo.Query1.FieldByName('VMOV_CONTABILIZADO').AsString ='S') AND
    (xmodulo.Query1.FieldByName('VMOV_DEVENGADO').AsString ='N') and
    (xmodulo.Query1.FieldByName('VMOV_PADRE').AsString ='0')
      then
    begin
        if (Application.MessageBox('Seguro que desea Devengar el Pago Fuera de Nomina', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
           begin
               q := TQuery.Create(Application) ;
              q.DataBaseName := 'Sistema' ;
              q.close;
              q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_DEVENGADO='+#39+'S'+#39+
                          ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
              Q.ExecSQL;
              aux := TQuery.Create(Application) ;
              aux.DataBaseName := 'Sistema' ;
              aux.SQL.TEXT:='SELECT * FROM PMOVFUENOMI WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
              AUX.OPEN;

              while not(aux.eof) do
                  begin
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOMI SET MOVF_DEVENGADO='+#39+'S'+#39+
                     ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                     Q.ExecSQL;
                     aux.next;
                  end;
              xModulo.Refrescar1Click(NIL);
           end;
    end
else
        begin
             showmessage('El pago fuera de Nomina No se encuentra Contabilizado o ya fue Devengado o este pago depende de otro');
        end;
end;


function impRec(xmodulo : TFModulo) : TForm ;
begin
 if (xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='S')  then
    begin
            imprimeRec(xmodulo,'RepRecibo.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString);
    end
 else
    showmessage('Solo se puede imprimir Recibo de Pagos Fuera de Nomina Autorizados');
end;


function verOrden(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
         result :=  nil ;
         result:= TFOrden.Create(xmodulo) ;
         (RESULT.FindComponent('MOV') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
         (RESULT.FindComponent('FECHA') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_FechaMov').AsString;
end;



function cancelPago(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
if (xmodulo.Query1.FieldByName('VMOV_CONTABILIZADO').AsString ='S') AND
    (xmodulo.Query1.FieldByName('VMOV_DEVENGADO').AsString ='S') and
    (xmodulo.Query1.FieldByName('VMOV_PADRE').AsString ='0') then
    begin
         result :=  nil ;
         result:= TFCancela.Create(xmodulo) ;
         (RESULT.FindComponent('MOV') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
         (RESULT.FindComponent('PROYECTO') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_PROYFN').AsString;
         (RESULT.FindComponent('FECHA') AS TEdit).text:=formatdatetime('dd/mm/yyyy',xmodulo.Query1.FieldByName('VMOV_FechaMov').AsDateTime);
         (RESULT.FindComponent('FECHAPAGO') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_FechaMov').AsString;
          (RESULT.FindComponent('TRANS') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_TRANSFER').AsString;
    end
else
   showmessage('Solo se puede Cancelar pagos que esten contabilizados totalmente');
end;



exports Detalle, Autorizar,Contab, devengar, impRep, impRec, impRepDet, verOrden, cancelPago ;
begin
//
end.
