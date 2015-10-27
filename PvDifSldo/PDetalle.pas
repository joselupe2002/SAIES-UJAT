{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}

{$MINSTACKSIZE $00004000}

{$MAXSTACKSIZE $00100000}

{$IMAGEBASE $00400000}

{$APPTYPE GUI}

unit PDetalle;

interface

uses
  Sharemem, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, modulo, StdCtrls, Mask, DBCtrls, Db, DBTables, DBGrids, ComCtrls,
  Grids, ExtCtrls, ToolWin, libreria, ImgList, DBCGrids ;

type
  TPFDetalle = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Accion1: TMenuItem;
    Aceptar1: TMenuItem;
    Cancelar1: TMenuItem;
    QUpdate: TQuery;
    QInsert: TQuery;
    GValValid: TDBGrid;
    QVal: TQuery;
    DSVal: TDataSource;
    Seleccionar1: TMenuItem;
    GQBE: TStringGrid;
    PCaptura: TPanel;
    ToolBar1: TToolBar;
    BAcepta: TToolButton;
    BCancela: TToolButton;
    ModDS: TDataSource;
    BSelecciona: TToolButton;
    Calen: TMonthCalendar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Asigna(lista : TList) ;
    procedure Aceptar1Click(Sender: TObject) ; // Aceptar
    procedure Acepta_QBE ;               // Acepta el Valor del QBE
    procedure Cancelar1Click(Sender: TObject);
    procedure Cancela_Seleccion ;           // Cancela el Valor de la Seleccion
    procedure Cancela_QBE ;                 // Cancela el Valor del QBE
    procedure Seleccionar1Click(Sender: TObject) ;  // Seleccionar
    procedure Selec_Seleccion ;          // Selecciona en Seleccion
    procedure QValUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure DescCampo(Sender : TObject) ; virtual ;     // Para Describir el Campo
    procedure PDesCampo(Sender : TObject) ; virtual ;     // Para Describir el Campo Individual
    procedure SDescCampo(Sender : TObject) ; virtual ;     // Para Quitar Descripcion Individual
    procedure ValCam(Sender : TField) ; virtual ;
    procedure calenshow ;
    procedure Acepta_Fecha ;
    procedure Cancela_Fecha ;
  private
    { Private declarations }
  public
    { Public declarations }
   modo : Integer ;        // Modo del que llama 1= Detalle, 2= Cambia, 3= Inserta
   cadena : String ;
   BDatos : TDataBase ;     // Base de Datos Original
   VControl,WContIni : TWinControl ; // Control Activo
   VSql : TStringList ;     // Rollo del Sql, el Bueno
   CamposQBE : TStringList ;  // Campos para el QBE
   SqlQBE : TStringList ;  // Query Original
   FModulo : TFModulo ;
   LDBCGrids, LSoloLec2, Letreros : TList ;
   ValAnt : Variant ;
   sele : Boolean ;

   procedure Selec_Captura ; virtual ;     // Selecciona Captura
   procedure Acepta_Captura ; virtual ;          // Graba Update o Insert
   procedure Acepta_Seleccion ;  virtual ;      // Acepta el Valor de la Seleccion
   procedure CreaSQL(mcampo : String) ; virtual ;
   procedure GrabaUpdate ; virtual ;             // Mas Consideraciones para hacer el Update
   procedure GrabaInsert ; virtual ;             // Mas Consideraciones para hacer el Insert
   procedure GrabaDetalle ; virtual ;
   procedure Inivar ; virtual ;                  // De Campos -> Variables
   procedure DesInivar ; virtual ;               // De Variables -> Campos
   function  valida    : Boolean ;  virtual ;       // Validacion Antes de Modificar
   function rnombre : String ; virtual ;         // Regresa Nombre del Campo en Select
   function rcampo(Sender : TField) : String ; virtual ; // Regresa Nombre del Campo en Validacion (Letrero)
   function nDesCampo(Sender : TObject) : String ; virtual ;
  end;

var
  PFDetalle: TPFDetalle;


implementation

{$R *.DFM}

procedure TPFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 if (FModulo.Query1.State= dsInsert) or
    (FModulo.Query1.State= dsEdit) then
   FModulo.Query1.Cancel ;

 FModulo.Campos.First ;
 while not FModulo.Campos.eof do
 begin
  cadena := FModulo.Campos.FieldByName('Campo').AsString ;
  FModulo.Query1.FieldByName(cadena).OnChange := nil ;
  FModulo.Query1.FieldByName(cadena).OnValidate := nil ;
  FModulo.Campos.Next ;
 end ;

 LDBCGrids.Free ;
 LSoloLec2.Free ;
 Letreros.Free ;
 VSql.Free ;
 CamposQBE.Free ;
 SqlQBE.Free ;
 Fmodulo.Enabled := True ;
 Fmodulo.WindowState := wsNormal ;
 Fmodulo.top := Top ;
 Fmodulo.left := Left ;
 FModulo.Actform := nil ;
 FModulo.Show ;
 Action := caFree ;
end;


procedure TPFDetalle.FormCreate(Sender: TObject);
var lista : TList ;
 i : Integer ;
begin
 FModulo := TFModulo(Owner) ;
 ToolBar1.Images := FModulo.Iconos ;
 MainMenu1.Images := FModulo.Iconos ;
 VSql := TStringList.Create ;
 CamposQBE := TStringList.Create ;
 SqlQBE := TStringList.Create ;
 LDBCGrids := TList.Create ;
 LSoloLec2 := TList.Create ;
 Letreros := TList.Create ;
 top := FModulo.Top ;
 left := FModulo.Left ;

 ModDs.DataSet := FModulo.Query1 ;
 modo := FModulo.modo ;
 BDatos := FModulo.BDatos ;
 sele := False ;

 GValValid.Hide ;
 GQBE.Hide ;
 GValValid.Align := AlClient ;
 GQBE.Align := AlClient ;


// Identificamos el Campo Inicial para Insert


 lista := TList.Create ;
 GetTabOrderList(Lista) ;
 Asigna(Lista) ;

 case modo of
  1 : begin
       caption := 'Detalle '+ Fmodulo.Caption ;
       Aceptar1.Enabled := False ;
       BAcepta.Enabled := False ;
       Seleccionar1.Enabled := False ;
       BSelecciona.Enabled := False ;

       // Ponemos en ReadOnly los Controles

       ModDs.AutoEdit := False ;
       for i := 0 to LDBCGrids.Count - 1 do
       begin
        TDBCtrlGrid(LDBCGrids[i]).DataSource.AutoEdit := False ;
        TDBCtrlGrid(LDBCGrids[i]).AllowInsert := False ;
        TDBCtrlGrid(LDBCGrids[i]).AllowDelete := False ;
       end ;

      // Ponemos los Letreros
       for i := 0 to Letreros.Count - 1 do
        begin
         cadena := TEdit(Letreros[i]).Name ;
         cadena := copy(cadena,2,30) ;
         valcam(FModulo.Query1.FieldByName(cadena)) ;
        end ;

      end ;

  2 : begin
       caption := 'Cambiar '+ FModulo.Caption ;
       for i := 0 to LSoloLec2.Count - 1 do
        begin
         TDBEdit(LSoloLec2[i]).ReadOnly := True ;
         TDBEdit(LSoloLec2[i]).TabStop := False ;
         TDBEdit(LSoloLec2[i]).Color := clMenu ;
        end ;

      // Ponemos los Letreros

       for i := 0 to Letreros.Count - 1 do
        begin
         cadena := TEdit(Letreros[i]).Name ;
         cadena := copy(cadena,2,30) ;
         valcam(FModulo.Query1.FieldByName(cadena)) ;
        end ;

       FModulo.Query1.Edit ;
      end ;

  3 : begin
       caption := 'Insertar '+ FModulo.Caption ;
       FModulo.Query1.Append ;
      end ;
 end ;

 inivar ;
end;


procedure TPFDetalle.Asigna(lista : TList) ;
var i : Integer ;
 mcadena : String ;
begin
 for i := 0 to lista.Count - 1 do
 begin

  mcadena := TWinControl(lista.Items[i]).Name ;
  if    (TWinControl(lista.Items[i]).Tag= 1)   // Control Inicial en Insert
     or (TWinControl(lista.Items[i]).Tag= 12)
  then WContIni := TWinControl(lista.Items[i]) ;

  if   (TControl(lista.Items[i]) is TDBCtrlGrid )   // DBCtrlGrids Detalle
   and (TWinControl(lista.Items[i]).Tag= 0)
  then LDBCGrids.Add(TWinControl(lista.Items[i])) ;

  cadena := TOBject(lista.Items[i]).ClassName ;

// Para Letreritos descriptivos

  if cadena= 'TDBEdit' then
   if TDBEdit(lista.Items[i]).DataSource = ModDs then
    begin
     if @TDBEdit(lista.Items[i]).OnEnter= nil
     then TDBEdit(lista.Items[i]).OnEnter := DescCampo ;

     if @TDBEdit(lista.Items[i]).OnExit= nil
     then TDBEdit(lista.Items[i]).OnExit := SDescCampo ;

      if (modo= 1) and (TDBEdit(lista.Items[i]).Color= clWindow)
      then TDBEdit(lista.Items[i]).Color := clMenu ;
    end
  else
   begin
    if @TDBEdit(lista.Items[i]).OnEnter= nil
    then TDBEdit(lista.Items[i]).OnEnter := PDesCampo ;

    if @TDBEdit(lista.Items[i]).OnExit= nil
    then TDBEdit(lista.Items[i]).OnExit := SDescCampo ;
   end ;


  if cadena= 'TDBMemo' then
   if TDBMemo(lista.Items[i]).DataSource = ModDs then
    begin
     if @TDBMemo(lista.Items[i]).OnEnter= nil
     then TDBMemo(lista.Items[i]).OnEnter := DescCampo ;

     if @TDBMemo(lista.Items[i]).OnExit= nil
     then TDBMemo(lista.Items[i]).OnExit := SDescCampo ;

     if (modo= 1) and (TDBMemo(lista.Items[i]).Color= clWindow)
     then TDBMemo(lista.Items[i]).Color := clMenu ;
    end
   else
    begin
     if @TDBMemo(lista.Items[i]).OnEnter= nil
     then TDBMemo(lista.Items[i]).OnEnter := PDesCampo ;

     if @TDBMemo(lista.Items[i]).OnExit= nil
     then TDBMemo(lista.Items[i]).OnExit := SDescCampo ;
    end ;


  if cadena= 'TDBCheckBox' then
   if TDBCheckBox(lista.Items[i]).DataSource = ModDs then
    begin
     if @TDBCheckBox(lista.Items[i]).OnEnter= nil
     then TDBCheckBox(lista.Items[i]).OnEnter := DescCampo ;

     if @TDBCheckBox(lista.Items[i]).OnExit= nil
     then TDBCheckBox(lista.Items[i]).OnExit := SDescCampo ;

     if (modo= 1) and (TDBCheckBox(lista.Items[i]).Color= clBtnFace)
     then TDBCheckBox(lista.Items[i]).Color := cl3DLight ;

    end
   else
    begin
     if @TDBCheckBox(lista.Items[i]).OnEnter= nil
     then TDBCheckBox(lista.Items[i]).OnEnter := PDesCampo ;

     if @TDBCheckBox(lista.Items[i]).OnExit= nil
     then TDBCheckBox(lista.Items[i]).OnExit := SDescCampo ;
    end ;

  if cadena= 'TDBRadioGroup' then
   if TDBRadioGroup(lista.Items[i]).DataSource = ModDs then
    begin
     if @TDBRadioGroup(lista.Items[i]).OnEnter= nil
     then TDBRadioGroup(lista.Items[i]).OnEnter := DescCampo ;

     if @TDBRadioGroup(lista.Items[i]).OnExit= nil
     then TDBRadioGroup(lista.Items[i]).OnExit := SDescCampo ;

    end
   else
    begin
     if @TDBRadioGroup(lista.Items[i]).OnEnter= nil
     then TDBRadioGroup(lista.Items[i]).OnEnter := PDesCampo ;

     if @TDBRadioGroup(lista.Items[i]).OnExit= nil
     then TDBRadioGroup(lista.Items[i]).OnExit := SDescCampo ;
    end ;

  if cadena= 'TEdit' then
   begin
    if @TEdit(lista.Items[i]).OnEnter= nil
    then TEdit(lista.Items[i]).OnEnter := PDesCampo ;

    if @TEdit(lista.Items[i]).OnExit= nil
    then TEdit(lista.Items[i]).OnExit := SDescCampo ;
   end ;

// Solo Lectura en TDBEdits

  if (cadena= 'TDBEdit') and
     ( (TControl(lista.Items[i]).Tag= 2) or (TWinControl(lista.Items[i]).Tag= 12) )
  then LSoloLec2.Add(TWinControl(lista.Items[i])) ;

  if (TControl(lista.Items[i]) is TEdit ) and  // Letreros Directos
     (TControl(lista.Items[i]).Tag= 9) then
  begin
   Letreros.Add(TWinControl(lista.Items[i])) ;
   cadena := TEdit(lista.Items[i]).Name ;
   TEdit(lista.Items[i]).Color := clMenu ;
   TEdit(lista.Items[i]).Font.Color := clBlue ;
   TEdit(lista.Items[i]).TabStop := False ;
   TEdit(lista.Items[i]).ReadOnly := True ;
   cadena := copy(cadena,2,30) ;
   if @FModulo.Query1.FieldByName(cadena).OnChange= nil
   then FModulo.Query1.FieldByName(cadena).OnChange := valcam ;
  end ;
 end ;
end ;

procedure TPFDetalle.Inivar ;
begin
//
end ;


procedure TPFDetalle.DesInivar ;
begin
//
end ;


function TPFDetalle.Valida : Boolean ;
begin
// Validamos Reglas
 result := True ;
end ;


procedure TPFDetalle.GrabaUpdate ;
begin
 QUpdate.ExecSql ; // Ejecutamos el Update
 GrabaDetalle ;
end ;

procedure TPFDetalle.GrabaInsert ;
begin
 QInsert.ExecSql ; // Ejecutamos el Insert
 GrabaDetalle ;
end ;

procedure TPFDetalle.GrabaDetalle ;
begin
 // Cuando Graba Detalles
end ;


procedure TPFDetalle.QValUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
 UpDateAction := uaApplied ;
end;

procedure TPFDetalle.Aceptar1Click(Sender: TObject);
begin
 if GQBE.Visible then Acepta_QBE                    // Acepta QBE
 else if GValValid.Visible then Acepta_Seleccion    // Acepta Seleccion
 else if calen.visible then Acepta_Fecha
 else Acepta_Captura ;                              // Acepta Captura
end;


procedure TPFDetalle.Acepta_Captura ;
var i : Integer ;
 vcontrol : TWinControl ;
 Detalle : TDataSet ;
begin

// Si no hay cambios cerramos

 if (FModulo.Query1.State <> dsInsert) and
    (FModulo.Query1.State <> dsEdit) then
 begin
  close ;
  exit ;
 end ;

 vcontrol := ActiveControl ;
 Toolbar1.SetFocus ;
 vcontrol.SetFocus ;

 for i := 0 to LDBCGrids.Count - 1 do
  begin
    detalle := TDBCtrlGrid(LDBCGrids[i]).DataSource.DataSet ;
   if (Detalle.State= dsEdit) or (Detalle.State= dsInsert)
   then Detalle.Post ;
  end ;

 if not valida then         // Validamos Registro
 begin
  MessageDlg(Cadena, mtError, [mbOK], 0 ) ;
  exit ;
 end ;

// Grabamos en la Base de Datos

 Bdatos.StartTransaction ;
 try
  DesInivar ;                  // De Variables -> Campos
  if modo= 2
  then GrabaUpdate             // Update o Insert segun Seleccion
  else GrabaInsert ;
  BDatos.Commit ;              // Terminamos Transaccion
  FModulo.Query1.Post ;        // Grabamos en el Query

  if modo= 2
  then close
  else
   begin
    FModulo.Query1.Append ;
    inivar ;
    for i := 0 to Letreros.Count -1
    do TEdit(Letreros[i]).Text := '' ;

    if WContIni <> nil
    then WContIni.SetFocus ;
   end ;
 except
  on E: Exception do
  begin
   bdatos.rollback ;
   OraErr(E) ;
  end ;
 end ;
end ;


procedure TPFDetalle.Acepta_Seleccion ;
var campo : TField ;
begin
 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

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


procedure TPFDetalle.Acepta_QBE ;
var i : Integer ;
begin
 QVal.Close ;
 QVal.SQL.Clear ;
 QVal.Sql.Text := SqlQBE.Text ;

 for i := 0 to CamposQBE.Count - 1
 do if Length(GQBE.Cells[i,1]) > 0
 then QVal.Sql.Add(' And '+ camposQBE[i]+ ' Like ''' + GQBE.Cells[i,1]+ '''' );

 QVal.Open ;
 GQBE.Hide ;
 GValValid.Show ;
 GValValid.SetFocus ;
 Seleccionar1.Enabled := True ;
end ;


procedure TPFDetalle.Cancelar1Click(Sender: TObject);
begin
 if GQBE.Visible
      then Cancela_QBE          // Sale de QBE
 else if Calen.Visible
      then Cancela_Fecha              // Sale de Fecha
 else if GValValid.Visible
      then Cancela_Seleccion    // Selecciona Seleccion
 else if modo= 1                // Sale de Consulta
      then close
 else if (Application.MessageBox('Salir de Edicion', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES)
      then  Close  ;  // Selecciona Captura
end;


procedure TPFDetalle.Cancela_Seleccion ;
var campo : TField ;
begin
 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

 if campo <> nil then
 begin
  campo.DataSet.Edit ;
  campo.Value := ValAnt ;
 end ;


 QVal.Close ;
 GValValid.Hide ;
 PCaptura.Show ;
 VControl.SetFocus ;
end ;


procedure TPFDetalle.Cancela_QBE ;
var i : Integer ;
begin
 GQBE.Hide ;
 GValValid.Show ;
 for i := 0 to GQBE.ColCount - 1 do GQBE.Cells[i,1] := VSql[i] ;
 GValValid.SetFocus ;
 Seleccionar1.Enabled := True ;
end ;


procedure TPFDetalle.Seleccionar1Click(Sender: TObject);
begin
 if GQBE.Visible then                             // Selecciona QBE
 else if GValValid.Visible
  then Selec_Seleccion   // Selecciona Seleccion
 else if (ActiveControl is TDBEdit) and
  (TDBEdit(ActiveControl).Field is TDateTimeField)
  then calenshow
 else Selec_Captura ;         // Selecciona Captura
end;

procedure TPFDetalle.Selec_Captura ;
var i : Integer ;
 campo : TField ;
begin
 CreaSQL(rnombre) ;
 CamposQBE.Clear ;
 sqlQBE.Clear ;
 sqlQBE.Text := Vsql.Text ;

 for i := 1 to VSql.Count - 1 do
 if UpperCase(copy(VSql[i],1,4))= 'FROM' then Break
 else
  begin
   cadena := Trim(VSql[i]) ;
   cadena := copy(cadena, 1, length(cadena)- length(StrPos( PChar(Cadena), ' AS '))) ;
   CamposQBE.Add(cadena) ;
//   QVal.Sql.Add('And '+ cadena + ' Like :Campo'+ IntToStr(i) ) ;
  end ;

// for i := 0 to QVal.ParamCount - 1
// do QVal.Params.Items[i].AsString := '%' ;

 Vcontrol := ActiveControl ;
 if VSql.Count= 0 then
 begin
  showmessage('No hay ayuda para ese campo') ;
  exit ;
 end ;

 sele := True ;

 campo := nil ;
 if VControl is TDBEdit
 then campo := TDBEdit(Vcontrol).Field ;
 if VControl is TDBGrid
 then Campo := TDBGrid(VControl).SelectedField ;

 if campo <> nil then
 begin
  ValAnt := campo.Value ;
  campo.DataSet.Edit ;
  campo.Value := null ;
 end ;

 sele := False  ;

 QVal.Open ;
 GValValid.Show ;
 PCaptura.Hide ;
 GValValid.SetFocus ;

// Preparamos el GQBE

 GQBE.ColCount := GValValid.FieldCount ;
 GQBE.RowCount := 2 ;

 for i:= 0 to GValValid.FieldCount - 1 do
 begin
  GQBE.Cells[i,0] := GValValid.Fields[i].DisplayName ;
  GQBE.ColWidths[i] := GValValid.Columns.Items[i].Width ;
  GQBE.Cells[i,1] := '' ;
 end ;
end;

procedure TPFDetalle.Selec_Seleccion ;
var i : Integer ;
begin
 VSql.Clear ;
 for i := 0 to GQBE.ColCount - 1
 do VSql.Add(GQBE.Cells[i,1]) ;
 GQBE.Show ;
 GValValid.Hide ;
 GQBE.SetFocus ;
 Seleccionar1.Enabled := False ;
end ;


function TPFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 if ActiveControl is TDBGrid
 then Result := TDBGrid(ActiveControl).SelectedField.FieldName
 else result := ActiveControl.Name ;
end ;


procedure TPFDetalle.ValCam(Sender : TField) ;
var Caja : TComponent ;
begin
 if sele
 then exit ;

 CreaSQL(RCampo(Sender)) ;

 cadena := Trim(VSql[1]) ;
 cadena := copy(cadena, 1, length(cadena)- length(StrPos( PChar(Cadena), ' AS '))) ;
 QVal.Sql.Add('And '+ cadena + '= :Campo') ;

 if VSql.Count= 0
 then exit ;

 QVal.ParamByName('Campo').AsString := Sender.AsString ;
 QVal.Open ;

 cadena := 'L'+ Sender.FieldName ;
 Caja := FindComponent(cadena) ;

 if caja is TEdit then
  begin
   TEdit(Caja).Text := QVal.Fields[1].AsString ;
   TEdit(Caja).Refresh ;
  end ;
end ;

function TPFDetalle.RCampo(Sender : TField) : String ;
begin
 VSql.Clear ;
 cadena := copy(Sender.FieldName,6,30) ;
 result := cadena ;
end ;

procedure TPFDetalle.CreaSQL(mcampo : String) ;
begin
 if vsql.Count= 0 then
 begin
  cadena := copy(mcampo, 1, length(mcampo)- length( StrPos( PChar(mcampo),'_')) ) ;
  cadena := UpperCase(cadena) ;
  QVal.Close ;
  QVal.SQL.Clear ;
  QVal.Sql.Add('Select Refd_Sql As Sql From SRefDesc ') ;
  QVal.Sql.Add('Where Refd_Campo= '''+ cadena+ '''') ;
  QVal.Open ;


  if QVal.Eof
  then exit ;

  VSql.Text := QVal.FieldByName('Sql').AsString ;
 end ;

 VSql.Text := UpperCase(VSql.Text) ;

 if length( StrPos( PChar(VSql.Text),'WHERE'))= 0
 then VSql.Add('WHERE 1=1') ;

// Preparamos el QVal

 QVal.Close ;
 QVal.SQL.Clear ;
 QVal.SQL.Text := VSql.Text ;

end ;

procedure TPFDetalle.DescCampo(Sender : TObject) ;
begin
 cadena := '' ;

 if Sender is TDBEdit
 then cadena := TDBEdit(Sender).DataField
 else if Sender is TDBMemo
 then cadena := TDBMemo(Sender).DataField
 else if Sender is TDBCheckBox
 then cadena := TDBCheckBox(Sender).DataField ;

 if FModulo.Campos.Locate('Campo',cadena,[loCaseInsensitive])
 then StatusBar1.SimpleText := FModulo.Campos.FieldByName('Leye').AsString ;
end ;

procedure TPFDetalle.PDesCampo(Sender : TObject) ;
begin
 StatusBar1.SimpleText := nDesCampo(Sender) ;
end ;

function TPFDetalle.nDesCampo(Sender : TObject) : String ;
begin
 result := '' ;
end ;

procedure TPFDetalle.SDescCampo(Sender : TObject) ;
begin
 StatusBar1.SimpleText := '' ;
end ;

procedure TPFDetalle.CalenShow ;
begin
 VControl := ActiveControl ;
 PCaptura.Hide ;
 Calen.Show ;
end ;

procedure TPFDetalle.Acepta_Fecha ;
 var Campo : TField ;
begin
 Cancela_Fecha ;
 Campo := TDBEdit(VControl).Field ;
 Campo.Value := Calen.Date ;
end ;

procedure TPFDetalle.Cancela_Fecha ;
begin
 Calen.Hide ;
 PCaptura.Show ;
 VControl.SetFocus ;
end ;


end.
