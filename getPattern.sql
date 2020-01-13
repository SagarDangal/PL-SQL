SET SERVEROUTPUT ON;

DECLARE
pattern VARCHAR2(30);
X NUMBER;

BEGIN
X := 112233;
getpattern(112233,pattern);
--INSERT INTO PATTERNS (numbers,pattern,name) VALUES (i,pattern,pattern_name);
DBMS_OUTPUT.PUT_LINE(X||'-------------------------------------'||pattern);
end;
