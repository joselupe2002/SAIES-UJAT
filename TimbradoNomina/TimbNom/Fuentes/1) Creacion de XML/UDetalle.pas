unit UDetalle;

interface

uses
  Windows, Messages, StdCtrls, Buttons, Menus, Dialogs, ExtCtrls, Controls,
  FileCtrl, dxCore, dxButton, Graphics, ComCtrls, Grids, Classes, variants,
  Forms, oleServer, ExcelXP,ClipBrd, SysUtils, Comobj, ExtActns, DBXpress,
  DB, SqlExpr, FMTBcd, acPNG, DBGrids, Provider, DBClient, Gauges, xmldom, XMLIntf, msxmldom, XMLDoc;


type
  TForma = class(TForm)
    Server: TEdit;
    npaq: TEdit;
    LerrorDef: TListBox;
    BDSQL: TSQLConnection;
    q: TSQLQuery;
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
    FilPrueba: TListBox;
    filgen: TListBox;
    log: TEdit;
    cla: TEdit;
    err: TMemo;
    et: TLabel;
    Panel1: TPanel;
    btnConec: TSpeedButton;
    genXML: TSpeedButton;
    PXML: TPanel;
    Label1: TLabel;
    per: TComboBox;
    anio: TEdit;
    Label2: TLabel;
    elPeriodo: TEdit;
    Label3: TLabel;
    QPagos: TSQLQuery;
    CDPagos: TClientDataSet;
    dsPagos: TDataSource;
    ProvPagos: TDataSetProvider;
    SpeedButton1: TSpeedButton;
    PPagos: TPanel;
    etNumPagos: TLabel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    TIPONOM: TComboBox;
    btnGenXML: TSpeedButton;
    barra: TGauge;
    procedure CMAfterShow(var Msg: TMessage);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure btnConecClick(Sender: TObject);
      procedure cargarConfig;
    procedure genXMLClick(Sender: TObject);
    procedure perChange(Sender: TObject);
    procedure anioChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGenXMLClick(Sender: TObject);
    function GenerarRecibo:Boolean;
    procedure IniciaBarra(Titulo:string; numReg:integer);

  private
    { Private declarations }
    applicationDirectory : String;
    generationDirectory  : String;
    text : TStringList;

  public
    { Public declarations }
  end;

var
  Forma: TForma;
  larutaGen:String;

  lineaG, ColG, Lineab, colB:integer;
  LinError, ColError:integer;
  ponerDesc:boolean;
  posError,Descrip: String;
  cadBuscar:string;
  presEsc:boolean;
  HabCeldas:boolean;
  numLinCop:integer;
  validarPrimero:integer;
  numTotCol:integer;
  cambios:boolean;
  AbrioFile:boolean;
  XFILE:INTEGER;
  portapapeles:boolean;
  conectado:boolean;
  quenom:string;

const
  CM_AFTERSHOW = WM_USER + 1;

implementation
    uses uResultForm ;



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

procedure savetofile(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
l.Add(s);
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;

{===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin
   if pos(separador,cad)>0 then
      str_:=copy(cad,1,pos(separador,cad)-1)
   else
      str_:=cad;
end;


procedure TForma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;








procedure TForma.CMAfterShow(var Msg: TMessage);
begin
  Self.Close;
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


procedure TForma.FormCreate(Sender: TObject);
var
x:integer;
begin

  applicationDirectory := ExtractFilePath(Application.ExeName);

conectado:=false;
anio.Text:=formatdatetime('YYYY',NOW);
elPeriodo.Clear;

XFILE:=0;
POSERROR:='';
linError:=1;
colError:=0;
portapapeles:=false;

cargarConfig;

cambios:=false;
AbrioFile:=false;




end;





procedure TForma.SpeedButton8Click(Sender: TObject);

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

procedure TForma.SpeedButton11Click(Sender: TObject);
begin
//copiarGrid(Grid);
end;

procedure TForma.btnConecClick(Sender: TObject);
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




procedure TForma.genXMLClick(Sender: TObject);
begin

pxml.Visible:=not (pxml.Visible);

end;

procedure TForma.perChange(Sender: TObject);
begin
elPeriodo.text:=per.text+'/'+anio.text;
if str_(tiponom.text,'-')='HON' then quenom:=CHR(39)+'HO'+CHR(39)+','+CHR(39)+'O'+CHR(39)+','+
                                             CHR(39)+'N'+CHR(39)+','+CHR(39)+'E'+CHR(39)+','+
                                             CHR(39)+'FO'+CHR(39)+','+CHR(39)+'C'+CHR(39);
if str_(tiponom.text,'-')='V' then quenom:=CHR(39)+'V'+CHR(39)+','+CHR(39)+'FV'+CHR(39);
if str_(tiponom.text,'-')='H' then quenom:=CHR(39)+'H'+CHR(39)+','+CHR(39)+'FH'+CHR(39);
if str_(tiponom.text,'-')='J' then quenom:=CHR(39)+'PO'+CHR(39)+','+CHR(39)+'FP'+CHR(39);
if str_(tiponom.text,'-')='D' then quenom:=CHR(39)+'DI'+CHR(39);

end;

procedure TForma.anioChange(Sender: TObject);
begin
elPeriodo.text:=per.text+'/'+anio.text;
end;

procedure TForma.SpeedButton1Click(Sender: TObject);
begin
qpagos.close;
qpagos.sql.text:='SELECT DISTINCT(J.VDPA_PAGO) AS ID_RECIBO, '+
'K.PERS_NOMBRE||'+#39+' '+#39+'||K.PERS_APEPAT||'+#39+' '+#39+'||K.PERS_APEMAT AS NOMBRE,'+
'K.PERS_RFC AS RFC,L.ATRE_EMAIL AS MAIL,L.ATRE_CURP AS CURP,J.vdpa_regimen AS REGIMEN,'+
'nvl(L.ATRE_NUMSS,'+#39+'99999999999'+#39+') AS NSS,J.VDPA_PERIODO+14 AS FECHA_PAGO,'+
'J.VDPA_PERIODO AS FEC_INI_PAGO,DECODE(TO_CHAR(J.VDPA_PERIODO,'+#39+'DD'+#39+'),'+#39+'01'+#39+
',TO_CHAR(J.VDPA_PERIODO+14,'+#39+'DD/MM/YYYY'+#39+'),TO_CHAR(LAST_DAY(J.VDPA_PERIODO),'+#39+'DD/MM/YYYY'+#39+'))  AS FEC_FIN_PAGO, '+
'15 AS N_DIAS_PAGO,M.URES_DESCRIP AS DEPARTAMENTO,decode(j.vdpa_formapago,'+#39+'02'+#39+','+#39+''+#39+',J.VDPA_CUENTA) AS CUENTA_EMPL,'+
'decode(j.vdpa_formapago,'+#39+'02'+#39+','+#39+''+#39+',J.VDPA_BANCO) AS DESC_BANCO, '+
'FE_FIniRelLab(J.VDPA_EMPL, J.VDPA_TPSTO, J.VDPA_PERIODO, j.vdpa_quenom) AS FECHA_INGRESO,j.vdpa_jornada as jornada,'+
'0 AS ANTIG_SEM,N.PUES_DESCRIP AS PUESTO,J.VDPA_CONTRATO AS CONTRATO, '+
//#39+'04'+#39+'  AS PERIODO, '+
//'J.VDPA_SDODIARIO AS SALARIO_BASE, '+
//'J.VDPA_EMPL AS EMPL,'+
//'J.VDPA_SDODIARIO AS SAL_DIA, '+
//'J.VDPA_FORMAPAGO AS FORMA_PAGO,j.vdpa_origen as FF, '+
//'J.VDPA_MONTOP AS MONTO_IP,J.VDPA_MONTOF AS MONTO_IF, '+
'FE_CQESSINDICO(J.VDPA_EMPL, J.VDPA_TPSTO) AS SINDICALIZADO, '+
' J.VDPA_JORNADA AS JORNADA '+
'FROM FE_CQPVDPAGOS J, FPERSONAS K, CQVPATREMPL L, FURES M, TODOSPUESTO N  '+
'WHERE J.VDPA_PERIODO='+#39+Elperiodo.text+#39+
'AND J.VDPA_EMPL=K.PERS_PERSONA AND K.PERS_PERSONA=L.ATRE_EMPL AND J.VDPA_URES=M.URES_URES '+
'AND J.VDPA_PSTO=N.PUES_PSTO AND j.VDPA_QUENOM in ('+QUENOM+')';
savetofile(qpagos.sql.Text);
qpagos.Open;
cdPagos.Open;
ppagos.Visible:=TRUE;
etNumPagos.caption:='Número total de registros: '+inttostr(cdPagos.RecordCount);
end;


function TForma.GenerarRecibo: Boolean;
VAR
totp:real;
totd:real;
TOTop:real;
elCFDI: TXMLDocument;
Nodo,Comprobante, Emisor, entidadSNCF, Regimen, Receptor,
Conceptos, Complementos, Nomina12, percep, deduc: IXMLNode;

Begin
  totp:=0;
  totd:=0;
  Q.close;
  q.sql.text:='SELECT SUM(VDPA_MONTO) FROM FE_CQPVDPAGOS S WHERE S.VDPA_PAGO='+cdPagos.fieldbyname('ID_RECIBO').asstring+
  ' AND VDPA_PERDED='+#39+'P'+#39;
  Q.open;
  TOTP:=q.fields[0].asfloat;

  Q.close;
  q.sql.text:='SELECT SUM(VDPA_MONTO) FROM FE_CQPVDPAGOS S WHERE S.VDPA_PAGO='+cdPagos.fieldbyname('ID_RECIBO').asstring+
  ' AND VDPA_PERDED='+#39+'D'+#39;
  Q.open;
  TOTD:=q.fields[0].asfloat;


  Q.close;
  q.sql.text:='SELECT SUM(VDPA_MONTO) FROM FE_CQPVDPAGOS S, PCONCEPTO T WHERE S.VDPA_PAGO='+cdPagos.fieldbyname('ID_RECIBO').asstring+
  ' AND VDPA_PERDED='+#39+'D'+#39+' AND VDPA_CONP=CONC_CONP AND CONC_OPSAT='+#39+'S'+#39;
  Q.open;
  TOTop:=q.fields[0].asfloat;

  elCFDI := TXMLDocument.Create(Application);
try
// Activamos el archivo XML
elCFDI.Active := True;
elCFDI.Version:='1.0';
elCFDI.Encoding:='UTF-8';

// Creamos el elemento principal: EsteEsElementoPrincipal //
Comprobante := elCFDI.AddChild('cfdi:Comprobante');
Comprobante.Attributes['xmlns:cfdi']:=  'http://www.sat.gob.mx/cfd/3';
Comprobante.Attributes['xmlns:xsi']:=  'http://www.w3.org/2001/XMLSchema-instance';
Comprobante.Attributes['xsi:schemaLocation']:=  'http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd';
Comprobante.Attributes['version']:='3.2';

Emisor:=comprobante.AddChild('cfdi:Emisor');
Emisor.Attributes['rfc']:= 'UJA5801014N3';
Emisor.Attributes['Nombre']:='UNIVERSIDAD JUÁREZ AUTÓNOMA DE TABASCO';
Regimen:= emisor.AddChild('RegimenFiscal');
Regimen.Attributes['Regimen']:='601';

Receptor:= comprobante.AddChild('cfdi:Receptor');
Receptor.Attributes['rfc']:= cdpagos.fieldbyname('RFC').asstring;
Receptor.Attributes['Nombre']:=cdpagos.fieldbyname('NOMBRE').asstring;

Conceptos:= comprobante.AddChild('cfdi:Conceptos');
Nodo:=Conceptos.AddChild('cfdi:Concepto');
nodo.Attributes['cantidad']:='1';
nodo.Attributes['unidad']:='ACT';
nodo.Attributes['descripcion']:='Pago de nómina';
nodo.Attributes['valorUnitario']:=floattostr(totp);
nodo.Attributes['importe']:=floattostr(totp);

Complementos:= comprobante.AddChild('cfdi:Complemento');
nomina12:=Complementos.AddChild('nomina12:nomina');
nomina12.Attributes['xmlns:nomina12']:='http://www.sat.gob.mx/nomina12';
nomina12.Attributes['Version']:='1.2';
nomina12.Attributes['FechaPago']:=cdpagos.fieldbyname('fechapago').asstring;
nomina12.Attributes['FechaInicialPago']:=cdpagos.fieldbyname('fec_ini_pago').asstring;
nomina12.Attributes['FechaFinalPago']:=cdpagos.fieldbyname('fec_fin_pago').asstring;
nomina12.Attributes['NumDiasPagados']:=cdpagos.fieldbyname('n_dias_pago').asstring;
nomina12.Attributes['TipoNomina']:='O';
nomina12.Attributes['TotalDeducciones']:=floattostr(totd);
nomina12.Attributes['TotalOtrosPagos']:=floattostr(totop);
nomina12.Attributes['TotalPercepciones']:=floattostr(totd);
nomina12.Attributes['xsi:schemaLocation']:='http://www.sat.gob.mx/nomina12 http://www.sat.gob.mx/informacion_fiscal/factura_electronica/Documents/Complementoscfdi/nomina12.xsd';

Emisor:=nomina12.AddChild('nomina12:Emisor');
emisor.Attributes['RegistroPatronal']:='5525665412';
entidadSNCF:=Emisor.AddChild('nomina12:EntidadSNCF');
entidadSNCF.Attributes['OrigenRecurso']:=cdpagos.fieldbyname('FF').asstring;


Receptor:=nomina12.AddChild('nomina12:Receptor');
Receptor.Attributes['Curp']:=cdpagos.fieldbyname('FF').asstring;
Receptor.Attributes['NumSeguridadSocial']:=cdpagos.fieldbyname('NSS').asstring;
Receptor.Attributes['FechaInicioRelLaboral']:=cdpagos.fieldbyname('FECHA_INGRESO').asstring;
Receptor.Attributes['Antigüedad']:='P'+FLOATTOSTR(((now-cdpagos.fieldbyname('FECHA_INGRESO').asdatetime)/7))+'W';
Receptor.Attributes['TipoContrato']:=cdpagos.fieldbyname('CONTRATO').asstring;
Receptor.Attributes['Sindicalizado']:=cdpagos.fieldbyname('SINDICALIZADO').asstring;
Receptor.Attributes['TipoJornada']:=cdpagos.fieldbyname('JORNADA').asstring;
Receptor.Attributes['TipoRegimen']:=cdpagos.fieldbyname('REGIMEN').asstring;
Receptor.Attributes['NumEmpleado']:=cdpagos.fieldbyname('EMPL').asstring;
Receptor.Attributes['Departamento']:=cdpagos.fieldbyname('DEPARTAMENTO').asstring;
Receptor.Attributes['Puesto']:=cdpagos.fieldbyname('PUESTO').asstring;
Receptor.Attributes['RiesgoPuesto']:='1';
Receptor.Attributes['PeriodicidadPago']:=cdpagos.fieldbyname('PERIODO').asstring;
Receptor.Attributes['Banco']:=cdpagos.fieldbyname('DESC_BANCO').asstring;
Receptor.Attributes['CuentaBancaria']:=cdpagos.fieldbyname('CUENTA_EMPL').asstring;
Receptor.Attributes['SalarioBaseCotApor']:=cdpagos.fieldbyname('SALARIO_BASE').asstring;
Receptor.Attributes['SalarioDiarioIntegrado']:=cdpagos.fieldbyname('SAL_DIA').asstring;
Receptor.Attributes['ClaveEntFed']:='TAB';



percep:=nomina12.AddChild('nomina12:Percepciones');
percep.Attributes['TotalGravado']:='';
percep.Attributes['TotalExento']:='';
percep.Attributes['TotalSueldos']:='';
nodo:=percep.AddChild('nomina12:Percepcion') ;
nodo.Attributes['TipoPercepcion']:='049';
nodo.Attributes['Clave']:='01';
nodo.Attributes['Concepto']:='Sueldos, Salarios Rayas y Jornales';
nodo.Attributes['ImporteGravado']:='100.0';
nodo.Attributes['ImporteExento']:='0.0';

deduc:=nomina12.AddChild('nomina12:Deducciones');
deduc.Attributes['TotalOtrasDeducciones']:='';
deduc.Attributes['TotalImpuestosRetenidos']:='';

nodo:=deduc.AddChild('nomina12:Deduccion') ;
nodo.Attributes['TipoDeduccion']:='002';
nodo.Attributes['Clave']:='001';
nodo.Attributes['Concepto']:='ISR';
nodo.Attributes['Importe']:='100.0';



// guardamos los datos del fichero con el nombre indicado
elCFDI.SaveToFile(larutaGen+'\'+cdpagos.fieldbyname('EMPL').asstring+
                                cdpagos.fieldbyname('ID_RECIBO').asstring+'.xml');

finally
elCFDI.Free;
end;

end;

procedure TForma.btnGenXMLClick(Sender: TObject);
var
x:integer;
tot:integer;
peri:string;
begin
peri:=stringReplace(elperiodo.text,'/','_',[rfReplaceAll ]);
createdir(extractfiledir(paramstr(0))+'\xml\'+peri);
createdir(extractfiledir(paramstr(0))+'\xml\'+peri+'\'+tiponom.text);
larutaGen:=extractfiledir(paramstr(0))+'\xml\'+peri+'\'+tiponom.text;

x:=1;
tot:=cdPagos.RecordCount;
cdPagos.First;
barra.MinValue:=0;
barra.maxvalue:=cdpagos.RecNo;
while not (cdPagos.eof) do
  begin
      et.Caption:=inttostr(x)+' de '+inttostr(tot);
      et.Update;
      GenerarRecibo;
      cdPagos.Next;
      barra.AddProgress(1);
      x:=x+1;
  end;
end;



procedure TForma.IniciaBarra(Titulo:string; numReg:integer);
begin
   barra.MinValue:=1;
   barra.MaxValue:=numReg;
   BARRA.Progress:=1;
end;


end.
