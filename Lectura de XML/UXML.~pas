unit UXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,xmldom, XMLIntf, msxmldom, XMLDoc, StdCtrls, FileCtrl, DBXpress,
  FMTBcd, Buttons, ExtCtrls, DB, SqlExpr, ComCtrls, Grids, DBGrids,
  Provider, DBClient;

type
  Tforma = class(TForm)
    BDSQL: TSQLConnection;
    AUX: TSQLQuery;
    PServer: TPanel;
    Label18: TLabel;
    SpeedButton8: TSpeedButton;
    Label6: TLabel;
    Label8: TLabel;
    numRegPaq: TEdit;
    dirEnvio: TEdit;
    user: TEdit;
    pass: TEdit;
    Panel1: TPanel;
    btnConec: TSpeedButton;
    genXML: TSpeedButton;
    PEXPL: TPanel;
    dir: TDirectoryListBox;
    FilterComboBox1: TFilterComboBox;
    Lista: TFileListBox;
    Panel3: TPanel;
    CerrarExp: TSpeedButton;
    DR: TDriveComboBox;
    log: TEdit;
    FilPrueba: TListBox;
    ListBox1: TListBox;
    LerrorDef: TListBox;
    Server: TEdit;
    npaq: TEdit;
    cla: TEdit;
    err: TMemo;
    filgen: TListBox;
    SpeedButton1: TSpeedButton;
    ID: TEdit;
    obstxt: TEdit;
    Label1: TLabel;
    pobs: TPanel;
    Panel4: TPanel;
    BTCER: TSpeedButton;
    obs: TMemo;
    QPagos: TSQLQuery;
    SpeedButton4: TSpeedButton;
    SUBIR: TCheckBox;
    Label2: TLabel;
    nreg: TLabel;
    nr: TLabel;
    Label3: TLabel;
    NREGV: TLabel;
    Panel2: TPanel;
    barra: TProgressBar;
    ind: TLabel;
    Label4: TLabel;
    st: TComboBox;
    procedure SpeedButton8Click(Sender: TObject);
    procedure btnConecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cargarConfig;
    procedure CerrarExpClick(Sender: TObject);
    procedure genXMLClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure leerXML(Archivo:string; solo:string);
    procedure BTCERClick(Sender: TObject);
    procedure ListaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  forma: Tforma;
  conectado:boolean;
implementation

{$R *.dfm}


{===============================================================================
 Funcion para encriptar una cadena
 ===============================================================================}
function Encriptar(s:string):string;
var j,cont,k,pos:integer;
    ban:boolean;
    s1:string[42];
    password:array[1..42] of integer;
begin
  randomize();s1:=s;k:=random(10)+1;
  ban:=k mod 2 = 0;pos:=k mod 2+1;cont:=1;
  while s<>'' do begin
    j:=random(10)+1;
    if ban then begin
      if cont mod 2 = 0 then password[pos]:=ord(s[1])+j
      else password[pos]:=ord(s[1])-j;
      password[pos+1]:=65+j;
    end else begin
      if cont mod 2 = 0 then password[pos]:=ord(s[1])-j
      else password[pos]:=ord(s[1])+j;
      password[pos+1]:=65+j;
    end;
    delete(s,1,1);inc(pos,2);inc(cont);
  end;
  if ban then for j:=pos to 40 do password[J]:=ord(random(25)+65)
  else for j:=pos to 41 do password[J]:=ord(random(25)+65);
  if NOT ban then password[1]:=1;
  password[41]:=length(s1)+65;S1:='';
  for j:=1 to 42 do s1:=S1+chr(password[j]);
  encriptar:=s1;
end;


{===============================================================================
 Funcion para desencriptar una cadena ecncriptada
 ===============================================================================}
function Desencriptar(s:string):string;
var j,cont,k,pos:integer;
    ban:boolean;
    s1:string[42];
    ch:char;
begin
  randomize();S1:='';
  If ord(s[1])=1 then begin
      ban:=false;POS:=2;
  end else begin
    ban:=true;pos:=1;
  end;ch:=s[41];
  k:=ord(ch)-65;cont:=1;
  while length(s1)<k  do begin
    ch:=s[pos+1];j:=ord(ch)-65;ch:=s[pos];
    if ban then begin
      if cont mod 2 = 0 then s1:=s1+chr(ord(ch)-j)
      else s1:=s1+chr(ord(ch)+j);
    end else begin
      if cont mod 2 = 0 then s1:=s1+chr(ord(ch)+j)
      else s1:=s1+chr(ord(ch)-j);
    end;inc(pos,2);inc(cont);
  end;
  desencriptar:=s1;
end;

procedure TForma.leerXML(Archivo:string; solo:string);
var
   XML : TXMLDocument;
   cad,empl, PER,TD,TP,UUID:STRING;
   FECHA:TDATETIME;
   num:integer;
   i,j : Integer;
begin
TRY
      XML := TXMLDocument.Create(Self);
      XML.Active := True;
      XML.LoadFromFile(archivo);

      cad:=copy(solo,1,length(solo)-14); //Quitamos el .xml y la fecha del nombre
      for i:=10 to length(cad) do
         begin
            try num:=strtoint(cad[i]) except num:=-1; end;
            if num<>-1 then break;
         end;
       cad:=copy(cad,i,length(cad));

      try UUID :=XML.DocumentElement.ChildNodes[4].ChildNodes[0].Attributes['UUID'];  except obs.Lines.add('El campo UUID no se encontro en el XML '+solo); end;
      try TD :=XML.DocumentElement.ChildNodes[4].ChildNodes[1].Attributes['TotalDeducciones'];  except obs.Lines.add('El campo TotalDeducciones no se encontrio en el XML '+solo); end;
      try TP :=XML.DocumentElement.ChildNodes[4].ChildNodes[1].Attributes['TotalPercepciones'];  except obs.Lines.add('El campo TotalPercepciones no se encontrio en el XML '+solo); end;
      try PER:=XML.DocumentElement.ChildNodes[4].ChildNodes[1].Attributes['FechaInicialPago']; except obs.Lines.add('El campo FechaInicialPago no se encontrio en el XML '+solo); end;
      try EMPL:=XML.DocumentElement.ChildNodes[4].ChildNodes[1].childNodes[1].Attributes['NumEmpleado']; except obs.Lines.add('El campo NumEmpleado no se encontrio en el XML '+solo); end;


      per:=copy(per,9,2)+'/'+copy(per,6,2)+'/'+copy(per,1,4) ;
      AUX.Close;
      aux.sql.text:='insert into fe_xmltimbrados(recibo, empl, totalper, totalded, periodo, uuid, tag, obs, NOMBFILE, STATUS) '+
      ' values ('+#39+cad+#39+','+#39+empl+#39+','+#39+tp+#39+','+#39+td+#39+','+#39+per+#39+','+#39+UUID+#39+','+#39+id.text+
      #39+','+#39+obstxt.text+#39+','+#39+solo+#39+','+#39+copy(st.Text,1,pos('-',st.text)-1)+#39+')';
      aux.ExecSQL;

      if subir.Checked then
         begin
            aux.Close;
            aux.sql.Text:='SELECT COUNT(*) FROM FE_XMLPDF WHERE PAGO='+CAD;
            aux.Open;
            num:=aux.Fields[0].AsInteger;
            AUX.Close;
            if num>0 then
               aux.SQL.Text:='UPDATE FE_XMLPDF SET XML=:ELXML, TAG='+#39+ID.TEXT+#39+', OBS='+#39+obstxt.text+#39+
               ' WHERE PAGO='+CAD
            else
                aux.SQL.Text:='INSERT INTO FE_XMLPDF  ( PAGO,XML,TAG,OBS) VALUES ('+
                cad+','+':ELXML'+','+#39+id.text+#39+','+#39+obstxt.text+#39+')';
            aux.ParamByName('ELXML').LoadFromFile(archivo,ftBlob);
            aux.ExecSQL;
         end;

EXCEPT
   on E: Exception do
      obs.Lines.add(PChar( E.Message )+ ' Recibo No: '+solo); END;

XML.Active := False;
end;


procedure Tforma.SpeedButton8Click(Sender: TObject);
begin
filgen.Items[1]:=dirEnvio.text;
filgen.Items[2]:=numRegPaq.text;
filgen.Items[3]:=user.text;
filgen.Items[4]:=pass.text;
filgen.Items.SaveToFile(extractfiledir(paramstr(0))+'\Config.dll');
PSERVER.VISIBLE:=FALSE;
bdsql.Params[1]:='DataBase='+direnvio.text;
bdsql.Params[2]:='User_Name='+user.text;
bdsql.Params[3]:='Password='+pass.text;
try 
    btnConec.Glyph.LoadFromFile(extractfiledir(paramstr(0))+'\Conectado.bmp');
    conectado:=true;
except
      on E: Exception do
      begin
         Application.MessageBox( PChar( E.Message ), 'Error', MB_ICONSTOP );
         btnConec.Glyph.LoadFromFile(extractfiledir(paramstr(0))+'\Desconectar.bmp');
         conectado:=false;
      end;
end;

end;

procedure Tforma.btnConecClick(Sender: TObject);
begin
if not(conectado) then
   begin
      pserver.Top:=((forma.Height-pserver.Height) div 2);
      pserver.left:=((forma.Width-pserver.Width) div 2);
      pserver.Visible:=TRUE;
      direnvio.SetFocus;
      PSERVER.BringToFront;
   end
else
   begin
        conectado:=false;
        bdsql.Connected:=false;
        btnConec.Glyph.LoadFromFile(extractfiledir(paramstr(0))+'\Desconectar.bmp');
   end;
end;


procedure TForma.cargarConfig;
begin
  try
        filgen.Items.LoadFromFile(extractfiledir(paramstr(0))+'\Config.dll');
        log.text:=FilGen.items[0];
        cla.text:=desencriptar(FilGen.items[6]);
        server.text:=FilGen.items[1];
        npaq.text:=FilGen.items[2];
        numregPaq.Text:= FilGen.items[2];
        dirEnvio.text:=FilGen.items[1];
        user.text:=FilGen.items[3];
        pass.text:=FilGen.items[4];
  except end;
end;


procedure Tforma.FormCreate(Sender: TObject);
begin
     cargarConfig;
     ID.Text:=FORMATDATETIME('DDMMYYYY-HHMMSS',NOW);
     subir.Checked:=true;
end;

procedure Tforma.CerrarExpClick(Sender: TObject);
begin
pexpl.Visible:=false;
end;

procedure Tforma.genXMLClick(Sender: TObject);
begin
pexpl.Visible:=true;
end;

procedure Tforma.SpeedButton1Click(Sender: TObject);
var
i:integer;
begin
ID.Text:=FORMATDATETIME('DDMMYYYY-HHMMSS',NOW);

if conectado then
    begin
      barra.Position:=0;
      barra.Max:= lista.Items.Count-1;
      ind.Caption:='0 de '+inttostr(lista.Items.Count);
      for i:=0 to lista.Items.Count-1 do
         begin
           leerXML(lista.Directory+'\'+lista.Items.Strings[i],lista.Items.Strings[i]);
           BARRA.Update;
           barra.Position:=barra.Position+1;
           ind.Update;
           ind.Caption:=inttostr(barra.Position)+' de '+inttostr(lista.Items.Count);
        end;

      Qpagos.close;
      qpagos.sql.text:='SELECT COUNT(*) FROM FE_XMLTIMBRADOS WHERE TAG='+#39+ID.Text+#39;
      Qpagos.OPEN;
      NREG.Caption:=QPAGOS.Fields[0].asstring;

      Qpagos.close;
      qpagos.sql.text:='SELECT COUNT(*) FROM FE_XMLTIMBRADOS WHERE TAG='+#39+ID.Text+#39+
      ' and recibo in (select A.VDPA_PAGO from FE_CQPVDPAGOS A) ';
      Qpagos.OPEN;
      NREGV.Caption:=QPAGOS.Fields[0].asstring;



      pobs.Visible:=true;
      pobs.Align:=alclient;
      BTCER.Left:=  PANEL4.Width-26;
  end
else
   showmessage('No se ha realizado la conexion a Oracle');

end;

procedure Tforma.BTCERClick(Sender: TObject);
begin
pobs.Visible:=false;
end;

procedure Tforma.ListaChange(Sender: TObject);
begin
nr.Caption:='No. XML: '+inttostr(lista.Items.count);
end;

end.
