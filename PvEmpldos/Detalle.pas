unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, ExtDlgs, Datos, JPEG;

  type
  TFDetalle = class(TPFDetalle)
    ODFoto: TOpenPictureDialog;
    QId: TQuery;
    QFoto: TQuery;
    CargaFoto: TBitBtn;
    Panel1: TPanel;
    Foto: TImage;
    PageControl1: TPageControl;
    TabGral: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    RFC: TDBEdit;
    Sexo: TDBComboBox;
    Nombre: TDBEdit;
    ApePat: TDBEdit;
    ApeMat: TDBEdit;
    Direccion: TDBMemo;
    Telefono: TDBEdit;
//    CargaFoto: TBitBtn;
    Panel2: TPanel;
//    Foto: TImage;
    Usuario: TDBEdit;
    Persona: TDBEdit;
    LVEMP_USUARIO: TEdit;
    FNACI: TDBEdit;
    EDOCIV: TDBEdit;
    LVEMP_EDOCIV: TEdit;
    TabAtribs: TTabSheet;
    Label25: TLabel;
    SPIUJAT: TDBCheckBox;
    IMPRESA: TDBCheckBox;
    PROMEP: TDBCheckBox;
    ESTA: TDBEdit;
    LVEMP_ESTA: TEdit;
    EXPED: TDBCheckBox;
    TabCateg: TTabSheet;
    dbgCateg: TDBCtrlGrid;
    Label10: TLabel;
    Label15: TLabel;
    Categ: TDBEdit;
    Psto: TDBEdit;
    CDescrip: TDBEdit;
    LPsto: TDBEdit;
    TabSheet2: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    Label39: TLabel;
    Label40: TLabel;
    Categ2: TDBEdit;
    CPDescrip2: TDBEdit;
    Psto2: TDBEdit;
    CDescrip2: TDBEdit;
    TabSheet1: TTabSheet;
    RadioGroup2: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Honorario: TDBCheckBox;
    Lisraya: TDBCheckBox;
    ReciboFol: TDBCheckBox;
    Aguinaldo: TDBCheckBox;
    Primavac: TDBCheckBox;
    Dias31: TDBCheckBox;
    Bononav: TDBCheckBox;
    Panel4: TPanel;
    Label38: TLabel;
    DiasAgui: TDBEdit;
    Button2: TButton;
    RadioGroup3: TRadioGroup;
    Calcisr: TDBCheckBox;
    RadioGroup4: TRadioGroup;
    ServMed: TDBCheckBox;
    Label24: TLabel;
    CURP: TDBEdit;
    Label11: TLabel;
    Label30: TLabel;
    Label41: TLabel;
    CIUD_NACI: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    CVEPAIS_NACI: TDBEdit;
    LVEMP_CVEPAIS_NACI: TEdit;
    Label26: TLabel;
    NUMSS: TDBEdit;
    Label6: TLabel;
    CONTACTOS: TDBMemo;
    Label44: TLabel;
    EMAIL: TDBEdit;
    OBSERVA: TDBMemo;
    Label45: TLabel;
    Label14: TLabel;
    CVESTA: TDBEdit;
    LVEMP_CVESTA: TEdit;
    TabSheet3: TTabSheet;
    Label36: TLabel;
    Label19: TLabel;
    FINGRESO: TDBEdit;
    Label32: TLabel;
    FHINGRESO: TDBEdit;
    Label35: TLabel;
    FJUBILA: TDBEdit;
    Label12: TLabel;
    LAntig: TLabel;
    Label37: TLabel;
    Label31: TLabel;
    FINGRESOD: TDBEdit;
    Label33: TLabel;
    FHINGRESOD: TDBEdit;
    Label34: TLabel;
    FJUBILAD: TDBEdit;
    Label17: TLabel;
    LAntigD: TLabel;
    Activo: TDBCheckBox;
    Label47: TLabel;
    COLON_DOMI: TDBMemo;
    Label48: TLabel;
    Label28: TLabel;
    BancoD: TDBEdit;
    LVEMP_BancoD: TEdit;
    Label16: TLabel;
    CtaBco: TDBEdit;
    Label29: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    ESCOL: TDBEdit;
    DESCRIP: TDBEdit;
    LVEMP_ESCOL: TEdit;
    Label46: TLabel;
    ABREVIA: TDBEdit;
    Label23: TLabel;
    Label49: TLabel;
    CvUres2: TDBEdit;
    CUres2: TDBEdit;
    CVEMUNI_NA: TDBEdit;
    LVEMP_CVEMUNI_NA: TEdit;
    CVEMUNI_DO: TDBEdit;
    LVEMP_CVEMUNI_DO: TEdit;
    UBICA: TDBEdit;
    UBICA_D: TDBEdit;
    STATUS: TDBEdit;
    StatusExp: TLabel;
//    QFoto: TQuery;
//    ODFoto: TOpenPictureDialog;
//    QId: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure CargaFotoClick(Sender: TObject);
    procedure Inivar ; override ;
    procedure DesInivar ; override ;
    function rnombre : String ; override ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrabaInsert ; override ;
    procedure GrabaUpdate ; override ;
    procedure GrabaDetalle ; override;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

uses Repo;

//uses Repo;

{$R *.DFM}

var
 hayfoto : Boolean ;
 Data : TdmDatos ;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 Data := TdmDatos.Create(FDetalle) ;
 inherited ;
 Width := 728 ;
 Height := 570 ;

 if modo= 1
 then CargaFoto.Enabled := False ;
 dbgCateg.DataSource := data.dsCateg ;

 LAntig.Caption := FModulo.Query1.FieldByName('VEMP_AntigAnios').AsString+
  ' Años '+ FModulo.Query1.FieldByName('VEMP_AntigDias').AsString+ ' Dias' ;

 LAntigD.Caption := FModulo.Query1.FieldByName('VEMP_AntigDAnios').AsString+
  ' Años '+ FModulo.Query1.FieldByName('VEMP_AntigDDias').AsString+ ' Dias' ;
end;


procedure TFDetalle.Inivar ;
var   mjpg : TJPEGImage ;
begin
 if Data.ModDs.DataSet= nil
 then Data.ModDs.DataSet := FModulo.Query1 ;

 PageControl1.ActivePage := TabGral ;

 if Fmodulo.Query1.FieldByName('VEMP_Sexo').AsString= 'F'
 then sexo.ItemIndex := 1
 else sexo.ItemIndex := 0 ;

 hayfoto := False ;

 if modo= 3 then
  begin
   FModulo.Query1['VEMP_Activo'] := 'S' ;
   Fmodulo.Query1['VEMP_Impresa']:= 'N' ;
   Fmodulo.Query1['VEMP_SPIUJAT']:= 'N' ;
   Fmodulo.Query1['VEMP_PROMEP']:= 'N' ;
   Fmodulo.Query1['VEMP_HONORARIOA']:= 'N' ;
   Fmodulo.Query1['VEMP_LISRAYA']:= 'N' ;
   Fmodulo.Query1['VEMP_RECIBOFOL']:= 'N' ;
   Fmodulo.Query1['VEMP_CALCISR']:= 'N' ;
   Fmodulo.Query1['VEMP_AGUINALDO']:= 'N' ;
   Fmodulo.Query1['VEMP_PRIMAVAC']:= 'N' ;
   Fmodulo.Query1['VEMP_DIAS31']:= 'N' ;
   Fmodulo.Query1['VEMP_BONONAV']:= 'N' ;
   Foto.Picture := nil ;
  end
 else begin

  QFoto.ParamByName('Persona').AsString := FModulo.Query1['VEMP_EMPL'] ;
  QFoto.Close ;
  QFoto.Open ;

  if not QFoto.EOF then
   begin
    hayfoto := True ;
    mjpg := TJPEGImage.Create ;
    if FileExists('45e#tmp.JPG')
    then DeleteFile('45e#tmp.JPG') ;
    TBlobField(QFoto.FieldByName('Pers_Foto')).SaveToFile('45e#tmp.JPG');
    mjpg.LoadFromFile('45e#tmp.JPG');
    Foto.Picture.assign(mjpg) ;
    mjpg.Free ;
   end ;

  if modo= 1 then
   begin
    Psto.Color := clMenu ;
    Categ.Color := clMenu ;
    Psto2.Color := clMenu ;
    Categ2.Color := clMenu ;
   end ;

 end ;

 Data.qCateg.Open ;
 Data.qCateg2.Open ;
end ;

procedure TFDetalle.DesInivar ;
begin
 if sexo.ItemIndex= 1
 then FModulo.Query1['VEMP_Sexo'] := 'F'
 else FModulo.Query1['VEMP_Sexo'] := 'M' ;

 if FModulo.Query1.FieldByName('VEMP_EMPL').IsNull then
  begin
   QId.Close ;
   QID.Open ;
   FModulo.Query1.FieldByName('VEMP_EMPL').AsInteger := QID['ID'] ;
  end ;

 if hayfoto
 then data.qIFoto.ParamByName('Foto').LoadFromFile('45e#tmp.JPG', ftBlob)
 else data.qIFoto.ParamByName('Foto').AsString := Chr(0) ;
end ;




procedure TFDetalle.CargaFotoClick(Sender: TObject);
var mjpg : TJPEGImage ;
begin
  inherited;
 if ODFoto.Execute then
 begin
  mjpg := TJPEGImage.Create ;
  mjpg.LoadFromFile(ODFoto.FileName);
  Foto.Picture.assign(mjpg);
  if FileExists('45e#tmp.JPG')
  then DeleteFile('45e#tmp.JPG') ;
  mjpg.SaveToFile('45e#tmp.JPG') ;
  mjpg.Free ;
  FModulo.Query1.Edit;
  hayfoto := True ;
 end;
end;


procedure TFDetalle.GrabaDetalle ;
begin
  inherited;

// Foto
 data.qIFoto.ExecSQL ;

// Categorias
 Data.QDCateg.ExecSql ;
 Data.QICateg.ParamByName('Empl').AsString := FModulo.Query1['VEMP_Empl'] ;
 Data.qCateg.First ;
 while not Data.qCateg.Eof do
 begin
  Data.QICateg.ExecSql ;
  Data.qCateg.Next ;
 end ;

// Categorias2
// Data.QDCateg.ExecSql ;
// Data.QICateg.ParamByName('Empl').AsString := FModulo.Query1['VEMP_Empl'] ;
// Data.qCateg2.First ;
// while not Data.qCateg2.Eof do
// begin
//  Data.QICateg.ExecSql ;
//  Data.qCateg.Next ;
// end ;


end ;

function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;
 if result= 'Categ' then
  begin
   VSql.Add('Select CPUE_Categ, CPUE_Descrip') ;
   VSql.Add('From PCPUESTOS') ;
   VSql.Add('Where CPUE_Psto= '''+ Data.qCategPSTO.AsString+ '''') ;
  end ;
end ;


procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Data.Free ;
 inherited;
end;


procedure TFDetalle.GrabaInsert ;
begin

   qInsert.ExecSql ;
   GrabaDetalle ;

end;

procedure TFDetalle.GrabaUpdate ;
begin

   qUpdate.ExecSql ;
   GrabaDetalle ;

end;


procedure TFDetalle.Button2Click(Sender: TObject);
begin
  inherited;

  Panel4.Visible := Not panel4.Visible

end;
end.
