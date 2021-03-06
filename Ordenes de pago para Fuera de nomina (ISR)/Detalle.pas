unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList;

  type
  
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    Q: TQuery;
    s: TQuery;
    SpeedButton1: TSpeedButton;
    CONCEPTO: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Inicio: TDateTimePicker;
    Fin: TDateTimePicker;
    Label4: TLabel;
    grid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    Procedure exportarSIT;
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  FMain : TFMain ;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;
  vures:string;
   VURES_DESC:STRING;
fechaGen:string;

implementation


//uses Repo;

{$R *.DFM}


{===============================================================================
 Se envia una cadena como 123 y el n�mero de ceros que colocara antes (4) 0000123
 ===============================================================================}
function colocaCeros(n:string;nc:integer):string;
var
x:integer;
begin
   for x:=1 to nc-length(n) do n:='0'+n;
colocaCeros:=n;
end;


{===============================================================================
 Se envia una cadena JOSE y el n�mero de espacios se dejen a lo ultimo
 ===============================================================================}
function colocaEspacios(n:string;nesp:integer):string;
var
x:integer;
begin
   for x:=1 to nesp-length(n) do n:=n+' ';
colocaespacios:=n;
end;


function colocaEspaciosAntes(n:string;nesp:integer):string;
var
x:integer;
begin
   for x:=1 to nesp-length(n) do n:=' '+n;
colocaespaciosAntes:=n;
end;

function soloEspacios(nesp:integer):string;
var
x:integer;
n:string;
begin
   n:='';
   for x:=1 to nesp do n:=n+' ';
soloEspacios:=n;
end;


{===============================================================================
Busca la descripcion de una clave en un Grid y se la coloca despues de "-"
 ===============================================================================}
Procedure LimpiaGrid(g:TStringGrid);
var
x,y:integer;
begin
 for x:=1 to g.RowCount-1 do
   for y:=0 to g.ColCount-1 do
       g.cells[y,x]:='';

end;



{===============================================================================
Convierte una cadena a flotante, pero antes remplaza las 2,345.56 = 2345.56
 ===============================================================================}
function strtofloatTes(c:string):real;
begin
  c:=StringReplace(c,',','',[rfReplaceAll]);
  strtofloatTes:=strtofloat(c);
end;


{===============================================================================
Suma la columna dada de un TstringGrid
 ===============================================================================}
Function SumaColGrid(g:TstringGrid;Col:Integer):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
         try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
         sum:=sum+val;
      end;
SumaColGrid:=sum;

end;


procedure CrearFile(fi:string);
var
  Excel: OleVariant;
  Libro: OleVariant;
  Hoja: OleVariant;

begin
 if not(fileexists(fi)) then
    begin
        Excel := ComObj.CreateOleObject('Excel.Application');
        Libro := Excel.WorkBooks.Add;
        Hoja := Libro.ActiveSheet;
        Hoja.Cells[1, 1] := '';

        Libro.SaveAs(fi);
        Excel.Quit;
    end;
end;







procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 472;
 Width :=  806 ;

 inicio.date:=strtodate('01/'+formatdatetime('mm',now)+'/'+formatdatetime('yyyy',now));
 fin.date:=strtodate('30/'+formatdatetime('mm',now)+'/'+formatdatetime('yyyy',now));

 q.close;
 q.sql.text:='SELECT conc_conp, conc_descrip from pconcepto where conc_perded='+#39+'D'+#39;
 q.OPEN;
 concepto.Clear;
 while not(q.eof) do
    begin
       concepto.Items.Add(Q.fields[0].asstring+'-'+Q.fields[1].asstring);
       q.next;
    end;
 CONCEPTO.TEXT:='058-I.S.R.';

 grid.cells[0,0]:='No.FN';
 grid.cells[1,0]:='Sfdo';
 grid.cells[2,0]:='Puesto';
 grid.cells[3,0]:='Fecha';
 grid.cells[4,0]:='Persona';
 grid.cells[5,0]:='Nombre';
 grid.cells[6,0]:='Ord.Pag.';
 grid.cells[7,0]:='Monto';
 grid.cells[8,0]:='Total OP';
 grid.cells[9,0]:='Cancelado';


end;

procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFDetalle.Cancelar1Click(Sender: TObject);
begin
 close ;
end;

function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;

end;


Procedure TFDetalle.exportarSIT;

begin

end;



{===============================================================================
 Exporta un archivo excel a un grid
 ===============================================================================}

function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string; numH:integer): Boolean;

begin

end;


procedure TFDetalle.gridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin


end;


procedure TFDetalle.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
ling:=arow;
colg:=acol;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='SELECT S.VMOV_SEQ AS PAGO_FN, S.VMOV_SFONDO, S.VMOV_TIPOPSTO, S.VMOV_FECHAMOV AS FECHA,S.VMOV_PERS AS PERSONA, '+
              ' S.VMOV_NOMBRE AS NOMBRE, getOrdPagoFNparaP(T.DPAG_SCTA,S.VMOV_SEQ ) AS '+
              ' ORDEN_PAGO, T.DPAG_MONTO AS MONTO, U.DOCX_TOTAL AS TOTAL_OP, S.VMOV_CANCEL '+
              ' AS CANCELADO FROM PVMOVFUENOM S, PMOVFNPDPAGOSR T, AFDOCXPAG U  '+
              ' WHERE S.VMOV_FECHAMOV>='+#39+formatdatetime('dd/mm/yyyy',inicio.date)+#39+
              ' and s.vmov_fechamov<='+#39+formatdatetime('dd/mm/yyyy',fin.date)+#39+
              ' AND S.VMOV_SEQ=T.DPAG_MOVI AND T.DPAG_CONP='+#39+STR_(CONCEPTO.TEXT,'-')+#39+
              ' AND getOrdPagoFNparaP(T.DPAG_SCTA,S.VMOV_SEQ )=U.DOCX_POLID '+
              ' AND S.VMOV_CONTABILIZADO='+#39+'S'+#39+
              ' UNION '+
              ' SELECT D.NOMI_NOMINA, C.POLN_SFDO, C.POLN_RUBRO, D.NOMI_FECINI, A.DOCX_PERSONA,'+
              #39+'ISR DE NOMINA ORD-COMP'+#39+', TO_CHAR(A.DOCX_POLID), A.DOCX_TOTAL, A.DOCX_TOTAL,'+#39+'N'+#39+
              ' FROM PNOMINAS D, PPOLNOMI C, AFDOCXPAG A WHERE D.NOMI_NOMINA=C.POLN_NOMINA AND '+
              ' D.NOMI_FECINI>='+#39+formatdatetime('dd/mm/yyyy',inicio.date)+#39+
              ' AND D.NOMI_FECFIN<='+#39+formatdatetime('dd/mm/yyyy',fin.date)+#39+
              ' AND A.DOCX_PERSONA='+#39+'P16001'+#39+' AND A.DOCX_POLID=C.POLN_POLID '+
              ' UNION '+
              ' SELECT D.NOMI_NOMINA, C.POLN_SFDO, C.POLN_RUBRO, D.NOMI_FECINI, A.DOCX_PERSONA,'+
              #39+'ISR DE NOMINA NG'+#39+', TO_CHAR(A.DOCX_POLID), A.DOCX_TOTAL, A.DOCX_TOTAL,'+#39+'N'+#39+
              ' FROM PnNOMINAS D, PnPOLNOMI C, AFDOCXPAG A WHERE D.NOMI_NOMINA=C.POLN_NOMINA AND '+
              ' D.NOMI_FECINI>='+#39+formatdatetime('dd/mm/yyyy',inicio.date)+#39+
              ' AND D.NOMI_FECFIN<='+#39+formatdatetime('dd/mm/yyyy',fin.date)+#39+
              ' AND A.DOCX_PERSONA='+#39+'P16001'+#39+' AND A.DOCX_POLID=C.POLN_POLID '+
              ' UNION '+
              ' SELECT D.NOMI_NOMINA, C.POLN_SFDO, C.POLN_RUBRO, D.NOMI_FECINI, A.DOCX_PERSONA,'+
              #39+'ISR DE NOMINA HAS'+#39+', TO_CHAR(A.DOCX_POLID), A.DOCX_TOTAL, A.DOCX_TOTAL,'+#39+'N'+#39+
              ' FROM PhNOMINAS D, PhPOLNOMI C, AFDOCXPAG A WHERE D.NOMI_NOMINA=C.POLN_NOMINA AND '+
              ' D.NOMI_FECINI>='+#39+formatdatetime('dd/mm/yyyy',inicio.date)+#39+
              ' AND D.NOMI_FECFIN<='+#39+formatdatetime('dd/mm/yyyy',fin.date)+#39+
              ' AND A.DOCX_PERSONA='+#39+'P16199'+#39+' AND A.DOCX_POLID=C.POLN_POLID '+
              ' UNION '+
              ' SELECT D.NOMI_NOMINA, C.POLN_SFDO, C.POLN_RUBRO, D.NOMI_FECINI, A.DOCX_PERSONA,'+
              #39+'ISR DE NOMINA VIN'+#39+', TO_CHAR(A.DOCX_POLID), A.DOCX_TOTAL, A.DOCX_TOTAL,'+#39+'N'+#39+
              ' FROM PINOMINAS D, PIPOLNOMI C, AFDOCXPAG A WHERE D.NOMI_NOMINA=C.POLN_NOMINA AND '+
              ' D.NOMI_FECINI>='+#39+formatdatetime('dd/mm/yyyy',inicio.date)+#39+
              ' AND D.NOMI_FECFIN<='+#39+formatdatetime('dd/mm/yyyy',fin.date)+#39+
              ' AND A.DOCX_PERSONA='+#39+'P16199'+#39+' AND A.DOCX_POLID=C.POLN_POLID '+
              ' order by 5,6';

  savetofilelog(q.sql.text);
  q.open;

  limpiagrid(grid);
  grid.RowCount:=2;

  WHILE NOT(Q.EOF) DO
   begin
        grid.cells[0,grid.rowcount-1]:=q.fields[0].asstring;
        grid.cells[1,grid.rowcount-1]:=q.fields[1].asstring;
        grid.cells[2,grid.rowcount-1]:=q.fields[2].asstring;
        grid.cells[3,grid.rowcount-1]:=q.fields[3].asstring;
        grid.cells[4,grid.rowcount-1]:=q.fields[4].asstring;
        grid.cells[5,grid.rowcount-1]:=q.fields[5].asstring;
        grid.cells[6,grid.rowcount-1]:=q.fields[6].asstring;
        grid.cells[7,grid.rowcount-1]:=q.fields[7].asstring;
        grid.cells[8,grid.rowcount-1]:=q.fields[8].asstring;
        grid.cells[9,grid.rowcount-1]:=q.fields[9].asstring;
        grid.rowcount:=grid.rowcount+1;
        Q.NEXT;
   end;
end;

procedure TFDetalle.gridDblClick(Sender: TObject);
begin
  inherited;
 exportarGrXLS(grid);
end;

End.
