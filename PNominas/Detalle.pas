        unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, Buttons, DBCGrids ;

type
  TFDetalle = class(TPFDetalle)
    CalNomRet: TStoredProc;
    CalNomExt: TStoredProc;
    CalNomCom: TStoredProc;
    Paginas: TPageControl;
    TabNom: TTabSheet;
    TabEstad: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Nomina: TDBEdit;
    Descrip: TDBEdit;
    Banco: TDBEdit;
    Fecha: TDBEdit;
    LNOMI_Banco: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    Neto: TDBEdit;
    Dedus: TDBEdit;
    Percs: TDBEdit;
    Ambos: TDBEdit;
    Bevel2: TBevel;
    Total: TDBEdit;
    QEstad: TQuery;
    DSEstad: TDataSource;
    QEstadPERCS: TFloatField;
    QEstadDEDUS: TFloatField;
    QEstadAMBOS: TFloatField;
    QEstadNETO: TFloatField;
    QEstadTOTAL: TFloatField;
    TabDetalle: TTabSheet;
    TabsDetalle: TTabControl;
    QCxP: TQuery;
    QPercep: TQuery;
    QAmbos: TQuery;
    QNeto: TQuery;
    DSSale: TDataSource;
    QNetoURES: TStringField;
    QNetoTOTAL: TFloatField;
    QURes: TQuery;
    QNetoLURes: TStringField;
    QConcepto: TQuery;
    QCxPCONP: TStringField;
    QCxPTOTAL: TFloatField;
    QCxPLConcepto: TStringField;
    QConPerc: TQuery;
    QPercepCONP: TStringField;
    QPercepTOTAL: TFloatField;
    QPercepLConp: TStringField;
    QConcAmb: TQuery;
    QAmbosCONP: TStringField;
    QAmbosTOTAL: TFloatField;
    QAmbosLConp: TStringField;
    DBGrid1: TDBGrid;
    qxBanco: TQuery;
    qGPresup: TQuery;
    qxBancoBanco: TStringField;
    qxBancoMonto: TCurrencyField;
    qGPresupSFdo: TStringField;
    qGPresupProg: TStringField;
    qGPresupURes: TStringField;
    qGPresupMonto: TCurrencyField;
    Contab: TDBCheckBox;
    qPolizas: TQuery;
    qPolizasPOLN_Polid: TFloatField;
    qPolizasPOLI_Descrip: TStringField;
    qPolizasPOLI_TipDoc: TStringField;
    qxBancoDescrip: TStringField;
    LFecFin: TLabel;
    FecIni: TDBEdit;
    CalNomOrd: TStoredProc;
    TabMovis: TTabSheet;
    dbcgMovis: TDBCtrlGrid;
    Label6: TLabel;
    MoviE: TDBEdit;
    LMovi: TDBEdit;
    qMovis: TQuery;
    dsMovis: TDataSource;
    qMovisNOME_Movi: TFloatField;
    qiMovis: TQuery;
    qdetMovis: TQuery;
    qMovisLMovi: TStringField;
    Label9: TLabel;
    Tipo: TDBComboBox;
    MainMenu2: TMainMenu;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure GrabaInsert ; override ;
    procedure TabsDetalleChange(Sender: TObject);
    procedure vTipo (Sender : TField) ;

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
  inherited;
  Height := 400 ;
  Width :=  570 ;
  paginas.ActivePage := TabNom ;
  FModulo.Query1.FieldByName('NOMI_Tipo').OnValidate := vTipo ;
end;

procedure TFDetalle.Inivar ;
begin

 if modo <> 1 then
  begin
   TabEstad.TabVisible := False ;
   TabDetalle.TabVisible := False ;
  end
 else
  begin
   QEstad.Open ;
   QNeto.Open ;
   QCxP.Open ;
   QPercep.Open ;
   QAmbos.Open ;
   qxBanco.Open ;
   qGPresup.Open ;
   qPolizas.Open ;
  end ;


 if modo= 3 then
  begin

   FModulo.Query1.FieldByName('NOMI_Tipo').AsString := 'O' ;
   Tipo.Text := 'Ordinaria';
   FModulo.Query1.FieldByName('NOMI_Contab').AsString := 'N' ;
  end
 else
  begin
   Tipo.ReadOnly := True ;
   Tipo.Color := clMenu ;
   Tipo.TabStop := False ;

    if FModulo.Query1.FieldByName('NOMI_Tipo').AsString = 'O' then
      Tipo.Text := 'Ordinaria'
   else
    if FModulo.Query1.FieldByName('NOMI_Tipo').AsString = 'C' then
      Tipo.Text := 'Complementaria'
    else
      if FModulo.Query1.FieldByName('NOMI_Tipo').AsString = 'E' then
         Tipo.Text := 'Extraordinaria'
      else
         if FModulo.Query1.FieldByName('NOMI_Tipo').AsString = 'R' then
            Tipo.Text := 'Recalculo';



  end ;

 cadena := FModulo.Query1.FieldByName('NOMI_Tipo').AsString;
 TabMovis.TabVisible := Cadena= 'E' ;
 qMovis.Open ;
end ;

procedure TFDetalle.DesInivar ;
begin
 if FModulo.Query1.FieldByName('NOMI_Nomina').IsNull then
 begin
  QVal.Close ;
  QVal.Sql.Clear ;
  QVal.Sql.Add('Select PSQNomina.NextVal As Sigue From Dual') ;
  QVal.Open ;
  FModulo.Query1['NOMI_Nomina'] := QVal['Sigue'] ;
  QVal.Close ;
 end ;

end ;

procedure TFDetalle.GrabaInsert ;
var mm : String ;
 Calcula : TStoredProc ;
 hora : TDateTime ;
begin
 case tipo.ItemIndex of
   -1 :
    begin
     mm := 'Generando Nomina Ordinaria...' ;
     Calcula := CalNomOrd ;
    end ;

   0 :
    begin
     mm := 'Generando Nomina Ordinaria...' ;
     Calcula := CalNomOrd ;
    end ;
   1 :
    begin
     mm := 'Generando Nomina Complementaria...' ;
     Calcula := CalNomCom ;
    end ;
   2 :
    begin
     mm := 'Generando Nomina Extraordinaria...' ;
     Calcula := CalNomExt ;
    end ;

  else
   begin
    mm := 'Generando Nomina de Recalculo...' ;
    Calcula := CalNomRet ;
   end ;
 end ;

 qMovis.First ;
 Calcula.ParamByName('NOMINA').AsInteger := FModulo.Query1['NOMI_Nomina'] ;
 qiMovis.ParamByName('Nomina').AsInteger := FModulo.Query1['NOMI_Nomina'] ;

 caption := mm ;
 hora := Time ;

 try
  QInsert.ExecSql ;
  if FModulo.Query1['NOMI_Tipo']= 'E' then
   while not qMovis.eof do
    begin
     qiMovis.ExecSql ;
     qMovis.Next ;
    end ;

  Calcula.Prepare ;
  Calcula.ExecProc ;
  modo := 2 ;
 finally
  caption := 'Insertar Nominas' ;
 end ;
 showmessage(TimeToStr(hora)+ ' ---> '+ TimeToStr(Time)) ;

end ;

procedure TFDetalle.TabsDetalleChange(Sender: TObject);
begin
  inherited;
 case TabsDetalle.TabIndex of
  0 : DSSale.DataSet := QNeto ;
  1 : DSSale.DataSet := QCxP ;
  2 : DSSale.DataSet := QPercep ;
  3 : DSSale.DataSet := QAmbos ;
  4 : DSSale.DataSet := qxBanco ;
  5 : DSSale.DataSet := qGPresup ;
  6 : DSSale.DataSet := qPolizas ;
 end ;

end;

procedure TFDetalle.vTipo (Sender: TField) ;
var TNomi : Char ;
begin
 TNomi := Sender.AsString[1] ;
 if TNomi in ['O','C'] then
  begin
   FecIni.TabStop := False ;
   FecIni.Color := clMenu ;
   FecIni.ReadOnly := True ;
  end
 else
  begin
   FecIni.TabStop := True ;
   FecIni.Color := clWindow ;
   FecIni.ReadOnly := False ;
  end ;

 TabMovis.TabVisible := Tnomi= 'E' ;

end ;


end.

