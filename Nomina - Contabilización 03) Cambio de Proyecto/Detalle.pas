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
    q: TQuery;
    Label7: TLabel;
    PAGO: TDBEdit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    FECHA: TDBEdit;
    Label5: TLabel;
    TNOMINA: TDBEdit;
    Label9: TLabel;
    QDed: TQuery;
    QPer: TQuery;
    DsPer: TDataSource;
    dsded: TDataSource;
    PROYNUEVO: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    DBGrid4: TDBGrid;
    TP: TLabel;
    TD: TLabel;
    Label8: TLabel;
    NETO: TLabel;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    QPol: TQuery;
    DSPol: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    function rnombre : String ; override ;
    procedure SpeedButton2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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
  tppagos:string;
  TPDPAGOS:string ;

implementation


//uses Repo;

{$R *.DFM}


function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;
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
 Height := 562;
 Width :=  924 ;

 if modo<>1 then
     fecha.field.AsString:=datetostr(now);


end;

procedure TFDetalle.GrabaInsert ;
begin

   qInsert.ExecSql ;
   QPER.Close;
   QDED.CLOSE;
   
end ;

procedure TFDetalle.GrabaUpdate ;
begin

    qUpdate.ExecSql ;
end ;



procedure TFDetalle.SpeedButton2Click(Sender: TObject);
var
totneto, totd, totp:real;
begin
  inherited;
Q.CLOSE;
Q.SQL.TEXT:='SELECT * FROM PVPAGOS_TODOS S WHERE S.VPAG_Pago='+pago.text;
q.OPEN;
IF MODO<>1 THEN
   TNOMINA.Field.AsString:=q.fieldbyname('VPAG_TIPO').asstring;

  IF  TNOMINA.Text='O' THEN begin  tppagos:='PPAGOS'; TPDPAGOS:='PDPAGOS'  end;
  IF  TNOMINA.Text='C' THEN begin  tppagos:='PPAGOS'; TPDPAGOS:='PDPAGOS'  end;
  IF  TNOMINA.Text='H' THEN begin  tppagos:='PHPAGOS'; TPDPAGOS:='PHDPAGOS'  end;
  IF  TNOMINA.Text='N' THEN begin  tppagos:='PNPAGOS'; TPDPAGOS:='PNDPAGOS'  end;

  qper.close;
  qper.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO, DPAG_CNTA AS CUENTA, DPAG_SCTA AS SUBCUENTA FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Qper.open;

  qded.close;
  qded.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO, DPAG_CNTA AS CUENTA, DPAG_SCTA AS SUBCUENTA FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Qded.open;

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Q.open;
  totp:=q.fields[0].asfloat;
  tp.caption:=formatfloat('#,#0.00',totp);

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Q.open;
  totd:=q.fields[0].asfloat;
  td.caption:=formatfloat('#,#0.00',totd);

  totneto:=totp-totd;
  neto.caption:=formatfloat('#,#0.00',totneto);


end;

procedure TFDetalle.PageControl1Change(Sender: TObject);
begin
  inherited;
  IF pagecontrol1.ActivePage.TabIndex=1 then
     begin
        qpol.close;
        qpol.sql.text:='SELECT y.detm_polid as POLIZA, Y.DETM_RNGID AS IDPOL, Y.DETM_SFDO AS SFDO, '+
        'Y.DETM_URES AS URES, Y.DETM_PROG AS PROG, Y.DETM_PROY AS PROYECTO, Y.DETM_CNTA AS CNTA, '+
        'Y.DETM_SCTA AS SCTA, Y.DETM_TMOV AS TMOV, Y.DETM_MONTO AS MONTO, Y.DETM_DESCRIP AS DESCRIP '+
        ' FROM FDETMOVI Y WHERE Y.DETM_POLID in (SELECT r.poli_polid FROM FPOLIZAS R WHERE '+
                                                'R.POLI_DESCRIP LIKE '+#39+'%CanPagMovInc_'+PAGO.TEXT+'%'+#39+')'+
        ' order by y.detm_rngid';
        QPOL.OPEN;
     end;
end;

procedure TFDetalle.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QPOL);
end;

end.
