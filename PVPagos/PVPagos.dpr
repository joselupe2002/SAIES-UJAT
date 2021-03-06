library PVPagos;

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
  libreria,
  PDetalle in 'C:\Users\RH\Documents\Gabriel\PROGRAMA SAIES\SAIES\Modi\bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle},
  Cancela in 'Cancela.pas' {FCancela};

{$R *.res}


function canpag(xmodulo : TFModulo) : TForm ;
var mQuery : TQuery ;
begin
 result := nil ;
 if not xmodulo.Query1.FieldByName('VPAG_FecCancel').IsNull then
  begin
   if Application.MessageBox('Descancelar Pago','DesCancelar',
      MB_ICONQUESTION+ MB_YESNO)= IDNO
   then exit ;
   mQuery := TQuery.Create(nil) ;
   mQuery.DataBaseName := 'Sistema' ;
   mQuery.Sql.Add('UPDATE PPAGOS SET PAGO_FecCancel= Null') ;
   mQuery.Sql.Add('Where PAGO_Pago= '+ xModulo.Query1.FieldByName('VPAG_Pago').AsString) ;
   try
    mQuery.ExecSql ;
    xmodulo.Query1.Edit ;
    xmodulo.Query1.FieldByName('VPAG_FecCancel').Clear ;
    xmodulo.Query1.Post ;
    mQuery.Free ;
   except
    on E: Exception do
    begin
     OraErr(E) ;
     mQuery.Free ;
    end ;
   end ;
  end
 else
  begin
   xmodulo.modo := 2 ;
   result := TFCancela.Create(Xmodulo) ;
   xmodulo.ActForm := result ;
   xmodulo.Enabled := False ;
   xmodulo.WindowState := wsMinimized ;
   result.Show ;
  end ;
end;


function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result:= TFDetalle.Create(xmodulo) ;
end;

exports Detalle, canpag;

begin
end.
