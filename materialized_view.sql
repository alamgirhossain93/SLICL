--
-- MV_INS_POLICY_HISTORY  (Synonym) 
--
CREATE PUBLIC SYNONYM MV_INS_POLICY_HISTORY FOR INS.MV_INS_POLICY_HISTORY;


--
-- MV_INS_POLICY_HISTORY  (Materialized View) 
--
CREATE MATERIALIZED VIEW INS.MV_INS_POLICY_HISTORY 
TABLESPACE INS_USERS_TBS
PCTUSED    0
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOCACHE
LOGGING
NOCOMPRESS
NOPARALLEL
BUILD IMMEDIATE
REFRESH FORCE
START WITH TO_DATE('12-Oct-2023 23:00:00','dd-mon-yyyy hh24:mi:ss')
NEXT TRUNC(SYSDATE+1) + 23/24    
WITH PRIMARY KEY
AS 
/* Formatted on 10/12/2023 11:53:36 AM (QP5 v5.115.810.9015) */
SELECT   a.pgid,
         a.comm_date,
         a.office_cd,
         a.policy_no,
         a.installment_premium,
         UPPER (a.party_name) party_name,
         UPPER (n.party_name) nominee_nm,
         UPPER (a.father_name) father_name,
         a.dob,
         UPPER (ad.address) address
  FROM   (SELECT   s.pgid,
                   s.comm_date,
                   s.office_cd,
                   p.policy_no,
                   pr.party_name,
                   pr.father_name,
                   pr.dob,
                   s.installment_premium
            FROM   ins_p_summery s, ins_p_proposal p, ins_p_personal pr
           WHERE   party_cd = '03' AND s.pgid = p.pgid AND s.pgid = pr.pgid)
         a,
         (SELECT   pgid, party_name
            FROM   ins_p_personal
           WHERE   party_cd = '04') n,
         (SELECT   pgid, t_address address
            FROM   ins_p_address
           WHERE   party_cd = '03') ad
 WHERE   a.pgid = n.pgid AND a.pgid = ad.pgid;

COMMENT ON MATERIALIZED VIEW INS.MV_INS_POLICY_HISTORY IS 'snapshot table for snapshot INS.MV_INS_POLICY_HISTORY';

GRANT SELECT ON INS.MV_INS_POLICY_HISTORY TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.MV_INS_POLICY_HISTORY TO RL_SP_INCHARGE;

