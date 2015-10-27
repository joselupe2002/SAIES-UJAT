library PVHNombram ;

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
  clipbrd,
  PDetalle in 'bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle},
  Datos in 'Datos.pas' {dmDatos: TDataModule},
  PRepo in 'bin\PRepo.pas' {PFRepo},
  CRepo in 'CRepo.pas' {FCRepo},
  Asigna in 'Asigna.pas' {FAsigna},
  Repo in 'Repo.pas' {FRepo},
  BRepo in 'BRepo.pas' {FBRepo};

{$R *.res}

procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin
 xmodulo.LMensaje := False ;

 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.Sql.Add ('Delete From PhNombram Where NOMB_NOMB= '+
  xmodulo.Query1.FieldByName('VNOM_NOMB').AsString );
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

function Repo(xmodulo : TFModulo) : TPFRepo ;
begin
// showmessage('aqui se pasan los parámetros');
 Clipboard.Astext := xmodulo.query1.fields.fieldbyname('VNOM_NOMB').Asstring;

 xmodulo.LMensaje := False ;
 result := TFRepo.Create(xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.QRepo.Preview ;
end ;

function BRepo(xmodulo : TFModulo) : TPFRepo ;
begin
// showmessage('aqui se pasan los parámetros');
 Clipboard.Astext := xmodulo.query1.fields.fieldbyname('VNOM_NOMB').Asstring;

 xmodulo.LMensaje := False ;
 result := TFBRepo.Create(xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.QRepo.Preview ;
end ;

function CRepo(xmodulo : TFModulo) : TPFRepo ;
begin
// showmessage('aqui se pasan los parámetros');
 Clipboard.Astext := xmodulo.query1.fields.fieldbyname('VNOM_NOMB').Asstring;

 xmodulo.LMensaje := False ;
 result := TFCRepo.Create(xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.QRepo.Preview ;
end ;


function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  1,2,3 : result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Nombramiento HAS','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
  5 : begin
    if (xmodulo.query1.fields.fieldbyname('VNOM_TPSTO').Asstring = 'C') or (xmodulo.query1.fields.fieldbyname('VNOM_Tpsto').Asstring = 'MS') then
        CRepo(xmodulo)
    else
     begin
       if (xmodulo.query1.fields.fieldbyname('VNOM_TPLAZA').Asstring = 'B') and (xmodulo.query1.fields.fieldbyname('VNOM_TIPO').Asstring = 'T') then
        BRepo(xmodulo)
       else
        Repo(xmodulo);
      end;
     end;
 end ;
end;

function Asigna(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
 if xmodulo.Query1.Eof
 then exit ;

 Clipboard.Astext := xmodulo.query1.fields.fieldbyname('VNOM_NOMB').Asstring;

 xmodulo.LMensaje := False ;
 xmodulo.modo := 2 ;
 result := TFAsigna.Create(Xmodulo) ;
 xmodulo.ActForm := result ;
 xmodulo.Enabled := False ;
 xmodulo.WindowState := wsMinimized ;
 result.Show ;
end;


exports Detalle, Repo, Asigna, BRepo, CRepo;

begin
end.
