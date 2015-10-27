unit Error;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFError = class(TForm)
    BMensaje: TButton;
    BError: TButton;
    BCerrar: TButton;
    MemoError: TMemo;
    procedure BMensajeClick(Sender: TObject);
    procedure BErrorClick(Sender: TObject);
    procedure BCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   mMensaje : String ;
   mError : String
  end;

var
  FError: TFError;

implementation

{$R *.DFM}

procedure TFError.BMensajeClick(Sender: TObject);
begin
 MemoError.Lines.Text := mMensaje ;
end;

procedure TFError.BErrorClick(Sender: TObject);
begin
 MemoError.Lines.Text := mError ;
end;

procedure TFError.BCerrarClick(Sender: TObject);
begin
 close ;
end;

end.
