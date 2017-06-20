unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    tab: TPageControl;
    Hoja1: TTabSheet;
    Hoja2: TTabSheet;
    gr: TStringGrid;
    StringGrid2: TStringGrid;
    et: TLabel;
    TabSheet1: TTabSheet;
    Button1: TButton;
    procedure grMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tabDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure grMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  h: THintWindow;
  r: TRect;

implementation

{$R *.DFM}

Procedure GetCursor(Var X,Y:Integer);
var
  P: TPoint;
begin
  GetCursorPos(P);
  X:=P.X;Y:=P.Y;
end;

procedure TForm1.grMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    gr.BeginDrag(true);
    et.caption:='empece..'+inttostr(x);



end;

procedure TForm1.tabDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
elTab:integer;

begin
     eltab:=(x div 90);
     Showmessage('Seguro que desea copiar al Tab'+tab.Pages[eltab].Caption);
     tab.ActivePageIndex:=(x div 90);
end;

procedure TForm1.tabDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
et.caption:='empece';
 If SOURCE IS TStringGrid then
    accept:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//to show the window
h := THintWindow.Create(nil);
end;

procedure TForm1.grMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
GetCursor(X,Y);
r.Left := x; //or the absolute left position of the control
r.Top := y; //or the absolute top position of the control
r.Right := r.Left + 150; //the width of the hint window
r.Bottom := r.Top + 30; //the high of the hint window
h.ActivateHint(r, 'This is a test message'+inttostr(x)+' '+inttostr(y));
end;

end.
