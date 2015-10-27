unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, DBCGrids;

type
  TFDetalle = class(TPFDetalle)
    Paginas: TPageControl;
    TabPlaza: TTabSheet;
    TabProg: TTabSheet;
    dbcgProgs: TDBCtrlGrid;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Prog: TDBEdit;
    LProg: TDBEdit;
    Porc: TDBEdit;
    Label11: TLabel;
    TPlaza: TDBEdit;
    URes: TDBEdit;
    PstoH: TDBEdit;
    Horas: TDBEdit;
    Sueldo: TDBEdit;
    Inicio: TDBEdit;
    Fin: TDBEdit;
    QDetalle: TQuery;
    DSDetalle: TDataSource;
    QProgs: TQuery;
    QDetallePROG: TStringField;
    QDetallePORC: TFloatField;
    QDetalleLProg: TStringField;
    QPsto: TQuery;
    LVPLA_TPlaza: TEdit;
    LVPLA_URes: TEdit;
    LVPLA_Psto: TEdit;
    QIDetalle: TQuery;
    QDDetalle: TQuery;
    Label12: TLabel;
    Plaza: TDBEdit;
    Label1: TLabel;
    Docen: TDBEdit;
    Label13: TLabel;
    QValPorcs: TQuery;
    Label15: TLabel;
    URes_Porc: TDBEdit;
    LUres: TDBEdit;
    QURes: TQuery;
    QDetalleURES: TStringField;
    QDetalleLUres: TStringField;
    SFdo_Porc: TDBEdit;
    LSFdo: TDBEdit;
    Label16: TLabel;
    QSFdo: TQuery;
    QDetalleSFDO: TStringField;
    QDetalleLSFdo: TStringField;
    TabNomb: TTabSheet;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EmplH: TDBEdit;
    CategH: TDBEdit;
    INomb: TDBEdit;
    FNomb: TDBEdit;
    LVPLA_Empl: TEdit;
    LVPLA_Categ: TEdit;
    Label20: TLabel;
    nDescrip: TDBEdit;
    Label21: TLabel;
    SFdo: TDBEdit;
    LVPLA_SFdo: TEdit;
    Label3: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Reempla: TDBEdit;
    qReempla: TQuery;
    dsNomb: TDataSource;
    nombre: TEdit;
    UresReem: TEdit;
    PstoReem: TEdit;
    Label26: TLabel;
    PROMEP: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure PstoChange(Sender : TField) ;
    procedure CalcSueldo(Sender : TField) ;
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure GrabaDetalle ; override ;
    function rnombre : String ; override ;
    function RCampo(Sender : TField) : String ; override ;
    procedure ReemplaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

{$R *.DFM}

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 inherited ;
 Height := 520 ;
 Width := 430 ;
 FModulo.Query1.FieldByName('VPLA_Psto').OnValidate := PstoChange ;
 FModulo.Query1.FieldByName('VPLA_Horas').OnValidate := CalcSueldo ;
 TFloatField(FModulo.Query1.FieldByName('VPLA_Docen')).DisplayFormat := '###.00 %' ;
 Paginas.ActivePage := TabPlaza ;

{ FModulo.Query1.FieldByName('VPLA_Reempla').OnValidate := cVReempla;}

if (modo=1) or (modo=2) then reemplaexit(nil);

end;

procedure TFDetalle.IniVar ;
begin

{ cVNomb(nil) ;}

if modo= 3 then begin
  FModulo.Query1['VPLA_PROMEP'] := 'N' ;
  FModulo.Query1['VPLA_AREA'] := 'N' ;
 end ;


 Nombre.Text  := '';
 UresReem.Text := '';
 PstoReem.Text  := '';

 QDetalle.Open ;
 QPsto.Open ;
 if QPsto.FieldByName('Pues_Suel_Alt').AsString = 'S' then
  begin
   Sueldo.TabStop := True ;
   Sueldo.ReadOnly := False ;
   Sueldo.Color := clWindow ;
  end
 else
  begin
   Sueldo.TabStop := False ;
   Sueldo.ReadOnly := True ;
   Sueldo.Color := clMenu ;
  end ;

 if QPsto.FieldByName('Profe').AsString <> 'N' then
  begin
   Docen.TabStop := True ;
   Docen.ReadOnly := False ;
   Docen.Color := clWindow ;
  end
 else
  begin
   Docen.TabStop := False ;
   Docen.ReadOnly := True ;
   Docen.Color := clMenu ;
  end ;

 if modo= 2 then
  begin
   qVal.Close ;
   qVal.Sql.Clear ;
   qVal.DataSource := ModDs ;
   qVal.Sql.Add('SELECT COUNT(*) As cnt') ;
   qVal.Sql.Add('FROM PhPAGOS') ;
   qVal.Sql.Add('WHERE rownum= 1') ;
   qVal.Sql.Add( 'And PAGO_NOMB IN') ;
   qVal.Sql.Add( '(SELECT NOMB_NOMB') ;
   qVal.Sql.Add(  'FROM PhNombram') ;
   qVal.Sql.Add(  'Where NOMB_Plaza= :VPLA_Plaza)') ;
   qVal.Sql.Add('And PAGO_FecCancel is null') ;
   qVal.Open ;
   if qVal['Cnt'] <> 0 then
    begin
     PstoH.ReadOnly := True ;
     PstoH.TabStop := False ;
     PstoH.Color := clMenu ;

     Horas.ReadOnly := True ;
     Horas.TabStop := False ;
     Horas.Color := clMenu ;
    end ;
   qVal.Close ;
   qVal.DataSource := nil ;
  end ;
end ;

procedure TFDetalle.DesIniVar ;
begin
 if FModulo.Query1.FieldByName('VPLA_PLAZA').IsNull then
 begin
  QVal.Close ;
  QVal.Sql.Clear ;
  QVal.Sql.Add('Select PSQPlazas.NextVal As Sigue From Dual') ;
  QVal.Open ;
  FModulo.Query1['VPLA_Plaza'] := QVal['Sigue'] ;

{ FModulo.Query1['VPLA_Empl'] := qNomb.FieldByName('Empl').AsString ;
 FModulo.Query1['VPLA_Nombre'] := qNomb.FieldByName('Nombre').AsString ;}

 end ;

end ;

{procedure TFDetalle.cVNomb(Sender : TField) ;
begin
 qNomb.DatabaseName := 'Sistema';
 qNomb.Close ;
 qNomb.Open ;
end ;}


procedure TFDetalle.PstoChange(Sender : TField) ;
begin
 QPsto.Close ;
 QPsto.Open ;

// Checamos Sueldo Alterno

 if QPsto.FieldByName('Pues_Suel_Alt').AsString = 'S' then
  begin
   Sueldo.TabStop := True ;
   Sueldo.ReadOnly := False ;
   Sueldo.Color := clWindow ;
  end
 else
  begin
   Sueldo.TabStop := False ;
   Sueldo.ReadOnly := True ;
   Sueldo.Color := clMenu ;
   CalcSueldo(Sender) ;
  end ;

// Checamos si es Profesor

 if QPsto.FieldByName('Profe').AsString <> 'N' then
  begin
   Docen.TabStop := True ;
   Docen.ReadOnly := False ;
   Docen.Color := clWindow ;
  end
 else
  begin
   FModulo.Query1.FieldByName('VPLA_Docen').Clear ;
   Docen.TabStop := False ;
   Docen.ReadOnly := True ;
   Docen.Color := clMenu ;
  end ;


// Checamos x Horas

 if QPsto.FieldByName('Pues_FPago').AsString = 'H' then
  begin
   Horas.TabStop := True ;
   horas.ReadOnly := False ;
   horas.Color := clWindow ;
  end
 else
  begin
   horas.TabStop := False ;
   horas.ReadOnly := True ;
   horas.Color := clMenu ;
   FModulo.Query1.FieldByName('VPLA_horas').Clear ;
  end ;
end ;

procedure TFDetalle.CalcSueldo(Sender : TField) ;
var sueldo : Currency ;
 horas : Integer ;
begin
 if QPsto.FieldByName('Pues_Suel_Alt').AsString = 'S'
 then exit ;

 sueldo := QPsto.FieldByName('Sueldo').AsCurrency ;
 horas := FModulo.Query1.FieldByName('VPLA_horas').AsInteger ;

 if QPsto.FieldByName('Pues_FPago').AsString = 'H'
 then FModulo.Query1['VPLA_Sldo'] := sueldo * horas
 else FModulo.Query1['VPLA_Sldo'] := sueldo ;

end ;

procedure TFDetalle.GrabaDetalle ;
begin

// Grabamos la Distribucion x Programa

 QDDetalle.ExecSql ;
 QDetalle.First ;
 QIDetalle.ParamByName('PLAZA').AsInteger := FModulo.Query1.FieldByName('VPLA_Plaza').AsInteger ;


 While not QDetalle.eof do
 begin

  //SHOWMESSAGE(QIDetalle.ParamByName('PLAZA').AsSTRING);
  // & 'X' & :SFdo, :Prog, :URes, :Porc);
  QIDetalle.ExecSql ;
  QDetalle.next ;
 end ;

 Paginas.ActivePage := TabPlaza ;

// Revisamos Porcentajes
 QValPorcs.ExecSql ;
  //   SHOWMESSAGE('HOLA-2');

end ;


function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 if result= 'Prog' then
 with VSql do
 begin
  Add('SELECT');
  Add(' Prog_Prog As Prog,'  );
  Add(' Prog_Descrip As Descripcion,' );
  Add(' Prog_Funcion As Funcion' );
  Add('From FProgram');
  Add('Where Prog_Ent_Data= ''S'' ' );
//  Add(' And Prog_Funcion <> ''01'' ' );
 end ;

 if result= 'Categ' then with VSql do
  begin
   Add('SELECT');
   Add(' CPUE_Categ As Categoria,'  );
   Add(' CPUE_Descrip As Descripcion' );
   Add('From PhCPUESTOS');
   Add('Where CPUE_Psto= '''+ PstoH.Text+ '''' );
   SHOWMESSAGE(vsql.text);
  end ;

 if result= 'Reempla' then
 with VSql do
 begin
{  Add('SELECT');
  Add(' VNOM_Nomb As Nomb,'  );
  Add(' VNOM_Empl As Empl,' );
  Add(' VNOM_Nombre As Nombre,' );
  Add(' VNOM_Descrip As Descripcion,' );
  Add(' VNOM_Ures As Ures,' );
  Add(' URES_Descrip As Unidad_Resp,' );
  Add(' VNOM_Psto As Psto,' );
  Add(' PUES_Descrip As Puesto' );
  Add('From PVNombram, FURES, PPUESTOS');
  Add('Where URES_Ures = VNOM_Ures' );
  Add(' and PUES_Psto = VNOM_Psto' );
  Add(' and PUES_Profe = ''' + 'S' + '''' );  }

  add('Select');
  add(' nomb_nomb as Nomb,');
  add(' Substr(pers_nombre || ''' + ' ' + ''' || pers_apepat || ''' + ' ' + ''' || pers_apemat,1,50) As Nombre,');
  add(' nomb_empl As Cve_Empl,');
  add(' nomb_descrip As Puesto,');
  add(' ures_descrip As Ures,');
  add(' plaz_horas As Horas,');
  add(' atre_promep As Promep');
  add('from phnombram, fpersonas, phplazas, phpuestos, fures, patrempl');
  add('where plaz_plaza = nomb_plaza');
  add(' and pers_persona = nomb_empl');
  add(' and pues_psto = plaz_psto');
  add(' and pues_PROFE = ''' + 'S' + '''');
  add(' and ures_ures = plaz_ures');
  add(' and atre_empl = pers_persona');

 end ;

end ;


function TFDetalle.RCampo(Sender : TField) : String ;
begin
 VSql.Clear ;
 result := copy(Sender.FieldName,6,30) ;

 if result= 'CATEG' then with VSql do
  begin
   Add('SELECT');
   Add(' CPUE_Categ As Categoria,'  );
   Add(' CPUE_Descrip As Descripcion' );
   Add('From PhCPUESTOS');
   Add('Where CPUE_Psto= '''+
    FModulo.Query1.FieldByName('VPLA_Psto').AsString+ '''' );
  end ;
end ;


procedure TFDetalle.ReemplaExit(Sender: TObject);
begin
  inherited;

 QReempla.Close ;
 QReempla.Open ;

 If Qreempla.RecordCount = 1 then
  begin
   Nombre.Text  := Qreempla.Fields.FieldByName('Nombre').AsString;
   UresReem.Text := Qreempla.Fields.FieldByName('UresReem').AsString;
   PstoReem.Text  := Qreempla.Fields.FieldByName('LPsto').AsString;
  end
 else
  begin
   Nombre.Text  := '';
   UresReem.Text := '';
   PstoReem.Text  := '';
  end;

end;

procedure TFDetalle.GrabaUpdate ;
begin
 QUpdate.ExecSql ; // Ejecutamos el Update
 GrabaDetalle;
end ;

procedure TFDetalle.GrabaInsert ;
begin
// SHOWMESSAGE(QINSERT.SQL.TEXT);
 QInsert.ExecSql ; // Ejecutamos el Insert
 GrabaDetalle;
end ;


end.
