unit uResultForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TResultForm = class(TForm)
    Mensaje: TRichEdit;
    pnlOptions: TPanel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    Class Procedure ShowResult(const title : ShortString; const content : String );
    { Public declarations }
  end;

var
  ResultForm: TResultForm;

implementation

{$R *.dfm}
{ TResultForm }


class procedure TResultForm.ShowResult(const title: ShortString;
  const content: String);
begin
  resultForm.Caption := title;
  resultForm.Mensaje.Text := content;
  resultForm.ShowModal();
end;

procedure TResultForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

Initialization
  resultForm := TResultForm.Create(Nil);

Finalization
  FreeAndNil(resultForm);

  
end.
