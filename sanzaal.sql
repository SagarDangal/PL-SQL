SET SERVEROUTPUT ON;



DECLARE
    TYPE num_table IS TABLE OF VARCHAR2(20) INDEX BY VARCHAR2(20); -----index is indivisual number like index are 1,2,3,4 of 11234 contais ta count of number like  t(1) = 2
    TYPE labell IS TABLE Of VARCHAR2(20) INDEX BY VARCHAR2(20); ------labell similar like num_table, index are same and contain "multiple" if count is <=2  else "single"
    TYPE exp IS TABLE Of VARCHAR2(20) INDEX BY VARCHAR2(20);---------similar like labell, index are same as above, contains x,y,z respectively if "multiple"
    x NUMBER ;                                                  ------- x is number for input
    type namesarray IS VARRAY(5) OF VARCHAR2(10);           -----name contais x,y,z,w as array
    name namesarray;                                ---declaring name as namearray
    type numarray IS TABLE OF VARCHAR2(20);       --numarray contain indivisual digit of x like('1','2','3','4','5') of 12345 
    char VARCHAR2(20);                    ----- declaring a character (it is latter used to kept char of x
    numss numarray := numarray();       --- declaring numarray
    n integer;         
    countt integer;
    tables num_table := num_table();
    nums2 numarray := numarray();
    nums3 numarray := numarray();
    labels labell := labell();
    expr exp := exp();
    patt VARCHAR2(20);
    
    
FUNCTION getPattern(X IN NUMBER)RETURN VARCHAR2 IS patt VARCHAR2(20);   ------ function to return a pattern
    
  BEGIN
    name := namesarray('x','y','z','w');                              ---adding value to name array
    char := to_char(X);                                            --------asigning a char of X to char
    n := LENGTH(char);                                           ------lenght of char
    --DBMS_OUTPUT.PUT_LINE(LPAD(char,10));
    
    for i in 1 .. n LOOP              ---------------------adding indivisual char of char to numss array
        IF  not numss.exists(i)
        THEN
        numss.extend;
        numss(i) := SUBSTR(char, i, 1);

        --DBMS_OUTPUT.PUT_LINE(i);
        
        END IF;       
    END LOOP;
    
    
    
    
    
    --DBMS_OUTPUT.PUT_LINE(numss(2)); 
    nums3 := numss;                 ---copying numss to nums3 for future used
    nums2 := numss;
    numss := numss MULTISET UNION DISTINCT nums2;   ----getting unique value of numss and assigning to numms again
    
    
    
    
    
    for i in numss.FIRST .. numss.LAST LOOP
        --DBMS_OUTPUT.PUT_LINE(i);
        n := REGEXP_COUNT(char,numss(i));
         tables(numss(i)) := n;
         if (n>=2) then
            labels(numss(i)) := 'multiple';
        else
            labels(numss(i)) := 'single';
            
        end if;
        --DBMS_OUTPUT.PUT_LINE(numss(i)||'----------------'||tables(numss(i))||'---------'||labels(numss(i)));
        
        
    END LOOP;
    countt := 1;
    for i in numss.FIRST .. numss.LAST loop
    if (labels(numss(i)) = 'multiple') then
        --DBMS_OUTPUT.PUT_LINE(i);
       expr(numss(i)) := name(countt);
        countt := countt + 1;
    else
        expr(numss(i)) := 'o';
    --DBMS_OUTPUT.PUT_LINE(i);
    end if;
    --DBMS_OUTPUT.PUT_LINE(labels(numss(i))||'---------- ------'||numss(i)||expr(numss(i)));
    end loop;
    patt := '';
    --DBMS_OUTPUT.PUT_LINE(tables('2'));
    for i in nums3.First .. nums3.LAST loop
    --DBMS_OUTPUT.PUT_LINE(nums3(i)||'-----------------'||tables(nums3(i))||'--------------'||labels((nums3(i)))||'-------'||expr(nums3(i)));
    if (expr(nums3(i)) != 'o') then
     patt := concat(patt,expr(nums3(i)));
     --DBMS_OUTPUT.PUT_LINE(nums3(i));
    else 
    patt := concat(patt,'*');
    
     end if;
    
    end loop;
    --DBMS_OUTPUT.PUT_LINE(x||'----------------------'||patt);
    RETURN patt;

  END;  
    
    
BEGIN 
    x := 11223344;
   patt := getPattern(x); 
   DBMS_OUTPUT.PUT_LINE(x||'----------------------'||patt);
END; 
