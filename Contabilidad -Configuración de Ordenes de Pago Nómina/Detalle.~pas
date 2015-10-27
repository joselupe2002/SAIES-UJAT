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
    PERSONA: TDBEdit;
    LTRAN_PERSONA: TEdit;
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
    procedure PERSONAChange(Sender: TObject);
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


 IF RESULT='PERSONA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('PERS_PERSONA AS PERSONA,');
       Vsql.Add('PERS_NOMBRE AS NOMBRE');
       Vsql.Add('FROM FPERSONAS');
       Vsql.Add('WHERE PERS_TIPO=3');
       SavetofileLog(vsql.text);
     end;

  IF RESULT='BANCO' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('TRAN_CLAVE As BANCO,');
       Vsql.Add('TRAN_DESCRIP As Descripcion');
       Vsql.Add('FROM PTRANBANCOS');
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
 Width :=  636 ;


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
IF (modo=1) or (modo=2) then     BEGIN BANCOChange(NIL); Cgrupo:=grupo.Field.asstring; END;


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

procedure TFDetalle.PERSONAChange(Sender: TObject);
begin
  inherited;
  Q.close;
  q.sql.text:='SELECT TRAN_DESCRIP FROM PTRANBANCOS WHERE TRAN_CLAVE='+#39+BANCO.TEXT+#39;
  Q.open;
  ltran_Banco.Text:=q.fields[0].asstring;
end;

end.
