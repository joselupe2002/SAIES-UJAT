unit recibos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls;

type
  TFRecibos = class(TPFDetalle)
    PagCon: TPageControl;
    TabBorra: TTabSheet;
    Button1: TButton;
    QPERCEP: TQuery;
    QDEDUC: TQuery;
    QEncabeza: TQuery;
    Guardar: TSaveDialog;
    TPsto: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    QEsdeped: TQuery;
    Button3: TButton;
    QPERCEP_Esd: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type registro1 = Record //total de 135
     c1:string[25];
     c2:string[20];
     c3:string[70];
     c4:string[20];
end;

type registro2 = Record  //total de 135
     c1:string[25];
     c2:string[25];
     c3:string[25];
     c4:string[60];
end;

type registro2a = Record  //total de 135
     c1:string[4];
     c2:string[56];
     c3:string[75];
     c4:string[10];
end;

type registro3 = Record    //135
     c1:string[2];
     c2:string[5];
     c3:string[4];
     c4:string[33];
     c5:string[14];
     c6:string[1];
     c7:string[5];
     c8:string[4];
     c9:string[33];
     c10:string[14];
     c11:string[20];
end;


type registro4 = Record //total de 135
     c1:string[50];
     c2:string[43];
     c3:string[42];
end;



var

  ruta : string[200];

  FRecibos: TFRecibos;

  r : string[135];

  R1 : registro1;
  R2 : registro2;
  R2a : registro2a;
  R3 : array[1..26] of registro3; //SUFICIENTE PARA DOS HOJAS DEL RECIBO DEL MISMO TRABAJADOR
  R4 : registro4;
  F: TextFile;



implementation

{$R *.DFM}

procedure TFRecibos.FormCreate(Sender: TObject);
var
  x:integer;
begin
  inherited;


 bacepta.Enabled := false;

 height := 424 ;
 width := 357 ;

 Qval.SQL.Clear;
 //Qval.sql.Text:= 'Select tpue_tpsto as cve, tpue_descrip as tipo From PTpuestos';

 Qval.sql.Text:= 'Select tpue_tpsto as cve, tpue_descrip as tipo From PTpuestos';
 Qval.sql.Text:=  Qval.sql.Text + ' Where tpue_tpsto not in (''C'',''MS'',''JA'',''PA'',''JD'',''PD'',''JC'',''PC'',''A'',''G'') Union';
 Qval.sql.Text:=  Qval.sql.Text + ' Select ''AyG'' as cve, ''ADMINISTRATIVOS SINDICALIZADOS y GUARDIAS'' as tipo From Dual Union';
 Qval.sql.Text:=  Qval.sql.Text + ' Select ''CyMS'' as cve, ''CONFIANZA y MANDOS MED Y SUP'' as tipo From Dual Union';
 Qval.sql.Text:=  Qval.sql.Text + ' Select ''JPA'' as cve, ''JUBILADOS Y PENSIONADOS ADMVOS'' as tipo From Dual Union';
 Qval.sql.Text:=  Qval.sql.Text + ' Select ''JPD'' as cve, ''JUBILADOS Y PENSIONADOS DOCENTES'' as tipo From Dual Union';
 Qval.sql.Text:=  Qval.sql.Text + ' Select ''JPC'' as cve, ''JUBILADOS Y PENSIONADOS CONFIANZA'' as tipo From Dual';
 Qval.open;


 tpsto.Items.Add('%_Todos');

 if qval.RecordCount > 1 then
  for x:=1 to qval.recordcount do
    begin
      Tpsto.Items.Add(qval.fields.fieldbyname('cve').asstring + '_' + qval.fields.fieldbyname('Tipo').asstring);
      qval.Next;
    end;




end;

procedure limpiar;
var
  x:Integer;
begin

  R1.c1:='';
  R1.c2:='';
  R1.c3:='';
  R1.c4:='';

  R2.c1:='';
  R2.c2:='';
  R2.c3:='';
  R2.c4:='';

  R2a.c1:='';
  R2a.c2:='';
  R2a.c3:='';
  R2a.c4:='';


  for x:=1 to 26 do
   begin

    R3[x].c1:= format('%2S',[' ']);
    R3[x].c2:= format('%5S',[' ']);
    R3[x].c3:= format('%4S',[' ']);
    R3[x].c4:= format('%33S',[' ']);
    R3[x].c5:= format('%14S',[' ']);
    R3[x].c6:= format('%1S',[' ']);
    R3[x].c7:= format('%5S',[' ']);
    R3[x].c8:= format('%4S',[' ']);
    R3[x].c9:= format('%33S',[' ']);
    R3[x].c10:= format('%14S',[' ']);
    R3[x].c11:= format('%20S',[' ']);

   end;

  R4.c1:='';
  R4.c2:='';
  R4.c3:='';

end;



///Recibos normales
procedure TFRecibos.Button1Click(Sender: TObject);
var

  TotRecibos : Integer;
  TotPercep : Integer;
  TotDeduc : Integer;

  numrec : string[6];

  y : Integer;
  x : Byte;
  xx : Byte;
  z : Byte;

  lapos : integer;
  eltpsto : string;

  Entro : Integer;

  zzz : integer;

  DOSHOJAS : BOOLEAN;

begin
  inherited;



   if trim(tpsto.Text) = '' then
    begin
      showmessage('Falta elegir el Tipo de Puesto');
      exit;
    end;

    lapos := pos('_', trim(tpsto.text));
    eltpsto := copy(trim(tpsto.text),1,lapos-1);


    //SHOWMESSAGE();

//   guardar.Execute;

  // RUTA := TRIM(guardar.FileName);
   Ruta := 'C:\Nomina' + '_' + eltpsto + '_';
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),1,2);
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),4,2);
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),9,2);

   If eltpsto = 'AyG' then
        IF Fmodulo.Query1.Fieldbyname('nomi_TIPO').asstring = 'C' THEN
                begin
                   Ruta := Ruta + '_EV';
                end;

   Ruta := Ruta + '.txt';



    if RUTA <> '' THEN
      begin

        qencabeza.close;
        qencabeza.SQL.Clear;

        Entro := 0;

        showmessage('Inicio del Proceso');

        If eltpsto = 'CyMS' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''C'', ''MS'') Order By URES_PAGO, Ures, NOMBRE';
//                SHOWMESSAGE(qencabeza.Sql.Text);
                Entro := 1;
          end;
        If eltpsto = 'JPA' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''JA'', ''PA'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'JPD' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''JD'', ''PD'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'JPC' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''JC'', ''PC'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'AyG' then
          begin
            IF Fmodulo.Query1.Fieldbyname('nomi_TIPO').asstring = 'C' THEN
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''A'', ''G'') Order By NOMBRE'
            ELSE
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''A'', ''G'') Order By URES_PAGO, Ures, NOMBRE';

           Entro:=1;

          end;

        If entro = 0 then
          begin
//               showmessage('no entro en ningun lado');
               qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO = :TPSTO Order By URES_PAGO, Ures, NOMBRE';
               qencabeza.Params.ParamByName('tpsto').asstring := eltpsto;
          End;



        qencabeza.Params.ParamByName('Nomina').asstring := trim(Fmodulo.Query1.Fieldbyname('nomi_nomina').asstring);

        qencabeza.open;

        showmessage('Recibos totales: ' + inttostr(qencabeza.recordcount));

         TotRecibos := qencabeza.recordcount;

         if TotRecibos > 0 then
          begin

            AssignFile(F, ruta);
            Rewrite (F);


            Y := 1;

            REPEAT

                 zzz := 0;
                 r:='';
                 Repeat
                         writeln(F, R);
                         zzz := zzz + 1;
                 Until zzz > 5;

                 limpiar;

                 //primera linea del recibo
                 r1.c1 := format('%25S',[qencabeza.Fields.fieldbyname('empl').asstring]);
                 r1.c2 := format('%20S',[' ']);
                 r1.c3 := format('%-70S',[qencabeza.Fields.fieldbyname('nombre').asstring]);
                 numrec := 'R00000';
                 insert(inttostr(Y) , numrec , 7 - length(inttostr(Y)));
                 r1.c4 := numrec;
                 r := r1.c1 + r1.c2 + r1.c3 + r1.c4;
                 writeln(F, R);

                 r := '';
                 writeln(F, R);

                 //segunda linea del recibo
                 r2.c1 := format('%25S',[qencabeza.Fields.fieldbyname('rfc').asstring]);
                 r2.c2 := format('%25S',[qencabeza.Fields.fieldbyname('numss').asstring]);
                 r2.c3 := format('%20S',[' ']);

                         if (qencabeza.Fields.fieldbyname('tpsto').asstring = 'C') or (qencabeza.Fields.fieldbyname('tpsto').asstring = 'MS') THEN
                           IF (qencabeza.Fields.fieldbyname('dcateg').asstring = '') THEN
                                 r2.c4 := format('%-80S',[qencabeza.Fields.fieldbyname('Dpsto').asstring + ' DE CONFIANZA ' + qencabeza.Fields.fieldbyname('tplaza').asstring])
                           ELSE
                                 r2.c4 := format('%-80S',[qencabeza.Fields.fieldbyname('Dpsto').asstring + ' ' + qencabeza.Fields.fieldbyname('dcateg').asstring + ' DE CONFIANZA ' + qencabeza.Fields.fieldbyname('tplaza').asstring])
                         else
                                 r2.c4 := format('%-80S',[qencabeza.Fields.fieldbyname('Dpsto').asstring + ' ' + qencabeza.Fields.fieldbyname('dcateg').asstring + ' ' + qencabeza.Fields.fieldbyname('tplaza').asstring]);

                 r := r2.c1 + r2.c2 + r2.c3 + r2.c4;
                 writeln(F, R);

                 r := '';
                 writeln(F, R);

                 //tercera linea del recibo
                 r2a.c1 := format('%4S',[' ']);
                 r2a.c2 := format('%-56S',[qencabeza.Fields.fieldbyname('dures').asstring]);
                 r2a.c3 := format('%-65S',[qencabeza.Fields.fieldbyname('fecha').asstring]);
                 r2a.c4 := format('%-10N',[qencabeza.Fields.fieldbyname('SueldoM').asfloat]);
                 r := r2a.c1 + r2a.c2 + r2a.c3 + r2a.c4;
                 writeln(F, R);

                 r:='';
                 writeln(F, R);
                 writeln(F, R);


                 //aqui empieza el detalle
                 qpercep.close;
                 qpercep.Params.ParamByName('Pago').asstring := trim(qencabeza.Fields.fieldbyname('pago').asstring);
                 qpercep.open;

                  TotPercep := qpercep.recordcount;

                  if TotPercep > 0 then
                    begin

                     for x := 1 to TotPercep do
                      begin
                           r3[x].c1 := format('%2S',[' ']);
                           r3[x].c2 := format('%5S',[qpercep.Fields.fieldbyname('cve').asstring]);
                           r3[x].c3 := format('%4S',[' ']);
                           r3[x].c4 := format('%-33S',[qpercep.Fields.fieldbyname('concepto').asstring]);
                           r3[x].c5 := format('%14N',[qpercep.Fields.fieldbyname('monto').asfloat]);
                           r3[x].c6 := format('%1S',[' ']);

                           qpercep.Next;
                      end; //DEL FOR
                   end; //DEL IF


                 qdeduc.close;
                 qdeduc.Params.ParamByName('Pago').asstring := trim(qencabeza.Fields.fieldbyname('pago').asstring);
                 qdeduc.open;

                  TotDeduc := qdeduc.recordcount;

                  if TotDeduc > 0 then
                    begin

                     for x := 1 to TotDeduc do
                       begin
                           r3[x].c7 := format('%5S',[qdeduc.Fields.fieldbyname('cve').asstring]);
                           r3[x].c8 := format('%4S',[' ']);
                           r3[x].c9 := format('%-33S',[qdeduc.Fields.fieldbyname('concepto').asstring]);
                           r3[x].c10 := format('%14N',[qdeduc.Fields.fieldbyname('monto').asfloat]);

                           qdeduc.Next;
                       end; //DEL FOR
                   end; //DEL IF

                 for z := 1 to 13 do
                  begin
                    r := r3[z].c1 + r3[z].c2 + r3[z].c3 + r3[z].c4 + r3[z].c5 + r3[z].c6 + r3[z].c7 +
                         r3[z].c8 + r3[z].c9 + r3[z].c10 + r3[z].c11;
                    writeln(F, R);
                  end; //DEL FOR




                 //codigo nuevo  mayo 08
                 if (TotPercep > 13) or (TotDeduc > 13) then
                     begin


                         zzz := 0;
                         r:='';
                         Repeat
                                 writeln(F, R);
                                 zzz := zzz + 1;
                         Until zzz > 3;


                         r := format('%5S',[' ']) + 'ESTE RECIBO CONSTA DE DOS HOJAS                       HOJA No. 1';
                        writeln(F, R);

                        DOSHOJAS := TRUE;


                         zzz := 0;
                         r:='';
                         Repeat
                                 writeln(F, R);
                                 zzz := zzz + 1;
                         Until zzz > 7;

                         //primera linea del recibo
                         r1.c1 := format('%25S',[qencabeza.Fields.fieldbyname('empl').asstring]);
                         r1.c2 := format('%20S',[' ']);
                         r1.c3 := format('%-70S',[qencabeza.Fields.fieldbyname('nombre').asstring]);
                         numrec := 'R00000';
                         insert(inttostr(Y) , numrec , 7 - length(inttostr(Y)));
                         r1.c4 := numrec;
                         r := r1.c1 + r1.c2 + r1.c3 + r1.c4;
                         writeln(F, R);

                         r := '';
                         writeln(F, R);

                         //segunda linea del recibo
                         r2.c1 := format('%25S',[qencabeza.Fields.fieldbyname('rfc').asstring]);
                         r2.c2 := format('%25S',[qencabeza.Fields.fieldbyname('numss').asstring]);
                         r2.c3 := format('%20S',[' ']);

                         if (qencabeza.Fields.fieldbyname('tpsto').asstring = 'C') or (qencabeza.Fields.fieldbyname('tpsto').asstring = 'MS') THEN
                           IF (qencabeza.Fields.fieldbyname('dcateg').asstring = '') THEN
                                 r2.c4 := format('%-80S',[qencabeza.Fields.fieldbyname('Dpsto').asstring + ' DE CONFIANZA ' + qencabeza.Fields.fieldbyname('tplaza').asstring])
                           ELSE
                                 r2.c4 := format('%-80S',[qencabeza.Fields.fieldbyname('Dpsto').asstring + ' ' + qencabeza.Fields.fieldbyname('dcateg').asstring + ' DE CONFIANZA ' + qencabeza.Fields.fieldbyname('tplaza').asstring])
                         else
                                 r2.c4 := format('%-80S',[qencabeza.Fields.fieldbyname('Dpsto').asstring + ' ' + qencabeza.Fields.fieldbyname('dcateg').asstring + ' ' + qencabeza.Fields.fieldbyname('tplaza').asstring]);

                         r := r2.c1 + r2.c2 + r2.c3 + r2.c4;
                         writeln(F, R);

                         r := '';
                         writeln(F, R);

                         //tercera linea del recibo
                         r2a.c1 := format('%4S',[' ']);
                         r2a.c2 := format('%-56S',[qencabeza.Fields.fieldbyname('dures').asstring]);
                         r2a.c3 := format('%-65S',[qencabeza.Fields.fieldbyname('fecha').asstring]);
                         r2a.c4 := format('%-10N',[qencabeza.Fields.fieldbyname('SueldoM').asfloat]);
                         r := r2a.c1 + r2a.c2 + r2a.c3 + r2a.c4;
                         writeln(F, R);

                         r:='';
                         writeln(F, R);
                         writeln(F, R);


                         for z := 14 to 26 do
                          begin
                            r := r3[z].c1 + r3[z].c2 + r3[z].c3 + r3[z].c4 + r3[z].c5 + r3[z].c6 + r3[z].c7 +
                                 r3[z].c8 + r3[z].c9 + r3[z].c10 + r3[z].c11;
                            writeln(F, R);
                          end; //DEL FOR


                     end;

                  //termina codigo nuevo mayo 08




                 r:='';
                 writeln(F, R);
                 writeln(F, R);

                 //aqui empieza el pie de pagina
                 r4.c1 := format('%50N',[qencabeza.Fields.fieldbyname('Perceps').asfloat]);
                 r4.c2 := format('%42N',[qencabeza.Fields.fieldbyname('Deduccs').asfloat]) ;
                 r4.c3 := format('%42N',[qencabeza.Fields.fieldbyname('Neto').asfloat]) ;
                 r := r4.c1 + r4.c2 + r4.c3;
                 writeln(F, R);

                 //cantidad en letras
                 r := format('%21S',[' ']) + qencabeza.Fields.fieldbyname('Lneto').asstring;
                 writeln(F, R);


                 //mensajes

                 // r := format('%5S',[' ']) + 'COMPAÑERO UNIVERSITARIO, ACTUALIZA TUS DATOS EN RECURSOS HUMANOS (NUMERO DE SEGURIDAD SOCIAL, CURP Y RFC)';
//                  r := format('%5S',[' ']) + 'LA GRAN FAMILIA UNIVERSITARIA LES DESEA QUE LA NAVIDAD Y EL AÑO NUEVO TRAIGAN PAZ, ARMONIA Y PROSPERIDAD A TODOS LOS HOGARES';
//                r := format('%5S',[' ']) {+ format('%4S',[''])} + 'NUESTROS MEJORES DESEOS EN ESTA NAVIDAD, PARA QUE TU TRABAJO Y ESFUERZO CONTINUEN SIENDO FUENTE DE PROSPERIDAD EN EL 2007';
                 //r := format('%5S',[' ']) {+ format('%4S',[''])} + '"FIESTA MEXICANA"    VIERNES 15 DE SEPTIEMBRE: 5 DE LA TARDE     EXPLANADA DE RECTORIA     ¡CELEBREMOS! ';
//                 r := format('%2S',[' ']) {+ format('%4S',[''])} + 'ESTIMADO TRABAJADOR UNIVERSITARIO: TENER TRABAJO ES UNA SUERTE, TRABAJAR CON AMIGOS ES UNA VERDADERA BENDICION';
//                 r := format('%4S',[' ']) {+ format('%4S',[''])} + 'FELICIDADES A TODOS LOS QUE DIA CON DIA CONTRIBUYEN A FORMAR A LOS MEJORES PROFESIONALES DE TABASCO';
                 // r := format('%2S',[' ']) {+ format('%4S',[''])} ;
//                 r := format('%5S',[' ']) {+ format('%4S',[''])} + 'QUE ESTA NAVIDAD SEA UNA EPOCA DE ARMONIA Y MAYOR UNION PARA LA COMUNIDAD UNIVERSITARIA Y EL PUEBLO DE TABASCO';
//                 writeln(F, R);

                 //r := format('%2S',[' ']) {+ format('%4S',[''])} + 'traigan paz, armonia y prosperidad a todos los hogares';

                         //---VOLVER A ACTIVAR
                 R:= format('%2S',[' ']) {+ format('%4S',[''])} ;
                 writeln(F, R);


                IF (qencabeza.fields.fieldbyname('tpsto').asstring = 'A')
                and ((qencabeza.fields.fieldbyname('empl').asstring = '01874')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01039')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01261')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01163')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00538')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01002')
                or (qencabeza.fields.fieldbyname('empl').asstring = '02141')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01616')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00710')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00482')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00196')
                or (qencabeza.fields.fieldbyname('empl').asstring = '03512')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00096')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01186')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00131')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00933')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01963')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00011')
                or (qencabeza.fields.fieldbyname('empl').asstring = '02252')
                or (qencabeza.fields.fieldbyname('empl').asstring = '01575')
                or (qencabeza.fields.fieldbyname('empl').asstring = '00547')) then
                 BEGIN
                   r := format('%5S',[' ']) + 'EL PAGO DE LA DIFERENCIA DE SALARIO CORRESPONDE AL CAMBIO DE PLAZA DE CONFIANZA A SINDICALIZADO';
                   writeln(F, R);
//                   r := '';
                   //r := format('%5S',[' ']) + 'LA GRAN FAMILIA UNIVERSITARIA LES DESEA QUE LA NAVIDAD Y EL AÑO NUEVO TRAIGAN PAZ, ARMONIA Y PROSPERIDAD A TODOS LOS HOGARES';
//                   r := format('%5S',[' ']) + '';

{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '34000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '35000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '13000')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '26'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '25'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '22'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '24'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '23'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '17'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 16 DE FEBRERO AL 7 DE MARZO';
 }

{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '30000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '27000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '14000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '12100')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '18'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 9 AL 21 DE MARZO';
 }
{                            IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '33000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '32000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '31000')) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 23 DE MARZO AL 1° DE ABRIL';

                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '36000')) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: EL 2 DE ABRIL';
                                  }
                   //r := format('%5S',[' ']) + '50 AÑOS DE VIDA NOS CONSOLIDAN HOY COMO UNA UNIVERSIDAD DE CALIDAD EN EL PAIS';
                 END
                ELSE
                    //este no se activa nuevamente oct 2008
                   { IF (qencabeza.fields.fieldbyname('tpsto').asstring = 'D')
                    or (qencabeza.fields.fieldbyname('tpsto').asstring = 'BE') then}
               //   r := format('%5S',[' ']) + 'COMPAÑERO UNIVERSITARIO, ACTUALIZA TUS DATOS EN RECURSOS HUMANOS (NUMERO DE SEGURIDAD SOCIAL, CURP Y RFC)';
                   //r := format('%5S',[' ']) + 'LA GRAN FAMILIA UNIVERSITARIA LES DESEA QUE LA NAVIDAD Y EL AÑO NUEVO TRAIGAN PAZ, ARMONIA Y PROSPERIDAD A TODOS LOS HOGARES';
                   r:= format('%5S',[' ']) + '';
                    //else
                IF DOSHOJAS = TRUE THEN
                        BEGIN

                         r := format('%5S',[' ']) + 'ESTE RECIBO CONSTA DE DOS HOJAS                       HOJA No. 2';
                         writeln(F, R);
                         //r := format('%5S',[' ']) + 'LA GRAN FAMILIA UNIVERSITARIA LES DESEA QUE LA NAVIDAD Y EL AÑO NUEVO TRAIGAN PAZ, ARMONIA Y PROSPERIDAD A TODOS LOS HOGARES';
                         r := format('%5S',[' ']) + '';

{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '34000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '35000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '13000')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '26'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '25'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '22'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '24'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '23'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '17'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 16 DE FEBRERO AL 7 DE MARZO';
 }
{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '30000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '27000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '14000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '12100')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '18'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 9 AL 21 DE MARZO';
 }
{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '33000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '32000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '31000')) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 23 DE MARZO AL 1° DE ABRIL';

                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '36000')) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: EL 2 DE ABRIL';
                         }
        //                   r := format('%5S',[' ']) + '50 AÑOS DE VIDA NOS CONSOLIDAN HOY COMO UNA UNIVERSIDAD DE CALIDAD EN EL PAIS';

                         DOSHOJAS := FALSE;
                         END
                ELSE
                        begin


                        /////////-->>> ESTE ES EL DE TODOS LOS COMUNES <<<----///////////////////////  <<<<---AQUI ES EL UNICO LUGAR PARA LOS MENSAJES--->>
                                         //r := format('%5S',[' ']) + 'COMPAÑERO UNIVERSITARIO, ACTUALIZA TUS DATOS EN RECURSOS HUMANOS (NUMERO DE SEGURIDAD SOCIAL, CURP Y RFC)';
                         //r := format('%5S',[' ']) + 'LA GRAN FAMILIA UNIVERSITARIA LES DESEA QUE LA NAVIDAD Y EL AÑO NUEVO TRAIGAN PAZ, ARMONIA Y PROSPERIDAD A TODOS LOS HOGARES';
//                          r := format('%5S',[' ']) + 'COMPAÑERO UNIVERSITARIO, ACTUALIZA TUS DATOS EN RECURSOS HUMANOS (NUMERO DE SEGURIDAD SOCIAL, CURP Y RFC)';
                    //      r := format('%2S',[' ']) + 'TRABAJADOR UNIVERSITARIO ¡FELICIDADES EN ESTAS FIESTAS! QUE ESTA NOCHE DE PAZ SEA EL COMIENZO DE UN AÑO PLENO DE ÉXITOS';
                    //        r := format('%5S',[' ']) {+ format('%4S',[''])} + 'LA UNIVERSIDAD JUAREZ AUTONOMA DE TABASCO FELICITA A LOS MAESTROS QUE TRANSFORMAN LA ENSEÑANZA EN UN PROYECTO DE VIDA';
                            //r := format('%5S',[' ']) {+ format('%4S',[''])} + 'FELICIDADES ESTE 24 DE JUNIO A LOS TRABAJADORES UNIVERSITARIOS. CONTINUEMOS UNIENDO ESFUERZOS PARA CONSOLIDAR LA CALIDAD';

                        //2A JUNIO 2012 TODOS
//                        r := format('%5S',[' ']) {+ format('%4S',[''])} + 'VIVAMOS NUESTRA FIESTA MEXICANA ESTE VIERNES 14 DE SEPTIEMBRE A LAS 16:00 HORAS, EN LA PLAZA CIVICA UNIVERSITARIA. ¡NO FALTES!';
                          r := format('%5S',[' ']) + qencabeza.Fields.fieldbyname('Leyenda').asstring;

                         //R:= format('%5S',[' ']) + '';
                         writeln(F, R);

          //               r := format('%31S',[' ']) {+ format('%4S',[''])} + '¡ FELICIDADES A TODOS LOS MAESTROS !';



//AQUI SE DEBE DESACTIVAR
                           //r := format('%5S',[' ']) {+ format('%4S',[''])} + 'DE NUESTRA ALMA MATER';
                           //r := '';






                        // writeln(F, R);
                           r := '';

  //                         writeln(F, R);

                           //r := format('%5S',[' ']) + '20 DE NOVIEMBRE (1958-2008), CELEBRAMOS 50 AÑOS DE VIDA UNIVERSITARIA';

{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '28000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '29000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '03000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '15000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '19000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '10000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '12000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '11000')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '16'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '21'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 26 DE ENERO AL 14 DE FEBRERO';
 }{                          IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '34000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '35000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '13000')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '26'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '25'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '22'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '24'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '21000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '23'))
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '17'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 16 DE FEBRERO AL 7 DE MARZO';
   }
{                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '30000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '27000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '14000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '12100')
                               OR ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '16000') AND (COPY(qencabeza.fields.fieldbyname('URES').asstring,1,2) = '18'))) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 9 AL 21 DE MARZO';
 }
    {                       IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '33000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '32000')
                               OR (qencabeza.fields.fieldbyname('URES_PAGO').asstring = '31000')) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 23 DE MARZO AL 1 DE ABRIL';

                           IF ((qencabeza.fields.fieldbyname('URES_PAGO').asstring = '36000')) THEN
                                   r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: EL 2 DE ABRIL';
     }

                                   //                           r := format('%5S',[' ']) + '50 AÑOS DE VIDA NOS CONSOLIDAN HOY COMO UNA UNIVERSIDAD DE CALIDAD EN EL PAIS';

                        end;
                writeln(F, R);


//                r := '';
  //              writeln(F, R);


                 qencabeza.Next;

                 Y := SUCC(Y);


           UNTIL Y > TOTRECIBOS;

          CloseFile(F);

         end; //DEL IF
      end; //DEL IF

end;



///////esdeped
procedure TFRecibos.Button2Click(Sender: TObject);
var

  TotRecibos : Integer;
  TotPercep : Integer;
  TotDeduc : Integer;

  numrec : string[6];

  y : Integer;
  x : Byte;
  xx : Byte;
  z : Byte;

  lapos : integer;
  eltpsto : string;

  ZZZ : INTEGER;

begin
  inherited;

  ///COLOCAR EN LAS PERCEPCIONES PARA QUE AGRUPE EL CONCEPTO DE RETROACTIVO
{
Select
 dpag_conp as Cve,
 MIN(dpag_descrip) as Concepto,
 sum(dpag_Monto) as Monto
From PDPAGOS
Where DPAG_PAGO = :PAGO
and DPAG_PERDED = 'P'
GROUP BY dpag_conp
ORDER BY DPAG_CONP
}



   if trim(tpsto.Text) = '' then
    begin
      showmessage('Falta elegir el Tipo de Puesto');
      exit;
    end;




    lapos := pos('_', trim(tpsto.text));
    eltpsto := copy(trim(tpsto.text),1,lapos-1);


   Ruta := 'C:\Esdepep' + '_' + eltpsto + '_';
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),1,2);
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),4,2);
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),9,2) + '.txt';

    if RUTA <> '' THEN
      begin

        qesdeped.close;
  //      qesdeped.SQL.Clear;

    //    qesdeped.Sql.Text:= 'Select * From PvEncRecEsdeped Where nomina = :nomina And tpsto like :tpsto Order By Ures, Nombre';
        qesdeped.Params.ParamByName('tpsto').asstring := eltpsto;
        qesdeped.Params.ParamByName('Nomina').asstring := trim(Fmodulo.Query1.Fieldbyname('nomi_nomina').asstring);
        qesdeped.open;




         TotRecibos := qesdeped.recordcount;

         showmessage(inttostr(TotRecibos));

         if TotRecibos > 0 then
          begin

            AssignFile(F, ruta);
            Rewrite (F);


            Y := 1;

            REPEAT

                 zzz := 0;
                 r:='';
                 Repeat
                         writeln(F, R);
                         zzz := zzz + 1;
                 Until zzz > 7;

                 limpiar;

                 //numero de recibo
                 numrec := 'R00000';
                 insert(inttostr(Y) , numrec , 7 - length(inttostr(Y)));
                 r := format('%120S',[' ']) + numrec;
                 writeln(F, R);

                //nombre
                 R := format('%28S',[' ']) + format('%-100S',[qesdeped.Fields.fieldbyname('nombre').asstring]);
                 writeln(F, R);

                 //categoria
                 R := format('%28S',[' ']) + qesdeped.Fields.fieldbyname('Dpsto').asstring + ' ' + qesdeped.Fields.fieldbyname('dcateg').asstring;
                 writeln(F, R);


                //ures
                 R := format('%28S',[' ']) + format('%-70S',[qesdeped.Fields.fieldbyname('dures').asstring]);
                 writeln(F, R);

                //nivel
                 R := format('%28S',[' ']) + qesdeped.Fields.fieldbyname('nivel').asstring;
                 writeln(F, R);

               //periodo
                 R := format('%28S',[' ']) + format('%-35S',[qesdeped.Fields.fieldbyname('periodo').asstring]);
                 writeln(F, R);

                  r:='';
                 writeln(F, R);
                 writeln(F, R);

                //mes
                 R := format('%65S',[' ']) + format('%-40S',[qesdeped.Fields.fieldbyname('mes').asstring]);
                 writeln(F, R);


                 //aqui empieza el detalle
                 qpercep_esd.close;
                 qpercep_esd.Params.ParamByName('Pago').asstring := trim(qesdeped.Fields.fieldbyname('pago').asstring);
                 qpercep_esd.open;

                  TotPercep := qpercep_esd.recordcount;

                  if TotPercep > 0 then
                    begin

                     for x := 1 to TotPercep do
                      begin
                           r := format('%28S',[' ']) + format('%12N',[qpercep_esd.Fields.fieldbyname('monto').asfloat]);
                           writeln(F, R);

                           qpercep_esd.Next;

                      end; //DEL FOR
                   end; //DEL IF


                 qdeduc.close;
                 qdeduc.Params.ParamByName('Pago').asstring := trim(qesdeped.Fields.fieldbyname('pago').asstring);
                 qdeduc.open;

                  TotDeduc := qdeduc.recordcount;

                  if TotDeduc > 0 then
                    begin

                     r := format('%5S',[' ']) + 'MENOS:';
                     writeln(F, R);

                     for x := 1 to TotDeduc do
                       begin
                           r:= format('%5S',[' ']) + qdeduc.Fields.fieldbyname('cve').asstring + format('%2S',[' ']) +
                               forMat('%-20S',[qdeduc.Fields.fieldbyname('concepto').asstring]) + Format('%11N',[qdeduc.Fields.fieldbyname('monto').asfloat]);
                           writeln(F, R);

                           qdeduc.Next;
                       end; //DEL FOR

                         zzz := 0;
                         r:='';
                         Repeat
                                 writeln(F, R);
                                 zzz := zzz + 1;
                         Until zzz > (2 - TotDeduc + 1) ;

                     end
                   else  //del if
                      begin
                         zzz := 0;
                         r:='';
                         Repeat
                                 writeln(F, R);
                                 zzz := zzz + 1;
                         Until zzz > 4;
                      end; //del else


                 //aqui empieza el pie de pagina
                 r :=  format('%28S',[' ']) + format('%12N',[qesdeped.Fields.fieldbyname('Neto').asfloat]) ;
                 writeln(F, R);

                 //r :=  format('%28S',[' ']) + qesdeped.Fields.fieldbyname('LNeto').asstring ;
                 r :=  format('%30S',[' ']) + qesdeped.Fields.fieldbyname('LNeto').asstring;
                 writeln(F, R);

                 r:='';
                 writeln(F, R);
                 writeln(F, R);

                 r :=  format('%95S',[' ']) + qesdeped.Fields.fieldbyname('Periodo').asstring;
                 writeln(F, R);

                 r:='';
                 writeln(F, R);
                 writeln(F, R);
                 writeln(F, R);
                 writeln(F, R);
                 writeln(F, R);

                 qesdeped.Next;

                 Y := SUCC(Y);


           UNTIL Y > TOTRECIBOS;

          CloseFile(F);

         end; //DEL IF
      end; //DEL IF



end;





////jubilados y pensionados
procedure TFRecibos.Button3Click(Sender: TObject);
var

  TotRecibos : Integer;
  TotPercep : Integer;
  TotDeduc : Integer;

  numrec : string[6];

  y : Integer;
  x : Byte;
  xx : Byte;
  z : Byte;

  lapos : integer;
  eltpsto : string;

  Entro : Integer;

  zzz : integer;

begin
  inherited;



   if trim(tpsto.Text) = '' then
    begin
      showmessage('Falta elegir el Tipo de Puesto');
      exit;
    end;

    lapos := pos('_', trim(tpsto.text));
    eltpsto := copy(trim(tpsto.text),1,lapos-1);


//   guardar.Execute;

  // RUTA := TRIM(guardar.FileName);
   Ruta := 'C:\Nomina' + '_' + eltpsto + '_';
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),1,2);
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),4,2);
   Ruta := Ruta + copy(trim(Fmodulo.Query1.Fieldbyname('nomi_fecha').asstring),9,2) + '.txt';


    if RUTA <> '' THEN
      begin

        qencabeza.close;
        qencabeza.SQL.Clear;

        Entro := 0;

        If eltpsto = 'CyMS' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''C'', ''MS'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'JPA' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''JS'', ''PA'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'JPD' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''JD'', ''PD'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'JPC' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''JC'', ''PC'') Order By URES_PAGO, Ures, NOMBRE';
                Entro := 1;
          end;
        If eltpsto = 'AyG' then
          begin
                qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO in (''A'', ''G'') Order By URES_PAGO, Ures, NOMBRE';
                Entro:=1;
          end;

        If entro = 0 then
          begin
               qencabeza.Sql.Text:= 'Select A.*, B.URES_PAGO FROM GENCRECNOM A, FURES B WHERE B.URES_URES = A.URES AND NOMINA = :NOMINA AND TPSTO = :TPSTO Order By URES_PAGO, Ures, NOMBRE';
               qencabeza.Params.ParamByName('tpsto').asstring := eltpsto;
          End;



        qencabeza.Params.ParamByName('Nomina').asstring := trim(Fmodulo.Query1.Fieldbyname('nomi_nomina').asstring);

        qencabeza.open;

        showmessage('fin');

         TotRecibos := qencabeza.recordcount;

         if TotRecibos > 0 then
          begin

            AssignFile(F, ruta);
            Rewrite (F);


            Y := 1;

            REPEAT

                 zzz := 0;
                 r:='';
                 Repeat
                         writeln(F, R);
                         zzz := zzz + 1;
                 Until zzz > 6;

                 limpiar;

                 //primera linea del recibo
                 r1.c1 := format('%25S',[qencabeza.Fields.fieldbyname('empl').asstring]);
                 r1.c2 := format('%20S',[' ']);
                 r1.c3 := format('%-60S',[qencabeza.Fields.fieldbyname('nombre').asstring]);
                 numrec := 'R00000';
                 insert(inttostr(Y) , numrec , 7 - length(inttostr(Y)));
                 r1.c4 := numrec;
                 r := r1.c1 + r1.c2 + format('%20S',[' ']) + r1.c3 + r1.c4;
                 writeln(F, R);

                 r := '';
                 writeln(F, R);

                 //segunda linea del recibo
                 r2.c1 := format('%25S',[qencabeza.Fields.fieldbyname('rfc').asstring]);
                 r2.c2 := format('%25S',[' ']);
                 r2.c3 := format('%25S',[' ']);
                 r2.c4 := format('%60S',[qencabeza.Fields.fieldbyname('Dpsto').asstring]);
                 r := r2.c1 + r2.c2 + r2.c3 + r2.c4;
                 writeln(F, R);

                 r := '';
                 writeln(F, R);

                 //tercera linea del recibo
                 r2a.c1 := format('%4S',[' ']);
                 r2a.c2 := format('%56S',[' ']);
                 r2a.c3 := format('%-65S',[qencabeza.Fields.fieldbyname('fecha').asstring]);
                 r2a.c4 := format('%-10N',[qencabeza.Fields.fieldbyname('SueldoM').asfloat]);
                 r := r2a.c1 + r2a.c2 + r2a.c3 + r2a.c4;
                 writeln(F, R);

                 r:='';
                 writeln(F, R);
                 writeln(F, R);


                 //aqui empieza el detalle
                 qpercep.close;
                 qpercep.Params.ParamByName('Pago').asstring := trim(qencabeza.Fields.fieldbyname('pago').asstring);
                 qpercep.open;

                  TotPercep := qpercep.recordcount;

                  if TotPercep > 0 then
                    begin

                     for x := 1 to TotPercep do
                      begin
                           r3[x].c1 := format('%2S',[' ']);
                           r3[x].c2 := format('%5S',[qpercep.Fields.fieldbyname('cve').asstring]);
                           r3[x].c3 := format('%4S',[' ']);
                           r3[x].c4 := format('%-33S',[qpercep.Fields.fieldbyname('concepto').asstring]);
                           r3[x].c5 := format('%14N',[qpercep.Fields.fieldbyname('monto').asfloat]);
                           r3[x].c6 := format('%1S',[' ']);

                           qpercep.Next;
                      end; //DEL FOR
                   end; //DEL IF


                 qdeduc.close;
                 qdeduc.Params.ParamByName('Pago').asstring := trim(qencabeza.Fields.fieldbyname('pago').asstring);
                 qdeduc.open;

                  TotDeduc := qdeduc.recordcount;

                  if TotDeduc > 0 then
                    begin

                     for x := 1 to TotDeduc do
                       begin
                           r3[x].c7 := format('%5S',[qdeduc.Fields.fieldbyname('cve').asstring]);
                           r3[x].c8 := format('%4S',[' ']);
                           r3[x].c9 := format('%-33S',[qdeduc.Fields.fieldbyname('concepto').asstring]);
                           r3[x].c10 := format('%14N',[qdeduc.Fields.fieldbyname('monto').asfloat]);

                           qdeduc.Next;
                       end; //DEL FOR
                   end; //DEL IF

                 for z := 1 to 13 do
                  begin
                    r := r3[z].c1 + r3[z].c2 + r3[z].c3 + r3[z].c4 + r3[z].c5 + r3[z].c6 + r3[z].c7 +
                         r3[z].c8 + r3[z].c9 + r3[z].c10 + r3[z].c11;
                    writeln(F, R);
                  end; //DEL FOR

{                 r:='';
                 writeln(F, R);
                 writeln(F, R);}

                 //aqui empieza el pie de pagina
                 r4.c1 := format('%50N',[qencabeza.Fields.fieldbyname('Perceps').asfloat]);
                 r4.c2 := format('%42N',[qencabeza.Fields.fieldbyname('Deduccs').asfloat]) ;
                 r4.c3 := format('%42N',[qencabeza.Fields.fieldbyname('Neto').asfloat]) ;
                 r := r4.c1 + r4.c2 + r4.c3;
                 writeln(F, R);

                 r:='';
                 writeln(F, R);

                 //cantidad en letras
                 r := format('%21S',[' ']) + qencabeza.Fields.fieldbyname('Lneto').asstring;
                 writeln(F, R);


                 //mensajes
//                r := format('%5S',[' ']) {+ format('%4S',[''])} + 'NUESTROS MEJORES DESEOS EN ESTA NAVIDAD, PARA QUE TU TRABAJO Y ESFUERZO CONTINUEN SIENDO FUENTE DE PROSPERIDAD EN EL 2007';
                 //r := format('%5S',[' ']) {+ format('%4S',[''])} + '"FIESTA MEXICANA"    VIERNES 15 DE SEPTIEMBRE: 5 DE LA TARDE     EXPLANADA DE RECTORIA     ¡CELEBREMOS! ';
//
//                 r := format('%4S',[' ']) {+ format('%4S',[''])} + 'FELICIDADES A TODOS LOS QUE DIA CON DIA CONTRIBUYEN A FORMAR A LOS MEJORES PROFESIONALES DE TABASCO';
//                 r := format('%2S',[' ']) {+ format('%4S',[''])} + 'ESTIMADO TRABAJADOR UNIVERSITARIO: TENER TRABAJO ES UNA SUERTE, TRABAJAR CON AMIGOS ES UNA VERDADERA BENDICION';
//                 r := format('%2S',[' ']) {+ format('%4S',[''])} ;
//                 r := format('%5S',[' ']) {+ format('%4S',[''])} + 'QUE ESTA NAVIDAD SEA UNA EPOCA DE ARMONIA Y MAYOR UNION PARA LA COMUNIDAD UNIVERSITARIA Y EL PUEBLO DE TABASCO';
//                 writeln(F, R);

//                 r := format('%2S',[' ']) {+ format('%4S',[''])} + '¡FELICIDADES EN ESTE 14 DE FEBRERO!';
//                 r := format('%2S',[' ']) {+ format('%4S',[''])} ;
  //               writeln(F, R);

                //DESHABILITAR PARA LA 2DA ABRIL 2012
 //                  r := format('%5S',[' ']) {+ format('%4S',[''])} + 'LA UNIVERSIDAD JUAREZ AUTONOMA DE TABASCO FELICITA A LOS MAESTROS QUE TRANSFORMAN LA ENSEÑANZA EN UN PROYECTO DE VIDA';

                        //1A JUNIO 2012 SOLO SINDICALIZADOS
                     //   r := format('%5S',[' ']) {+ format('%4S',[''])} + 'FELICIDADES ESTE 24 DE JUNIO A LOS TRABAJADORES UNIVERSITARIOS. CONTINUEMOS UNIENDO ESFUERZOS PARA CONSOLIDAR LA CALIDAD';

                        //2A JUNIO 2012 TODOS
                        r := format('%5S',[' ']) {+ format('%4S',[''])} + 'VIVAMOS NUESTRA FIESTA MEXICANA ESTE VIERNES 14 DE SEPTIEMBRE A LAS 16:00 HORAS, EN LA PLAZA CIVICA UNIVERSITARIA. ¡NO FALTES!';
                    //r := '';
                 writeln(F, R);

//                  r := format('%5S',[' ']) + 'FECHA DE CREDENCIALIZACION EN SERVICIOS MEDICOS: DEL 16 DE FEBRERO AL 7 DE MARZO';
//                  r := format('%5S',[' ']) + '50 AÑOS DE VIDA NOS CONSOLIDAN HOY COMO UNA UNIVERSIDAD DE CALIDAD EN EL PAIS';
 //                r := format('%31S',[' ']) {+ format('%4S',[''])} + '¡ FELICIDADES A TODOS LOS MAESTROS !';


                     //1RA JUNIO 2012 SOLO SINDICALIZADOS
                    //r := format('%5S',[' ']) {+ format('%4S',[''])} + 'DE NUESTRA ALMA MATER';
                   r := '';
                 writeln(F, R);

                 r := '';
                 writeln(F, R);


                 qencabeza.Next;

                 Y := SUCC(Y);


           UNTIL Y > TOTRECIBOS;

          CloseFile(F);

         end; //DEL IF
      end; //DEL IF
end;

end.
