library PNominas;

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
  PDetalle in '..\bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle},
  Cancela in 'Cancela.pas' {FCancela},
  recibos in 'Recibos.pas' {FRecibos};

{$R *.res}

procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;


 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.DataSource := Xmodulo.DataSource1 ;

 BQuery.Sql.Add('Select NOMI_Contab as Sigue From PNOMINAS') ;
 BQuery.Sql.Add('Where NOMI_Nomina= :NOMI_Nomina') ;
 BQuery.Open ;

 if (BQuery.FieldByName('Sigue').AsString= 'S') and
  (Application.MessageBox('Nomina ya esta Contabilizada, borrar de todos modos',
                         'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDNO) then
 begin
  BQuery.Free ;
  exit ;
 end ;


 bQuery.Close ;
 try
  BQuery.Sql.Clear ;
  BQuery.Sql.Add ('Delete From PNOMINAS Where NOMI_Nomina= :NOMI_Nomina') ;
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



function Detalle(xmodulo: TFmodulo) : TForm ;
var BQuery : TQuery ;
begin
 result :=  nil ;
 case xmodulo.modo of
  1,3 : result:= TFDetalle.Create(xmodulo) ;
    2 :
     begin
      BQuery := TQuery.Create(Application) ;
      BQuery.DataBaseName := 'Sistema' ;
      BQuery.SQL.Add('Select NVL(NOMI_Polid,0) As Polid From PNominas') ;
      BQuery.SQL.Add('Where NOMI_Nomina = :NOMI_Nomina') ;
      BQuery.DataSource := XModulo.DataSource1 ;
      BQuery.Open ;
      if BQuery.FieldByName('Polid').AsInteger = 0
      then result:= TFDetalle.Create(xmodulo) ;
      BQuery.Free ;
     end ;
    4 : if Application.MessageBox('Borrar nomina','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;


procedure contab(xmodulo: TFmodulo) ;
var
 cQuery : TQuery ;
begin

 cQuery := TQuery.Create(Application) ;
 cQuery.DataBaseName := 'Sistema' ;
 cQuery.DataSource := Xmodulo.DataSource1 ;

 cQuery.Sql.Clear ;
 cQuery.Sql.Add('Select NOMI_Contab as Sigue From PNOMINAS') ;
 cQuery.Sql.Add('Where NOMI_Nomina= :NOMI_Nomina') ;
 cQuery.DataSource := xModulo.DataSource1 ;
 cQuery.Open ;

 if cQuery.FieldByName('Sigue').AsString= 'S' then
  begin
    cQuery.Free ;
    raise Exception.Create('Nomina ya esta Contabilizada') ;
  end ;


 if Application.MessageBox('Contabilizar nomina','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO then
  begin
   cQuery.Free ;
   exit ;
  end ;

 try
  cQuery.Close ;
  cQuery.Sql.Clear ;
  cQuery.Sql.Add('UPDATE PNOMINAS SET NOMI_Contab= ''S''') ;
  cQuery.Sql.Add('Where NOMI_Nomina= :NOMI_Nomina') ;
  cQuery.ExecSql ;
  cQuery.Free ;
  xModulo.Query1.Edit ;
  xModulo.Query1['NOMI_Contab'] := 'S' ;
  xModulo.Query1.Post ;
 except
  on E: Exception do
  begin
   cQuery.Free ;
   OraErr(E) ;
  end ;
 end ;

end ;


function recibos(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
 if xmodulo.Query1.Eof
 then exit ;

 xmodulo.LMensaje := False ;
 xmodulo.modo := 2 ;
 result := TFRecibos.Create(Xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.Show ;
end;


exports Detalle, contab, recibos ;

begin
end.
