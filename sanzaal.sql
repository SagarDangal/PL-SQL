

CREATE OR REPLACE PROCEDURE getPattern(X IN NUMBER,pattern OUT VARCHAR2 ) AS
    TYPE num_table IS TABLE OF VARCHAR(20) INDEX BY VARCHAR(20);                                    -----index is indivisual number like index are 1,2,3,4 of 11234 contais ta count of number like  t(1) = 2
    tables num_table; 
    
    TYPE labell IS TABLE Of VARCHAR(200) INDEX BY VARCHAR(200);
    l  labell;
    pattern_label_new labell ;
    pattern_label labell ;
    new_expression labell;
    similar labell;

    TYPE exp IS TABLE Of VARCHAR(200) INDEX BY VARCHAR(200);
    expression exp;
          
    type namesarray IS VARRAY(6) OF VARCHAR2(10); 
    name namesarray := namesarray('x','y','z','w','*','*'); 

    type numarray IS TABLE OF VARCHAR(200);  
    new_number_array2 numarray ;
    old_number_array numarray ;
    new_number_array numarray;
    
    
    countt integer;
    n NUMBER(10);
    start_num_char number;
    left_num number;
    

    char VARCHAR(200); 
    ii VARCHAR(200);
    ii2 VARCHAR(200);
    counter2flag VARCHAR2(20);
    bestpattern  VARCHAR2(20);
    specialpattern VARCHAR2(20);
    
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
             
             elsif ((n=-2) and flag = 'true' and (char = 'false') and (checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(1),1)))),new_expression)='true')) or
                ((n=-2)  and flag != 'false' and(checks_condition_1(Y(j),X)='false') and counter2flag ='true' )  then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
                
             elsif (n=-3) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
             elsif ((n=-4) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(3),1)))),new_expression)='true') or 
                ((n=-4) and  flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(2),1)))),new_expression)='true' and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
              elsif (n=-5) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),new_expression)='true'  then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
              elsif ((n=-6) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(5),1)))),new_expression)='true') or
                ((n=-6) and flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(4),1)))),new_expression)='true'  and counter2flag ='true') then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
             
             elsif (n=-7) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),new_expression)='true'  then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
              
              elsif ((n=-8) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(7),1)))),new_expression)='true') or
                ((n=-6) and flag = 'true' and checks_condition_2((concat(name(i),concat('+',SUBSTR(to_char(6),1)))),new_expression)='true'  and counter2flag ='true') then
             
                new_expression(concat(name(i),concat('+',SUBSTR(to_char(n),2)))) := Y(j);
                flag := 'true';
              
              elsif (n=1) and flag != 'false' and (char = 'false')  then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             elsif (n=2) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(1),1)))),new_expression)='true' or
                ((n=2)  and flag != 'false' and (checks_condition_1(Y(j),X)='false') and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=3) and flag = 'true' and (char = 'false')and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=4) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(3),1)))),new_expression)='true'  or
                ((n=4) and flag = 'true'  and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(2),1)))),new_expression)='true' and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
              elsif (n=5) and  flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),new_expression)='true' then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=6) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(5),1)))),new_expression)='true' or
                ((n=6) and flag = 'true' and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(4),1)))),new_expression)='true' and counter2flag ='true' ) then
             
                new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                flag := 'true';
             
             elsif (n=7) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),new_expression)='true' then
             
                 new_expression(concat(name(i),concat('-',SUBSTR(to_char(n),1)))) := Y(j);
                 flag := 'true';
                 
             elsif (n=8) and flag = 'true' and (char = 'false') and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(7),1)))),new_expression)='true' or
                ((n=8) and flag = 'true' and checks_condition_2((concat(name(i),concat('-',SUBSTR(to_char(6),1)))),new_expression)='true' and counter2flag ='true' )then
             
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
 
  BEGIN
    bestpattern := 'false';
    specialpattern := 'false';
    start_num_char := substr(to_char(X),2,8);
    left_num := substr(to_char(X),1,1);
    char :=start_num_char;                                                                                                         ----asigning a char of X to char
    n := LENGTH(char);   
    new_number_array := numarray();
     
    
    for i in 1 .. n LOOP                                                                                                        ----adding indivisual char of char to new_number_array array
        IF  not new_number_array.exists(i) then
        
            new_number_array.extend;
            new_number_array(i) := SUBSTR(char, i, 1);
        
        END IF;       
    END LOOP;
    
    
    old_number_array := new_number_array;                                                                                       ---copying new_number_array to old_number_array for future used
    new_number_array2 := new_number_array;
    new_number_array := new_number_array MULTISET UNION DISTINCT new_number_array2;                                             ----getting unique value of new_number_array and assigning to numms again
    
    
    
    
    for i in new_number_array.FIRST .. new_number_array.LAST LOOP
     
        n := REGEXP_COUNT(char,new_number_array(i));
        if n>3 then
            bestpattern := 'true';
        end if;
        
         tables(new_number_array(i)) := n;
        
         if (n>=2) then
            pattern_label(new_number_array(i)) := 'multiple';
          
        else
            pattern_label(new_number_array(i)) := 'single';
            
        end if;
       
        
        
    END LOOP;
    countt := 1;
    
   for i in new_number_array.FIRST .. new_number_array.LAST loop
    
        if (pattern_label(new_number_array(i)) = 'multiple')  then 
             expression(new_number_array(i)) := name(countt);
             similar(countt) := new_number_array(i);
             new_expression(name(countt)) := new_number_array(i);
             countt := countt + 1;

            
            
             
        else 
            expression(new_number_array(i)) := 'o';
        end if;
        
        
    
    end loop;
    if countt-1 >=3 or bestpattern= 'true' then
        pattern_label_new := ladder(similar,old_number_array);
    else 

        for i in new_number_array.first .. new_number_array.last-1 loop
        
            pattern:=condition_for_inc_1(new_number_array(i),new_number_array(i+1));
            l(to_char(new_number_array(i))):= pattern;
         
        end loop;
        
        if checks_condition_1('true',L)='false' then
        counter2flag :='true';
    
         for i in new_number_array.first .. new_number_array.last-1 loop
          
            pattern:=condition_for_inc_2(new_number_array(i),new_number_array(i+1));
            l(to_char(new_number_array(i))):= pattern;
           
         
        end loop;

   end if;
   pattern := 'true';

   
    for i in new_number_array.first .. new_number_array.last-1 loop
       
    
       if l(new_number_array(i)) = 'true' and pattern = 'true'   then

           if countt>1 then
                if checks_condition_3(new_number_array(i),similar)= 'false' and checks_condition_3(new_number_array(i)-1,similar)= 'false' and checks_condition_3(new_number_array(i)+1,similar)= 'false' then
  
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
    
   end loop;
   
   if checks_condition_1('true',L)='true' then
   
        pattern_label_new := ladder(similar,new_number_array);
        
   end if;
   
        
    end if;
   
    
    
    
    
   pattern := '';
   
   for i in old_number_array.First .. old_number_array.LAST loop
   
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
     
    end loop;
     pattern := concat(left_num,pattern);
    --RETURN pattern;

  END;  
    
