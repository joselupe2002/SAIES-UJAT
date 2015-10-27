library PvEmpldos;

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
  Modulo,
  libreria,
  clipbrd,
  PDetalle in 'bin\PDetalle.pas' {PFDetalle},
  PRepo in 'bin\PRepo.pas' {PFRepo},
  Detalle in 'Detalle.pas' {FDetalle},
  Repo in 'Repo.pas' {FRepo},
  Datos in 'Datos.pas' {dmDatos: TDataModule};

{$R *.RES}

procedure Borra(xmodulo : TFModulo) ;
 var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;
 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
{ BQuery.Sql.Add ('Delete From FProgram Where Prog_Prog= '''+
  xmodulo.Query1.FieldByName('Prog_Prog').AsString+ '''' );}
 bQuery.DataSource := xmodulo.DataSource1 ;
 bQuery.Sql.Add ('Delete From Fpersonas') ;
 bQuery.Sql.Add ('Where PERS_Persona= :Vemp_Empl') ;

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

function Repo(xmodulo : TFModulo) : TPFRepo ;
begin
// showmessage('aqui se pasan los parámetros');
 Clipboard.Astext := xmodulo.query1.fields.fieldbyname('Vemp_empl').Asstring;

 xmodulo.LMensaje := False ;
 result := TFRepo.Create(xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.QRepo.Preview ;
end ;


function Detalle(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
 case xmodulo.modo of
  1,2,3 : result := TFDetalle.Create(Xmodulo) ;
  4 : if Application.MessageBox('Borrar Persona', 'Confirmar',
        MB_ICONQUESTION+ MB_YESNO)= IDNO
      then  xmodulo.LMensaje := False
      else Borra(xmodulo) ;
  5 : Repo(xmodulo) ;
 end ;
end ;



exports Detalle, Repo ;

begin


end.
