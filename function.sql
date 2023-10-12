--
-- CF_USERFORMULA  (Function) 
--
CREATE OR REPLACE FUNCTION INS.cf_userformula wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
77 a2
NjDc7yJsjjNDPlH9O94/Cm/X64Ywg8eZgcfLCNL+XlrcbZZi3GLy2ZaXYtehw+fAsr2ym164
M7h0CaV0i8DAMv7Shgmm4U2iEUv2yCqc9kYD9qZa2lTFaGo9rq8k22oqFlT7WuY299LOApLO
poHOvlSCpqb82Swb
/


--
-- COUNT_STR  (Function) 
--
CREATE OR REPLACE FUNCTION INS.count_str wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
185 130
nG8zgeqBd2qW2RX6SSHftdH4Mbkwg0zI2Z4VfC/pTP7Vyd7MGkUhFtJ/YTd7YkLu0Zn+niL5
mqE7q/3nWG7avsf6rwnekYC4vCKWKKqqaHC5mzxRnDbR6gG3CtfTIUBlyd7hpp7wXDYQCpNl
VIzyGsushhICSeJmLnQYx16jcGI+Pw1VNxR5d5byicqUoX2NByD4HMJnWdbWmWQI5wO0CopW
iCTO3rpZzyQbmVSwCImm231elIDN2vYj9is0ENW9MWq+0ut/PzaMN3AKCA/6GW7Fy9HxuD9e
9DGZRg4PDA==
/


--
-- EL_MTR  (Function) 
--
CREATE OR REPLACE FUNCTION INS.el_mtr wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
235 1a9
dZC8U4qZunos3nqPKIV/EVn73TIwgxD3LUhGfHRA2ppeMCamKcWNSul4uK9nGnBP0weYYl7E
nyZ7GWp4vXZapPyo9D8FnZ2F7Uls7L0iImqxcr8xy2/Mvw69izzlLQ0glFSOIL/7oNpndEM7
C5mxKagauBFpvRqCWeAdf9KnSaUG5t9PyBRdZgqUcYCg563zBrS22KbXqNr/qEUki6eB9j2R
vrXvSXNf1uhuQ5kJGqNidE4BjB7MdwTHE8jmt7hBoHUgrTTeoan6ilhUIzN3KpjqrDAk+9fo
WbvvjmnDuJ2WdwjRSpUJSncBSpQpsynkMfRMEx7viTneyH+ZlDRnTFz2B2WKuLXrwshj4q2P
Lu5sYn/BZXxSfaPehGA59CVA7dG3NH/XGd0t1EWqxesfUBqN366dU+vW2A==
/


--
-- FINDCOURSE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.FindCourse
      ( name_in IN varchar2 )
       return number
     
is--or as

     cnumber number;
     
     cursor c1 is 
     select course_number 
     from courses_tbl
     where course_name = name_in;
     
     
 begin
 
 open c1;
 fetch c1 into cnumber;
 
 if c1%notfound then
 cnumber := 9999;
 
 end if;
 
 close c1;
 
 return cnumber;
 
 exception 
  when others then
 raise_application_error(-20001,'An error encountered- '||SQLCODE||' -  ERROR  -'||SQLERRM);
 
 END;
/


--
-- FUNC_TEMP_FA_ORG_GEN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.func_temp_fa_org_gen (p_faid VARCHAR2)
   RETURN VARCHAR2
IS
   v_org   VARCHAR2 (3000);
BEGIN
   FOR i
   IN (    SELECT   emp_gid, SYS_CONNECT_BY_PATH (emp_gid, ', ') emp_id_org
             FROM   (                                            --union all*/
                     SELECT    to_char(emp_gid) emp_gid,
                               TO_CHAR (employee_gid) employee_gid,
                               h_employee_gid
                        FROM   hrm_employee_setup s, hrm_employee e
                       WHERE   s.employee_gid = e.emp_gid
                     UNION ALL
                     SELECT   agent_id emp_id,
                              agent_id employee_gid,
                              dev_emp_gid h_employee_gid
                       FROM   hrm_agent
                      WHERE   agent_id = p_faid --'0000072515' --dev_emp_gid = 69474 --is not null
                                               )
       START WITH   employee_gid = p_faid                            --is null
       CONNECT BY   PRIOR h_employee_gid = employee_gid)
   LOOP
      v_org := i.emp_id_org;
   END LOOP;

   RETURN v_org;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END;
/


--
-- FUN_ACTIVITY_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_activity_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
20c 181
TqrasE5eR+Uph88RXtQMfv0sJuMwgzLM2iDWfC+5R2RTYpEKgzsW1vZK4D60PVLIkcJpE+X3
q8gWw5edZNkSFodWEGSYckplYpOIsix53m3Ei5vH3khhNJK+lPE7dDXehUT6VFBqPB3KXV/J
58P83YfYt70zLLvEN+80qv+CvBbNUwg5WlLQ8a8BTXEI+kQyfFMxfuil+22FFC9e4ElCl6wS
my/v7m6GYZqvVBq6W6bQ0w+1qxLWNdbf345WfpFlpOHaEQQqPSODr2DqsqJcurwgrDGX1LSi
fbdsx1rqO3FcuGKXBSVYbRBAb/R0O5KbBgoAHTwyXJY71CneEOzeInKBvxdnVT25tUcsXLkX
dvvM6M0G+taYD9sCNzw=
/


--
-- FUN_AGE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_age wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
5c9 1f2
rGab9RK3NYXDyqW65qX+cQodThUwgw3D2q5qfC/JM2RTO382s/XwBGjOg2Dybo9TYlkrB+Fe
9zB0WnMIztOr04E1FYZAhbyxv8HZELe+GFluPlOqBbQ9aqt6Oaa+jTEEn9PV/vcVDg8xZvei
p7lbfqvXcdX2m5B5qPUhtiM2SUZSnuLmHqZvHxpMVH+VyRyWBMtChdRX8JSt27dviio2GiqC
Vjvcnll8ZfVlgzKZh+w+gtWKBNfTzDexfYVko8G4RK/jAyuNBWJ0j0jtIzOHV3QzfjLAMb2v
SamE5ynri4EIFKL2OYqFE4esyCUrAmn7y+sXUFwnGl6Q9a6/w5dFP08H/tw1TgG1AsAZrTrp
gSUQxTr5KB5zBBKbeAvuJE0atcOSsp0TTn9khPjF6rtIup2nKisbClQKKy71p6xubRQUlMUp
WtWR9RlSHL4HdCDvR/Tw+qD1dDlYhn9Mm3DWUCLWGBM2DdxMdfHuMVtCP+Gi
/


--
-- FUN_AGENT_OFFICE_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_agent_office_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
63e 264
cD5CeWD4jip677kE4Kwdi742B+EwgzvDACAVfC/Nbg9SC8hloKQ1dBu8NgyvYGG9AcLFnlwf
RaC1nd9KLtNaa5R4kLuHuYZV1uCVx9c2B3P+rzS8u8sPi8edtbS5RzOyJTamp0CJhQ04dyIn
Zk6t93JYcmlR8zSteIi+S6Lt8XZ20aiX6SeEAj7QRDQIPeBAwAbHURZUShsgJWtEGq7QjDnm
l8vlW1g4+lMdYMbsFZ7HsrxS06uC4ul2SWCZPm98nG3JXmK96kSXyA9yzGaib+hi8uC9ym45
5slNseN2iRsJ/eXQrYfqyGawM5A3p6efWj1gvihgPy7P+lIpSPfbYXZGYddcti0iJDJf2Eqw
p1Dlm+lXkBT/OJW93XfzyPUMNkBL31NUe3A590PZXwHtunR8MB1SOFTaF/YZ/5CWrlWaDH3j
ewtNOwf//8GZ9aek8sZiYg+NtMqrAQ28Icfo9R/8eCARDW1PobnlJ3FNCv39+pKamhEA7XNk
GOomxLwrB44SKcUZUeATrG5A6rqU7o8fXAj+EpkYv77O3S0AURIImPE8G+B6zXNwPxfrvo2e
Hg+Wd7zmTtCHxKjilWooSBVUAw==
/


--
-- FUN_AGE_PROOF_DOC_ADMITTED  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_age_proof_doc_admitted wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2b6 1da
aM+ZIq87e8xt4ehMjktcC6YOvD0wgxAJr9xqfHRDNGSleaTm6wR4G8jC20zvZbAaKaleIS2y
UqlmIflPFHkDa/utrbsA2nKfm+xTjexw/oG5PJa6/ggxIdrE3kFVI04zRZogeMiN4nFa+9XJ
MK9H9SGmptZh34lL+wrhRcBxsZGoHOWcxyHITErJYsbbCaNtZnFFenLcAADGAhrK8jcklMVd
b+CVis93a6bx2LkP8nBI0iWCjU7Js8PsdaybZmbmx5Yrl6GXKuMiQ2tn1mlKCyB4yuDI/Pvv
7qFh3cgP2hkndBnEgdyJbIIzJo2ySepqT6AEWx0EgM1GRJP73h5JGnf0S2c/BwYPXGVVSMmf
cJhai3OpSEmkkZkaGtqDlQ3+2UVcKPjyTcXkDFnXHNy2NNVYxv0iwFaEjNYhF5sQV69Wx77+
FD/Hjph+Tvp49dKVwmr4+bA2M4r9QScOdw==
/


--
-- FUN_ARB_BONUS_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_arb_bonus_amt (p_pgid IN NUMBER)
   RETURN NUMBER
IS
   v_rb_amt       NUMBER := 0;
   
   v_datcom_yr    VARCHAR2(4);
   v_product_cd   VARCHAR2(2);
   v_sumass NUMBER := 0;
   v_term  NUMBER := 0;
BEGIN
   
   select distinct extract(year from COMM_DATE),product_cd,SUM_ASSURED,term
   INTO v_datcom_yr,v_product_cd,v_sumass,v_term
   from INS_P_SUMMERY
   where pgid = p_pgid;
   
   SELECT SUM (bonus_rate)
     INTO v_rb_amt
     FROM ins_yr_bonus
    WHERE bonus_yr BETWEEN v_datcom_yr+1 AND '2022'
      AND bonus_cd = '02'
      AND product_cd = v_product_cd
      AND term_from = v_term;

   RETURN ((v_sumass*v_rb_amt)/1000);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN 0;
   WHEN OTHERS
   THEN
      RETURN 0;
END fun_arb_bonus_amt;
/


--
-- FUN_ARB_BONUS_RATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_arb_bonus_rate (
   p_datcom_yr    IN   VARCHAR2,
   p_product_cd   IN   VARCHAR2,
   p_term         IN   NUMBER
)
   RETURN NUMBER
IS
   v_rb_amt       NUMBER := 0;
   
   v_datcom_yr    VARCHAR2(4);
   v_product_cd   VARCHAR2(2);
   v_sumass NUMBER := 0;
   v_term  NUMBER := 0;
BEGIN
   SELECT SUM (bonus_rate)
     INTO v_rb_amt
     FROM ins_yr_bonus
    WHERE bonus_yr BETWEEN p_datcom_yr+1 AND '2022'
      AND bonus_cd = '02'
      AND product_cd = p_product_cd
      AND term_from = p_term;

   RETURN (v_rb_amt);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN 0;
   WHEN OTHERS
   THEN
      RETURN 0;
END fun_arb_bonus_rate;
/


--
-- FUN_ASGN_COMM_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_asgn_comm_date wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
9a9 3d1
o4k9Rz5GqqrPOcAGyLpB2c0X//owg40rDNDrfC+Lbg9/dlDocIN5HzNnXBQgBqCn09rA8dEA
k9WebkVaevkkYYYUSoZnLWYygk7X+P0XA0BsKkN0vPk/p64knQDZcpqWH0I/koFEBuem8pO5
3p5qreD3dku0ygqUeqhcbF5xtmxQJNZgp84UmUHTxtGjEQ3KMu91N4CgJfGMR1Jc1Zns8pd3
D18oNY1np8InGKzj68Dhz1xP8sJ57W6iPwlmjKwIf4d+YAwfwYMev27BRDjFQMpEeRi4b/sO
HoCcJLfZXEJ06YM8+Zj9q31FWjDMWTsd0SMO9jvABliX9z1bk9Pub6/sBjfn43iZsLSI5DbZ
hYz/Vol1bzIcXDUuPgg/7OQhe3LewPHe70vum3rf7EFbwrBZHsXxtxo5oyterKhs0WCM5jkE
j6k4qh9zdYRZ2UNpdKwFRJvgdZB/wj/L96QJ14QSN3rsjHx5VVloQFG9mMgMpzzFtjQEA6IX
42BoPS4t06/r1CFyVCQc48pw0UqQ7TV+0XVj6CX/Alkhonix9860PEJbMhnE94JTVsFxLqvS
Xk6nhwigJRNOQjK+2D9NxwPjyrgZRYsQuuJLdOfquL+1Iuz7gzoj0jKST99XIPYak6nBLL+M
vidxEMo8NbFvnBazS/l5kbtK/IFq0s3De/CQihEjhgq817/jT/GiXmwzPpgrcjk3I7nzNIS4
sbxkHxFo4q8ZcjOWIuTmhL+3Hxf50/2/AXX03lvXvU3CqEqELEuxgi1zZmRZDsEoNGivO5TV
g5z3hgHslQdMaeQ5PLr2Wnfl3iT5pbjsYb7DL/4Mf/l9EhI3rNUB/vy1IyEe3nuHwbfT7Kfi
fGR7jf69CVU4LkjMkpf6g9G0qszUfXmiImwaijPDOx0dyavWAdT9pyMMtBLfWuIhUZvKM4Bw
o97+xdbYONPqEt9xIgUfqqYHuQlx
/


--
-- FUN_BALSHEET_HEAD_BAL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_balsheet_head_bal wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
255 1a5
9UQofeEuXgcKuI8lljxWk4xu5QEwgxAJr0hqynRVWGSlfz3l5YMq/DcvSTXhtoglSEl33lgj
dZ8xM7XWFAklDBAVP3r47oCCyJ6D88/5EMb+HrFyeXaqhnk0P110nvumEIppPIXMPT7aDCuQ
XZxzdL7os567qC3ZBAsEdak5uqiZKcfNeg0YjSE+WPcJw7Qnl02A1sWpLFaO4oAld9zqTzf/
OZ4SaR2CCYWVAHa/6wSmLq95e3KVQJBEJsN+LsPcYB4dtL1F9YXnCrnrM5SCiBQ9cCg798Uj
tvpjiGlWm8DOsmFpHNsrmQu7V6JPp+vWqttcShZyChkOF80EKx/cDhZLkxBCd8Zb+vvRe/W/
pN/iufItf35VkT6lXDhPtQd1H4CP5qOaGtqkEViYfND0ZzI60ihVwm2d
/


--
-- FUN_BALSHEET_HEAD_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_balsheet_head_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
136 117
l0hiCNICzsVI4hG8sMwJKn8aR7owg1yumNOsfC+g/+pxvaQL2VRwVxyCMDjR+81lVwZpFvCS
tRvKGFVVuRkZSDzIIWNmU7xgErlI0Gu7T599mG2kuy93Yd0U6WFlAt84kxQ0skSmfOxAKW30
CRKgTF0+Jyn+KLKv3xgVVIp/lvqZKisWsth3HEQW+k2qnIhyVKTK9yWLjQHYlP0KTKwj4NBE
ZRWWfcsrLQstSpifSkRBFDy87XVM54lSh16UeFDkEq3o6OVosmMIi7IWoa4b
/


--
-- FUN_BILL_FROM_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_bill_from_date (agreeid IN VARCHAR2)
   RETURN VARCHAR2
IS
   CURSOR frm_dt
   IS
      SELECT MIN (bill_dt_from)
        FROM uts_rent_bill
       WHERE agree_id IN (SELECT agree_id
                            FROM uts_agreement_mst
                           WHERE agree_id = agreeid);

   v_dt_from   VARCHAR2 (20);
--f_dt_from varchar2(100);
BEGIN
   OPEN frm_dt;

   LOOP
      FETCH frm_dt
       INTO v_dt_from;

      EXIT WHEN frm_dt%NOTFOUND;
   --v_dt_from:=(v_dt_from);
   END LOOP;

   CLOSE frm_dt;

   RETURN (v_dt_from);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN NULL;
   WHEN OTHERS
   THEN
      RETURN NULL;
END fun_bill_from_date;
/


--
-- FUN_BILL_TO_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_bill_to_date (
   agreeid                    IN       VARCHAR2
)
   RETURN VARCHAR2
IS
   CURSOR to_dt
   IS
      SELECT   bill_dt_to
             , ROWID
          FROM uts_rent_bill
         WHERE agree_id IN (SELECT agree_id
                              FROM uts_agreement_mst
                             WHERE agree_id = agreeid)
      ORDER BY bill_dt_to;

   v_dt_to                       VARCHAR2 (100);
   f_dt_to                       VARCHAR2 (100);
   x_dt_to                       VARCHAR2 (100);
   y_dt_to                       VARCHAR2 (100);
BEGIN
   OPEN to_dt;

   LOOP
      FETCH to_dt
       INTO x_dt_to
          , f_dt_to;

      EXIT WHEN to_dt%NOTFOUND;
   END LOOP;

   CLOSE to_dt;

   RETURN (v_dt_to);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      RETURN NULL;
   WHEN OTHERS THEN
      RETURN NULL;
END fun_bill_to_date;
/


--
-- FUN_BUILD_PK  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_build_pk wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
380 237
78vrOGN26TldCvqUDOwZyBkMyqAwg3leLiDWfHRVWA/uumfgXrre2nSByKzejGw3GzeztiVh
3OwrLrdhGZKGH7zhTPa9vX7BQ+0Xt29l31a3pT/k5Q9KLAfEkvi2zyimm+z6NtURjBrFGWkN
55gY1HliJt3ZnoC+3xMzX1bbnpQUdSWs/XWa/mLabDZuakUbZvQfIXmeLmsa9qVNSMIBkCQ3
mb+DTyQ2zOqxQKuOFteTEH8T10BK+oFeNuogDQF8jY+lAB/VcYIx6IpqCchs/treaz0v3dOF
SqkxcAV3RmBKLfu3PdeNjx6Q3FaxL+PCqDa9erBfobeBw8aR5WX7oTVCDEQB4LvwOZ5eQ9DZ
CC86MSwzZJ1nkncpIYiade+/09VeCcvqFZin9X5aXQ3PxV+Z1t1G3UaTxV7yH+ft3f8ey93s
fUcXq5HJ2HNueGP08M05etEHzXqQkjejsnqwvc4dYFfRhmL1lj+x/bTbekY/j7dMA1CQDXGG
QiaowO57K3+L13LrzwC6GMiTUfK1C2iEfWKA2osRuOsDabPXLEXq1JI=
/


--
-- FUN_CAL_LATE_FEE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_cal_late_fee wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
df9 494
Rn4VmfNKajkzV/wSkEemDuFax1owg9fqDCAFfHQZrZ2snKifE2OhYZSE645pfuh/cLpAVsSB
0eZ/oLDgsM210JtewuB4mFyp89nkWghii2kaN18wnmSqqgoPciD8zTpybSMQQvsgOaZYl7mM
L9w7FnmHHHXnSll+553KNN0UxfG9z6MUEo4qe1ZpAgmkNq5gUKi3EThsLI1oCx1vW/IgSS28
38wOVqKDJ5RDA8ne2cNZFjJnwxWNlGO+Lg9hlk8BWKhoinANO5URsBanhes/R1zom2ahaYkM
g6Fvxr3owjJj7zuiGwYJ3n3e3tjDvShSkydUl9Ua7wK8ToQyQApezXSlvPgbgPfFz5d8yATF
iGzOIgc84WA83ko8a152JFbLeS0a4wfvvGOwL1ayad4oVtowQ8jfInpKrJugdZeMrAfpypwb
4sFJsE1PFlOeCKjAdNSwpoJM4AUxHLuMw8f1lqDsT3YLm1aisGVwyZe6kStxeaN3BRe25gz+
kyB2jV5PT9/Qjd6EJYWtYZbao1yPK+iEIVBoWnGF3FD8L2dJTgjj4foPXNaDKpDlwQveTfTw
oqTqFXUSW6Msae+ECwXbU/QG2NqQIzmxAEAmHZZaRhqu7VD0UbvxxOlKb6DWdi6f5uLE6Ejx
x41LoMOsJIssWcRbb16WgKhTznDsUgmAz46/OKPBQT/U2jkFwY8tubkImILsg2HiTUq0lBoQ
ai1vaeofugmW8enclH8PchLNChgp0ppYPH7ublxY/rVsKiPadRkA73NynIKN5cEMiKEK/kR1
Pi+k2NhryH6LXBQ5/rHNpEfqsU78oBvqbjXUeqk2IB5CsHuvR4/aVFjyBSRVu8qo+3qpRrCb
dQoAl4AUKnoLz7qpKv6BvQXi1ed/ULGpeD8dk/Yth90jgjWaVo8jrOR5+w+wGvh8aZvTPFUH
6EeSUuWMwypvb1biAKTBSqogsOTVVImGuFNL1jm3C4hEk8MBXb6zfTmR76vx+Pk8X95iqvXj
HkNkeI4h2SG17UK5ybHsk22pLX820SH3HHLsk5Y5+JZnOEURd4GhkPATVJxKdLES3NgK1oqb
vmZt6tVR2Hg2B4M8i6qi0FX/2MvqKqzuTRE2ne5k2cBFH0VpxK/SBJBiW2W35hkeMyksBPqb
oQ==
/


--
-- FUN_CAL_LATE_FEE_FOR_ALTER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_cal_late_fee_for_alter wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
afa 3bd
8dZLTPfmVP/fNBLOXZwPQ3CqMGswgw0rBUgTZy/Ngg9/llzKUnYF3grFIY08fNtaS/ZibaSS
whjlXT4nYxZztf/Rv7Zad3fvqNESi4qKcfTAHE1UuDDOTgy1NBJ30L9y/pLuQeKarpK5CDr5
vXFbpmEjErYHpfHbNCO0f4h+dXHzP2Aw9CbJJqvGTnpMjFazRGVYjnuLWCMde0fMB/KACRrv
fcg+ijiNBA2MlTlWvaBCkNsj1KjTXNFCeVxurY0EJH1GaXvmd8CF6YCKZHIeB9DltGZxTGoV
lt5gTFSzfjKnsD6X4Ejk1PEU6eLYK26wHWHMH7F+2FAm51KHBAQfb61wa7tmwhJ0ecWQ+7kX
ZAr3x/DEunSOQKOVPrziONip80KTjJ99idSxSjmIGqoOjnvbTHq0dCAdaOzCpZAqGdtoEbRb
VxhX7bpAvTqetHsdnCq+7q15TRaNKAnYk6CUf4V8cCpwnTWhZMeXb40XuLJJ2ba112DfP1Kr
3+WmOMVAKVpdejbpT6v26OHrRlGLzOZ9iQjmDC1yGa8DC71cevI+XdpUNiaXqn8dQn1q99uf
Hxdx+VvaTFI2gLeX1D9qtctt4rAKulznptFnxVODkSPwJ9COpMTrPBdQE1sZ3ZkfL+BwexgF
HjeGGexiF0txLthkyaUB4DrrdNGwtABXfJt0p9cH5TQF3wXYtIPLx6eJQqeRgG1eAwEkWZqH
dF4yt1b/pUtkPJQ1PkMsxgkDr9vja8KJYZa+YU+fSeSt9fGFjFa+cTA8GfHA9TkNidmU3oFx
Xe3fSuLi9r+NjjPG5eyb3ChCJ28pwBLv/tKPc3YWE9zVx9eoK2rkJP24dKTfWqGYzKrjcVD0
H5mjk+Lny0OTCpoObx7a7T44EynuoM0UzGMPM/8pQmVGyxP1bX+TH7N/Po/NrWaoKgyO8rVq
D1M7qFo=
/


--
-- FUN_CAL_LATE_FEE_FP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_cal_late_fee_fp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
58c 260
XwCpuDfMutfgX1nrJZhLhy462KowgzvD+txqfC9DimR1mSesDpnnvfOBjxu2S1qKhVJFuIhc
TQBc4x3kJMtS8Rs78iikPhg7Qk7kyS2G5kBgFr0FT66SVLsRxPkZUJ8LnZalBKaRid5Z6ffT
rrL1WVrEyOl7hHmzxIjpRAl3HZ+z83hUOIRBRsNIrgtzCQdgXhGTLGzAi0dFi4lUBJXjGij6
RkeY+TjtU98KdO5CnoYOUT4U7mVqUHCiYBqk6PxwpRxzc+Pszlq8Ltvrh0ZjsL93GGZubU0s
QNkvA8Kk+xPubcgBogNLiz+tGyvvGs8pCJPLHCynAVGIKJrsFBBPDUR85Q+M1Ij2jRyn5zCy
VDRRYQU4SFM+wHUVcGXnI8IxvPU82zHJJsKYbuBchYWtXzIhsLVeNRcugSeHjI5jceJaCuk/
NRmtrorSUTzyD8hck9MQvVgWjN2y5CaheRUEbnmoGDbl3oOdp79pDxGq0nwztcNLTjLa+0V+
JDDtxBoKuYtaCRBGsZ1976Ubhi2BWbkQnQnBQfRviEv/EfkyGr+Zk8SWSlHlOgitIvRI+BCO
yZjnLS49K74uSf+sCg9qpRaE
/


--
-- FUN_CHECK_ANF_LOAN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_check_anf_loan (
   p_pgid        VARCHAR2,
   p_appl_date   DATE DEFAULT TRUNC (SYSDATE)
)
   RETURN VARCHAR2
AS
   v_last_anf_date             DATE;
   v_last_paid_dt              DATE;
   v_result                    CHAR (1);
   v_option_cd                 CHAR (1);
-------------------
   v_surrender_value           NUMBER (12, 2);
   v_surr_val_without_bon      NUMBER (12, 2);
   v_payble_bonus              NUMBER (12, 2);
   v_surr_val_with_stage       NUMBER (12, 2);
   v_message                   VARCHAR2 (200);
   v_error                     VARCHAR2 (200);
   v_surrender_factor          NUMBER (5, 2);
   v_paidup_factor             NUMBER (5, 2);
   v_bonus_factor              NUMBER (5, 2);
   v_commutation_factor        NUMBER (5, 2);
   v_yearly_prem               ins_p_summery.total_yearly_premium%TYPE;
   v_prem_due_year             NUMBER (5, 2);
   v_pay_mode_cd               ins_p_summery.pay_mode_cd%TYPE;
   v_late_fee                  NUMBER (12, 2);
   v_comm_date                 DATE;
   v_instl_premium             ins_p_summery.installment_premium%TYPE;
   v_due_dt_from               DATE;
   v_due_dt_to                 DATE;
   v_maturity_date             DATE;
   v_ins_tp_cd                 ins_p_summery.ins_tp_cd%TYPE;
   v_late_fee_rate             ins_late_fee_rate.fee_rate%TYPE;
   v_calc_date                 DATE;
   v_last_payable_due_dt       DATE;
   v_max_no_of_payable_instl   NUMBER (3);
BEGIN
---------------------------------------
---Add by Musha on 20.12.2015--
   pro_pol_surrender_value (p_pgid                      => p_pgid,
                            p_surrender_date            => p_appl_date,
                            p_no_anf_loan               => 0,
                            p_interest_rate             => 0,
                            p_bonus_amt                 => 0,
                            p_surrender_value           => v_surrender_value,
                            --With bonus amount excluded stage payment amount
                            p_surr_val_without_bon      => v_surr_val_without_bon,
                            --Without bonus amount excluded stage payment amount
                            p_payble_bonus              => v_payble_bonus,
                            --Payble bonus amount
                            p_surr_val_with_stage       => v_surr_val_with_stage,
                            --Surrender value included stage payment with bonus
                            p_message                   => v_message,
                            --This output is used to generate the message surrender value calculation
                            p_error                     => v_error,
                            p_surrender_factor          => v_surrender_factor,
                            p_paidup_factor             => v_paidup_factor,
                            p_bonus_factor              => v_bonus_factor,
                            p_commutation_factor        => v_commutation_factor
                           );

---------------------------------------
   SELECT last_paid_date, option_cd, total_yearly_premium,
          ROUND ((  (policy_installment - last_paid_inst_no)
                  / DECODE (pay_mode_cd,
                            '01', 1,
                            '02', 2,
                            '03', 4,
                            '04', 12,
                            NULL
                           )
                 ),
                 2
                ) prem_due_year,
          pay_mode_cd, comm_date, installment_premium, maturity_date,
          ins_tp_cd,
          ADD_MONTHS (comm_date,
                        (policy_installment - 1)
                      * DECODE (pay_mode_cd,
                                '01', 12,
                                '02', 6,
                                '03', 3,
                                '04', 1,
                                0
                               )
                     )
     INTO v_last_paid_dt, v_option_cd, v_yearly_prem,
          v_prem_due_year,
          v_pay_mode_cd, v_comm_date, v_instl_premium, v_maturity_date,
          v_ins_tp_cd,
          v_last_payable_due_dt
     FROM ins_p_summery
    WHERE pgid = p_pgid;

   IF TO_NUMBER (TO_CHAR (v_last_payable_due_dt, 'DD')) >
                                       TO_NUMBER (TO_CHAR (v_comm_date, 'DD'))
   THEN
      v_last_payable_due_dt :=
         TO_DATE (   TO_CHAR (v_last_payable_due_dt, 'RRRRMM')
                  || TO_CHAR (v_comm_date, 'DD'),
                  'RRRRMMDD'
                 );
   END IF;

   IF p_appl_date >= v_last_payable_due_dt
   THEN
      NULL;
   ELSE
      SELECT FLOOR (  MONTHS_BETWEEN (p_appl_date, last_paid_date)
                    / DECODE (pay_mode_cd,
                              '01', 12,
                              '02', 6,
                              '03', 3,
                              '04', 1,
                              NULL
                             )
                   )
        INTO v_max_no_of_payable_instl
        FROM ins_p_summery
       WHERE pgid = p_pgid;

      SELECT ROUND ((  (v_max_no_of_payable_instl - last_paid_inst_no)
                     / DECODE (pay_mode_cd,
                               '01', 1,
                               '02', 2,
                               '03', 4,
                               '04', 12,
                               NULL
                              )
                    ),
                    2
                   ) prem_due_year
        INTO v_prem_due_year
        FROM ins_p_summery
       WHERE pgid = p_pgid;
   END IF;

   /*
   SELECT ADD_MONTHS (v_last_paid_dt,
                      DECODE (v_pay_mode_cd,
                              '01', 12,
                              '02', 6,
                              '03', 3,
                              '04', 1,
                              0
                             )
                     ),
          ADD_MONTHS (v_last_paid_dt,
                      DECODE (v_option_cd, '1', 12, v_prem_due_year * 12)
                     )
     INTO v_due_dt_from,
          v_due_dt_to
     FROM DUAL;

   IF TO_CHAR (v_due_dt_from, 'DD') > TO_CHAR (v_comm_date, 'DD')
   THEN
      v_due_dt_from :=
         TO_DATE (   TO_CHAR (v_comm_date, 'DD')
                  || TO_CHAR (v_due_dt_from, 'MMRRRR'),
                  'DDMMRRRR'
                 );
   END IF;

   IF TO_CHAR (v_due_dt_to, 'DD') > TO_CHAR (v_comm_date, 'DD')
   THEN
      v_due_dt_to :=
         TO_DATE (   TO_CHAR (v_comm_date, 'DD')
                  || TO_CHAR (v_due_dt_to, 'MMRRRR'),
                  'DDMMRRRR'
                 );
   END IF;

   v_late_fee :=
      fun_cal_late_fee (p_pgid             => p_pgid,
                        p_premium          => v_instl_premium,
                        p_due_dt_from      => v_due_dt_from,
                        p_due_dt_to        => v_due_dt_to,
                        p_calc_date        => v_maturity_date
                       );
   */
   BEGIN
      SELECT fee_rate
        INTO v_late_fee_rate
        FROM ins_late_fee_rate
       WHERE ins_tp_cd = NVL (v_ins_tp_cd, '1');
   EXCEPTION
      WHEN OTHERS
      THEN
         v_late_fee_rate := 0;
   END;

   /*IF v_option_cd = '1'
   THEN
      v_late_fee := v_yearly_prem * (v_late_fee_rate / 100);
   ELSIF v_option_cd = '2'
   THEN
      v_late_fee :=
                    (v_yearly_prem * v_prem_due_year)
                  * (v_late_fee_rate / 100);
   END IF;*/ ---Musha on 10.01.2017 as per SLICL request
   v_late_fee := 0;  ---Musha on 10.01.2017 as per SLICL request after disable the above code

   IF    (    v_option_cd = '1'
          AND v_surr_val_without_bon >= (v_yearly_prem + v_late_fee)
         )
      OR (    v_option_cd = '2'
          AND v_surr_val_without_bon >=
                             ((v_yearly_prem * v_prem_due_year) + v_late_fee
                             )
         )
   THEN
      /*SELECT MAX (next_due_date)
        INTO v_last_anf_date
        FROM ins_anf_loan_dtl
       WHERE pgid = p_pgid;*/---Musha on 23.03.2016
      IF v_last_anf_date IS NULL
      THEN
         v_result := '1';
      ELSE
         /*SELECT last_paid_date, option_cd
           INTO v_last_paid_dt, v_option_cd
           FROM ins_p_summery
          WHERE pgid = p_pgid;*/  ---Musha on 20.12.2015
         IF v_option_cd = 1
         THEN
            IF v_last_paid_dt IS NOT NULL
            THEN
               IF v_last_paid_dt > v_last_anf_date
               THEN
                  v_result := '1';
               ELSE
                  v_result := '0';
               END IF;
            ELSE
               v_result := '1';
            END IF;
         ELSE
            v_result := '1';
         END IF;
      END IF;
   ELSE
      v_result := '0';
   END IF;

   RETURN v_result;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN 0;
END fun_check_anf_loan;
/


--
-- FUN_CHECK_ANF_LOAN1  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_check_anf_loan1 wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1313 5bc
WH+JhtEv2zTX9Km1g/X5bVADfmEwgztUDCAFVy8ZAz9EluldO4ODJyPej6ZfoknhFvIOTSEi
8+ktleFiwrBztQzyGnrPoTnCNBQlz07XuIVChbD3XFEpBJI6uwrkCP4PJD/6u2QkQ7uqvJ0c
aUGoRiMxJN8qZR6ITvy9TsJ16VO7Jtgtyvzekl63thwmZ6zV4IkowTWdGQHa8MGiX25idogc
0gUXoQjKFMlJ2ZGnP0Ud4xx4DdhEGGZXiKBMqt6EFiSKdOUegckBXLBpgn4ErUnYG3EiC3vR
0S0tEMqrVG9NoImrCjibuu9BRcyFW5TXNmHGwVvyIeB2qTp5h63n5FrxtKd01vdqAR3wm8Cd
xFQVQsbWV5UtnFduuGxvKh5qHxf2LgAz0dH7kGEsyoxQ5fYFzI8pUKnmdCMbdesDiq3e7ryr
34WHeRp5vSSqjpBp80RQyX6a9McgIPc/bB73WcgysXeTl2EK9L9YcRKmNtdpMiBD9M5bbwC6
pOGWfzQKZFmeJ7+3m6LWfGNiOGZhUu3Bo4W2u4NGlNYvTCXQbwrSSNutkNSDbLNbKR8we9bg
87do7jxUgNKz+QuJLIULasI+OxIZ+ryMNcDBSALHsQgZjt0mj2zqKFRzA+wWp+a+lWpFJtMl
ywNQjXOnn2o2zI1pMDhFCRLcWWgYVAQzsYDdPuwDn2lesTHifJQmvlCJlj+37aJVYTMOzrUF
sWOLgP4qbZqR0bPf2K3vP7f0osQtGxsIgR/Zu4gZleyVuvX03AKnajYGHmUb5irHNQhvXFE9
k+VpNNSwSYhiLOdsjWdwzyVs52ILaTfgpPNFl5j3PRZy9+W3pHnlAzaQNhCmd5LtxQ+Y4w9P
d3FUJt9NV9GyUgDKePhqLjfLug4JN5diUBdERVXhVSfH/cN+GvUqimu4HzhW1uraXVkcaVtg
dGJqZzdmsu1n3JlAVgxe10eM/Ia5VEzdCFO4W8WFXbKhQed7mcmcFSxenqqHuEJ6v7At21jT
6P6aQcMDhF5OIuzfAK6lMYEMa8GION9509Tc8zFsPxtwcDxURm0SzAiKQwHSrWYzWczL35MO
E2rXerv3nBhZB8hil3Qy5sx0i/CSTwHKw7mR0oHjM4Lzgi0R3P+/cswFl3EcfMjFEL+J+V4S
/IPORssztjdQqF2W6jqMOrf4YO26b9XF/UEm5T1upy8R/QPV92l1Ao3yBhK5+X2YzhyKnjAX
tVw92slkNIOHIVmcMHk5R1K4kEe/LG5uoQdvnQ5u9x9/qkRZD9I1yakgznyCilkKnrIytu/x
vDM8RZ2ZIR3YnT+rdbu1ZOtrGYj0RUFwu15hDxzWbRJThXGfxiz41UafsLY4DOfDjIP++sg7
UBp4RVa/xlINEKLXkdlvPeU6qRRwWgqYRY+9uNvf++to+TSRcL9YXlnt8p4G9tLDVXfpTtC1
prvoOqI=
/


--
-- FUN_CHECK_ANF_LOAN2  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_check_anf_loan2 wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a86 731
XSyOAakBTS5rBqLNbFH39tWIpGcwgzuTDCBo3y+5k52snHC/XioZjVUcftj74tuBnrOZjgEX
rqIvIRZQFQCBpywPCRoa7gwJBqXxKhfO17eC74toXD7ZHp4Qc7uNqjoecpaqTnJkDzoktT8/
LlDf5ucqNEKXghqxgugpROsUKxRoIURyfO8GZPlPX25S6nzbTaZgBTODl81MoLfkiUtKK+9g
Rrq++EeZaGVKCk6pIWK+CKZ1q24XegsW26Kh1WMSp4njYQeQydj93iquA4hglTGfifHF74kk
hlHW/FxMQmbxePTMZaYMn/r6D8CfJtrUrhW+ODM5D65E91lM9vwtX/+6QE+FdhKhg5/gN/bj
+4Mb+HPd3BY7JnJCPzP6ghduZTDAaYu/aiV6HqsHKt1V2tvGikPcHsKKBLmEJ0EIUg+96JWN
eImJp1hCPZtgtFynRockS+y9rh25NNWaLfaCFBNoBpOAI6fppOkaQpMX29etXsWP1hWe913k
WXot0mCHI9vt3Dx586yTf1TfjPFdaunM8Rg65MpMyH8/6DKIp2NYVACwafTpN4UxMmEvWlVU
hphFSjwYcsFg3Hm98VUOPwQ/3U4+0SXpnfwJMpWbJ9VqEGE/BlzXHk6FMQcdNtIrNk6iQZvF
/AzMhPYZdwJeyGHJAt+xCMwfpbxwW+odaXkeI+MtUJbu57eRbJYncb7lipzcwZTvUUCCeHr2
3ApRNwyLx2o/7VuK5pbc2hBwHHkCFqq3BOkxXXj6mb9YhxwUtXqYXzNdg2OFINMfSCDtVy4/
t+O4DIrp0l2B9AH+gtUtjkK90WhaMnz7QlXwCA0xHJnxnA4VAFMHwPrHMMCS8dKnjhQB50c/
wjZrUiNt92ShhFzeVVyIg0j3Tbcy97Dqy0WIkrJn2RDMvJ8c7UjbcRMYQVZ86Ll6u8jX+Uv0
szj0PvNZ+tPrO3BFuuBFtwZvDuXiFslVudO/HNvbMYOoCwSsFw7GUFen24WCw9uFBKbKl7RH
7hv/ZftMLQxtYbbAUGeq4XafNx27nSR9xdMHlPdpbmWSqtg4iYi4mEAISK0pXYOWUjZuUcTp
E+I7rsIEP8OVi4mygS3UyW02x0R0LS0A2NQzSxEGMAOV2pw+IyRFq+sLnbXA82rn/AcKjByM
d+o4P28yByjH7M4mIqvt0+Cg+sLXSAccH4xRnCyrV4T78lefqFwhCxxFJGAvxE/NYfz+NP/D
2MJozpuPBXghjJyWOiHsypiigZVmqw6l/H1MzsKlMHQHy7SW9hOsxaNR/vX4Vx8NfWAVflxW
zvRLH+bFra2uxzs9keQfj4uAJxWDGEvCHNjYOdX2rwkM54ms3l6xrN3BR4VvU+ARi6cu+zYu
euTuoMKctRGOsTL1oMImjI0QpDt5zQrmiBYe2iT1BgUNe3OFUevdruT/j+8DHKIenI8rD0ee
EFO1koQZKzzOaL+NgfGNFev92/NccgJZ2SbBDtc4jAqDsInSAH+rKOpNb+ltYSNbjnxdvK5o
LLM/uMZU/e6GQ8yXGMjr59K6s3OzI7kjZJ4iiVLWy2q3QU1u0T9lbbsubjtid5eZD2/REclh
Wz6EJgZSAodUdr16xhhK4CbO1UueEXjkw1UdOkwDYIchvz7pOLrAdWuPenU7IuNuvKiEq1hy
uUKZmeOQnJI4c7z+m9boqdwKUO7BoLehB/TJUf2SdJbkCZDsvirXrfwAcxETFywIr0aypJze
LbW0GcdZsLvTd9gwW9s15yx4cqydpkBy5zC7QLXts34o98xV2CU55Apy9OYbs/+QWgeZoSRK
ckb6apa1HbdhXpU=
/


--
-- FUN_CHILD_FOUND  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_child_found wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
318 207
khlGZVAWSwU/e7aAYGRZVKh2cNcwg3kJr0jWfHRVWGSlAeEanq9KhAA2J8rVLsVJ3rFeywrl
LoNFXmMQ+dMOYnkIbC1zQXNuU2VRd3GeV25KM4ZOHhIgKJ2whhxRpqY8K7ZRlMA3/wV8xf1g
lgMiAY7TdJ/cRC1y8yeEBqtdl4B4YYlgEb+2yVxXSIljfzT/qNfW4fbRelo4bWNAHIgBTK2m
0aB6Tvha6cBEs6kzK0kfJmFxR26WbXicoOCU3e0yiqvpeBx3C6klXyF+vkhwcS+LhsYEtvI+
Rh/MinAucSUd8POeecazBFTqOAXKqEsKCRE606jP3Mskqu5QRvREj9rqo4GqZfGDrk9EXus+
VrJS7QxolfF+s6vLIZjw+JagKn+wcoTdUEw7h6iQlJ8dLROcPzBxZLFp5lP3DKDy2mB7spvX
VUfHEUM8ZISdCQgUtJTSgvW4x1IGeqURh0yn9hHo/Y6EkDiIaiFHEDa6Ar9YfoVT3zSXHb+L
rrV1bqBq
/


--
-- FUN_CHK_APVL_LVL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_chk_apvl_lvl wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
408 233
CASyv2L5wDHYkmiYnlc181grEQgwgzJeLq5qfHRDbg/umSUbUKBSkBiJyYcfPi6E7G+fGC/T
5uDmcbS7SSx5g37IXoYX+O16mPjcZWr9vbskDzPNhuu8P0+uM/Uir6ymqcLlBtp1pNG6HlFF
zC4MlZdqxItNpT9asICjnqDC9ClZd6e9lx5GwxbqXisrChLZyZG8K94ZxzeU4mZ7cpqNYfbM
sORBJ58OkjdWAOKz9aOsivzTKu470L7LJWefZrzwFlzthQnAiX/DQPJAK4brjd3nhqZba2vI
R9z0lJzbgLqOhXRL6Mf1bQhCNb54MSHMfjS7Ml7Bfm/2RARQwR0nRtw+FwL2IVPCRuBfbLCn
BWfX/tbzRNhzVXZpYEGzoC4vSlGVqEEKY5fXnbAVmUDatMjeray5s9SOT9Io1izaX4gIspyZ
j9x/zen8OcO5cGER6WG/CPC3i/zgfOrgAyb5qEKgduVxeSpHfuh/Ultt698Ab7UIR9id9SQs
3Ubitvxxj/hXJim3j23BUp0h9PJsIUrpxKqugzLHlQUTD/KiuVc=
/


--
-- FUN_CLAIMANT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_claimant_nm (
   p_pgid           IN   VARCHAR2,
   p_clm_cause_cd   IN   VARCHAR2,
   p_clm_detl_cd    IN   VARCHAR2
)
   RETURN VARCHAR2
IS
   v_clmnm_add   VARCHAR2 (100);
   v_pgid        VARCHAR2 (20)  := NULL;
BEGIN
   FOR i IN (SELECT x.pgid,
                       y.party_name
                    || '-'
                    || z.p_address_1
                    || ' '
                    || z.p_address_2 clmnm_add
               FROM clm_claim_appl x, ins_p_personal y, ins_p_address z
              WHERE x.pgid = p_pgid
                AND x.clm_cause_cd = p_clm_cause_cd
                AND x.clm_detl_cd = p_clm_detl_cd
                AND x.pgid = y.pgid
                AND x.party_id = y.party_id
                AND x.pgid = z.pgid(+)
                AND x.party_id = z.party_id(+)
             UNION ALL
             SELECT x.pgid,
                       y.party_name
                    || '-'
                    || z.p_address_1
                    || ' '
                    || z.p_address_2 clmnm_add
               FROM clm_application x,
                    clm_clm_intimation i,
                    ins_p_personal y,
                    ins_p_address z
              WHERE x.pgid = p_pgid
                AND x.pgid = i.pgid
                AND x.pgid = y.pgid
                AND x.pgid = z.pgid
                AND i.clm_cause_cd = p_clm_cause_cd
                AND i.clm_detl_cd = p_clm_detl_cd
                AND i.condol_party_cd = y.party_cd
                AND i.condol_party_cd = z.party_cd)
   LOOP
      IF v_pgid = i.pgid
      THEN
         NULL;
      ELSE
         v_clmnm_add := i.clmnm_add;
      END IF;

      v_pgid := i.pgid;
   END LOOP;

   IF v_clmnm_add IS NULL
   THEN
      v_clmnm_add := NULL;
   END IF;

   RETURN v_clmnm_add;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN SQLERRM;
END;
/


--
-- FUN_CLM_APPL_REQ  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_clm_appl_req wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
c73 3cd
ssHikeE+TRPvBuH0mZDN8YeMud4wg9crLtATfC/NMZ3g0VzKGFGRBe2JwtP7STVmQKu330kK
5YPrYYMr/LVkLS6lL7dkM2lIMBlfxiAcKGT9pxg0kaXN/ig6QzqY5OSbm1aqEHO9+/up8isT
etb5+pNiPWaWCsLcGEL9EGLLlJCTIZYDG5Rl1yOgk+z+qHioYp9lLuzs7I5zoxS+TG6Y7jij
YOk4eKsaKVBor1Mm1ZeRjbhSfb93ZE5IzNahtFGtlLIXS64wRS7OHfr2USyUg9nlVpvSyvb3
4+giCV54mKRD5ez9PWzvt6ensrbLjExS5xwfOAfzZSbl5sKbdjlQgocHnBIn8jp8HmYxUzJU
A7rMHPeUVV3YAnegDieC9crgxtWXqPMbwotDy7ZRsSRIPrAObJS6eenbMWq4tlmEww9kezKB
hXsqKSa7J+48u+kE7y7sq8hLdMi5BjcvW1PcEX9vQdbm7BhbZse4fg9nqX3sWA379IJ1Vm+3
fEZ13THGT4oF1I71I8wVyG4/ac3R13SbgcyQrksR6tunZRNrrNbQgXO35b5uU8pXWBpcUuNK
s/CBFsCOAEq0X2ECU1LQRnyAsdwfSIjCHRyQx5EtoE0pFqjrmE0R1kLsoGAQN23neH405Xny
MkFk7yXQtr5fpFdBrXbN7kx0KFPC/tgAI4ivmnnPSg3v3tvGjZqILzgf5O4cpFVmjPakjIBb
r4XG/g918n0m6ptrD9tFhrYRMMC0PHWDnTwcBbYl0IwTtindskhDthOxAzmXxz8KHLREmYSj
dnjCEpEwB6uQiR429IBj1JEgZyMJ0eBwRiLisLVKAeRj0Ld2OsuE5687urHmBHeGkl0jAhS9
j42ju8ggco7+87EXvK2crYr9llcg/xwQKelGl0UZeWQVN/sK2e9ziSXl+O8+QYiJ/NtxD6aQ
jAV6PI4ClziT0vwokoBTTg==
/


--
-- FUN_CLM_QUES_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Clm_Ques_Tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e8 15c
2reVa8zm0TBrxkpbpfuXymNY6/owgxDINa5qfHQCrf7qNJmjSfvFmNx25vzCWju3vimpXkZ9
y1oLhA4I+N7aosRZFUnZP/lBzVE4zfABjvh5UBP+S2hknay1Z0We2UD8vB80mXsHOH3Ce+IZ
bsXRcwOMPtOomucLY6KWiUcO/F2O1JRFzijUPaYTSf7ScFcpQwvfoi5s3tDH2Dgg8/jwxwK0
xWEcmNCZ0+b1zqQGD0e1G32htx7974bjlXD9wENcFn5qrc/qex8YZSpEQ3HeoKtZWtueJR6T
pwHE6nV1zf7ZizuVHuJMC/6969zoB6TjqpytegDwKLuR7V0GWzqvPzU=
/


--
-- FUN_CNT_OFF_HRCY  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_cnt_off_hrcy wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
300 1c6
dMMhe2ulad5Loz9jf3PSPZun1rQwgxAJLq5qfHRDbg/uurreDjsGK1Ja6/Xwd61c8eEAOnze
BiEUNlv5AL3Xg7kdzxhBT09zincAnrAhFe4eWviGSe0sy9IzLbVAiftngEXijcgUxVPnAggI
R/ARU/qTb8Vf9e2viMOfYPp7jLgSJiH3qFXYsZOvb8yXOxUOcAHVAh35j1R+u9K+iuOxYLvK
8IovYZYQGYTWbGvzANxDZ6S/shq3mJQU/qFhrHodSKgzVNRkSAufsAJUmkWYUe0hJVp1vzOg
aI/xpEk3wKn/Fnn/J88liFX/jT8W39lPdkyuvqzXsooIgy5v/7+DJdf7tTK1SVKbrqyYzX0b
k8GhV/zkrf//K3w6xZEfIqj9lC9pXpWksKP+VDdOaYoEREsgBeDg9q58n6GYlaeHJrn3NkWP
rKvvQAa5WwvLsPo=
/


--
-- FUN_COLL_MEDIA_NO_VALIDATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_coll_media_no_validation (
   P_PR_NO          IN     VARCHAR2,
   P_OFFICE_CD      IN     VARCHAR2,
   P_BANK_CD        IN     VARCHAR2,
   P_BR_CD                 VARCHAR2,
   P_PRODUCT_CD     IN     VARCHAR2,
   P_PREMIUM_TYPE   IN     VARCHAR2,
   P_MEDIA_TYPE     IN     VARCHAR2,
   P_PR_YEAR        IN     VARCHAR2,
   P_OUTPUT            OUT VARCHAR2
)
   RETURN BOOLEAN
AS
   V_COUNT    NUMBER (10);
   V_STATUS   CHAR (1);
BEGIN
   BEGIN
        SELECT   COUNT (1), USED_STATUS
          INTO   V_COUNT, V_STATUS
          FROM   (  SELECT   COUNT (1), D.USED_STATUS
                      FROM   ACC_COLL_MEDIA_DTL D, ACC_PR_CONTROL_SETUP S
                     WHERE   D.MEDIA_NO = P_PR_NO
                             AND ( (P_MEDIA_TYPE != '02'
                                    AND D.OFFICE_CD = P_OFFICE_CD)
                                  OR (    P_MEDIA_TYPE = '02'
                                      AND BANK_CD = P_BANK_CD
                                      AND BR_CD = P_BR_CD))
                             AND DECODE (S.PR_CHECKING_YEAR_TYPE,
                                         '1',
                                         D.APPLICABLE_USING_YR,
                                         '2',
                                         D.PR_YEAR,
                                         '3',
                                         P_PR_YEAR) = P_PR_YEAR
                             AND D.STATUS = '1'
                             AND D.GROUP_NUMBER = S.GROUP_NUMBER
                             AND NVL (S.PRODUCT_CD, '1') =
                                   NVL (P_PRODUCT_CD, '1')
                             AND S.COLL_MEDIA_CD = P_MEDIA_TYPE
                             AND DECODE (S.PREMIUM_TYPE,
                                         'A', P_PREMIUM_TYPE,
                                         S.PREMIUM_TYPE) = P_PREMIUM_TYPE
                  GROUP BY   USED_STATUS
                  UNION ALL
                    SELECT   COUNT (1), D.USED_STATUS
                      -- INTO   V_COUNT, V_STATUS
                      FROM   ACC_COLL_MEDIA_DTL_BM D, ACC_PR_CONTROL_SETUP S
                     WHERE       D.MEDIA_NO = P_PR_NO
                             AND DECODE (S.PR_CHECKING_YEAR_TYPE,
                                         '1',
                                         D.APPLICABLE_USING_YR,
                                         '2',
                                         D.PR_YEAR,
                                         '3',
                                         P_PR_YEAR) = P_PR_YEAR
                             AND D.STATUS = '1'
                             AND D.GROUP_NUMBER = S.GROUP_NUMBER
                  GROUP BY   USED_STATUS)
      GROUP BY   USED_STATUS;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         V_COUNT := 0;
         V_STATUS := '0';
   END;

   IF V_COUNT = '0'
   THEN
      P_OUTPUT := 'Collection Media Number Is Not Valid!';
      RETURN FALSE;
   ELSE
      IF V_STATUS = '0'
      THEN
         RETURN TRUE;
      ELSE
         P_OUTPUT := 'Collection Media Number Already Used!';
         RETURN FALSE;
      END IF;
   END IF;
END;
/


--
-- FUN_COLL_MEDIA_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_coll_media_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
133 11f
hFFp8jB81Op/rxrm1pW9+zQoeHEwg1zQJCisfC+VkPg+SEbXS9MHo8uoN9XemUUqYH9/ryTW
yz8Suhg1YZi/u3OS7MQUWT690buYAABArxmSToERD08XKMwL9kfySOk5bDXGjRZT8uA5pp4u
Cuc03VMz8nhYMjgmM/iRBxaTxj4FBuIUu+tUa3wOmSZfxyO9dhmFbKh9vvEquKjYyI3QvuWv
IUH+RMU2quxtSHBIkMKd5Zkjl6XKSwh6b2c2JVdozpR4aTC1H+hh5XFAwvWBRKMw3NQ=
/


--
-- FUN_COMM_BILL_PAYABLE_STAT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_comm_bill_payable_stat wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e68 5e0
h07XhML0rK8MSaQKzoPTmoH1bjIwg82TTCAF347NAz9EDzkx4zi0yxjosnZnpxFYqVm905A8
rqKjft2p9WJLuTi1PxoUCRTp8om2dKTJvKKn/+1dAP5tkTNJdraJC6UFD6pQlpq8P2NPqqo/
6JpP+T+S5OTVc07G6yh8maamRALGrPHH+95uS5rn1oRCiZacl7EPzprp745jL7YYU6JJw51x
GK7FbvahRKNY79lyS1jvPUSfFtkR5ns3FGZ8dU7QbBSw09bGTV8ozL694cMIsdAh4G8kZsBI
dClAZ6wxyT+a1gkzsrBLWF9yJeZljoRxCP71D4uAJtfLqL5la0TTlALg0DkmWqIRX718OSKk
v0tdbTksYXBsUMEY1K0ZjIm9o1D2OAYmWn3zK5THB23wPfKpCuvRlrZGMeWgY+c7xIOroyjS
YLDsZOBbXka+poP9zGFE7vx5hST3HdioflowgsV1r3WWFEzF/6M2c5MqZ8Eu2sPOhn+XaQna
PLbywDnDUuexIrHg+uiF836fTfP1jMrxCuPf3AHFrMM6kgimDLRQbMC/ChSbEFA4WGrSfgbL
ugekZ1ITZmuwamphDAuyBbY5ZbBqMjBkEKyTRC7YX1/fsJJ2obEEMbGA7F+9vciBS6ydR/8s
47jh288aj4mNa/LlLc5XJH9bLaKIVLxNdP8yxlbP9hhtfXbNZckR8VAYUpOp295nCbG64vjD
CAFI5gyJKtYFd2Q4eFlE/968sKH14iGA/rLi74SnU1tLZfthuATj54BpMAkexrkCNii4NJ/H
aIy+oU+hFPiliugjdXl47hhol9HGiub4vLVWZBK7tG48ZaCIxYSMqHyL5PpIv63kPO6l1D0z
zQed2QeQcyXhHsDlxNBIB8+RTPTiqz8YOK+/ZDeXgjlfdmEgGH1BQngIvR0SVf5+KLztOCML
3ckLzkIGn4IExJy/rE+o4DFkkvf2putgDnM+l27oyAQSCJM1bblfXtDNHQU1FzFmBMOH52wJ
dfo7sYwJi8ypoYjB1syUi6hrK2s0bgx438t3yWisMnBOT1/JTXlVgU9MVV6xEVXDmJ7oxU0U
Clcr4SpZojTZasmQjM1O2TO8m3rSOPYrDfYoEtcYjxurtNmsG4/r1w5kC4FFUb17GkZayju7
T/S75nwBNt/lRbDq4gndXE3fIqyW4lxwo77h75SZMJFB2JS5dHdkLnS0VC7hYcJGpS8oA+Jh
387zJYNsRyFOXZGZDlW78Htwd1OVFJTNaVygROXsUYCGyN6tmxAfPn6VPKqlq7DSGAzDIYyj
8gV16DHXaF6UCl9s+yzzrXfyy8NcxwiskdlOiRcm1kJQiv9xU6JC3gT1CPJZt2Aw99zf8ouY
uEjN1dQQi9bszo8kPId6e8b4uNM6N/ACuSma/HbEsf9SzXax/+4Esf/uBkNce8ZVteLH46pu
YSXXTFqZs+Jo/NlhbpOjPCkaddiHoKUeiXi1piUbpgs=
/


--
-- FUN_COMM_BILL_PAYABLE_STAT_NEW  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_comm_bill_payable_stat_new wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c6b 5d8
2GAvScPyIdfwN8svLohlKDr8DEQwg82TeW0FVy+5F7UYOsBXa6gUk5eBRZGvLZSAj4XUK2HX
SS1iYo5hllCnwLX5FAXCgSfazcCxjAooE1TsiNd6gk6im7muFOhXSaW5BYAzi+sHKIqB+PgS
Mzq5u5ix/iAxnGS/DzHGxJo4b6Znr1AtcNJxym9J5Ii2+cFpHJgpY8L5B85xISfMGOcBVH1N
J4HSCdHlnhXcxUMNEMLkX+wQCUwBBwNfbMNcoWYYrL5U0fMAjTZIjGUiokMb57hs6CCT24yd
ldJoNncoPr0D1+SD0wHP8BpNMdyKJRiRV2Aa005+D4vG/+y6RouXQMv3TRaJ4yH3GGCJlUas
f4UpU4RjuEU/zy0CjXdX6lb/+hywcTFrLac4QRhGpMxcCKDOL5M7Grgyg0MBrL3+WceAo+3C
5BGCOPAZNKWRBwlZRuEZ/VzEAriBVo4M0qkn8yJ7CMnDFoR/AvUmGn5rJDOIcTbo1SkJyY/f
l7gJsAnno5khwevlext6sKNjVs8CCyD2jXIVVh9cY+Jk4vTKXDyHHGn0olPCHmHymYdb7RRb
6rum+7l7ikSO45Sy7UYgYRBO3sKnZfUQBOJq9nm9AZRlAQVWYUxwr2yv30WVp+v38ZvIk/Gy
SFj9eONa4cCWo+dNl2lEXsd7/656PjSJ7UjZyzPO/U7xCjViUceg2TAwoRXFSof79MYIGsnp
OP7Dvf7fa3mYShXJdbBxWF1WmgMUe+qj8s0vHqt95305K+ip1Qgdvv4aqtN1XqXkqFrtTeKE
wcs5Sy72cTYejpFzj8uGHgdUs7q+gTBxMCAXR3951wgAkI4DiFF19xoosPgVophezwFjU6Hi
+KZ8APpqKXOTRdJjUsAr4kDCBtKiePCHlU0vF/pnlZymWwdPcWZhwYgu1La7iwihkSTwKZZj
QuAl5KoPa/2uAvlXZLWeDfpP/GQV4XHf4c2MFsenZiduQhdE1ZLaAnYF/T9U12X4V+jw5oPM
gb78IwDlfVcwx+mGZyInlVLFZDsWTtYbi0y8E1n23Hk4VdH89EiZpCnBEV0igAoFD7jLKz1F
+Y3+emnWJ6NrmPg9eQU/tb6Eeb8+Qi0qvbkIW1nHc+DxpYSZSOhQjujkiWtw7EU1KuxRgAzl
NkzSM1zSQuecX91EXLXN7vSZOVP2gun+qH2ZHKyvZ2x/BO5/BM3ZSoDPcyadMXxGQFiefsIV
GkICiwTxAf2hljmBpwMrVF//zuGgHyCMvqU2S1BBurwm6FRerENFgFLxUQJt1QdADhaNaAoB
wZ5PdQCQ0HXuNMMJMPQpNwocdeXY+cNfVO6VojbdmIIgYG6cQP1LkG9fmgxqKiDDYug5VeSI
/5BufjRAmMz9+/kXd3o3MrWeluEAuGtQqvi/k/789zIsk/73Mg0IbQO5TppKMkO12aPNi6MZ
GBG7Qvx4eq3QoNj2K72T7U5tE3O3qqZziBXH
/


--
-- FUN_COMM_CAL_DASHBOARD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_comm_cal_dashboard (
   p_product_cd       VARCHAR2,
   p_term             NUMBER,
   p_first_prem_amt   NUMBER,
   p_deff_prem_amt    NUMBER,
   p_sec_prem_amt     NUMBER,
   p_ren_prem_amt     NUMBER,
   p_grp_prem_amt     NUMBER
)
   RETURN NUMBER
IS
   v_commission_amt   NUMBER (10, 2) := 0;
BEGIN
   FOR i IN (SELECT earning_cd, payable_pct
               FROM com_agency_comm_stp m, com_agency_comm_stp_detl d
              WHERE m.setupmst_cd = d.setupmst_cd
                AND m.product_cd = p_product_cd
                AND m.earning_cd IN ('01', '02', '03')
                AND (   (    m.term_depnt = '1'
                         AND p_term BETWEEN d.term_from AND d.term_to
                        )
                     OR (m.term_depnt = '0' AND 1 = 1)
                    )
                AND (   p_first_prem_amt > 0
                     OR p_deff_prem_amt > 0
                     OR p_sec_prem_amt > 0
                     OR p_ren_prem_amt > 0
                    )
             UNION ALL
             SELECT earning_cd, payable_pct
               FROM com_dev_earning_setup_mst m, com_dev_earning_setup_dtl d
              WHERE m.setupmst_cd = d.setupmst_cd
                AND m.product_cd = p_product_cd
                AND m.earning_cd = '01'
                AND (   (    m.term_depnt = '1'
                         AND p_term BETWEEN d.term_from AND d.term_to
                        )
                     OR (m.term_depnt = '0' AND 1 = 1)
                    )
                AND (p_first_prem_amt > 0 OR p_deff_prem_amt > 0)
             UNION ALL
             SELECT comm_tp_cd earning_cd, comm_rate payable_pct
               FROM grp_comm_setup m
              WHERE m.product_cd = p_product_cd
                AND p_grp_prem_amt BETWEEN m.prem_amt_from AND m.prem_amt_to
                AND p_grp_prem_amt > 0)
   LOOP
      IF p_first_prem_amt > 0 AND i.earning_cd = '01'
      THEN
         v_commission_amt :=
              v_commission_amt
            + ROUND ((p_first_prem_amt * i.payable_pct) / 100);
      END IF;

      IF p_deff_prem_amt > 0 AND i.earning_cd = '01'
      THEN
         v_commission_amt :=
            v_commission_amt
            + ROUND ((p_deff_prem_amt * i.payable_pct) / 100);
      END IF;

      IF p_sec_prem_amt > 0 AND i.earning_cd = '02'
      THEN
         v_commission_amt :=
            v_commission_amt + ROUND ((p_sec_prem_amt * i.payable_pct) / 100);
      END IF;

      IF p_ren_prem_amt > 0 AND i.earning_cd = '03'
      THEN
         v_commission_amt :=
            v_commission_amt + ROUND ((p_ren_prem_amt * i.payable_pct) / 100);
      END IF;

      IF p_grp_prem_amt > 0 AND i.earning_cd = '01'
      THEN
         v_commission_amt :=
            v_commission_amt + ROUND ((p_grp_prem_amt * i.payable_pct) / 100);
      END IF;
   END LOOP;

   RETURN (v_commission_amt);
END fun_comm_cal_dashboard;
/


--
-- FUN_COMPOUND_INTEREST_METHOD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_compound_interest_method wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1da 164
BcE+ALb6Vj2vI7mU0Qt9B2KFvBYwg/CuLdxqfC8B/+poEYTFccV/aX8a/5RWlNrAeQ0TW6s2
hLY2KbXH3F665nRUPDrPuxnrEvZkY15gagUmmWRzCAMkMgels7LN6vgARgvaNP5bcESmISve
JuyyCWQhlM0PKxHZ4z0ZK4xHLHUl0S8YnUusgFBRTisPYCe62KWhKczTQ+jCBLp7CTHbNmEv
bGgIAdsl+aDSpVcQfXxFMYEqIckfMX7LeMO3ZLp1ma8pk2iZ/9mOQE5WRANuJK5yb8B0YMv/
gmgMflGFoEsSYPLe5ky+xdjwsYE2V+HCj+mAFEP3ERHZSLVqZ0yWbVTiP6bhABFB
/


--
-- FUN_COM_COM_CALC_BASIS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_com_com_calc_basis wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bd 158
dL1qngs4bz1twUi/7BhZckAntTowgwHINQxqZy8CAMHqRzu9FtsjVhzoE/RMWslquegj/eBR
aU2yVNL+E1ODdc5wOEJO1wvJm+yNsUDugYYUebVvh8d+Q76tLP8Ih4k+6Tiouo6Nrw4Aow2E
mNzd8WRiD3RnH9cw0e5kP77O0S7fs6ccIYCMJHO8Q03KQzhBjDH9VEauYr4qARHnMiqm3Ji9
MGj3bHVkwChtQ98fQUGOXIaTZlQnWuBw74gjiWh3bjcs2LUO6c1aS+WeO7hH08I8VOMgPN7s
GYdq8k8iE4Zr1mG7hw6qW1U78XwdCHJ87hUI4Ag3q/QKlsyYSNo=
/


--
-- FUN_COM_COM_CALC_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_com_com_calc_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bb 158
aZlrok8a5DfAKoxkrmHhNhnsETkwgwHINQxqZy8CAMHqRzu9VOOBVHrYE/RMWsmc+uiD62nx
nuZ5osOlmhNTg3XOcDhCTtcLyZvsoHinjwhzFC7+dhn5tIUFwdmoGRhhYxFc479Rgn0NXNh4
GOq9fJLsKX6p5VG9rmzkPZYfD7D6e0WV2oSzj9CdIFxUDjN8139dYkcVxqdueYir5kxtmq12
Hv79kUYpG3h8BXkQiwg1jP1K069xENP7k/qJ6vEF7GWl7YEskQHFjkNxOKCrwjZYYoQ0cWPe
IzK9mceStCxPoxFFM6ZV1XWf90aIyD9AvVtKFxL+d2dxz/t6wEhR
/


--
-- FUN_COM_COM_YEAR  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_com_com_year wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
194 14c
8lND2prnLU2Bx57G5bEj/VBPXF8wgwHIrgxqZy+VAMFeNLq2Sy+ZQRgHzcngH+wxfDHDEqPy
XjVQOZ6ePxJOgAM1LFZWgiQcuy6HA5/UZYci0fl3vCi7Hs80ZhkSeZmqL2SC9YPVs7psCjbm
4m9BOWlcIS1xcOIPG7yutzKga4BqzCQonTWUzVraNihq/+DJq1Bxfn+phtFWQWEURi86+wPh
HvSMFy4BmlcVDzLLdGEiXtw6aDxurzKMtQ4WXvfqAb6Co4GHQaLYyofiJSHtmJUVcSLQIGSy
3HnHYBIC3m/6dTfOSUcwlTArwu+Szdd4xcXgDg==
/


--
-- FUN_COM_EARN_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_com_earn_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19c 154
x7xCAkiaqWVhfNZqDzzpXUuImSowgwHINQxqZy8CAMHqRzu9FtussAY4VVmDAsnfWd89BWns
56wu8t5Ete2YPBuvvOtlu4YIGYsq3hdWr/i+t0ydnJ8Sil3SEBGG8A7g0+oY/932jFRkjnK2
cPUq67imXOnvWURZMgIGsCGTopZTIY4C+M6SXAL2d8vm42sB539dVlkLgFcXuqlhlT12kLGU
Zcs+vP6CWRdWOdOaIac4MDa1Q4LnhfLobvFoPIk3TrC6yI0macOT4vArqAzIMWXbKE4hLiy7
OMlFZM3BgB2YvN5rJKzeyfpjHSUPWNkP1OtrHL0zVShjJZHi
/


--
-- FUN_CONTROL_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_control_office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
309 199
ULO4g7vEZTr4cs9BYDJQaQ6SXxQwg/AJLvZqfHRVMZ3mnDXhAQekHyO4pAG9GsBLjZ8AOmlv
BF851DO1F3hPBcLTTFbteh6hlv8nCXERrIseBv/NQ06MEL956zSQD6jTpri4e9meAtxjvJfX
vGQsYM5BrpRIe0jFiGvQyG1Xjzm+3zZb3sPR14zIYQvVLn71vtyo89rP0RZodrYsbwzDdKqj
9DhfrFSW3vBGR31zWTyTJHlDmxWbZ62LES/oPsTH6tQiyj6kVrSoLPO9VgxqpI68JWtG5z7t
Zv1whlUHhUF+TYZXve2l6TiUP/QElb0h+PN+0M5uGz2+iNVik95HshI/wEiSt1lomgpzxI8l
7ExW7ViwYmlMp8ek/MNkwYr7YJmx7Sk3n/6yVmphTA==
/


--
-- FUN_CPF_GL_HEAD_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_cpf_gl_head_opening wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
11b2 473
szPWbP3CY27S0uwNIRz7eRpovUUwg81UmiAFyi8ZA7UYBWqRui5msCWHgwHTOfFTDa8VV/ZP
UKANVRomHtkZksYofluGzoCx5ScqJlrMdGi/v2gQW9Qe8ThYuDmxqkg9xJj2Mk4Mc1OSkkxz
vJhFc0ISHTdbpr6DGucKZlxfHtGKyN26FEoXgRQPZLZZlBt8fPRCqJToWQmzTxRaCQ1vegrI
6LFZFNhpZZoKIS+WIYKslwl8cAFvXu5rFV/NjnI+DLRglRYCRT3hL1aMiHYHuMKsfaCnVRrF
H/UXkfNq9QmfZJyFYHlD4IKh8aSUCahfQvoamMDnSowvX2Yr6CYNHmC48nroE0aIyBBQOw4+
ldOjYhmHLhUUu74LFwqPBs87fMVhxYvkNPdoDM8xCTVrNQy5kr78FPl39sqQDRFkKHnqmegf
dYtAk0EqaqkMedgRYNKCA0gzhilgILRIsa0Lt/eD+jfdLUyeNUDRyriFUbb9/6MdYSl8daKE
j4DZOojgx6pnhWH4Eh18JkbdZqRIB4KlAkj5DmIFz+aLiBdO8vXmfNIbQKtloNvNtq+TnT6p
0ShgAyjj8xGZEEOn7QFA/fY+yOI4ifqIooz53ixB2a/fxbZBHOcydaYK3I9BheC/1cLa+o5/
gYRYNWcRblq24i+LgedviSGE3NQTphyK4EpnlNTd1zaTdFz+dFBRzQLccICT8haLosf9YuNp
VBGjC5pNKRqro50sa+N0FsKoiGkL+lEdzIzjWfvwo4rjyQJGMAnSuAM2JZziOgSWHBqr9Vof
lmi2Uj0AqMZnSOXFQcsIvJm9BpVKnDD2dXNCKjRJdPgXOE9otiN0jkr4imDU9OtXDmFxYn9h
kH8IGAUIZmORhALFIRfkYywnTfkSpreMDI6woDnpKhabtX/O2yk5gHNDnEc0rmshzdc0aczx
wcXy5CuJIOk65em+zy1R9YFzcluPZ8yBs2RUbDq6jTSPs5R9qk4DIlyZm4zQtx/sG3VElgKH
DUyIhtMlXW6sqmH4fCbKdpBdUdfiM0MQzVnOfXSB4m2hzDoX4l8SUGClZQfO02C5S1W7pkkK
N6+Muf1ztrs21ugjJ/6/Rou2gCif/Ij3v6r7C26XXg==
/


--
-- FUN_CPF_LEADGER_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_cpf_leadger_opening wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
84a 30a
8nmHq+14YOwoGV2LKYQakY6MtV8wgztczCATfC8Zgp0Gh8VnjOOLUpMcdvhaUN1g1BrXtyp5
3irel+Wh+LUDN6yhDtfCkvrOubzaqr/P3PbcXBtXevmt/CBy0JLB7h7+sGogcx46uORSz6zd
HakJbSHXFieX3eKk9/UMXWYn8BNuaddE3Ub38wJ7jVER8DMDbVFRCexm6haQFpagK/Tlp3Yw
TNjMIxrCF9o7RiUaaY/YPB2smBSs6edPK8hWusEJURnv96OJhYK8WMeHhhuG3xqadVw4Sncb
Bph2rOXRynBaRITnEVkWlCrqo83ZM9Fklk8681/KVEca6JustIghb9WhMAH6U54UvmYW0hmx
/jPtVwgpqoKbu89G7uneG2Qwh38U7kSJVf+vLfaPiwDJ4t+h8W3xUmxAnXd/IZ0kYl7vjkU7
wk2OjrPOXyZ2VKpgRPt7cGggzGaOCA6E1eqNaCXnF0DwYLflaJclJ8hNXp1mGfTsSC5IzooR
Pf24dzpuhH52k7VS/Dx98vPaqxGSdRQ/5wp42rHbStKC7MYS3lBgGEVGgT/1H2ozWterKdtb
GGMQtjRBI8vmWDnDVfQxTmuXNZwSgen/p0FVU+zsY/9e9xcPL+SY/SxGetqHaM63WHtcSLmD
JkWHt2j/mAyjeAewKKkeBtwaWCHa0Eq+pGEpvSdFeIIC2csdTp5MP/9BUUFNp9WE141Hcu/+
YjBC8mLeEApWAaVS4XAp8BhXJt2hmq+S9CDmWeIoqvvXo+W3
/


--
-- FUN_DEFAULT_INSU_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_default_insu_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
160 140
uJ4hB3i2zLqRYokIyXw6p1eWKwEwg1zILdxqfC9AWE6OtTz1dPbbcG7H9j5u7/hxcHuos/Ja
TeZRiDASbhayldZic0+7TpBMydUifNyGk5rQsMQITlEswbvMliQPxp7jFK1lyxuD7fT+pSZG
W4FuwpceZ9UmE3m6aYHEHN7BvqKxtlp3t5RnrNwqMi1NdCeYzV/7ctP5KZxolaUhsyG3EbQl
sj8ZXhrgH++t7vvXCURqpFD3gr4fMu0xlFPe38dPpu1Uq+juCukV5wnDvQHBla++u7D420yY
P4AQ6zhYRXxTRyMQ3gHNVZY6vCsB
/


--
-- FUN_DEFFRED_PREMIUM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_deffred_premium wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
761 2f2
F2rHndspscOhKyRIEJRFtpirGl0wg2NcLiAFfHRVMZ2s2pWHkGafJMuZe2ctfempYkRhaHlJ
D+ym2vUEntK1rsKUk8IN0ZUw5478CPTPjkPChgKRrGopgeq19XqQh0quc7uchk5ysRfj76ZX
0pTeAarKXzOJWjYLXwoszVrBFtQ9GG29lZgjB/CvpIXQvG+O+KwVkR259yGVQSG+NSccCVwq
wOlocNdFe4VN3Me2+Aw/hd6myczMUTiyl+LuQCLgOzMA5aKezAuuJ7NS3q4HVwUayEmlOvvf
BfOh2tLLs/aYPcg13gunFH+p7M+7PqdDacQdhUypCs2IuHjhUfqfzo1SzQtDWQjQKEuDkdXK
bjkSM0RlpEn+V9vV9i0V5uGV5sxnirNjGFYPPvPSBmBiSF6FmxTsd43gh1hVVv3MHc1aDfBf
IIXfiV51FaHAa9D8+laFQWU9ohZcjbi+IDJM+Squ7zDrPC8HbDqAbguMn/67GFBmmjTVBivp
kR9bFLO1qCI68kEFLUG/hi5vIOtoa06Rvrr/squkVA3LcFLv4Vh5TFOQGYg83C0i5rLL1c0B
RZF7uV4FV4VvalI/H1FnXNTqGDl1P+XAU7wz2WXj8uNqw/Ts77B1pJcg42hCFsbuJCTjXm4k
aUvPkkAmm0zq7geDsz0gl2PY/Zyvsc+z1b9KsJCOPLdF9AUkOzylmqFiyHd1rBJTOnrbgktm
sU3ChmpEIMijiCLk+6vCnKM=
/


--
-- FUN_DIVERT_GL_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_divert_gl_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
179 128
36fYNoY8Ak0Y67eGc/4jmMeUuqgwg3nI7csVfHRGWE6OHCk5X8N0qFOgUVcWvTfXmSTm5unm
3U6342EnFGVM/5qtLW0APurerNmY7uvNxz+8ziPBi/sL+6bah7EJLTtY9VMj3sM+11mRLRFQ
zbI19UagrwiERQvG66Gn1lQGRVF1/OlXb/bDyyuNgIa0KTW8bKbFwHspaOqejMTKjeBsefoM
O3jkHnfzB9OyFY+ubZEOesAww1Nt/S8QQGeYyKA7tiGBIOiC/7UqGlzRUQTYhUlpFGAPcoJx
BQ==
/


--
-- FUN_DROP_SUM_VALUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_drop_sum_value (
   p_pgid                  IN   VARCHAR2,
   p_term                  IN   NUMBER,
   p_last_paid_inst_no     IN   NUMBER,
   p_yrly_no_inst          IN   NUMBER,
   p_sum_assured           IN   NUMBER,
   p_product_cd            IN   VARCHAR2,
   p_comm_date             IN   DATE,
   p_policy_installment    IN   NUMBER,
   p_installment_premium   IN   NUMBER,
   p_last_paid_date        IN   DATE,
   p_policy_status         IN   VARCHAR2,
   p_age                   IN   NUMBER
)
   RETURN NUMBER
IS
   v_bonus_perc             ins_yr_bonus.bonus_rate%TYPE;
   v_last_valuation_year    ins_yr_bonus.bonus_yr%TYPE;
   v_policy_group           ins_policy_type.policy_tp_cd%TYPE;
   v_surrender_rate         sur_sur_factor.surrender_rate%TYPE;
   v_cal_para               sur_sur_factor.cal_para%TYPE;
   v_surrender_value        NUMBER (15, 2);
   v_paidup_value           NUMBER (15, 2);
   v_no_of_premium_year     NUMBER (5, 2);
   v_counter                NUMBER (4);
   v_start_year             NUMBER (4);
   v_last_year              NUMBER (4);
   v_bonus_amt              NUMBER (15, 2)                         := 0;
   v_last_paid_year         NUMBER (4);
   v_count                  NUMBER (4);
   v_paidup_age             NUMBER (2);
   v_inst_month             NUMBER (2);
   v_premium_paid_year      NUMBER (5, 2);
---------------------------------------------
--v_surrender_value             NUMBER (10, 2);               --With bonus amount
   v_surr_val_without_bon   NUMBER (10, 2);            --Without bonus amount
   v_payble_bonus           NUMBER (10, 2);             --Payble bonus amount
   v_surr_val_with_stage    NUMBER (10, 2);
   v_surrender_factor       NUMBER;
   v_paidup_factor          NUMBER;
   v_bonus_factor           NUMBER;
   v_commutation_factor     NUMBER;
   v_sur_message            VARCHAR2 (200);
   v_sur_error              VARCHAR2 (200);
   ------
   v_anfl_cnt               NUMBER (4)                             := 0;
   v_remaning_instl         NUMBER (4)                             := 0;
   v_pay_mode_cd            ins_p_summery.pay_mode_cd%TYPE;
   v_option_cd              ins_p_summery.option_cd%TYPE;
   v_anf_bonus_amt          NUMBER (10)                            := 0;
   v_last_paid_inst_no      ins_p_summery.last_paid_inst_no%TYPE;
   v_full_paid_yr           NUMBER (2)                             := 0;
   v_tot_payable_yr         NUMBER (2)                             := 0;
---------------------
   v_bon_calc_mess          VARCHAR2 (200);
   v_bon_calc_st            CHAR (1);
   v_bon_max_yr             NUMBER (4);
---------------------------
   v_no_of_anf_loan         NUMBER (5)                             := 0;
   v_no_of_anf_loan_yr      NUMBER (2)                             := 0;
   v_anf_loan_amount        NUMBER (12, 2)                         := 0;
   v_interest_amount        NUMBER (12, 2)                         := 0;
   v_anf_error              VARCHAR2 (2000);
/******************************************************************************
NAME:       fun_drop_sum_value
PURPOSE:    Drop Sum Value is used for Policy Alteration a Revival
            when the sum assured is being altered.

REVISIONS:
Ver        Date        Author                      Description
---------  ----------  -------------------------   ----------------------------
1.0        06/17/2009   1.Mohammad Arifur Rahman   Created this Function
******************************************************************************/
BEGIN
   BEGIN
      SELECT TO_NUMBER (TO_CHAR (p_comm_date, 'rrrr')),
             TO_NUMBER (TO_CHAR (p_last_paid_date, 'rrrr')),
             DECODE (p_yrly_no_inst, 1, 12, 2, 6, 4, 3, 1),
             DECODE (p_yrly_no_inst, 1, '01', 2, '02', 4, '03', 12, '04', 1)
        INTO v_start_year,
             v_last_paid_year,
             v_inst_month,
             v_pay_mode_cd
        FROM DUAL;

      SELECT paidup_age
        INTO v_paidup_age
        FROM ins_product
       WHERE product_cd = p_product_cd;

      v_premium_paid_year :=
                ROUND (ROUND (p_last_paid_inst_no) / ROUND (p_yrly_no_inst),
                       2);
      v_no_of_premium_year := (p_last_paid_inst_no * v_inst_month) / 12;

      IF v_no_of_premium_year >= v_paidup_age
      THEN
         SELECT NVL (MAX (bonus_yr), 0)
           INTO v_last_valuation_year
           FROM ins_yr_bonus;

         IF v_last_paid_year <= v_last_valuation_year
         THEN
            v_last_year := v_last_paid_year;
         ELSE
            v_last_year := v_last_valuation_year;
            v_count := v_last_paid_year - v_last_valuation_year;
         END IF;

         IF v_start_year <= v_last_year
         THEN
            FOR v_counter IN v_start_year .. v_last_year
            LOOP
               BEGIN
                  SELECT NVL (bonus_rate, 0)
                    INTO v_bonus_perc
                    FROM ins_yr_bonus
                   WHERE bonus_yr = v_counter
                     AND product_cd = p_product_cd
                     AND bonus_cd = '01'
                     AND p_term BETWEEN term_from AND term_to;
                     --AND pay_mode_cd = v_pay_mode_cd;
               EXCEPTION
                  WHEN NO_DATA_FOUND
                  THEN
                     v_bonus_perc := 0;
               END;

               v_bonus_amt :=
                    v_bonus_amt
                  + ROUND ((p_sum_assured * (v_bonus_perc / 1000)), 2);
            END LOOP;

            IF    (p_policy_installment = p_last_paid_inst_no)
               OR (p_policy_status = '02')
            THEN
               FOR v_counter IN 1 .. v_count
               LOOP
                  BEGIN
                     SELECT NVL (bonus_rate, 0)
                       INTO v_bonus_perc
                       FROM ins_yr_bonus
                      WHERE bonus_yr = v_last_year
                        AND product_cd = p_product_cd
                        AND bonus_cd = '01'
                        AND p_term BETWEEN term_from AND term_to;
                        --AND pay_mode_cd = v_pay_mode_cd;
                  EXCEPTION
                     WHEN NO_DATA_FOUND
                     THEN
                        v_bonus_perc := 0;
                  END;

                  v_bonus_amt :=
                       v_bonus_amt
                     + ROUND ((p_sum_assured * (v_bonus_perc / 1000)), 2);
               END LOOP;
            END IF;
         ELSE
            WHILE v_start_year <= v_last_paid_year
            LOOP
               BEGIN
                  SELECT NVL (bonus_rate, 0)
                    INTO v_bonus_perc
                    FROM ins_yr_bonus
                   WHERE bonus_yr = v_start_year        ---v_last_valuation_year
                     AND product_cd = p_product_cd
                     AND bonus_cd = '01'
                     AND p_term BETWEEN term_from AND term_to;
                     --AND pay_mode_cd = v_pay_mode_cd;
               EXCEPTION
                  WHEN NO_DATA_FOUND
                  THEN
                     v_bonus_perc := 0;
               END;

               v_start_year := v_start_year + 1;
               v_bonus_amt :=
                    v_bonus_amt
                  + ROUND ((p_sum_assured * (v_bonus_perc / 1000)), 2);
            END LOOP;
         END IF;

                  ---Add by Musha on 02.10.2018---
                  ---Get bonus amount---
                  /*BEGIN
                     FOR i IN (SELECT bonus_cd
                                 FROM ins_bonus_type)
                     LOOP
                        SELECT MAX (a.bonus_yr)
                          INTO v_bon_max_yr
                          FROM ins_pol_bonus_circular c, ins_pol_bonus_applicable a
                         WHERE a.circular_id = c.circular_id
                           AND c.cal_status = '0'
                           AND a.status = '1'
                           AND a.bonus_cd = i.bonus_cd;

         --==========================================--
                        IF v_option_cd IN ('1', '2')                --ANF Application--
                        THEN
                           v_anfl_cnt := 0;
                           v_full_paid_yr := 0;
                           v_tot_payable_yr := 0;
                           pro_anf_loan_payable_info
                                          (p_pgid                   => p_pgid,
                                           p_appl_date              => TRUNC (SYSDATE),
                                           p_no_of_anf_loan         => v_no_of_anf_loan,
                                           p_no_of_anf_loan_yr      => v_no_of_anf_loan_yr,
                                           p_anf_loan_amount        => v_anf_loan_amount,
                                           p_interest_amount        => v_interest_amount,
                                           p_error                  => v_anf_error
                                          );
                           v_anfl_cnt := NVL (v_no_of_anf_loan_yr, 0);
                        END IF;

                        pro_policy_bonus_cal_setl
                                               (p_pgid                    => p_pgid,
                                                p_bonus_yr                => NULL
                                                                                 --,p_bonus_cd          => i.bonus_cd
                        ,
                                                p_applicable_on           => 6,
                                                p_no_of_anf_loan_yr       => v_anfl_cnt,
                                                p_usr                     => 'INS',
                                                                              --p_user,
                                                p_irg_bonus_bar_date      => TRUNC
                                                                                (SYSDATE
                                                                                ),
                                                p_output                  => v_bon_calc_mess,
                                                p_process_st              => v_bon_calc_st
                                               );
                     END LOOP;

                     SELECT SUM (bonus_amt)
                       INTO v_bonus_amt
                       FROM (SELECT b.bonus_amt
                               FROM ins_policy_bonus b
                              WHERE pgid = p_pgid
                                AND b.bonus_cd IN ('01', '02')
                                AND NOT EXISTS (
                                       SELECT 1
                                         FROM clm_adjust_bonus p
                                        WHERE p.pgid = b.pgid
                                          AND p.bonus_yr = b.bonus_receiving_yr)
                             UNION
                             SELECT MAX (b.bonus_amt) bonus_amt
                               FROM ins_policy_bonus b
                              WHERE pgid = p_pgid
                                AND b.bonus_cd IN ('03')
                                AND NOT EXISTS (
                                       SELECT 1
                                         FROM clm_adjust_bonus p
                                        WHERE p.pgid = b.pgid
                                          AND p.bonus_yr = b.bonus_receiving_yr));
                  END;

                  pro_pol_surrender_value
                                     (p_pgid                      => p_pgid,
                                      p_surrender_date            => p_last_paid_date,
                                      p_no_anf_loan               => 0,
                                      p_interest_rate             => 0,
                                      p_bonus_amt                 => v_bonus_amt,
                                      p_surrender_value           => v_surrender_value,
                                      --With bonus amount
                                      p_surr_val_without_bon      => v_surr_val_without_bon,
                                      --Without bonus amount
                                      p_payble_bonus              => v_payble_bonus,
                                      --Payble bonus amount
                                      p_surr_val_with_stage       => v_surr_val_with_stage,
                                      p_message                   => v_sur_message,
                                      p_error                     => v_sur_error,
                                      p_surrender_factor          => v_surrender_factor,
                                      p_paidup_factor             => v_paidup_factor,
                                      p_bonus_factor              => v_bonus_factor,
                                      p_commutation_factor        => v_commutation_factor
                                     );*/ ---Need to consider later

         --=============================--
         BEGIN
            SELECT policy_tp_cd
              INTO v_policy_group
              FROM ins_policy_type
             WHERE policy_tp_cd = (SELECT policy_tp_cd
                                     FROM ins_product
                                    WHERE product_cd = p_product_cd);
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               RETURN (0);
         END;

         IF v_policy_group = '02'
         THEN
            v_paidup_value :=
                 ROUND ((p_installment_premium * v_premium_paid_year), 2)
               + NVL (v_bonus_amt, 0);
         ELSE
            v_paidup_value :=
                 ROUND ((  (p_sum_assured * v_premium_paid_year)
                         / p_policy_installment
                        ),
                        2
                       )
               + NVL (v_bonus_amt, 0);
         END IF;

         BEGIN
            SELECT surrender_rate, cal_para
              INTO v_surrender_rate, v_cal_para
              FROM sur_sur_factor
             WHERE p_age BETWEEN entry_age_fr AND entry_age_to
               AND product_cd = p_product_cd
               AND policy_term = p_term
               AND running_age =
                      DECODE (running_age_type,
                              '1', ROUND(v_premium_paid_year),
                              '2', ROUND(v_premium_paid_year) * 12,
                              '3', ROUND(v_premium_paid_year) * 365
                             );
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               RETURN (0);
            WHEN OTHERS
            THEN
               RETURN (0);
         END;

         v_surrender_value :=
            ROUND (  (ROUND (v_surrender_rate, 6) / ROUND (v_cal_para, 2))
                   * v_paidup_value,
                   2
                  );
         RETURN ROUND (v_surrender_value);
      ELSE
         RETURN (0);
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         --raise_application_error( -20001, 'Invalid code or Id' );
         RETURN (0);
      WHEN OTHERS
      THEN
         RETURN (0);
   END;
END fun_drop_sum_value;
/


--
-- FUN_EL_MTR  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_el_mtr wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
26f 1c2
jTvQ07Yv3aBrgx08+ro1pv2pbE0wgxAJLdxqfC8B/+porPFa6VFfoqQJwSVU8v+NEEiYQqy9
BC9+czDPYbo5aSDjjf4ZVe0fF9IaVP2ssbvQpZtvGZ0iaym/b8woDr3L7VxeIE+DnqZWwsSd
VGOQDpe6F1Z2H0L6aVYHgsU5QkACecpe56mz7ER6mMgzVlp28bQnMrN2SaDn9CizhTkYY+LT
lah2H60YKBE80HlJ286cL8lt2i4VEwAJIeywR9SK2bzzky5sN4kb394MK9QVt8lSbM3+kTAh
QUC5JUGx+epy/Q5qdPBaK2mEVRU6bh3bA4c93jklyIpdMsTGrZ0yfpa2sdURyRqkroje7vs8
eRNbJjFXNItixJwBTAJJAhK+ksWqIOFlOH2+KD4TDnaz0y0ht0/BuYNwUd1FuvK93yMY/tUk
Nb/+HSQ/X+Y=
/


--
-- FUN_EMP_DEGREE_CODE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_emp_degree_code wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e4 14c
mR9yGMq3Aj2uaHVwPxbSd0g+fKkwgxDIJCisfC+VkPg+SH83la+NV3czNtMRoWLnXls73Pn0
9Jqabzao09pV7Rn4TPifY3B7jeH/ZBMtsQetMdnro8c0T1Y2Nqae1kI4BomYq9ON+N+3slE1
h2X81wpy2wl4RPFQmI78Cb1NTeC9XPbm/oc7dMZUrdWGLFSxZDm+6aKRbVLFNAvQiGXNGDgV
CqYmUMCeitKQ8To2VZcHNpRKqEs3cGfBoEBwU57aUOSI7qoLzguKLFCAvjrUq2CRdrT+hPOv
7Dizt6TmqXfLd2ApGD9rFgNHNcm9rIBteNCUx0Y=
/


--
-- FUN_EMP_DEGREE_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_emp_degree_name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e6 154
lo3XUnuoJiRxF2haf/hQvudcE0swgxDINdAVyi8C/kdkdW2hEghL6gY3Ai15JcuyY+IA87fp
rqsD+vm1RCe68GDLt1hbux0ZYUne1S645JhXqrxFLKqSgRlMyxcoiB2pPDjrRVEJawclIVLY
gal9aYEJok6Sn+ABB2+THEw5eSDnnxWFCXWuG0VNuW4VFTbVKni0V2QXrahX+BVRUX19S2De
hIJP48Vn6Ssk4YAQ9tLve/qabKtxygmvOcKIVeMAkU4rIqyHZNrkx3QgX+sd6BZ4DNitF/43
YiwGdP7TBfR2LzaDOWlbaxvwkkWLKYPDh2VaCNCqCF71VA==
/


--
-- FUN_EMP_EDU_QUALIFICATION_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.FUN_EMP_EDU_QUALIFICATION_NAME wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
213 171
eef5K1VNtp4IuU9+sar5OJ8eWgEwgxDI7Uhqyo4C2k6Ovybglhx7PJtn7oNgwmRMX+uR5lyM
WpOKbEK1rPSqUWABZ7hXwR3cGbd85aiFEsJUxG8BICQShyZxvbmuVgirqOCmUNxK5qHEQAmx
P7oqgKJPnrlduTAqxm+Til6rLmS9M3Ft8R541NpkuTvb5pgWPb9UtElteqgJMzcCZk99S+Y4
aOBSMJRn994cNzVyMk7jQV1k0yriL6io1hE1seSms8COW1BOLa+1O+5Pj+Spvpd+OyrcMWFL
gYQ+atbdnxvaNjULdk0deAcFYQK8F0tq683B+COIW1N0wX83ODQVQjSysEx7Ok8Z5mUQOkTo
7jdL
/


--
-- FUN_EMP_TARGET  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_emp_target wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
7b2 2e6
7G/ri1sVal7t5caAx4NT/SsQp+Qwgztcr0oTfC/NWGR1DESgIXnAcYkdN6jKN6RYob/HwjNL
zSZcXHm1nd9htuBZn+o7lqiCcobBeHKfEJFsDW6vxCQkQ+vQD5s6CP7+sBdaZqZXWooowJor
DoDvI3OdhknbjS40sOv7gtY7uBH+wtjJVJx1rFvFNvoYIVPFhQL3XN8RFczlhuEpFgRLC52E
85TWShCkvibFEhST0slKNWfCGZFLocfW79zpv/B0hnRRwV/s+0h3gleqW7GTqu/f2j2FSgEm
mxEH+KdCgrthtjtOWhcFIyXln6bUocy7exZUKnlf3CZLQeaySgI9BEtqCV4yU4XM9ogICpVy
WKOlGYa5wP6ynsOdSnIzFXmONT6M5/0GwXMu3lDlSJVnmxTYdZM2sYSljMXxddz6pCUAZtZG
KyuB0Ev/w4ixayGQXFMUHT5eAeKsIBoxw3KE2TqVlQC1Vn15NWe8i0CdYmtiGnfQeC2dGGFE
O+GynvtJFz0+EMxyjasx7DMiiTBQePL16Ojc0Zz8L47CPPAD9PQdmjxzteCpBRznMY8u3DAC
iIdDB/2nMDGUlogLpFungrIAD4gFUCm1eNZ8EvbXSKWYO0yovXGDTxA1Xpn5pvSD/Zy54itP
AV5NKP7skS/+EG7oH5JPrM5CeMm2jWRH1XAPFKqZQvUBtbP4cYhMX6482wg37WqcaBucbdUp
GXNEKRVqMw==
/


--
-- FUN_EMP_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_emp_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b8 134
x0BNgYPHXnJCvT6OnzXb2APG0AUwgzJp2ssVfHQB/z40yo0CNw3g5yYM1Q3clHEOt0m0Z3R8
uBLTFszZSQx+ndA7nMSRU6A2xgWTy7BtcbucHRSepmGsMu9oKhYbTgCO4suMl5/jTvvfsp3s
RPCESKSvK9peEcRpI7aQNNhg4O5gTRy+7dQZC/mhEnuwJwIe8azMVuQFcAJAEAg+/FKp8bT5
aByIvgOq3EJen0R75KMGTlRKTqHWpv45E8joGODhwvHePPEFp8IccCjb76mD5SMp+vh04Fm8
rk9jxUsbKExquFs=
/


--
-- FUN_FA_EMP_TYPE_EMP_GID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_fa_emp_type_emp_gid (
   p_agent_id      IN hrm_agent.agent_id%TYPE,
   p_emp_type_cd   IN hrm_emp_type.emp_type_cd%TYPE
)
   RETURN NUMBER
IS
   v_dev_emp_gid        hrm_employee.emp_gid%TYPE;
   v_emp_gid            hrm_employee.emp_gid%TYPE;
   v_emp_type_emp_gid   hrm_employee.emp_gid%TYPE;
   v_emp_type_cd        hrm_emp_type.emp_type_cd%TYPE;
BEGIN
   SELECT   dev_emp_gid
     INTO   v_dev_emp_gid
     FROM   hrm_agent
    WHERE   agent_id = p_agent_id;

   IF v_dev_emp_gid IS NOT NULL
   THEN
      v_emp_gid := v_dev_emp_gid;
      
      SELECT   e.emp_type_cd
      INTO   v_emp_type_cd
      FROM   hrm_employee e
     WHERE   e.emp_gid = v_emp_gid;
     
      /*IF v_emp_type_cd IN ('06', '07') AND p_emp_type_cd IN ('06', '07')
         THEN
            v_emp_type_emp_gid := v_emp_gid;
      END IF;*/
      
      IF v_emp_type_cd ='06' AND p_emp_type_cd ='06'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
      ELSIF v_emp_type_cd = '07' AND p_emp_type_cd ='07'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
      END IF;
      
      FOR k
      IN (SELECT   t.emp_type_cd
            FROM   hrm_emp_type t
           WHERE   employment_tp_cd = '02'
                   AND t.emp_type_cd IN ('06', '07', '14', '15', '16')
            order by to_number(t.emp_type_cd))
      LOOP
         BEGIN
            SELECT   s.h_employee_gid
              INTO   v_emp_gid
              FROM   hrm_employee_setup s
             WHERE   s.employee_gid = v_emp_gid;
                     
            SELECT   e.emp_type_cd
              INTO   v_emp_type_cd
              FROM   hrm_employee e
             WHERE   e.emp_gid = v_emp_gid;
         EXCEPTION
            WHEN OTHERS
            THEN
               v_emp_gid := NULL;
               EXIT;
         END;

         IF v_emp_type_cd = '06' AND p_emp_type_cd = '06'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
            EXIT;
         ELSIF v_emp_type_cd = '07' AND p_emp_type_cd = '07'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
            EXIT;
         ELSIF v_emp_type_cd = '14' AND p_emp_type_cd = '14'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
            EXIT;
         ELSIF v_emp_type_cd = '15' AND p_emp_type_cd = '15'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
            EXIT;
         ELSIF v_emp_type_cd = '16' AND p_emp_type_cd = '16'
         THEN
            v_emp_type_emp_gid := v_emp_gid;
            EXIT;
         END IF;
      END LOOP;
   END IF;

   RETURN v_emp_type_emp_gid;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END;
/


--
-- FUN_FIND_ACCOUNTS_OFF  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_accounts_off wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
627 268
PP8jjibumsM7Bk0N4qg/SdwsfpMwg43DLUgVfC/NimRTY+GnGHzTfzbGSGZE/a3LUPrlTWYy
N2tDtfYH298bvdJvR1UAmpi/wVAYOFjHOYFDGvy765ySehxynOu70HuxKlnzpoqOsMPujrli
F82otv23jQubn3OzOmSbCwzJizk1kWwEitM3A6JWaQlRIvYnvZviOtKcdtjT/X6sLfEaiaLS
fEQreTx7ZUxHcL6sQtbdWcv+Mw7sJndAtdYqldo1ExKe/8SjBH3ESjJ3LYf2QnWvMdZh8Y42
DN004CVdZngs+gBM2E+evAhXn/kQYDb7DAQrP5xvdLmJS3dxIPzFwIUMJqi3EdOM32yw+cMr
LzdH58fOn3/oh1iTaEChzEClQqaaF0I12Kx7uebU9M9sO2BZnocWBRSeeKPVizNm4zlFJglO
nWKC4muUi69o1LB4e2qob9YANc61s2lP/Tv9at2fHhBKBnyduufGn58TTtsrcXldENEQKrkW
X8+OIchc6fN8JcBDd06IBykF0cIMyltZYYsSbYp1BHziJaIbGCeV6zdbJYyA1kN7TImurCH3
Hi/4T5DuodXoEf8JPdFn3hUI2Sw9Ni5b
/


--
-- FUN_FIND_COST_CENTER_OFF  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_cost_center_off wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
725 2f6
+nJTj2voCmsh9iU3N+UA9g3h4mAwg5BcLiCGyi9Vgp3g0ffx2eUpLSvLyxyxWv9w+9yDtgdI
781sjYO5tQ9LpN3/sJeorFju18YSVwEMaOehS7W/S/idByQzzYYeBbztLLyaJM3GPyjHOaa6
1dklmxV5RL5Pbse64ztMCm4wAU8emv+WV0XIWEJ5yGLkYgLoXDYFcQjF6tBWsRmXumNj4bmo
c5P1K8QhPIUuxLIR1goPY/H9TXfUy0jNpROorAxmqhJznvDTHA/xzMJh+54rSUuDXZfd3HWe
JUsLxIgeEsEJE1ep6xnaJIBlTUW5gt9GiHf/PMFRnwOf+DqG4dFksJR69cStbIhzMU/J8rnh
vMYc7B5mBnEbcXEMb9oywaOX1FKU5MYYnMTVh4YDytDz36Y3RTfq0bplHGJXNohYR/TwMCKI
x7i7xcPn+lC2lw7BR9acPkTVVMufXqjpXAKD4VTlU+Ld87V+xcbZAYeWIXeImvrPid73svtU
9nQtwjX8lcgtFNBNf1DB5/TRIHadqCE0GNAgJfaJTKNPlgbpBJpyyM9gJYlKct606eVktj/B
epZfIW+kjU8tgqOksSOhysGR0wcpSYohnXqhuBQIcSptUqAL9ezk7smb0u0kVTH1m5RS6k07
HqGow1N/FN8gpUzooJujJ3b20b4Hlnb9tSgV4TU2FHn3E2if0zjBI0X2o6Sn9R+N+ajnHJQj
73d4w2GRDDUCLnc9KnMeJGWg8do=
/


--
-- FUN_FIND_COST_CENTER_OFF1  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_cost_center_off1 wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
451 254
nlxXcB+xENvrOLhgQs0OumEn0IYwgwK3LiAFfHRAvzNkj2xnwIjsHPagqYReDaYHZRR7k657
9bJLDJ5+zbVkka1hg3sEKDnX0LFd7wyBX1Gyailziq6q/51zTh6deLXkwD8SOh4PrrBi2Jmm
VzCMicZ7U+xqjObSDSLOkDsE/bW0+XRC8I7yK5t3zC30TKcaxHQHl+BeMQVRwH8Y7TLU4WD6
zuIHEXyAYmt0uRrf6PE+9jNQtO0s69F9vwtEq4u07RKs//xNIFTY3nMURP6akZDDK49NYzc0
isJ5kxpiUChqSl50+ZfsC3GgWfVQVwhaVpEfKZE6PXdv2UZx/L3Ucz8f5IHNOeIFVQBoiZVK
HCofgoIhAJnYxBOgdcl/WM9/6/jfg8ja35G9m2y85lDFLP77SOBpqwb3XRc2v0IShQkeEVYh
pFLmdUbWDdT1Tq3V036LnQugOIwpFOg8TXMMDHFww0wt85QRd0LXZWxT/575gFYx08TehTry
XYxWrFmn7jThMszau+N8wudSpCIwvdvEhSOrW7qGfcAEk0Kfv7FPybSJ6djMABJjvv9ezJG6
+c6m406mkw==
/


--
-- FUN_FIND_HEAD_OFF  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_head_off wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
57e 250
KDY6RccgBiVVwdDfYKChInAGHoQwg43DmEgVfI7NimSlCTWnGHzTfwTGG6cVKsB2EUkK0/CD
AtxztYNCV9xaCT3Tj2jBvsFo3QwOo1rdPXJVww/+EzrkMJ1Yu+UV9kZ/vAT6vmsm7Z5LD1h7
rW0OimM6LbwXc5/JFsDuGCkJ+7wv6YJRYeOO/xgVhkHNxo092FBZMVt0QylwIB55Riz/SNB4
9AxrDhIhTlr8VOpFMpaV30OYqB5HcZcDlZrfu6mVA93LihbdbJJtAETZiD11l9OgDGBMSqZi
1jHtkNVCnnCfM/bUjmocghkoOe/IPA0Ws8bUmIPbCjYNMawHVrtSaIMy1N14uRS6WwKMGjID
NAQfMVlvvslmF0FFIuVDtgKgQkhn1Vj9JHarwrqCPQwim0rOZQKQ4LTJWNquJSwjYgphTVV2
GHDwtS+4k9Q+pCOXkMufNYaRiorSuTiianVEs8G6QPa+mRfPfSxfIB1rR07MEtn0jzfXiGii
Pz74pjPyMTFzEKiu33DIG2zsBEiVWUnEMjesRayg7uXO6uVEPYXfc3utRzQ2akQaGwsUMuJd
KR/xnJbL
/


--
-- FUN_FIND_REGIONAL_OFF  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_regional_off wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
627 26c
0+OjYnA2LWyqn8oFGIgbRTnAFcEwg43Dr0gVfHRVvg/u2TZxG5f3GIRatyoJoWns4drpt2Hc
WrZatzO1DPITQFBviwxeBZY/Qp/mDEqUtnblmrfiSrAoc046MnpPGZ2BvuVwq/vd3JnyKtzu
PAQgb1hotFZA+tlDC5tPPQWnR4rL8U0JwLSo9IIUH/PFUSIK9qGbJ87SnHbY8VRWFVTVCRZm
EnXhlnj2tljRyUtxrzRgcOJAcp+w7Dt3RrXWDZW6NR4QwKhhYAR9xKcyaMKH/UJTlb4CLaxd
NtXdUV2Xi2BMqoml9VI/xZXUhrSS/oj3NnY4VDqw9XB9K+OwnxK66rcd1Yk3WQah0yo+X5JM
kzV0xe80anjWf4GXR/EbWZtmRnIdziILrVKe7DAfwv+F6iXe242Ovp8HXxX03xgyx/OiHVX1
OM4PnIixUL3HsCCGVf3N7i9tr4I1zqpkJtANYfZq3fUTQkq3fJ2k40rNinvBNyZTtIVzcZIn
aGkEQo50yJxCHHxlwH/8OthqQQWywJxny3V+zRL9vt9Sj+awWqgu8AYp3UQps4zUnrfRbVs1
QIVj9HOx/5sabLGJCKBCQMwQzPGwJCMQWSk=
/


--
-- FUN_FIND_SALES_OFF  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_sales_off wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
5fe 260
oljyH9xRD2k5ELcWqLkxzfUpBwEwg43DACAVfC/Nbg9SDESTxWeQ4wRfC7da1GBhHc2RXCfv
XOV9qZK19sFqf97TTR9RmBK8v7uQa0TGex92l08DPiRyu4ubM4FSf5oBvU7npkpgaSe4nqqu
/xPQWblMXEr6XnMLHiyBHjfbuTmh9aitdvfbiPEK5yZ9/MMuFDGTb2rtYGSudjw1IczshfsY
3W1zPMmLCgQ8/VTD50eBzml4Rb7cLpIkVLE0XMJFB71SSxjdpd6Tlro8utUov1e1ONBmX3Cy
VI5xmINNgmBtZx8ssAmKHUp55Inzod22QC5XY1sdBt4yPmAj6pzXb3IDFCfFwKujLTdsfV+l
yxnYr3pT2tzsITjlKA/Sj7BWF9vZyU5Ml0SMaSKWdLEJfIZJbZL49gH8p2uczfQBiUOqVcmj
V5ZHsgPoYhMhSF+VfVnEejRy+tyB97Jh2phZkoE7taS+zkWLSmxNctv9cQdqtWt8CKViyB9f
gQSTDcCr23Hd183+YdXKlnV2aCTeXUzu3QKh92BAo7Hr9/58DoAClGFx5do1p1p5BqXVx3re
r7LXQieO4KK+cZulmT5CYPg=
/


--
-- FUN_FIND_SALES_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_sales_office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1080 3bd
gSIZN1xSW6/+H57xa5+ydI1/T9Ywg9fqzPYFfC8ZAz+V7XTT52uIEuwTN/yF8K+NrFa/oYfb
tKsWX7lrirWunFfCilpKydA7I/RWVZC5mOsQsJGUrlzRV3Y/7X1qTtm/c5KBxusK+UJXeqoS
rL37qYBiwlmw1YLXrdhDHT/BPhNPP0f/Eg0FfGXpOPrDbK16CVjiJuRnEfQK28tO98A9VHrQ
DjE2XI7VXO2ka+FPpzwpjCOo29QwNjuvCgfaGzjCdVHk18xLYdZgIUH6kcdK3CZFT09J8BK/
iiLBTX5J57T+x46pUta0k/qep8VfsB6OUpHH4kYfidWJoQhQnhvjk5llGkrOnCq3deHuQb3Z
YShnOvwUUvIYMb/TdXeLtN8B/TQS2w3/N5ntURj8WcNoN4xHQR7Eluob0DTFGBoLzARMk0pl
lc7FNy0mCnlDiN2aRUQcck4lRmmk7SBn4GCJUMHaqibfArrOWs8ICNf8xU+PqF79jFF2mfBX
Tj8Rf+On6vM9V8/ETjs3OuRbKYihIeKG6KybrJM5KqIxg5UyJcwsUnu+ccIhxHnnATmYL8Ex
zLcP637J6uNQSt/vQVe4eO8ASNpdvruUblQh9UGe4hoW9YS3n2CSjPU1MUUh/jAdoA+7R1Uh
20detPEc7XkMICTQwB8gM+LrVjO5vyU9M9JEsY1w1kuGrBnNuIccnDsVpMztY81cxPrkSb9g
IcUlDSpupqEsPNEIlTNLGbjL0j39u31h0+7qfXTZTRv3bWeDHrl3Rv9JeEvM990j9R8YarkO
NL0O9ZozYIpia+2kSp/zB9/D0uhf143c1AZ2+RgII5o+4FZwqISB/Q+YsRUrsTXju0A25W0v
1w79SnP3rvmDUJ1CgN8tvJslzeSwiARF1CLek09T0PSGfwSirFsBlLGT/+pFGkTVctDNv537
FpIoGA==
/


--
-- FUN_FIND_SERVICE_OFF  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_service_off wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
5c6 274
NPi/19qX6dsaGu/RGKHdCzY3Z0kwg43DLiCsZy/NQqqVh6uo3quBFgip2eLIj9iTb3muEhEq
COC33827u1YVwmnd9csYTjqL7TXM4etYNiP5vOxOQ5JIvNxPJJzEtzpXT95nFmNb7wJ8Vq/G
dKXvXNoe+gSqvBA4isydua29eUUGRcNnKC3g3tinFNFaxuVKGCBSEQUwoBeRTnnsiwKLGDw5
Q0jWnawBWrW0Jy7BXIgdVdxNfiNfpMwHu0Oa1CFHwz2+iRJxgx0lqXFfrGjKsnBtVR2jr8f/
IQHCNnltoV63N6ccH/+WiWhCaf21f0MYXgcT4tqZ1MjD7VTYxN8YJTkDOuAzohdOQ1ZfWlUb
tiJz9kVNc3tDjy8hUVsZRnzlanqWki6L1i5K3qfHxgsTXLcMz/l2oQ6NR/AF8fXe4hb2uw4f
zfMXnmhR2snsooAlpO7oQxOOUnQCvwUQbLGNrAB+C2XLKVAJSDLdDEyic3CMv5nviotZ4yIi
JZ1yjZ2GTzoZknXnAUH+1O9JWKXPPDh4wIAxG6Uf1P4zJMhXwjesIaHYC+9pR5Glo0kWTXta
WeqVnfLzdy5h7rH64G9sBPc1rMTlyzOrfKsA5OFXxjX7
/


--
-- FUN_FIND_ZONAL_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_zonal_office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
5f1 260
BBxDZJZI2VPKHF4Q1URY9prNWLEwg/DDACAVfC/NR2SlCfsMRPXv4HxKLlYCgsB2EZhUXAVa
WpRZTJIe9knbUlpud4Qi/7v/uxlVWENnjh+pGE9t0f+crnMS7TSqHvbMbiS8yYBiBOsUYHZp
Zv4z0LaSw+1fc8ztHH3PrEfxw0PTUPMM8XC+5lfV17aqjTn4S8yU146N5zW8mgmtutezI9Zv
zL6uZz1JB3I7Dt9HeSR0DWseccXEw+PW7ick9jnZ7K+nuVeJTYvZ4l/oiRaiosuXDpCQ1tM7
GmjLt+DQ5I5o/z5r8acilC6gCIJSfHRSOx+vJ+r7sG3B3nfjkwlwvOj9oPXaxWsuOS5ryRne
ToX7EexVB6NGhJDTQQlJYyg7bEiIo6us8WY90bXLpRsn672kooBxkFh3RYDLDKQNpTi8vyos
ZHMwKHQvdloSGmysWEa6FFQPnfFhFcl6p8yWBjzDss1CH3i0uox25K0P+OGBtpsgLx0Hei4S
BIg+rfYFO9eLHtdGB1GWRhyKAq0IGFvnRkotFexY3/TW77EK3CmWX21H+bsRFuk9MoPa16d/
2TWCyy0/tqkeNW0c+aZhcyRF
/


--
-- FUN_FIRST_PREMIUM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_first_premium wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
489 20f
itjv+WHM9mmnEeXGTlpOcNHuyj8wg5C3LiDWfHRAv4vqziu0TTbDgzg9G2Pb2Pfdw6gpoF7c
CneEsCa6tbXxp+Fj9eZOqBiKxizAGZHsCWzyrNfu635h+LssTg21tHko2qUAplQTblyX2HWP
QIICaRPKEleAtLA2Mf2NYulFVA7YvpQSeOn6sxp2o9rA9hvrbLehLkV7VnKZFLpU4Kj1f1Sz
nx7LnwsiFCKpKokfV1lRJfH8m0FN/9YaATdAlGMbPfVbJErmWuEwI0ARP2a+1G0buSL+o7qP
CsoHGH64AZYvmE2jBvfCKzhKJuHUvlWrJgFEP7Xp5ihIBY7PSiZVxNkeivlyGkouUTDT5m5f
wbbZJErGF29P8JWGUnGPc3jPqr4ZTphZqLyQd2A2JsKMrNRP+sKm4pM/ib2LPa13zF9czLU4
riFSCm/VZk1c65FWae2oCcFbfNlh8r+IpGyBMs9+MCkjBPkysV4PXBjiyTud8ZrW1r7BTVm3
+kbYgxy/nWGhCII=
/


--
-- FUN_GEN_QUES_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_gen_ques_tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b1 160
QmpLvv3ifMJHDldfyJrhYQVU48wwgzJpLq5qfHRDbg/umaNJssOfkFdGd1VmO9xS67Lcb1FE
qGtKZAj4oXAegx2toi1PmhJC//ZlGXussBBJcnlJu/gzXrwZysymS/cFq9UIY3VWiacVDaJ7
n5aufb6dlswu7/SzsVlLs34r7MHy6gs+xfnMawbqAWtIuN4+8ZKAV5TiszBXsiySCLoZ8NIS
FBfqdDtK3Z8CX3yFnwAYRePHMBdLXwrMAAepbpGD9vpMLjH7pft9pDcNO2n1k+I7s/fRhYoE
8W1C7OjqgnW0ufjugWM3xkzrFbkdfoJY+a0JuBx+fIjJnu/zJPj7N2ZIkA==
/


--
-- FUN_GET_MOBILE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_get_mobile(p_pgid IN VARCHAR2)
   RETURN VARCHAR2
IS
   v_mobile_no   ins_p_address.mobile_no%TYPE;
   v_assure_tp   VARCHAR (100);
   v_sl_no       VARCHAR (100);
BEGIN
   BEGIN
      SELECT s.ASSURANCE_TYPE
        INTO v_assure_tp
        FROM ins_p_proposal s--, ins_product p
       WHERE pgid = p_pgid;-- AND p.product_cd = s.product_cd;

      BEGIN
         /*SELECT SUBSTR (TRIM (party_id), -1)
           INTO v_sl_no
           FROM ins_p_address
          WHERE pgid = p_pgid;*/

         IF v_assure_tp in ( '1','2')
         THEN
            SELECT mobile_no
              INTO v_mobile_no
              FROM ins_p_address
             WHERE pgid = p_pgid AND party_cd = '03';
         ELSIF v_assure_tp = '3' 
         THEN
            SELECT mobile_no
              INTO v_mobile_no
              FROM ins_p_address
             WHERE pgid = p_pgid AND party_cd = '02';
         ELSE
            v_mobile_no := NULL;
         END IF;

         RETURN v_mobile_no;
      EXCEPTION
         WHEN OTHERS
         THEN
            v_mobile_no := NULL;
            RETURN v_mobile_no;
      END;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_mobile_no := NULL;
         RETURN v_mobile_no;
   END;
EXCEPTION
   WHEN OTHERS
   THEN
      v_mobile_no := NULL;
      RETURN v_mobile_no;
END;
/


--
-- FUN_GET_PRVCD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_get_prvcd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
bd2 487
0bMBPlMCAa0iJ4STiJcGwU3RSvgwgzsrDNAFyi+5MZ2sDA1KjpOY1YEld9XzWdMU/XHdGdf6
B7xIXFwNc3OkdIvzJEUHwPSClosTOgRXMm4RG1eSkvj4pc3ZZO7GciRPIox6hOcNhBLJlBhv
hiemJo47aVPRX5I7vGH1u0cIlCz2e7g416FVdBrU2AjsgkPpSxgQCoZQPsVzKwCnXaxDC2GC
I6EySUIvZQEaWA/UOMpxjJEI4q3mheRVuXBio70rf2a37okoSPtUIHDwKwvA/yi25rrwrWvW
GixJJPojK+uCYtjsezKKTUXJ3fIy8StSRDVoaUJiZjKKRELDpLOoPbPZnm0OX0zbKdtw+Ka5
Zv1JVjTRV1MQG13w3JkzpVOqRuyI1SWhbBo6fz0D20vX3PFohbi7TCUU6oJ0y946YfYXbmDi
VEjdCaDo28oeTAz+pT2PnFd+b1O48VE1ENsxJp1NKCtyH8U+/IOnlzSWdt6/h0x7jcFO0YOm
OIfXgnWJrgGeMLl9tNlXl6Qh1fpQi6tSbEZVn0svUrCWHa9hnWxFmKpTEzg3nkanZUTSJvYh
mcuKoYpTSbMlmy4dxvrBLKak292wNa9TEcTfs1Qn0kfSbH7hykIPjHpRKSIRv/2z449oXc80
5oR1rVas9j78qErtHN7T55OvMdbKYetF6ZRckTcD59XAhUrSRzBvxWCiW06WsEob0cWGo7Sz
dTvIOA4ubVZsZsATZ0FVQxSZoGFqN5BotGKz7TpklonaIUjg/fJftgc8JwaQ+Aim8dTQfJs2
HaOiwAy5Ez5BVdN7RW6XXeJ7V16S4OhXaAKTivr3psMJRDg2wIjl9JXVumtTWq5hWtE27DVP
T8kHQuLO0EuMSjZW60Ecrn2H4D/rhCgCXqSa0T5DScP2IyhIM59aiofQIGsD1e1MfdHyq9qB
n2tvAz/lfRtoaiRXeADvX0/XcARE2esZvwBX/ghp/LHi9C24+mL0d18vJ89hMeCvB7AmAcVf
3Xre1xxVu3THwQKhD3i72aBjBwJFZ0Nw0JUGkHB+Zcd4zgfU9pkvsvSj4/X80ICW/5uE9LTU
tnAtc+tYcOkjGyt8iDehFNNiKOP6eZJZVCNq/w2vJ8+upAcDay49yr54qvsaKlFW
/


--
-- FUN_GL_CPF_SUBR_HEAD_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_gl_cpf_subr_head_opening wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
7c1 32b
Vl5ElgHVjfQTlW12zhRdzFtazLwwgztcLiBufC/NWA9/eGcB6hN2A2vxLdfRlLSFBOxB2D8U
3mMn/Q2XYiS830uHtkdh9HtJEovXMDA/C5unOJO4Ob/QWzK1hBBCU16dLCS1CZpIJBBcJCxI
KJoo/i9EpmkKTPRLJ/KVUxnmBzYZ71JYdDVBwUTonralNn8gGhWJocWLNawUXL6PXE/enwsO
cPDxgS0aob3gtvPDYaz79gpfGKYq1LE+h14rS5CXab3Wsqbj0d+9cdS4jRXJ2nC/Y+VEzXRv
f1ly4NAy9HbZM2JI1l+5nsnKn2s7a2yV01Tq5sNr/eNu4vUCV71wyfH+jmeOSNEru/O6AhzI
DbBJt3CFqYXJexTUvUbmun0A2aNaheUGfj2EcqaGj18KcPGuBML3+XtSkJjE4HUi4SKKJg6P
58WQ/Jl/4UnpY+K8YTcH9j7Ib5nlkeETlfn1KLUKr7bVF3sQOewWNe9MBiM7s/1Z9oLwN803
+5xFt8nSfSraXJAnGfKnwvfv0HyBUTvKZiHVGmvVQD2Pr6zxs0NozlqPA1JSpgDws1R2O642
YhjQaUf0p1ajtmtLUCeVOFFeSXjnsJ+HaeMwnjGWgYktq1CaeJHzk+Hy6Lzl98iTLIvnpTQ8
ypx+c+ps3aK2MYMQiOspDL6JXSU0Ftne8ok72hkG7fMZmHckwvn5foMN+AmWbJXZAJhHV3pi
SXRJ/k91MdckwKyQzS2wkI95sjGAF03NXmW173FjHMEFKYXtwBHtgNeXHAcw5DHXJWE3NzQ6
HaRjmJc=
/


--
-- FUN_GL_HEAD_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_gl_head_opening (
   p_glac_sl_no         VARCHAR2,
   p_office_cd          VARCHAR2,
   p_cost_center        VARCHAR2,
   p_desc_cost_center   VARCHAR2,
   p_date_from          DATE,
   p_ins_tp_cd          CHAR
)
   RETURN NUMBER
AS
   v_opening_bal       NUMBER (20, 2) := 0;
   v_gl_prev_balance   NUMBER (20, 2) := 0;
   v_opening_dt        DATE;
   v_divert_account    VARCHAR2 (20)  := NULL;
   v_glac_sl_no        VARCHAR2 (20)  := NULL;
   v_sub_reg_count     NUMBER (3)     := 0;
   v_sub_reg_st        CHAR (1)       := '0';
--Here 1 means subsidiarry register's Leadger
BEGIN
   --Checking the  subsidiary register account
   BEGIN
      SELECT COUNT (1)
        INTO v_sub_reg_count
        FROM acc_cash_book_divert
       WHERE glac_sl_no = p_glac_sl_no;

      IF v_sub_reg_count > 0
      THEN
         v_sub_reg_st := '1';
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_sub_reg_st := '0';
   END;

   --Checking the divert account instead of paybale account
   BEGIN
      SELECT glac_sl_no
        INTO v_divert_account
        FROM acc_cash_book_divert
       WHERE divert_to_glac_sl_no = p_glac_sl_no;

      v_glac_sl_no := v_divert_account;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_divert_account := NULL;
         v_glac_sl_no := p_glac_sl_no;
   END;

   BEGIN
      v_opening_dt :=
         TO_DATE ('01-JAN-' || TO_CHAR (TO_DATE (p_date_from), 'RRRR'),
                  'DD-MON-RRRR'
                 );

      /*SELECT NVL (MAX (o.opening_bal_dt),
                  TO_DATE ('01-JAN-'
                           || TO_CHAR (TO_DATE (p_date_from), 'RRRR'),
                           'DD-MON-RRRR'
                          )
                 )
        INTO v_opening_dt
        FROM acc_opening_balance o, acc_gl_coa c
       WHERE o.glac_sl_no = p_glac_sl_no
         AND (   (p_cost_center IS NULL AND 1 = 1)
              OR (    p_cost_center IS NOT NULL
                  AND EXISTS (
                         SELECT 1
                           FROM (SELECT p_cost_center office_cd
                                   FROM DUAL
                                  WHERE p_desc_cost_center = '0'
                                 UNION
                                 SELECT     office_cd
                                       FROM hrm_office_setup
                                      WHERE p_desc_cost_center = '1'
                                 CONNECT BY PRIOR office_cd =
                                                             control_office_cd
                                 START WITH office_cd = p_cost_center) y
                          WHERE office_cd = o.office_cd)
                 )
             )
         AND c.glac_type IN ('L', 'A')
         AND o.glac_sl_no = c.glac_sl_no
         AND o.ins_tp_cd = NVL (p_ins_tp_cd, o.ins_tp_cd);*/
      SELECT   NVL (SUM (DECODE (o.dr_cr, 'D', o.trans_amt, 0)), 0)
             - NVL (SUM (DECODE (o.dr_cr, 'C', o.trans_amt, 0)), 0)
        INTO v_opening_bal
        FROM acc_opening_balance o, acc_gl_coa c
       WHERE o.glac_sl_no = p_glac_sl_no
         AND (   (p_cost_center IS NULL AND 1 = 1)
              OR (    p_cost_center IS NOT NULL
                  AND EXISTS (
                         SELECT 1
                           FROM (SELECT p_cost_center office_cd
                                   FROM DUAL
                                  WHERE p_desc_cost_center = '0'
                                 UNION
                                 SELECT     office_cd
                                       FROM hrm_office_setup
                                      WHERE p_desc_cost_center = '1'
                                 CONNECT BY PRIOR office_cd =
                                                             control_office_cd
                                 START WITH office_cd = p_cost_center) y
                          WHERE office_cd = o.office_cd)
                 )
             )
         AND o.opening_bal_dt = v_opening_dt
         AND c.glac_type IN ('L', 'A')
         AND o.glac_sl_no = c.glac_sl_no
         AND o.ins_tp_cd = NVL (p_ins_tp_cd, o.ins_tp_cd);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_opening_bal := 0;
   END;

   BEGIN
      IF v_opening_dt < p_date_from
      THEN
         SELECT   SUM (debit_amt) - SUM (credit_amt)
             INTO v_gl_prev_balance
             FROM (SELECT a.glac_sl_no glac_sl_no,
                          DECODE (a.dr_cr, 'C', a.trans_amt, 0) credit_amt,
                          DECODE (a.dr_cr, 'D', a.trans_amt, 0) debit_amt
                     FROM acc_gl_trans_dtl a,
                          acc_gl_trans_mst b,
                          (SELECT office_cd
                             FROM hrm_office
                            WHERE NVL (p_desc_cost_center, '0') = '0'
                              AND office_cd = NVL (p_cost_center, office_cd)
                           UNION ALL
                           SELECT     office_cd
                                 FROM hrm_office_setup
                                WHERE NVL (p_desc_cost_center, '0') = '1'
                           START WITH office_cd = p_cost_center
                           CONNECT BY PRIOR office_cd = control_office_cd) o
                    WHERE v_sub_reg_st = '0'
                      AND b.office_cd = p_office_cd
                      AND b.ins_tp_cd = NVL (p_ins_tp_cd, b.ins_tp_cd)
                      AND b.cost_center = o.office_cd
                      AND a.glac_sl_no = v_glac_sl_no
                      AND (    b.vouch_dt >= v_opening_dt
                           AND b.vouch_dt < p_date_from
                          )
                      AND a.office_cd = b.office_cd
                      AND a.vouch_no = b.vouch_no
                      AND NVL (b.ledger_st, '1') = '1'
                      AND NVL (b.payable_st, '0') = '0'
                   UNION ALL
                   SELECT a.glac_sl_no glac_sl_no,
                          DECODE (a.dr_cr, 'D', a.trans_amt, 0) credit_amt,
                          DECODE (a.dr_cr, 'C', a.trans_amt, 0) debit_amt
                     FROM acc_gl_trans_dtl a,
                          acc_gl_trans_mst b,
                          (SELECT office_cd
                             FROM hrm_office
                            WHERE NVL (p_desc_cost_center, '0') = '0'
                              AND office_cd = NVL (p_cost_center, office_cd)
                           UNION ALL
                           SELECT     office_cd
                                 FROM hrm_office_setup
                                WHERE NVL (p_desc_cost_center, '0') = '1'
                           START WITH office_cd = p_cost_center
                           CONNECT BY PRIOR office_cd = control_office_cd) o
                    WHERE v_sub_reg_st = '0'
                      AND b.office_cd = p_office_cd
                      AND b.ins_tp_cd = NVL (p_ins_tp_cd, b.ins_tp_cd)
                      AND b.cost_center = o.office_cd
                      AND a.glac_sl_no = v_glac_sl_no
                      AND (    b.vouch_dt >= v_opening_dt
                           AND b.vouch_dt < p_date_from
                          )
                      AND a.office_cd = b.office_cd
                      AND a.vouch_no = b.vouch_no
                      AND NVL (b.ledger_st, '1') = '1'
                      AND NVL (b.payable_st, '0') = '1'
                   UNION ALL
                   SELECT a.glac_sl_no,
                          DECODE (a.dr_cr, 'C', a.trans_amt, 0) credit_amt,
                          DECODE (a.dr_cr, 'D', a.trans_amt, 0) debit_amt
                     FROM acc_gl_trans_dtl a,
                          acc_gl_trans_mst b,
                          (SELECT office_cd
                             FROM hrm_office
                            WHERE NVL (p_desc_cost_center, '0') = '0'
                              AND office_cd = NVL (p_cost_center, office_cd)
                           UNION ALL
                           SELECT     office_cd
                                 FROM hrm_office_setup
                                WHERE NVL (p_desc_cost_center, '0') = '1'
                           START WITH office_cd = p_cost_center
                           CONNECT BY PRIOR office_cd = control_office_cd) o
                    WHERE v_sub_reg_st = '0'
                      AND b.office_cd = p_office_cd
                      AND b.ins_tp_cd = NVL (p_ins_tp_cd, b.ins_tp_cd)
                      AND b.cost_center = o.office_cd
                      AND a.glac_sl_no = p_glac_sl_no
                      AND (    b.vouch_dt >= v_opening_dt
                           AND b.vouch_dt < p_date_from
                          )
                      AND a.office_cd = b.office_cd
                      AND a.vouch_no = b.vouch_no
                      AND NVL (b.ledger_st, '1') = '1'
                      AND NVL (b.payable_st, '0') = '0'
                      AND (   (    b.vouch_cd = '05'
                               AND b.source_vouch_no NOT LIKE 'JV%'
                              )
                           OR (b.vouch_cd != '05')
                          )
                      AND v_divert_account IS NOT NULL
                   UNION ALL
                   --This part is only subsidiarry register's opening balanace
                   SELECT a.glac_sl_no,
                          DECODE (a.dr_cr, 'C', a.trans_amt, 0) credit_amt,
                          DECODE (a.dr_cr, 'D', a.trans_amt, 0) debit_amt
                     FROM acc_gl_trans_dtl a,
                          acc_gl_trans_mst b,
                          (SELECT office_cd
                             FROM hrm_office
                            WHERE NVL (p_desc_cost_center, '0') = '0'
                              AND office_cd = NVL (p_cost_center, office_cd)
                           UNION ALL
                           SELECT     office_cd
                                 FROM hrm_office_setup
                                WHERE NVL (p_desc_cost_center, '0') = '1'
                           START WITH office_cd = p_cost_center
                           CONNECT BY PRIOR office_cd = control_office_cd) o
                    WHERE v_sub_reg_st = '1'
                      AND b.office_cd = p_office_cd
                      AND b.ins_tp_cd = NVL (p_ins_tp_cd, b.ins_tp_cd)
                      AND b.cost_center = o.office_cd
                      AND a.glac_sl_no = p_glac_sl_no
                      AND (    b.vouch_dt >= v_opening_dt
                           AND b.vouch_dt < p_date_from
                          )
                      AND a.office_cd = b.office_cd
                      AND a.vouch_no = b.vouch_no
                      AND NVL (b.ledger_st, '1') = '1'
                      AND NVL (b.payable_st, '0') = '1')
         GROUP BY glac_sl_no;
      ELSE
         v_gl_prev_balance := 0;
      END IF;

      v_gl_prev_balance := NVL (v_gl_prev_balance, 0) + v_opening_bal;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_gl_prev_balance := v_opening_bal;
   END;

   RETURN v_gl_prev_balance;
END;
/


--
-- FUN_GL_SUBR_HEAD_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_gl_subr_head_opening wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
845 33b
SyrC0F28LiAYRA+oohRKvUMl6KUwgztcLiBufC/NWA9/eGcBsxvGfk2RfrvRlLSFBOxB2Csu
6/I9YSeNuj/PeXDwvcn4rUkSIkEHwcE4mmVWmf+PhoahAM/MJByaqupPuZoQaQ+dVU8iTxzK
nqYOKwfTOD2JGFLtAsu9z6IGe4isz52WfFx1qUnjQu+U6FkJLXTTFCaDmYeBjcl4OZ48FpNP
qC6hLxPjDsKUdFS6Q8M2TX+83Ajswqykw0ryBH5aqX0nE90ydHiIfr+EuWvDDQ6Q+ul0622+
F3FmgLS8lUzI64SvWRhMEfYRoS02PI0vXH3LZrDV8C9J+1ZZm0Hh4xXNPYsq4BNQt5HNKfqO
BGXKwo3L9FLha1BvI3LCb9PCJlcF0iYf04aPrApw8XIEwvf5e/PUuTsE6HK9IErDabg2jdeB
AgQ3ocxYCmRMj+6jnhqVrMVY3Z8NJFVqtSe44EPmsHLxyfJQWNFS7Tx9pOgNQvQ3zTf7nEW3
ydJ9KhNpwezE8WN+XYXvWe0R1ePn15nefRg4gjBLDpH1rXgi086Kvle9APCz50ol9A5cCPMY
rbPx6T7znpk7K3YbRfWf1nwNTltn2x2RnXcdCyoOnSBNZsI2iUcQXO+oxCJH849sPMqcenNj
03Do9HqQyXHfFjGIEvT90LF/aCns17DNo/cSXAolQZyiQoMIbyzwMA8B+Re7u3KnVUXrPzsW
h7sxAbHuI+1wV76122hIP7e2in5yAKQ2IPaFmnvWr0qMj09+3VT5WEhl0E5D5Cm1Q6WlHA2p
ACi3CLCYFgVEG0OVrhQ2R7c=
/


--
-- FUN_GRA_HEAD_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.FUN_GRA_HEAD_OPENING wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19e7 50d
NNwjl9bI9Nhqv5hvy2bQXLn+cZIwg82Tr0iGyi9VA52sANh+CqFd9Q2cyV69HaFoe3A42gVB
zvc/5Kwtf7TbSIy5YeWsd9Y4i9dHC8nK9epewwFfrEwulUGEUsovmSsv7LMA454tcqjTAdEW
HSduyoBbhSAf+zD4FjYFzWWiNhWPAFAv1dU35zvnqlshdNVmn26kgUaSNC8+jGNNnrZjwMUr
Wm7DKrCpPMaJpaanJ7l392IJdcTno6aiHpH7SAu4xET6YNm5x8y4wAnCyGZlPgXuBuVOWQJ3
0QaKojBsyubY6I3XHONItzkHPEJIR3uhfO9MPCaPkZZ0oFKbsIZwSeqrW5QadGP3nre4tjY+
MRfD9AokTqiAocCsiVFhZo1HhwGg4AuAR8CYlcUx81YoZgGKLUOMtzrHynH39pXtRJ9iWnKj
upjM3f7K3h8KHWsQOa37Cqax7uhMbI4MGotteqgJTRh0X9WOfPTb2bFrG6tc5idJctOxgILJ
/y7QDE3288Ubi6H101nUfKCqqH/WdsS3dyCxMv8bswzKAEPKntSyj+dPZ5FcDdjdtLGhFHjl
Zu0EwEb6IzqmKWU2lpbyKx8HzMKrKzSmqJzvX3Ih2C+GQ/ezAe9d8/TWA7YbbJKfBgxb1XE9
dUAxuN9bQEBr2Eb5yLQnSpDcnX2xC7c1uUGJgczTlWt+aqUWvlv6onolhpnh4bXRFmRhty5w
HorGAkM4T9ro1RKCGQbEa2+3IQqrJ68JcsrcuNoBviBTHHa6p1rZMF1Iyoc6g8bh3Vy1lPhe
VXQMIPLTtttLVklTFXHKvvOono2otyLFEmcsmv2vS1tHUMECwsBpJegqUo0dVwEx9yKXt8qQ
0uux3fsz3vU6uXaC1z7rXQFFwk6DRZouk7EYM0N52gOcTId0J9T79MFZg/rrw1A6rKTlYCn8
2yf1aQ2/nYF4aikR8JIg+Og6nk95P2JhwZQNlRt3d89HJipWsApujwDuwAof/KfT1ovCm/JV
4SJqIUmjrbOXoc7U1688F/WGjCbo/OqZR8dyg0knG84AE72SJNddgy7iVZFNzlhF+pLWRfTw
kly5jkGj/qjPVRVi4gLaK/hL9md3x2hGqxudFToaEfpik9ds1Rvgl8XIF9A2RiiwLDh6bWpT
C3OY3yxyuf99Y6jV/QX8Da+M2j32el6xM8e8c9hkzcGDPzRF+RKEHylBA0WmKYJLIDOLfz4E
KO18P6qdBSMbIGjGjZlPFzToYEtVxy74ZAL3gxtpZpr54az9DDk=
/


--
-- FUN_GRA_LEADGER_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_gra_leadger_opening wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
84a 30a
btBIg705QkzkrXcAWe6BNqFKg2Mwgztcr0oTfC/NWGR12RgOwuPXLd7LSgAvw0v3fzGLkTt3
IeXDYz3yc7WD3ayhDhPJsUmGWEKCP4J6SSqwxbZ2vLWtKYZOt/lCMJKfenoeD50osCyw71Z6
phYNWvFfUeh0ioPzocSi0Wo8dYtGJ9GmG19fFnf0jun2oE9MjpSNJY6+5imiQjcN8sMNXd0e
4NYl740ABd5siRsC4RcNHEsw44RUOaXesgjlMtFs/ADTJun0eoYpbk45618FyD8LKwKtCRPj
u8BUwzL7mUDDfEZE8OdjUYvyChAxGUOa2Rc/5+/nb38mJjRmnznw6fLTh5NlSOH0IOeeNP6B
7aqW3M+SyWD5T9DKU8XXXZSW1UBXU6zC+K1Xn5loNMZHPRuhwMxl4tulnHtAi/6ubH/mawXF
bfI180pydZc3gRfDLw4d1IZvbObzsnugn1z6YvC4ybQRISaXO1Y7W/R7/tVRkE0pPF1Ackor
7eGAkHKt29T3gSzBSPDijveMN+jQUopbSz8Nxy6KWiRqQjScOWMJd2x+M4yYRnwrA2B7CNWV
Jby9h64AW2tZHeW524o6aUMO2e2SZhfVckhxLtfTwSaFA5bn+WqQKOaHdpa75PpZkMV4v83D
TCBaSMFVbDsTak5b3TJSSSVZ7JCAxmjLBdI2KlUTWBVcBzdCAtEkH67MrsPZjWuLYIvB9/hv
NHpjp6C8XKdlzlf7S5tg6W5cjxq7cHO0eKgbsQedBlLldQ==
/


--
-- FUN_IDRA_LAPSE_RATIO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_idra_lapse_ratio (p_date_fr         DATE,
                                                 p_date_to         DATE,
                                                 p_coll_date_fr    DATE,
                                                 p_coll_date_to    DATE,
                                                 p_grace_period    NUMBER,
                                                 p_previous_yr     VARCHAR2)
   RETURN tp_lapse_ratio_tab
   PIPELINED
IS
   v_coll_rec         tp_lapse_ratio_rec;
   v_inforce_policy   NUMBER (10);
BEGIN
   SELECT   COUNT (1)
     INTO   v_inforce_policy
     FROM   val_inforce_policy
    WHERE   val_year = p_previous_yr;

   IF v_inforce_policy > 0
   THEN
      FOR i
      IN (  SELECT   ser_off,
                     org_off,
                     def_due_policy,
                     def_due_premium,
                     def_tot_coll_policy,
                     def_full_coll_policy,
                     def_partial_coll_policy,
                     def_full_coll_prem,
                     def_partial_coll_prem,
                     no_2nd_due_policy,
                     no_2nd_due_premium,
                     no_2nd_tot_coll_policy,
                     no_2nd_full_coll_policy,
                     no_2nd_partial_coll_policy,
                     no_2nd_full_coll_prem,
                     no_2nd_partial_coll_prem,
                     renewal_due_policy,
                     renewal_due_premium,
                     renewal_tot_coll_policy,
                     renewal_full_coll_policy,
                     renewal_partial_coll_policy,
                     renewal_full_coll_prem,
                     renewal_partial_coll_prem
              FROM   (  SELECT   ser_off,
                                 org_off,
                                 SUM (def_due_policy) def_due_policy,
                                 SUM (def_due_premium) def_due_premium,
                                 SUM (def_tot_coll_policy) def_tot_coll_policy,
                                 SUM (def_full_coll_policy) def_full_coll_policy,
                                 SUM (def_partial_coll_policy)
                                    def_partial_coll_policy,
                                 SUM (def_full_coll_prem) def_full_coll_prem,
                                 SUM (def_partial_coll_prem)
                                    def_partial_coll_prem,
                                 SUM (no_2nd_due_policy) no_2nd_due_policy,
                                 SUM (no_2nd_due_premium) no_2nd_due_premium,
                                 SUM (no_2nd_tot_coll_policy)
                                    no_2nd_tot_coll_policy,
                                 SUM (no_2nd_full_coll_policy)
                                    no_2nd_full_coll_policy,
                                 SUM (no_2nd_partial_coll_policy)
                                    no_2nd_partial_coll_policy,
                                 SUM (no_2nd_full_coll_prem)
                                    no_2nd_full_coll_prem,
                                 SUM (no_2nd_partial_coll_prem)
                                    no_2nd_partial_coll_prem,
                                 SUM (renewal_due_policy) renewal_due_policy,
                                 SUM (renewal_due_premium) renewal_due_premium,
                                 SUM (renewal_tot_coll_policy)
                                    renewal_tot_coll_policy,
                                 SUM (renewal_full_coll_policy)
                                    renewal_full_coll_policy,
                                 SUM (renewal_partial_coll_policy)
                                    renewal_partial_coll_policy,
                                 SUM (renewal_full_coll_prem)
                                    renewal_full_coll_prem,
                                 SUM (renewal_partial_coll_prem)
                                    renewal_partial_coll_prem
                          -- First Year
                          FROM   (  SELECT   f_office(FUN_FIND_SERVICE_OFF(FUN_FIND_SALES_OFFICE(OFFICE_CD)))
                                                ser_off,
                                             F_OFFICE (
                                                FUN_FIND_SALES_OFFICE (OFFICE_CD)
                                             )
                                                org_off,
                                             SUM (def_due_policy) def_due_policy,
                                             SUM (def_due_premium) def_due_premium,
                                             SUM (def_tot_coll_policy)
                                                def_tot_coll_policy,
                                             SUM (def_full_coll_policy)
                                                def_full_coll_policy,
                                             SUM (def_partial_coll_policy)
                                                def_partial_coll_policy,
                                             SUM (def_full_coll_prem)
                                                def_full_coll_prem,
                                             SUM (def_partial_coll_prem)
                                                def_partial_coll_prem,
                                             0 no_2nd_due_policy,
                                             0 no_2nd_due_premium,
                                             0 no_2nd_tot_coll_policy,
                                             0 no_2nd_full_coll_policy,
                                             0 no_2nd_partial_coll_policy,
                                             0 no_2nd_full_coll_prem,
                                             0 no_2nd_partial_coll_prem,
                                             0 renewal_due_policy,
                                             0 renewal_due_premium,
                                             0 renewal_tot_coll_policy,
                                             0 renewal_full_coll_policy,
                                             0 renewal_partial_coll_policy,
                                             0 renewal_full_coll_prem,
                                             0 renewal_partial_coll_prem
                                      FROM   (  SELECT   f_pgid_to_office (s.pgid)
                                                            office_cd,
                                                         NVL (COUNT (s.pgid), 0)
                                                            def_due_policy,
                                                         0 def_due_premium,
                                                         0 def_tot_coll_policy,
                                                         0 def_full_coll_policy,
                                                         0 def_partial_coll_policy,
                                                         0 def_full_coll_prem,
                                                         0 def_partial_coll_prem
                                                  FROM   ins_p_summery s
                                                 WHERE   ( (s.last_paid_date >=
                                                               TO_DATE (p_date_fr)
                                                            AND policy_status = '00')
                                                          OR policy_status != '00')
                                                         AND EXISTS
                                                               (SELECT   1
                                                                  FROM   val_inforce_policy v
                                                                 WHERE   v.val_year =
                                                                            p_previous_yr
                                                                         AND paymode <>
                                                                               '05'
                                                                         AND v.pgid =
                                                                               s.pgid)
                                                         AND s.pay_mode_cd <> '01'
                                                         AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                    ADD_MONTHS (
                                                                                       p_date_fr,
                                                                                       -12
                                                                                    ),
                                                                                    1
                                                                                 )
                                                                             AND  ADD_MONTHS (
                                                                                     p_date_to,
                                                                                     -1
                                                                                  )
                                              GROUP BY   f_pgid_to_office (s.pgid)
                                              UNION ALL
                                                SELECT   office_cd,
                                                         0 def_due_policy,
                                                         NVL (
                                                            SUM(due_installment
                                                                * installment_premium),
                                                            0
                                                         )
                                                            def_due_premium,
                                                         0 def_tot_coll_policy,
                                                         0 def_full_coll_policy,
                                                         0 def_partial_coll_policy,
                                                         0 def_full_coll_prem,
                                                         0 def_partial_coll_prem
                                                  FROM   (SELECT   office_cd,
                                                                   pgid,
                                                                   comm_date,
                                                                   last_paid_date,
                                                                   last_paid_inst_no,
                                                                   maturity_date,
                                                                   max_due_date,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / TO_NUMBER(DECODE (
                                                                                                pay_mode_cd,
                                                                                                '02',
                                                                                                6,
                                                                                                '03',
                                                                                                3,
                                                                                                '04',
                                                                                                1
                                                                                             ))))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / TO_NUMBER(DECODE (
                                                                                                pay_mode_cd,
                                                                                                '02',
                                                                                                6,
                                                                                                '03',
                                                                                                3,
                                                                                                '04',
                                                                                                1
                                                                                             ))))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.office_cd,
                                                                             s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             ADD_MONTHS (
                                                                                s.comm_date,
                                                                                12
                                                                                - (DECODE (
                                                                                      s.pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   ))
                                                                             )
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.pay_mode_cd <>
                                                                                   '01'
                                                                             AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                        ADD_MONTHS (
                                                                                                           p_date_fr,
                                                                                                           -12
                                                                                                        ),
                                                                                                        1
                                                                                                     )
                                                                                                 AND  ADD_MONTHS (
                                                                                                         p_date_to,
                                                                                                         -1
                                                                                                      )))
                                              GROUP BY   office_cd
                                              UNION ALL
                                                SELECT   f_pgid_to_office (a.pgid)
                                                            office_cd,
                                                         0 def_due_policy,
                                                         0 def_due_premium,
                                                         NVL (COUNT (a.pgid), 0)
                                                            def_tot_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record >=
                                                                           b.due_installment
                                                                        AND b.due_installment >
                                                                              0
                                                                   THEN
                                                                      1
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            def_full_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record <
                                                                           b.due_installment
                                                                        OR b.due_installment =
                                                                             0
                                                                   THEN
                                                                      1
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            def_partial_coll_policy,
                                                         0 def_full_coll_prem,
                                                         0 def_partial_coll_prem
                                                  FROM   (  SELECT   pgid,
                                                                     NVL (COUNT (pgid),
                                                                          0)
                                                                        coll_record,
                                                                     NVL (
                                                                        SUM(d_coll_amount),
                                                                        0
                                                                     )
                                                                        d_coll_amount
                                                              FROM   acc_coll_summery c
                                                             WHERE   receive_dt BETWEEN p_coll_date_fr
                                                                                    AND  p_coll_date_to
                                                                                         + p_grace_period
                                                                     AND EXISTS
                                                                           (SELECT   1
                                                                              FROM   (SELECT   pgid
                                                                                        FROM   ins_p_summery s
                                                                                       WHERE   ( (s.last_paid_date >=
                                                                                                     TO_DATE(p_date_fr)
                                                                                                  AND policy_status =
                                                                                                        '00')
                                                                                                OR policy_status !=
                                                                                                     '00')
                                                                                               AND s.pay_mode_cd <>
                                                                                                     '01'
                                                                                               AND EXISTS
                                                                                                     (SELECT   1
                                                                                                        FROM   val_inforce_policy v
                                                                                                       WHERE   v.val_year =
                                                                                                                  p_previous_yr
                                                                                                               AND paymode <>
                                                                                                                     '05'
                                                                                                               AND v.pgid =
                                                                                                                     s.pgid)
                                                                                               AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                                          ADD_MONTHS (
                                                                                                                             p_date_fr,
                                                                                                                             -12
                                                                                                                          ),
                                                                                                                          1
                                                                                                                       )
                                                                                                                   AND  ADD_MONTHS (
                                                                                                                           p_date_to,
                                                                                                                           -1
                                                                                                                        ))
                                                                                     a
                                                                             WHERE   pgid =
                                                                                        c.pgid)
                                                                     AND due_date BETWEEN p_date_fr
                                                                                      AND  p_date_to
                                                                     AND d_coll_amount >
                                                                           0
                                                          GROUP BY   pgid) a,
                                                         (SELECT   pgid,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             ADD_MONTHS (
                                                                                s.comm_date,
                                                                                12
                                                                                - (DECODE (
                                                                                      s.pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   ))
                                                                             )
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.pay_mode_cd <>
                                                                                   '01'
                                                                             AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                        ADD_MONTHS (
                                                                                                           p_date_fr,
                                                                                                           -12
                                                                                                        ),
                                                                                                        1
                                                                                                     )
                                                                                                 AND  ADD_MONTHS (
                                                                                                         p_date_to,
                                                                                                         -1
                                                                                                      )))
                                                         b
                                                 WHERE   a.pgid = b.pgid
                                              GROUP BY   f_pgid_to_office (a.pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (a.pgid)
                                                            office_cd,
                                                         0 def_due_policy,
                                                         0 def_due_premium,
                                                         0 def_tot_coll_policy,
                                                         0 def_full_coll_policy,
                                                         0 def_partial_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record >=
                                                                           b.due_installment
                                                                        AND b.due_installment >
                                                                              0
                                                                   THEN
                                                                      d_coll_amount
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            def_full_coll_prem,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record <
                                                                           b.due_installment
                                                                        OR b.due_installment =
                                                                             0
                                                                   THEN
                                                                      d_coll_amount
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            def_partial_coll_prem
                                                  FROM   (  SELECT   pgid,
                                                                     NVL (COUNT (pgid),
                                                                          0)
                                                                        coll_record,
                                                                     NVL (
                                                                        SUM(d_coll_amount),
                                                                        0
                                                                     )
                                                                        d_coll_amount
                                                              FROM   acc_coll_summery c
                                                             WHERE   receive_dt BETWEEN p_coll_date_fr
                                                                                    AND  p_coll_date_to
                                                                                         + p_grace_period
                                                                     AND EXISTS
                                                                           (SELECT   1
                                                                              FROM   (SELECT   pgid
                                                                                        FROM   ins_p_summery s
                                                                                       WHERE   ( (s.last_paid_date >=
                                                                                                     TO_DATE(p_date_fr)
                                                                                                  AND policy_status =
                                                                                                        '00')
                                                                                                OR policy_status !=
                                                                                                     '00')
                                                                                               AND s.pay_mode_cd <>
                                                                                                     '01'
                                                                                               AND EXISTS
                                                                                                     (SELECT   1
                                                                                                        FROM   val_inforce_policy v
                                                                                                       WHERE   v.val_year =
                                                                                                                  p_previous_yr
                                                                                                               AND paymode <>
                                                                                                                     '05'
                                                                                                               AND v.pgid =
                                                                                                                     s.pgid)
                                                                                               AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                                          ADD_MONTHS (
                                                                                                                             p_date_fr,
                                                                                                                             -12
                                                                                                                          ),
                                                                                                                          1
                                                                                                                       )
                                                                                                                   AND  ADD_MONTHS (
                                                                                                                           p_date_to,
                                                                                                                           -1
                                                                                                                        ))
                                                                                     a
                                                                             WHERE   pgid =
                                                                                        c.pgid)
                                                                     AND due_date BETWEEN p_date_fr
                                                                                      AND  p_date_to
                                                                     AND d_coll_amount >
                                                                           0
                                                          GROUP BY   pgid) a,
                                                         (SELECT   pgid,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             ADD_MONTHS (
                                                                                s.comm_date,
                                                                                12
                                                                                - (DECODE (
                                                                                      s.pay_mode_cd,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   ))
                                                                             )
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.pay_mode_cd <>
                                                                                   '01'
                                                                             AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                        ADD_MONTHS (
                                                                                                           p_date_fr,
                                                                                                           -12
                                                                                                        ),
                                                                                                        1
                                                                                                     )
                                                                                                 AND  ADD_MONTHS (
                                                                                                         p_date_to,
                                                                                                         -1
                                                                                                      )))
                                                         b
                                                 WHERE   a.pgid = b.pgid
                                              GROUP BY   f_pgid_to_office (a.pgid))
                                  GROUP BY   f_office(FUN_FIND_SERVICE_OFF(FUN_FIND_SALES_OFFICE(OFFICE_CD))),
                                             F_OFFICE (
                                                FUN_FIND_SALES_OFFICE (OFFICE_CD)
                                             )
                                  -- Second Year
                                  UNION ALL
                                    SELECT   f_office(FUN_FIND_SERVICE_OFF(FUN_FIND_SALES_OFFICE(OFFICE_CD)))
                                                ser_off,
                                             F_OFFICE (
                                                FUN_FIND_SALES_OFFICE (OFFICE_CD)
                                             )
                                                org_off,
                                             0 def_due_policy,
                                             0 def_due_premium,
                                             0 def_tot_coll_policy,
                                             0 def_full_coll_policy,
                                             0 def_partial_coll_policy,
                                             0 def_full_coll_prem,
                                             0 def_partial_coll_prem,
                                             SUM (no_2nd_due_policy)
                                                no_2nd_due_policy,
                                             SUM (no_2nd_due_premium)
                                                no_2nd_due_premium,
                                             SUM (no_2nd_tot_coll_policy)
                                                no_2nd_tot_coll_policy,
                                             SUM (no_2nd_full_coll_policy)
                                                no_2nd_full_coll_policy,
                                             SUM (no_2nd_partial_coll_policy)
                                                no_2nd_partial_coll_policy,
                                             SUM (no_2nd_full_coll_prem)
                                                no_2nd_full_coll_prem,
                                             SUM (no_2nd_partial_coll_prem)
                                                no_2nd_partial_coll_prem,
                                             0 renewal_due_policy,
                                             0 renewal_due_premium,
                                             0 renewal_tot_coll_policy,
                                             0 renewal_full_coll_policy,
                                             0 renewal_partial_coll_policy,
                                             0 renewal_full_coll_prem,
                                             0 renewal_partial_coll_prem
                                      FROM   (  SELECT   f_pgid_to_office (s.pgid)
                                                            office_cd,
                                                         NVL (COUNT (s.pgid), 0)
                                                            no_2nd_due_policy,
                                                         0 no_2nd_due_premium,
                                                         0 no_2nd_tot_coll_policy,
                                                         0 no_2nd_full_coll_policy,
                                                         0 no_2nd_partial_coll_policy,
                                                         0 no_2nd_full_coll_prem,
                                                         0 no_2nd_partial_coll_prem
                                                  FROM   ins_p_summery s
                                                 WHERE   ( (s.last_paid_date >=
                                                               TO_DATE (p_date_fr)
                                                            AND policy_status = '00')
                                                          OR policy_status != '00')
                                                         AND EXISTS
                                                               (SELECT   1
                                                                  FROM   val_inforce_policy v
                                                                 WHERE   v.val_year =
                                                                            p_previous_yr
                                                                         AND paymode <>
                                                                               '05'
                                                                         AND v.pgid =
                                                                               s.pgid)
                                                         AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                    ADD_MONTHS (
                                                                                       p_date_fr,
                                                                                       -24
                                                                                    ),
                                                                                    1
                                                                                 )
                                                                             AND  ADD_MONTHS (
                                                                                     p_date_to,
                                                                                     -12
                                                                                  )
                                              GROUP BY   f_pgid_to_office (s.pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (pgid)
                                                            office_cd,
                                                         0 no_2nd_due_policy,
                                                         NVL (
                                                            SUM(due_installment
                                                                * installment_premium),
                                                            0
                                                         )
                                                            no_2nd_due_premium,
                                                         0 no_2nd_tot_coll_policy,
                                                         0 no_2nd_full_coll_policy,
                                                         0 no_2nd_partial_coll_policy,
                                                         0 no_2nd_full_coll_prem,
                                                         0 no_2nd_partial_coll_prem
                                                  FROM   (SELECT   pgid,
                                                                   comm_date,
                                                                   last_paid_date,
                                                                   last_paid_inst_no,
                                                                   maturity_date,
                                                                   max_due_date,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             ADD_MONTHS (
                                                                                s.comm_date,
                                                                                24
                                                                                - (DECODE (
                                                                                      s.pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   ))
                                                                             )
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                        ADD_MONTHS (
                                                                                                           p_date_fr,
                                                                                                           -24
                                                                                                        ),
                                                                                                        1
                                                                                                     )
                                                                                                 AND  ADD_MONTHS (
                                                                                                         p_date_to,
                                                                                                         -12
                                                                                                      )))
                                              GROUP BY   f_pgid_to_office (pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (a.pgid)
                                                            office_cd,
                                                         0 no_2nd_due_policy,
                                                         0 no_2nd_due_premium,
                                                         NVL (COUNT (a.pgid), 0)
                                                            no_2nd_tot_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record >=
                                                                           b.due_installment
                                                                        AND b.due_installment >
                                                                              0
                                                                   THEN
                                                                      1
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            no_2nd_full_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record <
                                                                           b.due_installment
                                                                        OR b.due_installment =
                                                                             0
                                                                   THEN
                                                                      1
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            no_2nd_partial_coll_policy,
                                                         0 no_2nd_full_coll_prem,
                                                         0 no_2nd_partial_coll_prem
                                                  FROM   (  SELECT   pgid,
                                                                     NVL (COUNT (pgid),
                                                                          0)
                                                                        coll_record,
                                                                     NVL (
                                                                        SUM(s_coll_amount),
                                                                        0
                                                                     )
                                                                        s_coll_amount
                                                              FROM   acc_coll_summery c
                                                             WHERE   receive_dt BETWEEN p_coll_date_fr
                                                                                    AND  p_coll_date_to
                                                                                         + p_grace_period
                                                                     AND EXISTS
                                                                           (SELECT   1
                                                                              FROM   (SELECT   pgid
                                                                                        FROM   ins_p_summery s
                                                                                       WHERE   ( (s.last_paid_date >=
                                                                                                     TO_DATE(p_date_fr)
                                                                                                  AND policy_status =
                                                                                                        '00')
                                                                                                OR policy_status !=
                                                                                                     '00')
                                                                                               AND EXISTS
                                                                                                     (SELECT   1
                                                                                                        FROM   val_inforce_policy v
                                                                                                       WHERE   v.val_year =
                                                                                                                  p_previous_yr
                                                                                                               AND paymode <>
                                                                                                                     '05'
                                                                                                               AND v.pgid =
                                                                                                                     s.pgid)
                                                                                               AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                                          ADD_MONTHS (
                                                                                                                             p_date_fr,
                                                                                                                             -24
                                                                                                                          ),
                                                                                                                          1
                                                                                                                       )
                                                                                                                   AND  ADD_MONTHS (
                                                                                                                           p_date_to,
                                                                                                                           -12
                                                                                                                        ))
                                                                                     a
                                                                             WHERE   pgid =
                                                                                        c.pgid)
                                                                     AND due_date BETWEEN p_date_fr
                                                                                      AND  p_date_to
                                                                     AND s_coll_amount >
                                                                           0
                                                          GROUP BY   pgid) a,
                                                         (SELECT   pgid,
                                                                   comm_date,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             ADD_MONTHS (
                                                                                s.comm_date,
                                                                                24
                                                                                - (DECODE (
                                                                                      s.pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   ))
                                                                             )
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                        ADD_MONTHS (
                                                                                                           p_date_fr,
                                                                                                           -24
                                                                                                        ),
                                                                                                        1
                                                                                                     )
                                                                                                 AND  ADD_MONTHS (
                                                                                                         p_date_to,
                                                                                                         -12
                                                                                                      )))
                                                         b
                                                 WHERE   a.pgid = b.pgid
                                              GROUP BY   f_pgid_to_office (a.pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (a.pgid)
                                                            office_cd,
                                                         0 no_2nd_due_policy,
                                                         0 no_2nd_due_premium,
                                                         0 no_2nd_tot_coll_policy,
                                                         0 no_2nd_full_coll_policy,
                                                         0 no_2nd_partial_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record >=
                                                                           b.due_installment
                                                                        AND b.due_installment >
                                                                              0
                                                                   THEN
                                                                      s_coll_amount
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            no_2nd_full_coll_prem,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record <
                                                                           b.due_installment
                                                                        OR b.due_installment =
                                                                             0
                                                                   THEN
                                                                      s_coll_amount
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            no_2nd_partial_coll_prem
                                                  FROM   (  SELECT   pgid,
                                                                     NVL (COUNT (pgid),
                                                                          0)
                                                                        coll_record,
                                                                     NVL (
                                                                        SUM(s_coll_amount),
                                                                        0
                                                                     )
                                                                        s_coll_amount
                                                              FROM   acc_coll_summery c
                                                             WHERE   receive_dt BETWEEN p_coll_date_fr
                                                                                    AND  p_coll_date_to
                                                                                         + p_grace_period
                                                                     AND EXISTS
                                                                           (SELECT   1
                                                                              FROM   (SELECT   pgid
                                                                                        FROM   ins_p_summery s
                                                                                       WHERE   ( (s.last_paid_date >=
                                                                                                     TO_DATE(p_date_fr)
                                                                                                  AND policy_status =
                                                                                                        '00')
                                                                                                OR policy_status !=
                                                                                                     '00')
                                                                                               AND EXISTS
                                                                                                     (SELECT   1
                                                                                                        FROM   val_inforce_policy v
                                                                                                       WHERE   v.val_year =
                                                                                                                  p_previous_yr
                                                                                                               AND paymode <>
                                                                                                                     '05'
                                                                                                               AND v.pgid =
                                                                                                                     s.pgid)
                                                                                               AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                                          ADD_MONTHS (
                                                                                                                             p_date_fr,
                                                                                                                             -24
                                                                                                                          ),
                                                                                                                          1
                                                                                                                       )
                                                                                                                   AND  ADD_MONTHS (
                                                                                                                           p_date_to,
                                                                                                                           -12
                                                                                                                        ))
                                                                                     a
                                                                             WHERE   pgid =
                                                                                        c.pgid)
                                                                     AND due_date BETWEEN p_date_fr
                                                                                      AND  p_date_to
                                                                     AND s_coll_amount >
                                                                           0
                                                          GROUP BY   pgid) a,
                                                         (SELECT   pgid,
                                                                   comm_date,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             ADD_MONTHS (
                                                                                s.comm_date,
                                                                                24
                                                                                - (DECODE (
                                                                                      s.pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   ))
                                                                             )
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.comm_date BETWEEN ADD_MONTHS (
                                                                                                        ADD_MONTHS (
                                                                                                           p_date_fr,
                                                                                                           -24
                                                                                                        ),
                                                                                                        1
                                                                                                     )
                                                                                                 AND  ADD_MONTHS (
                                                                                                         p_date_to,
                                                                                                         -12
                                                                                                      )))
                                                         b
                                                 WHERE   a.pgid = b.pgid
                                              GROUP BY   f_pgid_to_office (a.pgid))
                                  GROUP BY   f_office(FUN_FIND_SERVICE_OFF(FUN_FIND_SALES_OFFICE(OFFICE_CD))),
                                             F_OFFICE (
                                                FUN_FIND_SALES_OFFICE (OFFICE_CD)
                                             )
                                  UNION ALL                          --Renewal
                                    SELECT   f_office(FUN_FIND_SERVICE_OFF(FUN_FIND_SALES_OFFICE(OFFICE_CD)))
                                                ser_off,
                                             F_OFFICE (
                                                FUN_FIND_SALES_OFFICE (OFFICE_CD)
                                             )
                                                org_off,
                                             0 def_due_policy,
                                             0 def_due_premium,
                                             0 def_tot_coll_policy,
                                             0 def_full_coll_policy,
                                             0 def_partial_coll_policy,
                                             0 def_full_coll_prem,
                                             0 def_partial_coll_prem,
                                             0 no_2nd_due_policy,
                                             0 no_2nd_due_premium,
                                             0 no_2nd_tot_coll_policy,
                                             0 no_2nd_full_coll_policy,
                                             0 no_2nd_partial_coll_policy,
                                             0 no_2nd_full_coll_prem,
                                             0 no_2nd_partial_coll_prem,
                                             SUM (renewal_due_policy)
                                                renewal_due_policy,
                                             SUM (renewal_due_premium)
                                                renewal_due_premium,
                                             SUM (renewal_tot_coll_policy)
                                                renewal_tot_coll_policy,
                                             SUM (renewal_full_coll_policy)
                                                renewal_full_coll_policy,
                                             SUM (renewal_partial_coll_policy)
                                                renewal_partial_coll_policy,
                                             SUM (renewal_full_coll_prem)
                                                renewal_full_coll_prem,
                                             SUM (renewal_partial_coll_prem)
                                                renewal_partial_coll_prem
                                      FROM   (  SELECT   f_pgid_to_office (s.pgid)
                                                            office_cd,
                                                         NVL (COUNT (s.pgid), 0)
                                                            renewal_due_policy,
                                                         0 renewal_due_premium,
                                                         0 renewal_tot_coll_policy,
                                                         0 renewal_full_coll_policy,
                                                         0
                                                            renewal_partial_coll_policy,
                                                         0 renewal_full_coll_prem,
                                                         0 renewal_partial_coll_prem
                                                  FROM   ins_p_summery s
                                                 WHERE   ( (s.last_paid_date >=
                                                               TO_DATE (p_date_fr)
                                                            AND policy_status = '00')
                                                          OR policy_status != '00')
                                                         AND EXISTS
                                                               (SELECT   1
                                                                  FROM   val_inforce_policy v
                                                                 WHERE   v.val_year =
                                                                            p_previous_yr
                                                                         AND paymode <>
                                                                               '05'
                                                                         AND v.pgid =
                                                                               s.pgid)
                                                         AND s.comm_date <=
                                                               ADD_MONTHS (p_date_to,
                                                                           -24)
                                              GROUP BY   f_pgid_to_office (s.pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (pgid)
                                                            office_cd,
                                                         0 renewal_due_policy,
                                                         NVL (
                                                            SUM(due_installment
                                                                * installment_premium),
                                                            0
                                                         )
                                                            renewal_due_premium,
                                                         0 renewal_tot_coll_policy,
                                                         0 renewal_full_coll_policy,
                                                         0
                                                            renewal_partial_coll_policy,
                                                         0 renewal_full_coll_prem,
                                                         0 renewal_partial_coll_prem
                                                  FROM   (SELECT   pgid,
                                                                   comm_date,
                                                                   last_paid_date,
                                                                   last_paid_inst_no,
                                                                   maturity_date,
                                                                   max_due_date,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             p_date_to
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.comm_date <=
                                                                                   ADD_MONTHS (
                                                                                      p_date_to,
                                                                                      -24
                                                                                   )))
                                              GROUP BY   f_pgid_to_office (pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (a.pgid)
                                                            office_cd,
                                                         0 renewal_due_policy,
                                                         0 renewal_due_premium,
                                                         NVL (COUNT (a.pgid), 0)
                                                            renewal_tot_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record >=
                                                                           b.due_installment
                                                                        AND b.due_installment >
                                                                              0
                                                                   THEN
                                                                      1
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            renewal_full_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record <
                                                                           b.due_installment
                                                                        OR b.due_installment =
                                                                             0
                                                                   THEN
                                                                      1
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            renewal_partial_coll_policy,
                                                         0 renewal_full_coll_prem,
                                                         0 renewal_partial_coll_prem
                                                  FROM   (  SELECT   pgid,
                                                                     COUNT (pgid)
                                                                        coll_record,
                                                                     SUM (
                                                                        r_coll_amount
                                                                     )
                                                                        r_coll_amount
                                                              FROM   acc_coll_summery c
                                                             WHERE   receive_dt BETWEEN p_coll_date_fr
                                                                                    AND  p_coll_date_to
                                                                                         + p_grace_period
                                                                     AND EXISTS
                                                                           (SELECT   1
                                                                              FROM   (SELECT   pgid
                                                                                        FROM   ins_p_summery s
                                                                                       WHERE   ( (s.last_paid_date >=
                                                                                                     TO_DATE(p_date_fr)
                                                                                                  AND policy_status =
                                                                                                        '00')
                                                                                                OR policy_status !=
                                                                                                     '00')
                                                                                               AND EXISTS
                                                                                                     (SELECT   1
                                                                                                        FROM   val_inforce_policy v
                                                                                                       WHERE   v.val_year =
                                                                                                                  p_previous_yr
                                                                                                               AND paymode <>
                                                                                                                     '05'
                                                                                                               AND v.pgid =
                                                                                                                     s.pgid)
                                                                                               AND s.comm_date <=
                                                                                                     ADD_MONTHS (
                                                                                                        p_date_to,
                                                                                                        -24
                                                                                                     ))
                                                                                     a
                                                                             WHERE   pgid =
                                                                                        c.pgid)
                                                                     AND due_date BETWEEN p_date_fr
                                                                                      AND  p_date_to
                                                                     AND r_coll_amount >
                                                                           0
                                                          GROUP BY   pgid) a,
                                                         (SELECT   pgid,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             p_date_to
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.comm_date <=
                                                                                   ADD_MONTHS (
                                                                                      p_date_to,
                                                                                      -24
                                                                                   )))
                                                         b
                                                 WHERE   a.pgid = b.pgid
                                              GROUP BY   f_pgid_to_office (a.pgid)
                                              UNION ALL
                                                SELECT   f_pgid_to_office (a.pgid)
                                                            office_cd,
                                                         0 renewal_due_policy,
                                                         0 renewal_due_premium,
                                                         0 renewal_tot_coll_policy,
                                                         0 renewal_full_coll_policy,
                                                         0
                                                            renewal_partial_coll_policy,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record >=
                                                                           b.due_installment
                                                                        AND b.due_installment >
                                                                              0
                                                                   THEN
                                                                      r_coll_amount
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            renewal_full_coll_prem,
                                                         NVL (
                                                            SUM(CASE
                                                                   WHEN a.coll_record <
                                                                           b.due_installment
                                                                        OR b.due_installment =
                                                                             0
                                                                   THEN
                                                                      r_coll_amount
                                                                   ELSE
                                                                      0
                                                                END),
                                                            0
                                                         )
                                                            renewal_partial_coll_prem
                                                  FROM   (  SELECT   pgid,
                                                                     NVL (COUNT (pgid),
                                                                          0)
                                                                        coll_record,
                                                                     NVL (
                                                                        SUM(r_coll_amount),
                                                                        0
                                                                     )
                                                                        r_coll_amount
                                                              FROM   acc_coll_summery c
                                                             WHERE   receive_dt BETWEEN p_coll_date_fr
                                                                                    AND  p_coll_date_to
                                                                                         + p_grace_period
                                                                     AND EXISTS
                                                                           (SELECT   1
                                                                              FROM   (SELECT   pgid
                                                                                        FROM   ins_p_summery s
                                                                                       WHERE   ( (s.last_paid_date >=
                                                                                                     TO_DATE(p_date_fr)
                                                                                                  AND policy_status =
                                                                                                        '00')
                                                                                                OR policy_status !=
                                                                                                     '00')
                                                                                               AND EXISTS
                                                                                                     (SELECT   1
                                                                                                        FROM   val_inforce_policy v
                                                                                                       WHERE   v.val_year =
                                                                                                                  p_previous_yr
                                                                                                               AND paymode <>
                                                                                                                     '05'
                                                                                                               AND v.pgid =
                                                                                                                     s.pgid)
                                                                                               AND s.comm_date <=
                                                                                                     ADD_MONTHS (
                                                                                                        p_date_to,
                                                                                                        -24
                                                                                                     ))
                                                                                     a
                                                                             WHERE   pgid =
                                                                                        c.pgid)
                                                                     AND due_date BETWEEN p_date_fr
                                                                                      AND  p_date_to
                                                                     AND r_coll_amount >
                                                                           0
                                                          GROUP BY   pgid) a,
                                                         (SELECT   pgid,
                                                                   CASE
                                                                      WHEN max_due_date <
                                                                              p_date_fr
                                                                      THEN
                                                                         0
                                                                      WHEN max_due_date <=
                                                                              maturity_date
                                                                      THEN
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  max_due_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          max_due_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                      ELSE
                                                                         FLOOR( ( ( (TO_NUMBER(TO_CHAR (
                                                                                                  maturity_date,
                                                                                                  'MM'
                                                                                               ))
                                                                                     - TO_NUMBER(TO_CHAR (
                                                                                                    p_date_fr,
                                                                                                    'MM'
                                                                                                 )))
                                                                                   + CASE
                                                                                        WHEN TO_NUMBER(TO_CHAR (
                                                                                                          maturity_date,
                                                                                                          'MM'
                                                                                                       )) <
                                                                                                TO_NUMBER(TO_CHAR (
                                                                                                             p_date_fr,
                                                                                                             'MM'
                                                                                                          ))
                                                                                        THEN
                                                                                           12
                                                                                        ELSE
                                                                                           0
                                                                                     END)
                                                                                 / DECODE (
                                                                                      pay_mode_cd,
                                                                                      '01',
                                                                                      12,
                                                                                      '02',
                                                                                      6,
                                                                                      '03',
                                                                                      3,
                                                                                      '04',
                                                                                      1
                                                                                   )))
                                                                         + 1
                                                                   END
                                                                      due_installment,
                                                                   installment_premium
                                                            FROM   (SELECT   s.pgid,
                                                                             s.comm_date,
                                                                             s.last_paid_date,
                                                                             s.last_paid_inst_no,
                                                                             s.maturity_date,
                                                                             s.pay_mode_cd,
                                                                             s.installment_premium,
                                                                             p_date_to
                                                                                max_due_date
                                                                      FROM   ins_p_summery s
                                                                     WHERE   ( (s.last_paid_date >=
                                                                                   TO_DATE(p_date_fr)
                                                                                AND policy_status =
                                                                                      '00')
                                                                              OR policy_status !=
                                                                                   '00')
                                                                             AND EXISTS
                                                                                   (SELECT   1
                                                                                      FROM   val_inforce_policy v
                                                                                     WHERE   v.val_year =
                                                                                                p_previous_yr
                                                                                             AND paymode <>
                                                                                                   '05'
                                                                                             AND v.pgid =
                                                                                                   s.pgid)
                                                                             AND s.comm_date <=
                                                                                   ADD_MONTHS (
                                                                                      p_date_to,
                                                                                      -24
                                                                                   )))
                                                         b
                                                 WHERE   a.pgid = b.pgid
                                              GROUP BY   f_pgid_to_office (a.pgid))
                                  GROUP BY   f_office(FUN_FIND_SERVICE_OFF(FUN_FIND_SALES_OFFICE(OFFICE_CD))),
                                             F_OFFICE (
                                                FUN_FIND_SALES_OFFICE (OFFICE_CD)
                                             ))
                      GROUP BY   ser_off, org_off)
          ORDER BY   ser_off)
      LOOP
         v_coll_rec.report_parameter := i.report_parameter;
         v_coll_rec.ser_off := i.ser_off;
         v_coll_rec.org_off := i.org_off;

         -- v_coll_rec.inforce_policy := v_inforce_policy;
         v_coll_rec.def_due_policy := i.renewal_full_coll_policy;
         v_coll_rec.def_due_premium := i.renewal_full_coll_policy;
         v_coll_rec.def_tot_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.def_full_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.def_partial_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.def_full_coll_prem := i.renewal_full_coll_policy;
         v_coll_rec.def_partial_coll_prem := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_due_policy := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_due_premium := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_tot_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_full_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_partial_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_full_coll_prem := i.renewal_full_coll_policy;
         v_coll_rec.no_2nd_partial_coll_prem := i.renewal_full_coll_policy;
         v_coll_rec.renewal_due_policy := i.renewal_full_coll_policy;
         v_coll_rec.renewal_due_premium := i.renewal_full_coll_policy;
         v_coll_rec.renewal_tot_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.renewal_full_coll_policy := i.renewal_full_coll_policy;
         v_coll_rec.renewal_partial_coll_policy :=
            i.renewal_partial_coll_policy;
         v_coll_rec.renewal_full_coll_prem := i.renewal_full_coll_prem;
         v_coll_rec.renewal_partial_coll_prem := i.renewal_partial_coll_prem;
         PIPE ROW (v_coll_rec);
      END LOOP;
   END IF;
END fun_idra_lapse_ratio;
/


--
-- FUN_ILIFE_RECEIPT_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ilife_receipt_no (
   p_partner_code       VARCHAR2,
   p_partner_transid    VARCHAR2,
   p_active_office_cd   VARCHAR2,
   p_receive_date       DATE,
   p_coll_slip_no       VARCHAR2,
   p_coll_sl_no         NUMBER
)
   RETURN CHAR
IS
   v_receipt_no   VARCHAR2 (100);
BEGIN
   BEGIN
      SELECT DECODE (p_partner_transid,
                     NULL, (   p_active_office_cd
                            || '-'
                            || TO_CHAR (p_receive_date, 'RR')
                            || '-'
                            || NVL (p_coll_slip_no, p_coll_sl_no)
                      ),
                        DECODE (p_partner_code,
                                'BKASH', 'BK-',
                                'NAGAD', 'NG-',
                                'SURECASH', 'SU-'
                               )
                     || p_partner_transid
                    )
        INTO v_receipt_no
        FROM DUAL;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_receipt_no := NULL;
   END;

   RETURN v_receipt_no;
END;
/


--
-- FUN_INS_AGE_PROOF_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_age_proof_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
214 195
KKgwOFEfm1ultfKKdzs1bj3gtx8wgwH310jWfC9GEos+M29mY9Oh0PNbsVb0bEsmeRESwlFn
5Vpiw97rwWR/BpYxtwD4QqDaSsfcKrZ23LGDbh4sx85NR/5j3tzofkqxZOX5gZmEnxFmNceE
7xEKyvG59GhWNVH/bCw2ypfVe4mwfDtBpU+sQzwS1KSGhwrQSeqethqrG8tf9vvWwVrUCRph
Jmi4WI5mn1kYcWRuGZrUSWQSiedzZqhZPKuoFe9p7H1xk+AAsQ/A8UvOVQCeICMDX+Z1B2Gk
k8+MdQ33Eri6nyLLcXXjEeDg97rqeWMSadPoUMhWDARsO5w1PgI2tVK2Nq8jRJkrtaQicmx2
E8Ksi+HYcbS0kLabTf2w+NqqhTzhebvuLOh3qYI=
/


--
-- FUN_INS_APPARAL_STATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_apparal_state(v_state_cd    VARCHAR2) RETURN VARCHAR2 AS
v_state_nm             VARCHAR2(30);
BEGIN
    BEGIN
         SELECT state_nm INTO v_state_nm
         FROM ins_apparal_state
         WHERE state_cd = v_state_cd;
        EXCEPTION
                 WHEN no_data_found THEN
                 raise_application_error (-20001, 'Invalid code or Id');
    END;
    RETURN(v_state_nm);
END;
/


--
-- FUN_INS_CHECK_DIGIT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_check_digit wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
784 2a9
YqGaZmV4jbkXVMYL6km4HduZHQMwgw1c2iDWfC+5R2RTO1CAjshFIfxnX6HY09plGy5JKCnV
5XdjzTwsmoJXNrBnFWkoN7iaVf5VmSWstpU2B5y7KO1zzncTxMHXmD+DvEid3f6mcGOcZgtd
zMf7WwdSEgMYbFjGZZvhhqgmxRRbh1bow+HZChaR3Prt3LRfJmpX2k0sObYHZYzP6IukjxE0
hMGVdyPk9HEM9jbq5g0Ux+fQSOFT7dZOCL4yhH9QMicurxzY9BZT/ET9rFDMY7EA5aOi9BSz
9T3i2JM9p4JjgtTQif2+ioSdf1sbHKteN1VD218154yzOHYd+kZUI98Hud+omYPAbKRvKNwi
6mDGys9XprLfD3qt1xbMSy+9zlpCRMxwYl/V7vXbIq5jVI9sPgbYShUlycG4NmfX9lt9pMxW
Pf8jJzkkJC+yhTMVKXfbIyVWsLUWS43xSVQmm0++KozDXEsXlJBCO8O0i623tL6QY5KDIwnh
nJ/Wa7/0ILtKOQUSEsat/vhl2DxXkoS22DQ5Vllpv7jwu5JbdnmwXWHbO/DN5FpwC5djTmoI
Jubi1dAQk3/0Ui+JnWy+c9yt2LbQ4r1M7K5RN4kGs3j0XNheiU8h6o0fk98mOOFiZSCDzenU
VrAEBJDrrPbUxwcIih+krSAM
/


--
-- FUN_INS_CHECK_DIGIT_VALIDATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_check_digit_validate wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
683 2f6
Py0681XJPb1Co19oZRjUbsY+toswgwLD+kgFfC/Nkw9/xFrwtlThI/Tu1lbMb8xYIRaXUtyi
yGMqo10loLDPzwcMovLJLxw20SCL7TF3dNjxiYIw+fhR3Jaqd2pysAcP/AjShtLl+VW1IgAZ
nSI17KbdNc1CgAralVdBFuvqY02DCY6h6PushTV8tLgZ9/FsoMQrXAzlu+XousWvlt+K36Jn
7BcK9E5KSzt+cnCVm6SxKP0HsjTw8uEH8QzVlAbdBro5ePZTVIdXHRpATirFhXpZXM9wmx11
Imuaz2aEpIxl2BgmdIexGHaLo/+bDWNbYpGnaFocSCZ+OsoXUMooew33Dai6l+ANNQ1InDkA
a5DKU0mkJhRwjSM+G6mVaLPhwOt4RVgU0AKRD/2vv2koAf6taj2IlXHkPW4h8UEWeWpE7MNF
CMdTvEqtPEtKThAGJ3YzxRvX1Uq40aDHkPPZi4ZoCKsJTitX7of4Egpf/oLXqzFGYg1hZlL6
33xO66xlxnMF/Y6lMtPUl1jI4klPuoBik/DsR6EgMkXYK9qqtxnCQXFgG/SBghEWcwgl11X1
0uFMMEV0xTiWH2soujawM+NqwG0m7MhXlxEv7omoOyaH7JYtAEc82WfsAadYZA0qjZ7XsSzw
omna/nKN4MorSpZfEifyNKtj/He3C+kzkrBkli64TbDRASardGRKgjB41Kzv5tKCEdN/UBrX
3Y4BEARAe4mk6dzCkpssRkVAnQ==
/


--
-- FUN_INS_COMPANY_SHORT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_company_short_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b9 160
9Y23ENxT/1OsuG+vWQJh5T3x7cAwgwHINQxqZy8CAMHqRzu9FhrtbygeyeBvgzF8mCYjq/KM
VEv0oMXOu9ejBRoIr92bzjN/IJsYoHinj0MD93nHyC6YEg94msAwef4sJYoGjRGYVpQA9P8O
6/It0Y5y03DSlOsxpkNRHJ8CUNNAe1IIIS6Ls6QZ/Rismp0/Q7g3g2oBSqggOI4ZqvoxOduh
eJTVJTBmEotrZ2AEw74COAM6WNuA8AFXoTYLMog2kWxeh6FI1ZfdvzyqyI1SFuVWH2AKyGyF
fogGE5Ps6Ov2dXWL9nNhOzjrPHJQua93t11THSWaZcZO1Iw8pJTjCizh30jg
/


--
-- FUN_INS_DIAG_REQ  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Diag_Req wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c3 134
7vQfBsjYSjrmy2TTyzmYz4/Qtl4wgxDIAJkVfC9AkPjVSPP8Bo+jduDAPWcSJrHb0D5X41OO
ouS1M23fYwb3qDT+GU7AnHvxK/2s0l5CTO3tIxkcQbuW466H3i3+X4CWlHdjJj9DDnvXde8x
MnC6g/Y31XCgSr3crEM1pTmiiEQhl9qDJI5DYsX0n1OxjiodhmQ704KJb+blG/Zw0yGDXt86
ckezwCLK70YMIDjARpGlBungs2h5bssWNpE00yvOd1cJcPbeSIrQotHZ8ULEXMiSR//9rp+6
bMzrD8/7oPxI9g==
/


--
-- FUN_INS_DIAG_TEST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Diag_Test wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1d0 15c
qwfGjyhSMB+ThHbKYqRy2Mrb5Lowg3nIr9xqfHRArf4+zzUeFGcBsfSEWmjXJfzD3HuPji71
5rdpSX+POt7qoqt/1QeF+XMxndlADUnZaT8yN0VefAdVuqX46xe8skB3xTD1IhEdEC/+cpXS
VcO4zQ8nbtYOIEY4CqJkjVZnvn6eBic2TOi4MuhWA4Bx8xfWIfn/7rjWg4ThFDNvJagta466
Y07gzd7wrMhTz6l3M5uu8HKrHu7DLaoVOHD9X5vFiWE4Hbyucx8YZgc1PYFAoKtU++nYZz+Y
FhgG+TnJdxC7GShiNBwFAHYkqYMxz2j7Or9YCBVCJ1MfsqwKLBDKMuI=
/


--
-- FUN_INS_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
187 14c
12aLWwxQ7Kgzye4R9vvaG8q7MakwgwFps/JqZy/SrQ9/IC5nqDzGBmpCMbTWn5Z+0T3EjCFi
jiH7DT+dvmG+4//rZYLaR0gxS5/UZcuw/yyYrpozmOv4vPjyeLxLRQhF3anw0+3DZXLKXavu
Wmc9+j369uTUfVosm373erMD7hSl6/VgLtUlywusOBfzHUm6Pt/jgZOTtpihI5PxL9TC0OOV
H7OEZOzluMmsnQRhiH4Qa26bY3lTqf1NtWDM6Btk5ScBoJ6TQaLYyu0TwUI/qm1YKbzEIMZv
mLxVjLWp3hcxYx0IDUdDEt56uFDWn04d/NFMfQ==
/


--
-- FUN_INS_EDU_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_edu_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e8 175
2uBtBc5vSA79FMV0uRz+Va+nK9QwgwH3DK5qfC9GrcHqijv0wxqgdgocXwNrp+wyXYCPyWt7
Wo3K96ml+FKrmxZVtwD43iEcwadT8/GPO/ZovjrADbtuIK5VgFXPxo1qR0VZwB4wOTjF6M43
JnnhnvBcIb3d9cOyFJRLbvfjLCWRHwAGtw5NscHrASEc9/1UV+dl0xtyWEeNVhUJrjGeFB0e
bSGHF5I6qZ44zxUcbyjsqGCIEWpfPTe0cR7ZOTO4PYVIZggCCzH+BK+1vfvnWkVfiIvA3tZj
vSViTXVQfVSTHEQX7ZyEYxqszj8T6CnJstWz5DS8TwBuow+E+L0VZPGoHSUPde66BiZhS7u/
v52xVjKN
/


--
-- FUN_INS_EDU_QUALIFICATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Edu_Qualification wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e9 168
Jiitawvd8ne+RuLschsiNbDs5rYwgwL3LgxqZy9AAMHqR+ns5o209ghLSMnNZ2UTSJ+6AGJj
zOda4Sfkcxt5ed8WzkGnWBcZOlRDVKMldOX2eiosHAr/IEVzunOjLDNPMgXbutAmTv1JZZZe
felxh+YaWhivj9+p4s3HN8d8EZA4tJ7vsRVWNYnMj5Wt5H0shP/QQAp9+yz0jGvgz6Rc4EAl
5n0ufipZg/BTZXu1mCmFijwRLxXXuzjA9D0ClUn0laB7uDhwzV44AuqDUp5hKHM58A7T7RYY
inr0gAugN87JWBT6VeHJd8+BnQmvazuHDhBb5clO63SFwTjcW9BJuv5HyJ2SOd/SEBI=
/


--
-- FUN_INS_EMP_INCHARGE_ST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_emp_incharge_st wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
350 1b6
lnm7rxD8bKJGYe0UtxvrTQdvEv4wg2PxLiDWfHRAv/9kpTvKgVBMB1el7mca4OXboIM+7Oi5
hksno8S1nRr78mN/zWofdviB/R6owoysXAylpVJLcgeMVZ00Rbtz61UFhhkcmqjTpksNtH5+
Y/KcXrFdTZy8NC0B1BFjn75y6OlI+FHjEFzvv+wOTYJiZbZ6bWHvQKisINOjGDTC5vY03cEv
TMa9zyxmxvL3vwS2HzmxVHxGBW5tBF0YaPFzqwvM/GE3o3hhjcBxHXdQmj1NVVJUIN3xQfPw
3MjMrTWJ77svvXQX7Hn6sN/2xixmx/Y0VvnAPGI6tzGi0uvySn5eVIHp4vf/uQNai01HNy0N
wKpaLvWd+9KuYKrbjhuzDYl6kHGrj0y8mBOOEZhATRctRpUn89T4xs+orkbEvpI2nZfUfw==
/


--
-- FUN_INS_FORM_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_form_tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
194 160
HJNRi7n6k/wlBDXychOsBVqX+JEwg1zI1ydqfC9GEjNeimLfoI9AGeYo5TSfNgiX2EOgrWKo
SMpQg2xzQvnyd1x2kBpzycmIjaTeF1avCBLI66U+xgjk0Q8syEhjoHFt9qIfS1zYsRick+Gm
X+ILGAOiDTgjs16kQbYC0qhyK/q2K0CsVofk3lLWgzULeGC7otXqQrvbpnStEo2rofphM1ON
bbbV2Ziqr06riGTgEAKAdXijRGK8EX7m+BSS54Xya26bg0oYvVcoBp9wAaOOPSEiD0SYygMB
WrunQkGamhUVdCT4xF4oBy2qAgh06A+Rqv36IEFzOHu7wWw3muThQR7JHQ==
/


--
-- FUN_INS_GENDER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Gender(v_gender_cd    INS_GENDER.GENDER_CD%TYPE) RETURN VARCHAR2 AS
v_gender_nm             INS_GENDER.GENDER_NM%TYPE;
BEGIN
    BEGIN
         SELECT gender_nm INTO v_gender_nm
         FROM INS_GENDER
         WHERE gender_cd = v_gender_cd;
        EXCEPTION
                 WHEN NO_DATA_FOUND THEN
                    v_gender_nm := null;
                 --RAISE_APPLICATION_ERROR (-20001, 'Invalid code or Id');
    END;
    RETURN(v_gender_nm);
END;
/


--
-- FUN_INS_GUARDIAN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Guardian wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
20c 16d
QM+89o5A4DrjaG7eKJ3S52xTjiUwgxD3r0jWfHRAv4s+z9VaVaKYCw3WH3Tw23ZdRkjE5/Ck
xS7D/HcAtaklNSHeImwzwbW/bjTJQ6A4hZaQsVWcltHXvgDfpNtblsMGadLF1iLLFifQwi5n
hT0Vnb1n/WIRPzc+SGfkdRuYfVie17PIT64LVMWhrVSeEZ854deIcpV0qYHp8PHeXYEwmC2C
zkVJa6nPVCIpPhG6p8m9XVaOS8tMefgZ1yRpfdNWwHhhsxNR/HJLdH7PQMsQSPyH64EmiC93
p3orXCY9XPCiX2fPnS7r9QNAjbm8E3ILmbuwMx3cF1DNxVjkMGW8+XF2fmEXQJJVKP7Q1ho=
/


--
-- FUN_INS_HABIT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Habit wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19d 150
tJ8P8cEFxJ6uErSr6xmsOB0RF2owgwFpLiAVfHRVvp0VnPRmeU246dp1d0xizLDAXmGQZmHA
Z+wYNv2dT6fhMQdDhJubGW1PA6NfC9XIEMRBBdZysbsFluPqIsZE2iAJcClFq7m31SO7GfKr
gPLiKzeU5frMF6lc9Vzy+0xzXPJSK/+MRAADogBsbv9cs/Ff1pob/+alsmhZefO8584M3PK4
DKU2qP/k1FHqhAFPAH0/fUTbko6kkkc88aweDrWi6eKFC5PRMXC7Q6E9xdvQAxSh6Ch8BjNT
+WjfpS3230sFHXiMCHwd+gF1OPRS57TzksaYtnoukW4=
/


--
-- FUN_INS_INCHARGE_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_incharge_office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
387 1ad
W9YRbbm/6p31lHd6kzp4iuAsDOIwg2O3AK5qfC9AWHPVSFkUOXAU/I+DnNsJ4IBhhDjCaT1n
nGY3zrXOWuyjTWnloxjAvrH+gbQ+EmI0ZatAcky0uSIGAz8QP6oxRsQ4tOJ4yH+mMOe0n2sJ
8X5I6dfNVSq9TMhoCxZ5oPrykBlZ3Ke3sVG7OzkYAWjwky6TxTc1GkKomO36mWHb8t6DKv1S
rX5pMLQHiPS3pg712JyRbgIl7G8nBfGOieirlKyDHgqreeRu5E5ubWpHxxuPoxu2lrNkLypX
cjsoJarZGWAOyL5JgAWbjC0ts7Xbb45f0OHae8rfxAqvzrSgE3qzPAdlPju3R9zI+NYPTY1O
W+PBjDR2felUxoG2uSDj0Dcc6iMCux8O+OihTvatHGbtt6rK9MUE9OoPUWZQvA==
/


--
-- FUN_INS_INCOME_SOURCE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_income_source wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1f8 160
nliRtz6spAVCXJ3hzfe4EyQAHrwwgwL3zAxqZ3TGELmwhW1+HY1Fse5qQi5McNmNaDL8Xshh
FWe6tHVPmp9eHoMHRMtKaCSdFLUMx2E3dmr4azx57SCus88rRSDLmFGsKWD0O7qMI5xt6Q29
oDWKck6/hD0yMNe4OayoH0Dw85ghZVuGjPvzP4bhTudxotDOonYykvmfdNDVoPv/Mduvrw44
D/EYutAFM7tyDI5Gs/kofN8BCOoClm8D/7NBTtDG3dy2tl/o0cE25hOrmZXIgCqTYWb2e6dR
47Z1Gf+GV7ydN709DyAsBdMY6NgOMfuNtzHeOV1PONw8KCRLXDIYCiCWkDcO
/


--
-- FUN_INS_INSURANCE_COMPANY  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Insurance_Company wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e0 168
KyyqflNPaAKV3uqZyAabqdvHuE0wgxDIrydqfHRAv/9efWXs5njCh9nLQYzYQGDfGOsNSbbs
HDkTgnt7tAWWSLExS3833VSdIqGqPfGg8rbDgLuJqihCevU/xL/AMBAe5Be8nwmxYFA8+tPU
aXdTf7pvFAgJmPDs9pgqV0RgBWWvo0txnkHWEcJaUavRCCRK/LZI9wCPjFFWIduxPqtxa6DI
yJSTsinYFuJUsaquX+ywbGXmwE4AGm9WP4lT9xGsQi14OC/In2NLFVxFY9OKzoG6heYqfUZ/
1WzpcK2RPHQ61zQWGJiIWYm1fYdBErSycxxAHU0/ZQC7qdLtRzH8egBCiUabPR9c1CNF
/


--
-- FUN_INS_LIEN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Lien wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
191 14c
wTVatg1rayy8EkHzRix/T/HxCXIwg3lprycVZy+BbmR1DH/muglkBjiYWHU3kd9Z3y0AYmMI
yonnGD+dGxsTnrzruUcS0P4bJlS6ZXT6vjJ3QXFhmg04zWXmn3tA/ePZ+fgiR4eKvzeZL6CN
fHfy9eWRveV0OYjBfAbM2UJkTERPU6jLexXS/MzgQIMVEYR+sjCx9Kfj+u3+IRnoFucL0irO
q9Vyr5bw6eowCXNegktSLcKXbOgGBH4YruNRTaKwGGbvO3uWB2Zgys+6YMzSCJ7HJ5Ykqvg5
PyjXy8uADsm8UxdnHBVoch+SwMQQxBNM+w54OP0=
/


--
-- FUN_INS_LIEN_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_lien_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18c 14c
ru6yxsSbEU6u+/8k6Cd0eihBHE4wg3nI1ydqfC9GEjNeimLfoI9dqyNpQzJiuOrJbEntYqjc
JqhcDmsQ+WCh5Md9bttHxNnYl6egeKePhklaLP/Aiig1/0/u1VVaeciiH7izYC3ijmRlcNJi
6xGpwPqQ9Y1Q/XSrqfVYFx5dRA+ybLNPh+qt2MwSdWJ8XWJH6ty4+t+LuavcM2HmYASDImq0
zwBlzuIt9AfcXgPe4cIJFmQaoGKUj9XkW5EBdhgn7IMRlL+9ZbpA0t6NwTqb828b5LlKEFv4
Xr+p63h1SPdVe8pV2Wi8lpCavzXg5KVbL6VwcA==
/


--
-- FUN_INS_LIEN_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Lien_Tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bc 154
9hKjr9sWJYUdY4DMaRSaJjkb06gwg3lpNdxqZ3RdburOrOzyqeZklAcBhmkM9L9Dfp4Ak5Qp
a9Py8+cZriXhmKz/+ptfxhzqpAVnSmuSBIlAvzv+mDVq9rw87MgqMA1sX8pIqnt49750/dDH
L3SQfNjwtI33RHXfbU5oZxjHYGh28KcxACIvF7dWK4CgVIyyyDDTW1sppxbi2yopQYV64mkv
8ZG/yDlM+cUI+lFPHLevD18cdIqgIa8RQ3vRqF87teZ/d1Gru/bCyZsJjlLhOoFRFhgF1XWz
pb4QMf6lz32/uDAd/BdO67KFmsZuhxOwNYD6og/P+7XASAY=
/


--
-- FUN_INS_LIEN_TP_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_lien_tp_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ab 154
RR/kJq0w05goPnnZ1hr8rzG6iMYwgwHINa5qfHQCrf7qzmEr4SYFMgYvCZxgxdxDGtYTAn0v
jWBABKX43gS6DEKwfTrZt0/Zp6B4p486glosy8IexDUiGV2l04fr8Hc5oc/vRak1/ZVFCTSX
qbPEWRcdiQxgtFzmv3w99AycQmHcSKU8adNzCIHvByonKKrHdEKZA6UIDPrfZrkhLEn+lGUV
Gt0qWfjYchQiEX4G89N19oXKytUCm/LyBQn7P0v51thfhMwuXv074KfKAwFaZCtCQZaWODgV
sYbiu4/emnk4tcvoupHGpMg/nK0cKpAypE1acc8dJZcn2g==
/


--
-- FUN_INS_LIFE_CLASS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Life_class wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ec 164
g82i4oZ1n6oP+Jg8BSD9iZlNKcEwgxDINQxqZy8CAMHqR+ns5o209ghLSMnNZ2X9n3gNQUAl
wxaJjnSS+C6rKhsYu6BHvDrJi1jxMsrZcBkna0X3is7AyHPesSEvIBTv1lGCQ+19jqPz+Lx9
hIOqaEp6se6+3a1XdGMLtBawsZdiNToRNoZ2vNIk906ZUpQAj+9Sdyp0ZG16yU0dX+7brxWR
BlDgbte1ddoEQTx9L9TGmmoUSj3ELMSrbdGVN6XW290rCZSJBLrAnmtic9976RzplOlgozJW
NcHY1s7JWBT6VeHJw5273MaeM8H8psHqDiffu79n+XHo0ABBdhlFe8Y9WzsoEGY=
/


--
-- FUN_INS_MARITAL_STATUS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Marital_Status wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
205 168
jsk+PQMtFbttAfqzBHvnIgMLI7QwgwLMLgxqZy+Bbg9/H96eXOBklWpTWLQCkd9HSCcAYq8w
FomOg3eaICUYs/CP2mJq+HVCE1zYbt90Mb6BRQA6USK5RSO7eeq/wV40CEQYn3USHlBCjeYo
1zOxU8L++x487achW6jqvWo56TvMp6nfnnS+qU/OclhtbU7FI1EX17PKiA8fVJehreeEIdod
t4rMp/Q++VosvZb206xLX4B1jqCSPFArzK2J/TXjGfA38K6za3JZlT5TPyFsnicMHNllsZ5b
lq5mYMq8uhuhm0upWEgk/HPiN8SETssH733J3525Z+QNR4H9Bvo6ACCPaM/hwPICiQ==
/


--
-- FUN_INS_NEXT_PREM_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_next_prem_dt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1f8 128
mtjzWvAzwarbDcEakBjndMAR+CAwg5D3156sZy+p2rteRy5EKCazqAhLzeI+XcUexTLsDDmk
8RbWHCSNyF+lj3l1Os6LllYU61LF7uTYCAkkS+KHshm5PZSusnVsydLjoZdEZctsXFZRlw1r
oqcbvcCybic486Zp5h/yy3RrQpxizBjW1Fn0QUBB/pieMRhMVpgWyzh3SXynSrOU9RQjj7HC
vanAGQYJgL6tR+Da4j0KlSK1hvUXrbFe8iCnJRMJ4ot5+czyGYfrSQ+1fMZAp/aoqgg5sxOs
qA==
/


--
-- FUN_INS_OCCUPATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_occupation wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e0 158
inY8e3Y31O7YbAkTqZYGW/iQVCYwgwLIACAVfC9A2vjqaKypYx0L7zmGcRhjXW5BpBa3lMxc
4KHFjeS1g2xTh8V6kLsQu77Q5e9DoKjObjmqiLxzMCKuD3OBZctL06a4pWAm/wpl2w76Gbxf
YSqRgdyxudJ62m+5d1FUxsVgsX+vNcKDDBnn3oJvKihpd+RRni1q6i4tZUTuk9jMvi9HGa2k
9/9dTPFpLTqdQ1UyaO+GkKs8Vfk7h6IovNV+hiaim7bICGP1JerojMBvcS8JHn7BnGJW3kbC
nTNp8OulLVbAib0yfiyCirrwR9d5G54DAf6HbMFFL8zPkvs125+2
/


--
-- FUN_INS_OCCU_CLASS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_occu_class wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b5 150
bpGLTLhNaBMFCSuL0VOOStw/PjEwgwHINfbWZy8CEjPqR2KeYnXSBCO04gvCcBcBny4S/axh
L+ee913+sXmDBM3aYiC8EEcTNGbN8GzOe8TAERIp/JJWgVKa/gjc2DyNfeatSXvWNdqVIwow
jaaMZHVIORYfLjAj1hJzUgjH7NiM6mgEGKwkvD9dS2fNOOwLhbp1AtAPwGH7Ur9OUs686WB1
PDA3ky2B8MYo8AFXgDbHsqE2kWxeh6FI1ZfdKDyqyI1SFuVWmYxchdORYXQI68Uu60PvVlkS
MSwosndMTr1VvVkDWuLaynPRx+1IetUAaTcwzjlcOH6O
/


--
-- FUN_INS_OCCU_SCOPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_occu_scope wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b5 150
GnnDPnmTGKxkXo61ros3OYEuQlEwgwHINQxqZy8CAMHqRzu9FtussAY4kFmK5pCyAxP8ecga
5jXTLXeaIDwn69u/oxnP+HV4AdcE2Asw2p9Fu8uDeNfMKC61LQzE/C/2gX3FCVZwUDzn4vBW
gi+eDaUxpoa3vXKuuCYk0e3ZA1ybZ9Cnt33QZCxCgy85dYtUy8vJ7oacCXGi5JXPdiJkoefo
Krk4K34yiylEJhjBWnDiqPQ3kG8bBGJM10RGr5IoGC1Bd8M91FH0k/Jm3Mrtk4tCPxKymQUQ
7by7uhGSn1tzSbSf95CfyvlMi/VV9SsjDmZSgbI/gn57
/


--
-- FUN_INS_OFFICE_INCHARGE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_office_incharge wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
382 1a9
DFLqaXroHQcEVU+b/TJ+7R2Dhocwg2PxAK5qfC9AWHPVSH5sG2BRy0oQoVZsn5HaYpBWwypQ
Y1rK+SQiJRRvieVNxF3PILkeLW3cmWRfQPlOBMvG0KU8/gdVIkWYscH+nABWBKbY1j6ebHzn
oUlI6ZXNagChechoCxZWyPdPQO1YFX6hUm28A6v1sV0RiL+EMn6DacXlAOeI2S3D7Nv69ItL
YO413icPBnWfCaieLZqS6lNL6DeX36CiBLc18JLo5m180REUFcVMMMUdcdmRVXZzOczWTmiS
ynPEinldvZnEMtIFm35IbgjsaF/xCKFwDP5q6JMqBCxJn7Ba0oFoG2MypANtXdGlmY3AP0DO
ronEHe29HnAk7vkCznZ9r4uc+FMYrsTi6/yjy+paml0prq2I7ym5mXyecjs=
/


--
-- FUN_INS_OPTION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_option wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
248 14c
mQHW9rO/0XFILwYh55pSDIrbAogwg433JCDWZ3SV2k4+NERh5VUYZXEo68pEmGVboRsgjVQO
Cbe7mphGm0nMW3qQGU74kBCcsZFMrzYPnNwFuYD4u8cFv38hl0+vaRM1C9u5XzRn0/upDgoC
YH9lXGnGP8XuLfnsCzAQQBTwGQiMDi/9KLzFaIwyfMA5vsrG2Zk57x/RZD8qVNY/tGvK3SG1
n7wuq0WlEQjR5mfYWFJgx+I+HcFjEaOPtYEZYUtrLntJrclispDDzmk7775sJn/4q5TpVDxS
7GwHEFQrShV4NvGqAymGhulHtQGlTz/7ilzWzA==
/


--
-- FUN_INS_OPTION_SHORT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_option_short_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a6 150
+7RCnZaIa0k3sC2BFOdeYvCAVC0wgwHIrq5qfHSVrf5ezmEr4SYFMgYvCZxgq9xD6NYTAhbj
8sgOeaU63sSzJEewfTrBwcFdKt4XVq8FxJw8u2zPpIOPAbUcn1sITwgrfjEdUYJ9JwpUHxjq
vXxF7N4vZ1yz3SsCUB1ZHihtnN7CSrmlGWl3HoYeVJRIadp1MQTAb4s8hmf/YUnlxxJ+em+F
5wszunVxwhxXzyXOIMAGZ2crZUOJXWHodHFJTKzYWQJRl8ALoHtIZ8nZL5rYJSFMh2oVzk/B
0GE3nFA05rQ33m/6Ph0lrUcp2oY6kKR3HeqdfDnesg==
/


--
-- FUN_INS_OWNERSHIP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_ownership wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ac 150
/AZ30AR2fz+qlYQxSJwTvJUDb6UwgwHIr0gVfC+iEv/qivCixQny0E1bsTEvDEtKPNx91+Y2
ohrFJmdjnZpToDacrZMDcoyQ19XxK96scxfBg7ldkmRIv3qkg9BTnyMuhehpY7eIdOVE2eal
Vvtgun9Msi8bRZXeRMSSagbBIViAZFNpjkKqz3OFj9NjAspg9z0vYNAswDxBfIYwbjuZkUYO
r5lGjYvqq5oUp/l08+SxyIRngwEVnpweGGVL1jIowmk5kBbZY/EVF62RPHQI9afoKevvWcO/
GTTEsn74yVtz88OCodHaynPRx772dm8cyih6zx0wG953
/


--
-- FUN_INS_PAY_MODE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_pay_mode wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
32b 189
Ln3mJLlDMLoGbHC2ln3EKPBS0vswgzsJACDWZ3TNR2Slb8JczSuJ7p7oykTae8slWUkaaQ0J
alwUdDr+ACWJ0BvX2xPcM5j+QWIHiDrFyazE6CUsPYeqlIDtggUl14HyfvUV+yckpm1xWiTT
mzjL01wbJtWpWpD7E9MEBpxDIhlyAMGID+DAgyO1e6iVbJKee40hJwLgCXTvzfmAFr5sGkzE
IDvviedq5JkE14Yycc+BUj1I3TedS8U223sv8n3Igp7RraaXwuI9BbO1TBiV6+HJkcsv7OiD
/zT207CmGJNJrN+jm3uQe6llOZ/pMjTuT20BQKtjka0NEofP32xwTBOSYKZhb8Cb+jqlhzz4
A2IlOmY/0QWkc2HqBTO7vPuNr9hj
/


--
-- FUN_INS_PGID_TO_INS_TP_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_pgid_to_ins_tp_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1db 14c
M4YMCRPn7EttngVAlzhV5LQf5rwwgxBpmEoVfC80gw8tsgklXVtWGGpWrwnCLeRT2uViZ8qr
Z+H5tYp6WRTcwRXsVTFY98m2WkJV83ZPHyIPuc/akCjkUzPOUoZz+577pg9+J+1KZ17kFqDV
oFFZX+ksVi7VzUD2LkrtOCpacezWcxQCir85ClmWJRaVnvYuoVg1z8v9wxybzVPcQLwTF5Hg
C5gz0FP0tRlRlZwsVmsEgnGBSDP5wu04H4NvzctoJMGEbgqSi6cLAmN2MRTbLAIbPZbCrA5O
zHg6YFlk554u7xKoO2N1DQ9HgxZjWtLGlhfiIM4=
/


--
-- FUN_INS_PGID_TO_POLICY_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_pgid_to_policy_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
293 1a1
nGf184Oo0/nk6Qc/b2eW/zVS+W0wg43xfyAVfC8C2vjqaAn7DAdK8ARoXeH3FUxdV2tY3E1Q
39PwzKk3qpoUGi9c9d3WAQCd+Iq/n3X3IO8bzlcrCSsSMRCn9q1XMb55Oj/xl69U+2fR+lae
jzzjTQ9dg87HeUE9Gjt8EYKE6n/yEsvG9w/nCC7DxfQUQLbcMuT1LSKDZjWu7QZWUT9IaD7U
fbpTU8NyS3p6i9hAQB+qpVXUwEo5a9nfzYQj5VXMzosLJWFgkHk229MRCmxdX6wrDfDlkoq1
wSNYFeNo++a/2Dzvu6wDR8JQw+PuASMs/3tbmgr8IQ5De/9pUATf/i2bPTNT+9ge+18TwMfB
kM6lDSb+sjY+fVqdJHB6Fm4weRc+qXzvKUGM3lNUvHs0ByxjYm4I
/


--
-- FUN_INS_PGID_TO_PROPOSAL_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_pgid_to_proposal_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2ab 185
0KBXsy6z6axu5oZYKtEKwKked3Ewg5DxJCDWfC+V2vheaG/CXIhtZVNdWsjjKIiEJSlGiaDw
ieDbT2uavFDT4YSCuLdDv7sXnes69JtZZ54ZE26WQpWVxkPbDUNRoAI7wtXBb3b7pj6ABXAd
KNWNgwWh7dPZ/2uzFKNVlgFoxyHpjtnIlHMMpheBNPWV1UgdPb5AhLp/QH2IBDjb1xwWhOsf
OfqxoCCBdYw1vN4HpCdGmjAeIrAF3jDSfPzo70AiRBgw7/CRT9MNKUTrngZB7swVnCpWiTuv
xC4/o1MLwqgG7cMg2Ckvcu/99u7V2Z2wj8NAvWUnLiMc39fi14hLVrBxJ38ji64m+XqcPSwo
XNq7s9RXtr+YOUxq6yinBOz6
/


--
-- FUN_INS_POLICY_CATEGORY  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_policy_category wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
256 1a1
bbQHkB/mO6NYuFDrs28JSPOKY+Mwg43MNUjWfC+KWOqKY6xaeenH6QBT1C8Mr2Ffodn65sjD
Wj7iFiaJmh+wIb0CDP6RQhcXnxdRXzjprdZVa7MyTiYkR7zR0EVWRc0T3tBBHab9Ys7sBnEL
GuDwhHU+lyXVjvS+RyzUXsTFH9uTVOahwxuIfsjb1RScy/KwZVY6T6YM3OE3Tlngl1aaOrPq
8jw21QQoV51HGHKFKFVam5GHP6Y02OMUpqpWI+xTb1R6QpWiVGqWanQEsagJWoB6C6hN+dmt
TwBUQxhe0akHcanf2uu8H0x5q3Do1oV27Jey4t5CchTrf0+iIWyrvbMgQIoc7Fr6Y1v+DJr+
LLvdY9fqLWTVFi4NROvhO3FU5Ir/kv3RCELr3SNuRFXPHSraEyo=
/


--
-- FUN_INS_POLICY_GROUP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_policy_group wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
23c 185
ietaogCrBqcZ22qhglDYuydRrNkwgwLMDwxqfC/+rU8Gh5GkfU0SYhLjKTKZRxRx6ylBrNjF
ArNK+jad7bL2gzIOiynAnarGTCsWOGMrpT/lTFyqRYQDZJ+auYa0bssvf6a0V4R7YkYyZnmd
CUNrf/2pupgqhehBrhGZCUvuFCtui1/BkG2HDC0yDCUCvSLBp7H/5nmsuhUcUj6NH/7p+MBx
jEu4obsvu96BXAnQARpP4oQdzjTmFfdsVsqS1SmceEZueE4ondmkPJgEeRLsMAC85yH5YNgf
PmmDY2jAnCnmAiZ+mXQ32wFKSv3r3HLtaKj3G+O5wVJ2JGivojwPZPjlRkxevDXHNpPcRaKN
G4oGibMwY2L6gkg/pr+dX3k=
/


--
-- FUN_INS_POLICY_NO_TO_PGID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_policy_no_to_pgid wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2a3 195
zEfuWbURhJIe3ttp4oNzcDq2w/Iwg5DxLUjWfC9A2vg+SJmIBWuEzDkfWayiz4UEJVmwTaG6
Go6ANkA0EHnzDsyJAqrCz/6qv8HHidlnxhbuCjtN2P/1ZcabTuaNa9RQKZho1samDg6Ot1e0
8aJ9jgxTXq9cSwb8AteQgL2Q1a2Hm4ryo9SoemlPdBlOHmgX1hmVZaf/InbYZffjZ9aGfwSD
JTA7f2jpnrHfyMzyJhWOgkHSLdfyFvt8y8RTWD2/QgbvLyYSFN8wFFoayPbc84vCZBp5qfCM
ehzSefuC3qvjWbrNF/mq4mAaKpy6CVP66LgNf6WYCtHEtKxJvsprjuU+UOC/fijK/JKnGG9R
GzL013JrIr8hqISYKQhqMJCx4prpQfmmTIzInA==
/


--
-- FUN_INS_POLICY_STATUS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_policy_status wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
196 158
rDfglRhPwN/nA/jlQAi1ZwAV+rowgwFpr/JqZy+BbmR1urZp4wAwPhw819vRdzF8mCYjq/KM
Lxb0dSulu9eDGz7N2rK7ABk0WDQUzfBsznohCXiQzw2YI/jVVT8DJPUIo27qvPVRgn0tK9ic
GMG9fJLx3hRnvhGlFa05hOTIG219vU+y6TdP6KpXcWszuKNglnCFugTTSQ//3xHcnphlknPy
qkxm71mQLO6KrJV9anjw6VfarAzSvTaRbF6HoUgMl93+dw33jVIW5RaSZsWRvWW6QM5IQegp
c2JHWU4DMT2UfgX8HYMgfD1WrZ9ne42tvFLPx5ZbKYsorHML0g==
/


--
-- FUN_INS_POLICY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_policy_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b0 158
sSGy2yJweLyXF14f+EgCY/12REQwgwHIrq5qfHSVrf5ezmEr4SZfhtuoGtFtIW6FLlvakxGk
CWMmkM5JzQW3fBHqMLCF+UMxcgEug/0MpZuzoQXt+muaxAWMNCwomPVi/+JfGeO/UZnno9U8
DJVOdAQQ1yGOZ1z6rdwouOIPVu36A+nAB/5A8VQsD5rluAKDatvUyMR8DRwkiX7vzLLN8Got
+FOiYHWRUwLeTZVnhrdgH6733Q9ELOHCCRZkGqAqlI+EKSSFl8MWl758Z+mWNcnZyIfXTnqd
vEZYKSJP/nkdBbwxNbWe6FgBsKTIP6etTN+QYMtpNtG8pg8O9l0=
/


--
-- FUN_INS_POLICY_TYPE_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_policy_type_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a6 164
DZVd8Gq3qe39AUMS+LY5KyEZ+IMwgwFprydqfHRVrQ9rura0YKf2Ma/HiT1Qg2BSYYEU8iU1
DhRjVZ5z+DH2t2NHSZO7AAAAlI2n3IiyT5qkxFX3/nPiO3LkMhkgvkjKSqaP8GJYNPFKAcvu
llrRNgHM02nm6vf59hib5X8MbLGKiukqjy8X+nojr+pjHSBW5NVS9CU64MXt4Kby2k4gpeNv
kSudGsBUb4qmvJbIfF8Qbl0wvPQqKHHkyBFqKlHMsDX9/wK2cXXyKJ//HYyCyGlswks8ZGys
bveFL9sok+zorv58XlXeA/b9TfjJmXP7w4IM0UqD2q5KBJroThrdU/j7St0RxA==
/


--
-- FUN_INS_PRODUCT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Product wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1cb 15c
z4tKgN6d1tnX/yv9trBWi01Fcq8wg3lpNUgVfC+KrWS0DOnIDvK+URxfAz7V9w0NUhZu2Bi4
Z+XT9KdBMM+2EfYK9dw8/zCfyW3sDe9qaW6jrs2YxMbirc0iJQ3E4Juj2mTHfTVxc1kc4ce7
YW/Gyn0nOFTVswxsgmlc0/nHvX/5ggab4CGub85ZbnTCpUUOFZQnW/dJLYIvIL0G5lmIu71H
2dNEqCczNlKzOmTTeKvNuHU2+VH+cHCGx0OJllnXrVM/9dWO6ZQjAc0YoKs0ehgEN/V72cKK
UuHvJyQPmsuyikXJKFXzTVhK/8FXs86rvTraBYEl3miYnHTSVR80Gcc3
/


--
-- FUN_INS_PRODUCT_RATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Product_Rate wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
22a 18d
sI3wktot8VbL32drtKXtW4HVaGAwgwH3fyAVfC8C2sHqaAnzFKNjTPPWLZZ307Q8lb3N9eZG
awmNWo6S+PZJ4xrXYmG5ED8iJMFj94e6HToNOFXPA9rEgYEwOHtx3N6VStjFYxcmyonfle2M
fHhy1uR9JHYVZiZUfrieQIvwqRgAJUgY20jGRzdQnJHdiZgq0+NmU/Gl54bsbtCivz9Y2FKM
LtMmOLFcN7qJHHuCeTQCGTCmwMLrszlCtUBGfJ4BRIZfOWkERH/jTQeBZFDtqjKZ4EKxpUxR
bU/33bWe/kBXVtXuRMFhXxtrKkShfeGTV8Q9CaKWYGYMyCLtyZMzwqlYSD/LD08qdgWSNs2I
9QAT/oIOzHPo0CTNA73gjhw/+yZl484=
/


--
-- FUN_INS_PROPOSAL_NO_TO_PGID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_proposal_no_to_pgid wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
29a 16d
YXLaFBbCB+sDjlsgKw26d/xeYDowg40Jr9xqfHRDbmSlLZhZrB2cGIR9wjsJF4Chl4+RqKhQ
FHcrdPlPotfm4VnnT9OdF/gA2R4c/bHTFU7G3QfuhesFV/DGxuocYD8sQiOtejVspo9KDagu
K59fjvklIbre4ttmDmC+GY/qCYNUA97qiIjl2R7pYkg96JVnWigsKzLlUi/F4DkO6YAtDJc7
ss16cJNJ6Ul+nVxgNeJO6HdMW+hFIInL6Onl5riiNLfO3UAz3+H/Hd5+aw3DNFbSkOo/KyR9
8bYQVrXAZca/JFjVm29fYptjJq1Lu0U0qOInCIyZ5NU/TDjs79xewgUmi3k6TueFlUnrQsje
/


--
-- FUN_INS_REBATE_EXTRA  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_rebate_extra wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ca 15c
FUxzCWgBV/V05Rsotfb/bAd73sgwgwFpr/JqZy+BbmR1urZp44FUell4tphQ/0AxLgUF0y5G
rBovCs46SNjf30KwQ80SIIsuh8LAg3w0P6D5ULz44kLi3PAgvNxMRAg8mWKz97DtttLF1qli
GKNrR7YvwGOlAqags4Wv/c7QJAHkyBttEaGu7IxBLIckS6AbQ4/FPu8KZwOCfIh/BMd/E8rC
6hjuEsRmqATqI0ah15WVhBLp6apr59Tn3nR+z0DLEEjy/91EJ8WOd6d6b5Wj1YoDevQEN85I
Qegpc2JH9fiT7aQnMK08snbaUIFWrbtn5JhHOjwIGs9QgewTIJXiwIA=
/


--
-- FUN_INS_RECEIVE_MODE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_receive_mode (
   v_RECEIVE_MODE_CD    VARCHAR2
)
   RETURN VARCHAR2
AS
   v_RECEIVE_MODE_DESC   VARCHAR2 (20);
BEGIN
   BEGIN
      SELECT   RECEIVE_MODE_DESC
        INTO   v_RECEIVE_MODE_DESC
        FROM   ACC_RECEIVE_MODE
       WHERE   RECEIVE_MODE_CD = v_RECEIVE_MODE_CD;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   RETURN (v_RECEIVE_MODE_DESC);
END;
/


--
-- FUN_INS_RELATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_relation wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a3 144
cIRmb861ZQYZa+nYAASRaNZT6v4wgwHINdCsfC8CAE7VixsUSKy5szBNAVAbV2yEr+0qYCGo
f8hTCp0PVJ9r260quxAQEOtXSd6JG1MiJ7o9mjM/vpA/5egzmdl14/8DZayfnq/AljCUpoz6
WDn7ooutIaTdkKqXtXTWDcSVkGZk68bru5F1DiGP6BZlqxuv7xwDual+uIAeU4BguNkgcMJH
I3AIDOB77c0aL8hh93wV1Huw51nV7dZWw0ArGt5RkbXhZfY5tQuUQO7A+8dcJK7E5UbHXocO
vtbFwTWa+ylkWbWM+ZExpynkMZnDpskM
/


--
-- FUN_INS_SUPP_BENIFIT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Supp_Benifit wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1d3 164
rkwRxv6mmh4DwVZlnyXDa/jh4bwwgzLIrydqfHRAv/9efWXsFd/Ch9nLSu9krGDfYes7SV6n
y+HvYgVFwQ8lX9RrWX1wGppP0gxcVgDeOTInHQ0Pr5BKxsi7BYvtOtx4r1zURnatheFFyrkl
TOUahSSi8bqdKldbbbzCdP04Q/K0RMgMZtOcHSkkdJwXR2X6CFhXKZWGHnbLsRYA26LgZDhl
kYnVCtkKQgv4AQJvqN+SNraG2W1vD2zs+XGGu+MV3XuOFW0O9ZVEzuL1YqCsdjk4R+wafZP7
Oz1vJfjppwHQv3yMMxf+s3eln03+uM425RdOOFtdnQFAmbC2apDou5rk4Z6+v7k=
/


--
-- FUN_INS_SUPP_BENIFIT_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Supp_Benifit_Shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bc 15c
BS3Qi9OxPYJQMyMKYMLhxryYbhIwgwHIr9xqfC+ircHVMzyi4T7NDQaPV/bgJthiBT5oK1xe
ohRa1Q7PJH8CFEatkwNyjJBcKvoOsjd7v9iYvzPB6/RthLEiDSyKT5ix9dm8YaeZFKds0oOe
SdXuK4hXdA2Mr6but73N1egSdfwfWZxCYdyeNOuJoqrPENmGOQGpk8jocHAcJD8J/6LUKKkr
e1+GB56kFaD6YuTeYRxUz4kRhszTdQquqMpqY+esjSYmRlC6tTVJoIBvPEigjn9ts62Gyu2T
Q0K8NEACuSK/lnkd+AvHqYb9fcn3TJ9nkpOLwBn1Gb7GZsCBRIDqIH4=
/


--
-- FUN_INS_SUPP_PRODUCT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Supp_Product wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1f7 164
7V5QbQ4Z1zAxfD6oJMsqbJXF5oMwgxDINa5qfHQCrf7qzqw8oamX4rYHyEVWJfyi3GWPkWuN
HdMnsDU6c6DVUVDyA8DjBv4i2mTjGtYtNum6bSYk28QH1lMLXg34cvVJIntJSnkcMi+QhOpA
RYa1Mkgbwtmliri9X6hlr9wtGRaHNwj6RlpDZ3oHjJtGukn+znAWKbKGzcMcxE0dWfpArAIx
3bMrS2IXA8YzhjmIOKvdpEfmk7UjpaGMHoZ2PqoRNpFs6jWhOO9DL0WwvsiNCBaXvjuz5Re9
ZbpA0iONATHNlFZZc4Gb+SuvvCaHa62sJm/ZOFsaTwFAXesxwdpMZL7OOW4/Rqs=
/


--
-- FUN_INS_SUPP_PRODUCT_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Supp_Product_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
206 171
p0ZuZtuSQpvY0UEBTeRPuSRbOwwwgxD3Na5qfHQCrf7qzqw8oamX4rYHyEUhJYui3HuPkWuU
vRQRsPCb+N7qomuQS8DjBsGWlpaTNXsEDMgqjXX8yrwxzdvNHsIxP4XuYyPQeAaZwdstLpmk
orBQp2ufOiSQCveKenp7bh0LFnVwjFTBGB9wzyFmkm48AE4kcLB7ZpyzYhmIGEX3OL9W0NV3
++j1hK8V9PYHs1/NIwZwEZrBheeGykhw0/+bFzksIUXRBTebbWBnKwmUiZFhDo7mEiGUwmUc
6a3EZaMyVjXJ2S8P0fEUvrypWCYiTxmHDLQ8Q4J3EnxDfhkSZ5Lf67VnzwY6O8JekBD7p/P0
3w==
/


--
-- FUN_INS_TP_CD_TO_INS_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_tp_cd_to_ins_tp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
173 128
3D65HY4OAA2g2e11CeXopPZjKYgwg3lp2pkVfC+f/2RT6REfW7EGUNQKsqCc8QfQPtZmV1RE
HrV4s98rfC9TmLtS0CXTeObTbk+QmPUosZpVCF2SBXX16lph3Mif6DLPsqypfl4O8oimFiEr
837HlQpxYlhQa6s6d85W2/m6jbaAF8ti0WZ6KN7UnmjnnpcEzrAtYEg51ngSpuaVhZoi88WN
5Jr1kYrFw84ygdU7cMJwbzBTwbRAA0tNqMjU1YFpCH+VQflmMnPz8Xh1dhtYX3XJVt0DH3oU
h70=
/


--
-- FUN_INS_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_tp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
174 11f
8oCvISHuae6+s+mq5FAIs/jytEowg3lpDJkVfHQzaA/3bUtMejCkHGHsvhWnSiLPbiO2elc2
gbUT/Nj9BBYUOhzeCRLx3N6sTsfnnO4cHMR8cagFW+nfUyKFYhbhm0wCGx+mcFBChEuW8H7y
A2+XGEJ8SSYmhsWL5DQ+oeC4sBzqvYfUwi+UuY7pAfJXVmEWVRGlydBnilcAT7cOg321hJ1f
hNY5quI0jzkbHm/3B4D0EDRtWqvhzVTexsvBicmbEIMz7xTfdW4+E89/lqJGH5YnvZM1
/


--
-- FUN_INS_TP_SH_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_tp_SH_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17e 12c
IB0CGdel3iC1YJGGKteE4R/GuY8wg3lpLpkVfHSBaA/3bUtMejCkHGGrTDjo783kV4EbMLjn
/LV4AQN+EQ6lm5uHJZGx9zPU03GaEFOBcqUjNuoH+csxfwTAr8Q1IK8vab9NyMdEpl+8C6wL
+kXRQjtfXk4vLsAMeHvn815CpJwaf84MbdXqujMJTNTYaZS5sukg4dPL/XcirMx6my1rxCTW
CTLGM7V3ZAbD74ZNBKdo3ZFDZvyl2C3wwcz6hHDtV1WF5+ghXkh3Idb3Gq9dwzHknEJrUeAI
+5B1cSA=
/


--
-- FUN_INS_UNIT_OF_MEASURE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Unit_Of_Measure wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17d 15c
BOIniretOPwI9VIw4pnplQ/t6iwwgzLIrydqfC+iEjPqR2PbN+hTvkAcw0JV5waN92OgrWJr
n6hpdlrsP6o7tAgmRDdQvFgxTJQ3DXinzHF7f1WT5r/Ob/g+AZgkD9xiJTs234f1y2pzJgew
YhoUXFuA0O+8/pgYi7hd1gt+jev2Q6dpMmUbuPS1c3GHcwpdAoeySQSWDuiy3tC6rDggf0Rg
Ne5+OupIkSD2wEYF5HJ1n5NsDr8uXHEAnmQJObr6jeoJtN2tzw+rDl7oG8xcDX+j6dDIxzyo
TFYDVhIj3Uf1JPhkhNbQC+sGMKzeyU60RgsK7q4l3opBorj+mant3hw=
/


--
-- FUN_INS_UNIT_OF_MEASURE_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.Fun_Ins_Unit_Of_Measure_Shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19e 15c
q9TC+W/dd17R7hfbg5Yf15L/ntgwgwFpLvYVZy/NrZ3gSBtQ5tLFAH54t8mvR0AxTM15L7Ym
UGBQg5qaooy90pCn/n+CIE5ng/0MyA+jf82T5hLO85icwjFBlrBgaBf4sgij4YiWe9bL9pVF
aTRaqbNb6Fv7l+nW65TmbHRTHgh6Lqez/bz9GCM/z0zuuAKDahQghbp13HbXrQWHv3iziwlR
wDdS9X6ekUb4VWSlfUs0I6WECz3qLLa3FPuT+onq8QVniM5KkiCRAXYY5eWNs+VPbIV+iAac
6ezoThd1WDO/+DJNOL/Y/VdB3XcDkbSuaqjErl+wKtoMliRz+wL7FwY=
/


--
-- FUN_INS_YRLY_NO_INST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ins_YRLY_NO_INST wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
171 117
P3jaww3609g+OOit+BgWap+kY0kwgwHI7cvWfHRG2sE+ehWDSk2E5+jKRFtYRqf6umPRVlya
nWvD5KB46byuH0/ZZ9SxSo/5q0N/IgFw2uetJiZOoZY7HBpSRBg+yuWxfsXXxo4EEHDhni5K
dEVe/aertCfJ8V7sJnaWKibeU7wi/FBRCEtzpCeby58t1Q/C9mZQYrknTNWRRs0GF7SU+m9v
IDkFJrysD5WJtP+ha+2nJUTF3cazJFqvg63zKf0AmhsxOxzZrvnussA0VJw=
/


--
-- FUN_INVESMENT_AUTO_RENEW  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_invesment_auto_renew (
   p_inv_cd   VARCHAR2,
   p_fdr_no   VARCHAR2
)
   RETURN CHAR
AS
   v_out        VARCHAR2 (100);
   v_inv_desc   VARCHAR2 (100);
   v_count      VARCHAR2 (100);
-- l_biz    mis_year_row;
BEGIN
   BEGIN
      SELECT inv_desc
        INTO v_inv_desc
        FROM acc_investment
       WHERE inv_cd = p_inv_cd AND fdr_no = p_fdr_no;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_out := 'This is not "3 Months Auto Renue"';
   END;

   IF v_inv_desc = '3 Months Auto Renue'
   THEN
      FOR i IN 1 .. 3
      LOOP
         v_out:= i;

         /*IF v_count = 1
         THEN
            BEGIN
               SELECT ADD_MONTHS (inv_dt, 3)
                 INTO v_out
                 FROM acc_investment
                WHERE inv_cd = p_inv_cd AND fdr_no = p_fdr_no;
            EXCEPTION
               WHEN OTHERS
               THEN
                  v_out := '"Investment Date" cannot found';
            END;
         END IF;*/
      END LOOP;
   ELSE
      v_out := 'This is not "3 Months Auto Renue"';
   END IF;

   RETURN v_out;
END;
/


--
-- FUN_LAPSE_YR  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_lapse_yr wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
498 217
DfHmkj7f88jMlBXFKH9/SL6OBdMwg/DDLq5qfHRDaA/uBSsWJZItssNGiWwcwye3xS43kGbL
uObnN1elu6GDSPbETeWuZC1zQXkxVTxu5Vm4MLVzdyxkDyQgkrv9ixymiUUU2kznQOxltP0Q
FGURVa0mifT6df9TNXF16ocf/WhbacyO7PMCuCH4KTo8lsw98b+IHCaKBbeoYtV32iZcQlkn
CyUQ22dhfJVP6SF2WhRux36lqIbf4hV2JsJsqCouFc9QuKYD6VeZyl9WGHSjky/9L7rIVA9w
VE40KegDDLFxo6rUjbinmkXECY7dJ/Gwh2R78sWKs/0SP6K5QRUARqgv/2gZ2uPxqLd/AfpR
KeHMehsvZGjhCPU3MK0byGhTRPEp4fojWXANuJlWsJlWIMY2PPe6j5HAdeq0iiu7iK3akxpq
Y195UHG9Vbk/Hc1zg1wkaOiTyd5+i/i4KpGB7qvmnBqtVrDgv7NzU3dqHxhjc5Uw+K+96y1+
/1VhGTK0Q9FZ4RcplSRr4y8+
/


--
-- FUN_LAPSE_YR_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_lapse_yr_tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
3e9 1d6
vQQGOSM+qMIbRQBoCwlhAlPpxGQwg/BeLq5qfHRDaA/uBTn8OHO0OcXml9PQXCfrxS43kGbL
uOYRBobdncYpgzuQUeUiADGWP3L37Ttssd6o7nP+6880HLyaR5qcOq3daB2pJYl+IJvmDu7h
RY/a6OQLrQuNG9zFWcW9+qzCwv94TTT22WlN9myYjgp+ufSHjZTs7WVFeip5raHGBNLX+o9Y
La/Gw6OHAojALmfKSdB8LM6BOGHnySI2a+moa41E8zeFrLQ8z/zsAfCx30hxC6QeJncC62gt
NFzpy1HJkwaBaFIrOGQAlU7LYxLUW+fhcAlTCv4v1GrcjoPfmbCZRrN1Z6DAmaLrRFFDdWfP
Hm/jsJnbHn83PRViS27RSzT9tlQHSDdtT2rYFcnEI96JBuD33L+PaA4zIznb22ofSmPtk2QT
jMod5b5iHhqUfiyWfTeO+j0kAbzBVQ==
/


--
-- FUN_LAST_DUE_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_last_due_date wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
4b8 24c
VpZkE5wWbW+2pbyzTmxxwh9VQFEwg43DACAVfC/Nbg9SuvHFa8UL70Av/UuOBffNUGWQyA5e
PWNLgcaxn7zz48C3MrtVTk5VbAqjjkCh+0/BIOSDtW6luCIGOKp75qCV8qfYtGvIS9dcLfo9
esumZ8xe1fsUeCFwgwEj5WsY1pnMTmxcL9eG2Gxd2l3xaVbjSfUY75fcjbllkeYTCqsCXXb0
xs9XW2LDi4PKJj5FcShiKey9gH0o3yFi3jipXCM856Mn4WDgv0+EaIQG27dg/7em1K/FIv0T
ucwbX3bkG+v5FOtIcRHcBVAL1Wy+jT1Ua+KtsCfBNGwu5ZTHP0Ws/rJcoC2dyTZvS+VEI8B4
XqCWM7QwUAhwGx9dmzor1ABCifqsDgMAkN0F4GnCHzpxd25VtFVjEL/m5hUwg0QsnZ0v6O4y
DrH6vS3JRjF9LYuNUQXzLrH+iIfBCB3hJkNq2TuvVfDOQTFpMVqtKNbGMn726wVD17/pJJ6j
vk9nDEsK72fOWENT8Q3KYnBWfOOgqvvMnAHf4omn6NKd8k0RH01EUW1iwvlWlWS5FE8Ac/u3
Nr17
/


--
-- FUN_LNRECV_INTRST_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_lnrecv_intrst_amt (
   v_office_cd      VARCHAR2,
   v_vouch_ref   VARCHAR2
   )
   RETURN number
AS
v_intsrt_amt number(15,2):=0;
   /******************************************************************************
    Ver        Date              Author           Description
   ---------  ----------    ---------------   ----------------------------------
   1.0        03/08/2011    Masud            loan recovery interest
  ******************************************************************************/

BEGIN
   
  SELECT MAX (DECODE (a.cat_cd, '77', d.credit_amt, 0)) interest_amt 
             --MAX (DECODE (a.cat_cd, '46', d.credit_amt, 0)) principle_amt
        into v_intsrt_amt
        FROM acc_trans_detail d,
             (SELECT cat_cd,
                     DECODE (cat_cd, 46, dr_glac_no, cr_glac_no) acc_no
                FROM acc_setup_dtl
               WHERE office_div_cd = v_office_cd AND cat_cd IN
                                                                     (46, 77)) a
       WHERE vouch_no = v_vouch_ref AND d.debit_amt = 0
             AND d.glac_no = a.acc_no;
 return (v_intsrt_amt);
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN null; 
      --NULL;
END fun_lnrecv_intrst_amt;
/


--
-- FUN_LNRECV_PRINC_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_lnrecv_princ_amt (
   v_office_cd      VARCHAR2,
   v_vouch_ref   VARCHAR2
   )
   RETURN number
AS
v_intsrt_amt number(15,2):=0;
   /******************************************************************************
    Ver        Date              Author           Description
   ---------  ----------    ---------------   ----------------------------------
   1.0        03/08/2011    Masud            loan recovery principle
  ******************************************************************************/

BEGIN
   
  SELECT MAX (DECODE (a.cat_cd, '46', d.credit_amt, 0)) principle_amt
        into v_intsrt_amt
        FROM acc_trans_detail d,
             (SELECT cat_cd,
                     DECODE (cat_cd, 46, dr_glac_no, cr_glac_no) acc_no
                FROM acc_setup_dtl
               WHERE office_div_cd = v_office_cd AND cat_cd IN
                                                                     (46, 77)) a
       WHERE vouch_no = v_vouch_ref AND d.debit_amt = 0
             AND d.glac_no = a.acc_no;
 return (v_intsrt_amt);
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN null; 
      --NULL;
END fun_lnrecv_princ_amt;
/


--
-- FUN_LOAN_LAST_REC_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_loan_last_rec_date wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
d6b 406
Spa3cN6qgGxw7TzTGCSN/08NNjMwg0MrACAFfC/N2A+vYgmMGp+s0VJ2Z6dNVKYu5RRDIbdw
oCnDoGcT+bWbXuhal0Bl9T5bDG8sLND+uUrqv1Ndsq+PBU8sc/5PWwjHznODtSM6JaoANLyp
IfumoBD4tMPdLPispwWsGV2ramnQ9NCvVUgdJjVpVDOyi8jm1PjgxoQ21m5byPNR/HCaJTmc
Lm1wjjeeLcN+6TPIIv6NGWPFVyFOmDltKa7AE6/jfx1JaIPFLxpqaICJNmuGw4rY0/uN9hK+
eOOTqDrZ4aT7/889Sy6AiGg1+8KmOlllvQ7Iv44eKLK3DzMVYhpIzs5x1pPKTNHAuLc7Vm+e
yoZE5rnLm2svq2yQpOffrwQ4HdGGBO6iGAH4BAH8EWsGTuOYDVeinornzXtSjX6PC9ZsSjUm
HU3iW/50ir7O/BOQ1i1Y9AaO3Mo3B06FJk6PbuwO6JFbo6ygs9hoFeW2CLpSNsUCMIOelgzV
Aeg7LpcpDQ7djXWzOg1hWItHYwZY5YwPEiKH1gEGARpxL6GVsl2uL+BLfJg6JRIhWPhPUPTN
LMkgT6O+5IWYdCb/0N5kcoslkgQyoFlOzcywxHur6ZqFBplzOava4THi3WUMi1iC1XCKmBgC
BpN51XSPpB3+KI8Gi+CNWqJeB+lqoo6a5n5aQKKxC2Y/1N47l+gLbqG7uMw0aUUMchthHLAl
BYHgevpMosju3o8aZ52CSjwLUaUZOwuVcycVKtVqWyScS40etrFEBHBmOOkPbQrrrZ2MsCob
TaYVyJVn0NWBnvMDJ26Tf07195lUIBZeZBwGgoobRhyzOQZlCYFllomM6oNVeyVizgfq6Dbw
rmrbY/R+O/34VDu4BXX4VPgyCWtNLT9VWozXX9DTuWtlZhR68HEou0nS2szoIjb+gRTfcPor
xpZKnHImXYHP0fS9EwRDJFwV0Pe1ceOGJHgtLsekhg9sjJfoJ6vzGGk91tolBMtYquDwFuq7
+eH5pzla
/


--
-- FUN_LOAN_RECO_LOCKING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_loan_reco_locking wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
8e4 3b5
LiDJooI8EP/IRztnVGKQtKC0ic4wg42nNbfsfI7GEoteNEF3JoZ93K4yetsE6oMvEdOKij4L
jWFh0WHiHDMFIOZntme/E4hGXXNCljpzHVeuiKc4R4/GPuqYc8XqB37tseoeJAXkSfUdplrD
wCz/3aDIN3kM2wjhCJi8lOflVIq9VKsuvZZqUsW3w/zZU84yuSgjYK/0Wa3W3nZerFQvnoJT
w1fcWHrBrLkRtP1bYS76EIVfl3asaaxsVEK/wxohXvdSjdtKR0J2++j35gNyJsgY1OP7zR+E
dVF8Cb0jZ17ydwA4yI54ELov3KnL5eOHizbTsPZeHeCCjGUOG2x/luC9LsUr3F9iPvVtX/M4
Cb30kcWSUDiQQTwet4cDk//kWZHhhIJmH0ZEAVGfNjuOxS9mQ5d2BMxuCcOK4Wgk9n6jpHiJ
X1psblbVyS4xVo7riZmUvZNRx31rFGvl5qmQuWzQlV29trAFc1AK9gVwD6xutFjE1v4xhkSv
D8MWovIhqtc/ETEo2rw0da3QnJHoAaWH1SKnuaCrw059py6xbuVH8uAj3wbluouTx/V4dMeN
O9S+2prg1B0sxwsXhjWyuGpNBhWCwjowdOxInclTwTpcmLWaCMR1P9f+6IFkU6oLHSEzpklU
rgckzmYesTJgQ8BI+8VseyS9nKLpCF8EFr+Q341gzg0OFxnqL55z7OigDVFcISmHlyZtyV2v
O047sBbKscDsQl/tNeZEJgr/D2OutyNNEaTlnUCloPmNedyYdGGucCIYMTm8JGo+D3k/T0FK
RbCGtdyI2P6YTGEiSP5CsCujlnxu2gvwvle2vpMhMbthHhcWjhOKu/y4z0ebjLr/ZEMfI/aU
Unt2ws+3pIMnV0RuiiAu8L8KzQvveY2CTboAns+q2SS98bAaItZlIYAjhQzlcoa/ljGi4T0=
/


--
-- FUN_LOAN_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_loan_tp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17e 11f
+c3+6BF1GgTPJgPuRSbqmM+1WEcwgwHIALasfHRAkPjVwjBbbdbVwWkML7l8zY1vAfy+Vz57
fbXEAC3SfF7xSSC8xQwVIfGPkhxVzVKIVR4p1NqRlw3xt4KX9NOrrEH2zMft14imESErcq3U
mMjNjEZKIsPPddPWFddfPKjRtCUzMBEWoPRKxMu6jtTaA89mj5xlwH8qwvLZnZQ/pcOM1Bpj
nSBbKb7pTdsDZ5QialEYqRrVvu7i8aeXvQQoBnHKBWEPADoi+mTC9XI0cDdkIiiYun8=
/


--
-- FUN_LOCKED_POLICY_AUTH  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_locked_policy_auth (
   p_pgid   ins_p_summery.pgid%TYPE
)
   RETURN VARCHAR2
IS
   v_auth_cd   VARCHAR2 (10);
   v_emp_gid   NUMBER (10);
   v_return    VARCHAR2 (100);
   v_count     NUMBER;
BEGIN
   BEGIN
      SELECT emp_gid
        INTO v_emp_gid
        FROM security.sec_user_info
       WHERE UPPER (user_nm) = UPPER (USER);

      BEGIN
         SELECT COUNT (1)
           INTO v_auth_cd
           FROM clm_privilege_emp e, clm_privilege p
          WHERE e.prv_cd = p.prv_cd
            AND auth_cat_cd = '31'
            AND emp_gid = v_emp_gid;
      EXCEPTION
         WHEN OTHERS
         THEN
            v_auth_cd := '0';
      END;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_auth_cd := '0';
   END;

   IF v_auth_cd = 0
   THEN
      SELECT COUNT (1)
        INTO v_count
        FROM ser_lock_policy
       WHERE pgid = p_pgid AND status = '1';

      IF v_count = 0
      THEN
         v_return := '1';
      ELSE
         v_return := '0';
      END IF;
   ELSE
      v_return := '1';
   END IF;

   RETURN v_return;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END;
/


--
-- FUN_MATURITY_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_maturity_date (v_policy_no VARCHAR2)
   RETURN DATE
IS
   v_policy_term     NUMBER (2);
   v_pay_mode_cd     VARCHAR2 (2);
   v_yrly_no_inst    NUMBER (2);
   v_comm_dt         DATE;
   v_maturity_date   DATE;
BEGIN
   BEGIN
      SELECT ips.comm_date, ips.term, ips.pay_mode_cd, ipm.yrly_no_inst
        INTO v_comm_dt, v_policy_term, v_pay_mode_cd, v_yrly_no_inst
        FROM ins_p_summery ips, ins_pay_mode ipm
       WHERE ips.pgid = fun_ins_policy_no_to_pgid (v_policy_no)
         AND ips.pay_mode_cd = ipm.pay_mode_cd;

      /*v_maturity_date            :=
             ADD_MONTHS (v_comm_dt, (  v_policy_term
                                     * (  12
                                        / v_yrly_no_inst) ) );*/
      v_maturity_date := ADD_MONTHS (v_comm_dt, (v_policy_term * 12));
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;

   RETURN (v_maturity_date);
END fun_maturity_date;
/


--
-- FUN_MOBILE_NUMBER_VAL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_mobile_number_val (
   p_mobile_number   IN   VARCHAR2
)
   RETURN VARCHAR2
--If  return value'1' then it is valid when '0' return then number is Invalid
IS
   v_status          CHAR (1);
   --If v_status return '1' then it is valid when '0' return then Invalid
   v_count           NUMBER (2);
   v_mobile_number   VARCHAR2 (20);
BEGIN
   v_mobile_number := p_mobile_number;

   SELECT COUNT (1)
     INTO v_count
     FROM ins_mobile_no_config
    WHERE code_number = SUBSTR (v_mobile_number, 1, LENGTH (code_number))
      AND number_length = LENGTH (v_mobile_number);

   IF v_count > 0
   THEN
      v_status := '1';
   ELSE
      v_status := '0';
   END IF;

   RETURN v_status;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN SQLERRM;
END;
/


--
-- FUN_MOD_PERSISTENCE_RATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_mod_persistence_rate (
   p_dev_emp_gid   NUMBER,
   p_dev_emp_tp    VARCHAR2,
   p_end_dt        DATE,
   p_pers_type     CHAR                           ----'1'=Previous,'2'=Current
)
   RETURN NUMBER
IS
   v_issued_policy    NUMBER (10, 2);
   v_inforce_policy   NUMBER (10, 2);
   v_persis_rate      NUMBER (10, 2);
BEGIN
   IF p_pers_type = '1'
   THEN
      IF p_dev_emp_tp = '05'
      THEN
         SELECT SUM (issued_policy), SUM (inforce_policy)
           INTO v_issued_policy, v_inforce_policy
           FROM (SELECT CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -24
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND ADD_MONTHS (p_end_dt, -24)
                              THEN '1'
                           ELSE NULL
                        END issued_policy,
                        CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND p_end_dt
                           AND (   s.policy_status = '09'
                                OR (    s.policy_status = '00'
                                    AND policy_status_dt > p_end_dt
                                   )
                               )
                              THEN '1'
                           ELSE NULL
                        END inforce_policy
                   FROM ins_p_summery s
                  WHERE s.comm_date
                           BETWEEN NVL
                                     (TO_DATE
                                             (   '01/01/'
                                              || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -24
                                                                   ),
                                                        'rrrr'
                                                       ),
                                              'dd/mm/rrrr'
                                             ),
                                      s.comm_date
                                     )
                               AND p_end_dt
                    AND s.agent_id = p_dev_emp_gid);
      ELSIF p_dev_emp_tp = '06'
      THEN
         SELECT SUM (issued_policy), SUM (inforce_policy)
           INTO v_issued_policy, v_inforce_policy
           FROM (SELECT CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -24
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND ADD_MONTHS (p_end_dt, -24)
                              THEN '1'
                           ELSE NULL
                        END issued_policy,
                        CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND p_end_dt
                           AND (   s.policy_status = '09'
                                OR (    s.policy_status = '00'
                                    AND policy_status_dt > p_end_dt
                                   )
                               )
                              THEN '1'
                           ELSE NULL
                        END inforce_policy
                   FROM ins_p_summery s
                  WHERE s.comm_date
                           BETWEEN NVL
                                     (TO_DATE
                                             (   '01/01/'
                                              || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -24
                                                                   ),
                                                        'rrrr'
                                                       ),
                                              'dd/mm/rrrr'
                                             ),
                                      s.comm_date
                                     )
                               AND p_end_dt
                    AND s.do_gid = p_dev_emp_gid);
      ELSIF p_dev_emp_tp = '07'
      THEN
         SELECT SUM (issued_policy), SUM (inforce_policy)
           INTO v_issued_policy, v_inforce_policy
           FROM (SELECT CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -24
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND ADD_MONTHS (p_end_dt, -24)
                              THEN '1'
                           ELSE NULL
                        END issued_policy,
                        CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND p_end_dt
                           AND (   s.policy_status = '09'
                                OR (    s.policy_status = '00'
                                    AND policy_status_dt > p_end_dt
                                   )
                               )
                              THEN '1'
                           ELSE NULL
                        END inforce_policy
                   FROM ins_p_summery s
                  WHERE s.comm_date
                           BETWEEN NVL
                                     (TO_DATE
                                             (   '01/01/'
                                              || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -24
                                                                   ),
                                                        'rrrr'
                                                       ),
                                              'dd/mm/rrrr'
                                             ),
                                      s.comm_date
                                     )
                               AND p_end_dt
                    AND s.dm_gid = p_dev_emp_gid);
      END IF;
   ELSIF p_pers_type = '2'
   THEN
      NULL;

      IF p_dev_emp_tp = '05'
      THEN
         SELECT SUM (issued_policy), SUM (inforce_policy)
           INTO v_issued_policy, v_inforce_policy
           FROM (SELECT CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND ADD_MONTHS (p_end_dt, -12)
                              THEN '1'
                           ELSE NULL
                        END issued_policy,
                        CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE (   '01/01/'
                                                      || TO_CHAR (p_end_dt,
                                                                  'rrrr'
                                                                 ),
                                                      'dd/mm/rrrr'
                                                     ),
                                             s.comm_date
                                            )
                                      AND p_end_dt
                           AND (   s.policy_status = '09'
                                OR (    s.policy_status = '00'
                                    AND policy_status_dt > p_end_dt
                                   )
                               )
                              THEN '1'
                           ELSE NULL
                        END inforce_policy
                   FROM ins_p_summery s
                  WHERE s.comm_date
                           BETWEEN NVL
                                     (TO_DATE
                                             (   '01/01/'
                                              || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                              'dd/mm/rrrr'
                                             ),
                                      s.comm_date
                                     )
                               AND p_end_dt
                    AND s.agent_id = p_dev_emp_gid);
      ELSIF p_dev_emp_tp = '06'
      THEN
         SELECT SUM (issued_policy), SUM (inforce_policy)
           INTO v_issued_policy, v_inforce_policy
           FROM (SELECT CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND ADD_MONTHS (p_end_dt, -12)
                              THEN '1'
                           ELSE NULL
                        END issued_policy,
                        CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE (   '01/01/'
                                                      || TO_CHAR (p_end_dt,
                                                                  'rrrr'
                                                                 ),
                                                      'dd/mm/rrrr'
                                                     ),
                                             s.comm_date
                                            )
                                      AND p_end_dt
                           AND (   s.policy_status = '09'
                                OR (    s.policy_status = '00'
                                    AND policy_status_dt > p_end_dt
                                   )
                               )
                              THEN '1'
                           ELSE NULL
                        END inforce_policy
                   FROM ins_p_summery s
                  WHERE s.comm_date
                           BETWEEN NVL
                                     (TO_DATE
                                             (   '01/01/'
                                              || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                              'dd/mm/rrrr'
                                             ),
                                      s.comm_date
                                     )
                               AND p_end_dt
                    AND s.do_gid = p_dev_emp_gid);
      ELSIF p_dev_emp_tp = '07'
      THEN
         SELECT SUM (issued_policy), SUM (inforce_policy)
           INTO v_issued_policy, v_inforce_policy
           FROM (SELECT CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE
                                                (   '01/01/'
                                                 || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                                 'dd/mm/rrrr'
                                                ),
                                             s.comm_date
                                            )
                                      AND ADD_MONTHS (p_end_dt, -12)
                              THEN '1'
                           ELSE NULL
                        END issued_policy,
                        CASE
                           WHEN s.comm_date
                                  BETWEEN NVL
                                            (TO_DATE (   '01/01/'
                                                      || TO_CHAR (p_end_dt,
                                                                  'rrrr'
                                                                 ),
                                                      'dd/mm/rrrr'
                                                     ),
                                             s.comm_date
                                            )
                                      AND p_end_dt
                           AND (   s.policy_status = '09'
                                OR (    s.policy_status = '00'
                                    AND policy_status_dt > p_end_dt
                                   )
                               )
                              THEN '1'
                           ELSE NULL
                        END inforce_policy
                   FROM ins_p_summery s
                  WHERE s.comm_date
                           BETWEEN NVL
                                     (TO_DATE
                                             (   '01/01/'
                                              || TO_CHAR
                                                       (ADD_MONTHS (p_end_dt,
                                                                    -12
                                                                   ),
                                                        'rrrr'
                                                       ),
                                              'dd/mm/rrrr'
                                             ),
                                      s.comm_date
                                     )
                               AND p_end_dt
                    AND s.dm_gid = p_dev_emp_gid);
      END IF;
   END IF;

   IF v_issued_policy > 0
   THEN
      v_persis_rate := (v_inforce_policy / v_issued_policy) * 100;
      RETURN v_persis_rate;
   ELSE
      RETURN 0;
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN 0;
END;
/


--
-- FUN_NEXT_DUE_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_next_due_dt (
   p_comm_date          IN   DATE,
   p_next_due_inst_no   IN   NUMBER,
   p_yrly_no_inst       IN   NUMBER                       --1 details, 2 short
)
   RETURN DATE
IS
   v_next_due_date        DATE;
   v_cur_month_last_day   NUMBER;
BEGIN
   SELECT ADD_MONTHS (p_comm_date,
                        (p_next_due_inst_no - 1)
                      * DECODE (p_yrly_no_inst, 1, 12, 2, 6, 4, 3, 12, 1)
                     )
     INTO v_next_due_date
     FROM DUAL;

   SELECT TO_NUMBER (TO_CHAR (LAST_DAY (v_next_due_date), 'DD'))
     INTO v_cur_month_last_day
     FROM DUAL;

   IF v_cur_month_last_day >= TO_NUMBER (TO_CHAR (p_comm_date, 'DD'))
   THEN
      SELECT TO_DATE (   TO_CHAR (p_comm_date, 'DD')
                      || '-'
                      || TO_CHAR (v_next_due_date, 'MON-RRRR')
                     )
        INTO v_next_due_date
        FROM DUAL;
   ELSE
      SELECT TO_DATE (   v_cur_month_last_day
                      || '-'
                      || TO_CHAR (v_next_due_date, 'MON-RRRR')
                     )
        INTO v_next_due_date
        FROM DUAL;
   END IF;

   RETURN v_next_due_date;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;                                                ---SQLERRM;
END;
/


--
-- FUN_NOMINEE_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_nominee_name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2bd 1ba
4vsrigtcufLPjyM1/mghmDu4MYYwg/DxLgxqZy9AALtkdW0aRPOUrkAcPIoashqCOMKhzd4+
BMxLvXczj514BdAhJpy53u5CwVgxOIasZhN8r8binzID+eUKlz0KMkTvRKZj2ej0N2qh5/Ji
s1nZ65AHWNmgtGNtRy+sr1QfJgKP7q1pCyyUoAJutsX60DPtqdJ2/hhoDdyJbqGw/hef9pyI
QPyUsL06RbklQXZeX9hP6G0s9B+jvBHrLVQw+WTB9NHJFj9Rc4ZJsGL1DQ769aTvT307BmWN
sEpT8HpAQY+6RlgPU/x78y/ajDuffx+RSt1hj9irfvwB4fsquuMTTHMcRhC3AZ/HLgxJNIVk
gjHoN4Hl+aQY8pBvfWlGQ3suvpIZXKkT11BqeVhxrb0gJArXcmsc+kbl/sdgc9JXw0Ga5PuJ
WOgs
/


--
-- FUN_NO_OF_FIRST_PREMIUM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_no_of_first_premium wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
8ff 227
nXm5GFyu71N3WCwyO9O8vTqdgbEwg82NmEgVfI5A2sE+NPdapKmHQGCIbl1GVBjQ78b7rwYm
WnRn6dn4sUDIExGDawzV/y+V+Z12weS8bGxgGL0UHobcuzMjnTwe1+5zhJ2kh8QThqdTy6gU
sdPAqI0r2XZalMfFjImXKXMCdVh6oxS9OqxUvRqTW322RNcOBBTmoX/yB2D0vkEtdaCMruO7
4+YpdeUMY3TXamHVlHxI+g38MCunDvL0NgwcrPVUOPiL7DgUVxGX6fSX0m4BBtzUHEK9hbS/
7Ofw9xEkC6FyzqlfG+8KTY7cRvThZeOO9Nz0VfTByJJkjX3QcW30jmgvAt8Np27WcYca6Z7T
WXv/cipADm+mtGUC4Ghla9xC/CSWrCen1v/lpWK9k1I75SlPO+WZ4nvDVavFc+6qnBkC7HOk
oL/4yCTQeKojaR7ndHtJBsjwrnj9qicLHwritw68k0BxP7y+5AzR/pGzhVFYNox8A/zNEjLN
RQAMAJotwwlRYDhAPb231CZx4Rds/rsi+5oXZmw=
/


--
-- FUN_NR_RECEIVE_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_nr_receive_dt (
   p_gid            IN   VARCHAR2,
   p_clm_cause_cd        VARCHAR2,
   p_clm_detl_cd         VARCHAR2,
   p_file_tp             CHAR
            --Here p_file_tp FILE_TYPE='1'=Claim,'2'=Surrender,'3'=Policy Loan
)
   RETURN DATE
IS
   v_nr_receive_dt   DATE;
BEGIN
   BEGIN
      SELECT TRUNC (recv_date)
        INTO v_nr_receive_dt
        FROM clm_file_tracking f
       WHERE file_type = p_file_tp
         AND pgid = pgid
         AND clm_cause_cd = p_clm_cause_cd
         AND clm_detl_cd = p_clm_detl_cd
         AND recv_dept_cd = '01'
         AND recv_date >
                (SELECT MAX (send_to_dept_dt)
                   FROM clm_file_tracking t
                  WHERE file_type = p_file_tp
                    AND send_to_dept_cd = '07'
                    AND f.pgid = t.pgid
                    AND clm_cause_cd = p_clm_cause_cd
                    AND clm_detl_cd = p_clm_detl_cd);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_nr_receive_dt := NULL;
   END;

   RETURN v_nr_receive_dt;
END;
/


--
-- FUN_OBJECT_UI_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_object_ui_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
3a4 233
wOYJVqY203m9jAmP6B3aI+SsNpUwgwJeLvZqfHRVrZ3mnLM25j4FeWNbSVJe0KLfSusoBATf
37RwVQFztbfxIaEFO06vFiXr605t7dh/MvLvNKQz+R46hoFDBSwZc/m2FaamX7H6jFmQroKS
CVq60Qh1VgJ/nk7e0L4y2u/W49o79Q3pVJkT4kbtmaKVMQ1kjXgVO1e58u5zfm/X1qKLnojr
W6DFky+CkeXAGEasdWHXnpAc92I70aG4B+Kfja4qZvbyn7JmR7Bj//zmI1aG+usUUYzMexyw
+FfXQFPFevzcdDvJL9pQp6jQakgRPmEvb8BibeOGGxgSFTfuxDLUI5Ruukz9Wp+llr9DRjJL
zF3Q8ytRCyP59+Xhd8tL0RidI9r4MEot8gU4q1bcMWYvosKToQxIdMvR2y8d+zbJUDAVAv9B
j8ORIu3FTuYlEav0ex4bkwhDLgJGWKMt+rh5H4z2/6ZvDPh9IfovcoioxCYh5Eh7HfTToTty
RrY/JvZ6+ZSAAq9d+dQiVs5UYpTTQ32VRgDjHEQfID+mKwjuDw==
/


--
-- FUN_OCCURS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_OCCURS wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
245 160
1tsFoHyyrTp3SLtZJbk6i00bxpYwg43xfyAdqHQC2k7Veot3dHnGUStRbmQX9HXnE6C6YV8x
krWZH9HM0YijA6a7OBlJBGUSY4W4zq25jP6t9JNCNZzk45oFRmZcRI9MVcApAbL5ZiELqvfa
Hap2vSpJOTFTL+M90k1139sU8hlXf0MrV+msx9dIMBAdMMK3gHdsVQd9VaLAzahvLgra95nG
0wMDix0k9Ax7Dvu5rPGmgET/qKmG+WH6jYyJSoVeR2T34RnoEJZ2L+Bo4XVYwOjipnn553Iz
2JYjjgWqfLHZTmO/vydKAk3JLSoMTFBpRjMJYhgqXARlxLXgLD/7v2xt3g==
/


--
-- FUN_OFFICE_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_office_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
29d 189
CdzEcqvxfWPXfJx008URw72JAgEwg5DxfyDWfC8C2vjqaG/Cw3nGUXTRdkQ+aFwHqM2R6WIW
javIWgSSu5msZ4hRWmiRVU74ihcPyPEXZhsW7CUr6QhzWAXra3qsjKbKA3Y29wenBOJc6JWZ
DXomMsEvISZQd3ehcqHmGCDz3ULPVJgn2B/P8E0D0G1h02hRF6m7t8iVVBg9RLb37u4aLR/n
xi/yel2mvBaYL0RrlXT7ACzfAzRIxLaaAM8eQYDw0eHgHvaMed0+OtZwozUuN+LGEBndGOWC
NlxePztotXFqfgsuLCswnFbu7OWshrzkkAuC7S6zUefZ0xFhtd7A3UVBXr4ChVG6mzrIsbBB
QF3EtQDw8OsSBah9iZgkhm/wbw==
/


--
-- FUN_OFF_FOR_BILL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_off_for_bill wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
881 32b
L6sZpPsszNe87K7Oe0222iznKU4wgw1c2RgFfI7New9SeJUzIZHxoFUhWa8oMfNX8fddWe3T
9fMWdKQW9ZzQZIctbD3rQkYnC88yT8F2D7EAPkToNtydqpfG66FBHKr6uyQcHCXcJUXUbPEB
RHXdfxdDIhcFdATTABN0qTrhdy3J+kRqGogg69cjkM1fasxJiQHR3TRMdiJKsURIus22ca4I
/wrB5WyjqDFm4bJmMwJpgRSAotJ81ZrB7QR7XWVZsGeyG9SFzG3y+0OXMrG0N0SBq+KIAN1B
pHYUaRVzHH+R1nZgv4+oYbp1aFMz8Wg1wvmJBJi077p6q+QMyDb/F1pItk5UCre0PmnZswSK
RShnUtdb34KveqOck9JEPMd+ejSBWEsY5YvV83Uu7lq9N9Yp4coyCDSWiV6XW+IFqJcUbTWf
vrSw7+cMsjVhNmw0boRUlvLa8xS+J2sTgQ1qFbY010BTGQ4EDgt1wspUTJ5gBT4C/Md/XlDX
xadLk2BdkS+vHv9E6CZx2IQTBR/ilFj44F+jvI1N6yHGLvNpxU3A99nsMxqeKjp0s5Zm+CTT
+aMlmlrkgV0PSan2okuB6XwJ3JTZX3LHLpJhgfWE5RGyTQHoI3mO6vvBiM8CIYPfeEsCKEv6
1LSdnkCqmQ3+dno3EG/lTjqh4tiRF7bXv1Nce/huRIQKf4y+anN2XTKZMekxfBLoiO3OVWbk
q0/4nkzhA+Qg7SSp9LaJl4TcOfp9ENt92dN2TmGA03/oonNApa0+c4IJasP+2+Qo9pd0xZi/
qqa2F4ul
/


--
-- FUN_ORG_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_org_office (p_office_cd VARCHAR2)
   RETURN VARCHAR2
AS
   v_office_tp        NUMBER (1);
   v_ctl_office_tp    VARCHAR2 (2);
   v_office_cd        hrm_office.office_cd%TYPE;
   v_org_setup        VARCHAR2 (50);
   v_control_office   hrm_office.office_cd%TYPE;
   v_status           CHAR (1)                    := 0;
   v_office_null      hrm_office.office_cd%TYPE;
BEGIN
   BEGIN
      BEGIN
         SELECT SUBSTR (TO_CHAR (POWER (10, use_code_len)), 2)
           INTO v_office_null
           FROM gen_code_no_convention
          WHERE code_id = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            v_office_null := NULL;
      END;

      v_office_cd := p_office_cd;

      SELECT TO_NUMBER (ho.off_catg_cd) - 1
        INTO v_office_tp
        FROM hrm_office ho
       WHERE ho.office_cd = v_office_cd;

      SELECT DECODE (v_office_tp,
                     4, v_office_cd,
                     3, v_office_null || '-' || v_office_cd,
                     2, v_office_null || '-' || v_office_null || '-'
                      || v_office_cd,
                     1,  v_office_null
                      || '-'
                      || v_office_null
                      || '-'
                      || v_office_null
                      || '-'
                      || v_office_cd
                    )
        INTO v_org_setup
        FROM DUAL;

      WHILE v_office_tp != 1
      LOOP
         BEGIN
            SELECT s.control_office_cd
              INTO v_control_office
              FROM hrm_office h, hrm_office_setup s
             WHERE s.office_cd = v_office_cd
               AND s.control_office_cd IN (
                             SELECT ho.office_cd
                               FROM hrm_office ho
                              WHERE ho.off_catg_cd =
                                                    LPAD (v_office_tp, 2, '0'))
               AND h.office_cd = s.office_cd;

            SELECT off_catg_cd
              INTO v_ctl_office_tp
              FROM hrm_office ho
             WHERE ho.office_cd = v_control_office;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               BEGIN
                  SELECT s.control_office_cd
                    INTO v_control_office
                    FROM hrm_office h, hrm_office_setup s
                   WHERE s.office_cd = v_office_cd
                     AND s.control_office_cd IN (
                            SELECT ho.office_cd
                              FROM hrm_office ho
                             WHERE TO_NUMBER (ho.off_catg_cd) =
                                                    TO_NUMBER (v_office_tp)
                                                    + 1)
                     AND s.office_cd = h.office_cd;

                  SELECT ho.off_catg_cd
                    INTO v_ctl_office_tp
                    FROM hrm_office ho
                   WHERE ho.office_cd = v_control_office;

                  v_status := '1';
               EXCEPTION
                  WHEN NO_DATA_FOUND
                  THEN
                     v_control_office := v_office_null;
               END;
         END;

         IF v_control_office = v_office_null
         THEN
            v_office_cd := v_office_cd;
         ELSE
            v_office_cd := v_control_office;
         END IF;

         IF v_ctl_office_tp IS NULL
         THEN
            v_org_setup := v_org_setup || '-' || v_control_office;
         ELSIF v_office_tp != TO_NUMBER (v_ctl_office_tp) - 1
         THEN
            v_org_setup := v_org_setup || '-' || v_control_office;
         END IF;

         IF v_status = '0'
         THEN
            v_office_tp := v_office_tp - 1;
         ELSE
            v_office_tp := v_office_tp;
            v_status := '0';
         END IF;

         v_ctl_office_tp := '';
      END LOOP;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_org_setup := 'Not Found';
      WHEN TOO_MANY_ROWS
      THEN
         v_org_setup := 'Too many';
      WHEN VALUE_ERROR
      THEN
         v_org_setup := '';
      WHEN OTHERS
      THEN
         v_org_setup := 'Others';
   END;

   RETURN (v_org_setup);
END;
/


--
-- FUN_ORG_OFFICE_HIST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_org_office_hist (p_office_cd VARCHAR2,p_action_date date)
   RETURN VARCHAR2
AS
   v_office_tp        NUMBER (1);
   v_ctl_office_tp    VARCHAR2 (1);
   v_office_cd        hrm_office.office_cd%type;
   v_org_setup        VARCHAR2 (50);
   v_control_office   hrm_office.office_cd%type;
   v_status           CHAR (1)      := 0;
BEGIN
   BEGIN
      v_office_cd := p_office_cd;

      SELECT TO_NUMBER (hoc.office_tp) - 1
        INTO v_office_tp
        FROM hrm_office ho, hrm_off_catg hoc
       WHERE ho.off_catg_cd = hoc.off_catg_cd AND ho.office_cd = v_office_cd;

      SELECT DECODE (v_office_tp,
                     4, v_office_cd,
                     3, '0000-' || v_office_cd,
                     2, '0000-0000-' || v_office_cd,
                     1, '0000-0000-0000-' || v_office_cd
                    )
        INTO v_org_setup
        FROM DUAL;

      WHILE v_office_tp != 1
      LOOP
         BEGIN
            SELECT s.control_office_cd
              INTO v_control_office
              FROM hrm_office h, hrm_office_setup_hist s
             WHERE s.office_cd = v_office_cd
               AND s.control_office_cd IN (
                      SELECT ho.office_cd
                        FROM hrm_office ho, hrm_off_catg hoc
                       WHERE ho.off_catg_cd = hoc.off_catg_cd
                         AND hoc.office_tp = v_office_tp)
               AND h.office_cd = s.office_cd
               and p_action_date between s.start_date and s.end_date;

            SELECT office_tp
              INTO v_ctl_office_tp
              FROM hrm_off_catg hoc, hrm_office ho
             WHERE ho.off_catg_cd = hoc.off_catg_cd
               AND ho.office_cd = v_control_office;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               BEGIN
                  SELECT s.control_office_cd
                    INTO v_control_office
                    FROM hrm_office h, hrm_office_setup_hist s
                   WHERE s.office_cd = v_office_cd
                     AND s.control_office_cd IN (
                            SELECT ho.office_cd
                              FROM hrm_office ho, hrm_off_catg hoc
                             WHERE ho.off_catg_cd = hoc.off_catg_cd
                               AND TO_NUMBER (hoc.office_tp) =
                                                    TO_NUMBER (v_office_tp)
                                                    + 1)
                     AND s.office_cd = h.office_cd
                     and p_action_date between s.start_date and s.end_date;   
                  SELECT office_tp
                    INTO v_ctl_office_tp
                    FROM hrm_off_catg hoc, hrm_office ho
                   WHERE ho.off_catg_cd = hoc.off_catg_cd
                     AND ho.office_cd = v_control_office;

                  v_status := '1';
               EXCEPTION
                  WHEN NO_DATA_FOUND
                  THEN
                     v_control_office := '0000';
               END;
         END;

         IF v_control_office = '0000'
         THEN
            v_office_cd := v_office_cd;
         ELSE
            v_office_cd := v_control_office;
         END IF;

         IF v_ctl_office_tp IS NULL
         THEN
            v_org_setup := v_org_setup || '-' || v_control_office;
         ELSIF v_office_tp != TO_NUMBER (v_ctl_office_tp) - 1
         THEN
            v_org_setup := v_org_setup || '-' || v_control_office;
         END IF;

         IF v_status = '0'
         THEN
            v_office_tp := v_office_tp - 1;
         ELSE
            v_office_tp := v_office_tp;
            v_status := '0';
         END IF;

         v_ctl_office_tp := '';
      END LOOP;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_org_setup := 'Not Found';
      WHEN TOO_MANY_ROWS
      THEN
         v_org_setup := 'Too many';
      WHEN VALUE_ERROR
      THEN
         v_org_setup := 'Value Err';
      WHEN OTHERS
      THEN
         v_org_setup := 'Others';
   END;

   RETURN (v_org_setup);
END;
/


--
-- FUN_ORG_OFFICE_OLD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_org_office_old (p_office_cd VARCHAR2)
   RETURN VARCHAR2
AS
   v_office_tp        NUMBER (1);
   v_ctl_office_tp    VARCHAR2 (1);
   v_office_cd        hrm_office.office_cd%type;
   v_org_setup        VARCHAR2 (50);
   v_control_office   hrm_office.office_cd%type;
   v_status           CHAR (1)      := 0;
BEGIN
   BEGIN
      v_office_cd := p_office_cd;

      SELECT TO_NUMBER (hoc.office_tp) - 1
        INTO v_office_tp
        FROM hrm_office ho, hrm_off_catg hoc
       WHERE ho.off_catg_cd = hoc.off_catg_cd AND ho.office_cd = v_office_cd;

      SELECT DECODE (v_office_tp,
                     4, v_office_cd,
                     3, '0000-' || v_office_cd,
                     2, '0000-0000-' || v_office_cd,
                     1, '0000-0000-0000-' || v_office_cd
                    )
        INTO v_org_setup
        FROM DUAL;

      WHILE v_office_tp != 1
      LOOP
         BEGIN
            SELECT s.control_office_cd
              INTO v_control_office
              FROM hrm_office h, hrm_office_setup s
             WHERE s.office_cd = v_office_cd
               AND s.control_office_cd IN (
                      SELECT ho.office_cd
                        FROM hrm_office ho, hrm_off_catg hoc
                       WHERE ho.off_catg_cd = hoc.off_catg_cd
                         AND hoc.office_tp = v_office_tp)
               AND h.office_cd = s.office_cd;

            SELECT office_tp
              INTO v_ctl_office_tp
              FROM hrm_off_catg hoc, hrm_office ho
             WHERE ho.off_catg_cd = hoc.off_catg_cd
               AND ho.office_cd = v_control_office;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               BEGIN
                  SELECT s.control_office_cd
                    INTO v_control_office
                    FROM hrm_office h, hrm_office_setup s
                   WHERE s.office_cd = v_office_cd
                     AND s.control_office_cd IN (
                            SELECT ho.office_cd
                              FROM hrm_office ho, hrm_off_catg hoc
                             WHERE ho.off_catg_cd = hoc.off_catg_cd
                               AND TO_NUMBER (hoc.office_tp) =
                                                    TO_NUMBER (v_office_tp)
                                                    + 1)
                     AND s.office_cd = h.office_cd;

                  SELECT office_tp
                    INTO v_ctl_office_tp
                    FROM hrm_off_catg hoc, hrm_office ho
                   WHERE ho.off_catg_cd = hoc.off_catg_cd
                     AND ho.office_cd = v_control_office;

                  v_status := '1';
               EXCEPTION
                  WHEN NO_DATA_FOUND
                  THEN
                     v_control_office := '0000';
               END;
         END;

         IF v_control_office = '0000'
         THEN
            v_office_cd := v_office_cd;
         ELSE
            v_office_cd := v_control_office;
         END IF;

         IF v_ctl_office_tp IS NULL
         THEN
            v_org_setup := v_org_setup || '-' || v_control_office;
         ELSIF v_office_tp != TO_NUMBER (v_ctl_office_tp) - 1
         THEN
            v_org_setup := v_org_setup || '-' || v_control_office;
         END IF;

         IF v_status = '0'
         THEN
            v_office_tp := v_office_tp - 1;
         ELSE
            v_office_tp := v_office_tp;
            v_status := '0';
         END IF;

         v_ctl_office_tp := '';
      END LOOP;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_org_setup := 'Not Found';
      WHEN TOO_MANY_ROWS
      THEN
         v_org_setup := 'Too many';
      WHEN VALUE_ERROR
      THEN
         v_org_setup := 'Value Err';
      WHEN OTHERS
      THEN
         v_org_setup := 'Others';
   END;

   RETURN (v_org_setup);
END;
/


--
-- FUN_PAIDUP_VALUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_paidup_value wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
d4a 47b
ldWFVBmVvfohdlfTT+I5hJ97Apwwg43q10hufC+5WLClY6Pjaex+6xzCg/LLML/3S/Bfodn6
u1D+JPVfr1/wMRqMdudO1zCLEywDnDXDRfesVL50FfWgJgf/NOufcBSqeFUNJvraXD3w5Qv3
+/J/ABY1292adZfsGbwdbn4TJyHsPtwr3qIge+soboIqIqND6gCfiiEFULO4k4JePZjf59Yu
uoMePisduHlGWXVIfLSvTYPzhy7lfYo624B0r+iPmlC8LI4FKP04rF+N2AfyB73GiBJHJynY
mhoEpvrDlLrQlz4spKLM199+MfEJuvaCZeUlQIwVyY1daHePbYqAHn817OKIVlKgea22e/eL
ObelpnsA0hKiOHTfYCI3UtQTNyBftnXbOupsB9HyEEj13dHzfdH8/3DjNFP0qDpO0PF2bYie
c2yWDDYMAXqO79Wt53XK05esz5NwyKclGbPRfif0BA0CvmEOcUk40bbClmQXm6BYVM/8i90+
2fBPsn7JdYeTnoutEzlPDGsgvziZczgwy5+XK0ILsWBUtrWmJQOnXOwhTNCwvG6HtPDBQVAc
1QO4QdifgnRsP7ujejjEk1IDWA+ouaokGveZYtcVRHqDlK6bL67LqjXL6Qih2SoOmIsuxtaB
qyb2K/tcPAs273Klv0bo1fpy8TSJXdrkDxTjoV/EWyrm2bjwnO5EK0C/Xl0iDRmXMAF5ftON
FbE19LHN1DCQKdo/t/zaFIYpWuUzzpgW+mp5Jz6W1tnrKzB/zhALGL68oCy2F2WqXGnMxoz7
8rrH0jnUlgQDMqWGIxsh9hpKfXxm9YhP1uDOgl4T7oF2wETxsLyAvOmKmEyEaEzcnyskitka
AwcOo0RXqiKSFhMMgzFkxxiUEAsVgLzowlBtSCFuwRV/RW8tI2wj7aT3P4v9OjnUTihKaPft
7LnZWz3ReveZnK9DqhsHsIY46VT5wrhUrB4isywr3R+gEkGwndwcCf1RpWIdFYNBc5ot2fRC
zpWSyPz84CfqoOG/VGIlu9ZnzcMPfLBOKEB6X7QFRlhij7BcJNqg0KrFPDGutEfqbz/jWpgh
Jr60zwMNWhlDAMG3W724PRcmkmBvL9k+A/uVJI3cD/n74eYcGg==
/


--
-- FUN_PAIDUP_VALUE_VAL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_paidup_value_val (V_PGID VARCHAR2)
   RETURN NUMBER
IS
   V_POLICY_TERM           INS_P_SUMMERY.TERM%TYPE;
   V_PAY_MODE_CD           INS_P_SUMMERY.PAY_MODE_CD%TYPE;
   V_LAST_PAID_INST_NO     INS_P_SUMMERY.LAST_PAID_INST_NO%TYPE;
   V_YRLY_NO_INST          INS_PAY_MODE.YRLY_NO_INST%TYPE;
   V_SUM_ASSURED           INS_P_SUMMERY.SUM_ASSURED%TYPE;
   V_PRODUCT_CD            INS_P_SUMMERY.PRODUCT_CD%TYPE;
   V_BONUS_PERC            INS_YR_BONUS.BONUS_RATE%TYPE;
   V_LAST_VALUATION_YEAR   INS_YR_BONUS.BONUS_YR%TYPE;
   V_COMM_DATE             INS_P_SUMMERY.COMM_DATE%TYPE;
   V_POLICY_INSTALLMENT    INS_P_SUMMERY.POLICY_INSTALLMENT%TYPE;
   V_POLICY_STATUS         INS_P_SUMMERY.POLICY_STATUS%TYPE;
   V_INSTALLMENT_PREMIUM   INS_P_SUMMERY.INSTALLMENT_PREMIUM%TYPE;
   V_POLICY_GROUP          INS_POLICY_TYPE.POLICY_TP_CD%TYPE;
   V_PAIDUP_VALUE          NUMBER (15, 2);
   V_NO_OF_PREMIUM_YEAR    NUMBER (5, 2);
   V_COUNTER               NUMBER (4);
   V_START_YEAR            NUMBER (4);
   V_LAST_YEAR             NUMBER (4);
   V_BONUS_AMT             NUMBER (15, 2) := 0;
   V_LAST_PAID_YEAR        NUMBER (4);
   V_COUNT                 NUMBER (4);
   V_PAIDUP_AGE            NUMBER (2);
   V_INST_MONTH            NUMBER (2);
   V_PREMIUM_PAID_YEAR     NUMBER;
BEGIN
   BEGIN
      SELECT   IPS.SUM_ASSURED,
               IPS.TERM,
               IPS.PAY_MODE_CD,
               IPS.POLICY_INSTALLMENT,
               IPS.POLICY_STATUS,
               IPS.LAST_PAID_INST_NO,
               IPS.PRODUCT_CD,
               IPS.COMM_DATE,
               TO_NUMBER (TO_CHAR (IPS.COMM_DATE, 'rrrr')),
               TO_NUMBER (TO_CHAR (IPS.LAST_PAID_DATE, 'rrrr')),
               IPM.YRLY_NO_INST,
               DECODE (IPM.YRLY_NO_INST, 1, 12, 2, 6, 4, 3, 1),
               IPS.INSTALLMENT_PREMIUM
        INTO   V_SUM_ASSURED,
               V_POLICY_TERM,
               V_PAY_MODE_CD,
               V_POLICY_INSTALLMENT,
               V_POLICY_STATUS,
               V_LAST_PAID_INST_NO,
               V_PRODUCT_CD,
               V_COMM_DATE,
               V_START_YEAR,
               V_LAST_PAID_YEAR,
               V_YRLY_NO_INST,
               V_INST_MONTH,
               V_INSTALLMENT_PREMIUM
        FROM   INS_P_SUMMERY IPS, INS_PAY_MODE IPM
       WHERE   IPS.PGID = V_PGID AND IPS.PAY_MODE_CD = IPM.PAY_MODE_CD;

      SELECT   PAIDUP_AGE
        INTO   V_PAIDUP_AGE
        FROM   INS_PRODUCT
       WHERE   PRODUCT_CD = V_PRODUCT_CD;

      V_PREMIUM_PAID_YEAR := (V_LAST_PAID_INST_NO / V_YRLY_NO_INST);

      V_NO_OF_PREMIUM_YEAR := (V_LAST_PAID_INST_NO * V_INST_MONTH) / 12;

      IF V_NO_OF_PREMIUM_YEAR >= V_PAIDUP_AGE
      THEN
         SELECT   POLICY_TP_CD
           INTO   V_POLICY_GROUP
           FROM   INS_POLICY_TYPE
          WHERE   POLICY_TP_CD = (SELECT   POLICY_TP_CD
                                    FROM   INS_PRODUCT
                                   WHERE   PRODUCT_CD = V_PRODUCT_CD);

         IF V_POLICY_GROUP = '02'
         THEN
            V_PAIDUP_VALUE :=
               ROUND ( (V_INSTALLMENT_PREMIUM * V_LAST_PAID_INST_NO));
         ELSE
            V_PAIDUP_VALUE :=
               ROUND( ( (V_SUM_ASSURED * V_LAST_PAID_INST_NO)
                       / V_POLICY_INSTALLMENT));
         END IF;

         RETURN (V_PAIDUP_VALUE);
      ELSE
         RETURN (0);
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN (0);
      WHEN OTHERS
      THEN
         RETURN (0);
   END;
END FUN_PAIDUP_VALUE_val;
/


--
-- FUN_PARTY_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_party_name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
330 1ca
Jig0KgX+nsfFzlYEl/snRq4rlrMwg5DxrvbWZy+VEhmuf5zg4WvScjvxaivGonyCZeLorWLm
XiMRoLRdyCCaKi4qp1DmMyGKNDrt7s1grUQbyayxTAEkl8mYxFy+k2pa+2c465N2Fb626y0W
oDbHYv63n8oNJm8DwjXOtaZGBCl6f49VIjC5h/C6rA76Anv3GAOGZlvRKURBBWwD/4hsCyX6
Lpbt3wqOEIFGA3WjWepTtzisNzeH2CNu7jcLsfRGH51oPyPZrZ4VqOIpf8RIdCECUESCRMXx
zE93XS/dtER8UBf0bJ8G2p3txsGm6zOQwxeAZ36EeaDwV7AseIarAH1kaBywj8ztAk0ZXJZB
qp7fR59r3gECnDHpcF6xSz4Kc8i6fRSAbWZWH8xtmxDEOX7sqKek6dEFt8QgHotO/QeOkvxd
KErcB8a8J/jqD3+9oO4=
/


--
-- FUN_PAY_ORDER_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pay_order_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ca 189
xE1o3AFsQtaYwEIrW10vNXPLqL8wg3nM2SdqfC+Kkw9/xLR3iRtQHCfAyM3w78jqYPGQXRSe
eSCh8g4H5iK8PwJFaUwUn0BC2N+ywYeI1MaxPs+8PwdOQ81z09wX+93xIFaMjd+a8pjTl4Hr
31fC8vzdOWru6JeFZiNK6/NkQ6gEusikPsd6jAlScsAaPv6PK+/lXRz3eO5g9S6Lz7+cKMdj
NgpXSrZ61FPGCXQ8GO1YW6uw/fbFXUWevqfl/IaFWV4W9MzLX1WnVmvHihIuIpQtKAKuS1cc
H388nUvaU+Yj7MjD5F6bAfBs4up9o2/jyTfTeoH06zF7SVV9ZNtaNw4Q3DK17+BH+ny8DNp+
vBKltKXolfA8JsrRJZgsrVjASw==
/


--
-- FUN_PERSISTENCY_RATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_persistency_rate wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
624 2ad
YOXfcPKoSQrK+PVPfDZBLPjjXLswg82JDG0FfC+pEjxkdRPNBsnt3r8M/WGPjdT03adfHDGB
oYnx5pYMMcY4tRAB1fQ71DfN7eHW2DrJIZYuAUQqcZ7OOpuPP7scTz8AALscPzRFxrty2lq9
pqBK7jw463vrkg+P4RWDpxhI8g1HOMmV7G7X9jmexAF5DNZKWD6V5PP6Z2st8qlL12LFFTJk
AzKgjCpFYJ4DvfXIhJJ/1mR4adjh1A1hhXHV9tyYPp+kC1HxGAaF1wtixdcNXhktziUKz1iv
QTSVKh8AqmjOYy1gJ3AGKq2RGJnvhqlKUfL6OU1+Mx8TCVDRqWcoUFU5jbVMMCYtq0jKvlmP
EfvyrzS4TYexUYxHtusYy/fuAJVhIB3AoD5nqyCTu67kh19ghtL4S5xPrKSvK0ZZFY0rBFqB
UUzHp/feU8w4hQRiH4MN3AXoNT01UyJGTR8itvAemBWwPGhr/i2RVldrqPCSFgco97eINwMK
rswaWdTHQMNlivDQPtkXfmyVXPESH9kqnoYFEEG+HAQbVZJ2CK0v163mtEUiAP9RUZvEH6gn
+HgrqN1IisQGDGX6tLVlcwtYMDJlsLw1fxBSCI8IcmIAWFQfqgWFjwBxb5Xuk5K6QHm1zVsn
kTLpI03CBnwnSywq1l1VLENXcNc=
/


--
-- FUN_PF_GL_HEAD_OPENING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pf_gl_head_opening wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19ea 52a
pXEc3E/da4OXDcldXyiCbv38/Pkwg82TmiAFyi8ZA7WeM3wxK7eFKaCcySZGNxRIpEtLkA2u
ESWDSCV3gQEgc4Zb+TeoG1L9Mvx3RCYoQJi7uSK5y+YfbOnpFRZTcxCWHEiVVa4Ic4seeAge
7ov5xnOk52UtWajTQsUWHSd+yoDVha6AHDD5hTa6VtOiNhWPbFAv2Zk352LnqvshdJlmb247
Hr2BQsoJ5sfMkXvyQ8NNyFc+8tz7YrF/7hxHPWhgS19QRtHpdOs5a2+mryGrN+svbtc1IQoB
nCaFVzEWk1rzMdUFBgZRgVkCd1YGkYQwqMrm2BoC+hzn3IyeB6fe5dejoXzKkJwtj5E+IaCf
m4xDcNWc9luUGnRj8ZvvqotCf5Mbw/QKJHOogNwJrIngeenFKe3yEa+SSn1DyW3MYS/ni9Xz
gp8xpbOXz5Pz4oUqBkEdA28aF/A76ZaPxy8qbZUYUNHW2KlcqV6qPNjTGGwJgeniL/rDLiOD
lJ51ogY662mMq1zmPNy5FOJt6HJukBwHabHKjll0txFsdV84Bfk3235DU1gaSJhhxxv03OEp
G0Q3sSCm9jBE4YzlAURA4txmvsyUKdvIatDohplaxiIwz8PCMlIRbIw4Au+Px63kuIBqm38c
ZIik6ubL91AFrWteUfZJ4vV8FVzw3tr9n4vdYTgW1WvaFIsqxiuwLDIea//KEq6bwGL0Bmlh
OFOnaNYRrnolhh3h4aqWFrBhjS5wSM3GN0M4QdpF1dqCGY/EUW+3Vz7FJ69TQTVuj8mXuA/H
7TJ+iGayhjftNzAGJyzvpklV6n3cMgB07RDxdcpAAa2vvYvh+vCl92R0KdLMMR1FzkG9QKRw
7CJJiffW8WGjth8+qRJiugb2Qo7b1gYFpHZwnGATpTytXqSCXODUtoIt8JkZIh4NUUISEyh+
yRMEuukLN0aEG9eKJvIRv5VICjkIkWryoAmVvyK/v2pzsyeBcotcTr0iE+SrfijVPG8KaQtz
fxorLXauCaycRtk7HCb28uflBZe2MoIwsoaJd5fMO3Y6cmh2fs85SdHs8uU/U90hMthzhFU2
nZF4NcZIBv9BC3g6T0X60o1F9PSSK9GUSqO/qDRVFddKAgXqEg32Z1BScQL8gE/k7hoRhdeT
+mzVe+CXnsgbnDbOHxMoP1fjalMBcxB5InZokBlehPHqYT3H1oS/D2RSWaQFcrkzggBhTwv4
UvxFu7J5Ggz/l3Tbsd00MR6xFGQk/AL5HeQxaH9C4J3ids4ihiE91nma9uy1YtJ3yUHTQv5b
T+ncOQ==
/


--
-- FUN_PF_VOUCHER_PAYMENT_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pf_voucher_payment_amt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
281 1ce
2Mr5pwMtFMtaWq0+wenM4IGGMvEwgzIJ2UgVfC+KMQ8teEnT5ueBb4Fw5KlaLaSty4nrnlwO
hw5NrPJz+INXacHdbCVH/4rYv4wjahB5snbiSXospcEekgi+tdROuf5TJEy4vzRnNaYOlQ3N
OvJ7Id/dg0Zy7K284Ejcl024Jf7/qSmB5nsJv/e6C9lho6vQWfipXi1mmb7YLo71wvdo1r9H
9cy2vrRVBS14CJeTsjRcU358k/XBNa7UbqWy41vGYh0/AyAV0tPSd8Vcx/Rx3f3jqolmqYjz
IcTG1LBg+qSRnn9M318LsRSycnDoxRiRssw4OESQ1yk2fYqNp4S27siYj7BupwHJdpI6edUL
jbPM9Ysj3/U/4hiRwT5g9mLVZpq+foaWZyUYFURinouIxQUTBSvPcAcOa9nYI015TUW5JllA
+sMgfHaGIsynD+3k+8xrQcc=
/


--
-- FUN_PGID_PR_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pgid_pr_no (
   p_pgid     IN   VARCHAR2,
   p_due_dt   IN   DATE
)
   RETURN VARCHAR2
IS
   v_pr_no   VARCHAR2 (100) := NULL;
/******************************************************************************
   NAME:       fun_pgid_pr_no
   PURPOSE:    To find the PR number of Prepium Collection

   REVISIONS:
   Ver        Date        Author                      Description
   ---------  ----------  ---------------             ------------------------------------
   1.0        13/12/2017  Md. Sayadur Rahaman       1. Created this function to find PR number as per collection

   NOTES:

******************************************************************************/
BEGIN
   FOR i IN (SELECT NVL (r.coll_slip_no,
                            r.active_office_cd
                         || '-'
                         || TO_CHAR (r.receive_date, 'RR')
                         || '-'
                         || r.coll_sl_no
                        ) pr_no
               FROM acc_receivables r
              WHERE pgid = p_pgid
                AND p_due_dt BETWEEN due_dt_from AND due_dt_from
                AND rec_status = '1'
             UNION ALL
             SELECT NVL (r.coll_slip_no,
                            r.active_office_cd
                         || '-'
                         || TO_CHAR (r.receive_date, 'RR')
                         || '-'
                         || r.coll_sl_no
                        ) pr_no
               FROM acc_advance_receivables r, ins_p_summery s
              WHERE r.pgid = p_pgid
                AND r.pgid = s.pgid
                AND p_due_dt = s.comm_date
                AND rec_status = '1'
             UNION ALL
             SELECT NVL (r.media_no,
                            r.active_office_cd
                         || '-'
                         || TO_CHAR (r.receive_date, 'RR')
                         || '-'
                         || r.coll_sl_no
                        ) pr_no
               FROM acc_partial_receivables r
              WHERE pgid = p_pgid
                AND p_due_dt BETWEEN due_date_from AND due_date_to
                AND rec_status = '1')
   LOOP
      IF i.pr_no IS NOT NULL
      THEN
         IF v_pr_no IS NULL
         THEN
            v_pr_no := i.pr_no;
         ELSE
            v_pr_no := v_pr_no || ',' || i.pr_no;
         END IF;
      END IF;
   END LOOP;

   RETURN (v_pr_no);
END fun_pgid_pr_no;
/


--
-- FUN_PGID_TO_INS_TP_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pgid_to_ins_tp_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
177 138
vbCF8Tukjz8PBFpKujoLXkSHIMYwg0zILij7fy9AkPjVi2buZgYRhmfXJdvcEz9W3MfK20S9
+Z2fO5J9Y+tCGVh4INlnJdUuuDBuOiN6zTo/7us61P7VuzNQCjFWd3aONQANwK0NjLympm0i
VOGePXQ7adGBJytdtP2nTs7yDTgf5Z7Nn8ihsSCyb+BAmeneFh8IV3Fr0s1+jEg1/DBz9vfM
3jKBu/5AHmyjX7+3OOFkfOlRU/cRCbj3jTaDgO322i3ofpu2SHo37va9lQEPmrP4CYGZ83+J
N6teM5JqGP+2AzZMWA==
/


--
-- FUN_PIR_STAMP_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pir_stamp_amt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2a5 171
eIWjRuxuWSM7t9qdvIXvE1vZ+48wg5Dxf65qfC8CWHPVSDV5HzlgUcvUUk1sz0puDAywXhRn
fCHig8Pjqq5fEXcb9+XAbWKa7buQQW6NTYVXRv6E1wVypLsTJwNDJ+tZRKZWvsrex6endTy+
yY3mncCGEl6/HbN5ehf3fSqNHDg+7aNaqpZZf4sdsZjkoxQGzCSIX4W5JStrTw1mVx/j74PK
vq85THhO/0pTLPgKAjOrQD7XxsIMUfKdFpDGR+mAZ2fGJhT6WNV/RCdPRUTRAk58B71AOcK4
TQ9J+j6NbgvVUtcZOxgeJo7htOX5OSy8M8GRsRXkJMhrOjAFcy0hYTdu5PTeDyQMom6+OvtF
3k2D
/


--
-- FUN_PIR_STAMP_AMT_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pir_stamp_amt_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
26a 15c
oJkH4Q0TVumXAW8CGVxjCGPhnZkwg2P3Ldwdf3RAWE6Oh8iDRH/+d6jXOhEUBqKtByX6/KbT
hLMmADkZQTZ3HrMr5zecomG1cghPG/c4Hr1BmodjEjH6vJp+2jF+EimamEl1FqYwyKcNmVGk
mWQdGCbuIazwSUx4F1EewNyZf2awWmf6YnzFBT8uoZGT5qA57njkC/hJUwmZNAPDaWpsgG3+
EQRK1/ypoNv5BXdrJaK70Vl6d+oMX+fBQUeWrVyUlCKrdJUXKi+bM4cn16OrT005/ybu+yRY
fxNqeSqLS/4GITtsklz4KEpyJc4fpgkZwNI7ty0RoyYJnZKmUEqNlA==
/


--
-- FUN_PIR_STAMP_CALCULATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pir_stamp_calculation (
   V_SUM_ASSURED                       NUMBER)
   RETURN NUMBER
IS
   V_MAX_SUM_ASSURED             NUMBER (15, 2);
   V_SUM_ASSURED1                NUMBER (15, 2);
   V_STAMP_AMT                   NUMBER (15, 2);
   V_NEXT_INCR_AMT               NUMBER (15, 2);
   V_STAMP_AMT_FOR_NXT_INC_AMT   NUMBER (8, 2);
   V_STAMP_FRACTION_AMT          NUMBER (8, 2);
   V_COUNT                       NUMBER (8);

BEGIN
   SELECT MAX (A.SUM_ASSURED_TO)
     INTO V_MAX_SUM_ASSURED
     FROM PIR_POLICY_STAMP_SETUP_DTL A
         ,PIR_POLICY_STAMP_SETUP B
    WHERE A.STAMP_AMT_STP_CD = B.STAMP_AMT_STP_CD
      AND B.STATUS = '1';

   SELECT C.NEXT_INCR_AMT
         ,C.STAMP_AMT_FOR_NXT_INC_AMT
         ,C.STAMP_FRACTION_AMT
     INTO V_NEXT_INCR_AMT
         ,V_STAMP_AMT_FOR_NXT_INC_AMT
         ,V_STAMP_FRACTION_AMT
     FROM PIR_POLICY_STAMP_SETUP C
    WHERE C.STATUS = '1';

   IF V_MAX_SUM_ASSURED >= V_SUM_ASSURED THEN
      SELECT A.STAMP_AMT
        INTO V_STAMP_AMT
        FROM PIR_POLICY_STAMP_SETUP_DTL A
            ,PIR_POLICY_STAMP_SETUP B
       WHERE A.STAMP_AMT_STP_CD = B.STAMP_AMT_STP_CD
         AND V_SUM_ASSURED BETWEEN A.SUM_ASSURED_FROM AND A.SUM_ASSURED_TO
         AND B.STATUS = '1';
   ELSE
      SELECT A.STAMP_AMT
        INTO V_STAMP_AMT
        FROM PIR_POLICY_STAMP_SETUP_DTL A
            ,PIR_POLICY_STAMP_SETUP B
       WHERE A.STAMP_AMT_STP_CD = B.STAMP_AMT_STP_CD
         AND A.SUM_ASSURED_TO = V_MAX_SUM_ASSURED
         AND B.STATUS = '1';

      V_SUM_ASSURED1             := V_SUM_ASSURED - V_MAX_SUM_ASSURED;
      V_COUNT                    := FLOOR (V_SUM_ASSURED1 / V_NEXT_INCR_AMT);
      V_STAMP_AMT                := V_STAMP_AMT + (V_COUNT * V_STAMP_AMT_FOR_NXT_INC_AMT);

      IF MOD (V_SUM_ASSURED1, V_NEXT_INCR_AMT) != 0 THEN
         V_STAMP_AMT                := V_STAMP_AMT + V_STAMP_FRACTION_AMT;
      END IF;
   END IF;

   RETURN (V_STAMP_AMT);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      RETURN (0);
END FUN_PIR_STAMP_CALCULATION;
/


--
-- FUN_POLICY_FRM_PREVPOL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_policy_frm_prevpol wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
696 270
T+9t1tE/yfyqLm45kC4AjyZQR+0wg5WNLtDrfC9ArcHqR0Qm6U0n/qM3XVe3d2aIB4jamADX
+y3T0ywKjWcGmgt4MQJMUWPFxc4GRx5CAIZ6GF6Awq9CrB5kT4GL2cYou7wegc1J7b4QtWIC
SxamDrG8UlwjuBTs4TPtH+viwpJ6ihJWp63wf6IbBHQFkO5tFaErWw2OJVkt1fc4LZNIbdP9
gELMS+n93ZJ1wG+WywVdZa/QvH/iMb9w2FxeskBWxYzpeHXC6TfuyMe+hGAEy2KvCiaGs7JA
xVQaiGRuNojQ0rhZeX4/D1gYBWFeBaux3iAzvuLfWlBHXdDwUFAVUZM6RTz/aSE7K1QmKRUM
VJbuKtjBxaSreSufByDvxULtDs+n7rCbF+oB4SIzAXk8QjRXPE1uiaOrI4xhRZbT5JAhHnon
esDRqvAAtbJX9Ni+zYVRkDbIsPf6PoVdFJGbKMihYJ/L4MEdpyTH9FHrARWuTgaU7mMzvDKf
qo7VIvQ97QqeFw7btUNq8rG4SnEAVVDrupnaGj725ksxiwS6rweSI3dexOIZbzABLXKq8eAU
oo/rK1ZOEhsg3zz3uY89brkr1KgCBRckpnPdLvU=
/


--
-- FUN_POLICY_INFO_UPD_ST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_policy_info_upd_st wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
d51 3b0
35EmOdEPhTH4rf3XXhCl8mUifeYwg83q2RgFfI7Now9SeAHTfDibUWOoRPA7kTZKkVateSuj
oHR0iVg3n29z+PKn4B7uen3i9aDnYEXBVHv+zuN+q6cMl4h6NCImnMEs0Jo/CsawBxeBkptM
c+RE7zamjeVhoKk/aRuJQdhClUTRScmB7XrDFAM9EnEl4QxR3zQ8thJxwf5TQagh3x4q9y7X
kpPFR1bmi79kaOUkSo187EruaM6gQAWNY/pYX+qTA5jvKl/JwaHmq//f9QpLPBGuicgc1/Vu
d1NOoxDbNVrCxwq3S02U2a87aSqaAptApeIWNfLLuPM+vtALcQjwYCzbiHEPXYRVf5+i5zRs
6wMXAG+Q1HLir3LchsGxj8GwCG32pW3rzkMqzmNqmvdiATvrshG2qhvDEReNbH3GEQGyeOv9
HfH+GmxQjO8DhMjxXdPmtwFQvtQA8kE1mrF0ldTQq5zptgMw4D/04PPvp4hZzI/qzZrOtpfk
ZGYe8EFEGS6akLSCDKSc3NeWtmIJd2X9WltPTXNRtiBnuT3PvkkqN+R9H5BL9s6mdZTKFKfw
S5APrTY67LeXoiqbvXXeTTxb9u6rK9L2QZNRhIE4PESQaxeVnr4Xzf83/P8HvdrmhRI9qWL9
kNTvxwxfzIMSix48l9/AZxIDFM1SXEImXGJ/VT5xXGyJ3pCUtMJ9zQX2Vj72db61uFjTU3mP
bQV8/Q6tSJYJzycsV2jGMEP0yZSxxRBABQMA9bGMmq3rNAnItwJenWkTbUhFQVtLNUfzUNoL
V8Q5EFI0KaRSR4izuvuK+i/kXNz/GcCbJPr60LXg3EBCtFkGonZKotX3yg3lMCaih03mxVY2
VWUR01jsfAGjWJ7FueyjyKQ4wgXuuuRG0qEycBo85nFOsc2dlLvpy7CBfDww/ltecjmp
/


--
-- FUN_POLICY_SURRENDERED  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_policy_surrendered wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
206 181
XWDrN3qp0MqKQ4neiZhA64lFEhEwg43QJK4df3SVWE4+NMPt0T1c4GagCexODfcJSZdP5rB0
0sjIaTUHe6XNobl9puNrWAb+ik9zg1plFoSlzyJj/sSxnLBy0lK5+Ln1ipK555QdphOKYCo6
jIWwcVcL8B8jh3ehV1SRAyWLfKKAZ1LEYMaJloMiOn1x0zz8FD6RAaBro0ePSL0qF/ZoFsXt
HCqXpiXbaFT6+ySp2QZwPwNgsDLJW5OWh/Hm2U2VL1rL+WpvpBWFrENs9A4b9ohdRxwTXR1o
ZHAj2kPYdCYzcjHVTW22YVqGgwy0RAf2D/sOM862w04eqK0CJ61qgPRhkckLcOG3KDL5nW2d
9hijwTgnztcf4QnHDw==
/


--
-- FUN_POLICY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_policy_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
175 144
pyeCNemJAcP9qu4/M3gv3LksHh8wg1zIfyDhf3QCWE7VNMqUvX/1AH9xxzlmQ26FoakTZcPp
5uWpN8vk+NScURwTcwb+ANoTonurgLiSvl0FgfjkOoX+xs2ZGc8zuus3a8gM+v+YUIONEU5X
MHEWpnBf9L0zYh5M2buXNsz+Mdr20sgB4tLvBg+TAPZPMgEq/B3EQNv9UFFKjw9AXTV8s+3C
Crw4sbF0n0zTTpsgHsiSHEKpUtVXisjMhTLYuDiyOINhd/TKF2RrGZpNKZDrpWDuzIyccl6N
3I/g+gTr8jUy7bBY8Q2VhEyC+ETct+AV
/


--
-- FUN_POL_LAPSE_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pol_lapse_dt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a87 721
EwnXRlWpyl+kkrSTG1a9FsIF60EwgzuTDNCG33S5rZ2sxNtV9f3aWDFhA4jdC9WIHT81p4IT
t0tnBetRTA7NtWQcP2nC5OdlRVl+CSw+8VEk3twyHC0ahe5ytfkGmrX51J0Qc/lyLOT+qjgD
4anxnMEUOSrRqPCHhKt+DcrLiO7YL51DZI1JmgkVJ+yEhxeWRuIV8ryYpSFW1RULOYvI60Gg
YMzyLDCOE6sldn7PZLNF8cjo6ocJ8Thiec0mDVx/h0Ch2OTHMeUn8qEctpeWOKO2tulUmWEv
MFrq5QjERu1vKoaWZgnvRQEwEKH0d00KN79eUzTg7lhf/Mka5autHHnfcLaKn6Oxh5o+X1Q1
YiQcdJy3U9Eu7fNcDdg36F4qxcLYyWuXFuyP9Wca8cYqzCaQYNdtBtu3NMLlTVxVxCNGCWpq
NVMcg7hMMHVPMKNGrZ0JH+iaPsKs9JFrkgz8R+J696pBlH8t5VSxuJ0GZi5RClmtagElUweO
AY7Xq2GZvpYyiG842iwIh7skKQAXQ3dlEukE8MaZrUm+w2Ra8mY5f/TbUTheEKL7aWIVqx6Q
nRnmBMYlXjOj+j6LSFWsLDC5Jq+Kd8b3WPgxWPj3WAdCv5CCTnsuB2SyPeTx8jTizXk47Q8S
qUFMlAfzVurIXYlv4B1+pqCa5AJLeObAtPViEvbXM0AZ+TR6ZCusc3BgoeibUmCAG3kkjO/r
hq78U7azF5HKTg4eZQR1bzIc2eO8DBG7GAh5r7w+/HgCteh6Vi5aTwc9YlHaJzI1JjmZ8oFL
GsPWmCc9f61ULidYr8jQzusDArkdC+aYCzGxuuoMTJD1Kg5vN7bS71SaTTRQJRQf2y1JQLQd
ojnEG8GCDdT9ygaei/bWeVRmNCse1e2VD4Z/SYOuS29PEff06Ss0jvVW2eftrKnMlhHzsQYD
kxjczCvF4TTT2L5GA+ySM/IW9/rxoPi0pbvUyRZFyMgRNqGCRnYAZjv3u9nz/3Pato73HyYC
QQdLrOtsHyXpF83VEQgXTYM2CWBJWetfXX6Z2ihBOAf17qeyz1vwUwdaaIRsuai2hpD7IKAo
S62qeut8ZjQUIT7gCNT+j04tJLAAOxo/hINRS2Yb6E2YaNc+T6/+XOxuJXIvdjkZf71vVngv
irB0iixVOTPZsoos6HR2P1L9V1Z4uM4hAY9Swd+lS2jdamReOSJESB1XwAZZTU9fiwVunqCi
DTtTyzLtKSsho7ZFDvG3Us8kl2ADJ0d41I0YQjmhxa+gBNF5Gig8zF3EjL5TstUwEhTzJIG+
vcQRVF5/PEFJnzfHkFVvrE/dqqMyCPPi5UnxnwWEoOo6KksgsnH9wk4oD+y0hs5o0tLe1MNm
1jOoaTWgz8c5bJZFhLlQ91Vofsw+UTai/yYQy0xlug+IRojHRDjEz3PUKvBBAFOVk6yLU4Wv
EWEwy8BdvLAC2wYTNB5k1m4Z3gh2BoVjzG2048FpYLkJo45sh0GA+JuFl4xvcoBVQgE9gKT0
nJRNHfILOAh2d4WQ6pkqjq7uQkUNrCeQwFSkYe+jqVM8WvPVYTIh9KCt/QPx+zunw/LPD0U/
61kqmDKExXxpDH1ZyQCI2590vUHrCrrLvOtw0BliwQbe2O2/2S1CyfcZ2k/lsO7kcPJ+bpg7
hv1vMo5RCjhUhabd0dV17vvANCwfBFYJy6Io3XDnDlqsEhI59h2LvKSekqOqL26Nf9Th3xdT
TG371vRpTsc9KSH5IbV9MXAS4fDP9OOeAnfM9WEvSF6Bqspdqv4gUcOJ9EsI0mq1az8X3A==
/


--
-- FUN_POL_LOAN_CALC_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pol_loan_calc_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a8 15c
cM7JTS+krGjTGQUzm6HKklpQtKcwgwHINQxqZy8CAMHqRzu9FtupsAY4aFmK5nuYft9croRa
xeeoPlGstRnbPMktuyE0OjA0WFHJQw04MHN2XXwzJdDXynnrxJsIELTG2sxUxQgrw8u3n313
OUynqe8P2iL9qVyg3TQCaappblVsHn03HCqAA51ZneVNFEOo57OKskYtmXFXA0T28j6ym/Qw
LaCmrv3ANjVzEudkk0+hIyuRwUmipQ9eOR39+rOMjuiLduSRTKzLMumsPKej7m5sXW5SL5qR
3uwZh2ryKA8utTw12p8SBJo1vwpdtDfOw4vOJVc0v+aLgT0opUMRnA==
/


--
-- FUN_POL_LOAN_SCHEDULE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pol_loan_schedule wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
28d 195
UlnXSKFM0ru/d0oZVxDmYiXm45wwg/DxLdxqfC9AWHOOxA5hmR3vzFuGcVoaXXat3PJJ1VE1
pOZfJcmPzS1rRhpaYxxW+Pm1vNpPdo0U9Wa9hwf/NAU8oGG5R+4BmopAYTdsHamXjmbUS1mz
41BVtsC60euaSxmLMHh/VZKmujqRAkXDNpTqZov8QQgGdKExAasBD6CpAAZe5iJCelNccBjm
atsQ088To/+Z8AkakTPEi9A09MyoWZo0QXLKpdzPb3X4sy1/bakavb6LG/FsAkk12jjYzzOb
BypWhRyowoTEujZeiaclkW5hYPouCCSXt6ANpSu/LMdplevTssVsPY2kXDLaIakQIPit8kVZ
XHGh98YQ6yy8+1pIEbe7S24x6vtOQBOuwYFrHg==
/


--
-- FUN_POL_LOAN_SCHEDULE_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pol_loan_schedule_dt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1454 306
K39rSQq5KCyrIO4JjJUCxw86PO0wg81UzCATfC8Zgp0GGXTx9/K0wsnMLHaK0VmvynxYkpFc
9rAAos0aOyBzCAOEZeEq+sqo2aeS+puQnZj4uf8fwJBOZ0Z/B2SuKJv4hubRHCAsXdCWmrm7
QW/+m7lJtG+mFPEUoatyWBrh0lGifHFa5tGRZ8kJLFxsvb73zFlYdE28gknefGwpcGzXrD6M
Olmh9NR3ZtnAoFYBZq460/pmWCJY2Yj6okIBKQKn0Du9+ATAO7aHsTVkpkJabduJYlw8oxNK
PmNt5grlEWGS7uWO6pzjmTl+XRLRAfuswRcQTYbhmPK2OYnlAnYXNKwLA0d9Md2KWCVcUHrQ
G1k3eLr0ZgEd5sthBzipr8alb2radISwNgrmu/P+Avg+wc0G0eYXW3+aN595QV7pweJ6zlv/
hCzSEkiiJdHSxNAGjm1NEI67f3HgBIG26dTxqryU325/I+FmXE4dimPj8RNFjfD+O0aHxFRz
JhzS+MO1ybC0ZKE+wexRRgl4GK3AR3TV3/dtqwGYdd+HiqqmaeXxccQAOAaCCzT7jBWhHayH
omw9RmcWXH+4f9f8EYRbeFxk3pTUumi42N/FVUVVVFq6hBlcVEvtYQ4SQq9gAjWx/gG1/62H
qcaIi0k9Xvk6gYmqowANF+5+lpDWbLyE/LUWOvDy7dAHjKL1SoQGlpTSpZ3VfbO+b9J9gepy
8x1+c1U8bldyzvphg/xz/HKt+GxLRSaOxiA/+wrMLNk=
/


--
-- FUN_POL_LOAN_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pol_loan_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
256 189
bJBPhO1ewVzBxbCwWk7OVaiZkpgwg/D3ACDWfC9A2k7VSCbxVqR7bwG47hHIj8uIhPH65sVc
WxjvnoT5EM3xm3/DGFsez7vtcpDNTQ5nlVmlf6CS4KtVdeU9c4EJajwdqQlJVlpba/ALwrrU
+nUJwXRP1BYDkozaEtrB902eoWmeiHZGzzOivMrMkpZGJQ/ju+0Guln/gkSfQ3VwDnDRvENV
cRgX5IlKFLAe3KolCKnTOEGkM04AEOpGsKaC/lYZkcrKPGtp5oBxaTC2iZToQG3VvIo4hOgH
hXTN+NQP4I4D3ESQDV0LP1tgiB0PXBJMXvL3jk3M8qe/fJfliCfd4oJVq2o8bLtYrPhyRfgc
11ozjW8s7ZDyv7zB2wcs3NvxcQ==
/


--
-- FUN_POL_PAIDUP_STATUS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pol_paidup_status wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
c40 41a
MJmLXPIoose1icSJ9AE5VVV6LGswgzsrr0oTfC/NrQ/u/Q4JjRoSJ+zyy1nTDHDvCxd4SfZj
5Qlj5Uwyv7Wd39T9hnUvJoH7+06L1051WDhJ3j7njH34HpaB0viwIyPkCM2BoQCderw0Ioz1
Ny8nXJhJlJ5va5LA2zR6cLyXYuLUkGliG43lS6YoFxxbWW2u5TiUTcJFl1zC6AgRUXHBMEb8
2pd2QJfJmWjpXdjxY6UdYO+ejy71nO9htnCHTyE+IaLfH03pyXB2Rl2OiDNEKUcTjDHOb7EO
YV+X3JDOL6/0ZylMYWGFpjeLyFPzCxqNrCUB94yNap/xxw6UuDLbDUa9fi9Oiic0dwDzWxsC
9BJVgTQBxIbeQsf7XEmlHBv+Af8PYashK0gJY/fLRG4DfGuMbuIYFTj9fUWoBlYzbj2k0ZW6
5wr12Lg2538zFISFBAvy5p5+/D2Ae0dvM0arkVsqiRukrD6cZRD2ggZcK0rxJCNsk7XXyx4A
5Q53gd7IhzuLmY6ToS1ZwMPhJszsYPx/hCyzZRObTNeS4hsQJNeSGS7O/01MAX+WtUNboKCu
Rp5vPn72aFI8DvIGI+2l/xqvKBYy3X6itlKxRdKZ9ikPmiypHZurg8lomnw7ce8FrFNbDoV6
TUHXBPhJr2DsfczBjOvtVs27GSPyShhWgpzjWXnL9WHYG0MpCQqIpP14hF82DN01T2r3UO0p
xw/fGfk73+0+hEKzDSXOIcL2TjLnjiRCxKPQKnV8p+B6xouFFl51ucPXfO13XkdCHqD8eikw
emnAt/7bpksZGThVQcizuLh6Nzp7BbJrZmrbKJTstT4Z2y/ACM9OtQWxQsnp/gHXxwdlfwd2
hnBBC1h1z0pjeJr5Qka2xc562K1PAPF9Z3os9Be8O+Fmwz9EaGAqfw+kPWM6qw/J+AQxTPmC
M83RFj7WlFsOHWO1uk5C1vEBwkoHfzBN2nWl1fH5mjVbJfLYUe6ad4TiH6Vp5vbfyaZFUl7b
oAQZROU56sX2AD0hwZJVD0VME+E=
/


--
-- FUN_PREMIUM_BY_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_premium_by_date wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2aa 1b6
kiP6zb+Y+/sQLjwxI+CY36VnPFMwg3kJLq7byi+BaA9/xisTUz3bdTsckn8NFETFRLEA8/D2
Bjjwf7mvqpaKJeYuvt00Qk6Lf1AWK6EViDQsIoGx/ki1UrQesQ9zM5sDbRJVaUwMTZn03mRs
KOEVOZP1kD+JunAYpxZ2TRI1TdbK+zcJvd/UkeNBdPs+zMMfw3t6/0jrExR4rZovPP6PdLRG
9zyU6n7FvtxWCwHHiYIxSkoWQG56o6OmbCIvyZ+YFYLd6GykFX1d/+xXTDSGNE9Upgx58GtX
mEVuLsZU521KwkDqd4GhcOOkddEW+dUzhHyeODD7WBdmCtDJx/2ivHtu+FJT68eQW6OMShJT
kzF1asGeEvh5NJgubUBx9Z4qnq9EWh3OoF5t6gP98LlfC1uAPM+MtHcNaCf4/ZsDJLqdsHY=
/


--
-- FUN_PREM_COLL_RECEIPT_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_prem_coll_receipt_no (
   p_partner_code       VARCHAR2,
   p_partner_transid    VARCHAR2,
   p_active_office_cd   VARCHAR2,
   p_receive_date       DATE,
   p_coll_slip_no       VARCHAR2,
   p_coll_sl_no         NUMBER
)
   RETURN CHAR
IS
   v_receipt_no   VARCHAR2 (100);
BEGIN
   BEGIN
      IF p_partner_transid IS NULL
      THEN
         SELECT (   p_active_office_cd
                 || '-'
                 || TO_CHAR (p_receive_date, 'RR')
                 || '-'
                 || NVL (p_coll_slip_no, p_coll_sl_no)
                )
           INTO v_receipt_no
           FROM DUAL;
      ELSE
         SELECT prefix || p_partner_transid
           INTO v_receipt_no
           FROM acc_payment_gateway
          WHERE partner_code = p_partner_code;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_receipt_no := NULL;
   END;

   RETURN v_receipt_no;
END;
/


--
-- FUN_PRE_POLICY_INFO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_pre_policy_info wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
34f 1f6
yxwwWP14TzBWdJfKEjY6OSd7w8swg/DxzK4VfC/GEIteaAVgBh11fR1gt397EWXiGvbMT6tR
L6G477YczjNhHoMy1E0Qo7uqtR67SJyhWUQB55jHJkqBK6QKavmBUTND4qwwOytWsClt5jke
RrBtRpp0W6bd9Mh2EH7Ijhvl68H1OYtXRAYIVaUZGFkYjY4ACJ9d24mhIasOcdy9sSLvLvpu
4Gkjm6ZYouktfYWJcCt0Ug2xtBGLboU2aUZXFfw2kzLRmlH246Jcr8boNHW7gYu4GeEm9sc4
sP55c4gq1xhE3gTSPlrcCftv3xwoBUs/50THTM5w1DHTqyuVoyGwAGLnSVDIAKDjp7Q1BUkc
OHc5HeO4dbf/eZTxHxrZTk5OsM3dVCNSmhUol5YQ0kUImCVnvhO7Hpb1hLVu8Y0xxq/Em02q
DuxsZsxYHFksSyTstTSsVVO46MFVaKz6AkiJQkiB3yq0tbRs/DKC6WS8pnnlFSc=
/


--
-- FUN_PROCESS_SAL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_process_sal
(--p_salary_dt            DATE
p_salary_start_dt   DATE
,p_salary_end_dt     DATE
)RETURN varchar2
IS
v_emp_gid sal_master.emp_gid%TYPE;
v_sal_dt sal_master.sal_dt%TYPE;
v_basic sal_master.new_basic%TYPE;
v_earning sal_salary_earning.amount%TYPE;
v_deduction sal_salary_deduction.amount%TYPE;
v_total sal_salary_deduction.amount%TYPE;
BEGIN

               SELECT      F.emp_gid
                          ,F.sal_dt
                       ,F.new_basic
                       ,F.ET
                       ,F.DT
                       ,F.new_basic+NVL(F.ET,0) -NVL(F.DT,0)  NET_TOTAL
                       --,sm.basic+sum(se.amount)-sum(sd.amount) NET
                       INTO v_emp_gid,v_sal_dt,v_basic,v_earning,v_deduction,v_total
FROM (SELECT      sm.emp_gid
                          ,sm.sal_dt
                       ,sm.new_basic
                       ,NVL((SELECT sum(se.amount) FROM sal_salary_earning se WHERE SE.EMP_GID=SM.EMP_GID
                       GROUP BY SE.EMP_GID,SE.SAL_DT),0) ET
                       ,NVL((SELECT sum(sd.amount) FROM sal_salary_deduction sd WHERE SD.EMP_GID=SM.EMP_GID
                       GROUP BY SD.EMP_GID,SD.SAL_DT),0) DT
                       --,sm.basic+sum(se.amount)-sum(sd.amount) NET
                       --INTO v_emp_gid,v_sal_dt,v_basic,v_earning,v_deduction,v_total

                FROM sal_salary_earning se,sal_salary_deduction sd,sal_master sm
                 WHERE SE.EMP_GID(+)=SM.EMP_GID
                --AND SE.SAL_DT=SM.SAL_DT(+)
                AND SD.EMP_GID(+)=SM.EMP_GID
                --AND SD.SAL_DT=SM.SAL_DT(+)
                --AND SE.EMP_GID=SD.EMP_GID
                --AND SD.SAL_DT=SE.SAL_DT
                AND sm.sal_dt>=p_salary_start_dt AND sm.sal_dt<=p_salary_end_dt
                GROUP BY sm.emp_gid,sm.sal_dt,sm.new_basic
                ORDER BY sm.emp_gid) F;
RETURN v_emp_gid||v_sal_dt||v_basic||v_earning||v_deduction||v_total;
    /*RETURN v_emp_gid;
    RETURN v_sal_dt;
    RETURN v_basic;
    RETURN v_earning;
    RETURN v_deduction;
    RETURN v_total;*/
END;
/


--
-- FUN_PROCESS_SALARY_CALCULATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_process_salary_calculation
(--p_salary_dt            DATE
p_salary_start_dt   DATE
,p_salary_end_dt     DATE
)RETURN varchar2
IS
v_emp_gid sal_master.emp_gid%TYPE;
v_sal_dt sal_master.sal_dt%TYPE;
v_basic sal_master.new_basic%TYPE;
v_earning sal_salary_earning.amount%TYPE;
v_deduction sal_salary_deduction.amount%TYPE;
v_total sal_salary_deduction.amount%TYPE;
BEGIN  
        
               SELECT      F.emp_gid 
                          ,F.sal_dt
                       ,F.new_basic
                       ,F.ET
                       ,F.DT
                       ,F.new_basic+NVL(F.ET,0) -NVL(F.DT,0)  NET_TOTAL
                       --,sm.basic+sum(se.amount)-sum(sd.amount) NET 
                       INTO v_emp_gid,v_sal_dt,v_basic,v_earning,v_deduction,v_total
FROM (SELECT      sm.emp_gid 
                          ,sm.sal_dt
                       ,sm.new_basic
                       ,NVL((SELECT sum(se.amount) FROM sal_salary_earning se WHERE SE.EMP_GID=SM.EMP_GID 
                       GROUP BY SE.EMP_GID,SE.SAL_DT),0) ET
                       ,NVL((SELECT sum(sd.amount) FROM sal_salary_deduction sd WHERE SD.EMP_GID=SM.EMP_GID 
                       GROUP BY SD.EMP_GID,SD.SAL_DT),0) DT
                       --,sm.basic+sum(se.amount)-sum(sd.amount) NET 
                       --INTO v_emp_gid,v_sal_dt,v_basic,v_earning,v_deduction,v_total
                       
                FROM sal_salary_earning se,sal_salary_deduction sd,sal_master sm
                 WHERE SE.EMP_GID(+)=SM.EMP_GID
                --AND SE.SAL_DT=SM.SAL_DT(+)
                AND SD.EMP_GID(+)=SM.EMP_GID
                --AND SD.SAL_DT=SM.SAL_DT(+)
                --AND SE.EMP_GID=SD.EMP_GID
                --AND SD.SAL_DT=SE.SAL_DT
                AND sm.sal_dt>=p_salary_start_dt AND sm.sal_dt<=p_salary_end_dt
                GROUP BY sm.emp_gid,sm.sal_dt,sm.new_basic
                ORDER BY sm.emp_gid) F;
RETURN v_emp_gid||v_sal_dt||v_basic||v_earning||v_deduction||v_total;                    
    /*RETURN v_emp_gid;                
    RETURN v_sal_dt;
    RETURN v_basic;
    RETURN v_earning;
    RETURN v_deduction;
    RETURN v_total;*/
END;
/


--
-- FUN_PROJECT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_project_nm(v_PROJECT_CD INS_PROJECT.PROJECT_CD%TYPE) RETURN VARCHAR2 AS
v_PROJECT_NM         INS_PROJECT.PROJECT_NM%TYPE;
BEGIN
     BEGIN
     SELECT PROJECT_NM INTO v_PROJECT_NM
         FROM INS_PROJECT
         WHERE PROJECT_CD = v_PROJECT_CD;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             NULL;
    END;
RETURN(v_PROJECT_NM);
END;
/


--
-- FUN_PROJECT_SETUP_CHECK  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_project_setup_check wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a8 134
sAWW7dnWKkNXKyfiR+MI5+goe9owgxDI154VfC9GAME+M01B0idpS1L2CjJe8cPtQ2nFUQ4G
cvgTtKNjlB2o2f/EA4QVX0b0bK+5UsKcHjppXb8S1bnQbdf+6T+Rpg5QkRipwlypGC4Nuzt5
5V3hAi1m5i31kAmLVt1CWRwmmb8hG0pEqIJlVT9k/OHbkZHrCm+EbOpKUCBYEkTE4V5PU9vf
89NatmslPW4KJmERQ3bwTFAUPjsRMyNz8Gpvezf79tr5fHabCZWihiRIpYsRizMIroVkrrnf
iyNuOnWQSSQkCy4=
/


--
-- FUN_PROPOSAL_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_proposal_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
452 227
tQu7LUAh2X7xVGFquXCwDIZSI5Qwg/BeLtCsfC9Vgp3gSGcrtpN4ElSGayVRFFDxYX25JqgK
yXh/cC8g+c5iP+GsUsvNkYvXHvZO/JV3jSKMSxmwJxMXBX6cfsPsN5Qm4wPjvY4Wl92wfIBo
kKj5yf2m3fRfOjvJyswrwQ1YZdGm9ldLgElaZ33D/45OekPgTGtSV6jktCHlf6heT6c99lGE
yKlTCUktypcBdYn1wRwRjfFVT1J5Em4CIxPTI6tjWbv13BE64R934GBXs/jz7gsE1sd3YLxx
01ypq4A3ofBvwRj/IAm50ZKtQP6285XvjE6HZkHn+v1ympizPGrAIg4oK07Y6jDEgQa0kNbw
vZj02nbdihNiPWfAJDYKkMRMelftgObN0Y2L3X7eepYNDNdLsK7t/llEd/V0SsxQeeF5718U
CRxtPrml5oEPEUl1IdXd2TMpJXZcJhQLxaLSulJhL64J7nOfTv63jtVUG+kJwRJ9ctwuS//A
hRiaXMs6xTEBJpN4uTpOuiqec+0M3dkkQ82BuA==
/


--
-- FUN_REBATE_CAL_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_rebate_cal_tp (v_rebate_cal_tp_cd VARCHAR2)
   RETURN VARCHAR2
AS
   v_rebate_cal_tp_nm   VARCHAR2 (25);
BEGIN
   BEGIN
      SELECT rebate_cal_tp_nm
        INTO v_rebate_cal_tp_nm
        FROM rebate_cal_tp
       WHERE rebate_cal_tp_cd = v_rebate_cal_tp_cd;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   -- raise_application_error (-20001, 'Invalid code or Id');
   END;

   RETURN (v_rebate_cal_tp_nm);
END;
/


--
-- FUN_RECEIVED_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_received_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
4a3 27c
jrb5g4iJc9zI9CrdTmrID3sCQc4wg41eLUiGfHTNimSPCSH7aFG+LTdb6lEL+xhdCQmDEyEU
PrhqgamEBSYsqvHNVwmrNlfL3xQiIgnQkYaOA+bVMHMwTqr+BXNkcnP/u/l+JD+7mhk4K6Zn
wZiNj7h8axUXXrb29pLMy6bWoPN0ECiYNo8zpo8N6angHHNGPPfs4J44Bs3UtmWO/V1B9qe4
FX5SqiQHB56Jt8CTFDPj1WvgfIAb9hXgTVitZewGlrgiQtH8PX2ICbLJaWYDL+0AR6AnENLh
IRqx+6ItdnKgiYdNYNY+am1fJEatNVNgATfxtMFvva9oLmhfhESJQetZadUcUO25PbSpgvmi
M8UeFUR+fWeNKhR9eI+sgyJcEVB5e4e3P2Ek2nFgzhrHfFVrl8i2jHdF2qclDgHNvhx0XgGB
xJ4bUXDOZn6Jf64yO6B5oF7PQqJBR9eEjSZSoOt+v5OG7h6ZSJcTztm9KFh8hassV5T6Gt8w
h+NSwl8SIadwp7anSxY1UaMxM3cqB7pUR21ZGnbMkWr6TGL4kqUCOB8fmHWLrjclIn5MzRKv
YAeySpkl8P2nyH0vNYuqjH+fFkyBtqGMdfBeMTttuqA0klvAfJTe
/


--
-- FUN_RENEWAL_PREMIUM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_renewal_premium wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
50a 280
pMT+kUlD6HqPfVAKtXlArL89FFYwg41erydofC/NQp3gSAgJSYp7fg6TYQ4N1Ew3KqORraGu
UQdijuxp4WudD/qnYjFSaz2vX4CuIIsA8OWn8u+Or/7EH/gjQr7k+TPr+SPterUwEkB+RKYX
ugPUtIK2aMDJLxXTXSIi93LMrHGixVFNjYB3+7/JDzvDdnn6qOLL/t31QuBF51pyavyjZq3g
8AmgwPezXAz9+AyqWs/731Er9ijrEaMuNz9sq08SuPCJ8lEBCQ2R1PzIeXitjvZTJN3Jmu9C
bbdmIhzEIR5uy/bKPjz7ykSTSlw9KdymmPPdQRsZ6KlTSs7pyCRQcPBj+0pjx/3C9E6tcXlh
6q1okg64r/9bxNHOXRTNe5Y0rWDX/R6/xTsUpac94sJbK20dpTpL9YNuyCOnWBvBhuHZP9tK
i/+p7fr7M5blxJXK+EjIzV+0OT3MzrgBCz8bBReJOe6wET+qeHheMvsP1TKHlSkKCZOAIdDj
iVkh70FZSHqcVFd1gpCz+GqYd8ZDHw3QelR4zrXYE4mvgdXls26/xNRXv781i3dnb7/AU0qH
ZFt7ckNV/Pm3PG/s/LpabQe/btfdSmiM5afYYBWAK9Dfz84dpKViuQ==
/


--
-- FUN_RS_ID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_rs_id wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
22e 150
QHIPgUUiANU1sL4UQxvOylLxKYQwg/DMAK5qfC8BM2RTYmE2lGMLSXi8oKcVrXsFPhOc5Qkf
OS+1LBMbabPShhseVfhXAHj3/HCkr/keABDP6GrLkZzPcAz2fSqx/deW8qamC+NZnXVLvA4Q
4E/YPmQ4+8BrpwYgK1Nhw00cutgdoJDfyogSkdDKEHFDoLZwWerQ6fUQi7+4GmMM+2nXxUSu
fOp4edGCG7lxboQ9x2zoYmJEeDwwoqufZHBRSMfwSZUsPgw3ICqfQ3KXwJg14cD6fQ5ehmZz
MEZfy1LW7OATzWA32TYztXVe4RQdLhqoku79T/cg8A==
/


--
-- FUN_SALARY_HEAD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_salary_head wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
26a 185
8QLZSdie2PpAop8MHu3F9RTtdpowg2P3fyDWfC8C2vjqaAlsk3v1VpeP7IzKAseRWQkb2cWi
Jo7uGN1Qqg8Or2uEw1yBkVUS/pC7rZehfaLTdkWDbs3630+LVDHTp3SmnxtgHKvzFTu3CNd9
QlMEuzIt6WGr7JT8cfOKU9N/6tBfF4IUY50VFqQ4+xLUnEZAh6qINFM1a+4GkbZmqGJkgs+t
CWWBziZF0MyoWf3iZAU51h0PREgHEXW/tsghqLFoomWw9IwSryhF7Zrrq29do+Nx6pxtcNw9
CeyJXjiJaBeqsEBVxilz12GUiWENJLPCwU2KLJYC1vbdDcblN+jCF+qqTveSicmdNNKgXN0j
81FuWSxX6pUWNr8P06PwXw==
/


--
-- FUN_SATT_AMT_MAT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_satt_amt_mat (p_pgid VARCHAR2)
   RETURN NUMBER
AS
   v_amount      NUMBER (10);
   v_claim_amt   NUMBER (10);
   v_bonus_amt   NUMBER (10);
BEGIN
   BEGIN
      SELECT SUM (paid_amount)
        INTO v_claim_amt
        FROM ins_prem_acc_receivable
       WHERE pgid = p_pgid AND proposed_status = '1';
   /*SELECT   (DECODE (m.clm_cause_cd,
                     '02', s.sum_assured,
                     fun_paidup_value (s.pgid))
             * c.percentage
             / 100)
               clm_amt
     INTO   v_claim_amt
     FROM   ins_p_summery s,
            clm_product_claim_mst m,
            clm_product_claim_detl c
    WHERE       s.pgid = p_pgid
            AND c.clm_cause_cd IN ('02', '06')
            AND c.clm_detl_cd = '01'
            AND m.clm_cause_cd IN ('02', '06')
            AND m.clm_detl_cd = '01'
            AND m.policy_status IN ('03', '08')
            AND s.policy_status = m.policy_status
            AND s.product_cd = m.product_cd
            AND m.ben_party_cd = '03'
            AND c.ben_party_cd = '03'
            AND s.term BETWEEN c.policy_term_fr AND c.policy_term_to
            AND m.setup_id = c.setup_id;*/
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_claim_amt := 0;
   END;

   BEGIN
      SELECT ROUND (SUM (bonus_amt), 2)
        INTO v_bonus_amt
        FROM ins_policy_bonus
       WHERE pgid = p_pgid;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_bonus_amt := 0;
   END;

   v_amount := NVL (v_bonus_amt, 0) + NVL (v_claim_amt, 0);
   RETURN (v_amount);
END;
/


--
-- FUN_SB_AVAILABLE_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_sb_available_amt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
31a 1ea
olhc/xnfhZG0ayF/elYBtvWofvwwg/AJ2dxqfC9dbmS0ul5NytK0yNYLIKMMP6I/oNKRY9Na
WgKZ0LtJ3ITsnuUGDG6QkC2xgo3qd1I7jzpOYjS75k49NIoTVfk+IWQsyBumaVsHYBVLiZxs
7DH7ZYcCYtNOW8P913oyN8LnO/Rr1eCLABHtdNujIMiyNJGrf9b//YFeBt88PK+nN1rNjf1F
OMxnp0ls0b4YAI3f3TfVWmKeGssExErE6zUuYdONHrmt1quyebWF07ZXA8WMbGmo0O/nFQFw
fdut/8kCOdrLbBngdkWpod9PbgA24+CkqJf5xJ3+UaLENcNp9q8pYQoCl3Z7YGywlk3wHDkc
GPeQHzCAF222jNodAjwyciz4YRY/9Eru/XzNnDXsQUCGq87Ns8I+aK8Qp9dwIteMdmFfMIdB
X1GC8de2zxpUxkZJW5yOEbEjPZXlVU35CYT8RhGtGEPqmrecoH0=
/


--
-- FUN_SECOND_YR_PREMIUM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_second_yr_premium wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
81e 31a
gGu8KPY19qHinTIWHxMqs4b/C/Ewg2Nc1yATfI6aWJ0GVZ7VJubxK1wKLsBLk8jdotT1HvoH
O7efEXgy/Di1c0H0f2Fr9lHthF20nf6BEiyOpHIBMbjO+ZsaPyTPczrSLnNCK51BLByqNHrm
dvvdh1wajSeu8uUW93RfiXaq0umrUfJKSRlfFhk9uht0SK65XFVp6MCejNJT2mabpPPV1nef
Wlw9X4w4r/zCChdiUXh4S+oGC27/3VbF8iFZfDG9SEeAAQq7uXzINCZYZjLrUt7thG5iXlRs
uE77p8RbFM11waJPzbfKALFgOe8K26Ynm+nMK44QGQOp8Z37Z5nROh2P0/uMfjGw8fYCwnVi
BYCF0gpoLRwCJcIYQ9MW2S1ILxIqWe5+WJCoKJJLFWqjLDwwU1moukneXQgQbvDXcIarlnih
ISsM36jzN9apgPhU4+g5g/eeJnzUhwyqGUZqxkZ+iqln+iOIKe+J4BVxuaOQvCTDNdO2k2d6
cmj9I0p2Fv8rSSZ94HGQGi25uo+O8PDLHhECFJIk2xJP5GusbUuptaAGAOzodmCaEMDsubiv
5Tz7WewRG8K6H0ixDKkN9mCYj466BTOafwMTMa+Y8nm9qBNHVUsVUVjkR0yz5xaBK7KxPZUC
T+Kv6i4DLILb9/XxaGU6WH+5fjCsvvATz3dOF7bo2pgsabX8z/mZhqXNHx5UCgyxrA9tobJV
jXy8GksEvtxoRSdhkrXcEYI1pOa4kBO7o3aps1NglKTqYt/nmyOWVvO7+eGxMDRM
/


--
-- FUN_SECTION_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_section_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
26b 181
L3uNTgew0vVyiwT6TWnFKGFktYMwg/DxfyDWfC8C2k7VSCbxVqR7bwG47hZa7tF7dN4b1Scm
oyav0zdrtbxAOZ735dTrMbvtu8+njG7hkHyvurpYXjolz7SXw4BUI6ZpdXQSPTZrBeZWKbjA
/gpo/HNv7VwfL3e+L47yrFT67bDCrUAlJBaJM46aEtuwRkVQVFON7tQ6kuBLT5SpRiEP0gQN
Ws5R7srN4I5uplXPHjFTP8HbwabEt3UM8y8Tad4BZv8+epmDvQuxOjQo9lTIecrCeYFFpbAU
134J6RLvNNni79727jBNvIsO5nnAIRYVm5bojI4HcmE22Pa6cjWKwMBDXFNClh7rrhz6ALRd
HVawuY27MpLXeARcp3c=
/


--
-- FUN_SER_LAPS_INSTANT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_ser_laps_instant wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a4 158
0zOebIdveNJykV9WR+2GQQeWrAgwgwHINQxqZy8CAMHqRzu9FtupsAY4VVmK5nv9yXg9BS9Z
AuahYyb5P3hh3228asI0OjA0WOVszfBsMLV2kWgcAZoQX8L91F54biXwBMCH9x9M5lBgLYc+
0WVw0mLrPaZD8YjoKtuSAiUGqLobrs5+FljkOv7vByonKMzjqCCoSpDuGM2r/NShOxXHqIsI
2Z6IqMW15wjR2dX0ZKsTKaa95FyFysrVY5vyxQUJvSJUtTUr1GtN6CbwK16nygMBWrsYenK7
IDg4QGRInR7uzVAg7rg265bCx1saDFhONeswBalZhhMge18XOw==
/


--
-- FUN_SETTELMENT_PAIDUP_VALUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_settelment_paidup_value wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
c18 44f
QMfrPD3iXqUuhXRNNkQZS5wHfIswg40ruvYFfI4Zxz8Ch2DN3PUuRblrqB09p7bWYoiTuYtJ
zFQ51uKOPLn+rhhik4CnusWSyPzPwTOQbXH1VrdsF32x2YySEs8/IiLkrSIiCrD4miQPQXed
+Aec7/Ir52vaPYrZdr7HgKKfyuDWW6iGGEvmXG58cyQe/LrFKyb3vcXar4pcMUrUMFzJ7fHD
d7cuw8IrKuXN/OwY+RXnJJe8awXMB9Lli61ck7xNhjjPPRigCR6cviW4JozwTf98vDeHw+2h
JePhmozGmSwGCif4GKB5SX3AtBw5kVYwGQHTG3bJiny8i2IXkGDM9wLs7QRGHx2iL6EQlV+x
DZeBbKOfKXzKPGtRGxIJXCoBZdMedLYtDgHC9pzCgX+8whde62AewgoXl/NZ27WHpeK9CSyY
XAt5NsK9BHiQ6yr8SsOQxlVQMxaTDwugocRIVDA472kAbOFnZHxF3GtcwluBS2kXCHctKheb
pcVHRXoyvoHax4r/YlWcRxFFLJKgoFFYogHrkkxtrh/J4AcPGXYGlH5s75CB+zO7B/w5I/T7
R8HOtnEiaUmk10Xz9NsG7DFw9nyV+3uwWP+FNtPdUKO1efU3f5IYsx9fIfceIQbVJakKJnIU
BwXhagD07p50R8Y5LweEKutYCPSvPFjuAMKP3G6osEpfGKdUFjZk7nerBny0oOjcK+74N557
jjF6rtr43POnBxBNAujAGfBIMlDr60sCXPRa6FpbRXCiGYsZ+/KQcrQhGYrIhyJ70hQzkRDL
rcT24N4mEcfMhMEOIibfNBlTU5dmSIoF0dTWemkgi1bQGRjSbSD60jPYlkEEkDw7SSz0gX72
J7d4cdFuYwZiT3iX7Hv5VgKPKjFrA9nXMUapoGsx+FIDbWAh34DTqrn/CwCNRb8XV6AnjO47
lpqUHGjDUCIQD8nfJjY/xZUDrbI3xI4fnh/RD7/fCBLdyJOkAg9yCLbfNyZXpHXCRA/cm7MO
OjrvjPA6j4e+4iVP1GjYw1GehNvFKzex2E9ZuPAfecN4UFCvfuobUVEL5WMJJS30NEdhLPkd
bDuPTA==
/


--
-- FUN_SIMPLE_INTEREST_METHOD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_simple_interest_method wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
12e 124
zWO2Hvg0aXdftQbYvvcdTj8dUwgwgwFK2Z4VfC/pTMHVwlnpfMVTaXF3yXdnkKchNb8xVC1w
XKD5nesfjmg2i2jHvjGtX9jcyA+dKLU+l7EA/pWMl5o6sJsBh1VBH9EJjH8l3nRx74C/aKxY
FhcV6E33MlqMgTZbK910VBeStx5fLWKKJlHKGIQdVuvomZXm3IuvRdn0ZN9qQ38fc131LYk1
spKvKVmXqeVVdQ5lTLhKyjsQn3umEKgIxaBrmmzLlMQqJxCooUiJRk36+WVnPSKMLBBuabw=
/


--
-- FUN_SUM_ASSURED_IN_THOUSAND  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_sum_assured_in_thousand wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
9db 248
fOv0+GHa7+ZqFn9pzDGIVnCyImkwg82nLvbWfATGvzNeesTFjsmYnAwIL4Etnuxa07qDDBb1
C9rY1jJz+QyjO5b2Aq+0AYvKoT+qTpuq0qFRrDllOI5BKNoNJDQm1z+qzjCD5bGQks9CJIp4
mGK0b6ZdGAv/U8PAjYxIluco4BWwhp7/gXwY6fPPB/ZgoaMt0Y4U6VKykm5QyrxlfnUmQtPm
k0XIgWeoXFoUp1DDDKkhfi9eA3aEV5esXg7pi+/E0ziSb/KOWGbmjnaE6WUraSaYrqtLSeKC
A/wG9tZNQmL0e4cjfOxfdPd/HJRF51l/yN2Bdai030wacB4xStAn8hd04h3EfFJM6rGwSlzN
32vxTHEZk/NSp95Yab7MAYXqlKPUhfPhpwFJ78+JDKKDfPB9bD3ckAd6M08i1mW0hx6YdYhs
6AYl+bC1cLV57kVje8SSWUX9WXsNg1F7qjDXfiXBXXOPXShufm2riDH2bH0iaiw5aqqapWHY
enTtTr60H9DGqByqHNDLySrJMlMhodJPkfxDjWq8XQq8kwTew1BvWU3xf9VGQXCfTkTAnYdl
/


--
-- FUN_SUM_AT_RISK  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_sum_at_risk wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
a72 384
MYvK6ntInhPp+jqDNjGf6vEog08wg0MrLtATfC/NWA9/eA5tCXCYO0XMy8t0vaN+yHklwMIj
JsNczWsFc7UNvQ8bS7PiIwoozH4kcsYTeLeRKgyRh2XOM9IMACJzww+1TZqaLKqp6ib8yLDI
glfzQXa90BBbpleX7IJwKlXvv8A4/9zyd8PzqCdKPlk8iA2QcBoGvjBUlcM0WR6i5dtlgqKm
GZCa76GEM0TF5tns+pT2GsygWVLJ/3XsVPGFPnHR2fFWbD7D1kYf8MvT3ofrrYvbjknTTw2E
VKA2wnyIoZH66oYxhqgXOa3PswxwN/Q2LYi9dNJICW8DkKU4YRsI3S1ufWoCWVtZ/5HeXD5L
9iy0GlukmIJJ2fXLdV+cwxLT5WXoPps5oqo6OuN2a5SLy/+eVXtVAUEx4SWXgWgWnx24jHyf
c8sb0IXUMOgUo8OfPXQOlliQhK6Vpv322h3LKVnSnakeZf1qmjExL6fmCndMgPyfz9AP09hZ
H9qCbXTykNEfPL4uZw/x3DL+2uewpzGFlkcTzj8XWO5F816lpnoSHDSk3pukU3F4nCjfzGgi
Hj5MI8H+OOCobwwsqjDe15h0NPVeqK7IocDd30qh9SI01hZ0cwGttF7eob2hNcZamfFe6QI2
q1ZxGhaZWpyR5njm0O7yDXnIyxOtDGCC9Qt0SRpvMCuN/WC5e1DONEAF7+v0wDHS3QWUcFxv
QiUWqPTY6W3koEBx63MkKzqK6oZCDWT8XWjV2Z5UNPggyamTEB9MSxADZTpzYcb//2SfDafI
HH3EzRegPO5OBDgicAb2SFFQVzAsvDyvVT16IryX0ttWvM7w0QxBDZi+o9EywGxNA2c53vW1
nmK0PH/LA+yTByD54YdBafM=
/


--
-- FUN_SUPP_BENIFIT_PREM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_supp_benifit_prem wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
21e 199
MD/CArR9h24uVN1Ku5EhPhBLs18wgwH3rydqfC+iEjzqimNwnHAldvYJS4oyZks85qclkhQW
FMiE1t4TtWSO2hih9S/ggckXKuVijWCgNgdO+nNBB68Qza7GaghysiT4IFoEphaw31GsOtP1
MXuwcRdjolUXN0Lf7RWVTQjE6BGr9JF2Deqyk/rMrlrQAkgjrtzbdjjecCGrCr2fAtHEAod/
swL8/xPFQ1fxXqsBd2ebRXHdxQLEKlbH1FLvFqUIj+oHsqc59fYmrNsoKL1yiwNAShWXIQHE
xuwzGYKHPEWNf/Tz3aMEj+oGC22r7vGPIxhlGGulhKVWn99NbDR6FE68P4WCKAClA6KUP9Dp
1aw8MGpI5c6CVWiF39cWGsUXA8+3mLFjrZmF6yRKAUZ1
/


--
-- FUN_SUPP_PRODUCT_PREM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_supp_product_prem wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
225 195
H1D+9CogTwJWa3JtcrOFFImxwOEwgwH3JCBqyi+V2k4+SCaR6veNydgery2WvdN254SjrnRz
Aw0Ng5L4H9MHVCodys7tEsYLwU0tcfM00E/5F3Y5JM+q7UqWnTgQ+Klf+6kzI3K6dSjcsCZO
g7/c8iEQ81i6BfZxkCruPDzmWhQeoUwhXV1v10bSVP2zW8Bmi+fZ7wtQe4S42C7HTddACNFB
HNYmy0yIPUC9AdM1n52HrxsHB548bAUGQV6OGi4EpJ5+VgRDTQJW9ShY0YvX1Bho+noXsbGj
DXwuxNqMkZfgZnG4UB8GKak57ok4KgJY22kH0fV/HyNtYBVVZk/GJ/cniB6Px9Z7+agMnzaX
OetIe70SRXvxtgZWGmGRA4kDta5HDG9YEyRngge4
/


--
-- FUN_SURRENDER_VALUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_surrender_value (p_pgid VARCHAR2)
   RETURN NUMBER
IS
   v_surrender_value     NUMBER (15, 2);
   v_last_paid_inst_no   NUMBER (3);
   v_yrly_no_inst        NUMBER (2);
   v_premium_paid_year   NUMBER (3);
   v_surrender_rate      NUMBER (10, 6);
   v_cal_para            NUMBER (6, 2);
   v_age                 NUMBER (3);
   v_policy_term         NUMBER (2);
   exp_policy_info       EXCEPTION;
   exp_sur_rate          EXCEPTION;
/******************************************************************************
NAME:       fun_surrender_value
PURPOSE:    Surrender Value Calculation

REVISIONS:
Ver        Date        Author                      Description
---------  ----------  -------------------------   ----------------------------
1.0        05/20/2009   1.Mohammad Arifur Rahman   Created this Function
******************************************************************************/
BEGIN
   BEGIN
      --p_pgid := fun_ins_policy_no_to_pgid(v_policy_no);
      SELECT ips.last_paid_inst_no, ipm.yrly_no_inst, ips.age, ips.term
        INTO v_last_paid_inst_no, v_yrly_no_inst, v_age, v_policy_term
        FROM ins_p_summery ips, ins_pay_mode ipm
       WHERE ips.pgid = p_pgid AND ips.pay_mode_cd = ipm.pay_mode_cd;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RAISE exp_policy_info;
      WHEN OTHERS
      THEN
         RAISE exp_policy_info;
   END;

   v_premium_paid_year :=
                   ROUND (ROUND (v_last_paid_inst_no) / ROUND (v_yrly_no_inst));

   BEGIN
      SELECT surrender_rate, cal_para
        INTO v_surrender_rate, v_cal_para
        FROM sur_sur_factor
       WHERE policy_holder_age = v_age
         AND policy_term = v_policy_term
         AND premium_paid_year = v_premium_paid_year;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RAISE exp_sur_rate;
      WHEN OTHERS
      THEN
         RAISE exp_sur_rate;
   END;

   v_surrender_value :=
      ROUND (  (ROUND (v_surrender_rate, 6) / ROUND (v_cal_para, 2))
             * fun_paidup_value (p_pgid),
             2
            );
   RETURN (v_surrender_value);
EXCEPTION
   WHEN exp_policy_info
   THEN
      RETURN (0);
   WHEN exp_sur_rate
   THEN
      RETURN (0);
END fun_surrender_value;
/


--
-- FUN_TOP_SHEET_ACC  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_top_sheet_acc (
   p_glac_sl_no   acc_gl_coa.glac_sl_no%TYPE
)
   RETURN VARCHAR2
IS
   v_return   acc_gl_coa.glac_sl_no%TYPE;
BEGIN
   SELECT glac_sl_no
     INTO v_return
     FROM (SELECT     *
                 FROM acc_gl_coa
           START WITH glac_sl_no = p_glac_sl_no
           CONNECT BY PRIOR cntrl_glac_sl_no = glac_sl_no)
    WHERE (   (lvl = 2 AND glac_sl_no <> '300001')
           OR (cntrl_glac_sl_no = '300001' AND lvl = 3)
          )
      AND postable = 'N';

   RETURN v_return;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END;
/


--
-- FUN_VOUCHER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_voucher wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
400 1fa
stR9Q+yQMImY1i8zs4nisDBX5ekwg/Be2q5qfC/JM2RTRGz38kRDqGvjrzLReWnggGG2g/od
4X83RsPo+TCK1EijKokwLfX+ALnYckJqWNE2B/7XsDo6gzQ/NBCEWaYO32Ji/UbHsGPxYiZu
99t/FPxgm7xUFup5LtWrYaLeU1dcDl9Y6d6gGnFY8ikpy35rnCNMC/IzF0ptrNoAAmxl7cd4
y4JcDHlXO8jS5QViouqzUjWZhtSsVDtcYCrcyvFl8vk4jSrXyv/I9HSoMyDm+c8v1SMQti6f
9n8x3K3ioGNuSUfhaxyhU4FGOlQHmGcEHri7vXI7doAw59p9zMuMDaioHdKAZVeiIQ63Zyyd
4ky4YkoJMY3HPsX9StFMTJ6NsuBEHTqeuMRgUFKTeqw0tMUjbKevXs7M9CjisnjST4twQYmP
GDjNvGwp9Ve4OH4RJvrpaoJQYV3tMF6nKRwbfoDlarydFGKJMqIM//0cRyVtD7Rks2k=
/


--
-- FUN_VOUCHER_INAVAILD_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_voucher_inavaild_amt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
65c 2e2
KhAr+auHc9yEZOtFTnKsyCD8GqQwg43DLm0FfC/NMZ3gSC2oRn5rSbfWZvot3adfFNoFt+eY
YkwRxGlF+Pjawoq0GLffpFpfyRnPANdNEWwN5qHOkjP8Gaq8ABD4m9ntNEEZrpaaT1UpxiBa
tqYRaGtmd1iXoUQ1RtudShGj03NSpGdfVLmeOyd11jSfy0sL4/amSBacX1oew8xfTW0hEfOJ
2pdw0R/KqPAD12yF7/FH7yHEO6fKBSNyMmZfsTJ9PffyfIAnbcFwR7cAJOcp+0DqbjOn4qx3
oCoafgsqr3F99zs4BcbLkDhPzN2zJbaiFuncTKU78AIjpB51O6my0cbx9suBySfPW3578Dc3
WkBN3A2g0h9DNYaoFUfRxx9VeUae4hDCPTPrJ6DpdfRDTI+RYOQjwsnq4YKZEkjQbtkRwHqP
ehb3uhgPtf22lQPC1Gbqkw8evneh4YLDiB5QxsBVeLyRuIlWPBYQ6osHmGWGR7AMaOb/A0Ap
IDxCDCPFDEzQYqtuM4tBGqcRmYA4DHUoBZpNo55cCZIl/k9rs+G+EwJFmNa69zsrPcMuM9AT
bVvQJJ4L1/FzN/wHXXvQnJhFqQJzbs1M7X/lPVTu4HMbOp0uff2tET3fQTzeC07b/UDGVvAZ
E1auzu9D8Kqat2lsvL+XgBTiaTuKuyVRn01I48LXchECK3lIFbhbDhEBffH2Wdx7ZuUiEvnu
KLK/cL4=
/


--
-- FUN_VOUCHER_PAYMENT_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_voucher_payment_amt (
   p_voucher_no   IN   VARCHAR2
)
   RETURN NUMBER
IS
   v_payment_amt   NUMBER;
BEGIN
   SELECT SUM (trans_amt)
     INTO v_payment_amt
     FROM acc_gl_trans_mst m, acc_gl_trans_dtl d, acc_gl_coa c
    WHERE m.office_cd = d.office_cd
      AND m.vouch_no = d.vouch_no
      AND d.glac_sl_no = c.glac_sl_no
      AND vouch_cd IN ('02', '04')
      AND c.glac_type = 'A'
      AND d.dr_cr = 'C'
      AND m.vouch_no = p_voucher_no;

   RETURN (v_payment_amt);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN 0;
   WHEN OTHERS
   THEN
      RETURN 0;
END fun_voucher_payment_amt;
/


--
-- FUN_VOUCHER_PAYMENT_AMT1  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_voucher_payment_amt1 (
   p_voucher_no   IN   VARCHAR2
)
   RETURN NUMBER
IS
   v_payment_amt   NUMBER;
BEGIN
   SELECT SUM (trans_amt)
     INTO v_payment_amt
     FROM acc_gl_trans_mst m, acc_gl_trans_dtl d, acc_gl_coa c
    WHERE m.office_cd = d.office_cd
      AND m.vouch_no = d.vouch_no
      AND d.glac_sl_no = c.glac_sl_no
      AND vouch_cd IN ('02', '04')
      AND c.glac_type = 'A'
      AND d.dr_cr = 'C'
      AND m.vouch_no = p_voucher_no;

   RETURN (v_payment_amt);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN 0;
   WHEN OTHERS
   THEN
      RETURN 0;
END fun_voucher_payment_amt1;
/


--
-- FUN_VOUCH_GF_PAYMENT_AMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_vouch_gf_payment_amt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
25e 1ba
3xV4y8oEuAWruAiKygs8oOGIqEkwgzL3ACAVfC9A2sHqaMlmqEZpxE3WLXKoCX6ASoTZ9eZc
3h8RW013qg/a6HeIBLvtwe2uKgTu/faPuK2z/sFDgdYZKNINta28kP+gJEE4PLM8y+DWSl8C
1N2n2i3uSFxvpo9QKP+piNKrTLPSzAUJxr+r8EniEONewsU8VHgb4QBhFnowxi4sWE01Fs3N
dxP1Q9hAg1LluvJvVRJQTiYbEJmb6L3ZNV8zwXxXrIdUY6s3FBR6N+TQCZmPYDnJaIJIiPed
yu9dUUi+DrwuX4UVX/LUUBZoJ9Sn1d9bYc+RAUBxkD+xOE1qVxMh90pGbUVw/tTZqgmUMe/J
tx2nXDeW4ZjO7mak7+SX8V1Bt8LWiP7+Ne3fRSuTK3iDQNgeu+AEG17WoYZpO5u5PWqWF3Gc
hA==
/


--
-- FUN_WT_MTR  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_wt_mtr(agreeid in varchar2) RETURN varchar2 IS
cursor wm is

-- select wat_mtr_no
-- from
-- uts_building_mst
-- where
-- build_id in (select build_id from uts_building_det where floor_id in
-- (select floor_id from uts_b_f_elec_mtr_det where
-- elec_mtr_no in (select elec_mtr_no from uts_agreement_electric where agree_id=agree_id))) ;


select wat_mtr_no
from uts_building_mst
where build_id in (select build_id from uts_agreement_floor where agree_id=agreeid);


v_wm varchar2(10);
f_wm varchar2(100);



BEGIN
open wm;
loop
    fetch wm into v_wm;
    exit when wm%notfound;
    f_wm:=nvl(f_wm,' ')||v_wm||',';
end loop;
f_wm:= substr(f_wm,1,(length(f_wm)-1));
close wm;
return (f_wm);
exception
when no_data_found then
return null;
when others then return null;
END fun_wt_mtr;
/


--
-- FXN_BOOL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fxn_bool wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
9b be
mGuDxlDQKa0M8gPGC7q0L5V5arYwg1xff5kVfI5GkE7VSKCPUABXGiMmKBWZGpZMmcvc4Oqq
vCZNj/XGEL8fCkFZwgYzz1axMu27wcjFH8zjq4CnywIrbeCFrX9Nt/qydumkpvRQrXPfB7xq
83NgihW/HZpCdN5RmmbfTgfYdyizx5jS4iaa7ab2gmxq
/


--
-- F_ACC_CC_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_acc_cc_nm(v_cc_no number) RETURN varchar2 AS
v_cc_nm acc_cost_center.cc_nm%type;
BEGIN
  BEGIN
    
  SELECT cc_nm INTO v_cc_nm
         FROM acc_cost_center
         WHERE cc_cd = v_cc_no;
        EXCEPTION
                 WHEN no_data_found THEN
                 raise_application_error (-20001, 'Invalid code or Id');
    END;
    RETURN(v_cc_nm);
END;
/


--
-- F_ACC_COA_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_acc_coa_nm(v_glac_no    VARCHAR2) RETURN VARCHAR2 AS
v_glac_nm             acc_coa.glac_nm%type;
BEGIN
    BEGIN
         SELECT glac_nm INTO v_glac_nm
         FROM acc_coa
         WHERE glac_no = v_glac_no;
        EXCEPTION
                 WHEN no_data_found THEN
                 raise_application_error (-20001, 'Invalid code or Id');
    END;
    RETURN(v_glac_nm);
END;
/


--
-- F_ACC_COA_NM_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_acc_coa_nm_shnm(v_glac_no    VARCHAR2) RETURN VARCHAR2 AS
v_glac_nm             acc_coa.glac_nm%type;
BEGIN
    BEGIN
         SELECT glac_nm INTO v_glac_nm
         FROM acc_coa
         WHERE glac_no = v_glac_no;
        EXCEPTION
                 WHEN no_data_found THEN
                 raise_application_error (-20001, 'Invalid code or Id');
    END;
    RETURN(v_glac_nm);
END;
/


--
-- F_AGENT_DO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_agent_do wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
14d 11b
n1mhgVLMvFVMMAsMyBcdg3e/5bYwgy5pmMsVfHSR/+owNScfOWDly6hSBVo7tmPeNz7mBi2v
FbVtoj5rh897+M++Iba9sCGvag9P/rHGmhlpBHK6FMGNRli6s1KYloimVPW3Y0d/ImCfMwkH
PDGo+p/TF9DWCDvxur9/VC1xgH6U6cw5a2CKzFOmKxUBNg6FKZUUx/A9aoMIeFcyEX/S5JKr
+czlUwIXNxuLAZM1DkxQ8Jm2fAGMic1pHS4QT8tpV6CSbWZIiZRt5IuZpQdZNg==
/


--
-- F_AGENT_IDRA_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_agent_idra_cd (V_AGENT_ID VARCHAR2)
   RETURN VARCHAR2
AS
   V_AGENT_IDRA_CD   HRM_AGENT.IDRA_FA_CD%TYPE;
BEGIN
   BEGIN
      SELECT   IDRA_FA_CD
        INTO   V_AGENT_IDRA_CD
        FROM   HRM_AGENT
       WHERE   AGENT_ID = V_AGENT_ID;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         V_AGENT_IDRA_CD := '';
      WHEN TOO_MANY_ROWS
      THEN
         V_AGENT_IDRA_CD := 'Duplicate Record Found';
      WHEN OTHERS
      THEN
         V_AGENT_IDRA_CD := 'Not Found';
   END;

   RETURN (V_AGENT_IDRA_CD);
END;
/


--
-- F_AGENT_LICENSE_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_agent_license_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
21b 16d
QEQQ36s++ywwECjcBVcJi47HeYswg5DMr9xqfHRDaGSlAYOf7t33JwfIRfYaPVjxoAtJ9oNl
RkajNlW1t+P3b9v77gx+nTTBNFN+Wntjvf/PMJtV3ZZygJrtErkjVKBWPFpKXPs7fMLTi0hY
+6k1sQTy7Vm0tHlCjBTx6Rukl5d3T9IFLQDH+GKLkxhbcdUYaIlGS1M1KeZlm+LnqWawql/y
VN71AJD4RIrFIQT/XQFEjC16GRWA9AXOmZPgL8iL5levY0hNU+HRpt4Zv2r+1XVeJGcxD0Xr
ek/FrTu+b6AXjL8zIPKVQypWBnwwfPm0nZA/tz01arSq7XQ+BE9+wH9sVk5WBngsL3is/w==
/


--
-- F_AGENT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_agent_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
21a 15c
4q5l/PvxPyDQpkeHv6dbx9HrJqowg2PM2dxqZ3RdbmSlRI2HV7gU/Dihbgeiipcx0lLC5d/K
FFov8rVP8MKR1ah3HbzYKtqCQUwXsmxhkawfADRhVQ5VxlVgLkqRDVk4CxQ+X3pWNVDf5oKm
6Ep6KJ4m6Lk/JcxjWjo7VWR/SuYAOIcJNnyQ4ogK1BdZVnGeaxTZj9cA11wbcQLM+5pvFufH
BpRGzghHFUysHgiQNb9rSco8d1SMiHiJrDJQIFH+EHFiTSzKHnJV3vO17hdYDWWg6u55ED2W
AKq8naQohJklHPhk65THnz8JtZZjhMjkWy4Kc5P4ZUrUExMgoOASfQ==
/


--
-- F_BANK  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_bank wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a0 124
Gy/edt96bFIzPC5IkGRasdHZ5N0wg3lpLcusfC8yi9VIfzeVrw1SFs2oolPxJVFZ8MvRG/m1
FsOjfM7o2Zj+uUNMOKF18vN6VYb5P2Pt2a1MbsjdAqVOOBszyRF/HfDUJ6xB9szAEDYZbAMH
q+fOgQmG7eusbKr3hr5R27rqhkbL9o455mfpYDVHupECKy5ZTH329KuoIXs1fsRaiadNqCys
GJWUGTZh6yBvCPzR+z5Jvu7iaacUdfeDnvo8KgUlQTWrary7WQtjfuRQU6kVtn7++wsDk10=
/


--
-- F_BRANCH  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_branch wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b4 130
ZzxNTZYm1Ph+9w+kZojeBTCbRaIwg/DImMsVfHTpWE6Uh8iDAjcN4FpeBysnkJcaAtzzyqgb
OfmqyikSZ+eup2S7CIR4Gn445xy5M7y8ua7jNqag0QGwZc6UCT6abKFDmLxC9pir6XaKX2E4
rCvCl2y7AnrXaeX5Fcw9htMIbAl6b46pxwaGRmzF/RivVm9INTxZjOoB1+ij13GJx0pffG6q
dRx/l0CCkVqYNdzmlJaeHqU1fwW9hVNZoymg3hGbo5ZWXqdf7MJ2Wl30CrvphiVSZjQ2I2gh
Mc+m0LO6bw==
/


--
-- F_BR_BANK  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_br_bank wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1d2 144
+3tBzyMjGnGMRrvPPiNITGyvbogwgxBpf8sVfHSRudU0yo0CNw3g5+IM1RheY943Pqw3RPQ3
tShXay5tRqVdbhC//5SkjDshalVVh7mfECLKzVX/V0c1qPKwBNkypqczJVDF+6aEYYJ07WVU
xQOhwx7M7j4iVyLyLFOboyhpj8n62J+gZLTr4O89CS4RAM5rsnxnlStyYgYOfCO5eAaw8XTw
e5ucYhqag3WA9A8qnLLz5AVKyYsLKjZTl3r0/1rw0Ff02XTYTOLYwAK5MHrbl3DA7uLiHSQR
uNExLq+wf1sIyKiOGbOEMQay/vMByQ==
/


--
-- F_BUILD_ID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_build_id wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e2 179
cntnN+ixQo5qxzkEeJ6TYC+g3Z0wgwH3Na5qfHQCrf7qzqw8oXyNTAqkwtTNVg3cQxod3PNp
yMUuWeasmnIlDUyIrWw/cpq3kDTuR/c4zqVkmlVrgUz9sYeUrH2hhIaKOsyo2k+c1IUnjiBV
x/AML/XwfIqNkdps9mnfg/h5hGPLqQg2aQ8U0c8BVSf10omPWoxib9vMIE9MYqd1rXXj2//d
VqgfXnNqgAu5hstEsIsuelAhk4B6xtx1ClJkWoalE9nxpyldr7B0Hkv/JmX1ZUsIo61Dx+tL
Ob/FcwipFsJ9XEyciSappRbgFLwPSSihwFuZkuRCrfViNKQFv1c/+ymVyF/Y633ksggBf0l/
53ida/USbA==
/


--
-- F_BUILD_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_build_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
194 154
B5C6jNyXFlkpbVFgUizHMqtfuWAwgzJpr9xqfHRDaGSlRDu3po1MScuTBkino0nA8fuw5xZa
t9QbqK/+6+L2eCHut83+5EHNZcLLkYgiJR7+yQUaVRe5JWYJAdOI46/+RAhlPSJosoUyMJ9X
RK8vAjg7omSJR2c6fhBui6tAzoACHtbyxnUXmXHTF1uSk/wt5qRwwxTLb/928i2BAs/fziLi
aS9AjSzcv9eAniLe9VUd1P9SyDd5ZcVNw4OFOeYFkmr7zF1/PsHFJeW3WhbgbJ2QlP7pUh22
g3M0fniyNM0Tv7Sq+1j6oL9gSOp9qpxP4t6vy1OSRMn9F3o=
/


--
-- F_CLAIM_CAUSE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_CLAIM_CAUSE wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a1 144
WDO3Ba/RGlltwp8l+XWKRz3yZPQwgwHIrgxqZy+VAP5eNLq2aePppWl6XxP0TFrJapHrI7oa
KTUvmRzk5EhZ+t9FsDpOEtB4uoHgNDKsxXXsfrZ0gaQX+LRM/HDyVK9Bd4paeK2JEGSsQuH8
Ky2YCVqClgMHZpriQTqV8kapw3O8SvbfHJkmlLv5tGw1Y+JYpYnfeSjaK9RmkranxH4X7A+y
xIbNoapD7y8f8puOxbEMvSyAtTVs/Uwmefb2EdKe2PyOMVXoFrksIC1hT5ogLLsdSsHuRk4f
ikv/sHRWnHzrB8nZt+8h4XgkI4oBUQ==
/


--
-- F_CLAIM_DETL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_claim_detl wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c6 134
nj6P6S1TeV4mhSkzGphJ/N5Ltk0wgwFpAJkVfI71uWQwC5nLBo8Je9vSXB0pbRr0RUQIHTZV
5LV1oDzozS7uucDQmJfTeObzemiBMkK8Vc35QmOAxgHNVwOye4esyldl1/5ZZJxQ3myriBTQ
WtdnjC0jyqkqodI3J+OzmCXXxdm3Yrk2bDcsh2KriYWy2z6sX6zMpXBkoOW6gpxZ0mKs9ktu
M03zBhyVGh+M0wayGAgUOiSZcnYoOK826KXq51q+8YiLxQEQGgh3aForl8/cxHQlu1TEfnvF
zeqZkgaZM49+9g==
/


--
-- F_CLM_CAUSE_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_clm_cause_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1f4 140
buVpGHxf3tXGhxs5onfyMCphv78wg5DMACisfC8yi+poG37UU/MHo8tsN9peGCzrAgSQoluG
tcQuDjdX3rDZ7dDZEtf9JWFwrBNxuZBxg/4exdDLBtZ9wtM77KvpF7hpYLuJkxvzpgSg8GtL
bcPNxAtEXD+zhi9kb6Grebi6yElAr+2rDHc8sgt50PuOkTrZrQ6+7idpp+V9iB3PaGuv9C1t
LUDe4ncDCBpSuwzjrPGpVGUBjV1oaTwdPPvuklDmerBJaQVMwaF730tHCT57be4Lc9D72mE6
ofRd4fAiFkFvwVpBf/im6Q6fbQ==
/


--
-- F_CLM_DETL_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_clm_detl_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
231 158
skj54nU/ji32FyIJxqgxk1uDaCcwg5D3f65qfC8CWE7VSPZmf8o5p01qOA8RGl3Lrcti6701
WKtUzrUVQNQywjdJHrz+Qc9y14XUxBWl4mSwoZpKD0lzdQ5Wpo+hLrEKr1LKKt/LUFikRQUe
mQ1dmA91EczpioXQSpaEdisbuYIoib94XExo64TZzJzR7nR39wjIiHKmDgGW2UdGq0lz0Mb1
tP+6orPYtLuF813afuraqLpUIUtMXAnGVnsEI1+Ubz6cN+liI3dgYGEXjx1achP4PnjkveRl
pHhckFsw8833Tz36P86uqTYN+Le3V1aJEEy+Ft8RUY/8/ZtCQBE=
/


--
-- F_CLM_PARTY_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_clm_party_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1dc 148
DSFFExIr2RxCNaeoRpbfSUoSiSMwg5D3fyAVfC8CWE7VSO8xL/xvfwTBCWb32vVS4Vjc5430
jsMyKZ1kLrYf1DzrOry/cj+fMfEylLZugfWI0p/kzuQl/vsl3LFaRYIGIw1E9WCK1IVlDKZn
UA3mLZx1G/WYzC4ytF90JZzpp0n2zzsW47lEZxZzJ7htPDrg7Hb4ppStP5tfGo7LW7R5c2ob
S5oOcKCb6oevx0B6FghwUh/hSVIYqVSZhl+naAl/4cE1esfybv8pnvV2GYuT+RGPdQ3fdwql
vDrQ+xIN5N7T+lsjzl/S/iY0ylAxeIS6IH0=
/


--
-- F_CLM_PAYMENT_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_clm_payment_tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bd 164
9HcmX8w/Qr6rdMlTM+O/K3L4A4UwgxBpLgxqZy+Bbg8I0SWOw+UfKK9qRVi0ApGfMX53Qacl
wy+SAo6vqrtI61CJGMdYOBk0Qk7oEVR7Y4gsPy2j+FXkF+1oinM/nLwj78mHi8gBlNkYtEJ4
gvUf+C3njzJHC1TA8AGFJktpMiXMvpIHlz037Gyq24LtFty4WWcubKEH+x8YkGCWthdFFti8
jgCvIF7CRq86MOYggtpfs5gUtrVSZrKFdDwiH9zO5nhuagI8Qw6U5RuWXz6NjlKcSfYN6SP4
fFhoJBlwGt+aTj0XbZVhTOD4RD1K1DVPzjDp/v+g/h9LpmulF/9Zn4GZgLy4Bw==
/


--
-- F_CLM_PAY_BASIS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_clm_pay_basis wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1cd 168
08EMXHRgcLdMbvulZ8gGuwsSZZEwgxDMLgwdfy+BNJ3g0SVv2HeHelYcJYrYsorc5vE7zd5U
mJ4CJ5Wsj514UpkTCVLROBkSTovvAYQl1S6llwVz/aqgmuRoHL/GCBjwtKXmV0NUbw7nKxWX
Y0tOvVTS8GzjiBacbAnIXKQDq/r+hc1whIENmgRHAyTgN9AYZVcApsvViRwlBnzWscghbUUi
8goe2TwdtaCibbX/byvPVw+t0ENTpxEGEDlk27epIR8VmdEyhETOpkyeO2nLkwRePj5RH4wN
gxUwe0/XubkgcBoZnYNz4tbNaxI3aklNSCG9zfc/B31kkD9ayh1bbE/f/LPk/FuZWPUj
/


--
-- F_DEGREE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_degree wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
271 171
gwb7/76RRAM2ZQ/CTXlVmOT+IZowg2P3f65qfC8CWHPVSCaD0XRfoqRfEN5m7sdDV2KQ2ONT
RL0qFhq1TwSjhsvKNniTP3KamNrBKr26J6yQ9nO8/hzJdKY83AYlynuo7pjFX3u+4oxC4MTV
kU6pfBH2hEuLYI5oaHyHTKmhc56h/B1YLdpxp47nCHwrAv4WVqKW2tbywnvXGOZIoPLg//4T
4bIVsUdt9R2TuO7W3Vy0jm2W51ra+mK/vuKhQTbann+5sEIgH3xjSKk02hyD3qfAOzzcUoN7
jHg9D1ObzpKb5LR0HIPJEdHuIxRY/A9VFeIea/1BzyjtIBlFahfhJVMKXbsXvSBBLcoP7R1z
cdDL
/


--
-- F_DEMAND_RATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_demand_rate wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2a3 1ad
0yZquQC/Cecjiw03XEnazZaU8PowgwLxNSAVfHQCv7lkpfDD4OdTZstrUqjTMsWxAlXY8ksF
394GtfY+Ymm0IcDyh4ciuj/69pfbW6y/AHYk7HLWP3iwjD494ojM7R2uSwNueVZyXnCJ7L3i
nrTFMSZqFfFeYawvHz2VnjFH6IZCRVorUzOJoHt0YZRIf7a4vNMs2qmjxXlsYkZcl/ovKaHh
aFwpBK0HBgjuUwBkIZ3ey2MDu3iF59TkQ3V0L0vkPddwT59LtL16qHkA7rZxIKFbac4s8qhK
atLr1mvPkNStvuGh/+c4TzLSPzILU9uYNGykA0UwpWJqwnNv0Ja9Fk0D4CooMoorUfXB+2G8
5g0BvoFYefMYRzfXHs97E//UfFGWuNcmiIFDyGhmKbyNvtlXGUnNQ9koIRJLlw==
/


--
-- F_DESIG  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Desig wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
314 181
/zqb6xolAicH4vPJoJVZINXHoJkwgzsJAK5qfC8BM2RTRA1MBAT0e3VdJaLlu+VttyX65aI2
WlBa3tqlu1IlKIwJe0MuM06Y/tLYDAwYef82Jgz8zcYFU8C9bzpHlb0wkeDL/ge2EiDqmW6p
DmICDiXTF6McNR/8IaE5P4YlrFkg8yYXbkMae6FXgRa4Si0CA7rcp6hTWzjFfqyqj5yInhW+
xo7mJk3q7gxfbeJhrAzOk+HgnBEKTJdsbKoqpjwK4ggctc+EB7A+X00xNYOKeGSMfew1LCBY
kLOgwBXZ4LQwBSGlDRnPmlpk0jSiB2ZW1gG/sz2Sxw8dYXnrGVoXu5YdnItVElVI0GtaxmxX
2KVXR9xmPQAZc6Zi8Iys
/


--
-- F_DESIG_GROUP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_desig_group wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1eb 14c
8ELrZ+4WfKFbjnhWGPL01AQ0TKUwg5DMLdwdf3QB/+owNe3RdNhJQMjO4vdX+InZTAX6mXmV
wzYGtfTptg1+j/qbEnKWcinJwD58r8yHKE8gSa0Qbp0Za5MaKIduB5VgxC0IUnmmyuDs7z1Y
LbfcH684iaAszESmEHaVho4jvXcIaq4Mau1lox1gHoj4Z8XiLuK9D1BsFqzZjsppBrqcnjL3
Bw9ARAVIfAYBkz+xtolZO2W4wbh3XejCveOVBZFjhlgYgJdnDdUfESv1OWRbujsFHrL0kzkM
EvQ0kPkNN4IA+S4YiYJMc67HxwpHzBVVeF4p9YY=
/


--
-- F_DESIG_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Desig_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
32d 18d
CrfFXv+B+buHoKPS/uz7J1ml0aAwgzvxACDWZ3RA2k7VNMOhp8ukbWVxrzYacICLytf1GMN3
wydnrJF9nbs15mQn3hsZKf8su++6SsCe9RU2973ZM3PXoAf8V5ZZ45PCZTXnKy0anLVqL+2x
mLLRZ2nB5mkWveBs0A5lIH0ajj+Xk5F/bWEpGRX+1NJfCkY04tftIwFT1GdqcPu93jmA9QL3
uPx10bzwzC+8F7qs/Xe7CqVs3S7EKCg/2TPTLxNp3gFm/z7kuh0OeT1UaPxPPfUjoxVf/Lai
gb4jkDoLOQCHghPDs//nIAPeCEXi7lNkIiBQmQ3/sw7n2ZGKy0yKJP9scOt317J7uqpYMBEi
pJfo7eb34oC4rR6+HkzOh5w0+OEoQuiw
/


--
-- F_DIAG_TEST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_diag_test wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a6 148
PXex3YbrpEsDxFnIsQwnGLI4/UwwgwHINfYVZy8CEv9kdRO9oC8CQRoHUoKzRNr9yXj8ecjU
b2vDaSm7IGFh1Hma3kJOzQsZd2ITcKRqCp/4zRNBv7DHvCWXBnEdOg7orIfVjgNnWI7KjqPu
Cvt9A7puT+4rnVT5VG/rfmDH2ZPSB7HEemL6NlrgVltb3tKla28fvSRfBzEjNebIITCsoCXS
8uvUabYoyK8Pga10iqAVqaOYp9Xn7YEsjqBBjhPJ3rLUVmzzScgkWZfAerwH93POaLy72jCt
9dpXdq+fjAbCHQhyZZyYi97uHBjdVR8KVMmF
/


--
-- F_DISTRICT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_District wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
23b 160
WHAXV0hwAE4evp+3djYGx0WnqZUwgwLIrgxqZy+VAMFeR+mDh8Uwshw8cwtvaDFlWKAzoFqD
hGdfoCn+v7YMt1wMmt51/s6yTlkC8TuAfDUqxrlQd1XPpIliWNhdypTSxYVMn9n0QnIFjYem
3uLnOGJab6wcNYkxRjfL03MohHjdm4qTnVRHko9XssWBCqd0XuLpM8huq4ZANAxI8DzoUBo4
kl22FK7BnNg/tyM9H4mvIOme4ZIONm1wzwKeV+L5Oar8WHJLzd2gsHJVfvcPry3+r71oOZsT
mznckLwi7JLtBR3NHjNL2tFkxxCis2LKIuNaBLzUx0QX1SZXHClzmCDvTAck
/


--
-- F_DIVDEPT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Divdept wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
34b 189
+kB3UDoj3AKbcbRkXWL13NHqwsAwgzsJACDWZ3TNR2SlCWyTe5FWl7hDWWeen5HLJVmwWjUn
Y9/DicP8nbs1JFcNIbYgewCdEnJhdh+OWIm94Aosmko9DNqWO9wM8LoL77LL9JGaR9dpvt/4
YtFnUI7macX002wMaUJ85LB0z1+IzDz9Aq+k4l6eezGl/PeGOe8dQRfyQK+uiNstuIvBdI1M
rKyPLmHhqlClgPT+94xo8uHORBc1Z34NZZfUccj571J83CrU2uSYWMvE1XXMVeZxT67Gk1fJ
s3hwdXnoESACvzp3snVFQMFqKXPmPybfRKOOOFh87ZmWKK7Bnkve/IvmIpg2WM+4SCzlizJW
YRfIvNFdThnBvJpmdEWbPVudRS18
/


--
-- F_DIVISION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Division wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
239 160
+UPG1dBmwCWLZ7CbBMVtRIlrqNMwgwLI10gVfC9GEv9eimPh0cP8Kvyvga4LJhnp/UmJt1z7
B1qUJp7SOvYJon4N4wCTgoYgoPariRnTrL3l+LkzTJ0TYTUxPDzMsgk1bhhV6exJGe0PYtJ0
VPhA86OvwtPk51HR0zZ7WsGqb0U3XG9ykpXgUp5KZDgnc+VjB472s7aRLgtofL7Y9qCnjcmy
KRiuyDtxh8KSLvwCcj9JjjYaDkYfr2nWns+J+TmqZIKQcKqm6yy/E/rYNKxOoq+9cUToARAd
sEpPLFWSc0tEGeL4ZNc/P5AM85XEqc7KZji0q3JJV7ox9Av6+p34+xFFQJs=
/


--
-- F_DM_GID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_dm_gid wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
163 128
GwiZfRRc/04qlbpl9geO/vGa+PQwg0zI2ijWfHRG2sHqMB1hJZR/Rtt6FLhpHKCQwg4rpJK1
sTlpHTucVLCYrq2xSkbNjq9qciC1z9cpXRPcI6g3aGlr/2eMMuxwBqOgcQ+p/dQb0GpTBO5X
umbXcpOvxX574ArPVLIzFlagDDTqv9uNs/dcL/dWmyc7ORGBS5guztlT/eJiJ0YsK72a4RPw
tzYLvjLoWZsa45M0vXaci4q0yqa9WkL6Yv4NwKh+1tv5JzMQNjuW8Va0n7AhM+eAVNLrW2zl
CcY=
/


--
-- F_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a1 150
SEEnNxMF6wfapL5T6t7olQdjQhQwgwHI19xqfC9Grfg+i6zs8qnmZPNbCyBNY8mkeW5v3G8n
I2esYObdTrdGIft7sHNYc11ShwO9/4KbEQVzwQXuzvd+jIHoStRRt4YnEZkGuIL/lmpeoQzn
AqMEumLJOwFETCYIiZnkPK3WbTf3JhIjuNgj63Gy5RGEG49Gx3Z6G5J+2ZUfqs5OJ8QbqG5R
aDgYjdccIyHDMzqU+QraF0vQK1ukxw8D6X1gwWCz4lFN2cCGX7mT96I0yr6HY94jEgIC2j8A
nbwhtMTX+83acQNUySfK89ByOjpHkRi0iJJVlXgejpFQ
/


--
-- F_ELEC_LINE_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_elec_line_tp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
21e 160
46V5n12X07XfVvgFHdA8Muk6b4Ywg/DMLgxqZy+Bbg9/H96exSqxBjhVWYrmZZhZ31yu1iHz
nn+U86qdMdvTfPPPsO4IIkBY2GbN8Gwwjeh5yyUcmGAimmMSbf6srSc+egxI55Xafcw6wNQM
GDHXIJslJNpxHYxkdXBkVLuOSQ6XERxWw92ItdF9LoTG30XGW4TMfK7rqWUwelY9iJtvb3hY
iogFBnIQYDGGy4gXRLjEL+2kds4aswJtrioX0pM2kWxch6HJ1fKv/ndxhZeJFpe+aBGUwjZY
YoTPkH7f+s2U2Fn+gSUc9ldu/DncLHD8PZKwTyVSBCy2lkEOsTlVlXjoJMjF
/


--
-- F_ELEC_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_elec_tp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1dd 158
Bb46tV/l+JS1BvbPGb2SrPpZYCswgwLIr/JqZy9AAME+i2Yua/L6DTBUeLaYUIrRt6ENsDXs
5+Z56dvBv3gtFPCstd6fzov9nxiDJ9//FW2gB5+WT7vAzwzErP13CWW9EucmvqvEFMYGn9K8
i5DGrS/ALm9hGNKjzDnl8tFZ4AxXwSwLZ9opxb7GWwu3V2XDTOXjglnk1MLWKTw4Tcrq+Q2Y
SRyxWlffFVVj9j1SzhqzxgqyGcesr6wy8dUrCVODi91rgf0UAcWOQ3PUEZRMrKJKyu36p9lW
ut1Hdp1BKGSyiq4umbAofNd++QOaixCzLHqQP3hw876SOVlHElA=
/


--
-- F_EMPLOYEE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_employee wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
16b 150
yM1J3V4aUdcNPw1JxfmOYUxS8gcwg1xpr/LbZ3SBeg/3BWEOS9H8ATFqV7dhHXnoGuvlsMpI
RDgNBjWlu5BI3jutAv6Hh4fxDZGsTjZkJZ2qQUBPvK57+pCUC2vrfp7XmI4EhNmgpg79Pb0r
DWlEHuxE+lV5Rer+ddoJF+A931RRvXwumQnLSqwHMa5iyYj4np7iYFHSruOqd4Q3XxdtBJTL
fIAZltPPIVTQnCYyvFeAZ4fYy6NlmvECL2uqq3DNq45MsWOCI6AvkTNucc1hBR4TDLRT0LvB
6wXzh0ALKGofV5ihsNdafxXS2JEiFgnvzwiZjE1UZQ==
/


--
-- F_EMPLOYMENT_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Employment_Tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e4 164
ZOoeue2Mw66u7RkRBZxgUm3NSpMwgwLINQxqZy8CAMHqR+nsrPJiMMUcPNfbVpEXnPobg+vK
YVtreRjjj514BXATq6+tzXSaNMROm+z1fErKH2i5eM2xn+34yEuu/TUebDCziI5+C+pFY+me
06ccIEAQRtGG9Z5fa8msYC3RjnI1XKHvwVaTzia1AvocRh/6HSKr8su61hcCbPym7x2Er6+0
V617wYqKDzNJBiZnYM4QG2hqyliV88YX8CI5QtN9KueFoeis8Wg9iTV9YBd0S2WUGJu8IaPp
vTXJximBz9+Y7Zis9DEQvH4ZK6WD4jxQvNb6G+sZiCb45ixCe7xh1ma4CLJ4N6lv
/


--
-- F_EMP_BLOOD_GRP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_blood_grp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
198 150
GpnBrKlJV32RXTHWU+MKz18fKzowg0zI2Scdf3TpmDPqEa0304N+hB8/ERxw2dQtsM3yLyWf
6/HItQ/b3HX6IRlUWupbVQXJJd6lNprkgb8Gc7sIMI9PTiaIvv109h2JkBVTrOM+gKzMYFXZ
U/u+tuCR9TeNgRm4Hx1WmhR+hw8rumtL/VpxW23AB28y4Q0rYZlZyznyHBxN4GBhs9p9jBMX
Iltpcg1e39i1opHW+qy+uzT+BPNHRWZt7zDW+jFM7/pZeH3lfF7tkCrOa393DtslCze2yBfv
t108wRWhY4GuXuGgnzlMqhrmvEMxenVizD0p60SbtDhR
/


--
-- F_EMP_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
307 195
ZclY+VLzSh0pgf/Qn5VT5a4oqbgwgzvxACDWfC9A2vjqaDlapCVK6YhxzzYUpenUV/qRa6fl
hF7F7Mtz/g1eWiZGZQjcPBAAP66cPGWzraEwLc0IaiIAB9RIwDi2+0AKFIb8IuECRSub06aH
fwstaJLlJtSspUiUlYrzeL6Rwdtdkzg39DneGGm3gUNrT4ltfd/IpOOLdzbzXQm2X3Sf+xoY
8oXDKbZEpC+1CZh0lBX1GgPzr5LTqxC+T/AAU664HlUDJpl4oawU1VOL32OjGKopNYNc15Vz
q4ufhoFLQHAqFuPBRXJ+LpEM0Sgrs+Kj8TuYy0rX+P6UYe7p8G+NZg0vMdYuTjM94TMQsQ84
txPibypZsLFhtXbIFulHP66tdphof86l1yiY7EGz
/


--
-- F_EMP_CD_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_cd_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18d 168
U33MUbEdc5VelLEjmpCXnCF7hwowg1zINa5qfHQCrf7qzjwr4CV1qdnbqBRI/SYyxXhiuMJQ
exQUYajLbpKGoXUr8tz0nRcknY4A3iCkrxOKKE/C/UMwhTk+O/N5cGnY1ZUTdgQQciEfZzL6
yrSgNWx33ZtxITFzTLwuHC2gieSslQ1qqw1buxTyA1eF7M/sCVQ1ey4ILvDKjXD62lRUbAOu
r+I3GBOFJ/6szgdBxZFGtLas3R1x4XkXvSL2fgulkb4jfe/KSWBCbAIe+qkoY6qrcAHajj1h
DT3FSi+Rn2473x6B180qGjPOc5IIIhW5Ibnu0kQ8GjoxiD7YuPmXfvc+UFriP6ZtFOAv
/


--
-- F_EMP_FILE_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_file_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
154 11f
jv5JQe7YvsNk6JTQqwz8GfhOK1gwg1zI7cvWfHRG2sE+ehU8n+mk5rjKCbhpqxHaQuEmCbUZ
qicOrOZvgLxOsAMyDMUEgHy4teSluKrS5CNJpJzocFymDTJKIkTQa4E2kNLl8fnnm1aixlR4
2PDpG1seeAXxaiLXokpjqH+9CruIYuWm9kZrj3CElJkJEuqEQx7MDblAzpzRlCNuZ38hbnDL
T2JvNMV+1CqVewFu78rGAnTxDfYmqS+6/a56qQ2ZEeVa9+SYgMK9/eqkDVUfRn9pDg==
/


--
-- F_EMP_GID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_gid wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
142 117
GFsZrKKkpRbOB7YdgHTzEGBFsIEwg1xp7csVyi+fiz5IfngyoCln7oPxiYw1TXstzrZbtpqq
8WGnxZld+Ji7TQC9sHSvAGiHu6UwhwOoFohGRje6s8CYcq9RTqepNOJQ4SRl3zZ3EBGJRkNH
kWEFi0QKS8zbG87BQtvLAtaVTYWIWq1WRD08ERE7HFj/cS/q/HdRlT7KkgzOb2LxpnLh+FIT
PWWY4L+2FL96d9S3Nh9rJNejXWnxu0WJrVVaUoXkvZPT1ACAz077QDwMww==
/


--
-- F_EMP_GID_TO_DESIG_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_gid_to_desig_cd (v_gid_cd VARCHAR2)
   RETURN VARCHAR2
AS
   v_desig_cd   hrm_emp_type.emp_type_cd%TYPE;
 /************************************************************************************
    NAME:       f_emp_gid_to_desig_cd
 Created By: Md Zahid Hasan; Created on 03/04/2014

************************************************************************************/
BEGIN
   BEGIN
      SELECT desig_cd
        INTO v_desig_cd
        FROM hrm_employee
       WHERE emp_gid = v_gid_cd;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN ('No Desig');
      WHEN TOO_MANY_ROWS
      THEN
         RETURN ('No Desig');
      WHEN OTHERS
      THEN
         RETURN ('No Desig');
   END;

   RETURN (v_desig_cd);
END;
/


--
-- F_EMP_GID_TO_EMP_ID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_gid_to_emp_id (V_ID_CD NUMBER)
   RETURN VARCHAR2
AS
   V_EMP_ID   VARCHAR2 (10);
BEGIN
   BEGIN
      SELECT   EMP_ID
        INTO   V_EMP_ID
        FROM   HRM_EMPLOYEE
       WHERE   EMP_GID = V_ID_CD;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         V_EMP_ID := NULL;
   END;

   RETURN (V_EMP_ID);
END;
/


--
-- F_EMP_ID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_id wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
13b 113
2E/nwayrudnPCvSC80fyMF/rzIQwg1xpACgVyi8yi+potEj8g1dpU2EUuCFaCtzETfTW9LWq
8SsmgW/R/iKbHNdnxauuuMEFTpXQ9n/A9iHVsiFTq4S9+4Yv52CIw0lqHF3M4/ezgX4h2EmC
GFVh2KLwO6h/HQqB429cRmSDadLI7dvgdza7DplI4didyvkOXgf7F0LyvVuF3goCrBcCc8Oh
2ANspPtCPGXySORnq+B7c1IJC/YfjDrp8v9PKBbA/3d5eyAZvLBaXA==
/


--
-- F_EMP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c6 138
zljPd5Fxx+DUhbAEjk5e75ugejowg/BpACAVfC/Nig9S/fqjvadN1lLRLNO8hB9JIesmHX77
+bXDByHeL5lB2P5j/uIR+gLsvdEjHLkjpPHc2XvqnIQXlVwrIl4vdDtQ4al5WbB90PIcPCBv
FJh57FgApypYWy2S3zBnH3DA1Qm9KkRArXJWOAJLB/LkWnZTgOSw3JSeImbgXM6svsBhWqUF
7lJoATxzUdCpVMf92G9oCcuo5q7s3vbCa/1QcrgZGjH2onArICbq7l5O3DY0ybig+hKL+vCO
/nMtTg3gvvP5zkTnSxEF
/


--
-- F_EMP_OFFICE_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_office_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ce 148
vxbNkf9fq7hUkSZL1iaKlWoGWiAwg5DMLUgVfC/NimRTY2b3aQIE9ARxwVlWbMGFUgl1SA6i
/KmPtUluZ1UvYRmRmhK7Gdq6xBo0LTYAT//qvNJzcgjbxrsahpD6k0NQobCeKTw+V9I7jLSm
MeNKLeUxJ3mOy13elOIjyiz3pbkoKskGtr9A24Xsdv1WzEIO4llRcL5UAqMacIW6dTH0fWOQ
O2BqqZwzqc5bEJR9LzlMVOdhpZhUbz5T6lQo0MroCNZKqVbBJQw8YWN2zxEAUslC3wUSg4oy
yLKjseTH4V94Gsg6+Vv6WafJ4GeaSCorfmc=
/


--
-- F_EMP_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_EMP_TP_NM wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a2 14c
8Go+VtdEmZAf790M7c4HJNubYrEwg3lpNSdqfC+KMWR1DPQdLqEdAAJ2jkJMmVGNVNlIwNNj
KWsv031ru2SkhlQ3/FH3yZ/Jv9lAMnxKzGDCIjksMYvN4zI38oqlezAjHDWAejP+duZr82AK
ouryK2kyPNzcBHK10X5k0R5+DCBAAwplNyrNWlsUwATLy6FnnwwWlTGYdfQjZFrnobu0yohS
EF4lh7e7xH89y0N0ny1pNZUlKnHK9Q+/q+NlKulDc/8RPbqi01LxlivZQ9ketsmL5PhSkiIG
TsDkFUNb6HXXB5EG4gI40EJlo8YzR2osvLYnyA==
/


--
-- F_EMP_TRAINING  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_training wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
37c 21f
Cp29vqKlSSz5CphD7OOJj6aZrqcwg40J2UgVfC+KrQ/umZ5a4xgcbVcExhun8VWFnzBuVjag
5if7zFMICA23L1pE04GVh7v/R0qxZlvJFOE6Sx677QAcbxPNyfihg7bap/cB8z5vXSnjCkhn
+cQbPBbFNRVT403gf1wgpK6MU/qUd7/7PfmnQ/KMZti7HSbVANe2/1/aBAGyyfEpRfNrfDK6
2AnZ69iJA9M2h8Xof+pozSIedveoJpDM4+Jf0fu32/i8oGjtG9rWylODLY9suxEzJ2fZR4Ii
EeCScjhgz1av73+Gj4dRidwvA5fxj0CV0TUUBH4WiWMZilmru2iGuqlgcMvMkI1Rs413SDSh
CWzwhESqW1R37Sj9CY0JUTq2QxDAIrdLDOadmjhSt8hR4+SzE2KYAb0nhyTmgReDeDRIZc/U
MIu1uGlK/ecO8E1rYUukIS5MV+a0pPS0kGEKS4JN9zmz6I6LK+7DJOZgsHOxyb5X4vSjlr8H
Pa67p+GkogDbFdWBlf9Dj0MfKvR3iA==
/


--
-- F_EMP_TYPE_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_type_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
21f 17d
9VFbQCCY7mE05IW3r0K9bxZM9V8wgxD3LcDWfHRA2k6OoyOoDEDicVsfoo/LDMN1Glm8hwzR
hLZTh5w0EHmeiZ/dt9i1sUkM3PYYLv82SQWHI/gyHrr4M8s43sycn09JyPQzUq+yBkhZGRPo
23mmpqzob6zW8Vdemy9NlxcohA14MVdS/vd/kZ+Z3o+i+zb5eu4iSQ8AW7nDVHB+cUtNq2yp
bnS1u99tJkv5eQB6qiVKiJ5KWSQG70eGYBnWln+nP9WviknKYfRll+hx63eVVzhIV81maGlb
MCkkRboFrFL9VX6MbPp8ujtNLRXGJ5AamK4HV52HN2TNxYmkNTzePcc3ZpKwy/rXRc6vpXJv
kMb9ubz7SooCLg==
/


--
-- F_EMP_TYPE_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_type_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
280 199
X4y63GGhb540vKuzx+ZCN6wm040wgxDxJCDWfC+V2vheaAkCVohFUXTRdvu9+E1/oXXYy8Ok
lyxcTJvN9l64DjulkZrt+AA6MaFs75D3RnjroNY6RbLwKaPnntZRfLBWQMO9xHImYHpZlYBM
H1MXpg5p6vIVWAoWQ/z0CCVccoagtog+ikLgX41qUSrA5jmKiK5Y9bc/C+r0rWCrl4mJYQYm
nsihLvaZmvKO9I0FaL4aTS/kWo5qsyjX1XV0H+Uk7A8cC8W147mf0RXvzlf+a16GKhUVlf80
cawUtsfXLuaNbvANeWgIXrSv3DOpzaWzmuw5oBDCVSifG95m71PY8FEMvi7Tc7DpNJ2fZ0wD
vWwMaQWgm2yAY9v1gIgHfgjprD1tk/C2es8dQXLsqQ==
/


--
-- F_FLOOR_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_floor_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
194 158
Tx5Y3XPqgSQuzLWbjM0A74YKuBkwgzLINa5qfHQCrf7qzqw8oamX4rYHVlJ4DDu2vvqptwIE
t8jUxc3du7BVPEjn915d/uQABQHg/fqCfjKY9gXWuZ2bDgFD7RatWi2z6VGX85Y9OM8EiQXO
q7ierH+9aoPjTIhYN97Cgb4T9gQZJI7i0IkZf3JvUxT/SjMKINaUg+fv91cjU/IWlbGqpTHI
+DTmNQRgP0WKKixizuB/0lsE1cFgOTP8WSGjktvL4OqSQ/t/dw7sL8XC6IAWGDD6uxeVC8xo
r0YzmiCYcrI0xBMoEShnSGUAbO+/725InA9hKduHUzr72ScXCg==
/


--
-- F_GL_SL_TO_CODE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_gl_sl_to_code wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
20f 179
7qBggcq0FSh2xD+Hb5Tx53ICE2Ywg43MLUgVfC/NimRTY+Gny6T9f1NKtmYC2l1Xaeheoua6
PhVc57WaVLIbjXuOrq67GRK/rtzyw9/vRu+dxM9Ivr/PuDIdx/umutzH0Zv7oWN6KxRPJXHl
N5EagJiaES2l8ox53i9hJU2NIXLmb69kFjyqFF8zWjT8IYRky3AwAv8NwnzFgNPKhAzEd2dJ
QDy3ROo/xCVgas2HVIf96YdRmokZzptmhfPIV6crwOZs1Ibdy9ZL9gn8Ab2C9QAUucDlF7Mh
1NMIowZBss0YqtvbnGQzTmmBsndcD3P/Ua8RGBJIN4we3YEsLltMXpBVKUlpC3b0+iDX1hDz
vSTPzjleTzdF
/


--
-- F_GRP_POLICY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_GRP_POLICY_TYPE(v_POLICY_TYPE IN GRP_POLICY_TYPE.POLICY_TYPE%TYPE)
RETURN VARCHAR2 IS
v_POLICY_TYPE_DESC GRP_POLICY_TYPE.POLICY_TYPE_DESC%TYPE;

BEGIN
     SELECT POLICY_TYPE_DESC INTO v_POLICY_TYPE_DESC
         FROM GRP_POLICY_TYPE
         WHERE POLICY_TYPE = v_POLICY_TYPE;
         RETURN v_POLICY_TYPE_DESC;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20012, 'Invalid code or ID');
END;
/


--
-- F_INDEX  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_index wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1e8 181
At/A/CfFqkEII08dN5LERwvOf0kwg1zMLUhGfHTNR+owraRaXDLGMOOosuii8n6O07l7LaCN
RfW5uCyaFLKJycJzQXNBkBm39Ri9IqdyZMT+IBbB6cwHeGk2A0vAL2HinqZLfTRzCpTgGD1C
99jt9Mw5DtiusJ7RYsixRZOh1OfOxnvqqFVU9xvtkLSsesaiYwjuLk3Me1ploMh8dfupGcL7
azL15B7WPNFTyxHzJcUmvaOFEwEtI5DTNiinZLky2+gw1B/p88HzPsr6nckcTmgckHbClc6O
rcsD7G6GLr4WpLoo2+IXrlWe4sRFoLownSDGvWvYT5/2uQVmqKCkLNAmGHdsXj737ElZK7+a
w8kC5T7hvkLO+9eVuGw=
/


--
-- F_INSTANT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Instant wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c2 15c
RvF3xQ34NU1EGZLv5X+88/Mq2QYwgwHINa5qfHQCrf7qzqw8oXR5mNx2WfzCWvS2vilwsBFR
dshpSa/bu0lMN2AF2qL3c9IxcjLZxRHGaYBVqpDLcyZo6dcuZ8vMXMgaX/CXDmGqgfgmqv0z
QYvKjqM4tGtNYperSz4bnrqFAc+2sujB8dQzWQWO0NIavgQ067vYQHQmpohUx7jI0OxHDVcS
Kn5+JCCh58KJKMgHGeSEfen3LP9e3WPT1jdM2Hxw2EzZlEbDRd+e/EBmIyCgFTeUodu9iW2B
wL6jVa9Z/poH0P7Lh9BV/XYkNb8DOlMdCLtlhjfZet7CdM0TLDCKuIk=
/


--
-- F_INTCAP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_intcap wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
92 aa
b/Mtk/S1Li6jFVhiNLHVKbrA7T8wg8eZgcfLCNL+XlptckfVodxWUKVOXOfHdMAzuHRlJcPn
wLK9spvWmRZXOcc+Fs46qKIhR3QhO76ObnFVAHOpCWep2zYmoMKB0k50Up90pqt0Cb3h4j/R
aW/bz7IOe8h2Wm77pgNyZl8=
/


--
-- F_IN_WORD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_in_word wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
25e6 804
G47jhGR0umQ1ggsC5p9GH0t6jH4wgz2jBUgGWi9VF7xRmnSYom2yXdwU4f8E+gTZdZPN6+d5
dbLs5xQbWHTTLJ0QA1WxwBdAogM0UOL8uXuw/FNVvGhi8cwiWGx9TrCBi+vZn7+aEdzG7hFl
pNQR8Q6Rf+2yAzP1ewwVnfQ4jrKC9a2lm0OcY7Fg61ZHB7dU0hrZgbFjsSdwcmYMUMY4YHr7
7Ef95y617AGGJTzS+JA8XIbf5Hyhq1cnekfmJd6J16URHOTloKLs6SHbavcwdYCZCHyjFAao
yxscBugwdctJTmvJpSoMypOi3U40huohlns72fubyROU4J3kAbqgHJ/Vye0FIrt1zUhz8L9u
ZJ1OP049xD1AYRWBnSiuoI3Ybb0AHIJQ4EDQld3kAYGFi9csPJiwlC3xdTQN+UerFMmzZoTe
E9QaYNO3DRh1TGLJ//cldROwEIjHcjCbOfC+ljBvYqvHD6VoH3qTbdRuy7A6FmRROXMr3kpH
yYwq36PXthPBpP07JuABm8lmaim+bRcD2Hr6S53M58vawW0FQkEqDP70JZg9MwVM0/SFO/xy
GxFbzak6dXGyP52bW0Wd2eS32o4H+gd6J9NHYiFnP6mbFtsU5bdeBF/aOFQh9TLlxT8iMkIG
xbmHrW5u1BhOoPXxt6NSQZzcwBgKTXsBVMDUCofLe1/BOZc/AAEsGnbdiZgvQyKiOnRRz/tl
uWdf2hvU+mZKqKciR2WpVDPKp7Av2cfjQ0RnmxWNjOADHlXdCpkI/IQ0/8qHwaZkTowIm800
4ePqKAYyngh7HTCQczZkl5GPBoRxRS+cIttDjo/Akp9xz9qcpgYl1lPS+9FzC8AmdDnkIkad
me67+84Su+OaxIYoyuRMpqr+LgjqOevplBV2pnXW/pVxiFnq5n3mzgzuGvrLt38Zp+7t4Nb1
FNohy82Re/14Qv0PGbrW/GbRn5gpDqhBrIY089oIc9JDytkD+qAxXyksxme5C4P5LC5sl/Sa
kpCKO3tiNO+ByLF7dno0lZoiqkxIuSkbkLVUP/DKOX0uzA6zSJi6UlZcksVplVmqBgix1pk5
zYX62KW/vfnoYxFiX2tmThu9AMvTPiZN0QODXXg/xonJf9ZIkzw6vUoLLzPLWyKMCjbQww21
HYIuRGPnIeKDm/UhRLRdpDQMjUqOVeyhDUwGGEZfYDMqxeVMjGaxY9/C0Q2zTos/xMVeFuiW
5Q/sSltn/1F135Nu8MUk5m9jFKekGl/MNOK4OxEMiRXsPmJ1i9X3K5G98EJ/aX2Tp6zhyBiE
pDuWBfyt1Qsnd9ErSM6XY5d/sZ/gi1Gx68JDezCUdDhOK0FHML+Fj49Aozi5H/dQwY3Lnl0D
iIEflrX7xIQw2OhnHXu9GCuHjZxjoHRtbw8cxSlK/Tuh3ndxFKQ3lOzH8tFngJal9oV1iSsf
TNF+PhTPsa+4j0ChEbTYFbgxAk4xcUg2RydqthEngmeJpRHpXPo9IBoqL5swocBoES6ukF12
szXx6yV+XRSF3NX+9udYkcFG3VEAz9bZ3Y9AoRK02OBSMZSlMXYzFEDwPqTiPnKmaeaMPStj
ySZ5RIACytCn9cbwPHd3Kf/z/RraYpV87+0lZO4L8ZCZpjsVNvpXXR7RSHUhB9fFyC3Wi85+
7IsObMvQs0bJZ2w1UBgmm3+OTvKZ1dDI25XwPHZ39Nn7rpBToHH8VtJlvEDWoWlhDpclAeSU
g6E6c37lmtnovkJOdeZ1JWieoVpEqhMMuWsRV/kzp4WXb3QvwOwdezyMh7fqyeBU2GiTKxwu
i9IIYx320U8hxlJtVm8vWfGfRsdivCXVP9NGORYXvhok0kc2TeBClvIWyP61eDRA0oL78TST
0UnIP8qEJFFUP5NmKKTL4z3xH6dzLcYodquYE28oRp9WoJX74LV/bK1oaB9AoLjCZBKFs35O
U/5LVJcXi4lKhWeLgfa4woyfZ1Z6Ex85KD9hrKc2IPBpYxEV6dZbPo9SWO61CgaY1YPWWD/4
KGsjuYI=
/


--
-- F_IS_GRTDT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_is_grtdt wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
c6 d6
Y9tzbmgf7pVjpOknkUPi3b3BDQMwgwFKr54VfC+iAMHVi7SsH4HJw0vJXh0yApEdzT6crDA9
+SToOxiP3lj+QDh5XbdT1Wro+IJVHIQkjmJHzBExLrBGSfRB+0qcGHpxaYVW22AiWgoYJ8ZY
Hf9RAPXIggjExFVk9ct3RrO5+YqSeSkHeaBm30LcrrjPa3VMrf0TcVoNH+8jCOGl6H8V
/


--
-- F_JUST_GRT_EQL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Just_grt_eql wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
25b 191
AOWqdVI20+IPAfYyyNvNTqlR2fQwg5DxLq4dqC9AAHJkj2GYvRO0OwiPgxtTZx+EaxV+PbZJ
hpVto7Wdhj8xol62rXx0TtwwLGe/4jWGpOspM4ZzyEGayykpgWychRpnlS0qfy763HroO5zF
KvHN6RGj8+XhrBXRU4f7X1ha6yKk/j2gHXgnC3aps1kGI+XgCnZHBgo9U037dYE/Wy+NXLJl
qGykikvwOtiLCSpdbCRllQNO6dQflJXFhpyOp4gPCVMOVVFw1Gskm+jWmmUxvfgyHEIaaxx0
whLA6dFk6gOgHArcM7wnad+rsho6txrBzihgrVKJ71qt8YmwzD+42K64dCbwJ1Rz+Y5ebbOJ
zHt6znjmNf41AZI1TNugvXV3kDtyIvuRyJxC
/


--
-- F_LAST_DAY_OF_MON  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_last_day_of_mon wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
46f 1ad
wYdjYsV5XU5cW4Hcr+jctimm27gwg2PD2iDWfC+5R2SlyVYBj/dhQuOvcOvKNyZ+tj63lCaX
w+xrTJK7EsuyUGAaJ8/rKbz4HGF0Qu9lTHfhpEce+XNqNIok1whwg4YTtX533Ijo84zstq7A
VVo3YcPJ/cXvoo3EKmxcg3xFhGkX29D6qw6eopawra7NwyFcl2MsRHxZOl6oetqkRV6QISv0
4vBcfU5HuAXgj4Ft6Rk7UTZbqGAjaoBmK4tuwI2PV9seHF1jq8eMD2j34wZsciHlJ4uEbrvS
nK8UjhuR30lNL0VgVULHk+rjKqB2bphHphuvgTSzwImxOYvrCm0sCqw3+l2TCwcS7LWVsui+
/su8KMu80Mu8mVu5mzNHOLiYIAR7zmC1m6Ttgn2Y6Pjqzh2ZIuqZGRD74cL+3Q==
/


--
-- F_LIFE_CLASS_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_life_class_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18e 154
VjycmMU2X2j80hELdpBG3jyXomowg1zIrydqfC+iEjzqimLfoI9Ah/J9NY088N1MWI1u0mE2
2jep3g43P6rNdVTi3ODB3p9gAYQbe6648fnPe/IFLOLq3ph+SeglqOMtj+ef7NcrTntb1LR8
r3r7pHeQY65UQdrx7Y46YO2GB+8ytm+xqZTs543Vf1hXGBzxJuykDDOMq13UBxFJG/v4YmXR
VUDOIMhFfsmOnXQ8C8cNX3o0ScqWK4BiYyCF5nZgtQRwzeEY4h6XiACj52US/0E86QjkkufV
/nMSfXKkoJy555wsuJ+NrhP3QOfrH8kmj8rlzELOHX644Eg=
/


--
-- F_MANAGER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_manager (
   v_manager_id                         employees.MANAGER_ID%TYPE
)
   RETURN VARCHAR2
AS
   v_manager_nm                  employees.FIRST_NAME%TYPE;
BEGIN
   BEGIN
      SELECT FIRST_NAME
        INTO v_manager_nm
        FROM employees
       WHERE EMPLOYEE_ID = v_manager_id;


   RETURN (v_manager_nm);
END;
/


--
-- F_MAX_BILL_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_max_bill_no
( p_agree_id IN VARCHAR2)
RETURN VARCHAR2 AS
v_max_bill_no    UTS_RENT_BILL.bill_no%TYPE;
BEGIN
    BEGIN
         SELECT to_char(to_number(max(to_number(bill_no)))+1) INTO v_max_bill_no
         FROM UTS_RENT_BILL
         WHERE agree_id = p_agree_id;
        EXCEPTION
                 WHEN NO_DATA_FOUND THEN
                 RAISE_APPLICATION_ERROR (-20101, 'Invalid code or Id');
    END;
    RETURN(v_max_bill_no);
END;
/


--
-- F_MODULE_PATH  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_module_path wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
402 203
yLUZ2BYNT37ZCC9qPz56rwpHeSswg2O3TPYVfI5Av1UPUkhg1V+oh9w043nlAjMaFCajBEZl
1ctulOq1tdM7eR17kRKoL1e7Qv9boXVrlu9AS8wPPZKg1T1rTcSPraZLab2ZwnXFJKkS7Mx+
cWQ7OpOLPjI5Oa8mR1cVrLiq3M6FqBXhsKL/IGdknyAhdsvU/4n/ZiFCzekMUHWS06LRiXIv
gUwuTplQ9n11NKn4uctub3ZrkZ+B0W/Ap9LU3h3ZrUOORS5ZkhIpJTdwpn9MUFTaNOjajEbY
3dpbI/BoJe05SCmz6Fa9oVNGARrqidPczOyOt6S9Zxv7A1e8nAWKBOitGnrgaOV5s/9eIqP8
Uoq0tNdr1U/oi/p7zcVpglxnFMyo2aV7nXc3SG4PmmgFNnHYJ+cK6z/NSviR+nXy54sYA2PO
/a1XpJ9PLOlMFUVNmf1yIW1tqp90E/znXO1i0LhWbbsnqiY1zCDXcewPfZOicy1f7ilbPnwp
qQ==
/


--
-- F_MUNILOC_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_MUNILOC_NM wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b8 14c
s/euwZRl1KETuoZt92M9c9Zid7Iwg3lp2dxqfC9dbmR1DD3DJ8x9DQZwbrItjmSM8LaX+uZG
HdNR01u8TxQCg+eLoEGIciLlQQ14SsxEBQPebst+Tu6bUGwbd+AfG1l3Mokr+S1jskbPll81
9OKNimtFflolpdaqXrTRPgeKSrmyFwOWK5l7J1oSFDdA7YSDZuzVUjPqjBYAdxRGkS26GhIc
0dx7JyfBjNudoTnWTBaN6mvAAJyltoGxFpf1jsMF32AKrdXI47ZdmBDMjni62Nf4wesFHuPB
686s61tHUxluF8r5HIvPtHpV9cJHmz0fll5+qQ==
/


--
-- F_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
271 171
L/ESMWzE0jSMM1NEXnfvaObkpX0wg2P3f65qfC8CWHPVSCaD0XRfoqRfxxv3pb7AbqfcK3cb
J2zDjMj5quAR8NqpL2iROgCqu7lW9tNhdzaQTky/tGF8C6ZLwKOXCQ62rc/qAswXsXkhrorJ
9H4cLzl5eecraOOsE9rUCtV8Jg+ooRDKgjOp0GxE5npfXO62npmz2dEO8djcA1HK8CuhR0M/
TA41zuxC90jKmdHPb1N0E+AIRPvenMfZkHcqQxevSuZf+N4Z+ERZ+ijKcylTE8k+sSfNjrDw
giNMcwITT4cPywXJETixdNcqcdAUXnMKun3PKD+0xADSeU6L0E+9Wobi8Z1PbDRC1KzPTsu1
btDL
/


--
-- F_OFF_CATG_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_off_catg_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bb 128
qPqySFg8pYHfEeq2hu1yXPAR5cgwgwLIfyisfC8CkPjVSH83la/MFWnZlOzdjXeseyo51oxt
tSQJHQ3L/C4umpj+Q0GKWlRjvWC/LIB4cRx4eHGoOKZQ2mJj032i+5roZdeKgzZOg0G6kSbQ
fBHahFDH78VIYV8sIqwmOv0pNsRD0+wtAKcYz2AwWcfdqwIChdenfOkrxjTKWowT5w3kLNUh
57uYTlMCR5ilFEuBjS1LNWeDlGjASTKAmWjc5t1zRUKcHTIykNeLH0YbVMNw0zuwiE6b/L3D
qpF/
/


--
-- F_OFF_CATG_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_off_catg_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
241 179
UzPe9nouR7S14XbBMwDd2ihERPEwg433r9xqfHRArcE+z1hhTFeKWg2EWrcN01LoIVW0PuVU
mVpQDiXtJL1fTVhGIcDy5Pi1dgVRYMnyAlCTsTIzJohPebXLmeGm2gpGS1/s8AG+qh+j1IXN
ouxYaqe3AUsRSCfwS4zslMNk5zvRZxa1NmvkOQFdQSDydLwwCLAGKG6IdZFPRKnT8PL2oqER
bLfAnZe8j+xqoJ0ygyBvZTrvhgV8HNNM501+3LIN5j11T0SGAlTSUZqYKkez8MpoJiT/Az6X
FgFsldY9Jw9M9JeuLCBkP65idhMtoUKXEzKBmiQ1wTm4hgza3VDfT+K1N8DShHVWMvfKp4i9
vXgPe4zItA==
/


--
-- F_OFF_TYPE_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_off_type_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
187 12c
RtTC5CiKCjcukQ3UJ0kMYcFtxh0wg1xpmMsVfHSR/+owNVGZHe9cB3B2oyZXXLhCWYip4nxL
pf4hUb2vt83aTxDfAIwhpzil0DilZP5OuWR4VBamfTQq6DWbU6QKg82wI1iDx771GhhnnxTt
C1cnBw2f1WMoaxJf0yVzFHonMWIL0wHyDWtMajjFbAt2TWyO3W4kNaaybde/FN1XmHLROV+F
JhuADw36k434Vh3Q/1pMMBjygnR+cyttM9QzdijI81rVtTTi1Y+8eZ3AepfJlqOR21HD+0EQ
pkq8h9I=
/


--
-- F_OUT_AS_ON_RENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_as_on_rent(p_bill_dt_from DATE)
RETURN NUMBER
--****** Created by : Md. Masudur Rahman
--****** Date         : 27/12/2008
--****** Last Modified Date: 02/02/2008
IS
v_out_amt NUMBER(20,2);

BEGIN
     select sum(bo.OUTSTAND_BAL) into v_out_amt from UTS_RENT_BILL bo
     where (bo.BILL_DT_FROM)<(p_bill_dt_from)
     GROUP BY bo.agree_id;
  RETURN (v_out_amt);
END;
/


--
-- F_OUT_FR_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_fr_dt(p_agree_id VARCHAR2)
RETURN DATE
--****** Created by : Md. Masudur Rahman
--****** Date         : 13/12/2008
--****** Last Modified Date: 02/02/2008
IS
v_out_dt_fr DATE;
CURSOR C1 IS
    SELECT bill_dt_from,outstand_bal FROM INS.UTS_RENT_BILL
    WHERE agree_id=p_agree_id
    ORDER BY bill_no;
BEGIN
    FOR c1_rec IN c1 LOOP
    IF c1_rec.outstand_bal>0 THEN
     v_out_dt_fr:=c1_rec.bill_dt_from;
     EXIT;
    END IF;
    END LOOP;
    RETURN (v_out_dt_fr);
END;
/


--
-- F_OUT_FR_DT_ELEC  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_fr_dt_elec wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
180 150
vVX9BMQwF9mMfHfP9SW1x72czdAwgy5p2Scdf3SKMQ9rC+FsoACfoa/29gM5xsvC33mue11S
xY7ykrWBCwwrSULJIatCdaw4Hx1xQ/j+G7EsrZpdmzKtO8tRv0YW/xXMt4gq7diUqK6O3Sdg
jdlsMolXLVSnN8VoPoLMGDaLiGWyvtMjIXTtTry9hvl/KGw8r/JkAI42cVoTdPLzDLO5trEI
/vO97iRHM0EKwvdW09JP1yLb3IFTx2vAhPCoRhuYnGci1IQBaHy2EwHIxEmP8wVWVssSVf8G
Q71Mt+4HhjzgSzH+GZwBzSq1gyc4vrnDPPUoqnA/4CY=
/


--
-- F_OUT_FR_DT_ELEC_SHD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_fr_dt_elec_shd(p_agree_id VARCHAR2, p_to_dt DATE)
RETURN DATE
--****** Created by : Md. Masudur Rahman
--****** Date         : 04/06/2008
--****** Last Modified Date: 04/06/2008
IS
v_out_dt_fr DATE;
v_out_dt_to DATE;
CURSOR C1 IS
    SELECT bill_dt_from,outstand_bal FROM UTS_ELEC_BILL
    WHERE agree_id=p_agree_id
    ORDER BY bill_no;
BEGIN
    FOR c1_rec IN c1 LOOP
    IF c1_rec.outstand_bal>0 THEN
       IF  c1_rec.bill_dt_from<p_to_dt THEN
              v_out_dt_fr:=c1_rec.bill_dt_from;
           --EXIT;
       ELSE
              SELECT bill_dt_from INTO v_out_dt_to FROM UTS_ELEC_BILL
           WHERE agree_id=p_agree_id AND bill_no='1';
           v_out_dt_fr:=v_out_dt_to;
           --EXIT;
       END IF;
      EXIT;
    END IF;
    END LOOP;
    RETURN (v_out_dt_fr);
END;
/


--
-- F_OUT_FR_DT_RENT_SHD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_fr_dt_rent_shd(p_agree_id VARCHAR2, p_to_dt DATE)
RETURN DATE
--****** Created by : Md. Masudur Rahman
--****** Date         : 02/01/2008
--****** Last Modified Date: 02/02/2008
IS
v_out_dt_fr DATE;
v_out_dt_to DATE;
CURSOR C1 IS
    SELECT bill_dt_from,outstand_bal FROM UTS_RENT_BILL
    WHERE agree_id=p_agree_id
    ORDER BY bill_no;
BEGIN
    FOR c1_rec IN c1 LOOP
    IF c1_rec.outstand_bal>0 THEN
       IF  c1_rec.bill_dt_from<p_to_dt THEN
              v_out_dt_fr:=c1_rec.bill_dt_from;
           --EXIT;
       ELSE
              SELECT bill_dt_from INTO v_out_dt_to FROM UTS_RENT_BILL
           WHERE agree_id=p_agree_id AND bill_no='1';
           v_out_dt_fr:=v_out_dt_to;
           --EXIT;
       END IF;
      EXIT;
    END IF;
    END LOOP;
    RETURN (v_out_dt_fr);
END;
/


--
-- F_OUT_FR_DT_WATER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_fr_dt_water(p_agree_id VARCHAR2)
RETURN DATE
--****** Created by : Md. Shafiul Alam
--****** Date         : 23/12/2008
--****** Last Modified Date: 02/02/2008
IS
v_out_dt_fr DATE;
CURSOR C1 IS
    SELECT bill_dt_from,outstand_bal FROM INS.UTS_WATER_BILL
    WHERE agree_id=p_agree_id
    ORDER BY bill_no;
BEGIN
    FOR c1_rec IN c1 LOOP
    IF c1_rec.outstand_bal>0 THEN
     v_out_dt_fr:=c1_rec.bill_dt_from;
     EXIT;
    END IF;
    END LOOP;
    RETURN (v_out_dt_fr);
END;
/


--
-- F_OUT_FR_DT_WATER_SHD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_out_fr_dt_water_shd(p_agree_id VARCHAR2, p_to_dt DATE)
RETURN DATE
--****** Created by : Md. Masudur Rahman
--****** Date         : 02/01/2008
--****** Last Modified Date: 02/02/2008
IS
v_out_dt_fr DATE;
v_out_dt_to DATE;
CURSOR C1 IS
    SELECT bill_dt_from,outstand_bal FROM UTS_WATER_BILL
    WHERE agree_id=p_agree_id
    ORDER BY bill_no;
BEGIN
    FOR c1_rec IN c1 LOOP
    IF c1_rec.outstand_bal>0 THEN
       IF  c1_rec.bill_dt_from<p_to_dt THEN
              v_out_dt_fr:=c1_rec.bill_dt_from;
           --EXIT;
       ELSE
              SELECT bill_dt_from INTO v_out_dt_to FROM UTS_WATER_BILL
           WHERE agree_id=p_agree_id AND bill_no='1';
           v_out_dt_fr:=v_out_dt_to;
           --EXIT;
       END IF;
      EXIT;
    END IF;
    END LOOP;
    RETURN (v_out_dt_fr);
END;
/


--
-- F_OVERWCAT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_overwcat wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1f2 16d
jZW8DV4rbfSE0lQsolS9Pk/2ptkwg/DMrydqfHRVrQ9rDN6eBYUjYtpNSvEEZdoW8kVBWd6j
BF9El30/qtwJ7H7Wwr/CT0FBQYoaZfKgKrj1zTq4koO7ImqDMewwhsN0HIOJSEwpcTmn9ez0
XhaJoxkih4l9JjAbBaxv3RSU/U33XEA0NlbWCu+eWQiuu/mDmGSsKmODNkxOMPzMCdzyjxe3
T8pvG4aAEBUzQ5+pzJj6473omBVOfatk4vIjXMP1u4jdIDAoHdRFBERM4NW21jD8ZMjMnF1L
FsDNF0KWgEenqM9UYMzS9SjHc1IZ7Z0qSyATHaBJUNfPf5HKx72Cz+ZXMWjVRfxVeKsNquc=
/


--
-- F_PARTY  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_PARTY wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
175 138
qanj+9SJGb/o3dU+zGyeTELMcbYwgwHQr9xqfC+irfjVi6yD8qny4vNbCyB98vqDg1diAJPj
wGfmwwbd/oTj09a0t796TiEFdAbTWzW3jD31IR5z0oX/1kTizehzySuW638l1BZjNUQSCkgX
DeH+ydzy/pYbVa7Y34tBHFR01CkmbJxLRlQJZzdZ6FKrsp3I6SSKWr0MVdqJuTJS1y4fuDqM
gIBSep1TSdhn5jPfMWhGNXolxNLGHQ1oXmF/YYqK44Uaq/UQTHnExD2UK+T5OtIzIxVOOtKs
Tlu0ZN8NqAiBlR+3LUxQ
/


--
-- F_PARTY_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Party_Name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1dd 168
dbFTdhLHvf6yIa5a/FxY61tJ6SkwgzLINQxqZy8CALtkdW2gAisn4msHUoItmSmKZTF3M6A2
BdYObxjn+RID1ComfUuwEJoTxhPCOM3wARbW9nIgLDcFnIzsSNaECPhwnnxo7XtTj1on2VRV
FCmDu6TXqC2Sqiv+ilm9OmAEYRYj8PE3JlzCgkh9IL/DvOS+RYwSap4Gd8P3M7g4M2/UHiN8
3D6fTvY6yiLYoec/nmRwdxy+qXc4KiHXW7/lIZekw4PewAi8HZpbZUuyRCN0Y3lFdJoQEIIf
Fufs7OF76ojwUl7K89Xr6WFxGcnHdXWx/jM6KabQsGrz3Bd8lZGn1QZmnZI2yQcStQ==
/


--
-- F_PARTY_NAME_CONCAT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_party_name_concat wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2a1 1d2
5TYpZoAM/y99W0B4GIpSdCdrr9IwgwIJLSdqfC/NimRTbFc30+yfCvoOl8FUDlr8ody3oXVQ
SC4M+gmlxurCjds35iG0JVUS/hm25auVkFCeIuS/+MfkgQczTlW7ncv4M+frdKZfeNXMQPBp
c8aSaah5oAHAHLq2xIJ112anUCoacGrjsV8cgskLjXiRKvsP29Z9DDiTiYWkBGBIwZS6C+Ud
wxqxSah0w5VdJv4r7zgGpdOnyCR6Q93Dve36AcC6kfdLCN7OkuB61xMPkRL4lSo/Uv21rNVr
Zgz9w6gFyj4N3/r2AkqxPiHSOW4coXTOS7jVcUeUB1mJn41Iw5MayZL0/JduSw6rPq9EPDo8
1KnBQ40J0/FvIIwfUDI6AF1M/prjuLNR/K5S/evLrVN3b3LEyEGv9SEyK5FTQxEGutlwhQrW
qsKcjvTJD2zTRNfKzGhz++pSGiw=
/


--
-- F_PAY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Pay_Type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c0 158
lo0eM7boXE+YzfQ2mr5fZFaasrcwgxBp10gVfHQZra7umVFaBXdS6dowJpn3o0nAXgSw58zL
ty8OpBsIMwwECp7spwx+qqrC2acNeKdrdEjHy/nPgzXopnCIduLWD9qeReMAfeXcjOy0D9Ry
Hc+JPyqhe6ianmrT6ZZp6J4T2njitSqGkuDfXiAheG6gEPMPhJTeLG1rkDggu4Liz6kJig83
nc4nNeaEnVOKHs2bA9tjvy7RpPKBezlha2fQa6BiH+rdgA4oWzXraWfBxYx/+h30VDeK3uzB
OtnvX9fu9gO1fXASip+45Dbr8Ekk9Ha3Wx/XSDNtbqIwzjl3icBG
/


--
-- F_PF_GLACCOUNT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_pf_glaccount wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
158 148
2XLYPACQZNKPgn8sUhgr8MXnNOYwg1xpr9xqfHRDbmSlRHm3pvBS2Fd1d1VmDdxd6B3cPHd/
RiE75/uarrqnns/CT3NBzeohfoxOdFsQJH0eUrFhVbEpx7w9MvQrMdayAqPQeMGSZSJbo6lp
fkY4beB4FtXdgxTyRD75Xgr3e49YQg4NC4Jdwdjo8X5GGo9XI3U2so4GChQXj1KE5sjLNE85
EMl9+gkEHKuV+DU5M+wLomLPaq3bHGWleDZMLhioif8GZ1zTCGWdh2KcxL/qfMewu1UIeSh5
xKo3uR1xIrrSE1dyR2Syt7pc0NDwbSz4X5On
/


--
-- F_PGID_TO_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_pgid_to_office (
   v_pgid                         ins_p_summery.pgid%TYPE
)
   RETURN VARCHAR2
AS
   v_office_cd                   ins_p_summery.office_cd%TYPE;
BEGIN
   BEGIN
      SELECT office_cd
        INTO v_office_cd
        FROM ins_p_summery
       WHERE pgid = v_pgid;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_office_cd                := 'Not Found';
      WHEN TOO_MANY_ROWS
      THEN
         v_office_cd                := 'Duplicate data';
      WHEN OTHERS
      THEN
         v_office_cd                := 'Not Found for other reason';
   END;

   RETURN (v_office_cd);
END;
/


--
-- F_PREM_COLL_RECEIVE_MODE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_prem_coll_receive_mode (
   p_pgid            VARCHAR2,
   p_prem_due_date   DATE
)
   RETURN VARCHAR2
AS
   v_receive_mode_cd   acc_receive_mode.receive_mode_cd%TYPE;
   v_installment_no    NUMBER (3);
   v_proposer_pk       NUMBER (12);
   v_fp_receive_id     NUMBER (12);
BEGIN
   BEGIN
      SELECT installment_no, proposer_pk, fp_receive_id
        INTO v_installment_no, v_proposer_pk, v_fp_receive_id
        FROM ins_prem_acc_receivable
       WHERE pgid = p_pgid AND next_due_dt = p_prem_due_date;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_installment_no := NULL;
         v_proposer_pk := NULL;
         v_fp_receive_id := NULL;
   END;

   IF v_installment_no IS NOT NULL
   THEN
      IF v_fp_receive_id IS NOT NULL
      THEN
         BEGIN
            SELECT receive_mode
              INTO v_receive_mode_cd
              FROM acc_advance_receivables
             WHERE pgid = p_pgid
               AND receive_id = v_fp_receive_id
               AND slno = 1
               AND rec_status = '1';
         EXCEPTION
            WHEN OTHERS
            THEN
               v_receive_mode_cd := '1';
         END;
      END IF;

      IF v_proposer_pk IS NOT NULL
      THEN
         BEGIN
            SELECT receive_mode
              INTO v_receive_mode_cd
              FROM acc_receivables
             WHERE pgid = p_pgid
               AND receive_id = v_proposer_pk
               AND rec_status = '1';
         EXCEPTION
            WHEN OTHERS
            THEN
               v_receive_mode_cd := '1';
         END;
      END IF;
   END IF;

   RETURN (v_receive_mode_cd);
END;
/


--
-- F_PREV_DUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_PREV_DUE(DT DATE) RETURN NUMBER IS
 V_OUT NUMBER(19,2);
 --v_due NUMBER(19,2):=0;
 --CURSOR v_cur IS (SELECT AGREE_ID,AS_ON_DATE FROM UTS_RENT_OUTADV);
 BEGIN
   BEGIN
    SELECT SUM(OUTSTAND_AMT) INTO V_OUT
    FROM UTS_RENT_OUTADV
    where TO_DATE(AS_ON_DATE)<TO_DATE(DT)
    GROUP BY AGREE_ID;
   END;
  RETURN V_OUT;
 END;
/


--
-- F_PREV_O_DUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_PREV_O_DUE(DT DATE) RETURN NUMBER IS
V_OUT NUMBER(19,2);
--v_due NUMBER(19,2):=0;
--CURSOR v_cur IS (SELECT AGREE_ID,AS_ON_DATE FROM UTS_RENT_OUTADV);
BEGIN
  BEGIN

   SELECT SUM(OUTSTAND_AMT) INTO V_OUT
   FROM UTS_RENT_OUTADV
   where TO_DATE(AS_ON_DATE)<TO_DATE(DT)
   GROUP BY AGREE_ID;
  END;
 RETURN V_OUT;
END;

--SELECT F_PREV_DUE('15-APR-2007','00001')  FROM UTS_RENT_OUTADV  GROUP BY AGREE_ID;
/


--
-- F_PRODUCT_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_product_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
167 117
bgTJ1wFoZ8o6oUC98ZveCraYIAwwg1zImMsVfHTpWE6Uh8iDAjcq4Of0DO8N3I0beuh0O1Q1
5/lPpxg8gZE6HA8kGFp7VIC4rnKxjLX1u3eBMa0qGVhNhCU5Vq+TQkzFnXKvC+NBcOKpJ5Xm
XrJ6Vg2q3sTKBbj2aRjvQVb0LMYlb9V3+3VrY4+p0C8Dqu5M1wdWl2Oi0N1KV938G62MMD20
Xywvz05rT6lxZcVNw1NaORVpo39nLeUb7xTvldLsX2TsDKhgeU5EoZtUIg==
/


--
-- F_PROJECT_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_project_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19f 12c
05QZjvamr7rsf05KSDVVziw35hcwgwHI7csVfHRGWE6Oh8iDYx3vXAfTcefF3IkaROh05HRW
ytv4bTbheSZJ1fm5dg89L8Tm03Foc1KYQdCuv3o1FaYOMvKIxpy8lJFuJcDWaHvWYcwxFyEN
WwJWsqAzcuwOYioPnCPU8rYAUYqaSR45IJxuYrhsFuM/8JbWDQdwPl+U+bBQJmZQ1TUry99K
9/LZzc7s88S6jGDjwR+dFJumBkGMnvctlvLKOx91EYYS/HZbvUeZDujiJCJdcyP6bBBl15N1
rodx8guh
/


--
-- F_PROJECT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_project_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
309 19d
FA+ZYVJ41TMkf770tzeqNXifmfMwg9cJ2dxqfC9dimS0mfLVqEZX00Nw8TKrXdjWzY5Xk+eX
+yay5kO1Lb30TIcXM6CDWJPQxm8AjWHMNq65QzIwGXqKVUiZmTmmkB6gRRUlRcKsLatl66Uh
rMYz4mq3zKyj1c2jXtqoQs2A9uLZlLHBdOjlaaWHo4X/ZVoYYh3pjM0q6ZR4OEVBO2n4bbIn
JH5ditMeQKwRSM+IiUE293oF3oXl1nOCZqAn64wbj8kCq6j66FfjxSh6NGItmb7Ck4Rnl1xo
wEnDrj1JcAAvjN7b/udtL8Madp68ycfMpoEJi/c3JY9P5Nj9mqR9P5j7qzPKQMRVC6e5Dpe6
2euYFruEE6rHvcdic/TNckEQEwNdx2IJgWUX+yQjWwTKwn8=
/


--
-- F_PROPOSAL_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_proposal_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
321 1ca
3LJ0MFVkw+KXRJIuEBDq9yCZLUowg2PxzPYVfI4C/m4PUg9AYjZYxwsLASgtLhc1xwzx/JKO
l8PfL+8N+bUxiPZE+EvNvCFdbviBaBRSG+aQDqmNMaef9r+Vg35WMDamyRuNdVHgtu8ve8Xz
lxrwLZr8Uz1Cl/QPtxSxWI58C2V2gkKudXubf0q3yBN8ReEc2Sbr+PDNW4h2Ej2WCSYb0Pb/
rbdQk7BuGaX/B6lfzrpm/LzJUhaVSXp3DsL3JSWYV8V7BCVbT4eNQSkLB2UOriKowfshRW6g
Mtx311XO4PRe42XfvWgrc+67qK4eujISTn8fylCiWYK2CxtmSX3WZ/8Lv5rG2dXSRjvKYfjX
UR+gvquzWViF8Nu+kpl4gyCxDyzpDUbpzJScuHrIGpLqo1Qx036BvlZrcW/amK35N20WyjvE
KQ0wP83KGmFozx0F6VPJ
/


--
-- F_PROPOSER_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_proposer_name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
4bb 1ad
zw0jZ8I7OhxAIr1hFfGF0z2FX0kwgzvDLdxqfI6RM+o0RJRvotlgd69Xljtj0q3CkOZJbWt+
UOXknUaQ6KFe027yNPq+TpjZkImRbL3VlK8HBSyf+FX+M4+8GSTEuOpT4KheyDb24pXxHjEA
HabwYXdi1Bq9fYOUcQXw77zmtRb6V53QgxYGOoTZVYMuN70SrwIaS7F25ARHzFQRlrEwyAPl
C7N8WCsKmcS2/kWi8GkBdYSkQF6jHm2p3Bywt56Cvu9DN97TYQgucPPyOPDT+z6cwNlM6PLy
9hUjUUKN3KdUUVTiEUXVZf+SZRzBZd4UIA/8a4qGqwSxaoXf4n1d3lO3neyIPXK4DMYpz9Vy
xw5lcreo/UMyoDqqEBohOAtoks9myxeDnVyYI9byjWBXbvl4Fx+2b7QTLPxH4bM=
/


--
-- F_P_PRODUCT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_p_product wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
156 11b
Efa58rE50ILsy23qsdpv2iwHAsMwg1xpmMsVfHSR/+owNScfOTzjqBRI/SYy5Xqp3Ihn2MPn
+U8iDrJBVpo6/8FmyNKDL2gLLPjBhjO8vMJefgw7Z7ZuRo2NS/h2VpJwvae958Y5QSrFWixj
rKAhviyguj66mg2FMfMMLn4GbDtqq2MHomm3eMijS+mdS+hYLlGZLtZhui3HAm84nripINO8
3TD3tEo3kyO7S4RnG8Xu6VZZykQ/BHNSqeZMcuZaGAM6qJMjcP+I/S3XWwCTCew=
/


--
-- F_QUESTIONS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_questions wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19c 15c
rsJgxDXQyzaBmtiZNwewuiAXwJAwg3lpLiAVfHRVrZ0VnPRm8CaGGJ/nJpmz3SluifBeITtZ
5uxN3yI/JPoW+xpDL5M/P7s6vtihrXnnvORyPw1VOwXXb2X7ppm1o4yB5ecN6KUuyNw7LRqc
xss0v9me6STTBEzXNpn6J8VCFhrt8Ws6tZ5Eo4Gwf9MLbhEYicNGF1JAlzXszYNSbBfRBiZM
wliakm5rxD5lFa3rTmyaFtyPmBXFHOYa3uFlvMjckiV3w/WpmWfAHaeDUZxcKuvyYEWAyWrI
skBCQSQAZ64gyyyaHjkiBclEzZZ96LEkrQm4vEW6pxU2eqy/gCPYyXA=
/


--
-- F_RETURN_GRTDT2  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_return_grtdt2 wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
bb d2
a1J5MlEve/0rZcv7nrfc8ZN9dsUwgy7wmMvhqC/pOzoYPr+2E2OJEVFl2BQTfzdr6Aizk36l
taRnttkSuQCC0bNYc42P97ESQmRk5HHZO32vmzZB3RyIxHCTtRXn+60CHN2AROHgo1P7jNxX
EtN9kFTra+zPNZJKnxI3YCdxZvl/VQSTs1mYVA907Szw5fDZkIutuJTfLPRcfJ0=
/


--
-- F_SALUTATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_Salutation wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ac 117
/voosvcA7p7d+lhzA8scECUAJpAwgzLIfyisfC8CkDqUxHXdBo/ydie+nqG+8cDpkKtgtoyZ
+apjq2sEmnc0/pJMuYnv+o2oabzNZNBrLNH+uoM6KxHG4Fk0Vo9jJTyCx7ZD9iJ4dTfpn6cO
tiunFUg1oKE2UauLkq4aey9OkdAHGPEteu2so3cWiOAw6X5wf1KSUdgmH4KwpVRR6eOcGa8G
dDrE0En0Lll19+eFzuZLpZdXxanWQ6D/qh6vNZJLmh9ZH9qRQmXfK64WHyfh
/


--
-- F_SAL_DEDU_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_sal_dedu_nm(v_sal_deduction_cd NUMBER) RETURN VARCHAR2 AS
v_sal_deduction_nm             VARCHAR2(50);
BEGIN
     BEGIN
     SELECT sal_deduction_nm INTO v_sal_deduction_nm
         FROM sal_deduction
         WHERE sal_deduction_cd = v_sal_deduction_cd;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20021, 'Invalid code or ID');
    END;
RETURN(v_sal_deduction_nm);
END;
/


--
-- F_SAL_DEDU_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_sal_dedu_shnm(v_sal_deduction_cd NUMBER) RETURN VARCHAR2 AS
v_sal_deduction_shnm             VARCHAR2(10);
BEGIN
     BEGIN
     SELECT short_nm INTO v_sal_deduction_shnm
         FROM sal_deduction
         WHERE sal_deduction_cd = v_sal_deduction_cd;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20022, 'Invalid code or ID');
    END;
RETURN(v_sal_deduction_shnm);
END;
/


--
-- F_SAL_EARN_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_sal_earn_nm(v_sal_earning_cd NUMBER) RETURN VARCHAR2 AS
v_sal_earning_nm             VARCHAR2(50);
BEGIN
     BEGIN
     SELECT sal_earning_nm INTO v_sal_earning_nm
         FROM sal_earning
         WHERE sal_earning_cd = v_sal_earning_cd;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20021, 'Invalid code or ID');
    END;
RETURN(v_sal_earning_nm);
END;
/


--
-- F_SAL_EARN_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_sal_earn_shnm(v_sal_earning_cd NUMBER) RETURN VARCHAR2 AS
v_sal_earning_shnm             VARCHAR2(10);
BEGIN
     BEGIN
     SELECT short_nm INTO v_sal_earning_shnm
         FROM sal_earning
         WHERE sal_earning_cd = v_sal_earning_cd;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             RAISE_APPLICATION_ERROR(-20021, 'Invalid code or ID');
    END;
RETURN(v_sal_earning_shnm);
END;
/


--
-- F_SCHD_DUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_SCHD_DUE(DT UTS_RENT_OUTADV.AS_ON_DATE%TYPE
,AGREE VARCHAR2) RETURN NUMBER AS
 V_OUT UTS_RENT_OUTADV.OUTSTAND_AMT%TYPE;
 BEGIN
    SELECT SUM(OUTSTAND_AMT) INTO V_OUT
    FROM UTS_RENT_OUTADV
    WHERE AS_ON_DATE>=TO_DATE(DT)
    GROUP BY AGREE;
  RETURN (V_OUT);
 END;
/


--
-- F_SCHD__DUE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_SCHD__DUE(DT UTS_RENT_OUTADV.AS_ON_DATE%TYPE) RETURN NUMBER AS
 V_OUT UTS_RENT_OUTADV.OUTSTAND_AMT%TYPE;
 BEGIN

    SELECT SUM(OUTSTAND_AMT) INTO V_OUT
    FROM UTS_RENT_OUTADV
    WHERE AS_ON_DATE>='DT'
    GROUP BY AGREE_ID;
  RETURN (V_OUT);
 END;
/


--
-- F_STIPEND_PAY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_stipend_pay_type(v_stipend_pay_type_cd    VARCHAR2) RETURN VARCHAR2 AS
v_stipend_pay_type_nm             VARCHAR2(40);
BEGIN
    BEGIN
         SELECT pay_type_nm INTO v_stipend_pay_type_nm
         FROM clm_payment_type
     WHERE pay_type_cd IN (select distinct d.stipend_pay_type_cd from  clm_supp_ben_claim_detl d WHERE d.stipend='1')
     AND pay_type_cd = v_stipend_pay_type_cd;

/*    EXCEPTION
                 WHEN no_data_found THEN
                 raise_application_error (-20001, 'Invalid code or Id');*/
    END;
    RETURN(v_stipend_pay_type_nm);
END;
/


--
-- F_THANA  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_thana wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
26c 150
IMX2CZAwnF1Fx5lzBPu3PetqmCswgzv3LUhqfHSigh7VU46hqQ6E6u/WZusN+210EYPcG68M
UCZMm7VNjTwYp6Y1zNzhQs9JkOVBbt9ZuL2x0CnHrPD7qagRefo56hVq5ZW1TYcfzW1B0BFh
88pN7S90K3F5Q9e00cbxqjla+TlWR/ua/Rj4KXzqB2J7RKujtFaSpNgpmZcpezvEya/fGm6t
sD9sirtBDBLYzC8lHv6Tjul3j/rufznJ8UGpV4kreU1TsJu/Dk7KQvuBebrdA40Dja0wDMHK
ep+qF8FaQf5j+AcSGbPEERFKFrXkiUI4Bn6BsgQ3P54=
/


--
-- F_TOT_RENT_BILL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_TOT_RENT_BILL(AGREE UTS_RENT_BILL.AGREE_ID%TYPE
,F_DT DATE,T_DT DATE) RETURN NUMBER
AS
V_TOT_RENT UTS_RENT_BILL.RENT_BILL_AMT%TYPE;
BEGIN
    BEGIN
        SELECT SUM(R.RENT_BILL_AMT) INTO V_TOT_RENT
        FROM UTS_RENT_BILL R
        WHERE R.AGREE_ID=AGREE
        AND R.BILL_DT_FROM>=to_date(F_DT)
        AND R.BILL_DT_TO<=to_date(T_DT)
        GROUP BY R.AGREE_ID;
    END;
    RETURN (V_TOT_RENT);
END;
/


--
-- F_UNIT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.F_UNIT wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
184 144
QT5tIpRw/U1w9I90dsaF8rARiBkwgwHIfyAVfC8CWE7VSO/3Z/IpUPt/dv++VKzH9WFrE1wq
pMVc6fzdu0kb2yaXun5V+OTS/3tLm9RlfQS0zpsw2lEnDrHz6c1pK5TnOspuW6niU7fPqZ2r
9Ju+4jyVp4eyH94iVUjAoElDOFl8imJd3b3r4LcpOcb8MMr1NRFm3NrTrC1OOcC1Msl9LswT
n1aPnZKxdH4L1hyMYTf9pXN9844hSmZhzRkWWZP3othnvnE9gevZ4YuLwZv5cz2vxr74Rk6W
dUiHsqTjuwFArlZOQe1PNDGULhe6cw==
/


--
-- F_USER_INFO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_user_info wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
13a 138
Cuc2hAkPTya4uRkxY57qqIZwt2wwgy5pLdzbfHQB/+o0zYOyqH9cWmhj3P0mUmZ47nCb26FW
yje0uYbeo7lwGHOK/kEPcTgTEJFu0vgegV6aGa4sEfEJWnvOHHEVNxoqpkbA80Ck/uDkcfdJ
YoL0wE2Bh/xdy9dzeQVYHbJBHv9ZtjFf8dO97MXZNfQHb8GCn9CYklMVq5BOp/UcHw2LxC1z
J3Qw/whyeWpu26nM5gAyGJai1c92oeecHiy4LiVYqojiCZBrFwwm+akxtF91H/AqmgmlyZ+o
wFjoAmoQv04dRdCu7g==
/


--
-- F_VOUCH_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_vouch_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
189 148
uyGeSXQc5O15JVbBB5FJUl3LZI0wgwFpNQxqcHSBaA/3bdgdjb5tBy2Ep+i51lhkGg8eekST
lERMNbidmp+6+L3ZPkK7QwjxNNOe/5k0BWtzVRC0+do7OzOUO/BlTcze8HtPrMBNw2CmS1k5
kHr705A5K5mWRJqyRzIkYvGUJHuhDgpr1UJqjnD1uNN6osaMM1S+kgy1WiS/L2oEML1/c+DD
CKdTfXJfErUzRNu6QPti/o2RL3t9CU198t9WGPDviu1fXO3mI9pP17ksSHAGMwexZHI5n3lO
Oc0oU8llABdwrbCt7X/wB58YQTSSHdPG4D8=
/


--
-- GETDUEAMT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.getdueamt(prollno number)
return number
is
v_fee number(5);
v_amtpaid number(5);
begin
-- get total amount paid by student
select sum(amount) into v_amtpaid
from payments
where rollno = prollno;
-- get course fee of the course into which student joined
select fee into v_fee
from courses
where ccode = ( select ccode from batches
where bcode in
( select bcode from students
where rollno = prollno)
);
-- return the difference
return v_fee - v_amtpaid;
end;
/


--
-- GET_POLICY_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.get_policy_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
11e 10f
8BzHrQEKEOOR37tk+o625mdDxCgwg1xKvssVfC+iJnOU0bfLEWKehn7TDMmxm6/MvmfnqKjm
NWqahi8CRjPXetd381xQRuQjQmMXv52QmimzlPiR/UxS8M+WkCdjupxHNeNI4VkSp/aRoHts
GiyWK9kJfGECYO9OcGdEIg0hQHGQ3g2MTOgiMZGkk5slS4SZy1S1cIJ284Ywf15OnnaUtPk/
ZMqA8o10ZT2OLQaojLNqEV8E8om+TpqJtWPIkDkVIcpvLElnrq0=
/


--
-- GREAT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.great wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
d8 d2
CPtvyPQZvLlspn7HuNICDBS5ptMwg3lKf8sVfHTpWMee0Dvb5tSjygKPYffF763L1eBNtPP+
6rfmlxXJnf5zQyItsbgBMLyLxpi9z/6Mtx1obomvuZ3bSBpEqC4Vad/BjTbmIcjeWbf5FuyC
sjcDvQB3GV472VSA4LTLmAvXcMkh6ZKGivzO8dVSDUP3i7Yns46C562VVeGZdt+Y
/


--
-- IS_GREATER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.is_greater wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
a8 c2
3VubLNo3LZqxQL6rygBgVCS4xJEwg8eZgcfLCNL+XoVWSq6W8i5WoWIl42mlmYEywLIl9EZl
IZSscYTm1uQOcURycNFEDmm4Ta7nw4Xs2fo9VesoFoop6C84HyYvBu78W+qRAfZwsl1TkjaY
ZvSIo8e+kr6mKlTWRDVvEWddIWtlrwi5NeJKqGeGiKYdhNUg
/


--
-- OCCURS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.OCCURS wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
23b 150
3AK1jT435JZpGBepy2hQCx7GRRowg433r9xqfC+irfjVi7TjHKnv81rUMciNaDJDVaZ4+bWW
S9br5d4oS7zYAIaBekJubARJNZ44//yfNfrBfLOxf7cnXKY6TYAiJM3z/+aCyxe+x87rl5HH
b32vxoXgSMqMz3A4Ksv/CtUgYWdXPfzUTpmlUJYcKk/N2uiPH0AMKG2jGVXncRZhyEy7GX2Q
Yxod0FP0+p6hOVgLRpzuI4UCjIkuFAxHcvTvTLAQYnbjPqT7xAnid5QOgf4wiq6SyWAtc1vH
ne0Pyb+daiYvPVYQ1wl4em9rc8NtJZjFoPm5W4gu464=
/


--
-- REF_PROJECT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.ref_project_nm (
   p_pps_cd    INS_PROJECT_SETUP.PPS_CD%TYPE
)
   RETURN VARCHAR2
AS
   v_PROJECT_NM   INS_PROJECT.PROJECT_NM%TYPE;
BEGIN
   BEGIN
      SELECT   PROJECT_NM
        INTO   v_PROJECT_NM
        FROM   INS_PROJECT
       WHERE   PROJECT_CD = (SELECT   PROJECT_CD
                               FROM   INS_PROJECT_SETUP
                              WHERE   PPS_CD = p_pps_cd);
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   RETURN (v_PROJECT_NM);
END;
/


--
-- REP_DUE_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_due_dt (V_COMM_DT        DATE,
                                       V_PAY_MODE_CD    VARCHAR2)
   RETURN VARCHAR2
IS
   V_DUE_DT   VARCHAR2 (200);
BEGIN
   IF V_PAY_MODE_CD <> '05'
   THEN
      SELECT   DECODE (
                  V_PAY_MODE_CD,
                  '01',
                  (   TO_CHAR (V_COMM_DT, 'DDth')
                   || ' DAY OF '
                   || TO_CHAR (V_COMM_DT, 'FMMONTH')),
                  '02',
                  (   TO_CHAR (V_COMM_DT, 'DDth')
                   || ' DAY OF '
                   || TO_CHAR (V_COMM_DT, 'FMMONTH'))
                  || ', '
                  || TO_CHAR (ADD_MONTHS (V_COMM_DT, 6), 'FMMONTH'),
                  '03',
                  (   TO_CHAR (V_COMM_DT, 'DDth')
                   || ' DAY OF '
                   || TO_CHAR (V_COMM_DT, 'FMMONTH'))
                  || ', '
                  || TO_CHAR (ADD_MONTHS (V_COMM_DT, 3), 'FMMONTH')
                  || ', '
                  || TO_CHAR (ADD_MONTHS (V_COMM_DT, 6), 'FMMONTH')
                  || ', '
                  || TO_CHAR (ADD_MONTHS (V_COMM_DT, 9), 'FMMONTH'),
                  '04',
                  ' EACH MONTH'
               )
               || ' OF EACH YEAR'
        INTO   V_DUE_DT
        FROM   DUAL;
   ELSE
      V_DUE_DT := 'N/A';
   END IF;

   RETURN V_DUE_DT;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN NULL;
END;
/


--
-- REP_FUN_ACTIVITY_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_activity_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
161 130
sCat3fO9P5UJIJMnvNqSXNbcATcwgy6uLvZqfHRVrZ3mxl3fYQt9r8dulciFr/cDgRTyMQ4H
pwmD5rUQAfFXPaE0lik9+yqTB7g62k61zduYc4G4JHEsz3vmIsIl20XhbXzFZP1DJBh0pjRr
j+pWA4SiSa2fUpCIhSSabWX4ZZpvjBRiZdbe8Bsv0KRieZVXtsr+hWNTRjwZMlDOSrcByumZ
c+sEIDwhOiMdDDdlGEdk3xBWE2wd4Xvijj7iTN0nG1rj9Y58oM1dgPpC3k+WKPI17ja5vsuF
lgKXxEkwaOrR
/


--
-- REP_FUN_CONTROL_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_control_office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
195 130
1qx8Yjc33oqiN6tYkivMutw/m8IwgxDINZmsZy8C2vjVi9O0Y4TqKUs7Az592NgKPd7LUS9G
QHe1roKjbBHc2RP+vFikXMigLRt9HtoKF9lcsSKSudRM63EKg5aT1ZQMkYgVafehJBUzCmTN
bGqyBKACqBYC9/d82i++6sJx1O6W76XLMF/6/S65geJ2tolvGhv29WXW1JEqVotTyGV7kC6G
z7R8x81eRjmvazN8+H6lge6T4N9BhWwXNuEldp7VVCms5kvW0vYaZqEbZiVbAJDZD9i8vTQt
nSP7uNMLAQ==
/


--
-- REP_FUN_INS_AGE_PROOF_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_age_proof_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1eb 168
MFL2RqPie68KT4kAgbwSbAxMqfswgwHM2dxqfC9dimS0C8VSj1JfwHwzRfCJ2G0LsLjCLxrj
HaFcfbWGV5cKR/pBWEy7So3vOMcuuEjc+TDec+r4hpoi/ap7v1WzqvW7nLvocy4ncsR9Y2//
mb0AJ0jbShMHsgSg/1CipmRUAFQmRmxggJswxKExtkjH4AAkT2bFVmlUVPWF+id1I//cAfWI
28XLxHijCn0+94p5XcYFccC0azUEH/pwLTx+BhRrwmhFxVe5seQDhunihwvMn2M7ZZdwpKN7
Egjpj7zQkK8qFc82Gu1dpxJjTH0nHYGaBDXiFglv6RStNHzPgGWVlFG5DRMk20X1oQ==
/


--
-- REP_FUN_INS_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
159 117
cmYnAZ99dHqytLBKS02/1R2501QwgwFp2cusfC/SaGS072hfHPQHo2+oNzs+YiMeNX8IyquN
tZybFmDBoFhYkEdI4Fp9WdN6HgftoPDt35YSvE+DulU01pfUCQTV4H1pUmwJ4iuoFndg90mp
nH71CfuadXavI4hgfm2YX3WGwSaA9K2esl7mYKOsKG559PHcVhJjZyUD9VrMqFkBeI9tgBnW
gDcSv8XWD/UFNhR5RyrE9CGO1rlNqu9YeizT99R97h83ZAVVKaCVWy0kzIc=
/


--
-- REP_FUN_INS_EDU_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_edu_document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ac 13c
es/BmgEuVlpc5U8JxepAgr/gPXUwgwHIfyAVfC8CWE7VSHTTHVHv4HwzY6Ly/4UtHQWyyPKk
7CsC5Kp25oqmeJCaED8z7Uf3oL4bziD5zgr2OpjtuMe5zuQS/D/sM+w8X5ctJSUtw48Kb2C5
RpPXrw4yQKymUfL8NxrT6CrTKcbAvNxhzlheJR4tmOoCRPKZtgdu2ECPiPpHfSUoCqXE0/oV
BtHwxlosnxEv1JTffJMW5i22GujjnaWJr3vIMIlTu+sMjw3ktzYak73VV+v/uqOW7dZdGOC4
oiNUKC3oOHkskyQTVaZrLwFA
/


--
-- REP_FUN_INS_EDU_QUALIFICATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Edu_Qualification wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1bb 13c
KIP8DHlqSKrfrQETiUuOCl2DQjgwgwLIr0jWfHRAv4s+zybD0drSGCOFrOtg4QdARg1JmXk7
RsOz3v27JBb9Nnkl+V5dz/lWukLx3P2s/k79CuIBVT98vJ/Pffz2x96H/HKLPOLV1HdOr21f
AZ4QIY1eodVilcpCdA6N2pQE1unBYjVs2GiZmPvMYDdtwM76JOaXuxUUIxWQ6BF9dQ/+iXVr
9S9FKq0dbVKC4tj6tRx7gnISoOfui7pUcWZYVHryVqdVNwKpdLAVvSvUXp7ilnM5+hcxEaKS
K9DBupaf47cRzqrO4RLauAg=
/


--
-- REP_FUN_INS_GENDER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Gender wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
333 18d
uwT6jybjg2SJNALTMCVu5kBcL54wgzvxfyDWZ3QC2k7VNMOhp8ukbWVxry8acICLyvr1GI4a
y2LDnHzSmv7K8w4b19sTVvhV+JEeUW7hkHw3Yp0ud8MbJtwb0QoL3sEC9PfmjrZGj4lpn3k0
0nMX7ZqP4TYy0TYC8XBjXZTDi4HQPgItSF4WzQnPu6SGRjQ8IcOQZXELDjjnWVqCX+fWKtPc
gF84S0xrynSZYjigQZr4uB+P6ADjW6pD0+fjLk2gZfPBjhkjpqDHVR7ac7/xKyAMdcwQQE1I
5YZHnZxQCCoDoZTN8KXfE3VkHqu8yz1yHc9rPK2rjjhYyxnCbWoXXuGjugVbMJ+mWCN5IqqJ
M/Vje8FjU88pOn0IFf6DKeuW7as7bw==
/


--
-- REP_FUN_INS_GUARDIAN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Guardian wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1de 140
7dwg4Eqdmm1kV6lBsklCZDgEkDswgxD31+UVfC8CTP4+yZM12woMUn/o66tNtvquMh9GEh+/
XqIIcy72KrKsA/L/z8EUWIlKAo0Y7pK/CEPtgcLtOvw/vPn5T7qF/WQm1MulUalpsicthO1u
rBseIZ1EZ7fwERlqaZbKD2LoHn4MjV3Y64blloQqvZmGpvorNfGICAkKy3y8wE2Z9Hoev5bf
rMak3vKFOs6hE9vfSJXnXWayfG87gq/4TkTyrqE5vrl59dP1zlNWHdUPDukPxR9lechm3eLi
W3gof3KqhbetAjW/c/odIuG/qw==
/


--
-- REP_FUN_INS_HABIT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Habit wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
16f 11b
sAq6LT+bZpZcqfqfC1YiFNrNtnowgwFpmMsVfHSR/+owNScfOTwYqC6k0yYy5SFifOnKf0vD
48a161t5MFQcBtlVbBeTt7iDL2j/6pZPO7HNVQqGKZupTQgYsINC9zfo4gpShy59JaTyX1jp
6rqsQLprU0wdZLQaGuFFklwJfxa2pwYrth4+7iHDAq2eW5ob/2elsnHeLvNB587ca+l1tn7K
26HJb7lEpxD5DvhQtsgIiL9oDF5eOeLW+fTDwTp949JhHOrTArvUvR6WH5Y8b1TT
/


--
-- REP_FUN_INS_INCOME_SOURCE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_income_source wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1ca 130
AOLEUKd/MoBGOngeHsUCzHFGbCkwgwL3fyisfC8CkDqUxHWFBo/ydietGr1xod7MsMs2tluv
Z861rE3ndLwaoccQ/ky5KnzbDcg2MghLsWGgxMIp3IdVmQXDeZAfS/rYytELoCYhGIxDIvXT
idweBb72O5a9RQ5p/enIf5WE6J/dCRdgRtD5fA9ncq2PzMjr+MYFDD5ghSpZMaygRjHdLWxp
ZYdKpJquqMVGlfkSVEAGEJilR38pXqStJHrh8TwX7DFnq5s1v2Nj91mOsqIaeCPnwPmk4sHS
Sj22RUkybw==
/


--
-- REP_FUN_INS_INSURANCE_COMPANY  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Insurance_Company wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b2 134
BAknWXmqiDU2TUbcbqhHMVYNEg8wgxDIJJkVfC+VkE4+SPP8Bo+jduAjDTeLCSWizY6idjvp
UqUFBTwkvRYiV+e+v52Gh7laVCa90cb/wcQ82TN7d83CICiAlv+wSJoZt/Afo1xuq5ZlfWwm
MxCtaqGPmHgoQSZ5xW43NR50r0D9zLgDpocDZ2ZEIHPG96tSPrruo9P9ORX2w/Bsnpnzk/E9
L7uei2gRgRILpX6ZIeez1wzj71ok3Gi92ECman7bysrNgki+cg2MdH61gXkU6qeuZiWZc3TR
9Ch1Y34Rrhzz1Eh8
/


--
-- REP_FUN_INS_LIEN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Lien wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
163 117
bFRcRmVEiDSjMrtTQPJwohfEYBEwg3nI7csVfHRGWE6Oh8iDAjcN4OcmhO9j3I0bROhZpFTF
NgZza6q9WmhdtL9PilquFT6EpX27NbxADkAXUMQ/hUUOlAkvbM8aTZBBmGPEMrE5x0t9NGx9
U5SUxBKPYrrgw2rlmlY9XmFwgHo+4IyoXLejdxZ22ATp/2caGxOg6EqKdyLqEfM8PSgvchZR
W5bhEwh9iZLytsi9bL96WoYmNuruLO9COxdmJaxBJO9tCotE/RcTeLE+w/c=
/


--
-- REP_FUN_INS_LIEN_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_lien_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
15e 113
0vVoSEaXlKOVYkwzS8gsGUX9JS0wg3lpmMusZy+gi9VhRtx59JVCVsC9uViGZ5g7fPEWf9O1
D0qxzFc9ycmfZZjeoSXFLqUmms+1YWigpCQTRUO5s7wVGMcC22U3HI18ZbbJLDc1uquj5y/p
fK1tXyl0gsmEUwVgUrjbt1HdCD+raXBKJRXFZ/c9S0rSi3cRsB/WfSn2QDk4SBKpY0I0MKUb
CAZKgboKeeElbufVVz1sbHCC5AsaZXLGoho+I89gU0gFLB5d1ygnSF48
/


--
-- REP_FUN_INS_LIEN_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Lien_Tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18e 11f
LTq7QnOnPEf+uCuAGgy58JFQmvIwg3nImMsVfHTpWE6Uh8hwOHA7BOb85hp3Jgmcxl0mHQwC
Z+QkEKb0qdrpvHjG0FGoajy2aIMKjtDcfr8fv97a7h4Gyv9mvergwH0BJj/qK7NYTr4VbDZd
Gy929XwSpDwO9pS1Xr0m+TdNdjVYgwb/8avgCCrlYAdAqDij4CjenATRrJbrIrOtuX/KFBN5
ykwh+BQIkUurSoyPugDWqTRd7A2OvGt2U5ZzOSZSSGZm7VDra28ptNlZsjOKvXdp4FQ=
/


--
-- REP_FUN_INS_LIEN_TP_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_lien_tp_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17d 11f
vZMINuJvPiPmxaEx5ta8WandlYwwgwHI7cusZy9GO0IYYmteuuBSHG1xrBJdV1BI1V8U8uN9
+JlmJAbDnDG7G9r9yRQ7JTbQUYvZCgbCJ84rb5Qk9kjiPVXXrStafran+6CXAvf3fLoodINH
UBGpWpC93O/o70cquLnJzTr/HCgYbv9PhyxjBIygpROMhSdURq4P5ozaFKSL612OazV1lLSv
NNAk8TCndfUHuHAm39apIVsVnssyYPu0PJJbPm2GIvMp/VVPhUx+GTy74z39I7dMLQ==
/


--
-- REP_FUN_INS_LIFE_CLASS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Life_class wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1be 130
hqMU9VEFaOxbxRh0IAjLOKJd5dowgxDIrpkVfHSVALteXWZ9ldax7mufJm9F9aCQqtw1kazK
ZsudnUhewejO3KhCOgJ6jbd0g9NxbZkKBViBvpHHeo40JM2X02DV36OoDO80F1jdhOzP69Ko
3jm3ShcEYYhKrziFpK/yV76OSJ4VgKQEY6UlqmZjKn9Ki1NQjlyZeVzZjDWIDpmxjlbS0WHV
lzHSxlU8S4dRhH0iJNaHdggF0P30k42RDM7K88hDojavl4uJZzCgvPCJ/esv90F9G9vMu/BS
dlxKr6REXrh1
/


--
-- REP_FUN_INS_MARITAL_STATUS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Marital_Status wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1d7 138
nUHbQ9xNyozaJJOBttOgONtXedIwgwLILUoVfC+iJnOUBco1hFJ5ou7H33A+h+8S16Q9xUSV
oUn1rKW1FKnRj8p/jQ3sQu+ujYVLgTbGc0/Dwda0aqFxx+TeEw/0eetBrgM7V6RWHqNm9m9e
5kkMCCluBmbHLkLEr602XY7nYXt1DcssDoyXqV2PzLuFXeJd5hAGl/H872oe5eMqq0A029MS
BDIoLcUw/lEQfM87f8pdC1Y4IWkIT68g1hM/cES+e6v7Qj4q9ibPUdNT2vDwifySYKJFjCCM
/2BPWB/l/lnRXuBCng==
/


--
-- REP_FUN_INS_OCCUPATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Occupation(v_occu_cd    INS_OCCUPATION.OCCU_CD%TYPE, v_scope_cd INS_OCCUPATION.OCCU_SCOPE_CD%TYPE)
RETURN VARCHAR2 AS
v_occu_nm    INS_OCCUPATION.OCCU_NM%TYPE ;
BEGIN
    BEGIN
         SELECT occu_nm INTO v_occu_nm
         FROM INS_OCCUPATION
         WHERE occu_cd = v_occu_cd
         AND occu_scope_cd=v_scope_cd;
        EXCEPTION
                 WHEN NO_DATA_FOUND THEN
                 NULL;
    END;
    RETURN(v_occu_nm);
END;
/


--
-- REP_FUN_INS_OCCU_CLASS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_occu_class wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
187 11b
pbSckh03PhtJ146vhcRw4qPenmcwgwHIDJmsZ44CuvjVuQm/zAzef/CxjorcR2qDTOaerEta
5LXep2T/J1f+Ex3B20oaLpSvHptd9kybO9jOzI4qH/7HXDqt1T6k2VkEamWsYL5QZfMjlKlg
HiGBOeeGLjCDalQk/w+W1lAFBtFsZIEHsYA5golv6K0+k0QDpe4M2FxtdbMQVxy2d+frq/11
lJkSHK7TKM0UHEc9FPPIBlpUry3Ajjd52KrIcacy9FqafUjVqitrMWtsbyAm+g8Y
/


--
-- REP_FUN_INS_OCCU_SCOPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_occu_scope wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
187 11b
9BHnM55j2hP+5X/VSAIw2CfIHhwwgwHI7cusZy9GO0IYYmuCGyvbBnpvqK8AwGhrVW82tv3K
0xkPL0NyJtEDmi5ltqPxGys2ZMLugOoIAye+0RhKBVFI8ngXbGNDWeWOkzlQ1R+jYOYselAR
2Oj6pvet1UHiS3fQx9AScr//MPT6iOQ6gcxAvfIdHm51X6wuzuRsdydnwpUQIhlmd+ceq0m0
jk5JHLvT6zjTW2H8t+daUspfj2mTnt3SPCRa36HUohog0lONmCZQu3wvmHjZ/g9L
/


--
-- REP_FUN_INS_OPTION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_option wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
163 10b
4YE38L2njb71QtpV9H4CVJdfEI0wgwHIJCisfC+VkDqOeBXJ9RTLDXbmrOpeo/WYobZvyvk6
+Qk1g30T7P4SEL6YaPEhY2ZTD1u87XtImFv+agPNmFM4MsBfATmMq2sBqNIb+/DUJ6N0LzKg
kSnna7xYMJjcJRHQB/FmwfixgCorFrLOSvFfrA53gMc7duIXi6++Z/CPgBk1S2dFXaVmCMEX
UGdnGII4NsGXCTnJoPnWkQonJ6LsCrAT26+FhrxK4hnYdcN3
/


--
-- REP_FUN_INS_OPTION_SHORT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_option_short_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
178 11b
793eN9gjYcbfXA4eC1BwW4EhsmQwgwHIJCisZ3SVkDqOpDhe6ga4HOlaSxdKhFV73pGlyqma
Dy9d0LwmQnOBY3l19yEtZk1IbJoPp8e6x8zfQji+P45cajMpQZOQe+MBpjv/5tlafTtbqy7o
3iFnGv+F6PPr84uS4LnJzTr/HCh/rZAkXCxjdQ4hS+P0+hZUYK4dayuk98vNJlL0ae9ZmLtw
n/QkwDCNzoKtDMrKlTd8rISNzKboDfk1l/EarqKrUfjBU9k7BWracIE5575x1g==
/


--
-- REP_FUN_INS_PAY_MODE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_pay_mode wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
175 11b
QkJ8RmzggeReemamOiyOnlZom74wgwHI7cusZy9GO0IYYmuCo9NtTlRGNjOFUg4r/bZ/LS/0
1BXE/i9DgLCDR89YikhUyCEtZlNcsk8cKk8e2ngHSQ/ixpdirbYS3FypVh1LxQKn91CZKCHs
5l4gqYWQ8y4+X4FjaENoTpAqSODAo6p1GZd/Nd5waNO3zHw+HKVpCm+F+PXjYfMnRgib1XV2
hv5WuRTJzZl2zo15qMqVN3yshFxpptSjtcqUoSUqZhDlmLVTtz3NzXkiEvvSFaN/
/


--
-- REP_FUN_INS_PAY_MODE_SH_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_pay_mode_sh_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
171 128
Cc7Dm8e6Cu/I1wm9qLFUa4VeO+IwgwHIJCisfC+VkDqOeAbo4ttrp4RajyfyCHL1f/OMHVoU
yz8SBeOyJ7CLcxmYM0wJ9yFYZlOxpE8sYg8FQZiGtxMFJov5FXkd7qd4Bt0CGPcBdLprAcXS
4KumqWBe3pujyvKwSuEBl8NX3rhnV08ujHACHl9uPQ+KPn+A3o/a2nypX1+SE4reUVw4YmPB
LMIMzO9fmVbuCmldblOcU1Jt588YqY7GFefcw+kIpl9E+cwOxXKaQsLHYJm9qiQn2tpyXUT2
R0xM
/


--
-- REP_FUN_INS_POLICY_GROUP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_policy_group wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
191 13c
Hkn5FwIl3dJnMRDH2zcwd9m1GbMwg0xp2ssVfHQB/z40yq8V3aN/RncC8pX0JTZ9Xfv75Uby
ROCPMyGsieYbxruGFxdBidkqr820mymzuFVovu2H/Gq3csQejAL0pqli/QpeZHYKoPiLw9TU
iplfTAFpWR2aUU6ncNU7owzaH8LkU31m6pRk2DMbkjS6NdptDfRI9FQGxbDKuW25jVQOwHwa
qsiPKdKaGhzZ2Bl0aoBwxGBtfFRSCANS0zBT6hEVJqJkqMrXJvXxgs0+YLikUK42m+kIPF7B
glPXXXiGIfM3fyP7w8nJyQ==
/


--
-- REP_FUN_INS_POLICY_STATUS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_policy_status wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
211 16d
tFR7iCn4xZ0N0y7R1yF7MYZFIsUwgwL3JCDWfC+V2k4+SJlWeT1rmfyPq7fKbL/3eZsXe+m9
92ZcqeF0czMqYsvMjBYgwrkAc4oS3MeJ3+9Gx8xOLdU6w99x6g+wc3h4zeLN7LiV1J4T/ae9
VztGp4JrmmZQl4urlh0vG6WTU6coRrtkzHbP5d5ANSQsrp1lJ+IaAu5lcWdAp922xnHlJv50
lt5B+s3wnUE+O3DPTltxeS8PwCfvPcIPAKm1wDY2FNxGlG4JSr1UeEWy+Sov3EsnqDtFm3z0
BtpXDNuZN7o8oN8ouKHqmCi0DUR94A+QKNdOENGtiT822x/uvZ4Hyzlyv4aKGSOS+wN/z7E=
/


--
-- REP_FUN_INS_POLICY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_policy_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
182 124
hQPLH88MKggifOd4sfS+XL7DVNwwgwHI18usfC9GAE6OEkYTs+8IadlRFFN58sytza8R4OCJ
zsePzWJRcDLc14qxockl8RrXjq8yD07uUouGOtSBQ/VoKs8g/BBTyTubWSt+Ktk2bjwVhWN8
t+d0gyVpIKkWrCBuK6U7KG/cxsx2R1L3zFCSah5j4ceJbzR1X9jhJCPOyKs90+mq4iHLsdfT
sqyxODk/JlOwUtXMxMc2pdWchGcYtjhEsOUaNtgD+TXFTjQMoiOAv9oCP/vENZlfQUUVD6M=
/


--
-- REP_FUN_INS_PRODUCT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Product wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19c 124
cZ9iJpxlN2/h9qFc4fTOQwyFjPwwg3lpmMsVfHSR/+owNawCN/cYqBTRoieQFi4wWYiplGlr
ta4sZ2aPG9m/vAOQEtPc3qySz5lCx738wCjovEHshgvCstQnKQKZ5uaZ6T2Ygm1HtKR03K9R
Tqdw2Tu0uNpbhy1XrmwazheiASCJLZTilC3cbwoclG8WdhRBGG5AIWwYxwrZIUllmLKjRl3C
bBoHySxsuUTsua10vLMjL8jL8docwM2hrPa6nRX1vpXxz8x0+VpkDu55t8N411SA0EEB+8lM
/


--
-- REP_FUN_INS_REBATE_EXTRA  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_rebate_extra wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19c 128
0ZZA0eybwOL8xhr0/u5pND4ZhZIwgwFp2cusfC/SaGS072hfHPAHg9Hm4bpeGCMFcKz0H+Bp
tiSaBh02i3dZF8mCtpQaceDn7PyXwYDXnJLULjLFu5TqchJe5ksXbf0pyAh92JFjrwuWOxhj
TEZws5Sne+GR0WDLl48sJAFLbgfVLa955lFD+LH9rehNdnTxIYue08A5G0kjC5Eui+k6Z7Oq
LOCg54by9nV3cTIcesVoDdW9BGqw88g4YpBdhY4ar0InxRpmLiT0Wpp9csCvGhgPYz1Hh1to
Ae0=
/


--
-- REP_FUN_INS_RELATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ins_relation wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
145 113
zqjx02FIYM+KCWkvx+A+vejeaS8wg0xKfyisfC8CkPjVSEbXfVp2JxLnvXEu3j07Ut1G2w41
c7VhyjZ2u+2/D7x38Xy+Zn38sJgQo7GglrE9/h6YQqAvkG7UrAc3ttPccW1fHi5HpmeMLezo
XwjFGgNbxWpzCqiD4oZGzQjIXrRcVA58AMnsB3bKSYz5NYS3J1wz1if8kgZua9Stlwq5cGtB
S1jAoHAS1TTnekpXru/KQxR4aGOX8XQmCClwfwmFbwKqbFjYvAkzXlo=
/


--
-- REP_FUN_INS_SUPP_BENIFIT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Supp_Benifit wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a5 130
vp98jiq19Frdwpni7/cQnBxP15AwgzLIvssVfHRnWPiUh8iDAjcN4BFeW2YN3I2M3V29FKfl
Bs6qI8rsnjgB44qcwbQlt7jytmiWpNnq2eUQSxAypMGcM5/tAIZAO2T2//dUjlAHUfm0ICuh
Q9/7wp/Bq7Z8fTSoEWXvy1gxrMLMcFEnZXPraSonJRbG7VERqcEFBG8MjsvmjGawOLOR1GOz
Pa6dvs96DjXnW1Wv4KXS2QahcADYfj+kVOdax/e+X2Mzw6keXp3KOsJuX1osgaBkMAhzFPBA
kvyy5jv2kQ==
/


--
-- REP_FUN_INS_SUPP_BENIFIT_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Supp_Benifit_Shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18e 128
Z3Txx6sCoM9G90fc/khUykr8qSAwgwHI2iisZy9GOzqUuuCwYdsGVzNd02jv/mmYOyGjWuOX
tR/PpgbDnDG7G1jMNxqxQI+f2JMqlB78/+Im9tzQPUP1Qkva6rEwxtGJbLBaVoIRDbYrixXi
i3CzWwzt+xXp74NDWboEHpnU2ZV69AloERh7qjDtXUtnKTjTGvr9ddQoT4kqpIYjZ9XNB04i
gG18SMJAT8mhcgY14DGytq/DeZ77iP9GH9hZDnTP9nPWjhgGkOPS9D/QlK79oIT1hYq9vUng
Bg==
/


--
-- REP_FUN_INS_SUPP_PRODUCT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Supp_Product wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18e 128
CbhIvd4to66kKLmfdH1MobKGlQwwgwLImMsVfHTpWPiUh8iXFd2jf4l3Y/ejSZfWxl37VGvh
krUUYpnXqZH68RBygYwzFG7DNnK6coG4F0KqLaSSQYFOUqTRu+TdPPbXg02XmcZR4aGoiq5C
AOtWVZOGnnR7IOfLY/Mu3t/Ked8DjLnQnHlN/VUYfgcSoYjPtqmVbwLWohx2kKyRaaInjCU3
LVJ+UMpHllXmwBDzdzDTTYaxZq3CNhpTxUz6DZvDN5ljJqG8eR3WjvopLELCg+WFUXAI+2mb
uIs=
/


--
-- REP_FUN_INS_SUPP_PRODUCT_SHNM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_Fun_Ins_Supp_Product_shnm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
193 130
vYlOgNhzjZjuHr97AL6FDiP5sAgwgwLImMsVfHTpWPiUh8hwOHA7BPL8JVqV9JuPf0KmFG/y
XH21t6aZ16mR+vEQcoGMmxRuwzZzY4YnEZNhKGGEsS25u8Hu0l3GDe3Xn37tPNjwxe24VvLI
jhX5iR/v13ekKv+vDk5AcOoEzB/JvSXJ79qD+QjCKnmaSEJh1PAadLy93eDWFTVmKErcNWUW
Zo3MKd20tLERL9Sc4sq+Iigneud3CDL3zwM2GlNWca+Nm8OsmWOut8/rNjk+8U+qR/E9i0Jv
RLcfbTPA+A==
/


--
-- REP_FUN_MATURITY_DATE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_maturity_date (v_policy_no VARCHAR2)
   RETURN DATE
IS
   v_policy_term     NUMBER (2);
   v_pay_mode_cd     VARCHAR2 (2);
   v_yrly_no_inst    NUMBER (2);
   v_comm_dt         DATE;
   v_maturity_date   DATE;
   v_pgid            VARCHAR2 (16);
BEGIN
   BEGIN
      v_pgid := fun_ins_policy_no_to_pgid (v_policy_no);

      SELECT ips.comm_date, ips.term, ips.pay_mode_cd, ipm.yrly_no_inst
        INTO v_comm_dt, v_policy_term, v_pay_mode_cd, v_yrly_no_inst
        FROM ins_p_summery ips, ins_pay_mode ipm
       WHERE ips.pgid = v_pgid AND ips.pay_mode_cd = ipm.pay_mode_cd;

      /*v_maturity_date :=
               ADD_MONTHS (v_comm_dt,
                           (v_policy_term * (12 / v_yrly_no_inst)));*/
      v_maturity_date := ADD_MONTHS (v_comm_dt, (v_policy_term * 12));
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   RETURN (v_maturity_date);
END rep_fun_maturity_date;
/


--
-- REP_FUN_PARTY_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_party_name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
258 189
I5VyRoV9oSgyxEA06SXIqbuJbBQwgzL3r0gVfHRAv/9ezqwRbMMuBS0GLwkfZmPciRp+AOl2
tHnna81LxA9eZqOXi16RtfnkxuK604cnrNkIdiK8ru7PU89zRuvuTueIHakQfKOhs0QlfJmh
KS3BK4pTEPoL1umao0VDdfW9aju7PjQ1qYDxmRsEoNy26pUWTM7/cPrfU42Of8uUniiMqWM/
ZLtgcesNPddfAI4ZnxHzRysrS8m/YMIh3ZQtl4siSWex37KDy3bWJOCN6KN5oIaeR3GNVo6G
wLHrXCTmrVzMIjDcM8DfPrIPHy1Tzz9Mp37AGH5FWDSRztFQ24wDCvPhJWsGQQejxADZ/iZG
3DYnjcUgJ1WZ2PjqQMONrp35+RiP
/


--
-- REP_FUN_POL_LOAN_CALC_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_pol_loan_calc_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17a 128
za11p1VDxMlQNZM+ZKGnnjTKAYIwgwHIACisfC9AkPjVSEY92/pXd8Dnob7fDc5/TOOv9KZ/
e867RJ0R0pDsxK5BaEyj8Zu+qFN3AE8gYv5Mai7qDc/l7LYPuxCkzVShO7S6K710MaGwZSmL
f1fSY4wg+8DVG3We5043UTpmhxgqSMDTCyTtQTFRYEOoyF1dskaDvdyQPt2r14NaI7aAbbZL
clCoNoZkymjJOmwIDlBKBy+lE681Z0C2KWyw6Bo25Glz1sMnc2Vm7T1kHenu0mqbhv6K+wXJ
cbI=
/


--
-- REP_FUN_POL_LOAN_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_pol_loan_type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
170 11b
5BviBhZe/u2R3uzwnXlLjBft7yEwgwHI7cusZy9GO0IYYmtsLWZvwS3n+i2ASmpPJws3lPvg
oKXNRDVTfcOcWJa3kAzF8d/rNv5FwQUDQ7z2UyniYiSHEM0sk941fpmnf3R7nu9eOBWmdIOX
UOCpFu2U6HZxEKgkaDn3xMaEYBl9ZGTQ8sMWYldsiJOySM2eSWDBaREqB5zhsYqJUTW40Zo3
2hSjWnoMVtQ6HOQnfcrK1y1LrLZMzHSfS/k15Ynsq/eL/Ckgz/6lOP4EIBmpw5Py
/


--
-- REP_FUN_REBATE_CAL_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_rebate_cal_tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19a 11b
EH6GTTlTZGMhztaHRV6+ecIb0EQwgwFpLcusfI71i9UZ59X0tlIWQ6gUpfLyNcQfIVeIhOf5
ncqe8iAn4r/+wB/qFC7l55JhhgVOrxAS3kCnZNeQB/87kwsWdMKOiBOsATbvJ2sBZqC7N2Be
3qPnL2MDDWnLnc7yTKq7RNzjxolu9A8PIIl1ayFw6WORjrRJKwvYXPkgurXcvSc2CrP7iuyv
BhUD2+DshTdi1HrhCXa971crlOlwYJdvCY0Bx2YlSSOH/w0KXwpZUVWZazSRmw==
/


--
-- REP_FUN_SER_LAPS_INSTANT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_fun_ser_laps_instant wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
176 124
uHQMfzmCoDfSUMK5uqRoc9d7bl0wgwHINZmsZy8C2vjVi02xDl71tDx/AjIrPA1FshyerC/M
+LU73kV32nRqE9DGRxSUoRPerLk8m3M9uKoezpPEACTsP00TqHrHYGOUkZPUj/VvYOgVfu98
EdWEbftRdCt1wKWBAhXN0YNbgHoBjl/5gxDDUeber5n6hSelC+pXf3tbXInYRtWCLUqWPqs2
IDodzsSKH9Nk020IvfvklwEvyItUVK/04hY5HtiqyMVj6KIarSMjrn27udwsxhN43K667w==
/


--
-- REP_F_ACC_COA_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_acc_coa_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
150 11b
Yo1dktKESLLjmA3SoIb3NxrEn2owgy7ImMsVfHTpWE6Uh8iDAjcq4Ocm+MgJsPLr4bdcXEsI
L7UkUOMv/Poi/nthXssaEAu9GbEfmjDsF0FPtiS5yPBxiGO+eFlvYEP1O2giH6aPUChK07bl
KCGSJkzAY4EJLWEnH+48D3uJBuNchK+Q8WwjIU0AohdGprJC+Koq7iUxnyqPxq4qe0Y9l1tU
D8rWKHKrmLjiWgA2kb5ph1LeW8VRjx+osjarXzozXqiV/FvCoEzR6S94LA3IzGQ=
/


--
-- REP_F_AGENT_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_agent_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
160 117
jYBthjqX3jfeFEY73qw6hPlDQtAwg3lpAJkVfI71/2QwbXAfW7EGL+ux31C8iXXDkKyEMsLj
zrUtqC0+fWJCcbm5EImnRvcYjyp6VddMu2rOn4YL69qHqIhJmX2+byqxmHQhqwreG6ksk3c1
OwVpedbQowfDO9djam5zlfvVoXTKNF7uUts5AjcBOVplnuBPFhNpJz3o4vQkPU3zi+7+yN/6
F5RBRJ8/zV26zr1avqz9ufIBJqaCzCTmwi6GHffgSFf//riT/+Ry/B3Klmlz
/


--
-- REP_F_BANK  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_bank wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
196 12c
VZSe8xxuAG/n+wpZyJFZzb7KrkQwg3lpACisfC8yi+po4OFt1tVSFkPFolPxg1FZ8BtFdQSG
tSxWD2JgmvVCLL++SXRSTPKs/s0BuzMjQiIGPMlfy6fB3Vcsi9ei2DKxcOGeDcw2Yl40cCeZ
igQuiOU41L+n/KgFmd7SH4i5DBhAfeCKUtuevkA6Z6GjrJ0ffub6gw+y0iZnAnyqoB21TEta
jYys2BNMJpylRy0p+L2LlYfh8d8X7JOoskMOpIH2FF5chmAUxCNWljMoFOIoSVMJ/dU5ZUwQ
pp94o+g=
/


--
-- REP_F_BRANCH  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_branch wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18c 130
37ULy8+M2z4PSSG2ByC3u4Z2QXkwg3lp7cusZ3Sfiz5Fdd0Gj/J2SoxJFFDvQ2dY0Sch3NSl
+dZbB6yz3C6dT2FPJ1rscbbSsbDtMceqI3G5OPa2YWVEqGMeNvp+gss86Ap84WDrfDXVVMms
xMr8cMNpvbuSKwmtxVvKy/krrPhurMxFEQflLWfe3QXBkSFZmMkY4EzR3//dqIRgpZ2KcJIn
QCqwhcj1QfOqpnry2EDDyfwV96mgLgLzKylACXxI0gwa6BY07/EDM/cC6yn3DK/wTMiNXOs9
CPxE/TxUuA==
/


--
-- REP_F_CLAIM_CAUSE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_CLAIM_CAUSE wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
173 107
MWLGj7o19UB9W7SvEzP0OWBEx/kwgwFpmMsVfHSRueowfnhGtMU5hnshCfwOIfthWYrjtSxa
3j0hj/rQmOuQXC+bg540T2RNZoh3hBR077HEIWIQGsug3bKkgX3Lslczr73Y/d0t8utAqGoj
2ND46Dv/z7PxZ6a++DyFQPqENT0GzdBxGxYXB4hBVYse7RfGaVQkNVhjTLPkyrzcOoKqjO/K
3599f8X9Gh1PK7VnvdRHGFZt0uRBRXTIP3z7nyy5xZPz
/


--
-- REP_F_CLAIM_DETL  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_claim_detl wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b8 134
sUoV2OPJdyzvsUMUWKWhTUjj4VkwgwFpLZ4VfI71ueo0LURbUrjzB3W8J8oQ9yHMxMqjNWkv
CLV/3jsuHi7uucDQmBXTeObzNPywmEVOc/USUwxzvLASxgEpVwOUe0HWyrSC18RZcrBQJ62r
iBTQWtdnjC1FSalcodI38uOzviWVVrob9mjn8uGanavDFvf94142iETWjxmHEVzfydFYfaM2
6iCtfszv2wArjIdfwON4VLJJk/nCpYVSHytZcHSqAqmJ2Vg44mk8gKuuc/368jEbZhCMBaTr
NemdzFBJLPDK9sE=
/


--
-- REP_F_DESIG  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Desig wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
190 128
YexdKXWXVzYlbMrsPYLU+3LcvdYwgwHIJCisfC+VkPg+SH83la+NV4kzqRu4bIA1WHvzhsnS
+EmbgE2veEwPD6rXmNhsQ19sMLKuT0IANCz+TU6r/bcSYzjDrz3AIju5s4Eq1N19oxt9FArm
m4iR7zycw69kM+flyaJmCUey9D7T6JOyp012fiGE/+YOB3DUYZ7kjw+ZkUY7xkTmJi/C2Peo
zZ2+FcquAZKRbY8uOABiWt2Hhig2ke2n3JJHYRqv8DyqyIPCceNaI4inPelraW7jKZul+y1B
h/0=
/


--
-- REP_F_DIAG_TEST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_diag_test wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
178 113
Ukv6j0p0DeGWUGwIcNMtNf7MGz4wgwHIfyisfC8CkDqUeBXJWW7jhGJbIa8KPkRV0RtRUoKX
tdDpiQkQXk65HtlV2f3xK96sgL/BmU8gsNX+VQPQuv+JFrTgeZPJj3ee7ww4K70EoPBr+qbM
gMdun3yxH22x2RTwYVQWGDmanRnlLebeqOPMkSpGs/mESNJndz+KFwfTsua4rzkVtyX01Izb
c2nmNp3ArTYarbYruOL9l917Hiwa6OXUohqu0rQJduK7qwSplZm7kaMA
/


--
-- REP_F_DISTRICT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_district wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
189 124
QwSgV2yiBhDGzdIxmTsFWT8MhK4wgzLIJCisfC+VkPg+SH83la+NV3fAWrZT8cAO3KTkt0uI
XfiA8kv7ttoN/pj+h7vCQI72hFAkh7kpuVUSfZgFpvemqTxjRckKlNqNSrtop2vCug5iD9WO
LZxUXdTToCXlcYPtyIHQ842q8E1uX9NS27cbZJmcCHdUDuBU9XKmZ7YTMmBnWCpDxbkM/62j
RkPPB4E09LvbbRWXu4A2lPuInPKn0YKyY4KP80ZpDugWG3NdNYyx4Hiz/LBSZs9qix1QuDgJ
/


--
-- REP_F_DIVDEPT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Divdept wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
187 11b
dIq0kFFFVJ4+GlPGFBPAEbxZWuYwg3nIJCisfC+VkPg+SH83la+NV3czyBu4bGPpkEWFj2Bf
CE66Z3mMvCa+/pKYJGPvOI0bU7KMlu00ItFqMHIjllyWLQ2HWuflWU7iflEDYcFvx3wRkKh9
vvOUeLqPpG21JjfDtWd3Rw6szQgO4y4tzuw9OPAV5hXDkSoaTOBTIUWh+KLBVGs1Wt8FNUUR
CKEGoUYJV5nWIEQ5+96WvkO8d0oUtGmSvfEKHkTj0maWv5clJk6sLjP8vddthxo=
/


--
-- REP_F_DIVISION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Division wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
195 11b
p6v5MKmby2YASko2TLo7177SyFcwg3nI7csVfHRGWE6Oh8iXFd2jf0bba/ejsPK34V4bQNGp
ZwY6KSgntq8up7vkrUqbFG7fNnIe703KmL/+/LnE2LIJxEUpkMoU0sV+KsRh98SfnKt4cLNC
DFDA1Z5Iv939b6hNrFS1k8Pw2G6kpU30sq9jqz1w9BU1Xz1ddBQTp1PC6PKfYjwmZ20vT1MH
XV3P/waTcM3xKePmZxtauTBp1Lc2scQ/1l3ZwGZmELPrBwH663it/eQ9W21/Cyo=
/


--
-- REP_F_DOCUMENT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Document wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
173 11f
QrgTFM3/hgQi5QGgborr9NolG0kwgwHImMsVfHTpWE6Uh8iDAjcq4Of0hNUq3I0beuh0Te8o
qM6qgyVbUNpssbGAYTLKKccMpU27zIAy2p3RgYFYiozCZaImDszcXP4qWj89+AyqxX9EByJX
rO24ZbZIslHgENWIzjxuNegLuGGVTNzYsi5k3JRvFgB0U240AvcilaADiwckjcuIe0Y4jbJf
9gg+1oD0ARIdObUng72FYGw044M5CY/99hwaaY5uMiIJKLVuG4hb3K329m14v8lUYA==
/


--
-- REP_F_EMPLOYEE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_employee wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
195 138
YWnnSt1s4H8vDvXj2yktxz8DIqAwg41pACisfC8yuWRTLnEu9chXd8DPFMAqYw7cxOO3GH97
zrtidWbU+tzX+JcSH5wafui9SIGN0HFPZLCLk7E1laFvLRgO8WBjJVlJcFCnQCOmkajF1M9q
iWqlQjV8Ty7mLRUU77Pz1iA39sNvGUhg8srvCq/B9CJW33sHd11iLTwS2ygNLrNwH+7lFdPP
Q0ucj9zu6ExJQHNu0KkhgCXySjKh81Rb9LvzPzHgvQsnuS940Nk4dvkb3hfflSzzUPrIcbP+
oR1k9cEn7rOZjpNw9Q==
/


--
-- REP_F_EMPLOYMENT_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Employment_Tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b7 130
1L4ONcecs8jsxQDQz2hLQ9u9UdMwgwLIACisfC9AkPjVSH+vla+NV3fA573t8SMOWXi+OjVf
bbWHxczMWYp3mHoQGR5jlIj/pK8BmvLFMH4owQVSqkWexMxiEQzuCVnhWMRrxXEL91RTPlIi
2B0hslWIMF2XtneDE1n4RH3w5UO3bJlyTg9ZM6hKPZ6xrSbGCq8y1kSrQMxn3IpwdtiH+ia/
M+rkE7TJffO8nb0MBH4bP+5TglRAAbxE7dapbhTsDRriUTZT9hB8Z1zM0mYa/7QgfKsoJG1c
phu/bSPHxg==
/


--
-- REP_F_EMPLOYMENT_TP_SH  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Employment_Tp_sh(v_emp_tp_cd HRM_EMPLOYMENT_TYPE.EMPLOYMENT_TP_CD%TYPE) RETURN VARCHAR2 AS
v_employment_tp_nm         HRM_EMPLOYMENT_TYPE.SHORT_NM%TYPE;
BEGIN
     BEGIN
     SELECT SHORT_NM INTO v_employment_tp_nm
         FROM HRM_EMPLOYMENT_TYPE
         WHERE employment_tp_cd = v_emp_tp_cd;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
             NULL;
    END;
RETURN(v_employment_tp_nm);
END;
/


--
-- REP_F_EMP_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_emp_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
162 134
St3VifB59mUuJtSjuFZSqCHlDXwwg1xpf0jhfy8aM9VhaqcWymJRuIoA//Eg8F+7qScCqfXM
aYm1mf1dhgYnKoJBMTHoSbdxys7tVTptIJq/vHFD3boXMVQE9SE7SiyeZugiJeepGW03LQWU
PdJcN3FiPaPPBjz3MNO3UtAcLuGrNFk3bXFvSRc94NwkcHKqwb7hgD5n1y8LZ7aEW3mKnu5q
vQgupKNf517ZcYSvyUYnZDSTc9aA1pjA+39595DnFks9oce2I8LIZdKuHXcStWXmwvYIRcjY
/cFf4XIc2tHD2w==
/


--
-- REP_F_EMP_CD_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_emp_cd_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
15f 134
AobvAR1LRWGxav7jyJdWnvFTW/0wg1zIJCgVyi+VkDqOxDHL0RtFBFtG9gwJy9ag/PXWqt/w
UrkHHyErkawSnRK/0OXvlF/vMIccz0PZza+wgpog6XINs9gh0iUKYJJCvRyEwd5WqWj0QbNI
75WRqCQP6FTRl420cHlaNAKKRWpvXKmPV2vpZWVFdkA+R3B7dCkup/cnfI52kYzbV7Cb/+aG
eSWjv6Lkofg5AOb89DVwsppnCvOv1hV5npabPQss+608ZVricYCr5lZzf3cNzcZbPqs/IuiF
319rt2VC+0vBXFE=
/


--
-- REP_F_EMP_ID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_emp_id wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
13f 117
RkNQigj93ws/yBNWoQtKiw828DMwg1xpACisfC8yuWRT898ybMtjAA6hvvEJabC629uvRs61
W5meBmLtaPiFEmJ7Ca9XrLF8m5AHwYXQuiXH3iHVsnc9rZKOekD/ttIlCvKS74Ur40EtSLQR
tP8VWsv4Ibatp0DbdH48b2Llpg8Na49wCNMKzO5Mso1kSd1F1QYoe+p9UqfGibisbHlhCaVR
S1gn9HlhTe/KxqM5+gIeWoTjsCTcfn7NJyGdWrM6Tvv68YKfE/+YeJXWofg=
/


--
-- REP_F_EMP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_emp_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
14b 11b
A5MXjIiJhP2eUu5gOxDC0hTCjZMwg1zImMvWfHTp2sHVNMOsY4Tqd6iyi6hsy569YrdJRcxr
+bVpHAZDPkW8Irzcb1o6JdPkRTckaIEdqvhN7jRZk2NQWrCeKbl/V9Kvsxup2OlqEcUbHcbF
bliRebrbBSUXGuT8BZ62CNs0FH/9KHKrKsUomP3ym28rvLSPWAOLoDgg7Z71V+/UfaWpgUaR
A4+6OCpVxUpCxq3hwm7ylq0DNwmljPWbaVAj7srw3UPVUSqHbuOhvOT7R79p2g==
/


--
-- REP_F_EMP_OFFICE_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_emp_office_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
164 12c
ufk5I8JOI9Da+LPTGxvbyn9SutQwg0zIfyisfC8CkPjVSH+vla+NV3fAjRu4bGMOWXjKFMtg
hrUsVk3j9Se5EP65GSkYiXinjzEAU8G5M48Smg8FSgUMw06zFNjTTWNeJvWYslfSjYwmpsKO
KguHSz2DFnaPOgxM+cxhtkszLjctV4+zyAQmMcTbdI0HTxOoIDh/5ln5gzHPdtPSR9/jJCmJ
UYQEkubntGp4WXqoMCtUdO6Vz0NQgGentils9rrM4SKJ+QQOxdkZYFqvCBCNES2LG2/WRSP7
gLvqAA==
/


--
-- REP_F_EMP_TP_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_EMP_TP_NM wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
174 113
32UWEbbnPuhslN9kmP81FDCmomAwg3lpLcvWyi/NR+poJaKcy0wuWxiAKvfWjzge23ftKbUo
XPQYoZMwxhL+GVJ7yAY808+aT03vqx8x6WWVS+BchIYu5WAHnJRZ20K8DKWFr7Z0JQpgktWF
h3SYttjBnZlYlWPTv8+gFG8BORKKaX+RwBH0YpH74AxQGeyER9wA/dLnMYq41optPejbnOZ4
IJG7Ls02kQtik2B5HT3d6+s1hGse8SglkXVhCZHWp411WOsoCzaHqA==
/


--
-- REP_F_INSTANT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Instant wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
196 11f
voHTPkQAYZXXBVVgcBdhORPPgqQwgzLImMsVfHTpWE6Uh8iDAjcN4OcmDO9s3I1FeujjNw3m
ULUfEKbwTVO3QxIy5BarCdikr4afKOlQzQOYYUzAdOwnp9s1Q1AMiP2J94M/khMxD05jFY56
wIa9SiUKCZJihaNHjsIvHiRKiuPZ2xwo7NsvQQrMKqvDdPOTttrjF9fuFdqYbt86sNMA5vXB
ywYDA5ZEcp4K7qHhPz2C54UCccJ0AvYWW7m62coq1FmiGngjI1TTlkHJ4EvqlkEAka4=
/


--
-- REP_F_LIFE_CLASS_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_life_class_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
160 11f
rnV2XXdHmMCOa+aOSnVcLUVqt9Mwg1zILZ4VfC9AkE6OeGET4xNX29InHQhmoeVIB3dvRstR
uyjoYt8qXlO12cZzPvYJNbqsv/gGSvgXscDrmiQsSBwxAo33GQPFZ7ZxGl6N9RN2dkCD80e2
yIfkVHuvm+TIfpj/vwapgC7gdG/q0DlcpowMWdMur+bxGDFUe9oaQYAZB+Dg07g7UO4lb7Ga
hPzCE8w0PnoozZXAQ85BqVYfZVrReS5ERleSC03fyZvK6e7SqJOjeJ+UhMKS4cffXPg=
/


--
-- REP_F_OFFICE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Office wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c2 134
h4st0fw/bGkOeykYRqc/XtK8JHowg43ImMsVfHTpWE6Uh2nZFd1alS8JB2BRy/JeHF45EWxv
GC/kJBBn/Xf0WfQQu1LiAdwVxS6lFrnce0ynscfzuZCnCb31ZkDbGk+xNJbczd4HgnwRx4RL
wWAUaFapF9i/CZ6aghtpg9Psyds8U8zbo2O/17htFRVnXpEqMDA8TmOzJniREXbTIeeEiZQw
r1GHB4A3mMm91gOCtsiff8RooZBedGHRcxHkoNmUNsMANStkBWzj1FZMBS4zJDYm+fbE/FDr
/2Y89Rsgw+t+0g==
/


--
-- REP_F_OFFICE_SH_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_office_sh_nm wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1c2 144
zV+q0HZh56IyvXWKoG/ClDmyrrAwg5BpAF5qfHQBM2RQFWNMBHvxHnB2vvqk9xIYXnAlUN9b
Hb3GxrXGQNsq1UHY/kFB0pESZbxSNrvBeIiRq0CchpMiQQHPAo3hqdZX9v3W4OVpPWj/gS6s
ZHPrHD17GIgQcjZb1+g8NMxF+A19J8aHTXMeSw4kOWNFakyEzE8i7jIw0NRqZpDMqUA02V+2
SDENMV9Eqk3389GhYULiZeWls48ih+Zjy+HACd5klUVB5VilN1qGm37EuhYRkjbaEPCwUUcQ
cREGuSw5WjiYisIKbc9M5YWHEB1LOUjD
/


--
-- REP_F_OFF_CATG_NM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_OFF_CATG_NM wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
193 113
idjPA0CuM2n9tmbbOjAfIaB4frIwg3nIJLYVynSVkDqOkzT2H1uxQR0lUDPiNtBA5ba3mMH+
LIosYriSG4US5OZRAD65Vq8eCHR7VDvW8Wg2ZZUEIOVAoTuCuinIMBK8D0s2B4qkrxaQJ2Pa
rHbbdeHuCrV2ZZmw0xd+e9PHfEFvsrSM4Fr3pC0C2Axf9hcuPNWjsW+k5nsZvcJSCmJteAKc
QoQIMuaoyv0n+mURHiY5QfIkNZsQneH3Il0y6ukzTsLTA50SHdu74LY=
/


--
-- REP_F_PARTY  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_PARTY wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
147 103
KOf0QMbfDfNDKej/PVB7teD5aMwwgwFpf8sVfHSR/9U0yq8V3at/Rttr9wmw8pDmsFmK47Uo
aVEhykjCcr+wt3lm19EvervQfk4OZnLgeI2o9h1KZ/i8igeXSEIcuJZmwBg2txhFXgjnSI49
oXNP8JLQLp5S1G3v+5lg0k2IK7fvy1DmGBE38O7Vwgixy+8Vo/42O5h+5YP1skh4NN52px8h
MvRsDsjw4I15WpGpmnfQQPH+CcqIvkL7t4bMkQ==
/


--
-- REP_F_PARTY_NAME  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Party_Name wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
178 140
s60JiAa0jCZTTRqcALeORGC5RpQwg0zIAG1qfHRAIDNkUAkR7n1QCOY5D9igQKLfYSWY3FGE
xuY+TJK79lK9oSAvrME9sQqfDkAQylMPSCXyeposrmtOgeA8gPTfCKE0Ha64oCattKD4VjC1
St8bqCjeOY8DWEX6M1QYA6L0dcDKBXkXAZWw44061O1JHXxDX6TfdP8XM0MiMP2V+6dqDK2g
PtK1pxb5rXDmdXF3A6iUYq1pSYFPa55n3r3keXz8rtTzNo7bk2ElQGshUjXFYtDO5TdA4gqJ
777xxpzYnFwT8nhN+Qjh8UMLmg==
/


--
-- REP_F_PARTY_NAME_PN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_party_name_pn wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a3 154
QuZ1a6nq1WCPQEs4EFtaRAM4K4wwg0xpAK5qfC8BM2SlrHfRWnzTMlODnDzxx2H/3A7rJoQx
o+mUmbUcmEYv/JXBEiy8EnmuG5hnkiOrQ4TUhoFODNHGTqHUbYc+O4HK94R0vTRpFiCAI6bf
Eo8fDeI21GhOUSklFB3/W6h9pejy02xmsGePT/lLxs/jtE1iuXZcVXGJt1CM+mN1fVV3ZJ+t
aBBlC2IH4nFwX6mkqXSejDV43TwLkmPtzfcecNlD37/Z4ZOQ5LIwSOUvmrLUq5zsLlpeL5mI
GrIAMb2FRHVbkk+VHmBeu3PQLDFgYmVxYlgeYFzk7v2NYBft
/


--
-- REP_F_PAY_TYPE  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Pay_Type wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
199 11f
M5nBX7HXW8ntTqqEdiyb3tg3mqQwgzLIJCisfC+VkPg+SH83la+NV3fA573t8cAOWfAd2lKG
BQw3RmYIYnm57eS5rjzIBhUvz5KvAeIj0ErGa9Cj6vr/UuprXj5ZCWMzbPDbxzrTzhe11HD3
/QxQ8grA3mTK9vNwWoRNtXolgpbzv8+OFM8w+NflLaKVL1GZ4B2YSLp6A2AskmIzgoBtL+Ij
1lX8+m5qnBWXT6HdZBvh+4ic8qfRgrJj3V4pBBroVuqrO7RDcLNIilfzGSQQ+1P4F4c=
/


--
-- REP_F_PRODUCT_CD  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_product_cd wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
168 11b
3C6zl6HS5cy3jzDnAoidUsUERekwg1zIACisfC9AkPjVSH83la8NUk3NqC6P8vJtezKmTGyi
tZ3K+/wunBJPErvvThSQ3zZqjChyUChkueu8hAVsLk3YzIc5Jme2IRWXcbQLnm+QxDb2RKLX
b7RExajLLoFmpN+Ru7mUwJ/UbRszhlGg1OFj1oVpt4Iv0HAKqskuiCgxifZKb+qcCOO220kI
jdsT2yeS+20fLAW9hTZsbudYCBrd8GMkQM/MRyJaGAM6f6E0EZeIE6BVHxcvk3Y=
/


--
-- REP_F_QUESTIONS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_questions wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
16e 124
C581EDu4s2Z2mabcYy47+IjH8cIwg3lpxMsVfC8BM+porKJvOTzjr7ScL/P/j+ZYejfb5sG1
LahSrEZbHtKDjRX3S41mUyzi+X0gZGqGQkVuLHzgpksI9gfUmYj8GBXqZhBriLCVU6gHn53m
p+nWYB4hr0D2f8EjFVMplVCbqqyi7yKIrRM4k8ygGmZ61iqemaEF3VIUCkWlNh+jYqr4oHef
SqtrVd6DzZyARLk24gZ/VAm2yJvxurmZQ1rfRrKi/Dld/JIesMjrmBUW8KdDVvHWeDR4kzw=
/


--
-- REP_F_QUES_TP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_ques_tp wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17d 11f
41tZdzEl8myKoN2UTlYwSKufPiowgzLImNOsfC/pO06UBVcd8AJiC/Nqm3U3skA2DfICKrz5
mqKoZzgYWcIXu1WAyVp9CdN6kq8ZinNVJM32qeP7ZxeuOboK/dUJ/mL6TK0ljlXX9QpkssK0
bY4njOd74qKvPUEIn3npgSwf5Z3Rvdrgh/EfAgfaYisWIUf6C2jEY0OXJMhZ+iOTJ+HB4ZQV
4GFqJ3fbwe7pcIYfaqxAqRouvovft0Al8xFb5unKXlwkAK1PlSJRAQdSFXqaz6aQiA+c
/


--
-- REP_F_SALUTATION  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_F_Salutation wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1b0 11f
X0mJ4+ZlHUSY1K97un2AeEZ4FP8wgzLIJJkVfC+VkPg+SPODla8NV9vS4JkpYxr0quhQrzUv
lCaaD/2V3/OajhkSOqS/FdN4jWZTLCDcU2HaJJLiJEyWKTwNWaNqQHcI4YfFMgB/HzUieAc5
glAR2Bu0ZdcM6JzdgxSmzLJec0kJzfRCwtQu6fppHA+HYvJdOeYw6WA1IVLkZqDljFgLU9XM
70YMZMp7hPnNhkELttMbFOEJ4nBArWtWlHA0AWNHqh4ZNZJLmh9ZjKTCeoirA0kprfZN
/


--
-- REP_F_SUPPILER  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_suppiler wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
1a5 144
en4FHULtDL9ftO4p1lc5jmbu2vYwg41pmEhqfHRHimSPbxeyyMsqZRZlVedLFtanbkhx7Kb7
rNSFhrXV+0r8SkOipbmF2t83oHhKj592QxT+wVdBlsb9idbSax6j1lboOZ6fBzTFpqmzWxsE
jh7tBjJrkiGkNnlJkV7aqGm8eStcLWoohPTxE1QAYU0AXbaRSabdyL9CTEHfilYWO+mYYZRt
Dcwxj231tO/vR3kg7q5fxX8IXgucZh+T6WfcJ0ONIdFpAPsi4Tr5IN3+YlYpkqmLkuT5oytO
YtHyU7XEdj57E+1hz/eG/tNhzvvChcnd
/


--
-- REP_F_THANA  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_f_thana wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
166 124
SV8jUGhQawS/1H1s5dSS7PcyMaQwg3nIfyisfC8CkPjVSH9n4HZx9IRiB8hQ1T5EMicEIdwn
dLUkYeGNr9y/ZJoeHkwZ8XxjZjAPDzPJBxK1fajJplCTXrgGK5HiPqB2Bc1W4tdjYKcwCYze
KjXGDRZTGX8ZVnMUtc6hP3M+2o8tFNAHFZA51Y45TQrKQTqyotJG2CySFlh8qfFfozZEALHy
+WUXOsMOYOdezR/v6EGvA92DltZEQWeIwScblT2O5qmD5avwXRxUSGbkFgH5SIH7j6RcmA==
/


--
-- REP_INS_POLICY_NO_TO_PGID  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_ins_policy_no_to_pgid wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
19b 134
nynIbN2gK1WR+4y0dQoWlqnwquEwgxBpmMsVfC8LuepoVGAEBGd0bBovPnFRFEN/VabnXOag
4W/5QaJiPuc3sLcQnwbZmZHcFkYeLeibwIxFe5z4W0zFRerDT5cdGr2m2KHVPrRKaTUdN6UC
Msm0ZYJqGix6QJgVcIDJYS6j463k3faIJa9NJKFmyc+ofLSGjzi+XUc1hQzKP9kmM/CFQ2A7
NHCht9/y1RP6nGGTwGr7RcDr0OK3S8bEXx64Gni2rMAZJ7qXcsxzulJ6RFYafsBSuf2fB/L9
T2SkiRm23m+TRg==
/


--
-- REP_ITAX_REB_PAID_PREM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_itax_reb_paid_prem wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
38d 1f2
EavYTeyWipUvphqxa8LOSs9cMMQwg5BeACAVfC/Nbg9S/TUBptRmOca8qWNdfq2f4bfpXDlA
8ucyfXJkLhWAo57THGbZu1WYZJxo88QJ83ZhEp34g8/4ajNVu3iYKJ0kfiSoLqZnEu3I4Uik
oVVjyUCWWFg5+Vr4lyOvVhnugFNDZvQFXRy/BJl/EZCoyurJEdOTlcSD9hsCF2PAkbURoMNa
SYbzWdCr0P8FdtQDXcBlcVoYN5RvhQtAIWhMvT49RBq+IWuTeUvk6s8hHBVkd2TqnuFOdrIY
F4bVXcVfuHlBlHxatEsGP1d6q4fERBNuxBdcqq1JFHjlNtS+weUWz02MogO53cmIYPMzR8w8
fQICdHnWWrgzd+1lBL1TBMW+P+JWA+KsrXQb1hy4oDM0TjCib2CtsjGS4zZJ3TG/3mSQ7lav
lICkqk8aYpBnMVBnRO4MTKdeVr5R46ioYzXNYwHVIHz2lIyqyZYkf/BhbA==
/


--
-- REP_ITAX_REF_NO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_itax_ref_no wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
35d 1f2
Hs9FdgOBCxXnMql8nQi3KObhFXIwg40JLq5qfHRDbg/umfwbqCHNUycHITKTDjLy7EpSGBt9
FBqvUATTB3MwJUjNo82Ej4T9lT9y/05twNNgxawyCN6a304smNFvMwtEADmmJlzMFESj8xW+
dcBiG3EoTHMuJ2Puggp/whpFAcV4mB1Doansr6qsgdkj8Buxw7al2DQTg3QsxxR472wXF9YZ
uHx9ahGK3VKKuzdA/VnIRwKAkDae8MuT3/nafN3aoWw0rVOFfGA4Z0T+uRf0SbSFZvpNuYbs
wxpc4TjdzcucPfSwvSfY+kfHGHw5ZBuly6zHngViqKcoMEKkGQ2MLXHnxIdi2FsFeQWrIgVq
0CGk8LrbGeotVoffaa+YEscfGWLuR1lCdG2B/KSHncEMZKjUiBhoyoUUr2lFb80rsMlkXR5T
LYOkClM26GNDk+/9N2XcNHRonMv1gEhIBaY+0ijoijIn+CLV6+qd1SXthw==
/


--
-- REP_LAST_DUE_DT  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_last_due_dt (V_COMM_DT    DATE,
                                            V_TERM       VARCHAR2,
                                            V_MOD        VARCHAR2)
   RETURN DATE
IS
   V_LAST_PREMIUM_DUE   DATE;
BEGIN
   IF V_MOD <> '05'
   THEN
      SELECT   ADD_MONTHS (V_COMM_DT, (V_TERM * 12) - 12 / YRLY_NO_INST)
        INTO   V_LAST_PREMIUM_DUE
        FROM   INS_PAY_MODE
       WHERE   PAY_MODE_CD = V_MOD;
   ELSE
      V_LAST_PREMIUM_DUE := V_COMM_DT;
   END IF;

   RETURN (V_LAST_PREMIUM_DUE);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN NULL;
END;
/


--
-- REP_SCHEDULE_HELP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_schedule_help wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
471 291
RP4OWzNkUEAspMFQzWIWw3TEMkEwg/DDLiAFfHRVMZ2snGZ/7Mv/n7rI4fSisRWOzFCABW71
tOHSUIQtOMTkzqGnYtrXQPAHVFFavP4WxTvqR70JpYbSbz8/Eq0QtYEjnpawsXhUK6YO1t/b
AMc3Un3NUhdUxIJPKzq05/gqpZCEWiTWt5VDHVjvdKfT5XuQiPUZTQka099CWHinWZI22UVQ
a3f6kCiMk4mFcU9I7fXVS2UW5Q5U9n2m5jEOoZ6fWVzIEvRrt3tT7W7mT3sh54LMBQzw2pVr
UJr/oHRshbghSyTJnhPFbeA4/wDVxQX9hK65TVK34CyEPHxSltepQ0Xe7EXOnX41Qj4HIWCH
vudMWTpqIrmcT/Z1ukcnkokn0CjmY5Tewx9fZXmhGltcYns8TIEkWGlK4jaL5BHOVnEnKQE6
/eni8PVC9P0iUZC99HpbxG1E6P3FpBjyGR2qR4AT84ejbtMLgQrO+aePHDzXjr+9/sst2HLB
RN0GzzmAqExywN8eCkTBvwdqkPRhTcaFqsjtBvi/Xc5wWexAezu1jH5uk7On6HSYJ0YE/RkL
XxO6VP69Pnuy5koX8Vb5OMPUF/1gfs/JTessgI2aieEYeSpz1pCBv4XZC3Zr3yw/HYmksrI=
/


--
-- REP_SUPP_BEN_SN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_supp_ben_sn wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
17b 11b
06BH7XX1nhp8HLIISciC+8eInEwwgwFp2cusfC/SR+qK80j8jTAWAdUuuAySaSATdbhsoga1
2QxnkF4DgpBViJRaI3nnQTLZVQp5Osx4aCoIjUxNxf/IVItQhsXYVkYAG3CzWwzZpkZtYDLU
4nBF3W8szM+0Sd6J7pNeIUexsecHbPIo2Zf6Wrd4Sw2HJBb2ORli6idjc/KanqDnBTZJzvKJ
0aM0DNhAnmbO6bvmZ0DH7kTVthZbmtD5AsfvjpfAZWDseFlZNLKz/nxQmHjoaLr8
/


--
-- EL_MTR  (Synonym) 
--
CREATE PUBLIC SYNONYM EL_MTR FOR INS.EL_MTR;


--
-- FINDCOURSE  (Synonym) 
--
CREATE PUBLIC SYNONYM FINDCOURSE FOR INS.FINDCOURSE;


--
-- FUN_ACTIVITY_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_ACTIVITY_NM FOR INS.FUN_ACTIVITY_NM;


--
-- FUN_AGE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_AGE FOR INS.FUN_AGE;


--
-- FUN_AGENT_OFFICE_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_AGENT_OFFICE_CD FOR INS.FUN_AGENT_OFFICE_CD;


--
-- FUN_AGE_PROOF_DOC_ADMITTED  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_AGE_PROOF_DOC_ADMITTED FOR INS.FUN_AGE_PROOF_DOC_ADMITTED;


--
-- FUN_ASGN_COMM_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_ASGN_COMM_DATE FOR INS.FUN_ASGN_COMM_DATE;


--
-- FUN_BALSHEET_HEAD_BAL  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_BALSHEET_HEAD_BAL FOR INS.FUN_BALSHEET_HEAD_BAL;


--
-- FUN_BALSHEET_HEAD_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_BALSHEET_HEAD_NM FOR INS.FUN_BALSHEET_HEAD_NM;


--
-- FUN_BILL_FROM_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_BILL_FROM_DATE FOR INS.FUN_BILL_FROM_DATE;


--
-- FUN_BILL_TO_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_BILL_TO_DATE FOR INS.FUN_BILL_TO_DATE;


--
-- FUN_BUILD_PK  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_BUILD_PK FOR INS.FUN_BUILD_PK;


--
-- FUN_CAL_LATE_FEE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CAL_LATE_FEE FOR INS.FUN_CAL_LATE_FEE;


--
-- FUN_CAL_LATE_FEE_FOR_ALTER  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CAL_LATE_FEE_FOR_ALTER FOR INS.FUN_CAL_LATE_FEE_FOR_ALTER;


--
-- FUN_CAL_LATE_FEE_FP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CAL_LATE_FEE_FP FOR INS.FUN_CAL_LATE_FEE_FP;


--
-- FUN_CHECK_ANF_LOAN  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CHECK_ANF_LOAN FOR INS.FUN_CHECK_ANF_LOAN;


--
-- FUN_CHECK_ANF_LOAN1  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CHECK_ANF_LOAN1 FOR INS.FUN_CHECK_ANF_LOAN1;


--
-- FUN_CHECK_ANF_LOAN2  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CHECK_ANF_LOAN2 FOR INS.FUN_CHECK_ANF_LOAN2;


--
-- FUN_CHILD_FOUND  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CHILD_FOUND FOR INS.FUN_CHILD_FOUND;


--
-- FUN_CHK_APVL_LVL  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CHK_APVL_LVL FOR INS.FUN_CHK_APVL_LVL;


--
-- FUN_CLAIMANT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CLAIMANT_NM FOR INS.FUN_CLAIMANT_NM;


--
-- FUN_CLM_APPL_REQ  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CLM_APPL_REQ FOR INS.FUN_CLM_APPL_REQ;


--
-- FUN_CLM_QUES_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CLM_QUES_TP FOR INS.FUN_CLM_QUES_TP;


--
-- FUN_CNT_OFF_HRCY  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CNT_OFF_HRCY FOR INS.FUN_CNT_OFF_HRCY;


--
-- FUN_COLL_MEDIA_NO_VALIDATION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COLL_MEDIA_NO_VALIDATION FOR INS.FUN_COLL_MEDIA_NO_VALIDATION;


--
-- FUN_COLL_MEDIA_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COLL_MEDIA_TYPE FOR INS.FUN_COLL_MEDIA_TYPE;


--
-- FUN_COMM_BILL_PAYABLE_STAT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COMM_BILL_PAYABLE_STAT FOR INS.FUN_COMM_BILL_PAYABLE_STAT;


--
-- FUN_COMM_BILL_PAYABLE_STAT_NEW  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COMM_BILL_PAYABLE_STAT_NEW FOR INS.FUN_COMM_BILL_PAYABLE_STAT_NEW;


--
-- FUN_COMM_CAL_DASHBOARD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COMM_CAL_DASHBOARD FOR INS.FUN_COMM_CAL_DASHBOARD;


--
-- FUN_COMPOUND_INTEREST_METHOD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COMPOUND_INTEREST_METHOD FOR INS.FUN_COMPOUND_INTEREST_METHOD;


--
-- FUN_COM_COM_CALC_BASIS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COM_COM_CALC_BASIS FOR INS.FUN_COM_COM_CALC_BASIS;


--
-- FUN_COM_COM_CALC_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COM_COM_CALC_TYPE FOR INS.FUN_COM_COM_CALC_TYPE;


--
-- FUN_COM_COM_YEAR  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COM_COM_YEAR FOR INS.FUN_COM_COM_YEAR;


--
-- FUN_COM_EARN_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COM_EARN_TYPE FOR INS.FUN_COM_EARN_TYPE;


--
-- FUN_CONTROL_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CONTROL_OFFICE FOR INS.FUN_CONTROL_OFFICE;


--
-- FUN_CPF_GL_HEAD_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CPF_GL_HEAD_OPENING FOR INS.FUN_CPF_GL_HEAD_OPENING;


--
-- FUN_CPF_LEADGER_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CPF_LEADGER_OPENING FOR INS.FUN_CPF_LEADGER_OPENING;


--
-- FUN_DEFAULT_INSU_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_DEFAULT_INSU_TYPE FOR INS.FUN_DEFAULT_INSU_TYPE;


--
-- FUN_DEFFRED_PREMIUM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_DEFFRED_PREMIUM FOR INS.FUN_DEFFRED_PREMIUM;


--
-- FUN_DIVERT_GL_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_DIVERT_GL_NO FOR INS.FUN_DIVERT_GL_NO;


--
-- FUN_DROP_SUM_VALUE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_DROP_SUM_VALUE FOR INS.FUN_DROP_SUM_VALUE;


--
-- CF_USERFORMULA  (Synonym) 
--
CREATE PUBLIC SYNONYM CF_USERFORMULA FOR INS.CF_USERFORMULA;


--
-- OCCURS  (Synonym) 
--
CREATE PUBLIC SYNONYM OCCURS FOR INS.OCCURS;


--
-- F_ACC_CC_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_ACC_CC_NM FOR INS.F_ACC_CC_NM;


--
-- F_ACC_COA_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_ACC_COA_NM FOR INS.F_ACC_COA_NM;


--
-- F_ACC_COA_NM_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_ACC_COA_NM_SHNM FOR INS.F_ACC_COA_NM_SHNM;


--
-- F_AGENT_DO  (Synonym) 
--
CREATE PUBLIC SYNONYM F_AGENT_DO FOR INS.F_AGENT_DO;


--
-- F_AGENT_IDRA_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_AGENT_IDRA_CD FOR INS.F_AGENT_IDRA_CD;


--
-- F_AGENT_LICENSE_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM F_AGENT_LICENSE_NO FOR INS.F_AGENT_LICENSE_NO;


--
-- F_AGENT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_AGENT_NM FOR INS.F_AGENT_NM;


--
-- F_BANK  (Synonym) 
--
CREATE PUBLIC SYNONYM F_BANK FOR INS.F_BANK;


--
-- F_BRANCH  (Synonym) 
--
CREATE PUBLIC SYNONYM F_BRANCH FOR INS.F_BRANCH;


--
-- F_BR_BANK  (Synonym) 
--
CREATE PUBLIC SYNONYM F_BR_BANK FOR INS.F_BR_BANK;


--
-- F_BUILD_ID  (Synonym) 
--
CREATE PUBLIC SYNONYM F_BUILD_ID FOR INS.F_BUILD_ID;


--
-- F_BUILD_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_BUILD_NM FOR INS.F_BUILD_NM;


--
-- F_CLAIM_CAUSE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLAIM_CAUSE FOR INS.F_CLAIM_CAUSE;


--
-- F_CLAIM_DETL  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLAIM_DETL FOR INS.F_CLAIM_DETL;


--
-- F_CLM_CAUSE_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLM_CAUSE_NM FOR INS.F_CLM_CAUSE_NM;


--
-- F_CLM_DETL_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLM_DETL_NM FOR INS.F_CLM_DETL_NM;


--
-- F_CLM_PARTY_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLM_PARTY_NM FOR INS.F_CLM_PARTY_NM;


--
-- F_CLM_PAYMENT_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLM_PAYMENT_TP FOR INS.F_CLM_PAYMENT_TP;


--
-- F_CLM_PAY_BASIS  (Synonym) 
--
CREATE PUBLIC SYNONYM F_CLM_PAY_BASIS FOR INS.F_CLM_PAY_BASIS;


--
-- F_DEGREE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DEGREE FOR INS.F_DEGREE;


--
-- F_DEMAND_RATE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DEMAND_RATE FOR INS.F_DEMAND_RATE;


--
-- F_DESIG  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DESIG FOR INS.F_DESIG;


--
-- F_DESIG_GROUP  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DESIG_GROUP FOR INS.F_DESIG_GROUP;


--
-- F_DESIG_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DESIG_SHNM FOR INS.F_DESIG_SHNM;


--
-- F_DIAG_TEST  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DIAG_TEST FOR INS.F_DIAG_TEST;


--
-- F_DISTRICT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DISTRICT FOR INS.F_DISTRICT;


--
-- F_DIVDEPT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DIVDEPT FOR INS.F_DIVDEPT;


--
-- F_DIVISION  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DIVISION FOR INS.F_DIVISION;


--
-- F_DM_GID  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DM_GID FOR INS.F_DM_GID;


--
-- F_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_DOCUMENT FOR INS.F_DOCUMENT;


--
-- F_ELEC_LINE_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_ELEC_LINE_TP_NM FOR INS.F_ELEC_LINE_TP_NM;


--
-- F_ELEC_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_ELEC_TP_NM FOR INS.F_ELEC_TP_NM;


--
-- F_EMPLOYEE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMPLOYEE FOR INS.F_EMPLOYEE;


--
-- F_EMPLOYMENT_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMPLOYMENT_TP FOR INS.F_EMPLOYMENT_TP;


--
-- F_EMP_BLOOD_GRP  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_BLOOD_GRP FOR INS.F_EMP_BLOOD_GRP;


--
-- F_EMP_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_CD FOR INS.F_EMP_CD;


--
-- F_EMP_CD_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_CD_NM FOR INS.F_EMP_CD_NM;


--
-- F_EMP_FILE_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_FILE_NO FOR INS.F_EMP_FILE_NO;


--
-- F_EMP_GID  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_GID FOR INS.F_EMP_GID;


--
-- F_EMP_GID_TO_DESIG_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_GID_TO_DESIG_CD FOR INS.F_EMP_GID_TO_DESIG_CD;


--
-- F_EMP_ID  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_ID FOR INS.F_EMP_ID;


--
-- F_EMP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_NM FOR INS.F_EMP_NM;


--
-- F_EMP_OFFICE_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_OFFICE_CD FOR INS.F_EMP_OFFICE_CD;


--
-- F_EMP_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_TP_NM FOR INS.F_EMP_TP_NM;


--
-- F_EMP_TRAINING  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_TRAINING FOR INS.F_EMP_TRAINING;


--
-- F_EMP_TYPE_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_TYPE_CD FOR INS.F_EMP_TYPE_CD;


--
-- F_EMP_TYPE_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_TYPE_NM FOR INS.F_EMP_TYPE_NM;


--
-- F_FLOOR_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_FLOOR_NM FOR INS.F_FLOOR_NM;


--
-- F_GL_SL_TO_CODE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_GL_SL_TO_CODE FOR INS.F_GL_SL_TO_CODE;


--
-- F_GRP_POLICY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_GRP_POLICY_TYPE FOR INS.F_GRP_POLICY_TYPE;


--
-- F_INDEX  (Synonym) 
--
CREATE PUBLIC SYNONYM F_INDEX FOR INS.F_INDEX;


--
-- F_INSTANT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_INSTANT FOR INS.F_INSTANT;


--
-- F_INTCAP  (Synonym) 
--
CREATE PUBLIC SYNONYM F_INTCAP FOR INS.F_INTCAP;


--
-- F_IN_WORD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_IN_WORD FOR INS.F_IN_WORD;


--
-- F_IS_GRTDT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_IS_GRTDT FOR INS.F_IS_GRTDT;


--
-- F_JUST_GRT_EQL  (Synonym) 
--
CREATE PUBLIC SYNONYM F_JUST_GRT_EQL FOR INS.F_JUST_GRT_EQL;


--
-- F_LAST_DAY_OF_MON  (Synonym) 
--
CREATE PUBLIC SYNONYM F_LAST_DAY_OF_MON FOR INS.F_LAST_DAY_OF_MON;


--
-- F_LIFE_CLASS_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_LIFE_CLASS_CD FOR INS.F_LIFE_CLASS_CD;


--
-- F_MANAGER  (Synonym) 
--
CREATE PUBLIC SYNONYM F_MANAGER FOR INS.F_MANAGER;


--
-- F_MAX_BILL_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM F_MAX_BILL_NO FOR INS.F_MAX_BILL_NO;


--
-- F_MODULE_PATH  (Synonym) 
--
CREATE PUBLIC SYNONYM F_MODULE_PATH FOR INS.F_MODULE_PATH;


--
-- F_MUNILOC_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_MUNILOC_NM FOR INS.F_MUNILOC_NM;


--
-- F_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OFFICE FOR INS.F_OFFICE;


--
-- F_OFF_CATG_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OFF_CATG_CD FOR INS.F_OFF_CATG_CD;


--
-- F_OFF_CATG_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OFF_CATG_NM FOR INS.F_OFF_CATG_NM;


--
-- F_OFF_TYPE_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OFF_TYPE_CD FOR INS.F_OFF_TYPE_CD;


--
-- F_OUT_AS_ON_RENT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_AS_ON_RENT FOR INS.F_OUT_AS_ON_RENT;


--
-- F_OUT_FR_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_FR_DT FOR INS.F_OUT_FR_DT;


--
-- F_OUT_FR_DT_ELEC  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_FR_DT_ELEC FOR INS.F_OUT_FR_DT_ELEC;


--
-- F_OUT_FR_DT_ELEC_SHD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_FR_DT_ELEC_SHD FOR INS.F_OUT_FR_DT_ELEC_SHD;


--
-- F_OUT_FR_DT_RENT_SHD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_FR_DT_RENT_SHD FOR INS.F_OUT_FR_DT_RENT_SHD;


--
-- F_OUT_FR_DT_WATER  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_FR_DT_WATER FOR INS.F_OUT_FR_DT_WATER;


--
-- F_OUT_FR_DT_WATER_SHD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OUT_FR_DT_WATER_SHD FOR INS.F_OUT_FR_DT_WATER_SHD;


--
-- F_OVERWCAT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_OVERWCAT FOR INS.F_OVERWCAT;


--
-- F_PARTY  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PARTY FOR INS.F_PARTY;


--
-- F_PARTY_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PARTY_NAME FOR INS.F_PARTY_NAME;


--
-- F_PARTY_NAME_CONCAT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PARTY_NAME_CONCAT FOR INS.F_PARTY_NAME_CONCAT;


--
-- F_PAY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PAY_TYPE FOR INS.F_PAY_TYPE;


--
-- F_PF_GLACCOUNT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PF_GLACCOUNT FOR INS.F_PF_GLACCOUNT;


--
-- F_PREM_COLL_RECEIVE_MODE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PREM_COLL_RECEIVE_MODE FOR INS.F_PREM_COLL_RECEIVE_MODE;


--
-- F_PREV_DUE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PREV_DUE FOR INS.F_PREV_DUE;


--
-- F_PREV_O_DUE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PREV_O_DUE FOR INS.F_PREV_O_DUE;


--
-- F_PRODUCT_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PRODUCT_CD FOR INS.F_PRODUCT_CD;


--
-- F_PROJECT_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PROJECT_CD FOR INS.F_PROJECT_CD;


--
-- F_PROJECT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PROJECT_NM FOR INS.F_PROJECT_NM;


--
-- F_PROPOSAL_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PROPOSAL_NO FOR INS.F_PROPOSAL_NO;


--
-- F_PROPOSER_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM F_PROPOSER_NAME FOR INS.F_PROPOSER_NAME;


--
-- F_P_PRODUCT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_P_PRODUCT FOR INS.F_P_PRODUCT;


--
-- F_QUESTIONS  (Synonym) 
--
CREATE PUBLIC SYNONYM F_QUESTIONS FOR INS.F_QUESTIONS;


--
-- F_RETURN_GRTDT2  (Synonym) 
--
CREATE PUBLIC SYNONYM F_RETURN_GRTDT2 FOR INS.F_RETURN_GRTDT2;


--
-- F_SALUTATION  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SALUTATION FOR INS.F_SALUTATION;


--
-- F_SAL_DEDU_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SAL_DEDU_NM FOR INS.F_SAL_DEDU_NM;


--
-- F_SAL_DEDU_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SAL_DEDU_SHNM FOR INS.F_SAL_DEDU_SHNM;


--
-- F_SAL_EARN_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SAL_EARN_NM FOR INS.F_SAL_EARN_NM;


--
-- F_SAL_EARN_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SAL_EARN_SHNM FOR INS.F_SAL_EARN_SHNM;


--
-- F_SCHD_DUE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SCHD_DUE FOR INS.F_SCHD_DUE;


--
-- F_SCHD__DUE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_SCHD__DUE FOR INS.F_SCHD__DUE;


--
-- F_STIPEND_PAY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM F_STIPEND_PAY_TYPE FOR INS.F_STIPEND_PAY_TYPE;


--
-- F_THANA  (Synonym) 
--
CREATE PUBLIC SYNONYM F_THANA FOR INS.F_THANA;


--
-- F_TOT_RENT_BILL  (Synonym) 
--
CREATE PUBLIC SYNONYM F_TOT_RENT_BILL FOR INS.F_TOT_RENT_BILL;


--
-- F_UNIT  (Synonym) 
--
CREATE PUBLIC SYNONYM F_UNIT FOR INS.F_UNIT;


--
-- F_USER_INFO  (Synonym) 
--
CREATE PUBLIC SYNONYM F_USER_INFO FOR INS.F_USER_INFO;


--
-- F_VOUCH_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM F_VOUCH_NM FOR INS.F_VOUCH_NM;


--
-- GETDUEAMT  (Synonym) 
--
CREATE PUBLIC SYNONYM GETDUEAMT FOR INS.GETDUEAMT;


--
-- GET_POLICY_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM GET_POLICY_NO FOR INS.GET_POLICY_NO;


--
-- GREAT  (Synonym) 
--
CREATE PUBLIC SYNONYM GREAT FOR INS.GREAT;


--
-- IS_GREATER  (Synonym) 
--
CREATE PUBLIC SYNONYM IS_GREATER FOR INS.IS_GREATER;


--
-- REP_F_PARTY  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_PARTY FOR INS.REP_F_PARTY;


--
-- REP_F_PARTY_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_PARTY_NAME FOR INS.REP_F_PARTY_NAME;


--
-- REP_F_PARTY_NAME_PN  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_PARTY_NAME_PN FOR INS.REP_F_PARTY_NAME_PN;


--
-- REP_F_PAY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_PAY_TYPE FOR INS.REP_F_PAY_TYPE;


--
-- REP_F_PRODUCT_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_PRODUCT_CD FOR INS.REP_F_PRODUCT_CD;


--
-- REP_F_QUESTIONS  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_QUESTIONS FOR INS.REP_F_QUESTIONS;


--
-- REP_F_QUES_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_QUES_TP FOR INS.REP_F_QUES_TP;


--
-- REP_F_SALUTATION  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_SALUTATION FOR INS.REP_F_SALUTATION;


--
-- REP_F_SUPPILER  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_SUPPILER FOR INS.REP_F_SUPPILER;


--
-- REP_F_THANA  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_THANA FOR INS.REP_F_THANA;


--
-- REP_INS_POLICY_NO_TO_PGID  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_INS_POLICY_NO_TO_PGID FOR INS.REP_INS_POLICY_NO_TO_PGID;


--
-- REP_ITAX_REB_PAID_PREM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_ITAX_REB_PAID_PREM FOR INS.REP_ITAX_REB_PAID_PREM;


--
-- REP_ITAX_REF_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_ITAX_REF_NO FOR INS.REP_ITAX_REF_NO;


--
-- REP_LAST_DUE_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_LAST_DUE_DT FOR INS.REP_LAST_DUE_DT;


--
-- REP_SCHEDULE_HELP  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_SCHEDULE_HELP FOR INS.REP_SCHEDULE_HELP;


--
-- REP_SUPP_BEN_SN  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_SUPP_BEN_SN FOR INS.REP_SUPP_BEN_SN;


--
-- FUN_EL_MTR  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EL_MTR FOR INS.FUN_EL_MTR;


--
-- FUN_EMP_DEGREE_CODE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EMP_DEGREE_CODE FOR INS.FUN_EMP_DEGREE_CODE;


--
-- FUN_EMP_DEGREE_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EMP_DEGREE_NAME FOR INS.FUN_EMP_DEGREE_NAME;


--
-- FUN_EMP_EDU_QUALIFICATION_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EMP_EDU_QUALIFICATION_NAME FOR INS.FUN_EMP_EDU_QUALIFICATION_NAME;


--
-- FUN_EMP_TARGET  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EMP_TARGET FOR INS.FUN_EMP_TARGET;


--
-- FUN_EMP_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EMP_TYPE FOR INS.FUN_EMP_TYPE;


--
-- FUN_FA_EMP_TYPE_EMP_GID  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FA_EMP_TYPE_EMP_GID FOR INS.FUN_FA_EMP_TYPE_EMP_GID;


--
-- FUN_FIND_ACCOUNTS_OFF  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_ACCOUNTS_OFF FOR INS.FUN_FIND_ACCOUNTS_OFF;


--
-- FUN_FIND_COST_CENTER_OFF  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_COST_CENTER_OFF FOR INS.FUN_FIND_COST_CENTER_OFF;


--
-- FUN_FIND_COST_CENTER_OFF1  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_COST_CENTER_OFF1 FOR INS.FUN_FIND_COST_CENTER_OFF1;


--
-- FUN_FIND_HEAD_OFF  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_HEAD_OFF FOR INS.FUN_FIND_HEAD_OFF;


--
-- FUN_FIND_REGIONAL_OFF  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_REGIONAL_OFF FOR INS.FUN_FIND_REGIONAL_OFF;


--
-- FUN_FIND_SALES_OFF  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_SALES_OFF FOR INS.FUN_FIND_SALES_OFF;


--
-- FUN_FIND_SALES_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_SALES_OFFICE FOR INS.FUN_FIND_SALES_OFFICE;


--
-- FUN_FIND_SERVICE_OFF  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_SERVICE_OFF FOR INS.FUN_FIND_SERVICE_OFF;


--
-- FUN_FIND_ZONAL_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_ZONAL_OFFICE FOR INS.FUN_FIND_ZONAL_OFFICE;


--
-- FUN_FIRST_PREMIUM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIRST_PREMIUM FOR INS.FUN_FIRST_PREMIUM;


--
-- FUN_GEN_QUES_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GEN_QUES_TP FOR INS.FUN_GEN_QUES_TP;


--
-- FUN_GET_MOBILE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GET_MOBILE FOR INS.FUN_GET_MOBILE;


--
-- FUN_GET_PRVCD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GET_PRVCD FOR INS.FUN_GET_PRVCD;


--
-- FUN_GL_CPF_SUBR_HEAD_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GL_CPF_SUBR_HEAD_OPENING FOR INS.FUN_GL_CPF_SUBR_HEAD_OPENING;


--
-- FUN_GL_HEAD_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GL_HEAD_OPENING FOR INS.FUN_GL_HEAD_OPENING;


--
-- FUN_GL_SUBR_HEAD_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GL_SUBR_HEAD_OPENING FOR INS.FUN_GL_SUBR_HEAD_OPENING;


--
-- FUN_GRA_HEAD_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GRA_HEAD_OPENING FOR INS.FUN_GRA_HEAD_OPENING;


--
-- FUN_GRA_LEADGER_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_GRA_LEADGER_OPENING FOR INS.FUN_GRA_LEADGER_OPENING;


--
-- FUN_ILIFE_RECEIPT_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_ILIFE_RECEIPT_NO FOR INS.FUN_ILIFE_RECEIPT_NO;


--
-- FUN_INS_AGE_PROOF_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_AGE_PROOF_DOCUMENT FOR INS.FUN_INS_AGE_PROOF_DOCUMENT;


--
-- FUN_INS_APPARAL_STATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_APPARAL_STATE FOR INS.FUN_INS_APPARAL_STATE;


--
-- FUN_INS_CHECK_DIGIT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_CHECK_DIGIT FOR INS.FUN_INS_CHECK_DIGIT;


--
-- FUN_INS_CHECK_DIGIT_VALIDATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_CHECK_DIGIT_VALIDATE FOR INS.FUN_INS_CHECK_DIGIT_VALIDATE;


--
-- FUN_INS_COMPANY_SHORT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_COMPANY_SHORT_NM FOR INS.FUN_INS_COMPANY_SHORT_NM;


--
-- FUN_INS_DIAG_REQ  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_DIAG_REQ FOR INS.FUN_INS_DIAG_REQ;


--
-- FUN_INS_DIAG_TEST  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_DIAG_TEST FOR INS.FUN_INS_DIAG_TEST;


--
-- FUN_INS_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_DOCUMENT FOR INS.FUN_INS_DOCUMENT;


--
-- FUN_INS_EDU_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_EDU_DOCUMENT FOR INS.FUN_INS_EDU_DOCUMENT;


--
-- FUN_INS_EDU_QUALIFICATION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_EDU_QUALIFICATION FOR INS.FUN_INS_EDU_QUALIFICATION;


--
-- FUN_INS_EMP_INCHARGE_ST  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_EMP_INCHARGE_ST FOR INS.FUN_INS_EMP_INCHARGE_ST;


--
-- FUN_INS_FORM_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_FORM_TP FOR INS.FUN_INS_FORM_TP;


--
-- FUN_INS_GENDER  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_GENDER FOR INS.FUN_INS_GENDER;


--
-- FUN_INS_GUARDIAN  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_GUARDIAN FOR INS.FUN_INS_GUARDIAN;


--
-- FUN_INS_HABIT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_HABIT FOR INS.FUN_INS_HABIT;


--
-- FUN_INS_INCHARGE_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_INCHARGE_OFFICE FOR INS.FUN_INS_INCHARGE_OFFICE;


--
-- FUN_INS_INCOME_SOURCE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_INCOME_SOURCE FOR INS.FUN_INS_INCOME_SOURCE;


--
-- FUN_INS_INSURANCE_COMPANY  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_INSURANCE_COMPANY FOR INS.FUN_INS_INSURANCE_COMPANY;


--
-- FUN_INS_LIEN  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_LIEN FOR INS.FUN_INS_LIEN;


--
-- FUN_INS_LIEN_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_LIEN_SHNM FOR INS.FUN_INS_LIEN_SHNM;


--
-- FUN_INS_LIEN_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_LIEN_TP FOR INS.FUN_INS_LIEN_TP;


--
-- FUN_INS_LIEN_TP_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_LIEN_TP_SHNM FOR INS.FUN_INS_LIEN_TP_SHNM;


--
-- FUN_INS_LIFE_CLASS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_LIFE_CLASS FOR INS.FUN_INS_LIFE_CLASS;


--
-- FUN_INS_MARITAL_STATUS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_MARITAL_STATUS FOR INS.FUN_INS_MARITAL_STATUS;


--
-- FUN_INS_NEXT_PREM_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_NEXT_PREM_DT FOR INS.FUN_INS_NEXT_PREM_DT;


--
-- FUN_INS_OCCUPATION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OCCUPATION FOR INS.FUN_INS_OCCUPATION;


--
-- FUN_INS_OCCU_CLASS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OCCU_CLASS FOR INS.FUN_INS_OCCU_CLASS;


--
-- FUN_INS_OCCU_SCOPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OCCU_SCOPE FOR INS.FUN_INS_OCCU_SCOPE;


--
-- FUN_INS_OFFICE_INCHARGE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OFFICE_INCHARGE FOR INS.FUN_INS_OFFICE_INCHARGE;


--
-- FUN_INS_OPTION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OPTION FOR INS.FUN_INS_OPTION;


--
-- FUN_INS_OPTION_SHORT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OPTION_SHORT_NM FOR INS.FUN_INS_OPTION_SHORT_NM;


--
-- FUN_INS_OWNERSHIP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_OWNERSHIP FOR INS.FUN_INS_OWNERSHIP;


--
-- FUN_INS_PAY_MODE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PAY_MODE FOR INS.FUN_INS_PAY_MODE;


--
-- FUN_INS_PGID_TO_INS_TP_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PGID_TO_INS_TP_CD FOR INS.FUN_INS_PGID_TO_INS_TP_CD;


--
-- FUN_INS_PGID_TO_POLICY_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PGID_TO_POLICY_NO FOR INS.FUN_INS_PGID_TO_POLICY_NO;


--
-- FUN_INS_PGID_TO_PROPOSAL_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PGID_TO_PROPOSAL_NO FOR INS.FUN_INS_PGID_TO_PROPOSAL_NO;


--
-- FUN_INS_POLICY_CATEGORY  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_POLICY_CATEGORY FOR INS.FUN_INS_POLICY_CATEGORY;


--
-- FUN_INS_POLICY_GROUP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_POLICY_GROUP FOR INS.FUN_INS_POLICY_GROUP;


--
-- FUN_INS_POLICY_NO_TO_PGID  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_POLICY_NO_TO_PGID FOR INS.FUN_INS_POLICY_NO_TO_PGID;


--
-- FUN_INS_POLICY_STATUS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_POLICY_STATUS FOR INS.FUN_INS_POLICY_STATUS;


--
-- FUN_INS_POLICY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_POLICY_TYPE FOR INS.FUN_INS_POLICY_TYPE;


--
-- FUN_INS_POLICY_TYPE_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_POLICY_TYPE_CD FOR INS.FUN_INS_POLICY_TYPE_CD;


--
-- FUN_INS_PRODUCT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PRODUCT FOR INS.FUN_INS_PRODUCT;


--
-- FUN_INS_PRODUCT_RATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PRODUCT_RATE FOR INS.FUN_INS_PRODUCT_RATE;


--
-- FUN_INS_PROPOSAL_NO_TO_PGID  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_PROPOSAL_NO_TO_PGID FOR INS.FUN_INS_PROPOSAL_NO_TO_PGID;


--
-- FUN_INS_REBATE_EXTRA  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_REBATE_EXTRA FOR INS.FUN_INS_REBATE_EXTRA;


--
-- FUN_INS_RECEIVE_MODE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_RECEIVE_MODE FOR INS.FUN_INS_RECEIVE_MODE;


--
-- FUN_INS_RELATION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_RELATION FOR INS.FUN_INS_RELATION;


--
-- FUN_INS_SUPP_BENIFIT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_SUPP_BENIFIT FOR INS.FUN_INS_SUPP_BENIFIT;


--
-- FUN_INS_SUPP_BENIFIT_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_SUPP_BENIFIT_SHNM FOR INS.FUN_INS_SUPP_BENIFIT_SHNM;


--
-- FUN_INS_SUPP_PRODUCT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_SUPP_PRODUCT FOR INS.FUN_INS_SUPP_PRODUCT;


--
-- FUN_INS_SUPP_PRODUCT_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_SUPP_PRODUCT_SHNM FOR INS.FUN_INS_SUPP_PRODUCT_SHNM;


--
-- REP_DUE_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_DUE_DT FOR INS.REP_DUE_DT;


--
-- REP_FUN_ACTIVITY_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_ACTIVITY_NM FOR INS.REP_FUN_ACTIVITY_NM;


--
-- REP_FUN_CONTROL_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_CONTROL_OFFICE FOR INS.REP_FUN_CONTROL_OFFICE;


--
-- REP_FUN_INS_AGE_PROOF_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_AGE_PROOF_DOCUMENT FOR INS.REP_FUN_INS_AGE_PROOF_DOCUMENT;


--
-- REP_FUN_INS_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_DOCUMENT FOR INS.REP_FUN_INS_DOCUMENT;


--
-- REP_FUN_INS_EDU_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_EDU_DOCUMENT FOR INS.REP_FUN_INS_EDU_DOCUMENT;


--
-- REP_FUN_INS_EDU_QUALIFICATION  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_EDU_QUALIFICATION FOR INS.REP_FUN_INS_EDU_QUALIFICATION;


--
-- REP_FUN_INS_GENDER  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_GENDER FOR INS.REP_FUN_INS_GENDER;


--
-- REP_FUN_INS_GUARDIAN  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_GUARDIAN FOR INS.REP_FUN_INS_GUARDIAN;


--
-- REP_FUN_INS_HABIT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_HABIT FOR INS.REP_FUN_INS_HABIT;


--
-- REP_FUN_INS_INCOME_SOURCE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_INCOME_SOURCE FOR INS.REP_FUN_INS_INCOME_SOURCE;


--
-- REP_FUN_INS_INSURANCE_COMPANY  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_INSURANCE_COMPANY FOR INS.REP_FUN_INS_INSURANCE_COMPANY;


--
-- REP_FUN_INS_LIEN  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_LIEN FOR INS.REP_FUN_INS_LIEN;


--
-- REP_FUN_INS_LIEN_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_LIEN_SHNM FOR INS.REP_FUN_INS_LIEN_SHNM;


--
-- REP_FUN_INS_LIEN_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_LIEN_TP FOR INS.REP_FUN_INS_LIEN_TP;


--
-- REP_FUN_INS_LIEN_TP_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_LIEN_TP_SHNM FOR INS.REP_FUN_INS_LIEN_TP_SHNM;


--
-- REP_FUN_INS_LIFE_CLASS  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_LIFE_CLASS FOR INS.REP_FUN_INS_LIFE_CLASS;


--
-- REP_FUN_INS_MARITAL_STATUS  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_MARITAL_STATUS FOR INS.REP_FUN_INS_MARITAL_STATUS;


--
-- REP_FUN_INS_OCCUPATION  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_OCCUPATION FOR INS.REP_FUN_INS_OCCUPATION;


--
-- REP_FUN_INS_OCCU_CLASS  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_OCCU_CLASS FOR INS.REP_FUN_INS_OCCU_CLASS;


--
-- REP_FUN_INS_OCCU_SCOPE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_OCCU_SCOPE FOR INS.REP_FUN_INS_OCCU_SCOPE;


--
-- REP_FUN_INS_OPTION  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_OPTION FOR INS.REP_FUN_INS_OPTION;


--
-- REP_FUN_INS_OPTION_SHORT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_OPTION_SHORT_NM FOR INS.REP_FUN_INS_OPTION_SHORT_NM;


--
-- REP_FUN_INS_PAY_MODE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_PAY_MODE FOR INS.REP_FUN_INS_PAY_MODE;


--
-- REP_FUN_INS_PAY_MODE_SH_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_PAY_MODE_SH_NM FOR INS.REP_FUN_INS_PAY_MODE_SH_NM;


--
-- REP_FUN_INS_POLICY_GROUP  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_POLICY_GROUP FOR INS.REP_FUN_INS_POLICY_GROUP;


--
-- REP_FUN_INS_POLICY_STATUS  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_POLICY_STATUS FOR INS.REP_FUN_INS_POLICY_STATUS;


--
-- REP_FUN_INS_POLICY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_POLICY_TYPE FOR INS.REP_FUN_INS_POLICY_TYPE;


--
-- REP_FUN_INS_PRODUCT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_PRODUCT FOR INS.REP_FUN_INS_PRODUCT;


--
-- REP_FUN_INS_REBATE_EXTRA  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_REBATE_EXTRA FOR INS.REP_FUN_INS_REBATE_EXTRA;


--
-- REP_FUN_INS_RELATION  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_RELATION FOR INS.REP_FUN_INS_RELATION;


--
-- REP_FUN_INS_SUPP_BENIFIT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_SUPP_BENIFIT FOR INS.REP_FUN_INS_SUPP_BENIFIT;


--
-- REP_FUN_INS_SUPP_BENIFIT_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_SUPP_BENIFIT_SHNM FOR INS.REP_FUN_INS_SUPP_BENIFIT_SHNM;


--
-- REP_FUN_INS_SUPP_PRODUCT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_SUPP_PRODUCT FOR INS.REP_FUN_INS_SUPP_PRODUCT;


--
-- REP_FUN_INS_SUPP_PRODUCT_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_INS_SUPP_PRODUCT_SHNM FOR INS.REP_FUN_INS_SUPP_PRODUCT_SHNM;


--
-- REP_FUN_MATURITY_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_MATURITY_DATE FOR INS.REP_FUN_MATURITY_DATE;


--
-- REP_FUN_PARTY_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_PARTY_NAME FOR INS.REP_FUN_PARTY_NAME;


--
-- REP_FUN_POL_LOAN_CALC_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_POL_LOAN_CALC_TYPE FOR INS.REP_FUN_POL_LOAN_CALC_TYPE;


--
-- REP_FUN_POL_LOAN_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_POL_LOAN_TYPE FOR INS.REP_FUN_POL_LOAN_TYPE;


--
-- REP_FUN_REBATE_CAL_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_REBATE_CAL_TP FOR INS.REP_FUN_REBATE_CAL_TP;


--
-- REP_FUN_SER_LAPS_INSTANT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_FUN_SER_LAPS_INSTANT FOR INS.REP_FUN_SER_LAPS_INSTANT;


--
-- REP_F_ACC_COA_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_ACC_COA_NM FOR INS.REP_F_ACC_COA_NM;


--
-- REP_F_AGENT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_AGENT_NM FOR INS.REP_F_AGENT_NM;


--
-- REP_F_BANK  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_BANK FOR INS.REP_F_BANK;


--
-- REP_F_BRANCH  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_BRANCH FOR INS.REP_F_BRANCH;


--
-- REP_F_CLAIM_CAUSE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_CLAIM_CAUSE FOR INS.REP_F_CLAIM_CAUSE;


--
-- REP_F_CLAIM_DETL  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_CLAIM_DETL FOR INS.REP_F_CLAIM_DETL;


--
-- REP_F_DESIG  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_DESIG FOR INS.REP_F_DESIG;


--
-- REP_F_DIAG_TEST  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_DIAG_TEST FOR INS.REP_F_DIAG_TEST;


--
-- REP_F_DISTRICT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_DISTRICT FOR INS.REP_F_DISTRICT;


--
-- REP_F_DIVDEPT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_DIVDEPT FOR INS.REP_F_DIVDEPT;


--
-- REP_F_DIVISION  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_DIVISION FOR INS.REP_F_DIVISION;


--
-- REP_F_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_DOCUMENT FOR INS.REP_F_DOCUMENT;


--
-- REP_F_EMPLOYEE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMPLOYEE FOR INS.REP_F_EMPLOYEE;


--
-- REP_F_EMPLOYMENT_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMPLOYMENT_TP FOR INS.REP_F_EMPLOYMENT_TP;


--
-- REP_F_EMPLOYMENT_TP_SH  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMPLOYMENT_TP_SH FOR INS.REP_F_EMPLOYMENT_TP_SH;


--
-- REP_F_EMP_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMP_CD FOR INS.REP_F_EMP_CD;


--
-- REP_F_EMP_CD_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMP_CD_NM FOR INS.REP_F_EMP_CD_NM;


--
-- REP_F_EMP_ID  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMP_ID FOR INS.REP_F_EMP_ID;


--
-- REP_F_EMP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMP_NM FOR INS.REP_F_EMP_NM;


--
-- REP_F_EMP_OFFICE_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMP_OFFICE_CD FOR INS.REP_F_EMP_OFFICE_CD;


--
-- REP_F_EMP_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_EMP_TP_NM FOR INS.REP_F_EMP_TP_NM;


--
-- REP_F_INSTANT  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_INSTANT FOR INS.REP_F_INSTANT;


--
-- REP_F_LIFE_CLASS_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_LIFE_CLASS_CD FOR INS.REP_F_LIFE_CLASS_CD;


--
-- REP_F_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_OFFICE FOR INS.REP_F_OFFICE;


--
-- REP_F_OFFICE_SH_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_OFFICE_SH_NM FOR INS.REP_F_OFFICE_SH_NM;


--
-- REP_F_OFF_CATG_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_F_OFF_CATG_NM FOR INS.REP_F_OFF_CATG_NM;


--
-- FUN_INS_TP_CD_TO_INS_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_TP_CD_TO_INS_TP_NM FOR INS.FUN_INS_TP_CD_TO_INS_TP_NM;


--
-- FUN_INS_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_TP_NM FOR INS.FUN_INS_TP_NM;


--
-- FUN_INS_TP_SH_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_TP_SH_NM FOR INS.FUN_INS_TP_SH_NM;


--
-- FUN_INS_UNIT_OF_MEASURE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_UNIT_OF_MEASURE FOR INS.FUN_INS_UNIT_OF_MEASURE;


--
-- FUN_INS_UNIT_OF_MEASURE_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_UNIT_OF_MEASURE_SHNM FOR INS.FUN_INS_UNIT_OF_MEASURE_SHNM;


--
-- FUN_INS_YRLY_NO_INST  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INS_YRLY_NO_INST FOR INS.FUN_INS_YRLY_NO_INST;


--
-- FUN_INVESMENT_AUTO_RENEW  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_INVESMENT_AUTO_RENEW FOR INS.FUN_INVESMENT_AUTO_RENEW;


--
-- FUN_LAPSE_YR  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LAPSE_YR FOR INS.FUN_LAPSE_YR;


--
-- FUN_LAPSE_YR_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LAPSE_YR_TP FOR INS.FUN_LAPSE_YR_TP;


--
-- FUN_LAST_DUE_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LAST_DUE_DATE FOR INS.FUN_LAST_DUE_DATE;


--
-- FUN_LNRECV_INTRST_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LNRECV_INTRST_AMT FOR INS.FUN_LNRECV_INTRST_AMT;


--
-- FUN_LNRECV_PRINC_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LNRECV_PRINC_AMT FOR INS.FUN_LNRECV_PRINC_AMT;


--
-- FUN_LOAN_LAST_REC_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LOAN_LAST_REC_DATE FOR INS.FUN_LOAN_LAST_REC_DATE;


--
-- FUN_LOAN_RECO_LOCKING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LOAN_RECO_LOCKING FOR INS.FUN_LOAN_RECO_LOCKING;


--
-- FUN_LOAN_TP_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LOAN_TP_NM FOR INS.FUN_LOAN_TP_NM;


--
-- FUN_LOCKED_POLICY_AUTH  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_LOCKED_POLICY_AUTH FOR INS.FUN_LOCKED_POLICY_AUTH;


--
-- FUN_MATURITY_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_MATURITY_DATE FOR INS.FUN_MATURITY_DATE;


--
-- FUN_MOBILE_NUMBER_VAL  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_MOBILE_NUMBER_VAL FOR INS.FUN_MOBILE_NUMBER_VAL;


--
-- FUN_MOD_PERSISTENCE_RATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_MOD_PERSISTENCE_RATE FOR INS.FUN_MOD_PERSISTENCE_RATE;


--
-- FUN_NEXT_DUE_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_NEXT_DUE_DT FOR INS.FUN_NEXT_DUE_DT;


--
-- FUN_NOMINEE_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_NOMINEE_NAME FOR INS.FUN_NOMINEE_NAME;


--
-- FUN_NO_OF_FIRST_PREMIUM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_NO_OF_FIRST_PREMIUM FOR INS.FUN_NO_OF_FIRST_PREMIUM;


--
-- FUN_NR_RECEIVE_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_NR_RECEIVE_DT FOR INS.FUN_NR_RECEIVE_DT;


--
-- FUN_OBJECT_UI_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_OBJECT_UI_NM FOR INS.FUN_OBJECT_UI_NM;


--
-- FUN_OCCURS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_OCCURS FOR INS.FUN_OCCURS;


--
-- FUN_OFFICE_SHNM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_OFFICE_SHNM FOR INS.FUN_OFFICE_SHNM;


--
-- FUN_OFF_FOR_BILL  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_OFF_FOR_BILL FOR INS.FUN_OFF_FOR_BILL;


--
-- FUN_ORG_OFFICE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_ORG_OFFICE FOR INS.FUN_ORG_OFFICE;


--
-- FUN_ORG_OFFICE_HIST  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_ORG_OFFICE_HIST FOR INS.FUN_ORG_OFFICE_HIST;


--
-- FUN_ORG_OFFICE_OLD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_ORG_OFFICE_OLD FOR INS.FUN_ORG_OFFICE_OLD;


--
-- FUN_PAIDUP_VALUE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PAIDUP_VALUE FOR INS.FUN_PAIDUP_VALUE;


--
-- FUN_PARTY_NAME  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PARTY_NAME FOR INS.FUN_PARTY_NAME;


--
-- FUN_PAY_ORDER_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PAY_ORDER_NO FOR INS.FUN_PAY_ORDER_NO;


--
-- FUN_PERSISTENCY_RATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PERSISTENCY_RATE FOR INS.FUN_PERSISTENCY_RATE;


--
-- FUN_PF_GL_HEAD_OPENING  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PF_GL_HEAD_OPENING FOR INS.FUN_PF_GL_HEAD_OPENING;


--
-- FUN_PF_VOUCHER_PAYMENT_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PF_VOUCHER_PAYMENT_AMT FOR INS.FUN_PF_VOUCHER_PAYMENT_AMT;


--
-- FUN_PGID_PR_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PGID_PR_NO FOR INS.FUN_PGID_PR_NO;


--
-- FUN_PGID_TO_INS_TP_CD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PGID_TO_INS_TP_CD FOR INS.FUN_PGID_TO_INS_TP_CD;


--
-- FUN_PIR_STAMP_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PIR_STAMP_AMT FOR INS.FUN_PIR_STAMP_AMT;


--
-- FUN_PIR_STAMP_AMT_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PIR_STAMP_AMT_TYPE FOR INS.FUN_PIR_STAMP_AMT_TYPE;


--
-- FUN_PIR_STAMP_CALCULATION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PIR_STAMP_CALCULATION FOR INS.FUN_PIR_STAMP_CALCULATION;


--
-- FUN_POLICY_FRM_PREVPOL  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POLICY_FRM_PREVPOL FOR INS.FUN_POLICY_FRM_PREVPOL;


--
-- FUN_POLICY_INFO_UPD_ST  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POLICY_INFO_UPD_ST FOR INS.FUN_POLICY_INFO_UPD_ST;


--
-- FUN_POLICY_SURRENDERED  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POLICY_SURRENDERED FOR INS.FUN_POLICY_SURRENDERED;


--
-- FUN_POLICY_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POLICY_TYPE FOR INS.FUN_POLICY_TYPE;


--
-- FUN_POL_LAPSE_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POL_LAPSE_DT FOR INS.FUN_POL_LAPSE_DT;


--
-- FUN_POL_LOAN_CALC_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POL_LOAN_CALC_TYPE FOR INS.FUN_POL_LOAN_CALC_TYPE;


--
-- FUN_POL_LOAN_SCHEDULE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POL_LOAN_SCHEDULE FOR INS.FUN_POL_LOAN_SCHEDULE;


--
-- FUN_POL_LOAN_SCHEDULE_DT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POL_LOAN_SCHEDULE_DT FOR INS.FUN_POL_LOAN_SCHEDULE_DT;


--
-- FUN_POL_LOAN_TYPE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POL_LOAN_TYPE FOR INS.FUN_POL_LOAN_TYPE;


--
-- FUN_POL_PAIDUP_STATUS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_POL_PAIDUP_STATUS FOR INS.FUN_POL_PAIDUP_STATUS;


--
-- FUN_PREMIUM_BY_DATE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PREMIUM_BY_DATE FOR INS.FUN_PREMIUM_BY_DATE;


--
-- FUN_PREM_COLL_RECEIPT_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PREM_COLL_RECEIPT_NO FOR INS.FUN_PREM_COLL_RECEIPT_NO;


--
-- FUN_PRE_POLICY_INFO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PRE_POLICY_INFO FOR INS.FUN_PRE_POLICY_INFO;


--
-- FUN_PROCESS_SAL  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PROCESS_SAL FOR INS.FUN_PROCESS_SAL;


--
-- FUN_PROCESS_SALARY_CALCULATION  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PROCESS_SALARY_CALCULATION FOR INS.FUN_PROCESS_SALARY_CALCULATION;


--
-- FUN_PROJECT_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PROJECT_NM FOR INS.FUN_PROJECT_NM;


--
-- FUN_PROJECT_SETUP_CHECK  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PROJECT_SETUP_CHECK FOR INS.FUN_PROJECT_SETUP_CHECK;


--
-- FUN_PROPOSAL_NO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_PROPOSAL_NO FOR INS.FUN_PROPOSAL_NO;


--
-- FUN_REBATE_CAL_TP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_REBATE_CAL_TP FOR INS.FUN_REBATE_CAL_TP;


--
-- FUN_RECEIVED_DOCUMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_RECEIVED_DOCUMENT FOR INS.FUN_RECEIVED_DOCUMENT;


--
-- FUN_RENEWAL_PREMIUM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_RENEWAL_PREMIUM FOR INS.FUN_RENEWAL_PREMIUM;


--
-- FUN_RS_ID  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_RS_ID FOR INS.FUN_RS_ID;


--
-- FUN_SALARY_HEAD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SALARY_HEAD FOR INS.FUN_SALARY_HEAD;


--
-- FUN_SATT_AMT_MAT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SATT_AMT_MAT FOR INS.FUN_SATT_AMT_MAT;


--
-- FUN_SB_AVAILABLE_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SB_AVAILABLE_AMT FOR INS.FUN_SB_AVAILABLE_AMT;


--
-- FUN_SECOND_YR_PREMIUM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SECOND_YR_PREMIUM FOR INS.FUN_SECOND_YR_PREMIUM;


--
-- FUN_SECTION_NM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SECTION_NM FOR INS.FUN_SECTION_NM;


--
-- FUN_SER_LAPS_INSTANT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SER_LAPS_INSTANT FOR INS.FUN_SER_LAPS_INSTANT;


--
-- FUN_SETTELMENT_PAIDUP_VALUE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SETTELMENT_PAIDUP_VALUE FOR INS.FUN_SETTELMENT_PAIDUP_VALUE;


--
-- FUN_SIMPLE_INTEREST_METHOD  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SIMPLE_INTEREST_METHOD FOR INS.FUN_SIMPLE_INTEREST_METHOD;


--
-- FUN_SUM_ASSURED_IN_THOUSAND  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SUM_ASSURED_IN_THOUSAND FOR INS.FUN_SUM_ASSURED_IN_THOUSAND;


--
-- FUN_SUM_AT_RISK  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SUM_AT_RISK FOR INS.FUN_SUM_AT_RISK;


--
-- FUN_SUPP_BENIFIT_PREM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SUPP_BENIFIT_PREM FOR INS.FUN_SUPP_BENIFIT_PREM;


--
-- FUN_SUPP_PRODUCT_PREM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SUPP_PRODUCT_PREM FOR INS.FUN_SUPP_PRODUCT_PREM;


--
-- FUN_SURRENDER_VALUE  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_SURRENDER_VALUE FOR INS.FUN_SURRENDER_VALUE;


--
-- FUN_TOP_SHEET_ACC  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_TOP_SHEET_ACC FOR INS.FUN_TOP_SHEET_ACC;


--
-- FUN_VOUCHER  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_VOUCHER FOR INS.FUN_VOUCHER;


--
-- FUN_VOUCHER_INAVAILD_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_VOUCHER_INAVAILD_AMT FOR INS.FUN_VOUCHER_INAVAILD_AMT;


--
-- FUN_VOUCHER_PAYMENT_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_VOUCHER_PAYMENT_AMT FOR INS.FUN_VOUCHER_PAYMENT_AMT;


--
-- FUN_VOUCH_GF_PAYMENT_AMT  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_VOUCH_GF_PAYMENT_AMT FOR INS.FUN_VOUCH_GF_PAYMENT_AMT;


--
-- FUN_WT_MTR  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_WT_MTR FOR INS.FUN_WT_MTR;


--
-- FXN_BOOL  (Synonym) 
--
CREATE PUBLIC SYNONYM FXN_BOOL FOR INS.FXN_BOOL;


--
-- COUNT_STR  (Synonym) 
--
CREATE PUBLIC SYNONYM COUNT_STR FOR INS.COUNT_STR;


--
-- FUN_AGENT_ORG_SETUP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_agent_org_setup (
   P_AGENT_ID   IN HRM_AGENT.AGENT_ID%TYPE
)
   RETURN VARCHAR2
IS
   V_OFFICE      HRM_AGENT.OFFICE_CD%TYPE;

   V_DO          NUMBER (8);
   V_DM          NUMBER (8);
   V_ORG_SETUP   VARCHAR (100);
   V_ERROR       VARCHAR (2000);
BEGIN
   BEGIN
      SELECT   OFFICE_CD, DEV_EMP_GID
        INTO   V_OFFICE, V_DO
        FROM   HRM_AGENT
       WHERE   AGENT_ID = P_AGENT_ID;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         V_ERROR := 'Invalid Agent';
   END;

   IF V_DO IS NOT NULL
   THEN
      BEGIN
         SELECT   S.H_EMPLOYEE_GID
           INTO   V_DM
           FROM   HRM_EMPLOYEE_SETUP S,
                  HRM_EMPLOYEE E,
                  HRM_EMPLOYMENT_TYPE P,
                  HRM_EMP_TYPE T
          WHERE       S.EMPLOYEE_GID = V_DO
                  AND E.EMP_GID = S.EMPLOYEE_GID
                  AND E.EMPLOYMENT_TP_CD = P.EMPLOYMENT_TP_CD
                  AND P.OFFICIAL_REL = '0'
                  AND T.EMP_TYPE_CD = '05'
                  AND S.STATUS = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            V_ERROR := 'Agent DM Not Found';
      END;
   ELSE
      V_ERROR := 'Agent DO Not Found';
   END IF;

   IF V_OFFICE IS NOT NULL
   THEN
      V_ORG_SETUP :=
            P_AGENT_ID
         || '-'
         || f_agent_idra_cd (P_AGENT_ID)
         || '-'
         || F_EMP_CD (V_DO)
         || '-'
         || F_EMP_CD (V_DM)
         || '-'
         || FUN_ORG_OFFICE (V_OFFICE);
   ELSE
      V_ERROR := 'Agent Office Not Found';
   END IF;

   IF V_ERROR IS NULL
   THEN
      RETURN V_ORG_SETUP;
   ELSE
      RETURN 'Error in finding setup: ' || V_ERROR;
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      V_ERROR := 'Agent Information Not Correct. Error: ' || SQLERRM;
      RETURN (V_ERROR);
END;
/


--
-- FUN_CLIENT_PERSONAL_INFO  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_client_personal_info wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
5f0 2b9
is8D0tvRQxfaby/BYH7k4tew45AwgzvDNSAFyo4ZMZ0GTBsFoxdjPdxKwHDf3Mh2Z2eDgUZR
PZBmAf+JkcT5zjeyeaSGXOuSy/O7hhIs/1u7XP2jFhUWevlIgf5z4t5ykurHeqSDzYe7g8Yd
FPOmuNecGjYsRvJ5yq9Xt03/ihmAMnIIjYZma7kNRFmjdx4chSNTfSbMJ77hCvAOuG2iLeYG
G2YlUcTsC6iI6Q0boOBvUjZa4hcDk3vQvAZsa6e6f/s2kg30ogarH5fRvtrIUSpKcC+uri8d
krPPSsb9eoTZyk94xk8FPAQ2fe6oB2c+l1NgAT5LiZJ7FAhg1y6ltF9DtjJuiHhqKmXD73yx
jSvVovMUKw66q/AhFAm53MHejfFabONSRbabMYlvJN+w6Hn5yZCb3+S3vfyqLmm7Aawj6zYn
e+Mcm48TghILU2ebm2wzUsQV9bQXmeMXDwbKMUbCz7YtETMFTrlQi7d3ryxoaXm6TI+rMoRm
CAA9tSN6shjuo+AOE0Ucu+CjFQ6VDxaNcPYkD3Ydzo2EaJn7ju3A5nAF/J96YmhuIzLKwkkA
rkFBCIqDdbEKDkj3z/JJRnr6bEC0f/bUUwpTbnA64DaI0KHfqYv3A9Se1+8TOjpNluPOuje+
DSKbZDdY2m9Mu7TZn0/ul81sdauj/yTk+6FvzAs=
/


--
-- FUN_COMM_CALC_ST  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_comm_calc_st wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
40e 213
CAOJKa6mHyeJyS5l49TeUVtPOvkwgwJeNUgVfC+KrWS0DOnIL2ZaAKjFAku9p9MFwraDbtie
JrAlHIP5nR5Xy6+OpZWXuUfYF4pdsnInG1c0tT/sarEIEcsgLFtOcx1SNqYlfqvXVyd5tG+p
UqYZw/3DgqaxxvLsRY0RwrydXj1pbtBF0J9PkFoClPWJN8MYb6T0RQusirNK3VPfw17mnpCn
xymvs3dRlDzwBnOteajgg0gSjLp5Za/HKwRM1sThUmVMrWfvxOhmA943VdgQ5cJM5acvlh+Z
4XlLcGjmkxyiA0A2/KSfLpjk3AchRDyvfc5H9w8ewRkpVqwTDCMmLTYtT7m2aud2f+OLvFkE
iZyIPSD2aXUcZ5NA6oTekrlXdyL+0XvoN23s4ktWHV/WQ7J4CYlW9i7c0AzFaOvByOTIgYlA
LvH6YzluQSXgMjyvCYYqEdNnrZAhLD3RU7Vf51rBiW2tAKtoE05xz9dpgywFbw+F/efATUUs
OJGBIZDjCgckfduabA==
/


--
-- FUN_EMP_APPOINTED_DESIG  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_emp_appointed_desig wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
32c 1be
SZf5VoyKNb4DBwOwSV3CG3lCVu0wg/DxJCDWfC+V2vheaFpvw1z8CYk3jx1W7iQNLoPcK2NQ
xYReGmGanTlZNhqh/L0swcH+mME0b1gBCd0Fcq8qLDsSeQVyc+6YMb5MTg2qB1qtXZeUX6xN
OjmBGKapYLr2+wXDFwHlu+eCTDIeCWMUtm8mjBFUsz3mmaL+xApGfktwUR4qVDjJN2ULWMSm
QlfzJlTedt/RjHN5t0OVQykAbehxDMtji+3HZLmBiZahaU7UsNMqrBiA3Sp2OB8YyJ6ekIL6
1soNvACejm69487k/iU6OjI80bVk26YVsMqGxE86IUtDXdOscojlub3INVqpyEro3zK+2Okk
5x4Kr/KmIugCCN4J6mXsBiubRPPIR1elZGc5X20UjKopcycDfD+S3yw8cBzVd+xJ6mPMUF2L
H05A3f0=
/


--
-- FUN_FA_ORGANOGRAM  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_fa_organogram (
   P_AGENT_ID   IN HRM_AGENT.AGENT_ID%TYPE
)
   RETURN VARCHAR2
IS
   V_OFFICE       HRM_AGENT.OFFICE_CD%TYPE;
   V_IDRA_FA_ID   HRM_AGENT.IDRA_FA_CD%TYPE;
   V_UM_GID       HRM_EMPLOYEE.EMP_GID%TYPE;
   V_UM_ID        VARCHAR2 (50);
   V_BM_GID       HRM_EMPLOYEE.EMP_GID%TYPE;
   V_BM_ID        VARCHAR2 (50);
   V_BC_GID       HRM_EMPLOYEE.EMP_GID%TYPE;
   V_BC_ID        VARCHAR2 (50);
   V_DC_GID       HRM_EMPLOYEE.EMP_GID%TYPE;
   V_DC_ID        VARCHAR2 (50);

   V_ORG_SETUP    VARCHAR (100);
   V_ERROR        VARCHAR (2000);
BEGIN
   BEGIN
      SELECT   IDRA_FA_CD
        INTO   V_IDRA_FA_ID
        FROM   HRM_AGENT
       WHERE   AGENT_ID = P_AGENT_ID;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         V_ERROR := 'FA IDRA ID not found';
   END;

   BEGIN
      SELECT   DEV_EMP_GID, F_EMP_ID (DEV_EMP_GID) DEV_EMP_ID
        INTO   V_UM_GID, V_UM_ID
        FROM   HRM_AGENT
       WHERE   AGENT_ID = P_AGENT_ID;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         V_ERROR := 'Invalid Agent';
   END;

   IF V_UM_GID IS NOT NULL
   THEN
      BEGIN
         SELECT   S.H_EMPLOYEE_GID, F_EMP_ID (H_EMPLOYEE_GID) EMP_ID
           INTO   V_BM_GID, V_BM_ID
           FROM   HRM_EMPLOYEE_SETUP S,
                  HRM_EMPLOYEE E,
                  HRM_EMPLOYMENT_TYPE P,
                  HRM_EMP_TYPE T
          WHERE       S.EMPLOYEE_GID = V_UM_GID
                  AND E.EMP_GID = S.EMPLOYEE_GID
                  AND E.EMPLOYMENT_TP_CD = P.EMPLOYMENT_TP_CD
                  AND P.OFFICIAL_REL = '0'
                  AND T.EMP_TYPE_CD = '05'
                  AND S.STATUS = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            V_ERROR := 'Agent BM Not Found';
      END;
   ELSE
      V_ERROR := 'Agent BM Not Found';
      V_BM_ID := 'BM Not Found';
   END IF;

   IF V_BM_GID IS NOT NULL
   THEN
      BEGIN
         SELECT   S.H_EMPLOYEE_GID, F_EMP_ID (H_EMPLOYEE_GID) EMP_ID
           INTO   V_BC_GID, V_BC_ID
           FROM   HRM_EMPLOYEE_SETUP S,
                  HRM_EMPLOYEE E,
                  HRM_EMPLOYMENT_TYPE P,
                  HRM_EMP_TYPE T
          WHERE       S.EMPLOYEE_GID = V_BM_GID
                  AND E.EMP_GID = S.EMPLOYEE_GID
                  AND E.EMPLOYMENT_TP_CD = P.EMPLOYMENT_TP_CD
                  AND P.OFFICIAL_REL = '0'
                  AND T.EMP_TYPE_CD = '05'
                  AND S.STATUS = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            V_ERROR := 'Agent BC Not Found';
      END;
   ELSE
      V_ERROR := 'Agent BC Not Found';
      V_BC_ID := 'BC Not Found';
   END IF;

   IF V_BC_GID IS NOT NULL
   THEN
      BEGIN
         SELECT   S.H_EMPLOYEE_GID, F_EMP_ID (H_EMPLOYEE_GID) EMP_ID
           INTO   V_DC_GID, V_DC_ID
           FROM   HRM_EMPLOYEE_SETUP S,
                  HRM_EMPLOYEE E,
                  HRM_EMPLOYMENT_TYPE P,
                  HRM_EMP_TYPE T
          WHERE       S.EMPLOYEE_GID = V_BC_GID
                  AND E.EMP_GID = S.EMPLOYEE_GID
                  AND E.EMPLOYMENT_TP_CD = P.EMPLOYMENT_TP_CD
                  AND P.OFFICIAL_REL = '0'
                  AND T.EMP_TYPE_CD = '05'
                  AND S.STATUS = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            V_ERROR := 'Agent DC Not Found';
      END;
   ELSE
      V_ERROR := 'Agent DC Not Found';
      V_DC_ID := 'DC Not Found';
   END IF;

   IF P_AGENT_ID IS NOT NULL
   THEN
      V_ORG_SETUP :=
            P_AGENT_ID
         || '-'
         || V_IDRA_FA_ID
         || '-'
         || V_UM_ID
         || '-'
         || V_BM_ID
         || '-'
         || V_BC_ID
         || '-'
         || V_DC_ID;
   ELSE
      V_ERROR := 'Agent Office Not Found';
   END IF;

   IF V_ERROR IS NULL
   THEN
      RETURN V_ORG_SETUP;
   ELSE
      RETURN V_ORG_SETUP;
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      V_ERROR := 'Agent Information Not Correct. Error: ' || SQLERRM;
      RETURN (V_ERROR);
END;
/


--
-- FUN_FA_ORGANOGRAM_NEW  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_fa_organogram_new (
   p_agent_id   IN hrm_agent.agent_id%TYPE
)
   RETURN VARCHAR2
IS
   v_office      hrm_agent.office_cd%TYPE;
   v_um_gid      hrm_employee.emp_gid%TYPE;
   v_um_id       VARCHAR2 (50);
   v_bm_gid      hrm_employee.emp_gid%TYPE;
   v_bm_id       VARCHAR2 (50);
   v_bc_gid      hrm_employee.emp_gid%TYPE;
   v_bc_id       VARCHAR2 (50);
   v_dc_gid      hrm_employee.emp_gid%TYPE;
   v_dc_id       VARCHAR2 (50);
   v_dci_gid     VARCHAR2 (50);
   v_dci_id      VARCHAR2 (50);
   v_rc_gid      VARCHAR2 (50);
   v_rc_id       VARCHAR2 (50);
   v_dvc_gid     VARCHAR2 (50);
   v_dvc_id      VARCHAR2 (50);
   v_cc_gid      VARCHAR2 (50);
   v_cc_id       VARCHAR2 (50);
   v_agm_gid     VARCHAR2 (50);
   v_agm_id      VARCHAR2 (50);
   v_dgm_gid     VARCHAR2 (50);
   v_dgm_id      VARCHAR2 (50);
   v_gm_gid      VARCHAR2 (50);
   v_gm_id       VARCHAR2 (50);
   v_org_setup   VARCHAR (2000);
   v_error       VARCHAR (2000);
BEGIN
   BEGIN
      SELECT   dev_emp_gid, f_emp_id (dev_emp_gid) dev_emp_id
        INTO   v_um_gid, v_um_id
        FROM   hrm_agent
       WHERE   agent_id = p_agent_id;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_error := 'Invalid Agent';
          v_um_id := 'UM Not Found';
   END;

   IF v_um_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_bm_gid, v_bm_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_um_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent BM Not Found';
            v_bm_id := 'BM Not Found';
      END;
   ELSE
      v_error := 'Agent BM Not Found';
      v_bm_id := 'BM Not Found';
   END IF;

   IF v_bm_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_bc_gid, v_bc_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_bm_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent BC Not Found';
            v_bc_id := 'BC Not Found';
            v_bc_id := 'BC Not Found';
      END;
   ELSE
      v_error := 'Agent BC Not Found';
      v_bc_id := 'BC Not Found';
   END IF;

   IF v_bc_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_dc_gid, v_dc_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_bc_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent DC Not Found';
            v_dc_id := 'DC Not Found';
      END;
   ELSE
      v_error := 'Agent DC Not Found';
      v_dc_id := 'DC Not Found';
   END IF;

   IF v_dc_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_dci_gid, v_dci_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_dc_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent DCI Not Found';
             v_dci_id := 'DCI Not Found';
      END;
   ELSE
      v_error := 'Agent DCI Not Found';
      v_dci_id := 'DCI Not Found';
   END IF;

   IF v_dci_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_rc_gid, v_rc_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_dci_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent RC Not Found';
             v_rc_id := 'RC Not Found';
      END;
   ELSE
      v_error := 'Agent RC Not Found';
      v_rc_id := 'RC Not Found';
   END IF;

   IF v_rc_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_dvc_gid, v_dvc_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_rc_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent DVC Not Found';
             v_dvc_id := 'DVC Not Found';
      END;
   ELSE
      v_error := 'Agent DVC Not Found';
      v_dvc_id := 'DVC Not Found';
   END IF;

   IF v_dvc_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_cc_gid, v_cc_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_dvc_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent CC Not Found';
            v_cc_id := 'CC Not Found';
      END;
   ELSE
      v_error := 'Agent CC Not Found';
      v_cc_id := 'CC Not Found';
   END IF;

 
   IF v_bm_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_agm_gid, v_agm_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_bm_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent AGM Not Found';
             v_agm_id := 'AGM Not Found';
      END;
   ELSE
      v_error := 'Agent AGM Not Found';
      v_agm_id := 'AGM Not Found';
   END IF;


   IF v_agm_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_dgm_gid, v_dgm_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_agm_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent DGM Not Found';
            v_dgm_id := 'DGM Not Found';
      END;
   ELSE
      v_error := 'Agent DGM Not Found';
     v_dgm_id := 'DGM Not Found';
   END IF;



   IF v_dgm_gid IS NOT NULL
   THEN
      BEGIN
         SELECT   s.h_employee_gid, f_emp_id (h_employee_gid) emp_id
           INTO   v_gm_gid, v_gm_id
           FROM   hrm_employee_setup s,
                  hrm_employee e,
                  hrm_employment_type p,
                  hrm_emp_type t
          WHERE       s.employee_gid = v_dgm_gid
                  AND e.emp_gid = s.employee_gid
                  AND e.employment_tp_cd = p.employment_tp_cd
                  AND p.official_rel = '0'
                  AND t.emp_type_cd = '05'
                  AND s.status = '1';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_error := 'Agent GM Not Found';
            v_gm_id := 'GM Not Found';
      END;
   ELSE
      v_error := 'Agent GM Not Found';
      v_gm_id := 'GM Not Found';
   END IF; 


   IF p_agent_id IS NOT NULL
   THEN
      v_org_setup :=
            p_agent_id
         || '-'
         || v_um_id
         || '-'
         || v_bm_id
         || '-'
         || v_bc_id
         || '-'
         || v_dc_id
         || '-'
         || v_dci_id
         || '-'
         || v_rc_id
         || '-'
         || v_dvc_id
         || '-'
         || v_cc_id
         || '-'
         || v_agm_id
         || '-'
         || v_dgm_id
         || '-'
         || v_gm_id;
   ELSE
      v_error := 'Agent Office Not Found';
   END IF;

   IF v_error IS NULL
   THEN
      RETURN v_org_setup;
   ELSE
      RETURN v_org_setup;            ---'Error in finding setup: ' || v_error;
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      v_error := 'Agent Information Not Correct. Error: ' || SQLERRM;
      RETURN (v_error);
END;
/


--
-- FUN_FIND_POLICY_STATUS  (Function) 
--
CREATE OR REPLACE FUNCTION INS.fun_find_policy_status wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
db9 4bc
01tq+VJgszbp90IjSKE5fw/1XnYwg43qr9xofC/NrQ/uDA2TKuZQDFwrNWX6ivHFUmYF+8DC
5StaWpQ7NnaS/g2Qfgb0ebSSpts/gkEIRxLf+EGUwieIQjAQCSjQriQ9T5qdHKrkXHKWmg+H
T6HsL+Z7PaTl8Q7Mf2t7bJLo+yJuWIHQwH3K/Qig5DyZvWPFEmljd8dsjTAt+xvGY1L3iUuw
EGL0XXsb8Rg1dSl5wiordpFyiL5jNFNr5McJvYISCifFXcL6el9DSKKOeesWmK/9CHLKE9uR
MbM1Knm95Raahc/7vmHf4korYyW4JlT9fIF8OFsWM3Vblp8ZpxCo6mtkC0814iY2GS+qcF4d
5mA7Gg2rqZsjUBOEXoHwII6mvtwEaK6VokMV3C+FDUja64UeX+o8guekK7rqlQ5GGsIfLQPA
f1MM5cKxV/TEkHuNGh8FvU2Gi8OkV2JnMt0Kn3TDprGVpw4zpvJ937v/zxqYa8E4djJJoCxz
C9LzS7xAhJXTmAGyAhT4Qa3kf4BB7D4TxIsD4ikIkfX46IznfmL91+6Fb+sgbppOYagBrh5M
4BvlEGd04sCaCRmmDOi3uj2GZUkTTpb9EwB34Ru0iUZUUxMpKAdKi+uMVKcOxfSUAthtWJSL
2SFFc6R9THKI/C4LKsQTMorojVZ5ya4l+uE+rm/Ttz3U9g2FyKaRtrAD5y4AFwpWdskBHgZH
6GG543+RhzSY+8sbqsf0Xet5ZTMHHMfqUcIcaR1J43IzNODZ3y9HRMC4pgt8B2NlFICDNZMm
6kwpclI1i91VHNKI/ec6eciyaB/WQwRVt3F3AIANYGMhJuNUUfsU6EwcOw0L8yQbKABMVrHK
u6a021YBAxyQMSAxuRsMU5bdORNTKYIlJyaP3HxKwHb9Vw6go6L/v9VUjqZ+JsIrS3fvAoZ9
tjjEKqGEE8ldz/3m1H+6jPAKWwnT8oJN9w94x+FtWdPPgJOPyR+6okmR0R3t1+GlRcohJVD2
s0rkJwY/M+K2sl96qaC2rrncUh9CR5O/4mhBBtWbGqC8b6S1nRRVFwZ7+kv8gJt0JOTUepza
7o7q9wcOMgGWiV5uMK7msaGP3yOxwTyUcNfcxDcyxw9+pz2pITYRx+4l+4JJyawEGj3mxu4R
xggezrA6+M61mTNhDMiXO9LXvaplLL/fm9LuLNz8fJE=
/


--
-- F_EMPLOYEE_SETUP  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_employee_setup wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
20e 150
8JVX1393porXX+/5PkVCq4GORxowgztpLUjWfC/NimRTslRRTV5ciftHiLqeF/UEJdxBhXfl
94PLc/iD80Yhnrqa4Pi5OlUSsCPx/1SsjCyariAsJIZ9JMZku7Ya4aY50C4e9l6ve00g8pH3
6SKMHlhwFlT8rCyv9R+NPbUfwJKJQwbL8tiy6ZDL/hakTQM+kzXleHsZ/jOUf0V6Enxdinoh
vJQFG3bsEwIFRE9ifbQiEZF0zdcNL4qnfa/rXMJU10S8Wn6GGRtE4cK8xXHujc0m4R/y4BjE
HPlCW/qf5vGu5J3WyUL9jr74JEx0Gz3XIpsHD7IRwGo=
/


--
-- F_EMP_GID_TO_DESIG  (Function) 
--
CREATE OR REPLACE FUNCTION INS.f_emp_gid_to_desig wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
285 185
qgQYAbSeWZ6PFL476UF1V24qKGYwg5AJLdxqfC8BM+porOxWdNiU1i2W9GNddq3cDOi6o+XL
TVqltRXctkmOb1OVvBK7GQMQ0SMJGVSs6iK87U4pz49ymSxKLMG2kdrR8MljOEmQ5RoSR0Sm
V9LtjMO2wm09pAvrwtT/iagKcYKLPxEIOBl8Kv5SVWC8pn/UgqdA4Kh55vVUjJtLJ26mdep8
Xc2DIfsCA9d4tYgx6n24s3SxI/Iux5HE//K1j2gwd59n5AKgtFiPiYmZQfIpMk4KbrkBkMGG
BY9tFd/c6RQ+4cLYY5xxtEGLhDqmVjzrcMKyTGfGvUjiwAOsxKf9oR3amLv5Y3AdVXM7lKEg
lfwFkQpYRGBGu7ymUR+NHw==
/


--
-- REP_ITAX_REF_GEN  (Function) 
--
CREATE OR REPLACE FUNCTION INS.rep_itax_ref_gen wrapped 
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18e 130
GAtsQ3gQx4eGM9+Qf3ZB3hEjnKYwgwLIAJkVfC9AkPjVSPaeRCRgbYQuluxrJocJsym4TQZm
ZsvL+TD9O6PMCOil8cHXAMxj99wfOUo9N7+wgVjQPUDEPRyipqaC0Ykl05PJpfZvPvre8taF
HUbiFE5H4XkQRXBei6qZZ9IS7Ra+HW/Bfp5Nvn/xBM7PX7Z5vDyygK9OWVcLgVQF3DFdyqOr
zMdOwDdLCqT6SM7yegpMRZHmXJ0ZiwbG8iBEYjyUimJntI3XCQevBxd2CQDuVUs6FlLHJu8h
kyW+4bfFkzs=
/


--
-- FUN_AGENT_ORG_SETUP  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_AGENT_ORG_SETUP FOR INS.FUN_AGENT_ORG_SETUP;


--
-- FUN_CLIENT_PERSONAL_INFO  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_CLIENT_PERSONAL_INFO FOR INS.FUN_CLIENT_PERSONAL_INFO;


--
-- FUN_COMM_CALC_ST  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_COMM_CALC_ST FOR INS.FUN_COMM_CALC_ST;


--
-- F_EMPLOYEE_SETUP  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMPLOYEE_SETUP FOR INS.F_EMPLOYEE_SETUP;


--
-- F_EMP_GID_TO_DESIG  (Synonym) 
--
CREATE PUBLIC SYNONYM F_EMP_GID_TO_DESIG FOR INS.F_EMP_GID_TO_DESIG;


--
-- REP_ITAX_REF_GEN  (Synonym) 
--
CREATE PUBLIC SYNONYM REP_ITAX_REF_GEN FOR INS.REP_ITAX_REF_GEN;


--
-- FUN_EMP_APPOINTED_DESIG  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_EMP_APPOINTED_DESIG FOR INS.FUN_EMP_APPOINTED_DESIG;


--
-- FUN_FA_ORGANOGRAM  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FA_ORGANOGRAM FOR INS.FUN_FA_ORGANOGRAM;


--
-- FUN_FA_ORGANOGRAM_NEW  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FA_ORGANOGRAM_NEW FOR INS.FUN_FA_ORGANOGRAM_NEW;


--
-- FUN_FIND_POLICY_STATUS  (Synonym) 
--
CREATE PUBLIC SYNONYM FUN_FIND_POLICY_STATUS FOR INS.FUN_FIND_POLICY_STATUS;


GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO APPADMIN WITH GRANT OPTION;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO APPADMIN WITH GRANT OPTION;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO INS_WEB;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO INS_WEB;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO INS_WEB;

GRANT EXECUTE ON INS.FUN_PAIDUP_VALUE TO INS_WEB;

GRANT EXECUTE ON INS.FUN_SURRENDER_VALUE TO INS_WEB;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO INS_WEB;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO INS_WEB;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.F_BANK TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACCTUAL_BANK_DEPOSIT;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_GROUP TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_DIVISION TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_PARTY_NAME_CONCAT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_THANA TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_AGE;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_INS_TP_CD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_GROUP TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_DIVISION TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_PARTY_NAME_CONCAT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_THANA TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.FUN_TOP_SHEET_ACC TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.F_GL_SL_TO_CODE TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_AUDITOR;

GRANT EXECUTE ON INS.FUN_DIVERT_GL_NO TO RL_ACC_BANK;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_BANK;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_BANK;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_BANK;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_BANK;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_ACC_BANK;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_BANK_REC;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_BANK_REC;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_BANK_REC;

GRANT EXECUTE ON INS.REP_F_PARTY_NAME TO RL_ACC_BANK_REC;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_ACC_CASH_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_TOP_SHEET_ACC TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_GL_SL_TO_CODE TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.REP_F_DIVDEPT TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_CEN_HEADOFF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_CEN_HEADOFF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_CEN_HEADOFF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.F_BR_BANK TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_CLAIM_DETL TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_CHEQ_ISSU;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_CH_HEAD;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_INS_TP_CD TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_TOP_SHEET_ACC TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_BR_BANK TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_GL_SL_TO_CODE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_CLAIM_DETL TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_INVEST_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_INVEST_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_DIVISION TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.F_THANA TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_INS_TP_CD TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_LNRECV_INTRST_AMT TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_LNRECV_PRINC_AMT TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_ORG;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_PARTY TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_OROCESS_ORG;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_POLICY_LOAN;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_PRF;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_PRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_PRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_PRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_PROCESS;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_DIVERT_GL_NO TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_GL_CPF_SUBR_HEAD_OPENING TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_GL_SUBR_HEAD_OPENING TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_LNRECV_INTRST_AMT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_LNRECV_PRINC_AMT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_TOP_SHEET_ACC TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_BR_BANK TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_DIVISION TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_GL_SL_TO_CODE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_PARTY_NAME_CONCAT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_CLAIM_DETL TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_RPT_ICD;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_TOP_SHEET_ACC TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_GL_SL_TO_CODE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_PARTY_NAME_CONCAT TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_THANA TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_SALARY_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_SALARY_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_SALARY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.FUN_PRE_POLICY_INFO TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.REP_ITAX_REB_PAID_PREM TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.REP_ITAX_REF_NO TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_INS_TP_CD TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE_DT TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_DIVDEPT TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY_NAME TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_ACC_TRF_IT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_INS_TP_CD TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_BANK TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_DESIG TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_ACC_TRIAL_BLANCE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ACC_TRIAL_BLANCE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ACC_TRIAL_BLANCE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_TRIAL_BLANCE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_ACC_TRIAL_BLANCE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ACC_TRIAL_BLANCE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ACC_ZONE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_ACC_ZONE;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_ACC_ZONE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ACC_ZONE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE TO RL_ACTUARY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_ACTUARY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ADDRESS_ALT_APPLICATION;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ADDRESS_ALT_APPLICATION;

GRANT EXECUTE ON INS.F_THANA TO RL_ADDRESS_ALT_APPLICATION;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ADDRESS_ALT_APPLICATION;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ADDRESS_ALT_APPLICATION;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_DESIG TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_EMPLOYMENT_TP TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG_CD TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.REP_F_DIVDEPT TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ADMIN_LOAN;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_DESIG TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_THANA TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ADMIN_PF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG_CD TO RL_ADMIN_PF;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_DESIG TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG_CD TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.F_BANK TO RL_AGENT_LICENSE_INFO_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_AGENT_LICENSE_INFO_RPT;

GRANT EXECUTE ON INS.F_DEGREE TO RL_AGENT_LICENSE_INFO_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_AGENT_LICENSE_INFO_RPT;

GRANT EXECUTE ON INS.FUN_ASGN_COMM_DATE TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_NOMINEE_NAME TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ALTERATION_APPLICATION_TRF;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_DOCUMENT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_FORM_TP TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_HABIT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_LIEN_TP TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_MARITAL_STATUS TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_OCCU_CLASS TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_OCCU_SCOPE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_LNRECV_INTRST_AMT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_LNRECV_PRINC_AMT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE_DT TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PRE_POLICY_INFO TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_SURRENDER_VALUE TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_AUDIT;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_BANK TO RL_AUDIT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_AUDIT;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DESIG TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DIAG_TEST TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DIVISION TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DM_GID TO RL_AUDIT;

GRANT EXECUTE ON INS.F_DOCUMENT TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMPLOYMENT_TP TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_CD_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_AUDIT;

GRANT EXECUTE ON INS.F_MUNILOC_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_AUDIT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.F_OVERWCAT TO RL_AUDIT;

GRANT EXECUTE ON INS.F_PARTY TO RL_AUDIT;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_AUDIT;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_AUDIT;

GRANT EXECUTE ON INS.F_THANA TO RL_AUDIT;

GRANT EXECUTE ON INS.F_UNIT TO RL_AUDIT;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_ITAX_REB_PAID_PREM TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_ITAX_REF_NO TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_SUPP_BEN_SN TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_AUTH;

GRANT EXECUTE ON INS.F_OFFICE TO RL_AUTH;

GRANT EXECUTE ON INS.F_BANK TO RL_BANK_BRANCH_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.F_BANK TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.F_BRANCH TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_BANK_INTEREST_TAX_SCHEDULE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_BANK_RECON_PAYMENT_ADVICE;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FA_EMP_TYPE_EMP_GID TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_GROUP TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_BANK TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_DESIG TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_DIVISION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_PARTY TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_PARTY_NAME_CONCAT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_THANA TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_CAHSIAR;

GRANT EXECUTE ON INS.REP_F_SUPPILER TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_CASHIER_02;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CASHIER_02;

GRANT EXECUTE ON INS.F_BANK TO RL_CASHIER_02;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CASHIER_02;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CASHIER_02;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_CASHIER_02;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CASHIER_02;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_CASHIER_02;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CASHIER_02;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CASHIER_02;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CASH_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CASH_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CASH_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CASH_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_CASH_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CASH_RPT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CASH_RPT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CASH_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_CASH_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CHAKING_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_CHAQUE_WRITE_PRINT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CHEAK_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CHEAK_TRF;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_CHEAK_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CHEQUE_ISSU_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE_DT TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.F_BANK TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CHEQUE_TRF_HEAD;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_BANK TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CLAIM_ACC_HEAD;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_CLAIM_APPLICATION_APPROVAL;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_CLAIM_APPLICATION_APPROVAL;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_APPLICATION_APPROVAL;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_APPLICATION_APPROVAL;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_CHK_APVL_LVL TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_GET_PRVCD TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_PAY_ORDER_NO TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_CLAIM_APPROVAL;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CLAIM_AUDIT_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_CLAIM_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_NR_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_ONESTOP;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_ONESTOP;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_ONESTOP;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_ONESTOP;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.F_CLM_PARTY_NM TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.F_CLM_PAY_BASIS TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.REP_F_PAY_TYPE TO RL_CLAIM_PRF_RPT;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_POLICY_SURRENDERED TO RL_CLAIM_PROSS;

GRANT EXECUTE ON INS.FUN_CLAIMANT_NM TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_CLM_APPL_REQ TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE_CD TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_NR_RECEIVE_DT TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_PAIDUP_VALUE TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_PROJECT_CD TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_PROJECT_NM TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.REP_F_CLAIM_DETL TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.REP_F_PARTY_NAME TO RL_CLAIM_RPT;

GRANT EXECUTE ON INS.FUN_CLM_APPL_REQ TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE_CD TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME_CONCAT TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_PROJECT_CD TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_PROJECT_NM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY_NAME TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_SP_HEAD;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_SP_HEAD;

GRANT EXECUTE ON INS.F_BANK TO RL_CLAIM_SP_HEAD;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CLAIM_SP_HEAD;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_DOCUMENT TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_CATEGORY TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_PAY_ORDER_NO TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_CLM_PARTY_NM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY_NAME TO RL_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_DOCUMENT TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_CATEGORY TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_CLM_PARTY_NM TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.F_THANA TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_CLAIM_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CLIAM_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CLIAM_PRF;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_CLIAM_PRF;

GRANT EXECUTE ON INS.FUN_COMM_BILL_PAYABLE_STAT_NEW TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_BANK TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_DEGREE TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_DM_GID TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_THANA TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_CMS;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS;

GRANT EXECUTE ON INS.F_BANK TO RL_CMS_BILL_DISBUSEMENT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CMS_BILL_DISBUSEMENT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_BILL_DISBUSEMENT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_ILIFE_RECEIPT_NO TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_DESIG TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_CMS_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_PRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_PROCES;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_PROCES_ORG;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_CMS_TRF;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_CMS_TRF;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_CMS_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_BANK TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_BRANCH TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_DESIG TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_TYPE_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_PREM_COLL_RECEIVE_MODE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_CMS_TRR;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_CMS_TRR;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_TRR2;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_TRR2;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CMS_TRR2;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_DESIG TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_DM_GID TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_OFFICE TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_OFFICE TO RL_COLLECTION_LIMITE_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_COLLECTION_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_COLLECTION_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_COLLECTION_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_COLLECTION_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_COLLECTION_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_COLLECTION_RPT;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_DESIG TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_DESIG TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_AMT_TYPE TO RL_DALIL_HEAD_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_DALIL_HEAD_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_DALIL_HEAD_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DALIL_HEAD_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_DALIL_TRF;

GRANT EXECUTE ON INS.FUN_COMM_CAL_DASHBOARD TO RL_DASHBOARD_TRF;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_DASHBOARD_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_DASHBOARD_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DASHBOARD_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DATA_ENTRY_INFORMATION_RPT;

GRANT EXECUTE ON INS.FUN_CLM_APPL_REQ TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE_CD TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_BANK TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.F_THANA TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_DEATH_CLAIIM_RFT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_DEATH_CLAIM_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEATH_CLAIM_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_DEATH_CLAIM_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEATH_CLAIM_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_DEATH_CLAIM_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_DEATH_CLAIM_INCHARGE;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEATH_CLAIM_TRF;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_DEPUTY_CMS_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_THANA TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEPUTY_LICEN_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEPUTY_LICEN_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_DEPUTY_LICEN_TRF;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.REP_SUPP_BEN_SN TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.F_OVERWCAT TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_ILIFE_RECEIPT_NO TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEPUTY_UPDATE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DES_PRF_FILE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DES_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DES_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_DES_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_DES_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_DES_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_DES_TRF;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_DES_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_DES_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DES_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_DES_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DES_TRF;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_COMM_BILL_PAYABLE_STAT_NEW TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_DEV_HEAD_ACC;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_EMP_TARGET TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_MOD_PERSISTENCE_RATE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_THANA TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_DEV_PERSONAL_INF_UPDATE_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEV_PERSONAL_INF_UPDATE_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_DEV_PERSONAL_INF_UPDATE_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_OFFICE TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_DOCUMENT_CHECKING_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DOCUMENT_CHECKING_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_DOCUMENT_CHECKING_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DRAF_SHEET;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_DRAF_SHEET;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_DRAF_SHEET;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_DRAF_SHEET;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_DRAF_SHEET;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_DRAF_SHEET;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_DRC_TRF;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_DRC_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_DRC_TRF;

GRANT EXECUTE ON INS.REP_F_EMPLOYMENT_TP TO RL_DRC_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.FUN_FA_EMP_TYPE_EMP_GID TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_EMP_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_EMP_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.FUN_FA_EMP_TYPE_EMP_GID TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_FA_ORGANOGRAM_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_FA_ORGANOGRAM_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_FA_ORGANOGRAM_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_FA_ORGANOGRAM_TRF;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.F_BANK TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.F_BRANCH TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.F_DEGREE TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.F_DESIG TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.F_OFFICE TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_FA_ORG_AGENT_PER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.F_OFFICE TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_FILE_TRAKING;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_FPR_REGISTER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_FPR_REGISTER;

GRANT EXECUTE ON INS.F_OFFICE TO RL_FPR_REGISTER;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_FPR_REGISTER;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_FPR_REGISTER;

GRANT EXECUTE ON INS.FUN_CHILD_FOUND TO RL_GEN_LOGIN;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_GEN_LOGIN;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.FUN_GRA_HEAD_OPENING TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.FUN_VOUCH_GF_PAYMENT_AMT TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG_CD TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_GRATU_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.REP_SUPP_BEN_SN TO RL_GROUP_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_GROUP_PROCESS;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_GROUP_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_GROUP_TRF;

GRANT EXECUTE ON INS.FUN_EMP_DEGREE_CODE TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_INS_INSURANCE_COMPANY TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_SALARY_HEAD TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_SECTION_NM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_DEGREE TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_EMP_BLOOD_GRP TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_EMP_TRAINING TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_F_DIVDEPT TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_ACC_COA_NM TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_BANK TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.REP_F_ACC_COA_NM TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ICD_ACC_FUND_OTHERS;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_TOP_SHEET_ACC TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_GL_SL_TO_CODE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_ICD_GEN_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.FUN_PRE_POLICY_INFO TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.REP_ITAX_REB_PAID_PREM TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.REP_ITAX_REF_NO TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_AUDIT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_CASH;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_INCHARGE_CASH;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_INCHARGE_CASH;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_INCHARGE_CASH;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.F_BANK TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.F_BRANCH TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_INCHARGE_CHEQUE_ACC;

GRANT EXECUTE ON INS.FUN_CLAIMANT_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_DOCUMENT TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_CATEGORY TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_TP_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_NR_RECEIVE_DT TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE_DT TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_BANK TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_BR_BANK TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_CLM_PARTY_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_THANA TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_CLAIM_DETL TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_INCHARGE_COLLECTION;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_INCHARGE_COLLECTION;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_COLLECTION;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_INCHARGE_COLLECTION;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_INCHARGE_COLLECTION;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.F_DESIG TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_ILIFE_RECEIPT_NO TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_DOCUMENT TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_CATEGORY TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_POLICY_SURRENDERED TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_CLM_PARTY_NM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_DESIG TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.F_THANA TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_CLAIMANT_NM TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.FUN_NR_RECEIVE_DT TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_DESIG TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.REP_F_CLAIM_DETL TO RL_INCHARGE_IT_DEPUTY;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_EMP_TARGET TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_MOD_PERSISTENCE_RATE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_DESIG TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_DIVISION TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_THANA TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_MONITORING;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_PR;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_INCHARGE_PR;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_INCHARGE_PR;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_INCHARGE_PR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_PR;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_INCHARGE_UNDER;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_DESIG TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_PARTY TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.F_THANA TO RL_INCHARGE_UNDER_DEPUTY;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.F_BANK TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.F_BRANCH TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_IT_HEAD_OFFICE_PRO;

GRANT EXECUTE ON INS.F_DESIG TO RL_LEAVE_APPLICATION;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_LEAVE_APPLICATION;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_LEAVE_APPLICATION;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LEAVE_APPLICATION;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_LEAVE_APPLICATION;

GRANT EXECUTE ON INS.F_BANK TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_DEGREE TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_DIVISION TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.F_BRANCH TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.F_DEGREE TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.F_DESIG TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_BANK TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_BRANCH TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_DESIG TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_DIVISION TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.F_THANA TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.F_DESIG TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_LOAN_APPLI_APPROV_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_LOAN_APP_APPR_DISBUS_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_LOAN_PARA;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_LOAN_PARA;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_LOAN_PARA;

GRANT EXECUTE ON INS.FUN_POL_LOAN_TYPE TO RL_LOAN_PARA;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_LOAN_PARA;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MB_AGENT_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MEDIA_NO_USE_INFORMATION;

GRANT EXECUTE ON INS.F_DESIG TO RL_MEDIA_NO_USE_INFORMATION;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MEDIA_NO_USE_INFORMATION;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_MIGRATED_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MIGRATE_INVALID;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.FUN_EMP_TARGET TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.FUN_MOD_PERSISTENCE_RATE TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_MIS_FA_LIFE_RPT;

GRANT EXECUTE ON INS.FUN_DEFFRED_PREMIUM TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.FUN_FIRST_PREMIUM TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.FUN_NO_OF_FIRST_PREMIUM TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.FUN_SUM_ASSURED_IN_THOUSAND TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MIS_RPT_ACC;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_DEFFRED_PREMIUM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_EMP_TARGET TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIRST_PREMIUM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_MOD_PERSISTENCE_RATE TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_NO_OF_FIRST_PREMIUM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_SUM_ASSURED_IN_THOUSAND TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.F_PREM_COLL_RECEIVE_MODE TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_MIS_TRF_RPT;

GRANT EXECUTE ON INS.FUN_DEFFRED_PREMIUM TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_FIRST_PREMIUM TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_NO_OF_FIRST_PREMIUM TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_SUM_ASSURED_IN_THOUSAND TO RL_MIS_TRR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_MIS_TRR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_MIS_TRR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MIS_TRR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_MIS_TRR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_MIS_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_MIS_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_MIS_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MIS_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MOBILE_APPS_RPT;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_MOBILE_APPS_RPT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_MOBILE_APPS_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MOBILE_APPS_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MOBILE_DATA_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_DIVISION TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_MUNILOC_NM TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MODHUMOTI_AGENT_BANKING_TRF;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_DESIG TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_PARTY TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.F_THANA TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_AMT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.F_BANK TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_NB_FPR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_FPR;

GRANT EXECUTE ON INS.F_DIVISION TO RL_NB_FPR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_NB_FPR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_NB_FPR;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_NB_FPR;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_FPR;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_DESIG TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_DIVISION TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_PARTY TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_NB_ORG;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_NB_ORG;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_AGENT_DO TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_DM_GID TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_FORM_TP TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_NB_PRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_DOCUMENT TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_FORM_TP TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_HABIT TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_LIEN_TP TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_MARITAL_STATUS TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_OCCU_CLASS TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_OCCU_SCOPE TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_NB_PRF1;

GRANT EXECUTE ON INS.F_DIAG_TEST TO RL_NB_PRF1;

GRANT EXECUTE ON INS.F_OVERWCAT TO RL_NB_PRF1;

GRANT EXECUTE ON INS.F_UNIT TO RL_NB_PRF1;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_NB_PRF2;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_NB_PRF2;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE TO RL_NB_PRF2;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_NB_PRF2;

GRANT EXECUTE ON INS.F_DOCUMENT TO RL_NB_PRF2;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_NB_PRR;

GRANT EXECUTE ON INS.FUN_REBATE_CAL_TP TO RL_NB_PRR;

GRANT EXECUTE ON INS.F_UNIT TO RL_NB_PRR;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_NB_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_NB_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_NB_TRR;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_NB_TRR;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_NB_TRR;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_NB_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_NB_TRR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_NB_TRR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_NB_TRR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_NB_TRR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_NB_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_NB_TRR;

GRANT EXECUTE ON INS.F_THANA TO RL_NB_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_NB_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_NB_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_NB_TRR;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_NEW_BUSINESS_PARA;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_NEW_BUSINESS_PARA;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE TO RL_NEW_BUSINESS_PARA;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_NEW_BUSINESS_PARA;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_NR_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_NR_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_NR_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_NR_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_OFF_WISE_CLAIM_PAYMENT_RPT;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_DESIG TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_DIVISION TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_OPERATOR;

GRANT EXECUTE ON INS.F_THANA TO RL_OPERATOR;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_OPERATOR;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_OTHER_COLLECTION_APR_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_OTHER_COLLECTION_APR_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_OTHER_COLLECTION_APR_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PAYROLL_PRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PAYROLL_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PAYROLL_PRF;

GRANT EXECUTE ON INS.F_SAL_EARN_NM TO RL_PAYROLL_PRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PAYROLL_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_PERSONAL_INFORMATION_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PERSONAL_INFORMATION_RPT;

GRANT EXECUTE ON INS.F_DEGREE TO RL_PERSONAL_INFORMATION_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PERSONAL_INFORMATION_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PERSONAL_INFORMATION_UPDATE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PERSONAL_INFORMATION_UPDATE;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PERSONAL_INFORMATION_UPDATE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PERSONAL_INF_APP_APPROV_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PERSONAL_INF_APP_APPROV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_PERSONAL_INF_APP_APPROV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_PERSONAL_INF_APP_APPROV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_PERSONAL_INF_APP_APPROV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_PERSONAL_INF_APP_APPROV_TRF;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PF_GF_APPROVAL;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PF_PRF;

GRANT EXECUTE ON INS.FUN_CPF_GL_HEAD_OPENING TO RL_PF_TR;

GRANT EXECUTE ON INS.FUN_CPF_LEADGER_OPENING TO RL_PF_TR;

GRANT EXECUTE ON INS.FUN_PF_GL_HEAD_OPENING TO RL_PF_TR;

GRANT EXECUTE ON INS.FUN_PF_VOUCHER_PAYMENT_AMT TO RL_PF_TR;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_PF_TR;

GRANT EXECUTE ON INS.F_BANK TO RL_PF_TR;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PF_TR;

GRANT EXECUTE ON INS.F_DESIG TO RL_PF_TR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PF_TR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PF_TR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PF_TR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PF_TR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PF_TR;

GRANT EXECUTE ON INS.F_VOUCH_NM TO RL_PF_TR;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_PF_TR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_PF_TR;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PF_TR;

GRANT EXECUTE ON INS.REP_F_DIVDEPT TO RL_PF_TR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PF_TR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PF_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_PF_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PF_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PF_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PF_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PF_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PF_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_PF_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_PF_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_PF_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PF_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PF_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PIR_PRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.F_THANA TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_PIR_TRDC;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_PIR_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_PIR_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_PIR_TRR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PIR_TRR;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PIR_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PIR_TRR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PIR_TRR;

GRANT EXECUTE ON INS.F_THANA TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_PIR_TRR;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_EMP_DEGREE_CODE TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_BANK TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_DEGREE TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_BLOOD_GRP TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_ADM_DEPUTY;

GRANT EXECUTE ON INS.F_EMPLOYMENT_TP TO RL_PMIS_ADM_PRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_ADM_PRF;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_PMIS_ADM_PRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.FUN_EMP_EDU_QUALIFICATION_NAME TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_INSURANCE_COMPANY TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_DEGREE TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_EMP_BLOOD_GRP TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_EMP_TRAINING TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.F_THANA TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_PRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_PRF;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_PRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_PMIS_DEV_PRF;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_PMIS_DEV_SP_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_BANK TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_DEGREE TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_DIVISION TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.F_THANA TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_EMP_TYPE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_BANK TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_DEGREE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_DESIG TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_DIVISION TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_THANA TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PMIS_DEV_UTILI_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_DEV_UTILI_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PMIS_DEV_UTILI_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_DIVISION TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_EMP_CD_NM TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_MUNILOC_NM TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.F_THANA TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.F_THANA TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_POLICY_ALT_TF;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.F_PARTY TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.REP_SUPP_BEN_SN TO RL_POLICY_DALIL_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_POLICY_DOC_PRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_AMT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_DESIG TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_DIVISION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_PARTY TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_THANA TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_DUE_DT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_INS_POLICY_NO_TO_PGID TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_LAST_DUE_DT TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.REP_SCHEDULE_HELP TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_POLICY_DOC_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_FA_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_POLICY_INF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_POLICY_INF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_POLICY_INF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_INF;

GRANT EXECUTE ON INS.F_THANA TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_POLICY_INF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_POLICY_INF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_INF_CORRECTION_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_POLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_TYPE TO RL_POLICY_LOAN_PRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_POLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_LOAN_PROCESS;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_LNRECV_INTRST_AMT TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_LNRECV_PRINC_AMT TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE_DT TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_SATT_AMT_MAT TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.F_PROJECT_NM TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_POLICY_LOAN_RPT;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_LAST_REC_DATE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_PAIDUP_VALUE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_SURRENDERED TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_SCHEDULE_DT TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_TYPE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_SETTELMENT_PAIDUP_VALUE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_POLICY_LOAN_TRF;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.FUN_INS_NEXT_PREM_DT TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.FUN_INS_RELATION TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.F_THANA TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_RELATION TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_POLICY_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POLICY_SCHEDULE_DATE_GEN;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_POL_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_POL_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_POL_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_TYPE TO RL_POL_LOAN_PRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_POL_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_POL_SCHEDULE_CHANGE;

GRANT EXECUTE ON INS.F_THANA TO RL_POL_SCHEDULE_CHANGE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_POL_SCHEDULE_CHANGE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_POL_SCHEDULE_CHANGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_PREMIUIM_COLLECTION_REPORT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PREMIUM_COLL_SUMMARY_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PREMIUM_COLL_SUMMARY_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_PREMIUM_COLL_SUMMARY_RPT;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PR_APP_APPRO_DISBUR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PR_APP_APPRO_DISBUR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_APP_APPRO_DISBUR;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_PR_APP_APPRO_DISBUR;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_PR_APP_APPRO_DISBUR;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_PR_CLAIM;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_PR_DEP_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_PR_MANAGEMENT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_MANAGEMENT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_PR_MANAGEMENT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PR_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PR_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PR_RPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_PR_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PR_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_STATUS_VIEW;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PR_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PR_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PR_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_PR_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PR_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PR_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_PR_TRF_OFFICE;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_EMP_TARGET TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_MOD_PERSISTENCE_RATE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_PIR_STAMP_CALCULATION TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_PGID_PR_NO TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_PS_MD;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_PS_MD;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_PS_MD;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_PS_MD;

GRANT EXECUTE ON INS.F_BANK TO RL_PS_MD;

GRANT EXECUTE ON INS.F_BRANCH TO RL_PS_MD;

GRANT EXECUTE ON INS.F_DEGREE TO RL_PS_MD;

GRANT EXECUTE ON INS.F_DESIG TO RL_PS_MD;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_PS_MD;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_PS_MD;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_PS_MD;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_PS_MD;

GRANT EXECUTE ON INS.F_OFFICE TO RL_PS_MD;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_PS_MD;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_INSURANCE_COMPANY TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_REIINSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_REINSURANCE_PROCESS;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_INSURANCE_COMPANY TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.REP_SUPP_BEN_SN TO RL_REINSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_REPRINT_APPROVAL_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_REPRINT_APPROVAL_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_REPRINT_APPROVAL_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_REPRINT_APPROVAL_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_REPRINT_APPROVAL_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_REPRINT_REQUSITION;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_REPRINT_REQUSITION;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_REPRINT_REQUSITION;

GRANT EXECUTE ON INS.F_OFFICE TO RL_REPRINT_REQUSITION;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_REPRINT_REQUSITION;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_INSURANCE_COMPANY TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.REP_SUPP_BEN_SN TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_GENDER TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_INSURANCE_COMPANY TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_RE_INSURANCE_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_RLACC_INCHARGE_SER_POINT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_RLACC_INCHARGE_SER_POINT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_RLACC_INCHARGE_SER_POINT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_RLACC_INCHARGE_SER_POINT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_RLACC_RPT_ICT;

GRANT EXECUTE ON INS.F_BANK TO RL_RLACC_RPT_ICT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_RLACC_RPT_ICT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_RLACC_RPT_ICT;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_DM_GID TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_OFFICE TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_RLPOLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_RLPOLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_RLPOLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_POL_LOAN_TYPE TO RL_RLPOLICY_LOAN_PRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_RLPOLICY_LOAN_PRF;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_VOUCHER_INAVAILD_AMT TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.FUN_VOUCHER_PAYMENT_AMT TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_BANK TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_THANA TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_OFFICE_SH_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_RPT_AUDIT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SALARY_APPROVAL;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SALARY_APPROVAL;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SALARY_APPROVAL;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_SALARY_APPROVAL;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_SALARY_APPROVAL;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_SALARY_DEV_INCHARGE;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_TYPE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_INS_RECEIVE_MODE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_SALARY_DEV_TRF;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_SALARY_PROCESS;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SAL_ADMIN_ACC;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SAL_ADMIN_ACC;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SAL_ADMIN_ACC;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.FUN_SALARY_HEAD TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_BANK TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_BRANCH TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_DESIG TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_SAL_DISBURSE_PROCESS;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_DESIG TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_PARTY TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.F_THANA TO RL_SAL_HR_PROSS;

GRANT EXECUTE ON INS.FUN_SALARY_HEAD TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.REP_F_DIVDEPT TO RL_SAL_HR_RPT;

GRANT EXECUTE ON INS.FUN_CHILD_FOUND TO RL_SEC_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SEC_RPT;

GRANT EXECUTE ON INS.F_DESIG TO RL_SEC_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SEC_RPT;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_CATEGORY TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_LAPSE_YR TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_LAPSE_YR_TP TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_CLAIM_CAUSE TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_CLAIM_DETL TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_CLM_CAUSE_NM TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_CLM_PARTY_NM TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_PRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_SER_PRF;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_SER_PRF;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SER_REP;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_SER_REP;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_REP;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_SER_REP;

GRANT EXECUTE ON INS.F_THANA TO RL_SER_REP;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_SER_REP;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SER_REP;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_SER_REPORT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SER_REPORT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SER_REPORT;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SER_REPORT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_REPORT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_SER_REPORT;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_SER_REPORT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SER_REPORT;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_ILIFE_RECEIPT_NO TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_SER_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_SER_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SER_TRF_CMS;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_SER_TRF_ICD;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_SER_TRF_ICD;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_SER_TRF_ICD;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.FUN_COM_EARN_TYPE TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.F_THANA TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_ILIFE_RECEIPT_NO TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_SER_TRF_ORG;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_PREM_COLL_RECEIPT_NO TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.GET_POLICY_NO TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_ACTIVITY_NM TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_AGE_PROOF_DOCUMENT TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.REP_F_SALUTATION TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SP_HEAD_UNDER;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_DEFAULT_INSU_TYPE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_GEN_QUES_TP TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_ILIFE_RECEIPT_NO TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_REQ TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_LAST_DUE_DATE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_MOBILE_NUMBER_VAL TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_POLICY_INFO_UPD_ST TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_POLICY_SURRENDERED TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_PROJECT_SETUP_CHECK TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_RECEIVED_DOCUMENT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_DESIG TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_PARTY TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.F_THANA TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_DOCUMENT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_EDU_QUALIFICATION TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_INCOME_SOURCE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_MARITAL_STATUS TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_GROUP TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_FUN_PARTY_NAME TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_CLAIM_CAUSE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DESIG TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.REP_F_PARTY TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_GL_HEAD_OPENING TO RL_SUMMARY_BANK_RECONCILE_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_SUMMARY_BANK_RECONCILE_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_SUMMARY_BANK_RECONCILE_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SUMMARY_BANK_RECONCILE_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_SUR_PRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_SUR_PRF;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_SUR_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_SUR_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_SUR_RPT;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_SUR_RPT;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_SUR_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_OFFICE_CD TO RL_SUR_RPT;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_LOAN_RECO_LOCKING TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_SETTELMENT_PAIDUP_VALUE TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_VOUCHER TO RL_SUR_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_SUR_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_SUR_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_SUR_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PRODUCT TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_F_BANK TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_F_BRANCH TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_SUR_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_SUR_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_TEST;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_TEST;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_TEST;

GRANT EXECUTE ON INS.F_OFFICE TO RL_TEST;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_TEST;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_TEST123;

GRANT EXECUTE ON INS.FUN_LOAN_TP_NM TO RL_TEST123;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_TEST123;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_TEST123;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_TEST123;

GRANT EXECUTE ON INS.F_OFFICE TO RL_TEST123;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_TEST_321;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_TEST_321;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_TEST_321;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_TEST_321;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_TEST_BIPLOB;

GRANT EXECUTE ON INS.FUN_AGENT_OFFICE_CD TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_EMP_TARGET TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_GET_MOBILE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_MOD_PERSISTENCE_RATE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_THANA TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_ACTIVITY_NM TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_DESIG TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_EMP_FILE_NO TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_OFFICE TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.REP_FUN_INS_GENDER TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_TRAINING_HEAD;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_TTTTT;

GRANT EXECUTE ON INS.F_EMPLOYMENT_TP TO RL_UAT;

GRANT EXECUTE ON INS.F_EMP_TP_NM TO RL_UAT;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_UMP_DATA_PROCESS_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE_SH_NM TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.FUN_FIND_HEAD_OFF TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_UNDER_SPE_TRF;

GRANT EXECUTE ON INS.F_AGENT_DO TO RL_UNDER_SPE_TRF;

GRANT EXECUTE ON INS.F_DM_GID TO RL_UNDER_SPE_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UNDER_SPE_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_UNDER_SPE_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UNDO;

GRANT EXECUTE ON INS.FUN_COLL_MEDIA_NO_VALIDATION TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.F_BANK TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_OPTION TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_PAY_MODE TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_FUN_INS_POLICY_STATUS TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_CD TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_UPDATE_PMIS_DEV;

GRANT EXECUTE ON INS.FUN_BUILD_PK TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_CHECK_ANF_LOAN TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_CLM_APPL_REQ TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_POLICY_TYPE_CD TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_POLICY_SURRENDERED TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_SUPP_BENIFIT_PREM TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_SUPP_PRODUCT_PREM TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.F_THANA TO RL_UPDATE_SECTION;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.FUN_PGID_TO_INS_TP_CD TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_BANK TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_BRANCH TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_PRODUCT_CD TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_USER_LOCK;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_USER_LOCK;

GRANT EXECUTE ON INS.F_OFFICE TO RL_USER_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_BRANCH TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_BR_BANK TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_DIVISION TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_UTILITY_TRF;

GRANT EXECUTE ON INS.FUN_CONTROL_OFFICE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SALES_OFF TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_INCHARGE_OFFICE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_OFFICE_INCHARGE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_INS_TP_CD_TO_INS_TP_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_OFFICE_SHNM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_AGENT_LICENSE_NO TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_BANK TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_BRANCH TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_DESIG_SHNM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_EMP_TYPE_CD TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_IN_WORD TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_OFF_CATG_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_OFF_TYPE_CD TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_AGENT_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_DISTRICT TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_DIVISION TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_EMPLOYEE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_ID TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_EMP_TP_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_OFF_CATG_NM TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.REP_F_THANA TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UTLITY_BILL;

GRANT EXECUTE ON INS.F_ELEC_TP_NM TO RL_UTLITY_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UTLITY_PRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_UW;

GRANT EXECUTE ON INS.FUN_FIND_REGIONAL_OFF TO RL_UW;

GRANT EXECUTE ON INS.FUN_FIND_SERVICE_OFF TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_UW;

GRANT EXECUTE ON INS.F_AGENT_NM TO RL_UW;

GRANT EXECUTE ON INS.F_DESIG TO RL_UW;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_UW;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_UW;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_UW;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_UW;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_UW;

GRANT EXECUTE ON INS.F_EMP_NM TO RL_UW;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UW;

GRANT EXECUTE ON INS.F_PARTY TO RL_UW;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_UW;

GRANT EXECUTE ON INS.F_THANA TO RL_UW;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UW_ORG;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UW_ORG;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_UW_ORG;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UW_ORG;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_UW_ORG;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_UW_ORG;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_UW_ORG;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_UW_PRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UW_PRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UW_TR;

GRANT EXECUTE ON INS.FUN_PROPOSAL_NO TO RL_UW_TR;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UW_TR;

GRANT EXECUTE ON INS.REP_F_OFFICE TO RL_UW_TR;

GRANT EXECUTE ON INS.FUN_AGE_PROOF_DOC_ADMITTED TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_ASGN_COMM_DATE TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FOR_ALTER TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_CAL_LATE_FEE_FP TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_CNT_OFF_HRCY TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_FIND_ZONAL_OFFICE TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_DIAG_TEST TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_EDU_QUALIFICATION TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_LIFE_CLASS TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_OCCUPATION TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_OPTION TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_PAY_MODE TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_PROPOSAL_NO TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_STATUS TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_PRODUCT TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_PROPOSAL_NO_TO_PGID TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_REBATE_EXTRA TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_BENIFIT_SHNM TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_SUPP_PRODUCT_SHNM TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_UNIT_OF_MEASURE TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_ORG_OFFICE TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_POLICY_TYPE TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_AGENT_IDRA_CD TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_DESIG TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_DISTRICT TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_DIVDEPT TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_DIVISION TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_EMP_CD TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_EMP_GID TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_EMP_ID TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_OFFICE TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_OFF_CATG_CD TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_PARTY TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_PARTY_NAME TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_PROPOSER_NAME TO RL_UW_TRF;

GRANT EXECUTE ON INS.F_THANA TO RL_UW_TRF;

GRANT EXECUTE ON INS.REP_FUN_CONTROL_OFFICE TO RL_UW_TRF;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_UW_TRF;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.FUN_LAPSE_YR TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.FUN_LAPSE_YR_TP TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.FUN_LOCKED_POLICY_AUTH TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.FUN_PARTY_NAME TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.F_CLM_DETL_NM TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.REP_F_PRODUCT_CD TO RL_VALUATION_RPT_TR;

GRANT EXECUTE ON INS.FUN_INS_PGID_TO_POLICY_NO TO RL_WEB_ADMIN;

GRANT EXECUTE ON INS.FUN_INS_POLICY_NO_TO_PGID TO RL_WEB_ADMIN;

GRANT EXECUTE ON INS.FUN_PAIDUP_VALUE TO RL_WEB_ADMIN;

GRANT EXECUTE ON INS.FUN_SURRENDER_VALUE TO RL_WEB_ADMIN;

GRANT EXECUTE ON INS.F_EMP_TYPE_NM TO RL_WEB_ADMIN;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_ACC_AGE;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_ACC_AGE;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_ACC_AGENCY;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_CASH_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_ACC_INCHARGE_SER;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_NB_AGENCY;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_ORG;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_ACC_ORG_TRF_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_ACC_RPT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_ACC_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_ACC_RPT_ORG;

GRANT EXECUTE ON INS.REP_ITAX_REF_GEN TO RL_ACC_TAX_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_ACC_TRF_ORG;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_ADMIN_OFFICE;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_ADMIN_RPT_IT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_AUDIT;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_AUDIT;

GRANT EXECUTE ON INS.REP_ITAX_REF_GEN TO RL_AUDIT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_BM_COLLECTION_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CAHSIAR;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_CAHSIAR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CASHIER_02;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_CLAIM_RPT_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM_NEW TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_CMC_INCHARGE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_CMS_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CMS_TRF;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_CMS_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_CMS_TRR;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_CMS_TRR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CMS_TRR2;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_CMS_TRR_ALL;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_COMMISSION_BILL_ORG;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_COMSN_ORG;

GRANT EXECUTE ON INS.FUN_FIND_POLICY_STATUS TO RL_DATA_ENTRY_INFORMATION_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_DEPUTY_DEAH_CLAIM;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_DEPUTY_LICEN_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_FIND_POLICY_STATUS TO RL_DEPUTY_UNDER;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_DEPUTY_UNDER_PRF;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_DEV_ADMIN_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM_NEW TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_DEV_EMP_SALARY_BILL_RPT;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_DEV_PERSONAL_INF_UPDATE_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_DEV_SALARY_PROCESS;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_EMPLOYEE_WISE_COLL_SUMM_RPT;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_EMP_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_EMP_WISE_POL_SUM_LIST_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_FPR_REGISTER;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_HR_DEPUTY_RPT;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_HR_DEPUTY_TRF;

GRANT EXECUTE ON INS.REP_ITAX_REF_GEN TO RL_INCHARGE_ACU;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_INCHARGE_CLAIM;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_INCHARGE_COLLECTION;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_INCHARGE_GROUP;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_INCHARGE_IT_CLAIM;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_INCHARGE_LICENSE;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_IT_HEADOFFICE;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_LICENSE_RPT_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_LICENSE_RPT_TRF_CODE;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_LICENSE_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_LICENSE_TRF_CODE;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_LICENSE_TRF_DEPUTY;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_MB_AGENT_NEW_BUSINESS_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_MB_AGENT_NEW_BUSINESS_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_MODHUMOTI_BANK_ACC_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_MODHUMOTI_BANK_NEW_BUSINESS;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_MODHUMOTI_BANK_NEW_BUSI_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_NB_ASSING_DEV_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_FPR;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_NB_ORG;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_NB_ORGOFF_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_ORGOFF_TRR;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_NB_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_NB_TRR;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_OPERATOR;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PERSONAL_INFORMATION_UPDATE;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PERSONAL_INF_EDIT_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PF_TR;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_PIR_TRR;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PMIS_ADM_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PMIS_ADM_TRR;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PMIS_DEV_ADMIN_DEPUTY;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_DEV_ADMIN_INCHARGE;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_DEV_CMS_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PMIS_DEV_COST_RPT;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_DEV_IT_SP;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PMIS_DEV_RPT_MONITOR;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_DEV_TRF;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_PMIS_DEV_TRF_INCHARGE;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_PMIS_DEV_TRPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PMIS_DEV_TRR;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_POLICY_DOC_SERVICE;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_POLICY_REGISTER_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_PROPOSAL_INFORMATION_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_PS_DMD_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_PS_MD;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_RE_INSURANCE_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.F_EMPLOYEE_SETUP TO RL_RLCMS_TRP;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_SALARY_DEV_RPT;

GRANT EXECUTE ON INS.FUN_FIND_POLICY_STATUS TO RL_SEC_RPT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_SEC_RPT;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_SER_DEPUTY_INCHARGE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SER_REP;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SER_REPORT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_SER_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SER_TRF_IT;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SER_UPGRADE_INCHARGE;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_EMP_APPOINTED_DESIG TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_SP_INCHARGE;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_TOP_20_MONITOR;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_UNDER_DEPUTY_TRF;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_UNDER_RPT_INCHARGE;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_UNDER_RPT_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_UNDER_SPE_TRF;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_UPDATE_LEGER_TRF;

GRANT EXECUTE ON INS.FUN_FA_ORGANOGRAM TO RL_UPGREAD_DEPUTY;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_UTILITY_TRF_RPT;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_UW_ORG;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_UW_ORG;

GRANT EXECUTE ON INS.F_EMP_GID_TO_DESIG TO RL_UW_TR;

GRANT EXECUTE ON INS.FUN_AGENT_ORG_SETUP TO RL_UW_TRF;

