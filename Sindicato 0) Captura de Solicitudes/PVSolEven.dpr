library PVSolEven;

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
  Sharemem,
  SysUtils,
  Forms,
  Dialogs,
  Windows,
  Classes,
  DBTables,
  DBGrids,
  DBCGrids,
  Grids,
  graphics,
  modulo,
  libreria,
  clipbrd,
  db,
  Ekrtf,
  PDetalle in '..\bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle};

{$R *.RES}




procedure Borra(xmodulo : TFModulo) ;
 var BQuery : TQuery ;
begin

 xmodulo.LMensaje := False ;
 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 bQuery.DataSource := xmodulo.DataSource1 ;
 bQuery.Sql.Add ('Delete From PSOLEVEN') ;
 bQuery.Sql.Add ('Where SOLE_NUMERO= :VSOL_NUMERO') ;
 bQuery.Sql.Add ('AND  SOLE_ENVIADA='+#39+'N'+#39) ;

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






//===========================RECIBOS Para los descuentos Judiciales ===============================
procedure showRep(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s:Tquery;
Totper, totded:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','SOLEVENTUAL','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIAS',formatdatetime('dd',date));
  tick2.CreateVar('MES',UPPERCASE(formatdatetime('mmmm',date)));
  tick2.CreateVar('ANIO',formatdatetime('yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  q.close;
  q.sql.text:='SELECT * FROM PVSOLEVEN  WHERE VSOL_NUMERO='+#39+NUMERO+#39;
  q.OPEN;

  S.close;
  s.sql.text:='SELECT * FROM PVSOLEVENDET WHERE SOLE_SOLICITUD='+#39+numero+#39;
  s.open;

  tick2.CreateVar('fecha',formatdatetime('dd " de " mmmm " del " yyyy',q.fieldbyname('VSOL_FECHASOL').asdatetime));


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RVSolEven'+numero+'.rtf';

  Tick2.ExecuteOpen([q,s],SW_SHOW)
end;


function impRep(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
        ShowRep(xmodulo,'SolEventual.rtf',xmodulo.Query1.FieldByName('VSOL_NUMERO').AsString)
end;




function Autorizar(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
aux:Tquery;
begin
xmodulo.LMensaje := False ;
q := TQuery.Create(Application) ;
q.DataBaseName := 'Sistema' ;
 if xmodulo.Query1.FieldByName('VSOL_ENVIADA').AsString ='N' then
       if (Application.MessageBox('Seguro que desea Enviar la solicitud a Recursos Humanos', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
          begin
             Q.CLOSE;
             Q.SQL.TEXT:='SELECT ValSolEnvRH('+#39+xmodulo.Query1.FieldByName('VSOL_numero').AsString+#39+')  FROM DUAL';
             Q.open;
             if q.fields[0].asstring='TRUE' then
                begin
                   q.close;
                   q.sql.text:='UPDATE PSOLEVEN SET SOLE_ENVIADA='+#39+'S'+#39+','+
                   ' SOLE_RECHAZADARH='+#39+'N'+#39+
                   ' Where SOLE_NUMERO= '+xmodulo.Query1.FieldByName('VSOL_NUMERO').AsString;
                   Q.ExecSQL;
                end
             else
                showmessage(q.fields[0].asstring);
          end;

  XMODULO.Refrescar1.Click;
  XMODULO.DBGrid1.TitleFont.Name:='Arial';
  XMODULO.DBGrid1.TitleFont.Style:=[fsbold];
  Xmodulo.DBGrid1.Font.Name:='Arial';
end;



function Detalle(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
 case xmodulo.modo of
  1,3 : result := TFDetalle.Create(Xmodulo) ;
  2:  begin if xmodulo.Query1.FieldByName('VSOL_ENVIADA').AsString='N' Then
         result := TFDetalle.Create(Xmodulo)
      else
         begin
            xmodulo.LMensaje := False ;
            Showmessage('Las solicitudes que ya fueron enviadas no pueden ser modificadas');
         end;
      end;
  4 : if Application.MessageBox('Borrar Eventual', 'Confirmar',
        MB_ICONQUESTION+ MB_YESNO)= IDNO
      then  xmodulo.LMensaje := False
      else
         begin
             if xmodulo.Query1.FieldByName('VSOL_ENVIADA').AsString='N' Then
                Borra(xmodulo)
             else
                begin
                   xmodulo.LMensaje := False ;
                   Showmessage('Las solicitudes que ya fueron enviadas no pueden ser eliminadas');
                end;
         end;
 end ;
end ;



exports Detalle, Autorizar, impRep;

begin


end.
