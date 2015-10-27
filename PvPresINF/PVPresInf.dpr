library PVPresInf;

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
  libreria,
  PDetalle in 'C:\Gabriel\A_actual\SAIES\Modi\bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle};

{$R *.res}

procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;

 bQuery := TQuery.Create(Application) ;
 bQuery.DataBaseName := 'Sistema' ;
 bQuery.DataSource := xmodulo.DataSource1 ;
 bQuery.Sql.Add ('Delete From PPRESINF') ;
 bQuery.Sql.Add ('Where PRES_Movi= :VPRE_Movi') ;

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



function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  1,2,3 : result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Credito','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;


exports Detalle ;

begin
end.
