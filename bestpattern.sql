CREATE OR REPLACE FUNCTION get_name(pattern IN VARCHAR2,numbers IN NUMBER) RETURN VARCHAR2 AS name VARCHAR2(50);n number;
    BEGIN
        IF (REGEXP_LIKE(pattern, 'xx\+2x\+4x\+6x\+8')) THEN
            name := 'Additional Ladder by 2 Inc';
            
        ELSIF (REGEXP_LIKE(pattern, 'xx\-2x\-4x\-6x\-8')) THEN
            name := 'Additional Ladder by 2 dec';
        
        ELSIF (REGEXP_LIKE(pattern, 'xx\+2x\+4x\+6')) THEN
            name := 'Additional Ladder by 2 Inc';
            
        ELSIF (REGEXP_LIKE(pattern, 'xx\-2x\-4x\-6')) THEN
            name := 'Additional Ladder by 2 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\+1([xyz])\+2([xyz])\+3([xyz])\+4([xyz])\+5([xyz])\+6([xyz])\+7')) THEN
            name := 'Ladder of 7 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyza])\-1([xyz])\-2([xyz])\-3([xyz])\-4([xyz])\-5([xyz])\-6([xyz])\-7')) THEN
            name := 'Ladder of 6 dec';
            
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\+1([xyz])\+2([xyz])\+3([xyz])\+4([xyz])\+5([xyz])\+6')) THEN
            name := 'Ladder of 6 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyza])\-1([xyz])\-2([xyz])\-3([xyz])\-4([xyz])\-5([xyz])\-6')) THEN
            name := 'Ladder of 6 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\+1([xyz])\+2([xyz])\+3([xyz])\+4([xyz])\+5') ) THEN
           IF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\+1') THEN
                name := '3 consecutive and ladder of 5 inc';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\+1') THEN
                name := '2 consecutive and ladder of 5 inc';
            ELSE 
                name := 'ladder of 5 inc';    
        
            END IF;
            
            
        ELSIF (REGEXP_LIKE(pattern, '([xyz])\-1([xyz])\-2([xyz])\-3([xyz])\-4([xyz])\-5') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
           IF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\-1') THEN
                name := '3 consecutive and ladder of 5 dec';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\-1') THEN
                name := '2 consecutive and ladder of 5 dec';
            ELSE 
                name := 'ladder of 5 dec';    
        
            END IF;
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\+1([xyz])\+2([xyz])\+3([xyz])\+4([xyz])\+5'))  THEN
        
            name := 'Ladder of 6 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\-1([xyz])\-2([xyz])\-3([xyz])\-4([xyz])\-5')) THEN
            name := 'Ladder of 6 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\+1([xyz])\+2([xyz])\+3([xyz])\+4')) THEN
            IF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\1\+1') THEN
                name := '4 consecutive and ladder of 4 inc';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\+1') THEN
                name := '3 consecutive and ladder of 4 inc';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\+1') THEN
                name := '2 consecutive and ladder of 4 inc';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\1') THEN
                name := '4 consecutive and ladder of 4 inc';
             ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1') THEN
                name := '3 consecutive and ladder of 4 inc';
            ELSE 
                name := 'ladder of 4 inc';    
        
            END IF;
            
            
        ELSIF (REGEXP_LIKE(pattern, '([xyz])([xyz])\-1([xyz])\-2([xyz])\-3([xyz])\-4') and REGEXP_LIKE(pattern, '([xyz])\1\1\1')) THEN
             IF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\1\-1') THEN
                name := '4 consecutive and ladder of 4 dec';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\+1') THEN
                name := '3 consecutive and ladder of 4 inc';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\-1') THEN
                name := '2 consecutive and ladder of 4 dec';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\1') THEN
                name := '4 consecutive and ladder of 4 dec';
             ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1') THEN
                name := '3 consecutive and ladder of 4 dec';
            ELSE 
                name := 'ladder of 4 dec';    
        
            END IF;
            
        ELSIF (REGEXP_LIKE(pattern, '\+4') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
            name := '3 consecutive and ladder of 5 inc';
            
        ELSIF (REGEXP_LIKE(pattern, '\+4') and REGEXP_LIKE(pattern, '([xyz])\1\1')) THEN
            name := '3 consecutive and ladder of 5 dec';
        
        ELSIF (REGEXP_LIKE(pattern, '\+4')) THEN
            name := 'Ladder of 5 inc';
        
        ELSIF (REGEXP_LIKE(pattern, '\-4')) THEN
            name := 'Ladder of 5 dec';
            
        ELSIF (REGEXP_LIKE(pattern, 'xxx\+1x\+1x\+2x\+2x\+3')) THEN
            name := 'Ladder of double 4 steps inc';
        
        ELSIF (REGEXP_LIKE(pattern, 'xxx\-1x\-1x\-2x\-2x\-3')) THEN
            name := 'Ladder of double 4 steps dec';

        

        ELSIF (REGEXP_LIKE(pattern, 'xxx\+1x\+1x\+2x\+2')) THEN
            name := 'Ladder of double 3 steps inc';
        
        ELSIF (REGEXP_LIKE(pattern, 'xxx\-1x\-1x\-2x\-2')) THEN
            name := 'Ladder of double 3 steps dec';
        
        
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
         IF REGEXP_LIKE(pattern, '([xyz])\1\1\1\+1')=false Then 
            name := '2 triplets';
        ElSIF REGEXP_LIKE(pattern, '([xyz])\1\1\1\-1')=false Then 
            name := '2 triplets';
        ELSE
             n := substr(to_char(numbers),2,8);
            
            getpatternName(to_char(n),pattern,name);
            
        END IF;
            
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1 and REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
             IF  REGEXP_LIKE(pattern, '([xyz])\1\1\1-1') or REGEXP_LIKE(pattern, '([xyz])\1\1\1+1') THEN
               name := '1 triplet and 2 pairs';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1-1') or REGEXP_LIKE(pattern, '([xyz])\1\1\1+1') THEN
               name := '2 pairs';
            ELSE 
               
                name := '1 triplet and 2 pairs';
            END IF;
           
        
        ELSIF (REGEXP_COUNT(pattern, 'x') = 6) THEN
            name := 'same 6 non adj';
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 4) THEN
            n:=REGEXP_COUNT(pattern, '\+') + REGEXP_COUNT(pattern, '\-') ;
            name :=  concat(to_char(4-n),' doubles including same number');
            
        ELSIF (REGEXP_COUNT(pattern, '([xyzw]\1)') = 4) THEN
            name := '4 doubles';
            
        ELSIF (REGEXP_COUNT(pattern, '([xy])\1') = 3) THEN
             n:=REGEXP_COUNT(pattern, '\+') + REGEXP_COUNT(pattern, '\-') ;
            name :=  concat(to_char(4-n),' doubles including same number');
        
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1') = 3) THEN
            n:=REGEXP_COUNT(pattern, '\+') + REGEXP_COUNT(pattern, '\-') ;
            if n >0 then
            name :=  concat(to_char(3-n),' doubles ');
            else
            name := '3 doubles';
            end if;
        ELSIF (REGEXP_COUNT(pattern, '([xyz])\1\1') = 1) THEN
        
            IF  REGEXP_LIKE(pattern, '([xyz])\1\1\1\-1') or REGEXP_LIKE(pattern, '([xyz])\1\1\1\+1') THEN
               name := '1 triplet';
            ELSIF  REGEXP_LIKE(pattern, '([xyz])\1\1\-1') or REGEXP_LIKE(pattern, '([xyz])\1\1\+1') THEN
               name := '2 pairs';
            ELSE 
                
                name := '1 triplet';
            END IF;
            
        
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
            
       
       
          
        ELSE
            n := substr(to_char(numbers),2,8);
            
            getpatternName(to_char(n),pattern,name);
            
        END IF;
        
    RETURN name;
END;