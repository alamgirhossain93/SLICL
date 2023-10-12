--
-- JOB43  (Job) 
--
DECLARE
  X NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
  ( job       => X 
   ,what      => 'dbms_refresh.refresh(''"INS"."MV_INS_POLICY_HISTORY"'');'
   ,next_date => to_date('12/10/2023 23:00:00','dd/mm/yyyy hh24:mi:ss')
   ,interval  => 'TRUNC(SYSDATE+1) + 23/24    '
   ,no_parse  => FALSE
  );
  SYS.DBMS_OUTPUT.PUT_LINE('Job Number is: ' || to_char(x));
COMMIT;
END;
/



