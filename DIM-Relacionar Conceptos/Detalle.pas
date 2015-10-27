unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main,
  shellapi, OleServer, Excel97, Comobj, ImgList, Gauges, FileCtrl,ClipBrd;

  type
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    Q: TQuery;
    aux: TQuery;
    QD: TQuery;
    DSQD: TDataSource;
    LisCon: TListBox;
    Label1: TLabel;
    Grupos: TComboBox;
    Label3: TLabel;
    LisGr: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LisConDblClick(Sender: TObject);
    procedure CargaCon;
    procedure cargaGrupo;
    procedure LisGrDblClick(Sender: TObject);
    procedure GruposChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  FMain : TFMain ;
  linea,columna:INTEGER;
  Quenom:string;
  Lapos:integer;
implementation


//uses Repo;

{$R *.DFM}



procedure Tfdetalle.CargaCon;
begin
qD.close;
 qD.sql.text:='SELECT * FROM CQVPCONCEPTO S WHERE S.CONC_CONP IN '+
 '(SELECT DISTINCT(S.VDPA_CONP) FROM CQPVDPAGOS S WHERE '+
 'TO_CHAR(S.VDPA_FECHA,'+#39+'YYYY'+#39+')='+formatdatetime('YYYY',Now)+')'+
 'AND S.conc_perded='+#39+'P'+#39+' AND TO_NUMBER(S.conc_conp)+200 NOT IN '+
 '(SELECT B.DIMR_CONCEPTO FROM PDIMRELGRUPOS B)'+
 ' ORDER BY CONC_DESCRIP';
 qD.OPEN;
 liscon.clear;
 While not(qD.eof) do
   begin
       liscon.items.add(qd.fieldbyname('CONC_CONP').asstring+'-'+qd.fieldbyname('CONC_DESCRIP').asstring);
       qD.next;
   end;
end;


procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 500;
 Width :=  600 ;

 grupos.Clear;
 q.close;
 q.sql.text:='SELECT DIMG_CLAVE FROM PDIMGRUPOS WHERE DIMG_ACTIVO='+#39+'S'+#39+
 ' ORDER BY DIMG_CLAVE';
 Q.open;
 While not(q.eof) do
   begin
       GRUPOS.items.add(q.fieldbyname('DIMG_CLAVE').asstring);
       q.next;
   end;

   cargaCon;

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


procedure TFDetalle.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  Columna:=acol;
  linea:=arow;
end;

procedure TFDetalle.LisConDblClick(Sender: TObject);
begin
  inherited;
  IF GRUPOS.Text<>'' THEN
     begin
        q.close;
        q.sql.text:='INSERT INTO PDIMRELGRUPOS (DIMR_GRUPO,DIMR_CONCEPTO) VALUES ('+
        #39+grupos.text+#39+','+
        #39+inttostr(strtoint(str_(liscon.Items[liscon.itemindex],'-'))+200)+#39+')';
        Q.execsql;

        cargaCon;
        cargaGrupo;
     end
  else
     Showmessage('Seleccione un Grupo');
end;

procedure TFDETALLE.cargaGrupo;
begin
    q.close;
    q.sql.text:='SELECT * FROM CQVPCONCEPTO S, PDIMRELGRUPOS T  WHERE '+
    'TO_NUMBER(S.CONC_CONP)+200=T.DIMR_CONCEPTO AND T.DIMR_GRUPO='+#39+GRUPOS.TEXT+#39+
    ' order by CONC_DESCRIP';
    Q.open;
    lisgr.Clear;
    While not (q.eof) do
      begin
          lisgr.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
          q.next;
      end;
end;

procedure TFDetalle.LisGrDblClick(Sender: TObject);
begin
  inherited;
  q.close;
  q.sql.text:='DELETE FROM PDIMRELGRUPOS WHERE DIMR_CONCEPTO='+inttostr(strtoint(str_(LISGR.Items[lisgr.itemindex],'-'))+200)+
  ' AND DIMR_GRUPO='+#39+GRUPOs.TEXT+#39;
  Q.execsql;
  cargacon;
  cargaGrupo;
end;

procedure TFDetalle.GruposChange(Sender: TObject);
begin
  inherited;
cargaGrupo;
end;

end.
