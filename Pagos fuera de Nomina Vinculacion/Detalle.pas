unit Detalle;

//ultima 25/nov/02

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, ExtDlgs, StdCtrls, Buttons, DBCtrls, Mask, DBCGrids,
  ekbasereport, ekrtf, shellapi;

type
 mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;

  TFDetalle = class(TPFDetalle)
    PageControl1: TPageControl;
    TabGral: TTabSheet;
    Label5: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    DESCRIP: TDBEdit;
    Seq: TDBEdit;
    FEC: TDBEdit;
    NOMBFN: TDBEdit;
    LCATEG: TEdit;
    CATEG: TDBEdit;
    LVMOV_NOMBS: TEdit;
    PSTO: TDBEdit;
    Label30: TLabel;
    QpRIN: TQuery;
    LPSTO: TEdit;
    Label2: TLabel;
    HORAS: TDBEdit;
    Q: TQuery;
    Label1: TLabel;
    NOMI: TDBEdit;
    LNOMI: TEdit;
    Label4: TLabel;
    PERS: TDBEdit;
    LVMOV_PERS: TEdit;
    VISTA: TDBEdit;
    TIPOPSTO: TDBEdit;
    agPres: TSpeedButton;
    TIPO: TDBEdit;
    tipomov: TRadioGroup;
    JUBILADO: TEdit;
    TIPOPLAZA: TDBEdit;
    SpeedButton1: TSpeedButton;
    Limpiar: TSpeedButton;
    aux: TQuery;
    Label7: TLabel;
    SFONDO: TDBEdit;
    LVMOV_SFONDO: TEdit;
    TIPONOM: TDBEdit;
    Label8: TLabel;
    fecini: TDBEdit;
    Label10: TLabel;
    fecfin: TDBEdit;
    ini: TEdit;
    fin: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GRID: TStringGrid;
    griddet: TStringGrid;
    TabSheet3: TTabSheet;
    GRIDTER: TStringGrid;
    Label6: TLabel;
    PROGFN: TDBEdit;
    LVMOV_PROGFN: TEdit;
    Label14: TLabel;
    URESFN: TDBEdit;
    LVMOV_URESFN: TEdit;
    EkRTF1: TEkRTF;
    TEXTO: TDBMemo;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    SOLICITO: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    TPER: TLabel;
    TDED: TLabel;
    trans: TDBCheckBox;
    Label21: TLabel;
    PROYFN: TDBEdit;
    LVMOV_PROYFN: TEdit;
    URESPAGFN: TDBEdit;
    LVMOV_URESPAGFN: TEdit;
    Label25: TLabel;
    Label23: TLabel;
    TIPOREP: TDBEdit;
    LVMOV_TIPOREP: TEdit;
    Label24: TLabel;
    DESCCORTA: TDBEdit;
    Label22: TLabel;
    procedure FormCreate(Sender: TObject);
    function rnombre : String ; override ;
    procedure getDescripGrid;
    procedure getDescripGridTer;
    procedure PSTOExit(Sender: TObject);
    procedure PSTOChange(Sender: TObject);
    procedure CATEGChange(Sender: TObject);
    procedure GridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure agPresClick(Sender: TObject);
    procedure GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    procedure Acepta_Seleccion ;  OVERRIDE;
    procedure GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GRIDKeyPress(Sender: TObject; var Key: Char);
    procedure grabaDetalle;
    procedure cargaDetalle;
    procedure GrabaUpdate ; override;
     procedure GrabaInsert ; override;
    procedure Inivar ; override;
    procedure SpeedButton1Click(Sender: TObject);
    procedure LimpiarClick(Sender: TObject);
    procedure GRIDTERSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GRIDTERKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NOMBFNChange(Sender: TObject);
    procedure PERSChange(Sender: TObject);
    procedure GRIDSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure GRIDTERKeyPress(Sender: TObject; var Key: Char);
    procedure GRIDTERDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  FDetalle: TFDetalle;
 colG, LinG:integer;
  colGT, LinGT:integer;
 tabu:boolean;
 tabut:boolean;
implementation
{$R *.DFM}

var

 Puesto : string[30];



procedure LimpiafileLog(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;


 {===============================================================================
 Graba una cadena al archivo LOG que se encuentra en la carpeta File
 ===============================================================================}
procedure savetofileLog(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
if not(fileexists(extractfiledir(paramstr(0))+'\log.txt')) then
    l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.LoadFromFile(extractfiledir(paramstr(0))+'\log.txt');
l.Add(DATETOSTR(DATE)+' '+TIMETOSTR(NOW)+ '--> '+s);
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;


 {===============================================================================
 Escribir solamente  numero y punto 456.78
 ===============================================================================}
function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.','-',#13] then numero:=key else numero:=#7;
end;

 {===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin
   if pos(separador,cad)>0 then
      str_:=copy(cad,1,pos(separador,cad)-1)
   else
      str_:=cad;
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
var
x,y:integer;
begin
 for x:=1 to g.RowCount-1 do
   for y:=0 to g.ColCount-1 do
       g.cells[y,x]:='';

end;

{===============================================================================
 Procedimiento para Borrar una Linea de un StringGrid
 ===============================================================================}
procedure borra_row(sender:tobject; lin:integer);
begin
   with mygrid(sender) do
   begin
      rowmoved(lin,rowcount-1);
      rows[rowcount-1].clear;
      rowcount:=rowcount-1;
   end;
end;

{===============================================================================
 Procedimiento Limpia una Linea de un StringGrid
 ===============================================================================}
procedure limpia_linea(sender:tobject;linea:integer);
var
x:integer;
begin
   with mygrid(sender) do
     begin
        for x:=0 to colcount-1 do
            cells[x,linea]:='';
     end;
end;


procedure TFDetalle.FormCreate(Sender: TObject);
begin
 inherited ;
 Width := 863 ;
 Height := 628 ;
 Ling:=Grid.RowCount-1;
 COLG:=0;
 TABU:=FALSE;
 if modo=1 then
    begin grid.Options:=[]; end;

 IF MODO=3 then
    BEGIN
      TRANS.Checked:=FALSE;
      fec.FIELD.asstring:=formatdatetime('dd/mm/yyyy',date);
    end;
 grid.cells[0,0]:='Concepto de Pago';
 grid.cells[1,0]:='Monto de Pago/Deducción';
 grid.cells[2,0]:='C.O.G.';
 grid.cells[3,0]:='P/D';
 grid.cells[4,0]:='Movim';
  grid.cells[5,0]:='Días';
  grid.cells[6,0]:='Gasto';
  grid.cells[7,0]:='Contable';

 griddet.cells[0,0]:='Concepto de Pago';
 griddet.cells[1,0]:='Monto de Pago/Deducción';
 griddet.cells[2,0]:='P/D';
 griddet.cells[3,0]:='Movim';
 griddet.cells[4,0]:='Inicia';
 griddet.cells[5,0]:='Termina';
  griddet.cells[6,0]:='Días';

 gridTer.cells[1,0]:='Concepto de Pago';
 gridTer.cells[2,0]:='Monto de Pago/Deducción';
 gridTer.cells[3,0]:='C.O.G.';
 gridTer.cells[4,0]:='P/D';
 gridTer.cells[5,0]:='Movim';
  gridTer.cells[6,0]:='Días';
  gridTer.cells[7,0]:='Gasto';
  gridTer.cells[8,0]:='Contable';
 gridTer.cells[0,0]:='Tercero';

LingT:=1;
colgT:=0;

Ling:=1;
colg:=0;
end;


procedure TFDetalle.Acepta_Seleccion ;
var campo : TField ;
begin

 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRID')
 then TStringGrid(VControl).cells[Colg,Ling]:=QVal.Fields[0].Value  ;

  if (VControl is TStringGrid)  and (vcontrol.Name='GRIDTER')
 then TStringGrid(VControl).cells[Colgt,Lingt]:=QVal.Fields[0].Value  ;


 if campo <> nil then
 begin
  campo.DataSet.Edit ;
  campo.Value := QVal.Fields[0].Value ;
 end ;
 QVal.Close ;
 GValValid.Hide ;
 PCaptura.Show ;
 VControl.SetFocus ;


end ;


function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;


 IF RESULT='PROYFN' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('APER_PROY As Proy,');
       Vsql.Add('Aper_Descrip As Descripcion');
       Vsql.Add('FROM daperprog09');
       Vsql.Add('Where aper_fondo= '+#39+sfondo.text+#39);
       Vsql.Add('and aper_status= '+#39+'10'+#39);
       Vsql.Add('and aper_anio= '+#39+formatdatetime('YYYY',strtodate(fec.text))+#39);
       Vsql.Add('and aper_URES= '+#39+URESFN.text+#39);
       Vsql.Add('and aper_prog_siia='+#39+progFN.text+#39);
       SavetofileLog(vsql.text);
     end;

 if result = 'SFONDO' then
  begin
     Vsql.Add('Select');
     Vsql.Add('SFon_SFdo As SFondo,');
     Vsql.Add('SFon_Descrip As Descripcion,');
     Vsql.Add('SFon_Fondo As Fondo');
     Vsql.Add('From FSFondos');
     Vsql.Add('Where SFon_Ent_Data= '+#39+'S'+#39);
     Vsql.Add('AND SFON_SFDO IN (SELECT SFONDO FROM PMOVRELSFDO WHERE TIPONOM='+#39+TIPONOM.TEXT+#39+')');
  end;

   if result = 'TIPOREP' then
  begin
     Vsql.Add('Select');
     Vsql.Add('MOVF_CLAVE As Reporte,');
     Vsql.Add('MOVF_DESCRIP As Descripcion ');
     Vsql.Add('From PMOVFNREPORTES');
  end;


 if result = 'NOMBFN' then
  begin
     vSQL.CLEAR;
     Vsql.Add('Select');
     Vsql.Add('Vnom_nomb as Nomb,');
     Vsql.Add('vnom_nombre As Nombre,');
     Vsql.Add('vnom_ini As Inicia,');
     Vsql.Add('vnom_fin As Termina,');
     Vsql.Add('vnom_EMPLI As Cve_Empl,');
     Vsql.Add('vnom_pstoI As Puesto');
     Vsql.Add('from pvnombramallI');
     Vsql.Add('where vnom_EMPLI='+#39+pers.Text+#39);
     Vsql.Add('order by VNOM_ini desc');
  end;

if result= 'PSTO' then
 begin
  VSql.add('Select');
  VSql.add('Pues_Psto as Puesto,');
  VSql.add('Pues_Descrip as Descripcion');
  VSql.add('from pipuestos');
  end;

if result= 'CATEG' then
 begin
  VSql.add('Select');
  VSql.add('Cpue_Categ as Categoria,');
  VSql.add('Cpue_Descrip as Descripcion,');
  VSql.add('Cpue_Psto as Puesto');
  VSql.add('from picpuestos');
  VSql.add('where Cpue_Psto = ''' + Puesto + '''');
  end;

if result= 'PERS' then
 begin
  VSql.add('SELECT');
  VSql.add('PERS_PERSONA AS PERSONA,');
  VSql.add('PERS_NOMBRE||'+#39+' '+#39+'||PERS_APEPAT||'+#39+' '+#39+'||PERS_APEMAT AS NOMBRE');
  VSql.add('FROM FINANZAS.FPERSONAS, PEMPLVINC  ');
 VSql.add('WHERE PERS_PERSONA=EMPL_PERSONA ');
 end;


if (result= 'GRID') and (colg=0) and (linG<>grid.rowcount-1)  then
 begin
  VSql.add('SELECT');
  VSql.add('CONC_CONP AS CONCEPTO,');
  VSql.add('CONC_DESCRIP AS DESCRIPCION,');
  VSql.add('CONC_PERDED AS TIPO,');
  VSql.add('CONC_SCTA AS SCTA');
  VSql.add('FROM PCONCEPTO');
  {if tipomov.ItemIndex=1 then
     begin
        VSql.add('WHERE CONC_CONP>=500');
     end;     }
 end;

 if (result= 'GRIDTER') and (colgT=1) and (linGt<>gridTer.rowcount-1)  then
 begin
  VSql.add('SELECT');
  VSql.add('CONC_CONP AS CONCEPTO,');
  VSql.add('CONC_DESCRIP AS DESCRIPCION,');
  VSql.add('CONC_PERDED AS TIPO,');
  VSql.add('CONC_SCTA AS SCTA');
  VSql.add('FROM PCONCEPTO');
 end;

if (result= 'GRID') and (colg=2) and (linG<>grid.rowcount-1)  then
 begin
     VSql.add('SELECT');
     VSql.add('COG AS COG,');
     VSql.add('DESCRIPCION AS DESCRIPCION');
     VSql.add('FROM PMATREL');
     VSql.add('WHERE CVE_CONCEPTO='+#39+str_(GRID.cells[0,ling],'-')+#39);
     VSql.add('AND (TIPO_PLAZA IS NULL OR TIPO_PLAZA='+#39+TIPOPLAZA.TEXT+#39+') ');
     VSql.add('AND (TIPO_PSTO IS NULL OR TIPO_PSTO='+#39+'T'+#39+' OR TIPO_PSTO='+#39+'P'+#39+')');
     VSql.add('ORDER BY TIPO_PSTO');
     savetofileLOG(vsql.text);
end;


 if (result= 'GRIDTER') and (colgt=0) and (linGt<>gridter.rowcount-1)  then
 begin
   VSql.add('SELECT');
   VSql.add('PERS_PERSONA AS PERSONA,');
   VSql.add('PERS_NOMBRE||'+#39+' '+#39+'||PERS_APEPAT||'+#39+' '+#39+'||PERS_APEMAT AS NOMBRE');
   VSql.add('FROM FINANZAS.FPERSONAS ');
end;


if result = 'URESFN' then
  begin
     Vsql.Add('Select');
     Vsql.Add('URES_URES As URES,');
     Vsql.Add('URES_Descrip As Descripcion');
     Vsql.Add('From FURES');
     Vsql.Add('Where URES_Ent_Data= '+#39+'S'+#39);
     Vsql.Add('AND URES_ENT_POA='+#39+'S'+#39);
  end;

  if result = 'URESPAGFN' then
  begin
     Vsql.Add('Select');
     Vsql.Add('URES_URES As URES,');
     Vsql.Add('URES_Descrip As Descripcion');
     Vsql.Add('From FURES');
     Vsql.Add('Where URES_Ent_Data= '+#39+'S'+#39);
     Vsql.Add('AND URES_ENT_POA='+#39+'S'+#39);
  end;


if result = 'PROGFN' then
  begin
     Vsql.Add('Select');
     Vsql.Add('PROG_PROG As Programa,');
     Vsql.Add('PROG_Descrip As Descripcion');
     Vsql.Add('From FPROGRAM');
     Vsql.Add('Where PROG_Ent_Data= '+#39+'S'+#39);
     Vsql.Add('AND PROG_ENT_POA='+#39+'S'+#39);
  end;



end;




procedure TFDetalle.PSTOExit(Sender: TObject);
begin
  inherited;


if psto.text <> '' then
  Puesto:= trim(Psto.text);


end;


procedure TFDetalle.PSTOChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT PUES_DESCRIP FROM PIPUESTOS WHERE PUES_PSTO='+#39+PSTO.TEXT+#39;
  Q.open;
  lpsto.Text:=q.fields[0].asstring;
end;

procedure TFDetalle.CATEGChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT CPUE_DESCRIP FROM PICPUESTOS WHERE CPUE_PSTO='+#39+PSTO.TEXT+#39+
  ' AND CPUE_CATEG='+#39+CATEG.TEXT+#39;
  Q.open;
  lCATEG.Text:=q.fields[0].asstring;
end;

procedure TFDETALLE.getDescripGrid;
var
NewCol:integer;
tipo:string;
begin
  IF TABU THEN newCol:=colg-1 else newcol:=colg;
  if NewCol=0 then
      begin

         Q.close;
         q.sql.text:='SELECT * FROM PCONCEPTO WHERE CONC_CONP='+#39+str_(GRID.cells[NEWCOL,ling],'-')+#39;
         Q.OPEN;
         tipo:=q.fieldbyname('CONC_PERDED').asstring;
         GRID.cells[NEWCOL,ling]:=str_(GRID.cells[newcol,ling],'-')+'-'+Q.fieldbyname('CONC_DESCRIP').asstring;
         savetofilelog(q.sql.text);
         q.close;

         IF TIPOMOV.ITEMINDEX=0 THEN  //Para los empleados
            begin 
            if  TIPO='P' then
                begin
                     IF jubilado.text='N' then
                     q.sql.text:='SELECT * FROM PMATREL WHERE CVE_CONCEPTO='+#39+str_(GRID.cells[newcol,ling],'-')+#39+
                     ' AND (TIPO_PLAZA IS NULL OR TIPO_PLAZA='+#39+TIPOPLAZA.TEXT+#39+') '+
                     ' AND (TIPO_PSTO IS NULL OR TIPO_PSTO='+#39+'T'+#39+')'
                     else
                     q.sql.text:='SELECT * FROM PMATREL WHERE CVE_CONCEPTO='+#39+str_(GRID.cells[newcol,ling],'-')+#39+
                     ' AND (TIPO_PLAZA IS NULL OR TIPO_PLAZA='+#39+TIPOPLAZA.TEXT+#39+') '+
                     ' AND (TIPO_PSTO IS NULL OR TIPO_PSTO='+#39+'T'+#39+' OR TIPO_PSTO='+#39+'P'+#39+')'+
                     ' ORDER BY TIPO_PSTO';

                     savetofilelOG(q.sql.text);
                     Q.open;
                     GRID.cells[2,ling]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
                     GRID.cells[6,ling]:=q.fieldbyname('SUBCTA_GASTO').asstring;
                     GRID.cells[7,ling]:=q.fieldbyname('COG').asstring;
                end
             else
                begin
                   q.sql.text:='SELECT * FROM PMATREL WHERE CVE_CONCEPTO='+#39+str_(GRID.cells[newcol,ling],'-')+#39+
                   ' AND TIPO_PSTO='+#39+'D'+#39;
                   Q.open;

                   GRID.cells[2,ling]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
                   GRID.cells[6,ling]:=q.fieldbyname('SUBCTA_PASIVO').asstring;
                   GRID.cells[7,ling]:=q.fieldbyname('COG').asstring;
                end;

             IF (GRID.cells[6,ling]<>'') AND (GRID.cells[7,ling]='') THEN
                 begin
                    GRID.cells[2,ling]:=pers.text;
                    GRID.cells[7,ling]:=pers.text;
                 end;
         end
         else //Para pago a tercero
            begin
               q.sql.text:='SELECT * FROM PMATREL WHERE CVE_CONCEPTO='+#39+str_(GRID.cells[newcol,ling],'-')+#39+
               ' AND TIPO_PSTO='+#39+'E'+#39;
               SAVETOFILELOG(Q.sql.text);
               Q.open;

               aux.Close;
               aux.sql.text:='SELECT CONC_PERDED FROM PCONCEPTO S WHERE S.CONC_CONP='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
               Aux.open;
               GRID.cells[3,ling]:=aux.fieldbyname('CONC_PERDED').asstring;

               if aux.fieldbyname('CONC_PERDED').asstring='P' then
                  begin
                     GRID.cells[2,ling]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
                     GRID.cells[6,ling]:=q.fieldbyname('SUBCTA_GASTO').asstring;
                     GRID.cells[7,ling]:=q.fieldbyname('COG').asstring;

                    { GRID.cells[2,ling]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
                     GRID.cells[6,ling]:=q.fieldbyname('SUBCTA_PASIVO').asstring;
                     GRID.cells[7,ling]:=q.fieldbyname('SUBCTA_PASIVO').asstring;    }
                  end
               else
                  begin
                     GRID.cells[2,ling]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
                     GRID.cells[6,ling]:=q.fieldbyname('SUBCTA_PASIVO').asstring;
                     GRID.cells[7,ling]:=q.fieldbyname('COG').asstring;
                  end;
              IF (GRID.cells[6,ling]<>'') AND (GRID.cells[7,ling]='') THEN
                 begin
                    GRID.cells[2,ling]:=pers.text;
                    GRID.cells[7,ling]:=pers.text;
                 end;

            end;

      end;

 if NewCol=2 then
      begin
         Q.CLOSE;
         Q.sql.text:='SELECT DISTINCT(S.COG) as COG, S.DESCRIPCION FROM PMATREL S WHERE S.COG='+#39+str_(GRID.cells[newcol,ling],'-')+#39;
         q.OPEN;
         GRID.cells[2,ling]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
      end;


  TABU:=FALSE;
end;


procedure TFDETALLE.getDescripGridTer;
var
NewCol:integer;
begin
  IF TABU THEN newCol:=colgT-1 else newcol:=colgT;


   if NewCol=0 then
      begin
         Q.close;
         q.sql.text:='SELECT * FROM FINANZAS.FPERSONAS WHERE PERS_PERSONA='+#39+str_(gridTer.cells[NEWCOL,lingT],'-')+#39;
         savetofilelog(q.sql.text);
         Q.OPEN;
         gridTer.cells[NEWCOL,lingT]:=str_(gridTer.cells[newcol,lingT],'-')+'-'+Q.fieldbyname('PERS_NOMBRE').asstring+' '+
         Q.fieldbyname('PERS_APEPAT').asstring+' '+Q.fieldbyname('PERS_APEMAT').asstring;
      end;


  if NewCol=1 then
      begin
         Q.close;
         q.sql.text:='SELECT * FROM PCONCEPTO WHERE CONC_CONP='+#39+str_(gridTer.cells[NEWCOL,lingT],'-')+#39;
         Q.OPEN;
         gridTer.cells[NEWCOL,lingT]:=str_(gridTer.cells[newcol,lingT],'-')+'-'+Q.fieldbyname('CONC_DESCRIP').asstring;
         savetofilelog(q.sql.text);
         q.close;

         q.sql.text:='SELECT * FROM PMATREL WHERE CVE_CONCEPTO='+#39+str_(gridTer.cells[newcol,lingT],'-')+#39;
         SAVETOFILELOG(Q.sql.text);
         Q.open;
         gridTer.cells[3,lingT]:=q.fieldbyname('COG').asstring+'-'+q.fieldbyname('DESCRIPCION').asstring;
         gridTer.cells[7,lingT]:=q.fieldbyname('SUBCTA_PASIVO').asstring;
         gridTer.cells[8,lingT]:=q.fieldbyname('SUBCTA_PASIVO').asstring;

         IF STR_(GRIDTER.cells[1,lingT],'-')='061' THEN
                 begin
                    GRIDTER.cells[3,lingT]:=STR_(GRIDTER.cells[0,lingT],'-');
                    GRIDTER.cells[8,lingT]:=STR_(GRIDTER.cells[0,lingT],'-');
                 end;
      end;

  TABU:=FALSE;
end;


Function SumaColGridCond(g:TstringGrid;Col:Integer;ColCond:integer; ValorCond:string):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
         if STR_(g.cells[colCond,x],'-')=valorCond then
            begin
               try val:=strtofloat(g.cells[col,x]) except val:=0; end;
               sum:=sum+val;
            end;
      end;
SumaColGridCond:=sum;
end;


procedure TFDetalle.GridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
         Tper.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'P'));
         TDed.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'D'));
      end;

 if (key=45) then //F2 ...Agregar
     agPresClick(nil);

IF ((colg-1=0) OR (colg-1=2) OR (colg-1=3) ) AND (KEY=9) then
    begin
       tabu:=true; getDescripGrid;
   end;


 IF (COLG=0) AND  (KEY=9) AND (linG=(sender as TstringGrid).rowcount-1) AND ((sender as TstringGrid).rowcount>2) THEN
     begin agPresClick(nil);   end;


end;

procedure TFDetalle.agPresClick(Sender: TObject);
begin
  inherited;
Grid.RowCount:=grid.RowCount+1;
end;

procedure TFDetalle.GRIDSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
Ling:=aROW;
colg:=aCOL;
end;

procedure TFDetalle.GRIDDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < (sender as TstringGrid).FixedRows) or (ACol < (sender as TstringGrid).FixedCols) then
    (sender as TstringGrid).Canvas.Brush.Color := clBtnFace
  else
    (sender as TstringGrid).Canvas.Brush.Color := CLWHITE;

  if ARow=(sender as TstringGrid).RowCount-1 then
           (sender as TstringGrid).Canvas.Brush.Color := $00C1E8BF;

  (sender as TstringGrid).Canvas.Font.Size:=8;
  (sender as TstringGrid).Canvas.Font.Style:=[fsbold];
  (sender as TstringGrid).Canvas.Font.Color:=clblack;
  (sender as TstringGrid).Canvas.FillRect(Rect);
  Texto := (sender as TstringGrid).Cells[acol,ARow];
  DrawText( (sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);
end;


procedure TFDetalle.GRIDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
IF (KEY=#13) and (colg=0) and (linG<>(sender as TstringGrid).rowcount-1)  then
   getDescripGrid;

if ((colg=1) OR (colg=4) OR (colg=5)) and (linG<>(sender as TstringGrid).rowcount-1)  then
   key:=numero(key);

if (colg=2) or (colg=4) or (colg=5) or (colg=6) or (colg=7) then
   key:=#0;

IF (linG=(sender as TstringGrid).rowcount-1)  THEN
   KEY:=#0;


end;


procedure TFDetalle.grabaDetalle;
var
x:integer;
NS:INTEGER;
EMPLPADRE, padre:string;

begin
q.close;
q.sql.text:='DELETE FROM PMOVFUEDETI WHERE MOVF_MOVIM='+#39+SEQ.Text+#39;
Q.ExecSQL;

q.close;
q.sql.text:='SELECT MOVF_PADRE FROM PMOVFUENOMI WHERE MOVF_SEQ='+#39+SEQ.Text+#39;
Q.open;
padre:=q.fields[0].asstring;


if q.fields[0].asstring<>'0' then   //No es registro padre
   begin
      q.close;
      q.sql.text:='SELECT MOVF_PERS FROM PMOVFUENOMI WHERE MOVF_SEQ='+#39+PADRE+#39;
      Q.open;
      emplpadre:=q.fields[0].asstring;
   end
else
   begin
     emplpadre:=PERS.TEXT;
     padre:='0';
   end;


for x:=1 to grid.rowcount-1 do
   begin
      if (grid.cells[0,x]<>'') then
         begin
            Q.close;
            q.sql.text:='INSERT INTO PMOVFUEDETI (movf_numero,movf_concepto,movf_monto,'+
            'movf_COG, movf_perded, movf_nmov,movf_dias, movf_pres, movf_cont,'+
            ' movf_movim, movf_padre, MOVF_EMPLPADRE) values ('+
            'PSQPAGFUEDETI.nextval'+','+
            #39+str_(grid.cells[0,x],'-')+#39+','+
            #39+grid.cells[1,x]+#39+','+
            #39+str_(grid.cells[2,x],'-')+#39+','+
            #39+grid.cells[3,x]+#39+','+
            #39+grid.cells[4,x]+#39+','+
            #39+grid.cells[5,x]+#39+','+
            #39+grid.cells[6,x]+#39+','+
            #39+grid.cells[7,x]+#39+','+
            #39+seq.text+#39+','+
            #39+padre+#39+','+
            #39+emplpadre+#39+')';
          q.EXECSQL;
         end;
   end;

if (GRIDTer.CELLS[0,1]<>'') then
      if Application.MessageBox('Existen Movimientos a tercero ¿Desea Crear su Pago Fuera de Nomina?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
        begin
          FOR X:=1 to gridter.rowcount-1 do
             begin
                IF  gridTer.cells[0,x]<>'' THEN
                   BEGIN
                      Q.CLOSE;
                      q.sql.text:='SELECT PSQPAGFUENOM.NEXTVAL FROM DUAL';
                      q.OPEN;
                      NS:=Q.FIELDS[0].ASINTEGER;

                      Q.CLOSE;
                      Q.SQL.TEXT:='INSERT INTO PMOVFUENOMI (movf_seq,movf_nomb,'+
                      'movf_texto,movf_tipo,movf_pers,movf_vista,movf_fechamov,'+
                      'movf_autorizado,movf_contabilizado,movf_devengado,'+
                      'movf_sfondo,movf_tiponom, movf_fecini, movf_fecfin, '+
                      'movf_progFN, movf_uresFN, MOVF_PADRE, MOVF_SOLICITO, '+
                      'MOVF_DESCRIP, MOVF_PROYFN, MOVF_TIPOREP, MOVF_DESCCORTA) VALUES ( '+
                      #39+INTTOSTR(NS)+#39+','+
                      #39+''+#39+','+
                      #39+'PAGO A TERCERO'+#39+','+
                      #39+'TERCERO'+#39+','+
                      #39+STR_(gridTer.cells[0,x],'-')+#39+','+
                      #39+''+#39+','+
                      #39+FEC.TEXT+#39+','+
                      #39+'N'+#39+','+
                      #39+'N'+#39+','+
                      #39+'N'+#39+','+
                      #39+SFONDO.TEXT+#39+','+
                      #39+'X'+#39+','+
                      #39+FECINI.TEXT+#39+','+
                      #39+FECFIN.TEXT+#39+','+
                      #39+progfn.TEXT+#39+','+
                      #39+uresfn.TEXT+#39+','+
                      #39+seq.text+#39+','+
                      #39+Solicito.text+#39+','+
                      #39+descrip.text+#39+','+
                      #39+PROYFN.text+#39+','+
                      #39+TIPOREP.text+#39+','+
                      #39+DESCCORTA.text+#39+')';
                      savetofilelog(q.sql.text);
                      q.execsql;

                      padre:=seq.text;
                      emplpadre:=pers.text;
                      q.close;
                      q.sql.text:='INSERT INTO PMOVFUEDETI ('+
                      'movf_numero, movf_concepto, movf_monto, movf_cog,'+
                      'movf_movim, movf_perded, movf_nmov,'+
                      'movf_dias, movf_pres, movf_cont, movf_padre, movf_emplpadre) VALUES ( '+
                      'PSQPAGFUEDETI.nextval'+','+
                      #39+STR_(gridTer.cells[1,x],'-')+#39+','+
                      #39+gridTer.cells[2,x]+#39+','+
                      #39+STR_(gridTer.cells[3,x],'-')+#39+','+
                      #39+INTTOSTR(NS)+#39+','+
                      #39+gridTer.cells[4,x]+#39+','+
                      #39+gridTer.cells[5,x]+#39+','+
                      #39+gridTer.cells[6,x]+#39+','+
                      #39+gridTer.cells[7,x]+#39+','+
                      #39+gridTer.cells[8,x]+#39+','+
                      #39+padre+#39+','+
                      #39+emplpadre+#39+')';

                      savetofilelog(q.sql.text);
                      q.execsql;
                   END;
             end;
        end;


end;

procedure TFDetalle.GrabaUpdate ;

begin
   QUpdate.ExecSql ;
   grabadetalle;
   limpiagrid(grid);
   grid.rowcount:=2;
   limpiagrid(gridTer);
   gridTer.rowcount:=2;
   limpiagrid(gridDet);
   gridDet.rowcount:=2;

end;


procedure TFDetalle.GrabaInsert ;

begin
   IF MODO=3 THEN
     begin
        Q.CLOSE;
        q.sql.text:='SELECT PSQNOMINA.NEXTVAL FROM DUAL';
        q.OPEN;
        seq.FIELD.Asstring:=Q.FIELDS[0].ASSTRING;
     end;
   QInsert.ExecSql ;
   grabadetalle;
   limpiagrid(grid);
   grid.rowcount:=2;
   limpiagrid(gridTer);
   gridTer.rowcount:=2;
   limpiagrid(gridDet);
   gridDet.rowcount:=2;

end;




procedure TFDetalle.cargaDetalle;
begin
qPrin.close;
qPrin.sql.text:='SELECT * FROM PMOVFUEDETI WHERE MOVF_MOVIM='+#39+SEQ.text+#39+
' ORDER BY MOVF_PERDED DESC, MOVF_CONCEPTO';
SAVETOFILELOG(Qprin.sql.text);
qPrin.OPEN;
limpiagrid(grid);
grid.rowcount:=2;
Q.first;
while not(Qprin.eof) do
  begin
     grid.cells[0,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_CONCEPTO').asstring;
     colg:=0; ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;
     grid.cells[1,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_MONTO').asstring;
     grid.cells[2,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_COG').asstring;
     grid.cells[3,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_PERDED').asstring;
     grid.cells[4,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_NMOV').asstring;
     grid.cells[5,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_DIAS').asstring;
     grid.cells[6,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_PRES').asstring;
     grid.cells[7,grid.rowcount-1]:=qPrin.fieldbyname('MOVF_CONT').asstring;
     qPrin.next;
     grid.rowcount:=grid.rowcount+1;
  end;
        Tper.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'P'));
      TDed.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'D'));
end;

procedure TFDetalle.Inivar ;
begin
LimpiafileLog('');
//Checamos si es pensionado

  IF TIPO.TEXT='EMPLEADO' THEN tipomov.itemindex:=0 else tipomov.itemindex:=1;

  IF (MODO=1) OR (MODO=2) THEN
      cargaDetalle;


end ;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
var
x:integer;
fec1:TdateTime;
fec2:TdateTime;
vnom:string;
begin
  inherited;
try  fec1:=strtodate(fecini.text); except Showmessage('La fecha de Inicio no es valida '); exit; end;
try  fec2:=strtodate(fecfin.text); except Showmessage('La fecha de Termino no es valida '); exit; end;
if fec2>fec1 then
begin
  IF TIPO.TEXT='EMPLEADO' THEN
     begin
        q.close;
        q.sql.text:='CALL GETCONCEPTOSI('+#39+FECINI.text+#39+','+#39+fecfin.text+#39+','+#39+'N'+#39+','+#39+NOMBFN.TEXT+#39+')';
        Q.execsql;
     end;
limpiagrid(grid);
grid.rowcount:=2;
qprin.close;
qprin.sql.text:='SELECT DPAG_CONP, DPAG_PERDED, DPAG_MOVI, SUM(DPAG_MONTO) AS DPAG_MONTO, '+
' SUM(DPAG_DIAS) AS DPAG_DIAS FROM '+
' PVMOVFNPDPAGOSI WHERE PAGO_NOMB='+#39+NOMBFN.TEXT+#39+
' GROUP BY  DPAG_CONP, DPAG_PERDED, DPAG_MOVI'+
' ORDER BY DPAG_PERDED DESC, DPAG_CONP ASC';
SAVETOFILELOG(QPRIN.SQL.TEXT);
qprin.open;

while not(qprin.eof) do
   begin
      grid.Cells[0,grid.rowcount-1]:=qprin.fieldbyname('DPAG_CONP').asstring;
      colg:=0; Ling:=grid.rowcount-1; TABU:=FALSE; getdescripGrid;
      grid.Cells[1,grid.rowcount-1]:=qprin.fieldbyname('DPAG_MONTO').asstring;
      grid.Cells[3,grid.rowcount-1]:=qprin.fieldbyname('DPAG_PERDED').asstring;
      grid.Cells[4,grid.rowcount-1]:=qprin.fieldbyname('DPAG_MOVI').asstring;
      grid.Cells[5,grid.rowcount-1]:=qprin.fieldbyname('DPAG_DIAS').asstring;
      GRID.ROWCOUNT:=GRID.ROWCOUNT+1;
      qprin.NEXT;
   end;
limpiagrid(griddet);
griddet.rowcount:=2;
qprin.close;
qprin.sql.text:='SELECT * FROM PVMOVFNPDPAGOSI WHERE PAGO_NOMB='+#39+NOMBFN.TEXT+#39+
' ORDER BY DPAG_PERDED DESC,DPAG_CONP, PAGO_INI';
qprin.open;
while not(qprin.eof) do
   begin
      gridDet.Cells[0,gridDet.rowcount-1]:=qprin.fieldbyname('DPAG_CONP').asstring+'-'+qprin.fieldbyname('DPAG_DESCRIP').asstring;
      gridDet.Cells[1,gridDet.rowcount-1]:=qprin.fieldbyname('DPAG_MONTO').asstring;
      gridDet.Cells[2,gridDet.rowcount-1]:=qprin.fieldbyname('DPAG_PERDED').asstring;
      gridDet.Cells[3,gridDet.rowcount-1]:=qprin.fieldbyname('DPAG_MOVI').asstring;
      gridDet.Cells[4,gridDet.rowcount-1]:=qprin.fieldbyname('PAGO_INI').asstring;
      gridDet.Cells[5,gridDet.rowcount-1]:=qprin.fieldbyname('PAGO_FIN').asstring;
      gridDet.Cells[6,gridDet.rowcount-1]:=qprin.fieldbyname('DPAG_DIAS').asstring;
      gridDet.Cells[7,gridDet.rowcount-1]:=qprin.fieldbyname('PAGO_NOMINA').asstring;
      GRIDDet.ROWCOUNT:=GRIDDet.ROWCOUNT+1;
      qprin.NEXT;
   end;
         Tper.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'P'));
         TDed.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'D'));


//Movimientos a Terceros
limpiagrid(gridTer);
gridTer.rowcount:=2;
qprin.close;
qprin.sql.text:='SELECT DISTINCT(PAGO_NOMINA) FROM PVMOVFNPDPAGOSI WHERE PAGO_NOMB='+#39+NOMBFN.TEXT+#39;
qprin.open;
if not(qprin.eof) then
   Vnom:=qPrin.fields[0].asstring
else
   Vnom:='0';
qprin.close;
qprin.sql.text:='SELECT PAGO_EMPL,DPAG_CONP, DPAG_PERDED, DPAG_MOVI, SUM(DPAG_MONTO) AS DPAG_MONTO, SUM(DPAG_DIAS) AS DPAG_DIAS FROM '+
' PVMOVFNPDPAGOSI WHERE PAGO_NOMINA IN (SELECT DISTINCT(PAGO_NOMINA) FROM PVMOVFNPDPAGOS WHERE PAGO_NOMB='+#39+NOMBFN.TEXT+#39+')'+
' AND PAGO_EMPL<>'+#39+PERS.TEXT+#39+
' GROUP BY  PAGO_EMPL, DPAG_CONP, DPAG_PERDED, DPAG_MOVI'+
' ORDER BY PAGO_EMPL, DPAG_CONP';
SAVETOFILElOG(QPRIN.SQL.TEXT);
QPRIN.OPEN;
while not(qprin.eof) do
   begin
      gridTer.Cells[0,gridTer.rowcount-1]:=qprin.fieldbyname('PAGO_EMPL').asstring;
      colgT:=0; LingT:=gridTer.rowcount-1; TABUT:=FALSE; getdescripGridTer;
      gridTer.Cells[1,gridTer.rowcount-1]:=qprin.fieldbyname('DPAG_CONP').asstring;
      colgT:=1; LingT:=gridTer.rowcount-1; TABUT:=FALSE; getdescripGridTer;
      gridTer.Cells[2,gridTer.rowcount-1]:=qprin.fieldbyname('DPAG_MONTO').asstring;
      gridTer.Cells[4,gridTer.rowcount-1]:=qprin.fieldbyname('DPAG_PERDED').asstring;
      gridTer.Cells[5,gridTer.rowcount-1]:=qprin.fieldbyname('DPAG_MOVI').asstring;
      gridTer.Cells[6,gridTer.rowcount-1]:=qprin.fieldbyname('DPAG_DIAS').asstring;
      gridTer.ROWCOUNT:=gridTer.ROWCOUNT+1;
      qprin.NEXT;
   end;


end
else
   Showmessage('la fecha de Inicio debe ser menor a la Fecha final del periodo');


end;

procedure TFDetalle.LimpiarClick(Sender: TObject);
begin
  inherited;
LimpiaGrid(grid);
grid.rowcount:=2;
LimpiaGrid(gridDet);
gridDet.rowcount:=2;
end;

procedure TFDetalle.GRIDTERSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
LingT:=aROW;
colgT:=aCOL;

end;

procedure TFDetalle.GRIDTERKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
      if (key=46) and (linGt<>(sender as TstringGrid).rowcount-1) then
         if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
            begin
               if (key=46) and ((sender as TstringGrid).rowcount>2) then
                      borra_row((sender as TstringGrid),linG);
               if (key=46) and ((sender as TstringGrid).rowcount=2) then
                      limpia_linea((sender as TstringGrid),2);
            end;

       if (key=45) then //F2 ...Agregar
           GRIDTer.rowcount:=GRIDTer.rowcount+1;

       IF ((colgt-1=0) OR (colgt-1=1) ) AND (KEY=9) then
          begin
             tabu:=true; getDescripGridTer;
         end;

       IF (COLGt=0) AND  (KEY=9) AND (linGt=(sender as TstringGrid).rowcount-1)  THEN
           begin GRIDTer.rowcount:=GRIDTer.rowcount+1;  end;

end;

procedure TFDetalle.NOMBFNChange(Sender: TObject);
begin

        PSTO.CLEAR;
        CATEG.CLEAR;
        VISTA.CLEAR;
        TIPOPSTO.CLEAR;
        JUBILADO.CLEAR;

        qPrin.close;
        qPrin.sql.text:='SELECT * FROM PVNOMBRAMALLI S WHERE S.VNOM_Nomb='+
        #39+nombFN.TEXT+#39;
        QPrin.open;

        try LVMOV_NOMBS.TEXT:= qPrin.fieldbyname('VNOM_NOMBRE').asstring; EXCEPT END;
        TRY psto.Field.AsString:=qPrin.fieldbyname('VNOM_PSTOI').asstring; EXCEPT END;
        try CATEG.Field.AsString:=qPrin.fieldbyname('VNOM_CATEGR').asstring;EXCEPT END;
        try VISTA.FIELD.ASSTRING:='PVINOMBRAM' EXCEPT END;
        try TIPOPSTO.FIELD.ASSTRING:=qPrin.fieldbyname('VNOM_TPSTO').asstring; EXCEPT END;
        try TIPOPLAZA.FIELD.ASSTRING:=qPrin.fieldbyname('VNOM_TPLAZA').asstring; EXCEPT END;
        ini.text:=qPrin.fieldbyname('VNOM_INI').asstring;
        FIN.text:=qPrin.fieldbyname('VNOM_FIN').asstring;
        if modo=3 then
           try URESFN.FIELD.ASSTRING:=qPrin.fieldbyname('VNOM_URES').asstring; EXCEPT END;


        aux.Close;
        aux.sql.text:='SELECT PLAZ_PROG FROM PIPLAZPROG WHERE PLAZ_PLAZA='+#39+qPrin.fieldbyname('VNOM_PLAZAI').asstring+#39;
        aux.open;
        IF MODO=3 THEN
           TRY progfn.field.asstring:=aux.fields[0].asstring;    EXCEPT END;


        Q.close;
        q.sql.text:='SELECT COUNT(*) FROM PMOVRELPSTO WHERE MOVR_TPSTO='+#39+TIPOPSTO.TEXT+#39+
        ' AND MOVR_TIPO='+#39+'JUBILADO'+#39;
        Q.open;
        if q.fields[0].asinteger>0 then jubilado.text:='S' else jubilado.text:='N';
           TRY TIPONOM.field.asstring:='X';  EXCEPT END;

        TRY TIPONOM.field.asstring:='V'; EXCEPT END;

end;

procedure TFDetalle.PERSChange(Sender: TObject);
begin
      Q.close;
      q.sql.text:='SELECT PERS_EMPLEADO, PERS_HONOASIM FROM FINANZAS.FPERSONAS '+
      'WHERE PERS_PERSONA='+#39+PERS.TEXT+#39;
      Q.open;
      IF (Q.fields[0].asstring='S') OR (Q.fields[1].asstring='S')then
        begin

             TRY tipo.Field.asstring:='EMPLEADO'; except end;
             tipoMOV.itemindex:=0;
        end
      else
         begin
             try tipo.Field.asstring:='TERCERO'; except end;
             tipoMov.itemindex:=1;
             TRY TIPONOM.field.asstring:='X'; EXCEPT END;
         end;
end;




procedure TFDetalle.GRIDSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  inherited;
  IF (ACOL=1) OR (ACOL=3) THEN
     BEGIN
      Tper.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'P'));
      TDed.Caption:=formatfloat('#,0.00000',sumacolgridCond(grid,1,3,'D'));
     END;
end;

procedure TFDetalle.GRIDTERKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
IF (KEY=#13) and ((colgt=0) or (colgt=1)) and (linGt<>(sender as TstringGrid).rowcount-1)  then
   getDescripGridTer;

IF (linGt=(sender as TstringGrid).rowcount-1)  THEN
   key:=#0;

end;

procedure TFDetalle.GRIDTERDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < (sender as TstringGrid).FixedRows) or (ACol < (sender as TstringGrid).FixedCols) then
    (sender as TstringGrid).Canvas.Brush.Color := clBtnFace
  else
    (sender as TstringGrid).Canvas.Brush.Color := CLWHITE;

  if ARow=(sender as TstringGrid).RowCount-1 then
           (sender as TstringGrid).Canvas.Brush.Color := $00C1E8BF;

  (sender as TstringGrid).Canvas.Font.Size:=8;
  (sender as TstringGrid).Canvas.Font.Style:=[fsbold];
  (sender as TstringGrid).Canvas.Font.Color:=clblack;
  (sender as TstringGrid).Canvas.FillRect(Rect);
  Texto := (sender as TstringGrid).Cells[acol,ARow];
  DrawText( (sender as TstringGrid).Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);
end;


end.




