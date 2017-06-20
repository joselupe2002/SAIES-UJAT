unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function generacodigoUnico(cad:string):string;
var
x:integer;
val:integer;
begin
   val:=0;
   FOR x:=1 to length(cad) do
       BEGIN
           val:=val+ord(cad[x]);
       END;
   val:=VAL+ord(cad[1])+ord(cad[length(cad)]);
   generacodigoUnico:=inttostr(val);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
EDIT2.TEXT:= generacodigoUnico(EDIT1.TEXT);
end;

end.
