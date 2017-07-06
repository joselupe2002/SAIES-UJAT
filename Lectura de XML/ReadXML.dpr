program ReadXML;

uses
  Forms,
  UXML in 'UXML.pas' {forma};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tforma, forma);
  Application.Run;
end.
