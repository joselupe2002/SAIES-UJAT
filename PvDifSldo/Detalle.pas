unit Detalle;

//ultima 20/DIC/05

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, ExtDlgs, StdCtrls, Buttons, DBCtrls, Mask, DBCGrids,
  AdvGrid;

type
  TFDetalle = class(TPFDetalle)
    PageControl1: TPageControl;
    TabGral: TTabSheet;
    Label5: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    TEXTO: TDBEdit;
    Seq: TDBEdit;
    FINI: TDBEdit;
    NOMBS: TDBEdit;
    FFIN: TDBEdit;
    LCATEG: TEdit;
    CATEG: TDBEdit;
    LNOMBS: TEdit;
    PSTO: TDBEdit;
    Label30: TLabel;
    qPuesto: TQuery;
    LPSTO: TEdit;
    QCateg: TQuery;
    Label1: TLabel;
    QVNombram: TQuery;
    Label4: TLabel;
    Nomina: TDBEdit;
    Label2: TLabel;
    LPSTO2: TEdit;
    QPuesto2: TQuery;
    PSTO2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    function rnombre : String ; override ;


    procedure ValNombs (Sender : TField);
    procedure ValPsto (Sender : TField);
    procedure ValPsto2 (Sender : TField);
    procedure ValCateg (Sender : TField);
    procedure PSTOExit(Sender: TObject);
    procedure PSTO2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

   procedure Inivar ; override ;

  end;

var
  FDetalle: TFDetalle;

implementation
{$R *.DFM}

var

 Puesto : string[30];
 Puesto2 : string[30];


procedure TFDetalle.FormCreate(Sender: TObject);
begin
 inherited ;
 Width := 679 ;
 Height := 375 ;


 { modo3 inserta
  modo1 consulta
  modo2 edita

 showmessage(inttostr(modo));
 }





 if modo <> 1 then //en consulta no se cargan
  BEGIN

   FModulo.Query1.FieldByName('VDIF_NOMBS').OnValidate := ValNombs;
   FModulo.Query1.FieldByName('VDIF_PSTO').OnValidate := ValPsto;
   FModulo.Query1.FieldByName('VDIF_CATEG').OnValidate := ValCateg;
   FModulo.Query1.FieldByName('VDIF_PSTO2').OnValidate := ValPsto2;

  END;

 end;





procedure TFDetalle.Inivar ;
begin

    LPsto.Text := '';
    LPsto2.text:= '';

   QVNombram.Close;
   QVNombram.OPen;
   LNombs.Text := QVNombram.FieldByName('Nombre').AsString;

   QPuesto.Close;
   QPuesto.OPen;
   LPsto.Text := QPuesto.FieldByName('Descripcion').AsString;

   QCateg.Close;
   QCateg.OPen;
   LCateg.Text := QCateg.FieldByName('Descripcion').AsString;

   QPuesto2.Close;
   QPuesto2.OPen;
   LPsto2.Text := QPuesto2.FieldByName('Descripcion2').AsString;


if modo = 3 then
 begin

  lpsto.Text := '';
  lcateg.Text := '';
  lpsto2.Text := '';

 end;

end ;



function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 if result = 'NOMBS'then
  begin
     Vsql.Add('Select');
     Vsql.Add('nomb_nomb as Nomb,');
     Vsql.Add('pers_nombre As Nombre,');
     Vsql.Add('pers_apepat As Ap_Paterno,');
     Vsql.Add('pers_apemat As Ap_Materno,');
     Vsql.Add('nomb_empl As Cve_Empl,');
     Vsql.Add('nomb_descrip As Puesto,');
     Vsql.Add('ures_descrip As Ures');
     Vsql.Add('from pnombram, fpersonas, pplazas, ppuestos, fures, patrempl');
     Vsql.Add('where plaz_plaza = nomb_plaza');
     Vsql.Add('and pers_persona = nomb_empl');
     Vsql.Add('and nomb_fin > sysdate');
     Vsql.Add('and (nomb_flice < sysdate OR nomb_flice is null)');
     Vsql.Add('and pues_psto = plaz_psto');
     Vsql.Add('and pues_tpsto = ''' + 'A' + '''');
     Vsql.Add('and ures_ures = plaz_ures');
     Vsql.Add('and atre_empl = pers_persona');

  end;

  if result= 'PSTO' then
 with VSql do
 begin
  add('Select');
  add('Pues_Psto as Puesto,');
  add('Pues_Descrip as Descripcion');
  add('from ppuestos');
  add('where Pues_TPsto = ''' + 'A' + '''');
  end;

if result= 'CATEG' then
 with VSql do
 begin
  add('Select');
  add('Cpue_Categ as Categoria,');
  add('Cpue_Descrip as Descripcion,');
  add('Cpue_Psto as Puesto');
  add('from pcpuestos');
  add('where Cpue_Psto = ''' + Puesto + '''');
  end;

if result= 'PSTO2' then
 with VSql do
 begin
  add('Select');
  add('Pues_Psto as Puesto2,');
  add('Pues_Descrip as Descripcion2');
  add('from ppuestos');
  add('where Pues_TPsto = ''' + 'A' + '''');
  end;

end ;


procedure TFDetalle.ValPsto(Sender : TField);
begin

If (FModulo.Query1.FieldByName('VDIF_PSTO').IsNull) or
  (TRIM(FModulo.Query1.FieldByName('VDIF_PSTO').ASSTRING) = '')
 then exit;

QPuesto.Close;
QPuesto.OPen;
LPsto.Text := QPuesto.FieldByName('Descripcion').AsString;

If QPuesto.EOF
 then Raise Exception.Create('No existe Puesto');

end;

procedure TFDetalle.ValPsto2(Sender : TField);
begin

If (FModulo.Query1.FieldByName('VDIF_PSTO2').IsNull) or
  (TRIM(FModulo.Query1.FieldByName('VDIF_PSTO2').ASSTRING) = '')
 then exit;

QPuesto2.Close;
QPuesto2.OPen;
LPsto2.Text := QPuesto2.FieldByName('Descripcion2').AsString;

If QPuesto2.EOF
 then Raise Exception.Create('No existe Puesto');

end;


procedure TFDetalle.ValCateg(Sender : TField);
begin

  If (FModulo.Query1.FieldByName('VDIF_CATEG').IsNull) OR
  (TRIM(FModulo.Query1.FieldByName('VDIF_CATEG').ASSTRING) = '')
  then exit;


  QCateg.Close;
  QCateg.Open;
  LCateg.Text := QCateg.FieldByName('Descripcion').AsString;

  If QCateg.EOF
   then Raise Exception.Create('No existe Categoría');

end;


procedure TFDetalle.PSTOExit(Sender: TObject);
begin
  inherited;


if psto.text <> '' then
  Puesto:= trim(Psto.text);


end;


procedure TFDetalle.ValNombs(Sender : TField);
begin

If FModulo.Query1.FieldByName('VDIF_NOMBS').IsNull
 then exit;


QVNombram.Close;
QVNombram.OPen;
LNombs.Text := QVNombram.FieldByName('Nombre').AsString;

If QVNombram.EOF
 then Raise Exception.Create('No existe Nombramiento');

end;


procedure TFDetalle.PSTO2Exit(Sender: TObject);
begin
  inherited;


if psto2.text <> '' then
  Puesto2:= trim(Psto2.text);


end;

end.
