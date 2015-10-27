library PvFiniqAdmin;

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
  Forms,
  DBTables,
  Dialogs,
  Windows,
  Modulo,
  libreria, ekrtf,
  PDetalle in '..\..\Bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle};
 

{$R *.res}

procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;

 bQuery := TQuery.Create(Application) ;
 bQuery.DataBaseName := 'Sistema' ;
 bQuery.DataSource := xmodulo.DataSource1 ;
 bQuery.Sql.Add ('Delete From PFINIQADMTVO') ;
 bQuery.Sql.Add ('Where PFIN_CONSEC= :VPFI_CONSEC') ;
 //bQuery.Sql.Add ( 'And FALT_Fecha= :VFAL_Fecha');
//SHOWMESSAGE(BQUERY.SQL.TEXT);
 try
  bQuery.ExecSql ;
  xModulo.Query1.Delete ;
  bQuery.Free ;
 except
  on E: Exception do
  begin
   bQuery.Free ;
   OraErr(E) ;
  end ;
 end ;
end ;



procedure showRep(xmodulo: TFmodulo; Rep:String;Numero:string);
var
//vis:string;
//venci:string;
tick2:TekRTF;
Q,s,D,E:Tquery;
Totper, ISREMUN,NETOPAG:real;
begin

SHOWMESSAGE('INICIO');
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  D := TQuery.Create(Application) ;
  D.DataBaseName := 'Sistema' ;
  SHOWMESSAGE('Q,S,D');

  E := TQuery.Create(Application) ;
  E.DataBaseName := 'Sistema' ;
 SHOWMESSAGE('V');
  // bQuery.DataSource := xmodulo.DataSource1 ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPFINIQUITO','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIAS',formatdatetime('dd',date));

  q.close;
  q.sql.text:='SELECT pfinp_cveconcep,conc_descrip,pfinp_monto from PFINPRESTACIONES,pconcepto '
  +' where   pfinp_cveconcep= conc_conp AND  pfinp_tipopercep='+ quotedstr('P')
  + 'AND   pfinp_noconsec ='+#39+numero+#39;
  q.OPEN;

  S.close;
  s.sql.text:='SELECT * FROM PVFINIQADMIN WHERE VPFI_CONSEC='+#39+numero+#39;
  //+ xmodulo.Query1.FieldByName('VPFI_NOMBRAM').AsString ;
//  showmessage(FDetalle.Antiguedad.Text);
   s.open;
 //  tick2.CreateVar('ANTIGUEDAD',FDetalle.Antiguedad.Text);
   // tick2.CreateVar('DIAS', FDetalle.dias.Text);
     D.close;
D.sql.text:='SELECT pfinp_cveconcep,conc_descrip,pfinp_monto, PFINP_IMP_GRAVA,PFINP_IMP_EXENTO from PFINPRESTACIONES,pconcepto '
  +' where pfinp_noconsec ='+#39+numero+#39  +
   ' and pfinp_cveconcep= conc_conp and pfinp_tipopercep='+ quotedstr('PF') ;
  D.open;

 // tick2.CreateVar('fecha',formatdatetime('dd " de " mmmm " del " yyyy',q.fieldbyname('VSOL_FECHASOL').asdatetime));
   //
   E.close;
 E.sql.text:='SELECT pfinp_cveconcep,conc_descrip,pfinp_monto, PFINP_IMP_GRAVA,PFINP_IMP_EXENTO from PFINPRESTACIONES,pconcepto '
  +' where pfinp_noconsec =' +#39+numero+#39 +     //+ quotedstr(consec.TEXT )
   ' and pfinp_cveconcep= conc_conp(+) and pfinp_tipopercep=' + quotedstr('PG') ;
     E.open;
              // StrTofloat(ISRIDLAB.text)+ StrTofloat(ISRPERCEP.text));
  iSREMUN:= StrTofloat(S.FIELDS[17].ASSTRING) + StrTofloat(S.FIELDS[18].ASSTRING);
  SHOWMESSAGE(FLOATtoStr(iSREMUN));
  NETOPAG:= StrTofloat(S.FIELDS[19].ASSTRING)- (iSREMUN + 0);
  tick2.CreateVar('ISRREMUN',ISREMUN);
  tick2.CreateVar('NETOPAGO',NETOPAG);

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RREPFINIQUITO.rtf';

  Tick2.ExecuteOpen([q,S,D,E],SW_SHOW)

end;

function impRepFin(xmodulo: TFmodulo) : TForm;
begin
     //   ShowRep(xmodulo,'RepFiniquito.rtf', '0') ;
     SHOWMESSAGE('INICIO');
         ShowRep(xmodulo,'RepFiniquito.rtf', '109');
//         xmodulo.Query1.FieldByName('VPFI_CONSEC').AsString) ;
//        xmodulo.Query1.FieldByName('VPFI_CONSEC').AsString)
end;


function impRep(xmodulo: TFmodulo) : TForm;
begin
     //   ShowRep(xmodulo,'RepFiniquito.rtf', '0') ;
     SHOWMESSAGE('INICIO');
         ShowRep(xmodulo,'RepFiniquito.rtf', '109');
//         xmodulo.Query1.FieldByName('VPFI_CONSEC').AsString) ;
//        xmodulo.Query1.FieldByName('VPFI_CONSEC').AsString)
end;




{function Repo1(xmodulo : TFModulo) : TPFRepo ;
begin
// showmessage('aqui se pasan los parámetros');
 Clipboard.Astext := xmodulo.query1.fields.fieldbyname('VPFI_NOMBRAM').Asstring;

 xmodulo.LMensaje := False ;
 result := TFRepo.Create(xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.QRepo.Preview ;
end ;   }



function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  1,2,3 : result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Falta','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;


exports Detalle, impRep,impRepFin ;


begin
end.
