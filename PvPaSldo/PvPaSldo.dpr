library PvPaSldo;

//ultima 25/nov/02

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
  Detalle in 'Detalle.pas' {FDetalle},
  PDetalle in '..\bin\PDetalle.pas' {PFDetalle};

//  PDetalle in '..\bin\PDetalle.pas' {PFDetalle};

{$R *.res}

procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;

 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.Sql.Add ('Delete From PPASLDO Where PASL_Seq= '+
  xmodulo.Query1.FieldByName('VPAS_Seq').AsString );
 try
  BQuery.ExecSql ;
  xModulo.Query1.Delete ;
  BQuery.Free ;
 except
  on E: Exception do
  begin
   BQuery.Free ;
   OraErr(E) ;
  end ;
 end ;
end ;



function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  1,2,3 : result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Pago de Sueldo','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;



exports Detalle ;

begin
//
end.
