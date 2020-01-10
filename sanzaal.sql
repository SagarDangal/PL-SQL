SET SERVEROUTPUT ON;




DECLARE
    
    TYPE num_table IS TABLE OF VARCHAR(20) INDEX BY VARCHAR(20);                                    -----index is indivisual number like index are 1,2,3,4 of 11234 contais ta count of number like  t(1) = 2
    
    TYPE labell IS TABLE Of VARCHAR(200) INDEX BY VARCHAR(200); 

    TYPE exp IS TABLE Of VARCHAR(200) INDEX BY VARCHAR(200);
                
    type namesarray IS VARRAY(5) OF VARCHAR2(10); 
    name namesarray := namesarray('x','y','z','w'); 

    type numarray IS TABLE OF VARCHAR(200);                                                         --numarray contain indivisual digit of x like('1','2','3','4','5') of 12345                                                                              ----- declaring a character (it is latter used to kept char of x

    pattern VARCHAR(300);
    x NUMBER(10) ;  
    ii VARCHAR(200);
    ii2 VARCHAR(200);
    counter2flag VARCHAR2(20);
    bestpattern  VARCHAR2(20);
    specialpattern VARCHAR2(20);
    pattern_name VARCHAR2(50);
       


FUNCTION delete_0(names numarray) RETURN numarray is bool numarray;

    BEGIN
        bool := numarray();
        for i in names.first .. names.last loop
             bool.extend;
             if names(i)!= '0' then
                
                bool(i):= names(i);
            end if;
        end loop;
        return bool;
    end;   
  
    
FUNCTION condition_for_inc_2(X in VARCHAR2,Y IN VARCHAR2) RETURN VARCHAR2 is l VARCHAR2(20);
 
 BEGIN
   if( TO_NUMBER(X) + 2) = TO_NUMBER(Y) then
        return 'true'; 
    elsif ( TO_NUMBER(X) - 2) = TO_NUMBER(Y) then
        return 'true';
    else
    return 'false';
    end if;
      
 end;
 
 
 
FUNCTION condition_for_inc_1(X in VARCHAR2,Y IN VARCHAR2) RETURN VARCHAR2 is l VARCHAR2(20);

 BEGIN
    
     if( TO_NUMBER(X) + 1) = TO_NUMBER(Y) then
        return 'true';
    elsif( TO_NUMBER(X) - 1) = TO_NUMBER(Y) then
        return 'true';
    else
    return 'false';
    end if;
       
 end;


FUNCTION checks_condition_3(X IN VARCHAR2,names labell) RETURN VARCHAR2 is bool VARCHAR2(20);

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



 FUNCTION checks_condition_2(X IN VARCHAR2,names labell) RETURN VARCHAR2 is bool VARCHAR2(20);

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
 
FUNCTION checks_condition_1(X IN VARCHAR2,names labell) RETURN VARCHAR2 is bool VARCHAR2(20);

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
 
FUNCTION ladder(X IN labell,Y IN numarray)RETURN labell IS  expp1 labell; char VARCHAR(200); n NUMBER(10); flag VARCHAR2(20); patt varchar2(20);
 
 BEGIN
    
    << outer_loop >>
    for i in X.first .. X.last loop
        flag := 'null';
        << inner_loop >>
        for j in Y.first .. Y.last loop
            
            if (X(i) != Y(j)) then
            
             n := to_number(X(i)) - to_number(Y(j));
             char := checks_condition_1(Y(j),X);
            patt := checks_condition_1(y(j),expp1);
                --DBMS_OUTPUT.PUT_LINE(X(i)||'-------'||Y(j)||'---------'||flag||patt);
            
             if (n=-1) and flag != 'false' and  (checks_condition_1(Y(j),X)='false')   then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true' ;
             
             elsif ((n=-2) and flag = 'true' and (char = 'false') and (checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(1),1)))),expp1)='true')) or ((n=-2)  and flag != 'false' and(checks_condition_1(Y(j),X)='false') and counter2flag ='true' )  then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
                
             elsif (n=-3) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),expp1)='true' then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
             elsif ((n=-4) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(3),1)))),expp1)='true') or ((n=-4) and  flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),expp1)='true' and counter2flag ='true' ) then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
              elsif (n=-5) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),expp1)='true'  then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
              elsif ((n=-6) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(5),1)))),expp1)='true') or ((n=-6) and flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),expp1)='true'  and counter2flag ='true') then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
             elsif (n=-7) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),expp1)='true'  then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
              
              elsif ((n=-8) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(7),1)))),expp1)='true') or ((n=-6) and flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),expp1)='true'  and counter2flag ='true') then
             
                expp1(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
              
              elsif (n=1) and flag != 'false' and (char = 'false')  then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             elsif (n=2) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(1),1)))),expp1)='true' or ((n=2)  and flag != 'false' and (checks_condition_1(Y(j),X)='false') and counter2flag ='true' ) then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=3) and flag = 'true' and (char = 'false')and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),expp1)='true' then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=4) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(3),1)))),expp1)='true'  or ((n=4) and flag = 'true'  and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),expp1)='true' and counter2flag ='true' ) then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=5) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),expp1)='true' then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=6) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(5),1)))),expp1)='true' or ((n=6) and flag = 'true' and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),expp1)='true' and counter2flag ='true' ) then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=7) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),expp1)='true' then
             
                 expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                 flag := 'true';
                 
             elsif (n=8) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(7),1)))),expp1)='true' or ((n=8) and flag = 'true' and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),expp1)='true' and counter2flag ='true' )then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=9) and flag = 'true' and(char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(8),1)))),expp1)='true' then
             
                expp1(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             else
                if flag = 'true' then
                    flag := 'false';
                end if;
             
             end if;
             
            
          end if;
          
        end loop inner_loop;
    end loop outer_loop;
    
    
    
   
   
        
   -- DBMS_OUTPUT.PUT_LINE(char||pattern);
   
        
    RETURN expp1;
             
                
 
  END;
 
 
    
FUNCTION getPattern(X IN NUMBER)RETURN VARCHAR2 IS pattern VARCHAR2(30); tables num_table;    ------ function to return a pattern
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
    bestpattern := 'false';
    specialpattern := 'false';
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
    --numss := delete_0(numss);
    
    
    
    
    for i in numss.FIRST .. numss.LAST LOOP
     if numss(i)!='0' then
        n := REGEXP_COUNT(char,numss(i));
        
         tables(numss(i)) := n;
         --DBMS_OUTPUT.PUT_LINE(numss(i)||'----------------------'||labels(numss(i)));
         if (n>=2) then
            labels(numss(i)) := 'multiple';
           -- DBMS_OUTPUT.PUT_LINE(numss(i)||'----------------------'||labels(numss(i)));
        else
            labels(numss(i)) := 'single';
            
        end if;
       end if;
        
        
    END LOOP;
    countt := 1;
    
   for i in numss.FIRST .. numss.LAST loop
    if numss(i)!='0' then
        if (labels(numss(i)) = 'multiple') and specialpattern ='false' then 
             expr(numss(i)) := name(countt);
             similar(countt) := numss(i);
             expp1(name(countt)) := numss(i);
             countt := countt + 1;
             specialpattern := 'true';
             
       elsif   (labels(numss(i)) = 'multiple') and specialpattern ='true' then     
            expr(numss(i)) := 'o';
            specialpattern := 'true'; 
             
        else 
            expr(numss(i)) := 'o';
            specialpattern := 'false';
    
        end if;
        else
        specialpattern := 'false';
     end if;
    end loop;
    if countt-1 >4 then
        labels1 := ladder(similar,nums3);
    else 

        for i in numss.first .. numss.last-1 loop
         if numss(i)!='0' then
            pattern:=condition_for_inc_1(numss(i),numss(i+1));
            l(to_char(numss(i))):= pattern;
         end if;
        end loop;
        
    end if;
   
    
    if checks_condition_1('true',L)='false' then
        counter2flag :='true';
    
         for i in numss.first .. numss.last-1 loop
          if numss(i)!='0' then
            pattern:=condition_for_inc_2(numss(i),numss(i+1));
            l(to_char(numss(i))):= pattern;
           
          end if;
        end loop;

   end if;
    
    pattern := 'true';

   
    for i in numss.first .. numss.last-1 loop
        if numss(i)!='0' then
    
       if l(numss(i)) = 'true' and pattern = 'true'   then

           if countt>1 then
                if checks_condition_3(numss(i),similar)= 'false' and checks_condition_3(numss(i)-1,similar)= 'false' and checks_condition_3(numss(i)+1,similar)= 'false'then
  
                      expr(numss(i)) := name(countt);
                      similar(countt) := numss(i);
                      countt := countt  + 1;
   
                end if;
               pattern := 'false';
    
          else
             expr(numss(i)) := name(countt);
             similar(countt) := numss(i);
             countt := countt  + 1;
             pattern := 'false';
         end if;


     elsif l(numss(i)) = 'false' then
     
        pattern := 'true';
        
     end if;
    end if;
   end loop;
   
   if checks_condition_1('true',L)='true' then
   
        labels1 := ladder(similar,numss);
        
   end if;
   
   pattern := '';
   
   for i in nums3.First .. nums3.LAST loop
    if nums3(i)!='0' then
       if (expr(nums3(i)) != 'o') then
                
                 pattern := concat(pattern,expr(nums3(i)));
     
      else
          char := checks_condition_1(nums3(i),labels1);
          if char = 'true' then
                ii := labels1.first;
                while (ii is not null) loop
                     if ( labels1(ii) = nums3(i)) then

                            pattern := concat(pattern,ii);
                             exit;
                     end if;
                     ii := labels1.NEXT(ii);
                end loop;
        else 
            pattern := concat(pattern,'*');
        end if;
    
      end if;
      else
      pattern := concat(pattern,'0');
    end if;
    end loop;
    RETURN pattern;

  END;  
    
FUNCTION getName(pattern IN VARCHAR2) RETURN VARCHAR2 IS name VARCHAR2(50);
    BEGIN
        IF (REGEXP_LIKE(pattern, 'xx\+2x\+4x\+6x\+8')) THEN
            name := 'Additional Ladder by 2 Inc';
            
        ELSIF (REGEXP_LIKE(pattern, 'xx\-2x\-4x\-6x\-8')) THEN
            name := 'Additional Ladder by 2 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+7')) THEN
            name := 'Ladder of 8 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-7')) THEN
            name := 'Ladder of 8 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+6')) THEN
            name := 'Ladder of 7 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-6')) THEN
            name := 'Ladder of 7 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+5') and REGEXP_LIKE(pattern, '([xyz])\1')) THEN
            name := '2 consecutive and ladder of 6 inc';
            
        ELSIF (REGEXP_LIKE(pattern, '\-5') and REGEXP_LIKE(pattern, '([xyz])\1')) THEN
            name := '2 consecutive and ladder of 6 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+5')) THEN
            name := 'Ladder of 6 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-5')) THEN
            name := 'Ladder of 6 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+4') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
            name := '4 consecutive and ladder of 5 inc';
            
        ELSIF (REGEXP_LIKE(pattern, '\-4') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
            name := '4 consecutive and ladder of 5 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+4') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
            name := '3 consecutive and ladder of 5 inc';
            
        ELSIF (REGEXP_LIKE(pattern, '\+4') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
            name := '3 consecutive and ladder of 5 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+4')) THEN
            name := 'Ladder of 5 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-4')) THEN
            name := 'Ladder of 5 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+3') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
            name := '4 consecutive and ladder of 4 inc';
       
       ELSIF (REGEXP_LIKE(pattern, '\-3') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
            name := '4 consecutive and ladder of 4 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+3') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
            name := '3 consecutive and ladder of 4 inc';
            
        ELSIF (REGEXP_LIKE(pattern, '\-3') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
            name := '3 consecutive and ladder of 4 dec';
            
            
        ELSIF (REGEXP_COUNT(pattern, '\+3') = 2) THEN
            name := 'Ladder of 4 4 inc inc';
            
        ELSIF (REGEXP_COUNT(pattern, '\-3') = 2) THEN
            name := 'Ladder of 4 4 dec dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+3') and REGEXP_LIKE(pattern, '\-3')) THEN
            name := 'Ladder of 4 4 inc dec';
            
        ELSIF ((REGEXP_LIKE(pattern, 'x\+3') and REGEXP_LIKE(pattern, 'y\+2'))
        or (REGEXP_LIKE(pattern, 'y\+3') and REGEXP_LIKE(pattern, 'x\+2'))) THEN
            name := 'Ladder of 4 3 inc inc';
            
        ELSIF ((REGEXP_LIKE(pattern, 'x\-3') and REGEXP_LIKE(pattern, 'y\+2'))
        or (REGEXP_LIKE(pattern, 'y\-3') and REGEXP_LIKE(pattern, 'x\+2'))) THEN
            name := 'Ladder of 4 3 dec inc';
            
        ELSIF ((REGEXP_LIKE(pattern, 'x\+3') and REGEXP_LIKE(pattern, 'y\-2'))
        or (REGEXP_LIKE(pattern, 'y\+3') and REGEXP_LIKE(pattern, 'x\-2'))) THEN
            name := 'Ladder of 4 3 inc dec';
            
        ELSIF ((REGEXP_LIKE(pattern, 'x\-3') and REGEXP_LIKE(pattern, 'y\-2'))
        or (REGEXP_LIKE(pattern, 'y\-3') and REGEXP_LIKE(pattern, 'x\-2'))) THEN
            name := 'Ladder of 4 3 dec dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+3')) THEN
            name := 'Ladder of 4 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-3')) THEN
            name := 'Ladder of 4 dec';
            
        ELSIF (REGEXP_LIKE(pattern, 'xxx\+1x\+1x\+2x\+2')) THEN
            name := 'Ladder of double 3 steps inc';
        
        ELSIF (REGEXP_LIKE(pattern, 'xxx\-1x\-1x\-2x\-2')) THEN
            name := 'Ladder of double 3 steps dec';
        
        ELSIF (REGEXP_COUNT(pattern, '\+2') = 2) THEN
            name := 'Ladder of 3 3 inc inc';
            
        ELSIF (REGEXP_COUNT(pattern, '\-2') = 2) THEN
            name := 'Ladder of 3 3 dec dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\+2') and REGEXP_LIKE(pattern, '\-2')) THEN
            name := 'Ladder of 3 3 inc dec';
            
        ELSIF (REGEXP_LIKE(pattern, '\-2') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
            name := '4 consecutive and ladder of 3 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+2') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
            name := '4 consecutive and ladder of 3 inc';
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 8) THEN
            name := 'same 8';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1') = 2) THEN
            name := 'same 4 double adj';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1\1\1\1') = 1) THEN
            name := 'same 7 adj';
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 7) THEN
            name := 'same 7 non adj';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 2 and REGEXP_COUNT(pattern, '([xyz])\1') = 4 
                and (REGEXP_COUNT(pattern, 'x') = 6) or (REGEXP_COUNT(pattern, 'y') = 6)
                or (REGEXP_COUNT(pattern, 'z') = 6)) THEN
            name := '2 triplets 1 pair same number';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1\1\1') = 1) THEN
            name := 'same 6 adj';
            
        ELSIF (REGEXP_LIKE(pattern, '([xyz])\1\1\1\1') AND REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name := 'Same 5 and one pair';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1 and REGEXP_COUNT(pattern, '([xyz])\1') = 3 
                and ((REGEXP_COUNT(pattern, 'x') = 5) or (REGEXP_COUNT(pattern, 'y') = 5)
                or (REGEXP_COUNT(pattern, 'z') = 5))) THEN
            name := '1 triplet 2 pairs same number';
            
        ELSIF (REGEXP_LIKE(pattern,'([xyz])\1\1\1\1') AND REGEXP_COUNT(pattern, '([xyz])\1\1') = 2) THEN
            name := 'Same 5 and one triple';
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1\1') = 1) THEN
            name := 'same 5 adj';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])\1\1\1') and REGEXP_COUNT(pattern, '([xyz])\1\1') = 2) THEN
            name := '4 plus 3';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1\1') = 1) THEN
            name := 'same 4 adj';  
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 2 and REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name := '2 triplets 1 pair';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 2) THEN
            name := '2 triplets';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1 and REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name := '1 triplet and 2 pairs';
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 6) THEN
            name := 'same 6 non adj';
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 4) THEN
            name :=  '4 doubles including same number';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyzw]\1)') = 4) THEN
            name := '4 doubles';
            
        ELSIF (REGEXP_COUNT(pattern, '([xy])\1') = 3) THEN
            name :=  '3 doubles including same number';
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            name :=  '3 doubles';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 2) THEN
            name :=  '2 pairs any where';
            
        ELSIF (REGEXP_LIKE(pattern, '([xyz])\1\1') and REGEXP_LIKE(pattern, 'y0y0')) THEN 
            name := 'triplet x0x0';
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1) THEN
            name := '1 triplet';
        
        ELSIF (REGEXP_LIKE(pattern, 'xyzwwzyx')) THEN
            name := 'mirror 8';
            
        ELSIF (REGEXP_LIKE(pattern, 'xyzwzyx')) THEN
            name := 'mirror 7';
        
        ELSIF (REGEXP_LIKE(pattern, 'xyzzyx')) THEN
            name := 'abccba';
        
        ELSIF (REGEXP_LIKE(pattern, 'xyxzxz')) THEN
            name := 'abacac';
            
        ELSIF (REGEXP_LIKE(pattern, 'xzxyxy')) THEN
            name := 'acabab';
            
        ELSIF (REGEXP_COUNT(pattern, '(xyzw)') = 2) THEN
            name := 'abcd abcd';
        
        ELSIF (REGEXP_COUNT(pattern, '(xyz)') = 2) THEN
            name := 'abc abc';
            
        ELSIF (REGEXP_COUNT(pattern, '(xyy)') = 2) THEN
            name := 'abb abb';
            
        ELSIF (REGEXP_COUNT(pattern, '(xy)') = 3) THEN
            name := 'ababab anywhere';
            
        ELSIF (REGEXP_COUNT(pattern, 'x') = 5) THEN
            name := 'same 5 non adj';
            
        ELSIF (REGEXP_COUNT(pattern, 'x') = 4) THEN
            name := 'same 4 non adj';
        
        ELSIF (REGEXP_LIKE(pattern, '\*0\*0\*0')) THEN
            name := 'Additional a0b0c0';
            
        ELSIF (REGEXP_LIKE(pattern, 'x0x0$')) THEN
            name := 'end with x0x0';
            
        ELSIF (REGEXP_LIKE(pattern, '00$')) THEN
            name := 'double 00 end';
          
        ELSE
            name := '';
        END IF;
        RETURN name;
    END;  
    
BEGIN 
   
    for i in 76000000 .. 76111111   loop
        x :=i;
        pattern := getPattern(x); 
        pattern_name := getName(pattern);
        INSERT INTO PATTERNS (numbers,pattern,name) VALUES (i,pattern,pattern_name);
        --DBMS_OUTPUT.PUT_LINE(x||'----------------------'||pattern||'-----------'||pattern_name);
   end loop;
END; 
