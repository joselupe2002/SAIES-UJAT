unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList;

  TYPE
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    QEmpl: TQuery;
    QESCO: TQuery;
    TPSTO: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    PSTONI: TEdit;
    SpeedButton1: TSpeedButton;
    SQLMemo: TMemo;
    SpeedButton2: TSpeedButton;
    DsEMPL: TDataSource;
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    Rep: TEkRTF;
    QPSTO: TQuery;
    QHispsto: TQuery;
    Label4: TLabel;
    empl: TEdit;
    barra: TProgressBar;
    Label5: TLabel;
    Label6: TLabel;
    NREG: TLabel;
    q: TQuery;
    QHisPsto2: TQuery;
    QPstoAdm: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure devRTF(q:TQuery;tabla:string;campoF:string;campo:string;valor:string;Extension:String);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RepScanRecord(ScanInfo: TEkScanInfo);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  FMain : TFMain ;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;
  vures:string;
  VURES_DESC:STRING;
  fechaGen:string;

implementation


//uses Repo;

{$R *.DFM}




procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 472;
 Width :=  809 ;

end;

procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFDetalle.Cancelar1Click(Sender: TObject);
begin
 close ;
end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  qEmpl.close;
  Q.CLOSE;
  if sqlMemo.Visible  then
     begin
        qEMPL.sql.text:=sqlMemo.text;
        q.sql.text:='SELECT COUNT(*) '+copy(sqlMemo.text,pos('FROM',UPPERCASE(sqlMemo.text)),LENGTH(sqlMemo.text));
        showmessage('entre al SQL ');
     end
  else
     begin

      q.sql.text:='Select count(*) '+
      ' from Pvempldos a, Pedcivil b, Pescolari c, Pmunicipio d, Pestatuse e, PVNOMBRAM F  '+
      ' where b.edci_cveedci = a.VEMP_EDOCIV '+
      ' and c.esco_cveesco = a.VEMP_ESCOL   '+
      ' and d.muni_cvemuni(+) = a.VEMP_CVEMUNI_DO   '+
      ' and e.esta_cvesta(+) = a.VEMP_CVESTA  '+
      ' AND F.VNOM_Empl=A.VEMP_EMPL AND F.VNOM_Fin>=TRUNC(SYSDATE) ';


       qEmpl.sql.text:='Select '+
       'A.VEMP_EMPL as Empl,'+
      ' a.VEMP_RFC as RFC,'+
       'a.VEMP_ABREVIA || '+#39+' '+#39+' || a.VEMP_ApePat || '+#39+' '+#39+' || a.VEMP_ApeMat || '+#39+' '+#39+' || a.VEMP_Nombre as Nombre,'+
       'a.VEMP_CURP as CURP,'+
       'a.VEMP_NUMSS as NUMSS,'+
       'a.VEMP_Foto as Foto,'+
       'a.VEMP_Direccion ||'+#39+' Colonia: '+#39+'|| a.VEMP_COLON_DOMI ||'+#39+' Municipio: '+#39+'|| d.muni_descrip as Dir,'+
       'a.VEMP_Telefono as Tel,'+
       'a.VEMP_EMAIL as Correo,'+
       'Decode(a.VEMP_Sexo,'+#39+'F'+#39+','+#39+'FEMENINO'+#39+','+#39+'MASCULINO'+#39+') as Sexo,'+
       'a.VEMP_FNACI as Fnaci, '+
       'b.edci_descrip as Edociv,'+
       'c.esco_descrip as Escolaridad, '+
       'a.VEMP_DESCRIP as Descripcion,'+
       'e.esta_descrip as Calidad, '+
       'a.VEMP_FINGRESO as Fingreso,'+
       'trim(a.VEMP_AntigAnios || '+#39+' Años ' +#39+'|| trunc(a.VEMP_AntigDias) || '+#39+' dias'+#39+') as Antig,'+
       'a.VEMP_FINGRESOD as Fingresod,  '+
       'trim(a.VEMP_AntigdAnios || '+#39+' Años '+#39+'|| trunc(a.VEMP_AntigdDias) || '+#39+' dias'+#39+') as AntigD,'+
       'to_char(Sysdate,'+#39+'dd'+#39+') ||'+#39+'/'+#39+'||TRIM(to_char(Sysdate,'+#39+'MONTH'+#39+')) ||'+#39+'/'+#39+'||to_char(Sysdate,'+#39+'yyyy'+#39+') as Fecha '+
      ' from Pvempldos a, Pedcivil b, Pescolari c, Pmunicipio d, Pestatuse e, PVNOMBRAM F  '+
      ' where b.edci_cveedci = a.VEMP_EDOCIV '+
      ' and c.esco_cveesco = a.VEMP_ESCOL   '+
      ' and d.muni_cvemuni(+) = a.VEMP_CVEMUNI_DO   '+
      ' and e.esta_cvesta(+) = a.VEMP_CVESTA  '+
      ' AND F.VNOM_Empl=A.VEMP_EMPL AND F.VNOM_Fin>=TRUNC(SYSDATE) ';

      //Se aplican los filtros para el query de empleados y para el conteo de Registros
      if tpsto.Text<>'' then begin
         q.sql.text:=q.sql.text+' AND F.VNOM_TPSTO IN ('+tpsto.Text+')';
         qEmpl.sql.text:=qEmpl.sql.text+' AND F.VNOM_TPSTO IN ('+tpsto.Text+')';   end;
      if pstoni.text<>'' then begin
         q.sql.text:=q.sql.text+' AND F.VNOM_Psto NOT IN ('+pstoni.text+')';
         qEmpl.sql.text:=qEmpl.sql.text+' AND F.VNOM_Psto NOT IN ('+pstoni.text+')'; end;

      if empl.Text<>'' then begin
         q.sql.text:=q.sql.text+' and a.VEMP_EMPL in ('+empl.Text+')';
         qEmpl.sql.text:=qEmpl.sql.text+' AND A.VEMP_EMPL IN ('+empl.text+')'; end;
   end;

   qEmpl.open;
   q.open;
   NREG.CAPTION:=Q.fields[0].asstring;



end;

procedure TFDetalle.devRTF(q:TQuery;tabla:string;campoF:string;campo:string;valor:string;Extension:String);
var
   Fblob:TBlobField;
   aux:TQuery;
begin
    AUX := TQuery.Create(Application) ;
    aux.DataBaseName := 'Sistema' ;
    aux.close;
    aux.sql.text:='SELECT '+campof+' FROM '+TABLA+' WHERE '+campo+'='+#39+UPPERCASE(valor)+#39+
    ' and '+campof+' is not null';
    aux.open;
    if not(aux.eof) then
      begin
         FBlob:= aux.Fields[0] as TBlobField;
         FBlob.SaveToFile(extractfiledir(paramstr(0))+'\'+valor+'.'+extension);
      end;
   aux.close;
end;



procedure TFDetalle.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   barra.Visible:=true;
   barra.Max:=strtoint(nreg.caption);
   barra.Position:=0;
   devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPMS','rtf');
   
   {rep.ClearVars;
   REP.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
   REP.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
   q.close;
   q.sql.text:='SELECT USER FROM DUAL';
   q.OPEN;
   REP.CreateVar('USER',q.fields[0].asstring); }


   //(SE PASA SOLO EL PARAMETRO EMPL) ESTOS 3 BLOQUES DE QUERY SE PONE EN EL EVENTO ONSCANRECORD DEL RTF
   //DATOS DEL PUESTO ACTIVO QUE TIENE
   QPSTO.CLOSE;
   QPSTO.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
   QPSTO.OPEN;
   //DATOS DE HISTORIAL DE ESCOLARIDAD
   QESCO.close;
   QESCO.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
   QESCO.open;
   //datos del historial de puestyos
   QHISPSTO.Close;
   QHISPSTO.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
   QHISPSTO.OPEN;

   QPSTOAdm.Close;
   QPSTOAdm.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
   QPSTOAdm.OPEN;

   QHISPSTO2.Close;
   QHISPSTO2.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
   QHISPSTO2.OPEN;

   //==========================================================================================================

  REP.InFile:=ExtractFiledir(Paramstr(0))+'\RepMS.rtf';
  REP.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepMS.rtf';

  REP.ExecuteOpen([QEMPL,QPSTO, QHISPSTO,QESCO,QPSTOAdm,QHISPSTO2],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;

procedure TFDetalle.RepScanRecord(ScanInfo: TEkScanInfo);
begin
  inherited;
 if (scaninfo.Number=1)  then
      begin
           //dATOS DEL PUESTO ACTIVO QUE TIENE
           QPSTO.CLOSE;
           QPSTO.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
           QPSTO.OPEN;
           //DATOS DE HISTORIAL DE ESCOLARIDAD
           QESCO.close;
           QESCO.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
           QESCO.open;
           //datos del historial de puestyos
           QHISPSTO.Close;
           QHISPSTO.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
           QHISPSTO.OPEN;

           QPSTOAdm.Close;
           QPSTOAdm.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
           QPSTOAdm.OPEN;

           QHISPSTO2.Close;
           QHISPSTO2.ParamByName('EMPL').asstring:=qempl.fieldbyname('EMPL').asstring;
           QHISPSTO2.OPEN;

           barra.Position:=barra.position+1;
     end;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  sqlmemo.visible:=not(sqlMemo.visible);
end;

End.
