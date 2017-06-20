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
    QNeg: TQuery;
    Label5: TLabel;
    Shape1: TShape;
    Label19: TLabel;
    NomFec: TComboBox;
    Tipo: TComboBox;
    Label21: TLabel;
    nomina: TComboBox;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Anio: TEdit;
    RNOMINA: TEdit;
    INICIA: TEdit;
    TERMINA: TEdit;
    PagePrin: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DSNeg: TDataSource;
    epn: TLabel;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    QMov: TQuery;
    DSmOV: TDataSource;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    S: TQuery;
    tabPagos: TPageControl;
    BloqNom: TSpeedButton;
    img: TImageList;
    Pempl: TPanel;
    etEmpl: TLabel;
    busEmpl: TSpeedButton;
    BajPanel: TSpeedButton;
    Empl: TEdit;
    PDivide: TPanel;
    Label7: TLabel;
    divNumPago: TLabel;
    Label9: TLabel;
    divNumDetalle: TLabel;
    Label11: TLabel;
    DIVMONTO: TLabel;
    Label13: TLabel;
    divConcepto: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    divtotal: TLabel;
    DividirUnDetalle: TSpeedButton;
    SalirDiv: TSpeedButton;
    monto1: TEdit;
    monto2: TEdit;
    ElimNeg: TSpeedButton;
    PCambia: TPanel;
    Label8: TLabel;
    camNumPago: TLabel;
    Label12: TLabel;
    CamNumDetalle: TLabel;
    Label18: TLabel;
    CamMonto: TLabel;
    Label22: TLabel;
    CamConcepto: TLabel;
    Label24: TLabel;
    SpeedButton1: TSpeedButton;
    CamSalir: TSpeedButton;
    MontoMod: TEdit;
    camTab: TLabel;
    divtab: TLabel;
    pelimina: TPanel;
    Label10: TLabel;
    elinumpago: TLabel;
    Label20: TLabel;
    elinumDetalle: TLabel;
    Label25: TLabel;
    eliMonto: TLabel;
    Label27: TLabel;
    eliConcepto: TLabel;
    EliminarunDetalle: TSpeedButton;
    EliSalir: TSpeedButton;
    eliTab: TLabel;
    res: TSpeedButton;
    sum: TSpeedButton;
    divi: TSpeedButton;
    actualizar: TSpeedButton;
    divConp: TLabel;
    eliConp: TLabel;
    camConp: TLabel;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    TipoPsto: TComboBox;
    Label23: TLabel;
    conpPago: TComboBox;
    VerMovPen: TSpeedButton;
    grPen: TStringGrid;
    MenuPension: TPopupMenu;
    s1: TMenuItem;
    EliminarElementoIndividual1: TMenuItem;
    Eliminartodoslosdetallesmarcados1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    N1: TMenuItem;
    cerrarCuad: TSpeedButton;
    editsql: TCheckBox;
    psql: TPanel;
    MSQL: TMemo;
    CambSQL: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    procedure TipoChange(Sender: TObject);
    procedure BuscaNominas;
    procedure nominaChange(Sender: TObject);
    procedure CalculaNegativos;
    procedure ElimNegClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure busEmplClick(Sender: TObject);
    procedure crearTabSheet (elTab:TpageControl; elID:string; elNum:integer; tipo:String);
    procedure miDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

    procedure miSelectCell(Sender: TObject; ACol, ARow: Integer;
    var CanSelect: Boolean);
    procedure BloqNomClick(Sender: TObject);
    procedure NomFecChange(Sender: TObject);
    procedure tabPagosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tabPagosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  procedure miMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  
procedure miDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
  
procedure miDragDrop(Sender, Source: TObject; X, Y: Integer);

procedure dividirConcepto(Sender: TObject);
procedure modificarConcepto(Sender: TObject);
procedure eliminarConcepto(Sender: TObject);
    procedure BajPanelClick(Sender: TObject);
    procedure monto2KeyPress(Sender: TObject; var Key: Char);
    procedure monto1KeyPress(Sender: TObject; var Key: Char);
    procedure monto1Change(Sender: TObject);
    procedure monto2Change(Sender: TObject);
    procedure DividirUnDetalleClick(Sender: TObject);
    procedure SalirDivClick(Sender: TObject);
    procedure CamSalirClick(Sender: TObject);
    procedure MontoModKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EliminarunDetalleClick(Sender: TObject);
    procedure EliSalirClick(Sender: TObject);
    
    procedure CargarPagosgr(npago:string);
    procedure resClick(Sender: TObject);
    procedure sumClick(Sender: TObject);
    procedure diviClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure actualizarClick(Sender: TObject);
    procedure VerMovPenClick(Sender: TObject);
    procedure TipoPstoChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure grPenDblClick(Sender: TObject);
    procedure grPenSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grPenDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure s1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure EliminarElementoIndividual1Click(Sender: TObject);
    procedure EliminarElementoPension(lineaB:integer);
    procedure Eliminartodoslosdetallesmarcados1Click(Sender: TObject);
    procedure cerrarCuadClick(Sender: TObject);
    procedure editsqlClick(Sender: TObject);
    procedure CambSQLClick(Sender: TObject);


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
TPVPAGOS:string;
TPDPAGOS:STRING;
TPVDPAGOS:STRING;
TPNOMIINBO:STRING;
lacol, lalin:integer;
h: THintWindow;
r: TRect;
linea,columna:integer;

losColores: Array [1..10] OF integer;

implementation



//uses Repo;

{$R *.DFM}



{===============================================================================
 Escribir solamente  numero y punto 456.78
 ===============================================================================}
function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.','-',#13] then numero:=key else numero:=#7;
end;


Procedure GetCursor(Var X,Y:Integer);
var
  P: TPoint;
begin
  GetCursorPos(P);
  X:=P.X;Y:=P.Y;
end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 626;
 Width :=  866 ;

 nomfec.text:='01/'+formatdatetime('MM',NOW);
 fechagen:=NomFec.text+'/'+ANIO.TEXT;
 ANIO.TEXT:= formatdatetime('yyyy',now);

 losColores[1]:=$00B0FDDE;
 losColores[2]:=$00CDFEFB;
 losColores[3]:=$009EF5EF;
 losColores[4]:=$00E9E2AD;
 losColores[5]:=$00FEE7DE;
 losColores[6]:=$00BBFDDA;
 losColores[7]:=$00EEEEEE;

 grPen.cells[0,0]:='El';
 grPen.cells[1,0]:='No. Det';
 grPen.cells[2,0]:='Pago';


 grPen.cells[3,0]:='CONP';
 grPen.cells[4,0]:='Concepto';
 grPen.cells[5,0]:='Monto';
 grPen.cells[6,0]:='Neto';
 grPen.cells[7,0]:='P/D';

 grPen.cells[8,0]:='URES';
 grPen.cells[9,0]:='Tpsto';
 grPen.cells[10,0]:='Sfdo';
  grPen.cells[11,0]:='Empl';


end;

procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFDetalle.Cancelar1Click(Sender: TObject);
begin
 close ;
end;

procedure TFDetalle.BuscaNominas;

begin

   fechagen:=NomFec.text+'/'+ANIO.TEXT;
   if (str_(tipo.text,'-')='O') OR (str_(tipo.text,'-')='C') then
       begin TPVDPAGOS:='PVDPAGOS'; TPDPAGOS:='PDPAGOS'; TPVPAGOS:='PVPAGOS'; TPNOMIINBO:='PNOMIINBO'; END;
   if str_(tipo.text,'-')='H' then
       begin TPVDPAGOS:='PVHDPAGOS'; TPDPAGOS:='PHDPAGOS'; TPVPAGOS:='PVHPAGOS'; TPNOMIINBO:='PHNOMIINBO'; END;
   if str_(tipo.text,'-')='N' then
       begin TPVDPAGOS:='PVNDPAGOS'; TPDPAGOS:='PNDPAGOS'; TPVPAGOS:='PVNPAGOS'; TPNOMIINBO:='PNNOMIINBO'; END;
   if str_(tipo.text,'-')='V' then
       begin TPVDPAGOS:='PVIDPAGOS'; TPDPAGOS:='PIDPAGOS'; TPVPAGOS:='PVPIAGOS'; TPNOMIINBO:='PINOMIINBO'; END;

   q.close;
   q.sql.text:='';
   if (str_(tipo.text,'-')='O') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39+ ' AND NOMI_TIPO<>'+#39+'C'+#39;
   if (str_(tipo.text,'-')='C') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39+ ' AND NOMI_TIPO='+#39+'C'+#39;
   if str_(tipo.text,'-')='H' then
       q.sql.text:='SELECT * FROM PHNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39;
   if str_(tipo.text,'-')='N' then
       q.sql.text:='SELECT * FROM PNNOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39;
   if str_(tipo.text,'-')='V' then
       q.sql.text:='SELECT * FROM PINOMINAS WHERE NOMI_FECINI='+#39+FechaGen+#39;
   if q.sql.text<>'' then
      begin
          q.OPEN;
          nomina.clear;

           while not(q.eof) do
              begin
                 nomina.Items.Add(q.fields[0].asstring);
                 q.next;
              end;
      end;
   nomina.text:=NOMINA.Items[0];
   NOMINAChange(nil);
   
end;

procedure TFDetalle.TipoChange(Sender: TObject);
begin
  inherited;

   try BuscaNominas; except end;
end;


procedure TFDETALLE.CalculaNegativos;
begin
   q.close;
   q.sql.text:='select count(*) '+
   ' from '+TPVPAGOS +' s, PTPSTORUBROS  t where s.VPAG_Nomina='+nomina.text+' and s.VPAG_Neto<0 '+
   ' and (t.tpst_tpsto=s.VPAG_TPsto and t.tpst_templ=s.VPAG_TEmpl and  t.tpst_tnomina='+#39+str_(tipo.text,'-')+#39')';
   q.open;
   epn.Caption:='Pagos en Negativos: '+q.fields[0].asstring;

   qNeg.close;
   qneg.sql.text:='select t.tpst_rubro AS RUBRO, s.VPAG_Empl AS EMPL, vpag_nombre AS NOMBRE,s.VPAG_Pago AS NPAGO,s.VPAG_Neto AS NETO'+
   ' from '+TPVPAGOS +' s, PTPSTORUBROS  t where s.VPAG_Nomina='+nomina.text+' and s.VPAG_Neto<0 '+
   ' and (t.tpst_tpsto=s.VPAG_TPsto and t.tpst_templ=s.VPAG_TEmpl and  t.tpst_tnomina='+#39+str_(tipo.text,'-')+#39')';

   qNeg.open;

   QMov.close;
   Qmov.sql.text:='select * from PCMODDETPAGOS Z WHERE Z.NOMINA='+NOMINA.TEXT+
                  ' AND ACCION<>'+#39+'CANCELACION'+#39+' ORDER BY Z.PAGOBORRADO';
   savetofilelog(qmov.sql.text);
   Qmov.open;

end;
procedure TFDetalle.nominaChange(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='';
   if (str_(tipo.text,'-')='O') OR (str_(tipo.text,'-')='C') then
       q.sql.text:='SELECT * FROM PNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='H' then
       q.sql.text:='SELECT * FROM PHNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='N' then
       q.sql.text:='SELECT * FROM PNNOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;
   if str_(tipo.text,'-')='V' then
       q.sql.text:='SELECT * FROM PINOMINAS WHERE NOMI_NOMINA='+#39+NOmina.text+#39;

  if q.sql.text<>'' then
     begin
        q.open;
        RNOMINA.Text:=q.fieldbyname('NOMI_DESCRIP').asstring;
        inicia.Text:=q.fieldbyname('NOMI_FECINI').asstring;
        termina.Text:=q.fieldbyname('NOMI_FECFIN').asstring;
   end;

   q.close;
   q.sql.text:='SELECT CoUNT(*) FROM '+ TPNOMIINBO+' WHERE NOMI_NOMINA='+NOMINA.TEXT;
   Q.open;
   BloqNom.Enabled:=true;
   if q.fields[0].asinteger>0 then BloqNom.Enabled:=false;

   q.close;
   q.sql.text:='SELECT CoUNT(*) FROM '+ TPNOMIINBO+' WHERE NOMI_NOMINA='+NOMINA.TEXT+
   ' AND NOMI_FINAL='+#39+'S'+#39;
   Q.open;
   if q.fields[0].asinteger>0 then begin cerrarCuad.enabled:=false; PagePrin.Visible:=false ; end
   else begin cerrarCuad.enabled:=true; PagePrin.Visible:=true; calculaNegativos; end;

   MSQL.TEXT:='SELECT S.VDPA_DPAGO, S.VDPA_PAGO, S.VDPA_URES, S.VDPA_TPSTO, '+
  ' S.VDPA_SFDO, S.VDPA_PERDED,  S.VDPA_CONP, S.VDPA_DESCRIP, s.VDPA_MONTO,  '+
  ' (SELECT A.VPAG_NETO FROM '+tPVPAGOS+' A WHERE A.VPAG_Pago=S.VDPA_Pago) AS NETO,  '+
  ' S.VDPA_EMPL ';
  MSQL.Lines.Add(' FROM '+tpvDpagos+' S ');
  MSQL.Lines.Add(' WHERE S.VDPA_NOMINA='+nomina.text);
  MSQL.Lines.Add(' AND  ');

end;

procedure TFDetalle.ElimNegClick(Sender: TObject);
begin
  inherited;
   if Application.MessageBox('¿Seguro que desea cuadrar la Nómina? causará movimientos en los detalles de pago','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
        q.close;
        q.sql.text:='call PCCuadNegativo('+nomina.Text+','+#39+str_(tipo.text,'-')+#39+')';
        q.ExecSQL;
        calculaNegativos;
      end;

end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='call PCRegresaDet('+QMov.Fieldbyname('DETBORRADO').asstring+','+
  #39+STR_(tipo.text,'-')+#39+')';
  Q.execsql;
  calculaNegativos;
  if empl.Text<>'' then begin busEmplClick(nil); pageprin.ActivePageIndex:=0; end;

end;

procedure TFDetalle.SpeedButton3Click(Sender: TObject);
begin
  inherited;

   Q.close;
   Q.sql.text:='select DISTINCT(Z.DETBORRADO) from PCMODDETPAGOS Z WHERE Z.NOMINA='+NOMINA.TEXT+
                  ' AND ACCION<>'+#39+'CANCELACION'+#39+' ORDER BY Z.DETBORRADO';
                  SAVETOFILELOG(Q.sql.text);
   Q.open;
  While not (q.eof) do
     begin
        s.close;
        s.sql.text:='call PCRegresaDet('+q.Fields[0].asstring+','+
        #39+STR_(tipo.text,'-')+#39+')';
        SAVETOFILELOG(s.sql.text);
        s.execsql;
        q.next;
     end;

  calculaNegativos;
  if empl.Text<>'' then begin busEmplClick(nil); pageprin.ActivePageIndex:=0; end;

end;


procedure TFDetalle.miSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
elNom:string;
begin
lacol:=acol;
laLin:=arow;
elNom:=(sender as TstringGrid).name;
elNom:='msg'+copy(elNom,3,length(elNom));
(FindComponent(elNom) as Tlabel).caption:='Detalle Seleccionado: '+inttostr(arow)+':'+(sender as TstringGrid).cells[0,arow];
end;


procedure TFDetalle.miDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin
  if (ARow < (sender as TstringGrid).FixedRows) or (ACol < (sender as TstringGrid).FixedCols) then
    (sender as TstringGrid).Canvas.Brush.Color := clBtnFace
  else
    (sender as TstringGrid).Canvas.Brush.Color := clWhite;

  if (sender as TstringGrid).Cells[4,ARow]='D' then
       begin
          (sender as TstringGrid).Canvas.Font.Style:=[fsBold];
          (sender as TstringGrid).Canvas.Font.Color:=CLred;
       end;

  (sender as TstringGrid).Canvas.FillRect(Rect);
  Texto := (sender as TstringGrid).Cells[acol,ARow];
  DrawText( (sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);

end;


procedure TFDetalle.miMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
elID:String;
begin
elId:=copy((sender as TstringGrid).name,3,length((sender as TstringGrid).name));
if copy(tabPagos.pages[tabPagos.ActivePageIndex].caption,1,2)='Pa' then
    (sender as TStringGrid).BeginDrag(false);
end;

procedure TFDetalle.miDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);

begin
    if h=nil then
       h := THintWindow.Create(nil);
    GetCursor(X,Y);
    r.Left := x; //or the absolute left position of the control
    r.Top := y; //or the absolute top position of the control
    r.Right := r.Left + 200; //the width of the hint window
    r.Bottom := r.Top + 30; //the high of the hint window
    h.ActivateHint(r, 'Det: '+(sender as TstringGrid).cells[0,laLin]+' '+
                       (sender as TstringGrid).cells[6,laLin]+ ' '+
                       (sender as TstringGrid).cells[7,laLin]);
end;


procedure TFDetalle.miDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
try h.free; h:=nil; except; end;
end;

procedure TFDetalle.dividirConcepto(Sender: TObject);
var
elId:String;
begin
elId:=copy((sender as Tspeedbutton).name,3,length((sender as Tspeedbutton).name));
if copy(tabPagos.pages[tabPagos.ActivePageIndex].caption,1,2)='Pa' then
   begin
      divTab.caption:= inttostr(tabPagos.ActivePageIndex);
      pdivide.Visible:=true;
      divnumpago.Caption:=elid;
      divnumdetalle.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[0,laLin];
      divmonto.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[7,laLin];
      divconcepto.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[6,laLin];
      divconp.Caption:=  (findcomponent('gr'+elid) as TStringGrid).cells[5,laLin];
      monto1.SetFocus;
   end;
end;


procedure TFDetalle.modificarConcepto(Sender: TObject);
var
elId:String;
begin
elId:=copy((sender as Tspeedbutton).name,3,length((sender as Tspeedbutton).name));
 if copy(tabPagos.pages[tabPagos.ActivePageIndex].caption,1,2)='Pa' then
   begin
      camTab.caption:= inttostr(tabPagos.ActivePageIndex);
      pcambia.Visible:=true;
      camnumpago.Caption:=elid;
      camnumdetalle.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[0,laLin];
      cammonto.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[7,laLin];
      camconcepto.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[6,laLin];
      camconp.Caption:=  (findcomponent('gr'+elid) as TStringGrid).cells[5,laLin];
      montoMod.Setfocus;
   end;
end;


procedure TFDetalle.eliminarConcepto(Sender: TObject);
var
elId:String;
elTab:integer;
begin
elId:=copy((sender as Tspeedbutton).name,3,length((sender as Tspeedbutton).name));
if copy(tabPagos.pages[tabPagos.ActivePageIndex].caption,1,2)='Pa' then
   begin
    eliTab.caption:= inttostr(tabPagos.ActivePageIndex);
    pelimina.Visible:=true;
    elinumpago.Caption:=elid;
    elinumdetalle.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[0,laLin];
    elimonto.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[7,laLin];
    eliconcepto.Caption:=(findcomponent('gr'+elid) as TStringGrid).cells[6,laLin];
    Eliconp.Caption:=  (findcomponent('gr'+elid) as TStringGrid).cells[5,laLin];
   end;
end;


procedure TFDetalle.crearTabSheet (elTab:TpageControl; elID:string; elNum:integer; tipo:String);
var
  tabTmp : TTabSheet;
  elGrid:TStringGrid;
  elTit:Tlabel;
  elpanel,elpanelBtn:Tpanel;
  btn:TspeedButton;
begin


  tabTmp := TTabSheet.Create(SELF);
  tabTmp.PageControl := elTab;
  tabTmp.Name := 'Pago'+elID;
  if tipo='0' then tabTmp.Caption := 'Pago: '+elID else tabTmp.Caption := 'Dj:  '+elID;
  tabTmp.Visible := true;
  tabTmp.Show;

  //Creamos el Titulo del pago seleccinado
 { elTit:=TLabel.Create(SELF);
  eltit.parent:=tabTmp;
  eltit.Align:=altop;
  eltit.Caption:='Detalles del Pago '+elID;
  eltit.Color:=losColores[elNum];   }


  elGrid:=TstringGrid.Create(SELF);
  elgrid.parent:=tabTmp;
  elgrid.Align:=AlClient;
  elGrid.Ctl3D:=false;
  elGrid.rowcount:=2;
  elgrid.colCOUNT:=9;
  elgrid.FixedCols:=0;
  elgrid.Cells[0,0]:='NUMDET';
  elgrid.ColWidths[0]:=70;

  elgrid.Cells[1,0]:='URES';
  elgrid.ColWidths[1]:=70;

  elgrid.Cells[2,0]:='TPSTO';
  elgrid.ColWidths[2]:=60;

  elgrid.Cells[3,0]:='SFDO';
  elgrid.ColWidths[3]:=60;

  elgrid.Cells[4,0]:='P/D';
  elgrid.ColWidths[4]:=45;

  elgrid.Cells[5,0]:='CONP';
  elgrid.ColWidths[5]:=45;

  elgrid.Cells[6,0]:='CONCEPTO';
  elgrid.ColWidths[6]:=230;

  elgrid.Cells[7,0]:='MONTO';
  elgrid.ColWidths[7]:=80;

  elgrid.Cells[8,0]:='EMPL';
  elgrid.ColWidths[8]:=70;

  S.CLOSE;
  s.SQL.text:='select s.VDPA_DPago, s.VDPA_Ures, s.VDPA_TPSTO, s.VDPA_Sfdo, '+
              's.VDPA_PerDed, s.VDPA_Conp, s.VDPA_Descrip, s.VDPA_Monto, s.vdpa_empl from '+
              Tpvdpagos +' s where s.VDPA_Pago='+ELID+
              ' ORDER BY S.VDPA_PERDED DESC, vdpa_dpago';
  S.open;
  while not (s.eof) do
    begin
       elgrid.Cells[0,elgrid.rowcount-1]:=s.Fields[0].asstring;
       elgrid.Cells[1,elgrid.rowcount-1]:=s.Fields[1].asstring;
       elgrid.Cells[2,elgrid.rowcount-1]:=s.Fields[2].asstring;
       elgrid.Cells[3,elgrid.rowcount-1]:=s.Fields[3].asstring;
       elgrid.Cells[4,elgrid.rowcount-1]:=s.Fields[4].asstring;
       elgrid.Cells[5,elgrid.rowcount-1]:=s.Fields[5].asstring;
       elgrid.Cells[6,elgrid.rowcount-1]:=s.Fields[6].asstring;
       elgrid.Cells[7,elgrid.rowcount-1]:=formatfloat('#,#0.00',s.Fields[7].asfloat);
       elgrid.Cells[8,elgrid.rowcount-1]:=s.Fields[8].asstring;
       elgrid.rowcount:=elgrid.rowcount+1;
       S.next;
    end;
    elgrid.rowcount:=elgrid.rowcount-1;

   elgrid.Name:='gr'+ElID;
   elgrid.OnDrawCell:=miDrawCell;
   elGrid.OnSelectCell:=miSelectCell;
   elGrid.OnMouseDown:=miMouseDown;
   elGrid.OnDragOver:= miDragOver;
   elGrid.OnDragDrop:=  miDragDrop;


   //Creamos panel de Botones
  elPanelBtn:=Tpanel.create(SELF);
  elPanelBtn.parent:=tabTmp;
  elPanelBtn.Align:=alBottom;
  elPanelBtn.Color:=clWhite;
  elPanelBtn.Height:=47;
  elPanelBtn.name:='pb'+ElID;
  elPanelBtn.Caption:='';
  elPanelBtn.Ctl3D:=false;
  elPanelBtn.BevelOuter:=bvNone;


  btn:=TSpeedButton.create(self);
  btn.Parent:=elPanelBtn;
  btn.Width:=150;
  btn.Height:=42;
  btn.Left:=3;
  btn.top:=2;
  btn.Caption:='Dividir Concepto';
  btn.Flat:=true;
  img.GetBitmap(0, btn.glyph);
  btn.OnClick:=dividirConcepto;
  btn.Name:='bd'+elid;

  //Botón Eliminar el Pago
  btn:=TSpeedButton.create(self);
  btn.Parent:=elPanelBtn;
  btn.Width:=150;
  btn.Height:=42;
  btn.Left:=165;
  btn.top:=2;
  btn.Caption:='Eliminar concepto';
  btn.Flat:=true;
  img.GetBitmap(1, btn.glyph);
  btn.OnClick:=eliminarConcepto;
  btn.Name:='be'+elid;

  //Botón Modificar Pago
  btn:=TSpeedButton.create(self);
  btn.Parent:=elPanelBtn;
  btn.Width:=150;
  btn.Height:=42;
  btn.Left:=327;
  btn.top:=2;
  btn.Caption:='Modificar concepto';
  btn.Flat:=true;
  img.GetBitmap(2, btn.glyph);
  btn.OnClick:=modificarConcepto;
  btn.Name:='bm'+elid;


  //Panel de Subtotal
  elPanel:=Tpanel.create(SELF);
  elPanel.parent:=tabTmp;
  elPanel.Align:=alBottom;
  elPanel.Color:=losColores[elNum];
  elPanel.Height:=30;
  elPanel.name:='pan'+ElID;
  elPanel.Caption:='';
  elPanel.Ctl3D:=false;
  elPanel.BevelOuter:=bvNone;

  //Etiqueta de pago seleccionado
  elTit:=TLabel.Create(SELF);
  eltit.parent:=elPanel;
  eltit.Caption:='Pago Seleccionado:';
  elTit.Alignment:=taLeftJustify;
  elTit.Font.Size:=8;
  elTit.Top:=10;
  eltit.Font.Style:=[fsbold];
  elTit.name:='msg'+ElID;


  elTit:=TLabel.Create(SELF);
  eltit.parent:=elPanel;
  eltit.Align:=AlRight;
  eltit.Caption:='Neto: 0.00';
  elTit.Alignment:=taRightJustify;
  elTit.Font.Size:=14;
  eltit.Font.Style:=[fsbold];
  elTit.name:='Suma'+ElID;

  elTit.caption:=formatfloat('#,#0.00',(sumacolGridCond(elGrid,7,'P',4)-sumacolGridCond(elGrid,7,'D',4)));


end;


procedure TFDetalle.busEmplClick(Sender: TObject);
var i:integer;

begin
  inherited;
  q.close;
  q.sql.text:='select distinct(vdpa_pago),0 from '+Tpvdpagos+' s where s.VDPA_Empl='+
  #39+empl.text+#39+' and s.VDPA_Nomina='+nomina.text+
  ' UNION '+
  ' SELECT DISTINCT(VDPA_PAGO),1 FROM '+tPVDPAGOS+' A WHERE A.VDPA_Empl IN '+
             '(select SUBSTR(S.VDPA_Descrip,9,LENGTH(S.VDPA_Descrip)) '+
             ' from '+Tpvdpagos+' s where s.VDPA_Empl='+#39+empl.text+#39+
             ' and s.VDPA_Nomina='+NOMINA.TEXT+' AND S.VDPA_Conp='#39+'061'+#39+')'+
  ' AND A.VDPA_Nomina='+NOMINA.TEXT;
  q.OPEN;

  for i := 0  to  tabPagos.PageCount-1 do
       tabPagos.Pages[0].Destroy;

  i:=1;
  while not(q.eof) do
     begin
          crearTabSheet(tabPagos,q.fields[0].asstring, i, q.fields[1].asstring);
          i:=i+1;
          q.next;
     end;
  q.first;
  if not(q.eof) then
     begin
        etEmpl.Visible:=false;
        busEmpl.Visible:=false;
        empl.Visible:=false;
        pempl.Height:=15;
        tabPagos.Height:=361;
     end;
end;

procedure TFDetalle.BloqNomClick(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='INSERT INTO  '+TPNOMIINBO+'(NOMI_NOMINA) VALUES ('+NOMINA.TEXT+')';
  Q.execsql;
  BloqNom.Enabled:=false;
end;

procedure TFDetalle.NomFecChange(Sender: TObject);
begin
  inherited;
try    BuscaNominas; except end;
end;


procedure TFDetalle.CargarPagosgr(npago:string);
var
elGrid:TstringGrid;
begin
   elGrid:= (findcomponent('gr'+npago) as TStringGrid);
   elgrid.Rowcount:=2;
   limpiagrid(elgrid);
   S.CLOSE;
   s.SQL.text:='select s.VDPA_DPago, s.VDPA_Ures, s.VDPA_TPSTO, s.VDPA_Sfdo, '+
              's.VDPA_PerDed, s.VDPA_Conp, s.VDPA_Descrip, s.VDPA_Monto, s.vdpa_empl from '+
              Tpvdpagos +' s where s.VDPA_Pago='+npago+
              ' ORDER BY S.VDPA_PERDED DESC, vdpa_dpago';
   S.open;
   while not(s.eof) do
      begin
       elgrid.Cells[0,elgrid.rowcount-1]:=s.Fields[0].asstring;
       elgrid.Cells[1,elgrid.rowcount-1]:=s.Fields[1].asstring;
       elgrid.Cells[2,elgrid.rowcount-1]:=s.Fields[2].asstring;
       elgrid.Cells[3,elgrid.rowcount-1]:=s.Fields[3].asstring;
       elgrid.Cells[4,elgrid.rowcount-1]:=s.Fields[4].asstring;
       elgrid.Cells[5,elgrid.rowcount-1]:=s.Fields[5].asstring;
       elgrid.Cells[6,elgrid.rowcount-1]:=s.Fields[6].asstring;
       elgrid.Cells[7,elgrid.rowcount-1]:=formatfloat('#,#0.00',s.Fields[7].asfloat);
       elgrid.Cells[8,elgrid.rowcount-1]:=s.Fields[8].asstring;;
       elgrid.rowcount:=elgrid.rowcount+1;
       S.next;
      end;
   elgrid.rowcount:=elgrid.rowcount-1;
   (findcomponent('suma'+NPAGO) as TLabel).caption:=formatfloat('#,#0.00',(sumacolGridCond(elGrid,7,'P',4)-sumacolGridCond(elGrid,7,'D',4)));

end;


procedure TFDetalle.tabPagosDragDrop(Sender, Source: TObject; X,
  Y: Integer);

var
elTab:Integer;
elID:String;
elIDnUEVO:sTRING;
begin
  inherited;
     try h.free; h:=nil; except; end;
     eltab:=(x div 90);
     if (copy(tabPagos.Pages[eltab].Caption,1,2)='Pa') then
        begin
             if Application.MessageBox(pchar('¿Desea Mover el concepto al Pago'+tabPagos.Pages[eltab].Caption+' ?'),'Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
                begin

                   elId:=copy((source as TStringGrid).name,3,length((source as TStringGrid).name));

                   elidNuevo:=copy(tabPagos.Pages[eltab].Caption,pos(':',tabPagos.Pages[eltab].Caption)+2,length(tabPagos.Pages[eltab].Caption));
                   s.close;
                   s.sql.text:='CALL  PCDIVIDE_PAGOS('+(findcomponent('gr'+elid) as TStringGrid).cells[0,laLin]+','+
                             elIdNuevo+','+floattostr(strtofloattes((findcomponent('gr'+elid) as TStringGrid).cells[7,laLin]))+','+
                             '0'+','+'0'+','+
                             #39+'CREANUEVO'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'INDIVIDUAL'+#39+')';
                   S.ExecSQL;


                    QMov.close;
                    qmov.Open;
                    CargarPagosgr(elId);
                    CargarPagosgr(elIdNuevo);
                    tabPagos.ActivePageIndex:=elTab;
                end;
        END;
end;

procedure TFDetalle.tabPagosDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
elTab:integer;
begin
  inherited;

 if h=nil then
       h := THintWindow.Create(nil);
    GetCursor(X,Y);
    r.Left := x; //or the absolute left position of the control
    r.Top := y; //or the absolute top position of the control
    r.Right := r.Left + 200; //the width of the hint window
    r.Bottom := r.Top + 30; //the high of the hint window
    eltab:=(x div 90);

 try
 if (copy(tabPagos.Pages[eltab].Caption,1,2)='Pa') and (SOURCE IS TStringGrid) then
    begin
       h.ActivateHint(r, 'Copiar al Pago: '+tabPagos.Pages[eltab].Caption );
       accept:=true;
    end;
 except end;

end;

procedure TFDetalle.BajPanelClick(Sender: TObject);
begin
  inherited;
     if pempl.Height=15 then
        begin
              etEmpl.Visible:=true;
              busEmpl.Visible:=true;
              empl.Visible:=true;
              pempl.Height:=46;
              tabPagos.height:=329;

        end
     else
        begin
              etEmpl.Visible:=false;
              busEmpl.Visible:=false;
              empl.Visible:=false;
              pempl.Height:=15;
              tabPagos.height:=361;

        end;
end;


procedure TFDetalle.monto2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=numero(key);
end;

procedure TFDetalle.monto1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=numero(key);
end;

procedure TFDetalle.monto1Change(Sender: TObject);
var
cant:real;
begin
  inherited;
  try cant:=strtofloat(monto1.text) except cant:=0; end;
  monto2.Text:=floattostr(strtofloatTes(divmonto.caption)-cant);
  divtotal.caption:=formatfloat('#,#0.00',(strtofloat(monto1.text)+strtofloat(monto2.text)));

end;

procedure TFDetalle.monto2Change(Sender: TObject);
var
cant:real;
begin
  inherited;
  try cant:=strtofloat(monto2.text) except cant:=0; end;
  monto1.Text:=floattostr(strtofloatTes(divmonto.caption)-cant);
   divtotal.caption:=formatfloat('#,#0.00',(strtofloat(monto1.text)+strtofloat(monto2.text)));
end;

procedure TFDetalle.DividirUnDetalleClick(Sender: TObject);
begin
  inherited;

  if (strtofloat(monto1.text)>=0) and (strtofloat(monto2.text)>=0) and
     (divmonto.caption=divtotal.caption) and (divconp.caption<>'061') then
     begin
        s.close;
        s.sql.text:='CALL  PCDIVIDE_PAGOS('+divNumdetalle.caption+','+
                     divnumpago.Caption+','+monto1.text+','+
                     divnumpago.Caption+','+monto2.text+','+
                     #39+'DIVIDE'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'INDIVIDUAL'+#39+')';
        S.ExecSQL;

        QMov.close;
        qmov.Open;
        SalirDivClick(nil);
        CargarPagosgr(divnumpago.Caption);
        tabPagos.ActivePageIndex:=strtoint(divTab.caption);
     end
  else
     showmessage('Error: Verifique que no este colocando monto Negativo y que ambos sumen el total');
end;

procedure TFDetalle.SalirDivClick(Sender: TObject);
begin
  inherited;
pdivide.Visible:=false;
divmonto.caption:='0';
monto1.Text:='0';
monto2.Text:='0';
end;

procedure TFDetalle.CamSalirClick(Sender: TObject);
begin
  inherited;
pcambia.Visible:=false;
cammonto.caption:='0';
montomod.Text:='0';
end;

procedure TFDetalle.MontoModKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
key:=numero(key);
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
var
pagoDJ:STRING;
detDj:string;
begin
  inherited;
if (strtofloat(montomod.text)>=0)  then
     begin
        s.close;
        s.sql.text:='CALL  PCDIVIDE_PAGOS('+camNumdetalle.caption+','+
                     camnumpago.Caption+','+montomod.text+','+
                     '0'+','+'0'+','+
                     #39+'CREANUEVO'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'INDIVIDUAL'+#39+')';
        S.ExecSQL;

        if camConp.Caption='061' then
           begin
              s.close;
              s.sql.text:='SELECT S.VDPA_PAGO, S.VDPA_DPAGO FROM '+TPVDPAGOS+' S WHERE S.VDPA_Empl='+#39+COPY(camConcepto.caption,9,length(camConcepto.caption))+#39+
              ' and s.VDPA_Nomina='+nomina.text+' AND S.VDPA_Monto='+floattostr(strtofloattes(camMonto.Caption));
              savetofilelog(s.sql.text);
              s.open;
              pagoDJ:= s.fields[0].asstring;
              detDJ:=  s.fields[1].asstring;
              s.close;
              s.sql.text:='CALL  PCDIVIDE_PAGOS('+detDJ+','+
                     pagoDJ+','+montomod.text+','+
                     '0'+','+'0'+','+
                     #39+'CREANUEVO'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'INDIVIDUAL'+#39+')';
              S.ExecSQL;
              CargarPagosgr(pagoDJ);
           end;

        QMov.close;
        qmov.Open;
        CamSalirClick(nil);
        CargarPagosgr(camnumpago.Caption);
        tabPagos.ActivePageIndex:=strtoint(camTab.caption);
     end
  else
     showmessage('Error: Verifique que no este colocando monto Negativo');
end;

procedure TFDetalle.EliminarunDetalleClick(Sender: TObject);
var
pagoDJ:string;
detDj:String;
begin
  inherited;
        s.close;
        s.sql.text:='CALL  PCDIVIDE_PAGOS('+eliNumdetalle.caption+','+
                     '0'+','+'0'+','+
                     '0'+','+'0'+','+
                     #39+'SOLOBORRA'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'INDIVIDUAL'+#39+')';
        S.ExecSQL;

        if eliConp.Caption='061' then
           begin
              s.close;
              s.sql.text:='SELECT S.VDPA_PAGO, S.VDPA_DPAGO FROM '+TPVDPAGOS+' S WHERE S.VDPA_Empl='+#39+COPY(eliConcepto.caption,9,length(eliConcepto.caption))+#39+
              ' and s.VDPA_Nomina='+nomina.text+' AND S.VDPA_Monto='+floattostr(strtofloattes(eliMonto.Caption));
              s.open;
              pagoDJ:= s.fields[0].asstring;
              detDJ:=  s.fields[1].asstring;
              s.close;
              s.sql.text:='CALL  PCDIVIDE_PAGOS('+detDJ+','+
                     '0'+','+'0'+','+
                     '0'+','+'0'+','+
                     #39+'SOLOBORRA'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'INDIVIDUAL'+#39+')';
              S.ExecSQL;
              CargarPagosgr(pagoDJ);
           end;


        QMov.close;
        qmov.Open;
        eliSalirClick(nil);
        CargarPagosgr(elinumpago.Caption);
        tabPagos.ActivePageIndex:=strtoint(eliTab.caption);
end;

procedure TFDetalle.EliSalirClick(Sender: TObject);
begin
  inherited;
pelimina.Visible:=false;
elimonto.caption:='0';
end;

procedure TFDetalle.resClick(Sender: TObject);
begin
  inherited;
 MontoMod.Text:=floattostr(strtofloattes(cammonto.caption)-strtofloat(montoMod.text));
end;

procedure TFDetalle.sumClick(Sender: TObject);
begin
  inherited;
 MontoMod.Text:=floattostr(strtofloattes(cammonto.caption)+strtofloat(montoMod.text));
end;

procedure TFDetalle.diviClick(Sender: TObject);
begin
  inherited;
 MontoMod.Text:=floattostr(strtofloattes(cammonto.caption)/strtofloat(montoMod.text));
end;

procedure TFDetalle.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  empl.Text:=qneg.fieldbyname('EMPL').asstring;
  PagePrin.ActivePageIndex:=1;
  busEmplClick(nil);

end;

procedure TFDetalle.actualizarClick(Sender: TObject);
begin
  inherited;
calculaNegativos;
end;

procedure TFDetalle.VerMovPenClick(Sender: TObject);
begin
  inherited;
IF Editsql.Checked then
   CambSQLClick(nil)
else
   begin
      LimpiaGrid(grPen);
      grPen.RowCount:=2;

      q.close;
      q.sql.text:='select s.VDPA_DPago, s.VDPA_Pago, s.vdpa_ures, s.VDPA_TPSTO, '+
      ' s.VDPA_Sfdo, s.VDPA_PerDed,  s.VDPA_Conp, s.VDPA_Descrip, s.VDPA_Monto,  '+
      ' (SELECT A.VPAG_NETO FROM '+tPVPAGOS+' A WHERE A.VPAG_Pago=S.VDPA_Pago) AS NETO,  '+
      ' s.vdpa_empl '+
      ' from '+tpvDpagos+' s where s.Vdpa_Nomina='+nomina.text+' and s.Vdpa_TPSTO in ('+#39+
      stringReplace(TIPOPsto.text,',',#39+','+#39,[rfReplaceAll])+#39+')'+
      ' and s.VDPA_Conp='+#39+STR_(CONPpAGO.TEXT,'-')+#39;
      q.open;

      while not (q.eof) do
        begin
            grPen.cells[0,grPen.Rowcount-1]:='';
            grPen.cells[1,grPen.Rowcount-1]:=q.fields[0].asstring;
            grPen.cells[2,grPen.Rowcount-1]:=q.fields[1].asstring;
            grPen.cells[3,grPen.Rowcount-1]:=q.fields[6].asstring;
            grPen.cells[4,grPen.Rowcount-1]:=q.fields[7].asstring;
            grPen.cells[5,grPen.Rowcount-1]:=formatfloat('#,#0.00',q.fields[8].asfloat);
            grPen.cells[6,grPen.Rowcount-1]:=formatfloat('#,#0.00',q.fields[9].asfloat);
            grPen.cells[7,grPen.Rowcount-1]:=q.fields[5].asstring;

            grPen.cells[8,grPen.Rowcount-1]:=q.fields[2].asstring;
            grPen.cells[9,grPen.Rowcount-1]:=q.fields[3].asstring;
            grPen.cells[10,grPen.Rowcount-1]:=q.fields[4].asstring;
            grPen.cells[11,grPen.Rowcount-1]:=q.fields[10].asstring;



            grpen.RowCount:=grpen.RowCount+1;
            q.next;
        end;
        IF grPen.RowCount>2 THEN
           grpen.RowCount:=grpen.RowCount-1;
   end;
end;

procedure TFDetalle.TipoPstoChange(Sender: TObject);
begin
  inherited;
q.close;
q.sql.text:='select distinct(s.VDPA_Conp||'+#39+'-'+#39+'||t.conc_descrip) '+
' from '+tpvDpagos+' s, pconcepto t where s.Vdpa_Nomina='+nomina.text+' and s.Vdpa_TPSTO in ('+#39+
stringReplace(TIPOPsto.text,',',#39+','+#39,[rfReplaceAll])+#39+')'+
' and s.VDPA_Conp=t.conc_conp '+
' order by 1';
q.open;
conpPago.clear;
while not(q.eof) do
  begin
     conpPago.Items.Add(q.fields[0].asstring);
     q.next;
  end;
end;

procedure TFDetalle.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qmov);
end;

procedure TFDetalle.grPenDblClick(Sender: TObject);
begin
  inherited;

   if grPen.Cells[0,linea]='X' then
      grPen.Cells[0,linea]:=''
   else
      grPen.Cells[0,linea]:='X';
 grPen.Refresh;
end;

procedure TFDetalle.grPenSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
columna:=acol;
linea:=arow;
end;

procedure TFDetalle.grPenDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < grPen.FixedRows) or (ACol < grPen.FixedCols) then
    grPen.Canvas.Brush.Color := clBtnFace
  else
    grPen.Canvas.Brush.Color := clWhite;

  if grPen.Cells[0,ARow]='' then
           grPen.Canvas.Brush.Color :=CLWhite;

  if grPen.Cells[0,ARow]='X' then
       begin
          grPen.Canvas.Font.Style:=[fsBold];
          grPen.Canvas.Brush.Color :=$00AEF0E0;
       end;

  grPen.Canvas.FillRect(Rect);
  Texto := grPen.Cells[acol,ARow];
  DrawText( grPen.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;

procedure TFDetalle.s1Click(Sender: TObject);
var
x:integer;
begin
  inherited;
for  x:=1 to grPen.RowCount-1 do
  begin
     grpen.Cells[0,x]:='X';
  end;
grpen.Refresh;
end;

procedure TFDetalle.DesmarcarTodos1Click(Sender: TObject);
var
x:integer;
begin
  inherited;
for  x:=1 to grPen.RowCount-1 do
  begin
     grpen.Cells[0,x]:='';
  end;
grpen.Refresh;
end;


procedure TFdetalle.EliminarElementoPension(lineaB:integer);
var
pagoDJ:String;
DetDJ:String;
begin

              s.close;
              s.sql.text:='CALL  PCDIVIDE_PAGOS('+grPen.Cells[1,lineaB]+','+
                           '0'+','+'0'+','+
                           '0'+','+'0'+','+
                           #39+'SOLOBORRA'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'PENSION'+#39+')';
              S.ExecSQL;

              if grPen.Cells[3,lineaB]='061' then
                 begin
                    s.close;
                    s.sql.text:='SELECT S.VDPA_PAGO, S.VDPA_DPAGO FROM '+TPVDPAGOS+' S WHERE S.VDPA_Empl='+#39+COPY(grPen.Cells[4,lineaB],9,length(grPen.Cells[4,lineaB]))+#39+
                    ' and s.VDPA_Nomina='+nomina.text+' AND S.VDPA_Monto='+floattostr(strtofloattes(grPen.Cells[5,lineaB]));
                    s.open;
                    pagoDJ:= s.fields[0].asstring;
                    detDJ:=  s.fields[1].asstring;
                    s.close;
                    s.sql.text:='CALL  PCDIVIDE_PAGOS('+detDJ+','+
                           '0'+','+'0'+','+
                           '0'+','+'0'+','+
                           #39+'SOLOBORRA'+#39+','+#39+STR_(TIPO.TEXT,'-')+#39+','+#39+'PENSION'+#39+')';
                    S.ExecSQL;
                 end;


end;

procedure TFDetalle.EliminarElementoIndividual1Click(Sender: TObject);

begin
  inherited;
if grPen.Cells[0,linea]='X' then
   begin
       if Application.MessageBox(pchar('¿Esta seguro de Eliminar el Detalle: '+grPen.Cells[1,linea]+'?'),'Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
          begin
             EliminarElementoPension(Linea) ;
             QMov.close;
             qmov.Open;
             VerMovPenClick(nil);
         end;

   end
else
  Showmessage('Primero marque el pago haciendo doble click');
end;

procedure TFDetalle.Eliminartodoslosdetallesmarcados1Click(
  Sender: TObject);
var
x:integer;
begin
  inherited;
  if Application.MessageBox(pchar('¿Esta seguro de Eliminar todos los detalles marcados?'),'Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
     begin
         for x:=1 to grPen.rowcount-1 do
            begin
               if grPen.Cells[0,x]='X' then
                     EliminarElementoPension(x);
            end;
         QMov.close;
         qmov.Open;
         VerMovPenClick(nil);
     end;
end;

procedure TFDetalle.cerrarCuadClick(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='UPDATE  '+TPNOMIINBO+' SET NOMI_FINAL='+#39+'S'+#39+' WHERE NOMI_NOMINA='+NOMINA.TEXT;
  Q.execsql;
  PagePrin.Visible:=false;
  cerrarCuad.Enabled:=false;
end;

procedure TFDetalle.editsqlClick(Sender: TObject);
begin
  inherited;
       psql.visible:=editsql.Checked;


end;

procedure TFDetalle.CambSQLClick(Sender: TObject);
begin
  inherited;
LimpiaGrid(grPen);
grPen.RowCount:=2;

q.close;
q.sql.text:=MSQL.Text;
q.open;

while not (q.eof) do
  begin
      grPen.cells[0,grPen.Rowcount-1]:='';
      grPen.cells[1,grPen.Rowcount-1]:=q.fields[0].asstring;
      grPen.cells[2,grPen.Rowcount-1]:=q.fields[1].asstring;
      grPen.cells[3,grPen.Rowcount-1]:=q.fields[6].asstring;
      grPen.cells[4,grPen.Rowcount-1]:=q.fields[7].asstring;
      grPen.cells[5,grPen.Rowcount-1]:=formatfloat('#,#0.00',q.fields[8].asfloat);
      grPen.cells[6,grPen.Rowcount-1]:=formatfloat('#,#0.00',q.fields[9].asfloat);
      grPen.cells[7,grPen.Rowcount-1]:=q.fields[5].asstring;

      grPen.cells[8,grPen.Rowcount-1]:=q.fields[2].asstring;
      grPen.cells[9,grPen.Rowcount-1]:=q.fields[3].asstring;
      grPen.cells[10,grPen.Rowcount-1]:=q.fields[4].asstring;
      grPen.cells[11,grPen.Rowcount-1]:=q.fields[10].asstring;

      grpen.RowCount:=grpen.RowCount+1;
      q.next;
  end;
  IF grPen.RowCount>2 THEN
     grpen.RowCount:=grpen.RowCount-1;
  PSQL.Visible:=FALSE;
end;

End.
