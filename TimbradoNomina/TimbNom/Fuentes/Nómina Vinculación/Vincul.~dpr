library Vincul;

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
  Windows,
  Messages,
  SysUtils,
  Classes,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ActnList,
  StdActns,
  UVinc in 'UVinc.pas' {Forma};

{$R *.RES}



Var
  Server  : TApplication;
  Cliente : TScreen;

Procedure InicioMDI(App, Scr: integer); StdCall;
begin
  Cliente := Screen;
  Screen := TScreen(Scr);
  Server := Application;
  Application := TApplication(App);
end;

Procedure FinMDI; StdCall;
begin
  Screen := Cliente;
  Application := Server;
end;

Function CreateMDI: integer; StdCall;
Begin
  Forma := TForma.Create(Application);
  result:=integer(Forma);
End;

exports
  InicioMDI,
  FinMDI,
  CreateMDI;
begin
end.
