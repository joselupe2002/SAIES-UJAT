unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Datos, JPEG ;

type
  TFDetalle = class(TPFDetalle)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Nomb: TDBEdit;
    Tipo: TDBRadioGroup;
    Label3: TLabel;
    Plaza: TDBEdit;
    Label16: TLabel;
    NombT: TDBEdit;
    Label2: TLabel;
    Empl: TDBEdit;
    LVNOM_Empl: TEdit;
    Label12: TLabel;
    Categ: TDBEdit;
    LVNOM_Categ: TEdit;
    Label9: TLabel;
    NomIni: TDBEdit;
    Susp: TDBCheckBox;
    SPIUJAT: TDBCheckBox;
    Label10: TLabel;
    NomFin: TDBEdit;
    Label19: TLabel;
    SSueldo: TDBEdit;
    Label4: TLabel;
    Descrip: TDBEdit;
    Label13: TLabel;
    Texto: TDBMemo;
    Label1: TLabel;
    Label5: TLabel;
    URes: TDBEdit;
    LVNOM_URes: TEdit;
    Label17: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    TPsto: TDBEdit;
    Psto: TDBEdit;
    Horas: TDBEdit;
    PIni: TDBEdit;
    LVNOM_TPsto: TEdit;
    LVNOM_Psto: TEdit;
    Sueldo: TDBEdit;
    PFin: TDBEdit;
    Label8: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ReemEmpl: TDBEdit;
    ReemIni: TDBEdit;
    ReemNombre: TDBEdit;
    Label23: TLabel;
    ReemFin: TDBEdit;
    Label20: TLabel;
    DIRIGIDO: TDBEdit;
    LVNOM_DIRIGIDO: TEdit;
    Label24: TLabel;
    COPIAU: TDBEdit;
    LVNOM_COPIAU: TEdit;
    Label25: TLabel;
    COPIAD: TDBEdit;
    LVNOM_COPIAD: TEdit;
    Label26: TLabel;
    COPIAT: TDBEdit;
    LVNOM_COPIAT: TEdit;
    Label27: TLabel;
    Cont: TDBEdit;
    Label28: TLabel;
    Fechalabel: TLabel;
    Fecha: TDBEdit;
    QFoto: TQuery;
    Panel1: TPanel;
    Foto: TImage;
    TabSheet3: TTabSheet;
    Label29: TLabel;
    Banco_N: TDBEdit;
    LVNom_Banco_Nom: TEdit;
    Label30: TLabel;
    CBanc: TDBEdit;
    Label31: TLabel;
    BancoD: TDBEdit;
    LVNOM_BancoD: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Ingreso: TDBEdit;
    Label36: TLabel;
    Baja: TDBEdit;
    PROMEP: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    procedure CEmpl(Sender : TField) ;
    function  RNombre : String ; override ;
    function RCampo(Sender : TField) : String ; override ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cCateg(Sender : TField) ;
    procedure cTipo(Sender : TField) ;
    procedure cReem(Sender : TField) ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

{$R *.DFM}

var
 Data : TdmDatos ;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 Data := TdmDatos.Create(FDetalle) ;
 inherited;
 Height := 716 ;
 Width :=  554 ;
 FModulo.Query1.FieldByName('VNOM_Tipo').OnValidate := cTipo ;
 FModulo.Query1.FieldByName('VNOM_Plaza').OnValidate := cEmpl ;
 FModulo.Query1.FieldByName('VNOM_Empl').OnValidate := cEmpl ;
 FModulo.Query1.FieldByName('VNOM_SSueldo').OnValidate := cCateg ;
 Fmodulo.Query1.FieldByName('VNOM_Categ').OnValidate := cCateg ;
 Fmodulo.Query1.FieldByName('VNOM_Reem').OnValidate := cReem ;
end;



procedure TFDetalle.Inivar ;
var   mjpg : TJPEGImage ;
begin
 if Data.ModDs.DataSet= nil
 then Data.ModDs.DataSet := FModulo.Query1 ;

 if modo= 3 then begin
  FModulo.Query1['VNOM_Tipo'] := 'T' ;
  FModulo.Query1['VNOM_Susp'] := 'N' ;
  FModulo.Query1['VNOM_SPIUJAT'] := 'N' ;
  FModulo.Query1['VNOM_SSueldo'] := 0 ;
 end ;
 data.QPlaza.Open ;

 cTipo(nil) ;

 if modo= 2 then
  begin
   qVal.Close ;
   qVal.Sql.Clear ;
   qVal.DataSource := ModDs ;
   qVal.Sql.Add('SELECT COUNT(*) As Cnt') ;
   qVal.Sql.Add('FROM PePAGOS') ;
   qVal.Sql.Add('WHERE PAGO_NOMB= :VNOM_Nomb') ;
   qVal.Sql.Add( 'And PAGO_FecCancel is null') ;
   qVal.Sql.Add( 'And rownum= 1') ;
   qVal.Open ;
   if qVal['Cnt'] <> 0 then
    begin
     Tipo.TabStop := False ;
     Tipo.ReadOnly := True ;
     Tipo.Color := clMenu ;

     Plaza.TabStop := False ;
     Plaza.ReadOnly := True ;
     Plaza.Color := clMenu ;

     NombT.TabStop := False ;
     NombT.ReadOnly := True ;
     NombT.Color := clMenu ;

     Empl.TabStop := False ;
     Empl.ReadOnly := True ;
     Empl.Color := clMenu ;

     NomIni.TabStop := False ;
     NomIni.ReadOnly := True ;
     NomIni.Color := clMenu ;
    end ;
   qVal.DataSource := nil ;
  end ;
 cCateg(nil) ;
 cReem(nil) ;


//FOTOS
IF MODO <> 3 THEN
 BEGIN
  QFoto.ParamByName('Persona').AsString := FModulo.Query1['VNOM_EMPL'] ;
  QFoto.Close ;
  QFoto.Open ;

  if not QFoto.EOF then
   begin
    mjpg := TJPEGImage.Create ;
    if FileExists('46e#tmp.JPG')
    then DeleteFile('46e#tmp.JPG') ;
    TBlobField(QFoto.FieldByName('Pers_Foto')).SaveToFile('46e#tmp.JPG');
    mjpg.LoadFromFile('46e#tmp.JPG');
    Foto.Picture.assign(mjpg) ;
    mjpg.Free ;
   end ;
 END;
end ;

procedure TFDetalle.DesInivar ;
begin
 if FModulo.Query1.FieldByName('VNOM_NOMB').IsNull then
 begin
  QVal.Close ;
  QVal.Sql.Clear ;
  QVal.Sql.Add('Select PSQNombram.NextVal As Sigue From Dual') ;
  QVal.Open ;
  FModulo.Query1['VNOM_Nomb'] := QVal['Sigue'] ;
 end ;

// Completamos datos de la Vista
 FModulo.Query1['VNOM_Nombre'] := LVNOM_Empl.Text ;
end ;


procedure TFDetalle.cCateg(Sender : TField) ;
begin
 data.qDescCateg.Close ;
 data.qDescCateg.Open ;
 if modo <> 1 then
 FModulo.Query1['VNOM_Sldo'] :=
  data.qDescCateg.FieldByName('Sueldo').AsCurrency +
   FModulo.Query1.FieldByName('VNOM_SSueldo').AsCurrency ;
// FModulo.Query1['VNOM_Sldo'] :=  data.qPlaza.FieldByName('Sueldo').AsCurrency +
//  FModulo.Query1.FieldByName('VNOM_SSueldo').AsCurrency ;
end ;


procedure TFDetalle.cTipo(Sender : TField) ;
begin
 if modo= 1
 then exit ;

 if FModulo.Query1.FieldByName('VNOM_Tipo').AsString= 'T' then
  begin
   FModulo.Query1.FieldByName('VNOM_Reem').Clear ;
   Plaza.TabStop := True ;
   Plaza.ReadOnly := False ;
   Plaza.Color := clWindow ;

   NombT.TabStop := False ;
   NombT.ReadOnly := True ;
   NombT.Color := clMenu ;
  end
 else
  begin
   Plaza.TabStop := False ;
   Plaza.ReadOnly := True ;
   Plaza.Color := clMenu ;

   NombT.TabStop := True ;
   NombT.ReadOnly := False ;
   NombT.Color := clWindow ;
  end ;
end ;

procedure TFDetalle.cReem(Sender : TField) ;
begin
 data.qReem.Close ;
 data.qReem.Open ;
 if modo <> 3
 then exit ;
 if not data.qReem.Eof
 then FModulo.Query1.FieldByName('VNOM_Plaza').AsInteger :=
  data.qReem.FieldByName('Plaza').AsInteger
 else FModulo.Query1.FieldByName('VNOM_Plaza').Clear ;
end ;


procedure TFDetalle.cEmpl(Sender : TField) ;
begin
 data.qPlaza.Close ;
 data.qPlaza.Open ;

 FModulo.Query1['VNOM_SFdo'] := data.qPlaza.FieldByName('SFdo').AsString ;
 if data.qPlaza.FieldByName('Horas').IsNull
 then FModulo.Query1.FieldByName('VNOM_Horas').Clear
 else FModulo.Query1['VNOM_Horas'] := data.qPlaza.FieldByName('Horas').AsFloat ;
// FModulo.Query1['VNOM_PIni'] := data.qPlaza.FieldByName('PIni').AsDateTime ;
// FModulo.Query1['VNOM_PFin'] := data.qPlaza.FieldByName('PFin').AsDateTime ;
 FModulo.Query1['VNOM_URes'] := data.qPlaza.FieldByName('URes').AsString ;
 FModulo.Query1['VNOM_Psto'] := data.qPlaza.FieldByName('Psto').AsString ;
 FModulo.Query1['VNOM_Categ'] := data.qPlaza.FieldByName('Categ').AsString ;
end ;

function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 if result= 'Categ' then with VSql do
  begin
   Add('SELECT');
   Add(' CPUE_Categ As Categoria,'  );
   Add(' CPUE_Descrip As Descripcion' );
   Add('From PCPUESTOS');
   Add('Where CPUE_Psto= '''+ Psto.Text+ '''' );
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
   Add('From PCPUESTOS');
   Add('Where CPUE_Psto= '''+
    FModulo.Query1.FieldByName('VNOM_Psto').AsString+ '''' );
  end ;
end ;


procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Data.Free ;
 inherited;
end;

end.
