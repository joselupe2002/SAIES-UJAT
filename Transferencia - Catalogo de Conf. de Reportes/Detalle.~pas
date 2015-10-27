unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, CheckLst ;

  type

  TFDetalle = class(TPFDetalle)
    Label9: TLabel;
    NOMBRE: TDBEdit;
    Label4: TLabel;
    Label1: TLabel;
    BANCO: TDBEdit;
    LTRAN_BANCO: TEdit;
    Label2: TLabel;
    Q: TQuery;
    LURESP: TCheckListBox;
    URESP: TDBMemo;
    Label3: TLabel;
    LTPSTO: TCheckListBox;
    TPSTO: TDBMemo;
    EMPL: TDBMemo;
    Label5: TLabel;
    selur: TPopupMenu;
    InvertirSeleccin1: TMenuItem;
    PopupMenu1: TPopupMenu;
    InvertirSeleccin2: TMenuItem;
    grupo: TDBComboBox;
    Label6: TLabel;
    TIPONOM: TDBComboBox;
    ESDEPED: TDBCheckBox;
    CHEQUE: TDBCheckBox;
    Label7: TLabel;
    lsfdo: TCheckListBox;
    sfdo: TDBMemo;
    TEMPL: TDBMemo;
    LTEMPL: TCheckListBox;
    Label8: TLabel;
    MenuSfdo: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuTempl: TPopupMenu;
    MenuItem2: TMenuItem;
    CUADRE: TDBCheckBox;
    ESCONTA: TDBCheckBox;
    Label10: TLabel;
    PCONTA: TDBEdit;
    STRAN_PCONTA: TEdit;
    Label11: TLabel;
    BANCONTA: TDBEdit;
    STRAN_BANCONTA: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    function RNombre : String ; OVERRIDE;
    procedure BANCOChange(Sender: TObject);
    procedure URESPChange(Sender: TObject);
    procedure marcaItems(Lista:TcheckListBox; cadbus:string);
    procedure TPSTOChange(Sender: TObject);
    procedure LURESPClickCheck(Sender: TObject);
    procedure LTPSTOClickCheck(Sender: TObject);
    procedure InvertirSeleccin1Click(Sender: TObject);
    procedure InvertirSeleccin2Click(Sender: TObject);
    procedure lsfdoClickCheck(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure LTEMPLClickCheck(Sender: TObject);
    procedure sfdoChange(Sender: TObject);
    procedure TEMPLChange(Sender: TObject);
    procedure PCONTAChange(Sender: TObject);
    procedure BANCONTAChange(Sender: TObject);
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


 IF RESULT='BANCO' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('TRAN_CLAVE As BANCO,');
       Vsql.Add('TRAN_DESCRIP As Descripcion');
       Vsql.Add('FROM PTRANBANCOS');
       SavetofileLog(vsql.text);
     end;

  IF RESULT='BANCONTA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('BANC_BANCO As BANCO,');
       Vsql.Add('BANC_DESCRIP As Descripcion');
       Vsql.Add('FROM FBANCOS');
       Vsql.Add('WHERE BANC_ENTRA_DATOS='+#39+'S'+#39);
       SavetofileLog(vsql.text);
     end;

  IF RESULT='PCONTA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('PERS_PERSONA As PERSONA,');
       Vsql.Add('PERS_NOMBRE As NOMBRE,');
       Vsql.Add('PERS_APEPAT As PATERNO,');
       Vsql.Add('PERS_APEMAT As MATERNO');
       Vsql.Add('FROM FPERSONAS');
       Vsql.Add('WHERE PERS_PERSONA LIKE '+#39+'P%'+#39);
       SavetofileLog(vsql.text);
     end;

end;


procedure TFDetalle.FormCreate(Sender: TObject);
var
x:integer;
cgrupo:string;
cad, cadur:string;
begin
// Data := TdmDatos.Create(FDetalle) ;
 inherited;
 Height := 628;
 Width :=  886 ;

 IF MODO=3 then cuadre.Field.AsString:='S';

 if (modo=3) or (modo=2) then
    begin
         q.close;
         q.sql.text:='SELECT DISTINCT(S.URES_PAGO), T.URES_DESCRIP FROM FURES S,'+
                      ' FURES T WHERE S.URES_PAGO IS NOT NULL AND S.URES_PAGO=T.URES_URES'+
                      ' order by ures_pago';
         Q.open;
         luresp.clear;
         x:=0;
         while not (q.eof) do
            begin
               luresp.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
               luresp.Checked[x]:=false;
               q.next; x:=x+1;
            end;
         //Checamos URES marcadas
         cad:=URESP.Text;
         while (length(cad)>0) and (pos(',',cad)>0) do
            begin
               cadur:=copy(cad,1,pos(',',cad)-1);
               marcaItems(luresp,cadur);
               cad:= copy(cad,pos(',',cad)+1,length(cad));
            end;
         marcaItems(luresp,cad);



         q.close;
         q.sql.text:='SELECT DISTINCT(S.SFON_SFDO), S.SFON_DESCRIP FROM FSFONDOS S'+
                      ' ORDER BY SFON_SFDO';
         Q.open;
         lSfdo.clear;
         x:=0;
         while not (q.eof) do
            begin
               lsfdo.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
               lsfdo.Checked[x]:=false;
               q.next; x:=x+1;
            end;
         //Checamos SUBFONDOS marcadas
         cad:=sfdo.Text;
         while (length(cad)>0) and (pos(',',cad)>0) do
            begin
               cadur:=copy(cad,1,pos(',',cad)-1);
               marcaItems(lsfdo,cadur);
               cad:= copy(cad,pos(',',cad)+1,length(cad));
            end;
         marcaItems(lsfdo,cad);



         q.close;
         q.sql.text:='SELECT TEMP_TEMPL, TEMP_DESCRIP  FROM PTEMPLS ORDER BY TEMP_TEMPL';
         Q.open;
         lTempl.clear;
         x:=0;
         while not (q.eof) do
            begin
               ltEMPL.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
               ltEMPL.Checked[x]:=false;
               q.next; x:=x+1;
            end;
         //Checamos TEMPL marcadas
         cad:=Templ.Text;
         while (length(cad)>0) and (pos(',',cad)>0) do
            begin
               cadur:=copy(cad,1,pos(',',cad)-1);
               marcaItems(lTempl,cadur);
               cad:= copy(cad,pos(',',cad)+1,length(cad));
            end;
         marcaItems(lTempl,cad);



         q.close;
         q.sql.text:='SELECT TPUE_TPSTO, TPUE_DESCRIP FROM PTPUESTOS ORDER BY TPUE_TPSTO';
         Q.open;
         lTPSTO.clear;
         x:=0;
         while not (q.eof) do
            begin
               lTPSTO.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
               lTPSTO.Checked[x]:=false;
               q.next; x:=x+1;
            end;

                //Checamos URES marcadas
         cad:=tPSTO.Text;
         while (length(cad)>0) and (pos(',',cad)>0) do
            begin
               cadur:=copy(cad,1,pos(',',cad)-1);
               marcaItems(lTPSTO,cadur);
               cad:= copy(cad,pos(',',cad)+1,length(cad));
            end;
         marcaItems(lTPSTO,cad);


         
    end;

IF (modo=1) or (modo=2) then     BEGIN
        BANCOChange(NIL);
        BANCOntaChange(NIL);
        pcontaChange(NIL);
        Cgrupo:=grupo.Field.asstring; END;


         q.close;
         q.sql.text:='SELECT DISTINCT(TRAN_GRUPO) FROM PTRANREPORT';
         Q.open;
         grupo.clear;
         while not (q.eof) do
            begin
               grupo.items.Add(q.fields[0].asstring);
               q.next;
            end;
IF (modo=1) or (modo=2) then     BEGIN grupo.Field.asstring:=Cgrupo; END;

end;

procedure TFDetalle.GrabaInsert ;
begin
 qInsert.ExecSql ;
NOMBRE.SETFOCUS;
end ;

procedure TFDetalle.GrabaUpdate ;
begin
 qUpdate.ExecSql ;
end ;



procedure TFDetalle.BANCOChange(Sender: TObject);
begin
  Q.close;
  q.sql.text:='SELECT TRAN_DESCRIP FROM PTRANBANCOS WHERE TRAN_CLAVE='+#39+BANCO.TEXT+#39;
  Q.open;
  ltran_Banco.Text:=q.fields[0].asstring;

end;



procedure TFDetalle.marcaItems(Lista:TcheckListBox; cadbus:string);
var
x:integer;
begin
   for x:=0 to lista.Items.Count-1 do
       begin
           if STR_(lista.Items.Strings[x],'-')=cadbus then
                lista.Checked[x]:=true;
       end;

end;

procedure TFDetalle.URESPChange(Sender: TObject);
var
cadur,cad:string;
x:integer;
begin
   q.close;
   q.sql.text:='SELECT DISTINCT(S.URES_PAGO), T.URES_DESCRIP FROM FURES S,'+
               ' FURES T WHERE S.URES_PAGO IS NOT NULL AND S.URES_PAGO=T.URES_URES'+
               ' order by ures_pago';
   Q.open;
   luresp.clear;
   x:=0;
   while not (q.eof) do
      begin
         luresp.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
         luresp.Checked[x]:=false;
         q.next; x:=x+1;
      end;

   //Checamos URES marcadas
   cad:=URESP.Text;
   while (length(cad)>0) and (pos(',',cad)>0) do
      begin
         cadur:=copy(cad,1,pos(',',cad)-1);
         marcaItems(luresp,cadur);
         cad:= copy(cad,pos(',',cad)+1,length(cad));
      end;
   marcaItems(luresp,cad);

end;

procedure TFDetalle.TPSTOChange(Sender: TObject);
var
cadur,cad:string;
x:integer;
begin
   q.close;
   q.sql.text:='SELECT TPUE_TPSTO, TPUE_DESCRIP FROM PTPUESTOS  ORDER BY TPUE_TPSTO';
   Q.open;
   lTPSTO.clear;
   x:=0;
   while not (q.eof) do
      begin
         lTPSTO.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
         lTPSTO.Checked[x]:=false;
         q.next; x:=x+1;
      end;

   //Checamos URES marcadas
   cad:=tPSTO.Text;
   while (length(cad)>0) and (pos(',',cad)>0) do
      begin
         cadur:=copy(cad,1,pos(',',cad)-1);
         marcaItems(lTPSTO,cadur);
         cad:= copy(cad,pos(',',cad)+1,length(cad));
      end;
   marcaItems(lTPSTO,cad);

end;


procedure TFDetalle.LURESPClickCheck(Sender: TObject);
var
x:integer;
cad:string;
begin
cad:='';
for x:=0 to luresp.items.count-1 do
   begin
      if luresp.Checked[x] then
         cad:=cad+STR_(luresp.items.Strings[x],'-')+',';
   end;
cad:=copy(cad,1,length(cad)-1);
uresp.Field.asstring:=cad;
end;

procedure TFDetalle.LTPSTOClickCheck(Sender: TObject);
var
x:integer;
cad:string;
begin
cad:='';
for x:=0 to ltpsto.items.count-1 do
   begin
      if ltpsto.Checked[x] then
         cad:=cad+STR_(ltpsto.items.Strings[x],'-')+',';
   end;
cad:=copy(cad,1,length(cad)-1);
tpsto.Field.asstring:=cad;
end;

procedure TFDetalle.InvertirSeleccin1Click(Sender: TObject);
var
x:integer;
begin
  for x:=0 to luresp.items.count-1 do
     begin
        luresp.Checked[x]:=not(luresp.Checked[x]);
     end;
   LURESPClickCheck(NIL);

end;

procedure TFDetalle.InvertirSeleccin2Click(Sender: TObject);
var
x:integer;
begin
  for x:=0 to ltpsto.items.count-1 do
     begin
        ltpsto.Checked[x]:=not(ltpsto.Checked[x]);
     end;
   ltpstoClickCheck(NIL);
end;

procedure TFDetalle.lsfdoClickCheck(Sender: TObject);
var
x:integer;
cad:string;
begin
cad:='';
for x:=0 to LSFDO.items.count-1 do
   begin
      if LSFDO.Checked[x] then
         cad:=cad+STR_(lSFDO.items.Strings[x],'-')+',';
   end;
cad:=copy(cad,1,length(cad)-1);
SFDO.Field.asstring:=cad;
end;



procedure TFDetalle.MenuItem1Click(Sender: TObject);
var
x:integer;
begin
  for x:=0 to lsfdo.items.count-1 do
     begin
        lsfdo.Checked[x]:=not(lsfdo.Checked[x]);
     end;
   lsfdoClickCheck(NIL);
end;

procedure TFDetalle.MenuItem2Click(Sender: TObject);
var
x:integer;
begin
  for x:=0 to lTempl.items.count-1 do
     begin
        lTempl.Checked[x]:=not(lTempl.Checked[x]);
     end;
   lTemplClickCheck(NIL);
end;

procedure TFDetalle.LTEMPLClickCheck(Sender: TObject);
var
x:integer;
cad:string;
begin
cad:='';
for x:=0 to lTEmpl.items.count-1 do
   begin
      if lTEmpl.Checked[x] then
         cad:=cad+STR_(lTEmpl.items.Strings[x],'-')+',';
   end;
cad:=copy(cad,1,length(cad)-1);
TEmpl.Field.asstring:=cad;
end;

procedure TFDetalle.sfdoChange(Sender: TObject);
var
cadur,cad:string;
x:integer;
begin
         q.close;
         q.sql.text:='SELECT DISTINCT(S.SFON_SFDO), S.SFON_DESCRIP FROM FSFONDOS S'+
                      ' ORDER BY SFON_SFDO';
         Q.open;
         lSfdo.clear;
         x:=0;
         while not (q.eof) do
            begin
               lsfdo.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
               lsfdo.Checked[x]:=false;
               q.next; x:=x+1;
            end;
         //Checamos SUBFONDOS marcadas
         cad:=sfdo.Text;
         while (length(cad)>0) and (pos(',',cad)>0) do
            begin
               cadur:=copy(cad,1,pos(',',cad)-1);
               marcaItems(lsfdo,cadur);
               cad:= copy(cad,pos(',',cad)+1,length(cad));
            end;
         marcaItems(lsfdo,cad);
end;

procedure TFDetalle.TEMPLChange(Sender: TObject);
var
cadur,cad:string;
x:integer;
begin
q.close;
         q.sql.text:='SELECT TEMP_TEMPL, TEMP_DESCRIP  FROM PTEMPLS ORDER BY TEMP_TEMPL';
         Q.open;
         lTempl.clear;
         x:=0;
         while not (q.eof) do
            begin
               lTempl.Items.Add(q.fields[0].asstring+'-'+q.fields[1].asstring);
               lTempl.Checked[x]:=false;
               q.next; x:=x+1;
            end;
         //Checamos TEMPL marcadas
         cad:=Templ.Text;
         while (length(cad)>0) and (pos(',',cad)>0) do
            begin
               cadur:=copy(cad,1,pos(',',cad)-1);
               marcaItems(lTempl,cadur);
               cad:= copy(cad,pos(',',cad)+1,length(cad));
            end;
         marcaItems(lTempl,cad);
end;

procedure TFDetalle.PCONTAChange(Sender: TObject);
begin
  Q.close;
  q.sql.text:='SELECT PERS_NOMBRE||'+#39+' '+#39+'||PERS_APEPAT||'+
  #39+' '+#39+'PERS_APEMAT FROM FPERSONAS WHERE PERS_PERSONA='+#39+PCONTA.TEXT+#39;
  Q.open;
  Stran_PCONTA.Text:=q.fields[0].asstring;

end;

procedure TFDetalle.BANCONTAChange(Sender: TObject);
begin

  Q.close;
  q.sql.text:='SELECT BANC_DESCRIP FROM FBANCOS WHERE BANC_BANCO='+#39+BANCONTA.TEXT+#39;
  Q.open;
  Stran_BancoNTA.Text:=q.fields[0].asstring;
end;

end.
