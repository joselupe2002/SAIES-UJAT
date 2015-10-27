unit Paswd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Main,
  Menus, ComCtrls, ToolWin, Db, DBTables, StdCtrls, ImgList, Buttons;

type
  TFSPaswd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PViejo: TEdit;
    PNuevo: TEdit;
    PConfirma: TEdit;
    Query1: TQuery;
    ToolBar1: TToolBar;
    BAcepta: TToolButton;
    BCancela: TToolButton;
    MMenu: TMainMenu;
    Accion1: TMenuItem;
    Aceptar1: TMenuItem;
    Cancelar1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Aceptar1Click(Sender: TObject);
    procedure PViejoExit(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSPaswd: TFSPaswd;
  FMain : TFMain ;

implementation

{$R *.DFM}

procedure TFSPaswd.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 MMenu.Images := FMain.Iconos ;
 Height := 230 ;
 Width := 285 ;
end;


procedure TFSPaswd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree ;
end;


procedure TFSPaswd.Aceptar1Click(Sender: TObject);
begin
 if UpperCase(PNuevo.Text) <> UpperCase(PConfirma.Text) then
   ShowMessage('No Corresponde Confirmacion')
 else
  begin
   Query1.Sql.Clear ;
   Query1.Sql.Add('ALTER USER '+ FMain.PASWD+ ' IDENTIFIED BY "'+
                  UpperCase(PNuevo.Text)+'"' ) ;
   Query1.ExecSQL ;
   Close ;
  end ;
end;

procedure TFSPaswd.PViejoExit(Sender: TObject);
begin
{ showmessage(FMAIN.USUARIO);
 showmessage(fmain.paswd);
 SHOWMESSAGE(FMAIN.Titulo);
 SHOWMESSAGE(FMAIN.UsuDer);
 SHOWMESSAGE(FMAIN.Dbase); }

 if UpperCase(Pviejo.Text) <> UpperCase(FMain.DBASE) then
  begin
   ShowMessage('PassWord no corresponde ') ;
   PViejo.SetFocus ;
  end
 else PViejo.Enabled := False ;
end;

procedure TFSPaswd.Cancelar1Click(Sender: TObject);
begin
 close ;
end;

end.
