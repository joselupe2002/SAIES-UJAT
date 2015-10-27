unit Calendario;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  SysUtils, StdCtrls, Grids, Calendar, ExtCtrls, Spin;

type
  TBrDateForm = class(TForm)
    Calendar1: TCalendar;
    OkBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    HoyBtn: TSpeedButton;
    cbMes: TComboBox;
    spAnio: TSpinEdit;
    procedure HoyBtnClick(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure spAnioChange(Sender: TObject);
  private
    procedure SetDate(xFecha : TDateTime);
    function GetDate: TDateTime;
  public
    property Fecha : TDateTime read GetDate write SetDate;
  end;

var
  BrDateForm: TBrDateForm;

implementation

{$R *.DFM}

procedure TBrDateForm.SetDate(xFecha : TDateTime);
var aa,mm,dd : Word ;
begin
 Calendar1.CalendarDate := xFecha;
 DecodeDate(xFecha, aa,mm,dd) ;
 cbMes.ItemIndex := mm - 1 ;
 spAnio.value := aa ;
end;

function TBrDateForm.GetDate: TDateTime;
begin
  Result := Calendar1.CalendarDate;
end;

procedure TBrDateForm.HoyBtnClick(Sender: TObject);
begin
 Fecha := Date  ;
end;

procedure TBrDateForm.cbMesChange(Sender: TObject);
begin
 Calendar1.Month := cbMes.ItemIndex + 1 ;
end;

procedure TBrDateForm.spAnioChange(Sender: TObject);
begin
 Calendar1.Year := spAnio.Value ;
end;

end.
