unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria ;

  type
   mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;

  TFDetalle = class(TPFDetalle)
    CLAVE: TDBEdit;
    Label1: TLabel;
    q: TQuery;
    Label7: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    INICIA: TDBComboBox;
    TERMINA: TDBComboBox;
    Label2: TLabel;
    HORAS: TDBEdit;
    MIN: TDBEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    DESCRIP: TDBEdit;
    Label6: TLabel;
    TURNO: TDBEdit;
    LEVHO_TURNO: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    function rnombre : String ; override ;
    procedure CalculaHoras;
    procedure SpeedButton1Click(Sender: TObject);
    procedure TURNOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;

implementation


//uses Repo;

{$R *.DFM}


function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;


 IF RESULT='TURNO' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('TURN_CVETURNO As CLAVE,');
       Vsql.Add('TURN_DESCRIP As Descripcion');
       Vsql.Add('FROM PTURNO');
       SavetofileLog(vsql.text);
     end;




end;


procedure LimpiafileLog(s:string);
begin

end;


 {===============================================================================
 Graba una cadena al archivo LOG que se encuentra en la carpeta File
 ===============================================================================}
procedure savetofileLog(s:string);
begin

end;


 {===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin

end;


 {===============================================================================
 Procedimiento de Movimiento de Columna de un StringGrid
 ===============================================================================}
procedure mygrid.MoveColumn(FromIndex, ToIndex: Integer);
begin
  inherited;
end;


{===============================================================================
 Procedimiento de Movimiento de Linea de un StringGrid
 ===============================================================================}
procedure mygrid.MoveRow(FromIndex, ToIndex: Integer);
begin
  inherited;
end;

Procedure LimpiaGrid(g:TStringGrid);
begin

end;

{===============================================================================
 Procedimiento para Borrar una Linea de un StringGrid
 ===============================================================================}
procedure borra_row(sender:tobject; lin:integer);
begin
end;

{===============================================================================
 Procedimiento Limpia una Linea de un StringGrid
 ===============================================================================}
procedure limpia_linea(sender:tobject;linea:integer);

begin
end;




procedure TFDetalle.FormCreate(Sender: TObject);
begin

 inherited;
 Height := 257;
 Width :=  392 ;

end;

procedure TFDetalle.GrabaInsert ;
begin
 CalculaHoras;
 IF (HORAS.TEXT<>'') AND (MIN.TEXT<>'') THEN
   qInsert.ExecSql ;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
  CalculaHoras;
 IF (HORAS.TEXT<>'') AND (MIN.TEXT<>'') THEN
    qUpdate.ExecSql ;
end ;



procedure TFDetalle.CalculaHoras;
var
hi, mi, hf, mf:integer;
numHor:integer;
NumMin:integer;
begin
   horas.FIELD.AsString:='';min.FIELD.AsString:='';

   try hi:=strtoint(copy(inicia.text,1,pos(':',inicia.text)-1));  except Showmessage ('La hora Inicio:'+inicia.text+' No cumple con el formato HH:MM'); exit; end;
   try mi:=strtoint(copy(inicia.text,pos(':',inicia.text)+1, length(inicia.text)));  except Showmessage ('La hora Inicio:'+inicia.text+' No cumple con el formato HH:MM'); exit; end;
   try hf:=strtoint(copy(termina.text,1,pos(':',termina.text)-1));   except Showmessage ('La hora Termina:'+termina.text+' No cumple con el formato HH:MM'); exit; end;
   try mf:=strtoint(copy(termina.text,pos(':',termina.text)+1, length(termina.text)));   except Showmessage ('La hora Terminaa:'+termina.text+' No cumple con el formato HH:MM'); exit; end;
   if (hf<1) or (hf>23) or (mf<0) or (mf>60) then
       begin Showmessage('La hora Termina:'+inicia.text+' No cumple con el formato HH:MM'); exit; end;
   if (hi<1) or (hi>23) or (mi<0) or (mi>60) then
       begin  Showmessage('La hora Termina:'+termina.text+' No cumple con el formato HH:MM'); exit; end;


   hf:=(hf*60)+mf;
   hi:=(hi*60)+mi;

   if hf>hi then
      numHor:=hf-hi
   else
      numHor:=1440-hi+hf;

   numMin:=(numHor mod 60);
   numHor:=(numHor div 60);
   horas.FIELD.AsString:=inttostr(numHor);
   min.FIELD.AsString:=inttostr(numMin);
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
    CalculaHoras;
end;

procedure TFDetalle.TURNOChange(Sender: TObject);
begin
  inherited;
try
        Q.CLOSE;
        Q.SQL.TEXT:='SELECT TURN_DESCRIP FROM PTURNO A WHERE TURN_CVETURNO='+#39+TURNO.TEXT+#39;
        Q.open;
        LEVHO_TURNO.Text:=Q.FIELDS[0].asstring;
except end;
end;

end.
