unit ATexto;
{
-------------------------------------------------------------------------
ENTRADA : Número (Currency o Extended)
SALIDA  : Cadena de texto que representa el número
EJEMPLO : 38 -> treinta y ocho
-------------------------------------------------------------------------
FECHA   : 07 -abril-1998   [17:03]
VERSIÓN : 1.2
AUTOR   : Antoni Aloy López
E-MAIL  : tonialoy@yahoo.com
-------------------------------------------------------------
FECHA   : 09 -noviembre-2000   [21:34]
VERSIÓN : 2.0
AUTOR   : Savierhs López Arteaga
E-MAIL  : savierhs@hotmail.com
-------------------------------------------------------------------------
HISTORIA:
Versión 0.99 -> Sólo funciona hasta 99 millones
versión 1.0  -> Se amplía el funcionamiento a las centenas de millón
		Se corrige un error en las centenas de millón que
		hacía que saliesen en femenino.
versión 1.1  -> Se corrige un error que hacía que las decenas y centenas
		de millon salgan en femenino cuando acaban en uno.
versión 1.2  -> Se actualiza el componente para que admita valores decimales
		y dé la salida en euros.
		Se ha añadido una opción para determinar el separador de
		centimos, y una nueva propiedad que nos da los céntimos
		Se corrigen algunos acentos.
		ATENCIÓN: Con esta versión cambio el e-mail de consultas a
			  tonialoy@yahoo.com
versión 2.0  -> Ahora traduce valores menores a 10 Trillones.
                Se optimizan todas las rutinas de conversión de numeros.
                Se reemplazan algunas otras rutinas.
                Se agrega una propiedad que permite indicar el tipo de
                moneda en la salida Ej: euros o pesetas.
                Se agrega una propiedad que permite indicar el tipo de
                centimos o centavos en la salida Ej: ctvs. o centimos.
                Se renombra la propiedad "Euros" por "Masculino", la
                cual decide sobre las terminaciones de la descripción.
                Se corrigen otros acentos.
                NOTA: Tambien puede enviar cualquier consulta al
                      siguiente E-Mail: savierhs@hotmail.com
--------------------------------------------------------------------------
Este componente se pone a dominio público, aunque me reservo el derecho
sobre su autoría. Es decir, puede utilizarse y modificarse libremente
siempre y cuando se me cite como autor del componente original.

Como siempre, no existen garantías de que el componente funcione en todas
las circunstancias, úsalo a tu cuenta y riesgo.

Comentarios, albanzas y agradecimiento enterno,... serán bien recibidos.
--------------------------------------------------------------------------
ATENCIÓN:
  Si ya tiene instalado este componente, desinstalelo antes de colocar
  la nueva versión
--------------------------------------------------------------------------
}

interface

uses
  SysUtils, Classes;

type
  TLetras = class(TComponent)
  private
    FNumero: Extended;  //Ha cambiado de Currency a Extended (puede recibir Currency).
    FMasculino: Boolean;//Monedas en masculino Ej: Euros, Pesos, Soles, etc.
    FSeparador: Char;   //Innecesario pero no molesta.
    FMoneda: String;    //Especifica la moneda Ej: Euros, Pesetas, Pesos, etc.
    FCentavos: String;  //Especifica los centavos Ej: ctvs.
    function NumeroATexto: String;
    function GetCentimos: String;

  public
    constructor Create(AOwner:TComponent);override;
    property AsString: String read NumeroATexto;
    property Centimos: String read GetCentimos;

  published
    property Masculino: Boolean read FMasculino write FMasculino default true;
    property Numero: Extended read FNumero Write FNumero;
    property Separador:Char read FSeparador Write FSeparador;
    property Moneda: String read FMoneda Write FMoneda;
    property Centavos: String read FCentavos Write FCentavos;
  end;

procedure Register;

implementation

(*** Optimizado ***)
constructor TLetras.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FMasculino := True;  //por defecto, puede cambiarlo segun su necesidad.
  FNumero    := 0;
  FMoneda    := '';
  FCentavos  := '';
  FSeparador := DecimalSeparator;  //El separador decimal de su P.C.
end;

(*** Optimizada ***)
function TLetras.NumeroATexto: String;
     (*** NUEVA ***)
     (*** Ej: 'treinta y una millones' --> 'treinta y un millones' ***)
     function Cambiar_na_a_masculino(Texto: String): String;
     var
       P: Integer;
     begin
       Result:= Texto;
       P:= Pos('na', Result);
       while P > 0 do begin
         Delete(Result, P+1, 1);
         P:= Pos('na', Result);
       end;
     end;

     (*** NUEVA ***)
     (*** Ej: 'quinientas millones' --> 'quinientos millones' ***)
     function Cambiar_as_a_masculino(Texto: String): String;
     var
       P: Integer;
     begin
       Result:= Texto;
       P:= Pos('as', Result);
       while P > 0 do begin
         Result[P]:='o';
         P:= Pos('as', Result);
       end;
     end;

     (*** Optimizada ***)
     function Unidades(numero:Integer): String;
     begin
       case numero of
         0: Result:='';
         1: if FMasculino
            then Result:='un'
            else Result:='una';
         2: Result:='dos';
         3: Result:='tres';
         4: Result:='cuatro';
         5: Result:='cinco';
         6: Result:='seis';
         7: Result:='siete';
         8: Result:='ocho';
         9: Result:='nueve';
       end;
     end;

     (*** Optimizada ***)
     function Decenas(numero:integer): String;
     begin
       Case numero of
         0:Result:='';
         1..9:Result:=Unidades(numero);
         10: Result:='diez';
         11: Result:='once';
         12: Result:='doce';
         13: Result:='trece';
         14: Result:='catorce';
         15: Result:='quince';
         16: Result:='dieciséis';
         17: Result:='diecisiete';
         18: Result:='dieciocho';
         19: Result:='diecinueve';
         20: Result:='veinte';
         21,24,25,27..29: Result:='veinti'+Unidades(numero mod 10);
         22: Result:='veintidós';
         23: Result:='veintitrés';
         26: Result:='veintiséis';
         30: Result:='treinta';
         40: Result:='cuarenta';
         50: Result:='cincuenta';
         60: Result:='sesenta';
         70: Result:='setenta';
         80: Result:='ochenta';
         90: Result:='noventa';
         else Result:=Decenas(numero - numero mod 10)+' y '+ unidades(numero mod 10);
       end;
     end;

     (*** Optimizada ***)
     function Centenas(numero:integer): String;
     begin
       case numero of
         0: Result:='';
         1..99: Result:=Decenas(numero);
         100: Result:='cien';
         101..199: Result:='ciento '+Decenas(numero mod 100);
         500: if FMasculino
              then Result:='quinientos '
              else Result:='quinientas ';
         700: if FMasculino
              then Result:='setecientos '
              else Result:='setecientas ';
         900: if FMasculino
              then Result:='novecientos '
              else Result:='novecientas ';
         501..599,
         701..799,
         901..999: Result:= Centenas(numero - numero mod 100)+Decenas(numero mod 100);
         else if FMasculino
              then Result:=Unidades(numero div 100)+'cientos'+' '+Decenas(numero mod 100)
              else Result:=Unidades(numero div 100)+'cientas'+' '+Decenas(numero mod 100);
       end;
     end;

     (*** NUEVA ***)
     (*** Esta funcion traduce los números menores a un millón ***)
     function Millares(numero: Longint): String;
     begin
       if numero > 999 then begin
         if numero > 1999
         then Result:= Centenas(numero div 1000)+' mil '+Centenas(numero mod 1000)
         else Result:= 'mil '+Centenas(numero mod 1000);
       end else
         Result:= Centenas(numero);
     end;

     (*** NUEVA ***)
     (*** Esta funcion traduce los números menores a un billón ***)
     function Millones(numero: Extended):String;
     var tmp : String;
         A, B: Longint;
     begin
       A:= Trunc(numero * 0.000001);
       B:= Trunc(numero - (A / 0.000001));
       if A = 1 then
         Result:= 'un millón '+Millares(B)
       else begin
         tmp:= Millares(A);
         if Trim(tmp) <> '' then begin
           tmp:= Cambiar_as_a_masculino(tmp);
           tmp:= Cambiar_na_a_masculino(tmp);
           Result:= tmp+' millones '+Millares(B);
         end else
           Result:= Millares(B);
       end;
     end;

     (*** NUEVA ***)
     (*** Esta funcion traduce los números menores a un trillón ***)
     function Billones(numero: Extended):String;
     var tmp: String;
         A: Longint;
         B: Extended;
     begin
       A:= Trunc(numero * 0.000000000001);
       B:= numero - (A / 0.000000000001);
       if A = 1 then
         Result:= 'un billón '+Millones(B)
       else begin
         tmp:= Millares(A);
         if Trim(tmp) <> '' then begin
           tmp:= Cambiar_as_a_masculino(tmp);
           tmp:= Cambiar_na_a_masculino(tmp);
           Result:= tmp+' billones '+Millones(B);
         end else
           Result:= Millones(B);
       end;
     end;

     (*** NUEVA ***)
     (*** Esta funcion traduce los números menores a 10 trillones, no he
       podido traducir cifras superiores por la simple razon de que los
       números EXTENDED sólo tienen 19 cifras significativas y la traducción
       sale herrada, además, no creo que las necesite :) ***)
     function Trillones(numero: Extended):String;
     var tmp: String;
         A: Longint;
         B: Extended;
     begin
       A:= Trunc(numero * 0.000000000000000001);
       B:= numero - (A / 0.000000000000000001);
       if A = 1 then
         Result:= 'un trillón '+Billones(B)
       else begin
         if A <= 9 then begin
           tmp:= Millares(A);
           if Trim(tmp) <> '' then begin
             tmp:= Cambiar_as_a_masculino(tmp);
             tmp:= Cambiar_na_a_masculino(tmp);
             Result:= tmp+' trillones '+Billones(B);
           end else
             Result:= Billones(B);
         end else
           Result:= '# # # # # # # # #';
       end;
     end;

     (*** NUEVA ***)
     (*** Suprime los caracteres [espacio] que se encuentren junto a otros
       caracteres [espacio].
       Ej: 'mil  cien' --> 'mil cien' ***)
     function CorrigeTexto(Frase: String): String;
     var
       P: Integer;
     begin
       Result:= LowerCase(Frase);
       P:= Pos('  ', Result);
       while P > 0 do begin
         Delete(Result, P, 1);
         P:= Pos('  ', Result);
       end;
     end;

var
  S: String;
  Num_Ctvs  : Integer;
  Num_Largo : Extended;
begin
  FNumero      := Abs(FNumero);
  Num_Largo    := Int(FNumero);

  //si es menor que mil billones... tomamos en cuenta los decimales,
  //de lo contrario no podemos tomarlos en cuenta... por aquello de
  //las cifras significativas... uds. saben...
  if Num_Largo < 1000000000000000.0 then begin
    S:= FormatFloat('0.00', FNumero);
    Num_Ctvs := StrToInt(Copy(S, Length(S)-1, 2));
  end else
    Num_Ctvs := 0;

  //Se traduce la cifra sin decimales
  S:= Trillones(Num_Largo);

  //Se traducen los decimales
  if (Num_Ctvs > 0)
  then Result:= Decenas(Num_Ctvs)+' '+FCentavos
  else Result:= '';

  //Compactamos en un solo texto
  if (Trim(S) <> '') then begin
    if (Result <> '')
    then Result:= Trim(S) +' ' +FMoneda +' con '+ Result
    else Result:= Trim(S) +' ' +FMoneda;
  end;

  //quitamos los caracteres [espacio] junto a otros caracteres [espacio]
  Result:= CorrigeTexto(Result);
end;

function TLetras.GetCentimos:String;
var
  Num_Ctvs, I: Integer;
  S: String;
  tmp: Extended;
begin
  S := FormatFloat('0.00',Fnumero);
  I := Pos(FSeparador, S);
  S := Copy(S, I+1, 2);
  Num_Ctvs:= StrToInt(S);
  tmp:= FNumero;
  FNumero:= Num_Ctvs;
  Result := NumeroATexto;
  FNumero:= tmp;
end;

procedure Register;
begin
  RegisterComponents('AloySoft',[TLetras]);
end;

end.
