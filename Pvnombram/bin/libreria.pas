unit libreria;

interface

uses Sysutils, Classes, Dialogs, Controls, StdCtrls, DBTables, DB, error ;

function replicate(car : Char ; num :Integer):String ;
function pad(cadena : String ; tip,car : Char ; esp : Integer): String;
function cmes( fecha : TDateTime ; lengua : Char ) : String ;
function pesos (canti : Integer) : String ;
function orclfecha(fecha : String) : String ;
function vfecha(cfecha : TEdit ) : Boolean ;
function DiasDelMes( fecha : TDateTime) : Integer;
function iif(expresion : Boolean ; value1, value2 : variant) : variant ;
procedure vcurr(ccurr : TEdit) ;
procedure OraErr(E : Exception)  ;

implementation

function replicate(car : Char ; num :Integer):String ;
begin
 result := '' ;
 while length(result) < num do result := result+ car ;
end ;

function pad(cadena : String ; tip,car : Char ; esp : Integer): String;
var num : Integer ;
begin
 num := esp - length(cadena) ;
 if num < 0 then result := replicate(car,esp)
 else if tip= 'R' then result := replicate(car,num)+ cadena
 else if tip= 'L' then result := cadena+ replicate(car,num)
 else if tip= 'C' then
  begin
   num := num div 2 ;
   result := replicate(car,num)+ cadena+ replicate(car,num);
   if length(result) < esp then result := result+ car;
  end ;
end;

function cmes( fecha : TDateTime ; lengua : Char ) : String ;
var mes : integer ;
begin
 mes := StrToInt(copy(DateToStr(fecha),4,2)) ;
 case mes of
   1: if lengua= 'I' then result := 'JANUARY' else result := 'ENERO' ;
   2: if lengua= 'I' then result := 'FEBRUARY' else result := 'FEBRER0' ;
   3: if lengua= 'I' then result := 'MARCH' else result := 'MARZO' ;
   4: if lengua= 'I' then result := 'APRIL' else result := 'ABRIL' ;
   5: if lengua= 'I' then result := 'MAY' else result := 'MAYO' ;
   6: if lengua= 'I' then result := 'JUNE' else result := 'JUNIO' ;
   7: if lengua= 'I' then result := 'JULY' else result := 'JULIO' ;
   8: if lengua= 'I' then result := 'AUGUST' else result := 'AGOSTO' ;
   9: if lengua= 'I' then result := 'SEPTEMBER' else result := 'SEPTIEMBRE' ;
  10: if lengua= 'I' then result := 'OCTOBER' else result := 'OCTUBRE' ;
  11: if lengua= 'I' then result := 'NOVEMBER' else result := 'NOVIEMBRE' ;
  12: if lengua= 'I' then result := 'DECEMBER' else result := 'DICIEMBRE' ;
 else
  result := '' ;
 end ;
end ;

function pesos (canti : Integer) : String ;
 var unidad,decena, centena : TStringList ;
     millon, miles, xresto : Integer ;
     fmiles : Currency ;
     cadena : String ;
function resto (cual : Integer) : String ;
var cade : String ;
    cent, dece, unid : Integer ;
begin
 cade := '' ;
{ Centenas }
 cent := StrToInt(FloatToStr(Int(cual/100))) ;
 if cent > 0 then cade := centena[cent]+ ' ' ;

 { Decenas }
 dece := StrToInt( FloatToStr( Int((cual - (cent * 100))/10) ) ) ;
 if dece > 0 then cade := cade+ decena[dece]+ ' ' ;

 { Unidades }
 unid := cual - ( (cent * 100) + (dece * 10)) ;
 if unid > 0 then
 case dece of
  1:
  begin
   cade := copy(cade, 1, length(cade) - 5) ;
   if (unid > 0) and (unid < 6) then
   cade := cade+ unidad[10+unid]
   else cade := cade+ 'DIECI'+ unidad[unid] ;
  end ;

  2:  cade := copy(cade, 1, length(cade)- 7) + 'VEINTI'+ unidad[unid] ;
 else
  begin
   if not ( (length(cade)= 0) or (dece= 0) ) then cade := cade+ 'y ' ;
   cade := cade+ unidad[unid] ;
  end ;
 end ;

 if (cent= 1) and (dece= 0) and (unid= 0) then cade := 'CIEN' ;

 result := Trim(cade) ;
end ;

begin
 if canti > 999999999 then
 begin
  result := '***************' ;
  abort ;
 end ;

 cadena := '' ;
 unidad  := TStringList.Create ;
 decena  := TStringList.Create ;
 centena := TStringList.Create ;

 unidad.Add('Salen todos') ;
 unidad.Add('UN') ;
 unidad.Add('DOS') ;
 unidad.Add('TRES') ;
 unidad.Add('CUATRO') ;
 unidad.Add('CINCO') ;
 unidad.Add('SEIS') ;
 unidad.Add('SIETE') ;
 unidad.Add('OCHO') ;
 unidad.Add('NUEVE') ;
 unidad.Add('DIEZ') ;
 unidad.Add('ONCE') ;
 unidad.Add('DOCE') ;
 unidad.Add('TRECE') ;
 unidad.Add('CATORCE') ;
 unidad.Add('QUINCE') ;

 decena.Add('Salen Todos') ;
 decena.Add('DIEZ') ;
 decena.Add('VEINTE') ;
 decena.Add('TREINTA') ;
 decena.Add('CUARENTA') ;
 decena.Add('CINCUENTA') ;
 decena.Add('SESENTA') ;
 decena.Add('SETENTA') ;
 decena.Add('OCHENTA') ;
 decena.Add('NOVENTA') ;

 centena.Add('Salen Todos') ;
 centena.Add('CIENTO') ;
 centena.Add('DOSCIENTOS') ;
 centena.Add('TRESCIENTOS') ;
 centena.Add('CUATROCIENTOS') ;
 centena.Add('QUINIENTOS') ;
 centena.Add('SEISCIENTOS') ;
 centena.Add('SETECIENTOS') ;
 centena.Add('OCHOCIENTOS') ;
 centena.Add('NOVECIENTOS') ;

{ Calcula Millones }
 millon := StrToInt( FloatToStr( INT(canti/1000000) ) ) ;
 if millon = 1 then cadena := resto(millon)+ ' MILLON ' ;
 if millon > 1 then cadena := resto(millon)+ ' MILLONES ' ;

{ Calcula Miles }
 fmiles := (canti - (millon * 1000000) )/1000 ;
 miles := StrToInt(FloatToStr( INT(fmiles))) ;
 if miles = 1 then cadena := cadena+ 'MIL ' ;
 if miles > 1 then cadena := cadena+ resto(miles)+ ' MIL ' ;

{Calcula resto }
 xresto := canti - ( (millon * 1000000) + (miles * 1000) ) ;
 if xresto > 0 then cadena := cadena  + resto(xresto) ;

 if length(cadena) = 0 then cadena := 'CERO' ;
 result := cadena ;
end ;

function vfecha(cfecha : TEdit ) : Boolean ;
var fecha : TDate ;
begin
 try
  fecha := StrToDate(cfecha.text) ;
  cfecha.Text := DateToStr(fecha) ;
  result := True ;
 except
  cfecha.SetFocus ;
  showmessage('Fecha no valida') ;
  result := False ;
 end ;
end;

procedure vcurr(ccurr : TEdit) ;
begin
 try
  if (StrToCurr(ccurr.Text)= StrToCurr(ccurr.Text)) then  ;
 except
  showmessage('cantidad no valida') ;
  ccurr.setfocus ;
 end ;
end ;

function orclfecha(fecha : String) : String ;
begin
  result := copy(fecha,1,2)+ '-'+ copy(cmes(StrToDate(fecha),'I'),1,3)+
           '-'+ copy(fecha,7,2) ;
end ;

function Bisiesto(ano : Integer) : Boolean;
begin
  Result := (ano mod 4 = 0) 	{ years divisible by 4 are... }
    and ((ano mod 100 <> 0)	{ ...except century years... }
    or (ano mod 400 = 0));	{ ...unless it's divisible by 400 }
end;


function DiasDelMes(fecha : TDateTime) : Integer;
var ano, mes, dia : Word ;
const
{ dias por mes normales }
  DiasPorMes: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31) ;

begin
 DecodeDate(fecha, ano, mes, dia) ;
 Result := DiasPorMes[mes];
 if (mes= 2) and Bisiesto(ano) then Inc(Result);
end;

function iif(expresion : Boolean ; value1, value2 : variant) : variant ;
begin
 if expresion then result := value1 else result := value2 ;
end ;


procedure OraErr(E : Exception)  ;
var rollo : PChar ;
 campo, tabla, ncons, LMensaje : String ;
 cual : Word ;
 mQuery : TQuery ;
 SList : TStringList ;
 FError : TFError ;
procedure datos( tt : PChar) ;
begin
 rollo := StrPos( PChar(LMensaje),tt) ;
 if rollo= nil then exit ;
 LMensaje := copy(rollo,4, length(rollo)) ;
 rollo := StrPos(PChar(LMensaje),'$') ;
 tabla := Copy(LMensaje,1, length(LMensaje)- length(rollo) ) ;
 rollo := StrPos(PChar(LMensaje),')') ;
 campo := copy(tabla,2,4)+ '_'+ copy(LMensaje, Length(tabla)+2,
          length(LMensaje)- length(rollo) - Length(tabla) - 1) ;
end ;
begin
 LMensaje := E.Message ;
 rollo := StrPos( PChar(E.Message),'ORA-') ;

 if rollo = nil
 then  cual := 0
 else begin
  ncons := StrPos( PChar(rollo),'(') ;
  ncons := copy(ncons, 2, length(ncons)- 1 - Length(StrPos( PChar(ncons), ')' )))  ;
  cual := StrToInt( Copy(rollo,5,5) ) ;
 end ;


 mquery := TQuery.Create(nil) ;
 mquery.DataBaseName := 'Sistema' ;

 case cual of
      1 :             // Primary Key
      begin
       datos('PK$') ;
       if tabla <> '' then
       begin
        mquery.Sql.Add(
        'Select SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ),1,20) As Etiq') ;
        mquery.Sql.Add('FROM ALL_COL_COMMENTS WHERE TABLE_NAME= '''+ tabla+ '''') ;
        mquery.Sql.Add('AND COLUMN_NAME= '''+ campo+ '''') ;
        mquery.Open ;
        if not mquery.eof
        then LMensaje := mquery['Etiq'] + ' no puede ser repetido' ;
       end ;
      end ;

   2290 :   // Check Constraint
    begin
     datos('NN$') ;           // Constraint de Not Null
     if tabla <> '' then
      begin
       mquery.Sql.Add(
       'Select SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ),1,20) As Etiq') ;
       mquery.Sql.Add('FROM ALL_COL_COMMENTS WHERE TABLE_NAME= '''+ tabla+ '''') ;
       mquery.Sql.Add('AND COLUMN_NAME= '''+ campo+ '''') ;
       mquery.Open ;
       if not mquery.eof
       then LMensaje := mquery.FieldByName('Etiq').AsString + ' no puede ser nulo' ;
      end ;
    end ;

   2291 :  // Foreign Key
    begin
     datos('FK$') ;
     if tabla <> '' then
      begin
       mquery.Sql.Add(
       'Select SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ),1,20) As Etiq') ;
       mquery.Sql.Add('FROM ALL_COL_COMMENTS WHERE TABLE_NAME= '''+ tabla+ '''') ;
       mquery.Sql.Add('AND COLUMN_NAME= '''+ campo+ '''') ;
       mquery.Open ;
       if not mquery.eof
       then LMensaje := 'No existe '+ mquery['Etiq'] ;
      end ;
    end ;

   2292 :  // Foreign Key References
    begin
     datos('FK$') ;
     if tabla <> '' then
      begin
       mquery.Sql.Add('SELECT COMMENTS FROM ALL_TAB_COMMENTS') ;
       mquery.Sql.Add('WHERE TABLE_NAME= '''+ tabla+ '''') ;
       mquery.Open ;
       if not mquery.eof
       then LMensaje := 'Existen Registros hijos en '+ mquery['COMMENTS'] ;
      end ;

    end ;

  20001 :   // Trigger
   begin
    slist := TStringList.Create ;
    campo := copy(rollo,11, length(rollo)) ;
    slist.Text := campo ;
    campo := slist[0] ;
    if length(campo) <> 0
    then LMensaje := campo ;
    slist.Free ;
   end ;
 end ;

 if LMensaje = E.Message then
 begin
  mquery.Close ;
  mquery.Sql.Clear ;
  mquery.Sql.Add('Select Errm_Mensaje As Mensaje From SErrMes ') ;
  mquery.Sql.Add('Where Errm_Refer= '''+ ncons+ '''') ;
  mquery.Open ;
  if not mquery.eof
  then LMensaje := mquery['Mensaje'] ;
 end ;

 mquery.Close ;
 mquery.Free ;

 FError := TFError.Create(nil) ;
 FError.mMensaje := LMensaje ;
 FError.mError := E.Message ;
 FError.MemoError.Text := LMensaje ;
 FError.ShowModal ;
 FError.Free ;
end ;

end.
