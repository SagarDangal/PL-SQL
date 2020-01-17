CREATE OR REPLACE PROCEDURE getPatternName(X IN VARCHAR2,patterns IN VARCHAR2,pattern_name OUT VARCHAR2 ) AS
TYPE num_table IS TABLE OF VARCHAR(20) INDEX BY VARCHAR(20);
tables num_table; 
labels num_table;

type numarray IS TABLE OF VARCHAR(200);  
new_number_array numarray ;
new_number_array2 numarray ;
old_number_array numarray ;
n number;
c VARCHAR2(20);

FUNCTION checks_condition_ladder(X IN VARCHAR2,names numarray,tabless num_table) RETURN VARCHAR2 is bool VARCHAR2(20);

    BEGIN
    
       
        for i in names.first .. names.last loop
            
             if names(i) = X and X != '*'then
              return 'true';
            end if;
        end loop;
        return 'false';
    end;   



FUNCTION checks_condition(X IN VARCHAR2,names numarray,tabless num_table) RETURN VARCHAR2 is bool VARCHAR2(20);

    BEGIN
    
       
        for i in names.first .. names.last loop
             if tabless(names(i)) = X then
              return 'true';
            end if;
        end loop;
        return 'false';
    end;   


BEGIN

    pattern_name := '';
    n := LENGTH(X);   
    new_number_array := numarray();
     
    
    for i in 1 .. n LOOP                                                                                                        
        IF  not new_number_array.exists(i) then
        
            new_number_array.extend;
            new_number_array(i) := SUBSTR(X, i, 1);
           
        
        END IF;       
    END LOOP;
    
    
    old_number_array := new_number_array;                                                                                       ---copying new_number_array to old_number_array for future used
    new_number_array2 := new_number_array;
    new_number_array := new_number_array MULTISET UNION DISTINCT new_number_array2;   
    
    
    for i in new_number_array.FIRST .. new_number_array.LAST LOOP
     
        n := REGEXP_COUNT(X,new_number_array(i));
        tables(new_number_array(i)):=n;
    END LOOP;
   
    
    if (checks_condition(9,new_number_array,tables)='true') then
        pattern_name := concat(pattern_name,'Same 9 number');
    elsif (checks_condition(8,new_number_array,tables)='true') then
        pattern_name := concat(pattern_name,'Same 8 number');
    elsif (checks_condition(7,new_number_array,tables)='true') and (checks_condition(2,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 7 and 2 same number');
    elsif (checks_condition(7,new_number_array,tables)='true') then
        pattern_name := concat(pattern_name,'Same 7 number');  
    elsif (checks_condition(6,new_number_array,tables)='true') and (checks_condition(3,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 6 and 3 same number');
    elsif (checks_condition(6,new_number_array,tables)='true') and (checks_condition(2,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 6 and 2 same number');
    elsif (checks_condition(7,new_number_array,tables)='true')   then
        pattern_name := concat(pattern_name,'Same 6 number ');
    elsif (checks_condition(5,new_number_array,tables)='true') and (checks_condition(4,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 5 and 4 same number');
    elsif (checks_condition(5,new_number_array,tables)='true') and (checks_condition(3,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 5 and 3 same number');
    elsif (checks_condition(5,new_number_array,tables)='true') and (checks_condition(2,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 5 and 2 same number');     
    elsif (checks_condition(5,new_number_array,tables)='true')   then
        pattern_name := concat(pattern_name,'Same 5 number non adj ');
    elsif (checks_condition(4,new_number_array,tables)='true') and (checks_condition(3,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 4 and 3 same number non adj');   
    elsif (checks_condition(4,new_number_array,tables)='true') and (checks_condition(2,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'Occurance of 4 and 2 same number non adj');
    elsif (checks_condition(4,new_number_array,tables)='true')   then
        pattern_name := concat(pattern_name,'Same 4 number non adj ');    
    elsif (checks_condition(3,new_number_array,tables)='true') and (checks_condition(2,new_number_array,tables)='true')  then
        pattern_name := concat(pattern_name,'double and triple non adj');
        
    elsif (checks_condition(3,new_number_array,tables)='true')   then
        pattern_name := concat(pattern_name,'triple non adj ');  
    elsif (checks_condition(2,new_number_array,tables)='true')   then
        pattern_name := concat(pattern_name,'same 2 numbers'); 
    
    end if;
    pattern_name := concat(pattern_name,'    ');
     n := LENGTH(patterns);   
    new_number_array := numarray();
     
    
    for i in 1 .. n LOOP                                                                                                        
        IF  not new_number_array.exists(i) then
        
            new_number_array.extend;
            c := SUBSTR(patterns, i, 1);
            if c = '+' then 
                c := '\+';
            elsif c = '-' then
                c :='\-';
            end if;
            new_number_array(i) :=c;
             
            
            
        
        END IF;       
    END LOOP;
    
    
    old_number_array := new_number_array;                                                                                       ---copying new_number_array to old_number_array for future used
    new_number_array2 := new_number_array;
    new_number_array := new_number_array MULTISET UNION DISTINCT new_number_array2;  
    
    
    for i in new_number_array.FIRST .. new_number_array.LAST LOOP
        
        n := REGEXP_COUNT(patterns,new_number_array(i));
        labels(new_number_array(i)):=n;
    END LOOP;
    
     
    
  
    
    if (checks_condition_ladder('\+',new_number_array,labels)='true') and (checks_condition_ladder('\-',new_number_array,labels)='true') then
       n := REGEXP_COUNT(patterns,'\+');
       if  (checks_condition_ladder('1',new_number_array,labels)='false') and (checks_condition_ladder('2',new_number_array,labels)='true') then
            n:=n+1;
            
        end if;
        pattern_name := concat(pattern_name,to_char(n));
        pattern_name := concat(pattern_name,' inc, ');
        
        n := REGEXP_COUNT(patterns,'\-');
       if  (checks_condition_ladder('1',new_number_array,labels)='false') and (checks_condition_ladder('2',new_number_array,labels)='true') then
            n:=n+1;
            
        end if;
        
        pattern_name := concat(pattern_name,to_char(n));
        pattern_name := concat(pattern_name,' dec');
        
        
       
    
    elsif (checks_condition_ladder('\+',new_number_array,labels)='true') then
        n := REGEXP_COUNT(patterns,'\+');
       if  (checks_condition_ladder('1',new_number_array,labels)='false') and (checks_condition_ladder('2',new_number_array,labels)='true') then
            n:=n+1;
            
        end if;
        pattern_name := concat(pattern_name,to_char(n));
        pattern_name := concat(pattern_name,' inc');
     
    elsif (checks_condition_ladder('\-',new_number_array,labels)='true') then
         n := REGEXP_COUNT(patterns,'\-');
       if  (checks_condition_ladder('1',new_number_array,labels)='false') and (checks_condition_ladder('2',new_number_array,labels)='true') then
            n:=n+1;
            
        end if;
        pattern_name := concat(pattern_name,to_char(n));
        pattern_name := concat(pattern_name,' dec');
    
    
    end if;
    
   

END;