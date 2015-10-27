create or replace function NOM$CURP(APEPAT in varchar2, APEMAT in varchar2,
  NOMBRE in varchar2, FNACI in date, SEXO in varchar2, ESTA in varchar2)
  return varchar2 is

 curp varchar2(18);
 largo number ;
 contador number ;

begin

  
 if (fnaci is not null) and (esta is not null) and (sexo is not null) then
    
    --primer letra del apepat
    curp := curp || substr(apepat,1,1) ;
    --primer vocal interna del apepat
    largo := 0 ;
    largo := length(trim(apepat)) ;
    
    contador := 1 ;
    loop
    contador := contador + 1;
    exit when (contador >= largo) or (substr(apepat,contador,1) in ('A','E','I','O','U')) ;
    end loop;
    
    curp := curp || substr(apepat,contador,1) ;

    --primera letra del apemat
    if apemat is null then
     curp := curp || 'X' ;
    else
     curp := curp || substr(apemat,1,1) ;     
    end if;
    
    --primera letra del nombre
    largo := 0 ;
    largo := length(trim(nombre)) ;
    
    contador := 1 ;
    loop
    contador := contador + 1;
    exit when (contador >= largo) or (substr(nombre,contador,1) = ' ') ;
    end loop;
    
    if contador = largo then --nombre simple
      curp := curp || substr(nombre,1,1) ;
    else --nombre compuesto
      if substr(nombre,1,contador-1) in ('MARIA','JOSE') then
       curp := curp || substr(nombre,contador+1,1) ;
      else
       curp := curp || substr(nombre,1,1) ;
      end if ;      
    end if ;
    
    --fecha de nacimiento
    curp := curp || TO_CHAR(fnaci, 'YY') ;
    curp := curp || TO_CHAR(fnaci, 'MM') ;
    curp := curp || TO_CHAR(fnaci, 'DD') ;
    
    --sexo
    if sexo = 'F' then
     curp := curp || 'M' ;
    else
     curp := curp || 'H' ;
    end if; 
    
    --estado
    curp := curp || esta ;
    
    --apepat, apemat y nombre (primeras consonantes internas)
    --1
    largo := 0 ;
    largo := length(trim(apepat)) ;
    
    contador := 1 ;
    loop
    contador := contador + 1;
    exit when (contador >= largo) or (substr(apepat,contador,1) not in ('A','E','I','O','U')) ;
    end loop;

    curp := curp || substr(apepat,contador,1) ;    
    
    --2
    if trim(apemat) is not null then
        largo := 0 ;
        largo := length(trim(apemat)) ;
        
        contador := 1 ;
        loop
        contador := contador + 1;
        exit when (contador >= largo) or (substr(apemat,contador,1) not in ('A','E','I','O','U')) ;
        end loop;
    
        curp := curp || substr(apemat,contador,1) ;    
     else      
        curp := curp || 'X' ;        
     end if;
    
    --3
    largo := 0 ;
    largo := length(trim(nombre)) ;
    
    contador := 1 ;
    loop
    contador := contador + 1;
    exit when (contador >= largo) or (substr(nombre,contador,1) not in ('A','E','I','O','U')) ;
    end loop;

    curp := curp || substr(nombre,contador,1) ;    
          
 end if ;
  
  return(curp);
end NOM$CURP;
