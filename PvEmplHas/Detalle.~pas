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
    Persona: TDBEdit;
    FNACI: TDBEdit;
    EDOCIV: TDBEdit;
    LVEMP_EDOCIV: TEdit;
    TabAtribs: TTabSheet;
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
    Aguinaldo: TDBCheckBox;
    Primavac: TDBCheckBox;
    Dias31: TDBCheckBox;
    Bononav: TDBCheckBox;
    Panel4: TPanel;
    Label38: TLabel;
    DiasAgui: TDBEdit;
    RadioGroup3: TRadioGroup;
    Calcisr: TDBCheckBox;
    RadioGroup4: TRadioGroup;
    ServMed: TDBCheckBox;
    Label24: TLabel;
    CURP: TDBEdit;
    Label42: TLabel;
    Label26: TLabel;
    NUMSS: TDBEdit;
    DESCJUDI: TDBMemo;
    Label44: TLabel;
    EMAIL: TDBEdit;
    DEP_ECO: TDBMemo;
    TabSheet3: TTabSheet;
    Label17: TLabel;
    LAntigD: TLabel;
    Label47: TLabel;
    COLON_DOMI: TDBMemo;
    Label48: TLabel;
    Label28: TLabel;
    Banco: TDBEdit;
    Label16: TLabel;
    Cuenta: TDBEdit;
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
    CVEMUNI_DO: TDBEdit;
    LVEMP_CVEMUNI_DO: TEdit;
    UBICA: TDBEdit;
    UBICA_D: TDBEdit;
    STATUS: TDBEdit;
    StatusExp: TLabel;
    MOTIVO_CONT: TDBMemo;
    OBSERBAJA: TDBMemo;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label32: TLabel;
    INI: TDBEdit;
    Label19: TLabel;
    FIN: TDBEdit;
    Label35: TLabel;
    BAJA: TDBEdit;
    Label12: TLabel;
    LAntig: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label43: TLabel;
    CVEPAIS_NACI: TDBEdit;
    Label25: TLabel;
    LVEMP_CVEPAIS_NACI: TEdit;
    ESTA: TDBEdit;
    LVEMP_ESTA: TEdit;
    Label11: TLabel;
    CVEMUNI_NA: TDBEdit;
    LVEMP_CVEMUNI_NA: TEdit;
    Label41: TLabel;
    CIUD_NACI: TDBEdit;
    Label14: TLabel;
    CVESTA: TDBEdit;
    LVEMP_CVESTA: TEdit;
    Label6: TLabel;
    Activo: TDBCheckBox;
    OBSERVA: TDBMemo;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    SUELDO: TDBEdit;
    NOMBANCO: TDBEdit;
    Label30: TLabel;
    SUBFONDO: TDBEdit;
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
   // procedure EMAILChange(Sender: TObject);
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

 // TNumericField(SUELDO.Field).DisplayFormat := ',#.##';

   // QId.Close ;
   // QID.Open ;
  //LAntigD.Caption := FModulo.Query1.FieldByName('VEMP_AntigDAnios').AsString+
  //' Años '+ FModulo.Query1.FieldByName('VEMP_AntigDDias').AsString+ ' Dias' ;
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

 if modo= 3 then      //INSERCION
  begin
   FModulo.Query1['VEMP_Activo'] := 'S' ;
   Fmodulo.Query1['VEMP_HONORARIOA']:= 'S' ;
   Fmodulo.Query1['VEMP_CALCISR']:= 'N' ;
   Fmodulo.Query1['VEMP_AGUINALDO']:= 'N' ;
   Fmodulo.Query1['VEMP_PRIMAVAC']:= 'N' ;
   Fmodulo.Query1['VEMP_DIAS31']:= 'N' ;
   Fmodulo.Query1['VEMP_BONONAV']:= 'N' ;
   Fmodulo.Query1['VEMP_SERVMED']:= 'N' ;
   Foto.Picture := nil ;
  // INSERTA CONSECUTIVO
    QId.Close ;
    QId.ExecSQL;
    QID.Open ;
//   FModulo.Query1.FieldByName('VEMP_persona').AsInteger := QID['ID'] ;
   FModulo.Query1.FieldByName('VEMP_persona').AsSTRING := QID['ID'] ;
    //  showmessage(FModulo.Query1.FieldByName('VEMP_persona').AsSTRING);
    // showmessage(inttostr(FModulo.Query1.FieldByName('VEMP_persona').AsInteger));
  end
 else begin

  QFoto.ParamByName('Persona').AsString := FModulo.Query1['VEMP_persona'] ;
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

  if modo= 1 then       //consulta
   begin
    Psto.Color := clMenu ;
    Categ.Color := clMenu ;
    Psto2.Color := clMenu ;
    Categ2.Color := clMenu ;
    //CUENTA BANCARIA
    QID.Close ;
    QID.Sql.Clear ;
    QID.SQL.Add('SELECT VCTA_BANCOD AS BANCO, VCTA_NBANCO AS NOMBANCO,VCTA_CUENTA AS CUENTA ');
    QID.SQL.ADD(' FROM PVCTABANCO WHERE VCTA_PERSONA= :VEMP_PERSONA') ;
    QID.Open ;
    BANCO.TEXT:= QID.FieldByName('BANCO').ASsTRING;
    NOMBANCO.TEXT:=QID.FieldByName('NOMBANCO').ASsTRING;
    CUENTA.TEXT:=QID.FieldByName('CUENTA').ASsTRING;

    //SUBFONDO
    DATA.qlSubfdo.Close;
    DATA.qlSubfdo.ExecSQL;
    DATA.qlSubfdo.Open;
    SUBFONDO.TEXT:= DATA.qlSubfdo.FieldByName('SUBFONDO').AsSTRING;
    SUBFONDO.Color := clMenu ;
    //  showmessage(subfondo.text);
   // DATA.qlSubfdo.Close;
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

 if FModulo.Query1.FieldByName('VEMP_persona').IsNull then
  begin
   QId.Close ;
   QId.ExecSQL;
   QID.Open ;
//   FModulo.Query1.FieldByName('VEMP_persona').AsInteger := QID['ID'] ;
      FModulo.Query1.FieldByName('VEMP_persona').AsSTRING := QID['ID'] ;
 //  showmessage(inttostr(FModulo.Query1.FieldByName('VEMP_persona').AsInteger));
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
 Data.QICateg.ParamByName('PERSONA').AsString := FModulo.Query1['VEMP_persona'] ;
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
   VSql.Add('From PHCPUESTOS') ;
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

//  Panel4.Visible := Not panel4.Visible

end;




end.
