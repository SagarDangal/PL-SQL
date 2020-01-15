SET SERVEROUTPUT ON;

DECLARE
pattern VARCHAR2(300);
X NUMBER;

    starting_number number;
    start_num_char number;
    left_num number;
    counter number;
    pattern_name VARCHAR2(300);

BEGIN

    starting_number := &starting_number;
    counter  := &counter;
    
    
    
    
   
       for i in 0 .. counter loop
        getpattern(starting_number+i,pattern);
        getpatternName(starting_number+i,pattern,pattern_name);
        pattern := CONCAT(left_num,pattern);
        DBMS_OUTPUT.PUT_LINE(starting_number+i||'-------------------------------------'||pattern||'---------------'||pattern_name);
    end loop;
--INSERT INTO PATTERNS (numbers,pattern,name) VALUES (i,pattern,pattern_name);*/

    
   
end;
