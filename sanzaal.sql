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
 
FUNCTION ladder(X IN labell,Y IN numarray)RETURN labell IS  new_expression labell; char VARCHAR(200); n NUMBER(10); flag VARCHAR2(20); patt varchar2(20);
 
 BEGIN
    
    << outer_loop >>
    for i in X.first .. X.last loop
        flag := 'null';
        << inner_loop >>
        for j in Y.first .. Y.last loop
            
            if (X(i) != Y(j)) then
            
             n := to_number(X(i)) - to_number(Y(j));
             char := checks_condition_1(Y(j),X);
             patt := checks_condition_1(y(j),new_expression);
               
            
             if (n=-1) and flag != 'false' and  (checks_condition_1(Y(j),X)='false')   then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true' ;
             
             elsif ((n=-2) and flag = 'true' and (char = 'false') and (checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(1),1)))),new_expression)='true')) or ((n=-2)  and flag != 'false' and(checks_condition_1(Y(j),X)='false') and counter2flag ='true' )  then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
                
             elsif (n=-3) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
             elsif ((n=-4) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(3),1)))),new_expression)='true') or ((n=-4) and  flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),new_expression)='true' and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
              elsif (n=-5) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),new_expression)='true'  then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
              elsif ((n=-6) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(5),1)))),new_expression)='true') or ((n=-6) and flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),new_expression)='true'  and counter2flag ='true') then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
             elsif (n=-7) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),new_expression)='true'  then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
              
              elsif ((n=-8) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(7),1)))),new_expression)='true') or ((n=-6) and flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),new_expression)='true'  and counter2flag ='true') then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
              
              elsif (n=1) and flag != 'false' and (char = 'false')  then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             elsif (n=2) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(1),1)))),new_expression)='true' or ((n=2)  and flag != 'false' and (checks_condition_1(Y(j),X)='false') and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=3) and flag = 'true' and (char = 'false')and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=4) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(3),1)))),new_expression)='true'  or ((n=4) and flag = 'true'  and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),new_expression)='true' and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=5) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=6) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(5),1)))),new_expression)='true' or ((n=6) and flag = 'true' and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),new_expression)='true' and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=7) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),new_expression)='true' then
             
                 new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                 flag := 'true';
                 
             elsif (n=8) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(7),1)))),new_expression)='true' or ((n=8) and flag = 'true' and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),new_expression)='true' and counter2flag ='true' )then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=9) and flag = 'true' and(char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(8),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             else
                if flag = 'true' then
                    flag := 'false';
                end if;
             
             end if;
             
            
          end if;
          
        end loop inner_loop;
    end loop outer_loop;

    RETURN new_expression;
             
                
 
  END;
 
 
    
FUNCTION getPattern(X IN NUMBER)RETURN VARCHAR2 IS pattern VARCHAR2(30); tables num_table;    ------ function to return a pattern
     new_number_array2 numarray ;
     old_number_array numarray ;
     l  labell;
     pattern_label_new labell ;
     pattern_label labell ;
     new_expression labell;
     expression exp;
     new_number_array numarray;
     countt integer;
     char VARCHAR(200);
     similar labell;
     n NUMBER(10); 
  BEGIN
    bestpattern := 'false';
    specialpattern := 'false';
    char := to_char(X);                                            --------asigning a char of X to char
    n := LENGTH(char);   
    new_number_array := numarray();
     
    
    for i in 1 .. n LOOP                                                             ---------------------adding indivisual char of char to new_number_array array
        IF  not new_number_array.exists(i) then
        
            new_number_array.extend;
            new_number_array(i) := SUBSTR(char, i, 1);
        
        END IF;       
    END LOOP;
    
    
    
    
    
    old_number_array := new_number_array;                                             ---copying new_number_array to old_number_array for future used
    new_number_array2 := new_number_array;
    new_number_array := new_number_array MULTISET UNION DISTINCT new_number_array2;   ----getting unique value of new_number_array and assigning to numms again
    --new_number_array := delete_0(new_number_array);
    
    
    
    
    for i in new_number_array.FIRST .. new_number_array.LAST LOOP
     if new_number_array(i)!='0' then
        n := REGEXP_COUNT(char,new_number_array(i));
        
         tables(new_number_array(i)) := n;
        
         if (n>=2) then
            pattern_label(new_number_array(i)) := 'multiple';
          
        else
            pattern_label(new_number_array(i)) := 'single';
            
        end if;
       end if;
        
        
    END LOOP;
    countt := 1;
    
   for i in new_number_array.FIRST .. new_number_array.LAST loop
    if new_number_array(i)!='0' then
        if (pattern_label(new_number_array(i)) = 'multiple') and specialpattern ='false' then 
             expression(new_number_array(i)) := name(countt);
             similar(countt) := new_number_array(i);
             new_expression(name(countt)) := new_number_array(i);
             countt := countt + 1;
             specialpattern := 'true';
             
       elsif   (pattern_label(new_number_array(i)) = 'multiple') and specialpattern ='true' then     
            expression(new_number_array(i)) := 'o';
            specialpattern := 'true'; 
             
        else 
            expression(new_number_array(i)) := 'o';
            specialpattern := 'false';
    
        end if;
        else
        specialpattern := 'false';
     end if;
    end loop;
    if countt-1 >4 then
        pattern_label_new := ladder(similar,old_number_array);
    else 

        for i in new_number_array.first .. new_number_array.last-1 loop
         if new_number_array(i)!='0' then
            pattern:=condition_for_inc_1(new_number_array(i),new_number_array(i+1));
            l(to_char(new_number_array(i))):= pattern;
         end if;
        end loop;
        
    end if;
   
    
    if checks_condition_1('true',L)='false' then
        counter2flag :='true';
    
         for i in new_number_array.first .. new_number_array.last-1 loop
          if new_number_array(i)!='0' then
            pattern:=condition_for_inc_2(new_number_array(i),new_number_array(i+1));
            l(to_char(new_number_array(i))):= pattern;
           
          end if;
        end loop;

   end if;
    
    pattern := 'true';

   
    for i in new_number_array.first .. new_number_array.last-1 loop
        if new_number_array(i)!='0' then
    
       if l(new_number_array(i)) = 'true' and pattern = 'true'   then

           if countt>1 then
                if checks_condition_3(new_number_array(i),similar)= 'false' and checks_condition_3(new_number_array(i)-1,similar)= 'false' and checks_condition_3(new_number_array(i)+1,similar)= 'false'then
  
                      expression(new_number_array(i)) := name(countt);
                      similar(countt) := new_number_array(i);
                      countt := countt  + 1;
   
                end if;
               pattern := 'false';
    
          else
             expression(new_number_array(i)) := name(countt);
             similar(countt) := new_number_array(i);
             countt := countt  + 1;
             pattern := 'false';
         end if;


     elsif l(new_number_array(i)) = 'false' then
     
        pattern := 'true';
        
     end if;
    end if;
   end loop;
   
   if checks_condition_1('true',L)='true' then
   
        pattern_label_new := ladder(similar,new_number_array);
        
   end if;
   
   pattern := '';
   
   for i in old_number_array.First .. old_number_array.LAST loop
    if old_number_array(i)!='0' then
       if (expression(old_number_array(i)) != 'o') then
                
                 pattern := concat(pattern,expression(old_number_array(i)));
     
      else
          char := checks_condition_1(old_number_array(i),pattern_label_new);
          if char = 'true' then
                ii := pattern_label_new.first;
                while (ii is not null) loop
                     if ( pattern_label_new(ii) = old_number_array(i)) then

                            pattern := concat(pattern,ii);
                             exit;
                     end if;
                     ii := pattern_label_new.NEXT(ii);
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
            
        ELSIF (REGEXP_COUNT(pattern, 'x') = 4 and not (REGEXP_LIKE(pattern, 'x\+1') or REGEXP_LIKE(pattern, 'x\-1'))) THEN
            name := 'same 4 non adj';
            
        ELSIF (REGEXP_LIKE(pattern, '000')) THEN 
            name := 'triple zero';
        
        ELSIF (REGEXP_LIKE(pattern, '\*0\*0\*0')) THEN
            name := 'Additional a0b0c0';
            
        ELSIF (REGEXP_LIKE(pattern, 'x0x0$')) THEN
            name := 'end with x0x0';
            
        ELSIF (REGEXP_LIKE(pattern, '00$')) THEN
            name := 'double 00 end';
          
        ELSE
            name := 'bad';
        END IF;
        RETURN name;
    END;

BEGIN 
   
    for i in 76000000 .. 76001000   loop
        x :=i;
        pattern := getPattern(x); 
        pattern_name := getName(pattern);
        --INSERT INTO PATTERNS (numbers,pattern,name) VALUES (i,pattern,pattern_name);
        DBMS_OUTPUT.PUT_LINE(x||'----------------------'||pattern||'-----------'||pattern_name);
   end loop;
END; 
