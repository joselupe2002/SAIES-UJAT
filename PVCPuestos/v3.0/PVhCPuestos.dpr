library PVhCPuestos;

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
  libreria,
  Dialogs,
  Windows,
  PDetalle in '..\..\bin\PDETALLE.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle},
  Sueldo in 'Sueldo.pas' {FSueldo};

{$R *.res}

procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;

 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.Sql.Add ('Delete From PhCPuestos ') ;
 BQuery.Sql.Add ('Where CPUE_Psto= :VCPU_Psto' ) ;
 BQuery.Sql.Add (  'And CPUE_Categ= :VCPU_Categ' ) ;
 BQuery.DataSource := xmodulo.DataSource1 ;
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
  4 : if Application.MessageBox('Borrar Categoria HAS','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;

function sueldos(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
 if xmodulo.Query1.Eof
 then exit ;

 xmodulo.LMensaje := False ;
 xmodulo.modo := 2 ;
 result := TFSueldo.Create(Xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.Show ;
end;


exports Detalle, sueldos ;

begin
end.

