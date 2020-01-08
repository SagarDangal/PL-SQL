SET SERVEROUTPUT ON;



DECLARE

    TYPE num_table IS TABLE OF VARCHAR(20) INDEX BY VARCHAR(20);                                    -----index is indivisual number like index are 1,2,3,4 of 11234 contais ta count of number like  t(1) = 2
    
    TYPE labell IS TABLE Of VARCHAR(200) INDEX BY VARCHAR(200); 

    TYPE exp IS TABLE Of VARCHAR(200) INDEX BY VARCHAR(200);

    x NUMBER(10) ;                                                 

    type namesarray IS VARRAY(5) OF VARCHAR2(10);                                         

    type numarray IS TABLE OF VARCHAR(200);                                                         --numarray contain indivisual digit of x like('1','2','3','4','5') of 12345                                                                              ----- declaring a character (it is latter used to kept char of x

    patt VARCHAR(300);

    name namesarray := namesarray('x','y','z','w'); 

    ii VARCHAR(200);

    ii2 VARCHAR(200);

    counter2flag VARCHAR2(20);
       
    
    
FUNCTION test2(X in VARCHAR2,Y IN VARCHAR2) RETURN VARCHAR2 is l VARCHAR2(20);
 
 
 BEGIN
 
   if( TO_NUMBER(X) + 2) = TO_NUMBER(Y) then
        return 'true'; 
    elsif ( TO_NUMBER(X) - 2) = TO_NUMBER(Y) then
        return 'true';
    else
    return 'false';
    end if;
      
 end;
 
 
 
FUNCTION test(X in VARCHAR2,Y IN VARCHAR2) RETURN VARCHAR2 is l VARCHAR2(20);

 BEGIN
    
     if( TO_NUMBER(X) + 1) = TO_NUMBER(Y) then
        return 'true';
    elsif( TO_NUMBER(X) - 1) = TO_NUMBER(Y) then
        return 'true';
    else
    return 'false';
    end if;
       
 end;


FUNCTION checks22(X IN VARCHAR2,names labell) RETURN VARCHAR2 is bool VARCHAR2(20);

    BEGIN
    
        if names.first = NULL then
            return 'false';
        end if;
        for i in names.first .. names.last loop
             if names(i) = X then
              return 'true';
            end if;
        end loop;
        return 'false';
    end;   



 FUNCTION checks2(X IN VARCHAR2,names labell) RETURN VARCHAR2 is bool VARCHAR2(20);

    BEGIN
         ii := names.FIRST;
     
        while (II IS NOT NULL) LOOP
                if ii = X then
                    return 'true';
                end if;
                ii := names.NEXT(ii);
        end LOOP;
        return 'false';
    end;   
 
FUNCTION checks(X IN VARCHAR2,names labell) RETURN VARCHAR2 is bool VARCHAR2(20);

    BEGIN
        if name.first is not null then
            ii := names.FIRST;
            while (II IS NOT NULL) LOOP
                if names(ii) = X then
                  return 'true';
                end if;
                ii := names.NEXT(ii);
             end LOOP;
        end if;
        return 'false';
    end;
 
FUNCTION ladder(X IN labell,Y IN numarray)RETURN labell IS  expp1 labell; char VARCHAR(200); n NUMBER(10);
 
 BEGIN
    
    << outer_loop >>
    for i in X.first .. X.last loop
        << inner_loop >>
        for j in Y.first .. Y.last loop
       
            if (X(i) != Y(j)) then
             n := to_number(X(i)) - to_number(Y(j));
             char := checks(Y(j),X);
             --DBMS_OUTPUT.PUT_LINE('qqqqqqqqhhh'||n);
             --patt := checks2((concat(name(i),concat('+',SUBSTR(to_char(n),2)))),expp1);
            
             if (n=-1) and (checks(Y(j),X)='false')   then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
             
             elsif ((n=-2) and (char = 'false') and (checks2((concat(name(i),concat('+',SUBSTR(to_char(1),1)))),expp1)='true')) or ((n=-2) and (checks(Y(j),X)='false') and counter2flag ='true' )  then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
             
             elsif (n=-3) and (char = 'false') and checks2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
             
             elsif ((n=-4) and (char = 'false') and checks2((concat(name(i),concat('+',SUBSTR(to_char(3),1)))),expp1)='true') or ((n=-4) and checks2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),expp1)='true' and counter2flag ='true' ) then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
             
              elsif (n=-5) and (char = 'false') and checks2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),expp1)='true'  then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
             
              elsif ((n=-6) and (char = 'false') and checks2((concat(name(i),concat('+',SUBSTR(to_char(5),1)))),expp1)='true') or ((n=-6) and checks2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),expp1)='true'  and counter2flag ='true') then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
             
             elsif (n=-7) and (char = 'false') and checks2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),expp1)='true'  then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
              
              elsif ((n=-8) and (char = 'false') and checks2((concat(name(i),concat('+',SUBSTR(to_char(7),1)))),expp1)='true') or ((n=-6) and checks2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),expp1)='true'  and counter2flag ='true') then
             
             expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
              
              elsif (n=1) and (char = 'false')  then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             elsif (n=2) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(1),1)))),expp1)='true' or ((n=2) and (checks(Y(j),X)='false') and counter2flag ='true' ) then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
              elsif (n=3) and (char = 'false')and checks2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
              elsif (n=4) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(3),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
              elsif (n=5) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
             elsif (n=6) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(5),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
             elsif (n=7) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             elsif (n=8) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(7),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
             elsif (n=9) and (char = 'false') and checks2((concat(name(i),concat('-',SUBSTR(to_char(8),1)))),expp1)='true' then
             
             expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
             
              
             end if;
          end if;
        end loop inner_loop;
    end loop outer_loop;
    
    
    
   
   
        
   -- DBMS_OUTPUT.PUT_LINE(char||patt);
   
        
    RETURN expp1;
             
                
 
  END;
 
 
    
FUNCTION getPattern(X IN NUMBER)RETURN VARCHAR2 IS patt VARCHAR2(30); tables num_table;    ------ function to return a pattern
     nums2 numarray ;
     nums3 numarray ;
     l  labell;
     labels1 labell ;
     labels labell ;
     expp1 labell;
     expr exp;
     numss numarray;
     countt integer;
     char VARCHAR(200);
     similar labell;
     n NUMBER(10); 
  BEGIN
                                                                    ---adding value to name array
    char := to_char(X);                                            --------asigning a char of X to char
    n := LENGTH(char);   
    numss := numarray();
     
    
    for i in 1 .. n LOOP                                             ---------------------adding indivisual char of char to numss array
        IF  not numss.exists(i) then
        
            numss.extend;
            numss(i) := SUBSTR(char, i, 1);
        
        END IF;       
    END LOOP;
    
    
    
    
    
    nums3 := numss;                                 ---copying numss to nums3 for future used
    nums2 := numss;
    numss := numss MULTISET UNION DISTINCT nums2;   ----getting unique value of numss and assigning to numms again
    
    
    
    
    
    for i in numss.FIRST .. numss.LAST LOOP
        n := REGEXP_COUNT(char,numss(i));
         tables(numss(i)) := n;
         if (n>=2) then
            labels(numss(i)) := 'multiple';
        else
            labels(numss(i)) := 'single';
            
        end if;
       
        
        
    END LOOP;
    countt := 1;
    
   for i in numss.FIRST .. numss.LAST loop
        if (labels(numss(i)) = 'multiple') then
            expr(numss(i)) := name(countt);
             similar(countt) := numss(i);
             expp1(name(countt)) := numss(i);
             countt := countt + 1;
        else
            expr(numss(i)) := 'o';
    
        end if;
    end loop;
    if countt-1 >4 then
        labels1 := ladder(similar,numss);
    else 

        for i in numss.first .. numss.last-1 loop

            patt:=test(numss(i),numss(i+1));
            l(to_char(numss(i))):= patt;

        end loop;
        
    end if;
   
    
    if checks('true',L)='false' then
        counter2flag :='true';
    
         for i in numss.first .. numss.last-1 loop
            patt:=test2(numss(i),numss(i+1));
            l(to_char(numss(i))):= patt;
    
        end loop;

   end if;
    
    patt := 'true';

   
    for i in numss.first .. numss.last-1 loop
    
       if l(numss(i)) = 'true' and patt = 'true'   then

           if countt>1 then
                if checks22(numss(i),similar)= 'false' and checks22(numss(i)-1,similar)= 'false' and checks22(numss(i)+1,similar)= 'false'then
  
                      expr(numss(i)) := name(countt);
                      similar(countt) := numss(i);
                      countt := countt  + 1;
   
                end if;
               patt := 'false';
    
          else
             expr(numss(i)) := name(countt);
             similar(countt) := numss(i);
             countt := countt  + 1;
             patt := 'false';
         end if;


     elsif l(numss(i)) = 'false' then
     
        patt := 'true';
        
     end if;

   end loop;
   
   if checks('true',L)='true' then
   
        labels1 := ladder(similar,numss);
        
   end if;
   
   patt := '';
   
   for i in nums3.First .. nums3.LAST loop
       if (expr(nums3(i)) != 'o') then
                
                 patt := concat(patt,expr(nums3(i)));
     
      else
          char := checks(nums3(i),labels1);
          if char = 'true' then
                ii := labels1.first;
                while (ii is not null) loop
                     if ( labels1(ii) = nums3(i)) then
    
                            patt := concat(patt,ii);
                             exit;
                     end if;
                     ii := labels1.NEXT(ii);
                end loop;
        else 
            patt := concat(patt,'*');
        end if;
    
      end if;
    
    end loop;
    RETURN patt;

  END;  
    
    
BEGIN 
    
    for i in 76000000 .. 76000111   loop
        x :=i;
        patt := getPattern(x); 
        DBMS_OUTPUT.PUT_LINE(x||'----------------------'||patt);
   end loop;
END; 
