/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- DCAV_DOC_RETRIEVAL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.DCAV_DOC_RETRIEVAL
(
   FILE_ID,
   OFFICE_CD,
   DIVDEPT_CD,
   DOC_TP_CD,
   DOC_SUBJ_CD,
   FILE_NM,
   FILE_DESC,
   FILE_TP,
   FILE_CREATE_DT,
   FILE_PHY_LOC,
   REMARKS,
   FILE_SYS_LOC,
   PGID,
   POLICY_NO,
   EMP_GID,
   EMP_NAME,
   EMP_ID
)
AS
   SELECT   d.file_id,
            d.office_cd,
            d.divdept_cd,
            d.doc_tp_cd,
            d.doc_subj_cd,
            d.file_nm,
            d.file_desc,
            d.file_tp,
            d.file_create_dt,
            d.file_phy_loc,
            d.remarks,
            d.FILE_SYS_LOC,
            d.pgid,
            fun_ins_pgid_to_policy_no (d.pgid) policy_no,
            d.emp_gid,
            rep_f_emp_nm (d.emp_gid) emp_name,
            rep_f_emp_id (d.emp_gid) emp_id
     FROM   dca_doc_accumulate d;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- HRMV_OFFICE_SETUP  (View)
--

CREATE OR REPLACE FORCE VIEW INS.HRMV_OFFICE_SETUP
(
   OFFICE_CTRL_CD,
   START_DATE,
   END_DATE,
   OFFICE_CD,
   OFFICE_NM,
   CONTROL_OFFICE_CD,
   CONTROL_OFFICE_NM,
   EMP_GID,
   EMP_ID,
   EMP_NM_ENG,
   STATUS,
   STATUS_NM
)
AS
   SELECT   f.office_ctrl_cd,
            f.start_date,
            f.end_date,
            f.office_cd,
            (SELECT   office_nm
               FROM   hrm_office
              WHERE   office_cd = f.office_cd)
               office_nm,
            f.control_office_cd,
            (SELECT   office_nm
               FROM   hrm_office
              WHERE   office_cd = f.control_office_cd)
               control_office_nm,
            f.emp_gid,
            e.emp_id,
            e.emp_nm_eng,
            f.status,
            (CASE WHEN f.status = '1' THEN 'Active' ELSE 'Inactive' END)
               status_nm
     FROM   hrm_office_setup_hist f, hrm_employee e
    WHERE   f.emp_gid = e.emp_gid(+);


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_CLAIM_PAYMENT  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_CLAIM_PAYMENT
(
   PAYABLE_NO,
   PGID,
   POLICY_NO,
   CALC_NO,
   SUM_ASSURED,
   OFFICE_CD,
   INS_TP_CD,
   PRODUCT_CD,
   SL_NO,
   CLM_CAUSE_CD,
   CLM_DETL_CD,
   BEN_PARTY_CD,
   CHEQUE_RECEIVER_INFO,
   PRODUCT_NM,
   CLM_CAUSE_NM,
   CLM_DETL_NM,
   PARTY_NM,
   GROSS_PAYABLE_AMT,
   BONUS_PAYABLE,
   SUSPENSE_AMT,
   LOAN_DED_AMT,
   OTHER_DED_AMT,
   NET_PAYABLE_AMT,
   PAYMENT_DT,
   LAST_APPROVED_BY,
   LAST_APVL_LEVEL_CD,
   SUPP_PROD_CD,
   SUPP_BEN_CD,
   LAST_APVBY_NM,
   BANK_ACC_NO,
   BANK_CD,
   BRANCH_CD,
   BANK_ADDRESS,
   PAY_ORDER_NO,
   BANK_NM,
   BRANCH_NM,
   BEN_PARTY_NM,
   PAYMENT_TYPE_NM,
   CHEQUE_DT,
   FIRST_CHEQUE_AMT,
   SECOND_CHEQUE_AMT,
   PAYMENT_STATUS,
   SERVICING_OFF,
   CHEQUE_DATE_2ND,
   CHEQUE_NO_2ND,
   BANK_ACC_NO_2ND,
   BANK_CD_2ND,
   BR_CD_2ND,
   DISB_ACC_NO_2ND,
   DISB_BANK_CD_2ND,
   DISB_BR_CD_2ND,
   DISB_BANK_CD,
   DISB_BR_CD,
   DISB_ACC_NO,
   PAYMENT_STATUS_2ND,
   CHEQUE_NO_PREM,
   CHEQUE_DT_PREM,
   PREMIUM_AMT,
   APPROVED_DT,
   ALT_DUE_AMOUNT
)
AS
   SELECT   p.payable_no,
            p.pgid,
            fun_ins_pgid_to_policy_no (p.pgid) policy_no,
            p.calc_no,
            s.sum_assured,
            NVL (p.control_office_cd, s.servicing_off) office_cd,
            s.ins_tp_cd,
            p.product_cd,
            p.sl_no,
            p.clm_cause_cd,
            p.clm_detl_cd,
            p.ben_party_cd,
            p.cheque_receiver_info,
            (SELECT   product_nm
               FROM   ins_product
              WHERE   product_cd = p.product_cd)
               product_nm,
            (SELECT   clm_cause_nm
               FROM   clm_claim_cause
              WHERE   clm_cause_cd = p.clm_cause_cd)
               clm_cause_nm,
            (SELECT   clm_detl_nm
               FROM   clm_claim_cause_detl
              WHERE   clm_detl_cd = p.clm_detl_cd
                      AND clm_cause_cd = p.clm_cause_cd)
               clm_detl_nm,
            (SELECT   party_nm
               FROM   clm_party
              WHERE   party_cd = p.ben_party_cd)
               party_nm,
            p.gross_payable_amt,
            p.bonus_payable,
            p.suspense_amt,
            p.loan_ded_amt,
            p.other_ded_amt,
            p.net_payable_amt,
            p.payment_dt,
            p.last_approved_by,
            p.last_apvl_level_cd,
            p.supp_prod_cd,
            p.supp_ben_cd,
            (SELECT   emp_nm_eng
               FROM   hrm_employee
              WHERE   emp_gid = p.last_approved_by)
               last_apvby_nm,
            p.bank_acc_no,
            p.bank_cd,
            p.branch_cd,
            p.bank_address,
            NVL (p.cheque_no, p.pay_order_no) pay_order_no,
            rep_f_bank (p.bank_cd) bank_nm,
            rep_f_branch (p.branch_cd) branch_nm,
            (SELECT   party_name
               FROM   ins_p_personal
              WHERE       pgid = p.pgid
                      AND party_cd = p.ben_party_cd
                      AND sl_no = 1)
               ben_party_nm,
            (SELECT   pay_type_nm
               FROM   clm_payment_type
              WHERE   pay_type_cd = p.payment_type)
               payment_type_nm,
            p.cheque_dt,
            (  p.net_payable_amt
             - NVL (p.off_manual_ded_amt, 0)
             - NVL (p.prem_due_late_fee, 0))
               first_cheque_amt,
            NVL (p.off_manual_ded_amt, 0) second_cheque_amt,
            -----added by parama biswas on 08/11/2015----------
            NVL (p.payment_status, 'N') payment_status,
            s.servicing_off,
            p.cheque_date_2nd,
            p.cheque_no_2nd,
            p.bank_acc_no_2nd,
            p.bank_cd_2nd,
            p.br_cd_2nd,
            p.disb_acc_no_2nd,
            p.disb_bank_cd_2nd,
            p.disb_br_cd_2nd,
            p.disb_bank_cd,
            p.disb_br_cd,
            p.disb_acc_no,
            p.payment_status_2nd,
            p.cheque_no_prem,
            p.cheque_dt_prem,
            p.prem_due_late_fee premium_amt,
            p.approved_dt,
            ALT_DUE_AMOUNT
     FROM   clm_claim_payable_gen p, ins_p_summery s
    WHERE   NVL (p.approved_flag, 'N') = 'Y' --AND NVL (p.payment_status, 'N') = 'N'
                                            AND p.pgid = s.pgid;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_CLAIM_PRIVILEGE  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_CLAIM_PRIVILEGE
(
   PRV_CD,
   MAX_SUM_ASSURED,
   PRV_TP,
   PRV_STRENGTH,
   ACCEPTENCE_REQ,
   EMP_GID,
   EMP_NM_ENG,
   DB_USER,
   OFFICE_CD
)
AS
   SELECT   g.prv_cd,
            g.max_sum_assured,
            g.prv_tp,
            g.prv_strength,
            g.acceptence_req,
            e.emp_gid,
            e.emp_nm_eng,
            e.db_user,
            f.office_cd
     FROM   clm_privilege g, clm_privilege_emp e, clm_privilege_office f
    WHERE   g.prv_cd = e.prv_cd AND g.prv_cd = f.prv_cd;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_COMMUTE_APPROVAL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_COMMUTE_APPROVAL
(
   PGID,
   POLICY_NO,
   APP_SL,
   APP_DATE,
   PARTY_CD,
   INS_TP_CD,
   POLICY_STATUS,
   MATURITY_DATE,
   SUM_ASSURED,
   AGE_ENTRY,
   CURR_AGE,
   TERM,
   COMM_DATE,
   OFFICE_CD,
   PRODUCT_CD,
   COMMUTATION_DT,
   COMMUTATION_PCT,
   COMMUTATION_VALUE,
   COMMUTATION_AMT,
   SUSPENSE_AMT,
   LOAN_DED_AMT,
   LOAN_INTEREST,
   TOT_LOAN_AMT,
   ANF_PREMIUM_AMT,
   ANF_LATE_FEE,
   TOT_ANF_AMT,
   TOT_AMT
)
AS
   SELECT   c.pgid,
            fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.app_sl,
            a.app_date,
            a.app_party_cd party_cd,
            S.INS_TP_CD,
            s.policy_status,
            s.maturity_date,
            s.sum_assured,
            s.age age_entry,
            s.age + ROUND ( (s.maturity_date - s.comm_date) / 365) curr_age,
            s.term,
            s.comm_date,
            s.servicing_off office_cd,
            c.product_cd,
            c.commutation_dt,
            c.commutation_pct,
            c.commutation_value,
            c.commutation_amt,
            c.suspense_amt,
            c.loan_ded_amt,
            c.loan_interest,
            (NVL (c.loan_ded_amt, 0) + NVL (c.loan_interest, 0)) tot_loan_amt,
            c.anf_premium_amt,
            c.anf_late_fee,
            (NVL (c.anf_premium_amt, 0) + NVL (c.anf_late_fee, 0))
               tot_anf_amt,
            ( (NVL (c.commutation_amt, 0) + NVL (c.suspense_amt, 0))
             - (  NVL (c.loan_ded_amt, 0)
                + NVL (c.loan_interest, 0)
                + NVL (c.anf_premium_amt, 0)
                + NVL (c.anf_late_fee, 0)))
               tot_amt
     FROM   clm_commutation_info c, ins_p_summery s, clm_app_commutation a
    WHERE       NVL (c.approve_flag, 'N') = 'N'
            AND c.pgid = s.pgid
            AND c.pgid = a.pgid
            AND c.app_sl = a.app_sl
   WITH READ ONLY;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_COMMUTE_PAYMENT  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_COMMUTE_PAYMENT
(
   PGID,
   POLICY_NO,
   APP_SL,
   PAY_ORDER_NO,
   CHEQUE_DT,
   APP_DATE,
   APPROVE_DATE,
   PARTY_CD,
   POLICY_STATUS,
   MATURITY_DATE,
   SUM_ASSURED,
   AGE_ENTRY,
   CURR_AGE,
   TERM,
   COMM_DATE,
   OFFICE_CD,
   INS_TP_CD,
   PRODUCT_CD,
   COMMUTATION_DT,
   COMMUTATION_PCT,
   COMMUTATION_VALUE,
   COMMUTATION_AMT,
   SUSPENSE_AMT,
   TOT_AMT,
   LOAN_NO,
   LOAN_DED_AMT,
   LOAN_INTEREST,
   ACC_PAYABLE_VRNO
)
AS
   SELECT   c.pgid,
            fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.app_sl,
            NVL (c.pay_order_no, c.cheque_no) pay_order_no,
            c.cheque_dt,
            (SELECT   app_date
               FROM   clm_app_commutation
              WHERE   pgid = c.pgid AND app_sl = c.app_sl)
               app_date,
            TRUNC (c.approve_dt) approve_date,
            (SELECT   app_party_cd
               FROM   clm_app_commutation
              WHERE   pgid = c.pgid AND app_sl = c.app_sl)
               party_cd,
            s.policy_status,
            s.maturity_date,
            s.sum_assured,
            s.age age_entry,
            s.age + ROUND ( (s.maturity_date - s.comm_date) / 365) curr_age,
            s.term,
            s.comm_date,
            s.servicing_off office_cd,
            s.ins_tp_cd,
            c.product_cd,
            c.commutation_dt,
            c.commutation_pct,
            c.commutation_value,
            c.commutation_amt,
            c.suspense_amt,
            NVL (c.commutation_amt, 0) + NVL (c.suspense_amt, 0) tot_amt,
            c.loan_no,
            c.loan_ded_amt,
            c.loan_interest,
            c.acc_payable_vrno
     FROM   clm_commutation_info c, ins_p_summery s
    WHERE       NVL (c.approve_flag, 'N') = 'Y'
            AND c.pgid = s.pgid
            AND NVL (c.payment_status, 'N') = 'N'
            AND c.cheque_no IS NOT NULL;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_COMMUT_APP_APPROVAL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_COMMUT_APP_APPROVAL
(
   PGID,
   POLICY_NO,
   APP_SL,
   APP_DATE,
   APP_PARTY_CD,
   CLIENT_TYPE,
   LAST_COMMUT_PCT,
   COMMUTATION_PCT,
   REMARKS,
   MATURITY_DATE,
   SUM_ASSURED,
   OFFICE_CD,
   INS_TP_CD
)
AS
   SELECT   c.pgid,
            fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.app_sl,
            c.app_date,
            c.app_party_cd,
            (SELECT   party_nm
               FROM   clm_party
              WHERE   party_cd = c.app_party_cd)
               client_type,
            m.last_commut_pct,
            c.commutation_pct,
            c.remarks,
            s.maturity_date,
            s.sum_assured,
            s.office_cd,
            S.INS_TP_CD
     FROM   clm_app_commutation c,
            ins_p_summery s,
            (SELECT   c.pgid, c.commutation_pct last_commut_pct
               FROM   clm_app_commutation c
              WHERE   c.app_sl =
                         (SELECT   MAX (p.app_sl)
                            FROM   clm_app_commutation p
                           WHERE   p.pgid = c.pgid
                                   AND NVL (p.approve_flag, 'N') = 'Y')) m
    WHERE       c.pgid = s.pgid
            AND c.pgid = m.pgid(+)
            AND NVL (c.approve_flag, 'N') = 'N';


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_DEDUCTION  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_DEDUCTION
(
   PGID,
   LOAN_TP_CD,
   LOAN_TYPE_NM,
   LOAN_AMT,
   INTEREST_AMT,
   TOT_LOAN_AMT,
   PAYABLE_NO
)
AS
   SELECT   l.pgid,
            l.loan_tp_cd,
            fun_pol_loan_type (l.loan_tp_cd) loan_type_nm,
            l.loan_amt,
            l.interest_amt,
            NVL (l.loan_amt, 0) + NVL (l.interest_amt, 0) tot_loan_amt,
            l.payable_no
     FROM   clm_adjust_loan l, clm_claim_payable_gen g
    WHERE   l.payable_no = g.payable_no
   --AND NVL (g.payment_status, 'N') = 'Y'
   UNION ALL
   SELECT   d.pgid,
            NULL,
            d.ded_nm,
            d.ded_amt,
            NULL interest,
            d.ded_amt,
            d.payable_no
     FROM   clm_adjust_other_ded d, clm_claim_payable_gen g
    WHERE   d.payable_no = g.payable_no;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCLM_PAYABLE_APPROVAL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCLM_PAYABLE_APPROVAL
(
   PAYABLE_NO,
   PGID,
   POLICY_NO,
   CALC_NO,
   SUM_ASSURED,
   OFFICE_CD,
   INS_TP_CD,
   PRODUCT_CD,
   SL_NO,
   CLM_CAUSE_CD,
   CLM_DETL_CD,
   BEN_PARTY_CD,
   PRODUCT_NM,
   CLM_CAUSE_NM,
   CLM_DETL_NM,
   PARTY_NM,
   GROSS_PAYABLE_AMT,
   BONUS_PAYABLE,
   LOAN_DED_AMT,
   LOAN_INTEREST,
   OTHER_DED_AMT,
   SUSPENSE_AMT,
   ANF_PREMIUM_AMT,
   ANF_LATE_FEE,
   NET_PAYABLE_AMT,
   PAYMENT_DT,
   LAST_APPROVED_BY,
   LAST_APVL_LEVEL_CD,
   SUPP_PROD_CD,
   SUPP_BEN_CD,
   LAST_APVBY_NM,
   APP_LEVEL_NM,
   POLICY_STATUS,
   PREM_DUE_LATE_FEE,
   PAID_PREM_LATE_FEE,
   UNADJ_COLL_AMT,
   SOURCE_TAX,
   OFF_MANUAL_DED_AMT,
   APPL_OFFICE_CD,
   CONTROL_OFFICE_CD,
   NR_APPROVED_FLAG,
   ALT_DUE_AMOUNT
)
AS
   SELECT   p.payable_no,
            p.pgid,
            fun_ins_pgid_to_policy_no (p.pgid) policy_no,
            p.calc_no,
            s.sum_assured,
            s.servicing_off office_cd,
            s.ins_tp_cd,
            p.product_cd,
            p.sl_no,
            p.clm_cause_cd,
            p.clm_detl_cd,
            p.ben_party_cd,
            rep_fun_ins_product (p.product_cd) product_nm,
            f_clm_cause_nm (p.clm_cause_cd) clm_cause_nm,
            f_clm_detl_nm (p.clm_cause_cd, p.clm_detl_cd) clm_detl_nm,
            f_clm_party_nm (p.ben_party_cd) party_nm,
            p.gross_payable_amt,
            p.bonus_payable,
            p.loan_ded_amt,
            p.loan_interest,
            p.other_ded_amt,
            p.suspense_amt,
            p.anf_premium_amt,
            p.anf_late_fee,
            p.net_payable_amt,
            p.payment_dt,
            p.last_approved_by,
            p.last_apvl_level_cd,
            p.supp_prod_cd,
            p.supp_ben_cd,
            f_emp_nm (p.last_approved_by) last_apvby_nm,
            NULL app_level_nm,
            s.policy_status,
            p.prem_due_late_fee,
            p.paid_prem_late_fee,
            p.unadj_coll_amt,
            p.source_tax,
            p.off_manual_ded_amt,
            (SELECT   appl_office_cd
               FROM   clm_claim_appl
              WHERE       pgid = p.pgid
                      AND clm_cause_cd = p.clm_cause_cd
                      AND clm_detl_cd = p.clm_detl_cd
                      AND party_cd = p.ben_party_cd
                      AND payable_dt = p.payment_dt)
               appl_office_cd,
            control_office_cd,
            p.nr_approved_flag,
            p.ALT_DUE_AMOUNT
     FROM   clm_claim_payable_gen p, ins_p_summery s
    WHERE   NVL (p.approved_flag, 'N') = 'N' AND p.pgid = s.pgid;


/* Formatted on 10/12/2023 12:07:45 PM (QP5 v5.115.810.9015) */
--
-- VCOM_AGENT_COMM_BILL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCOM_AGENT_COMM_BILL
(
   AGENT_ID,
   AGENT_NM_ENG,
   OFFICE_CD,
   AGENT_OFF_NM,
   JOIN_DT,
   LICENSE_NO,
   LICENSE_VALID_FROM_DT,
   LICENSE_VALID_TO_DT,
   ACTIVITY_CD,
   BILL_NO,
   BILL_DATE,
   COM_PAID_AMT,
   TOT_PAID_AMOUNT,
   DISPATCH_STATUS,
   DISPATCH_DT,
   BANK_CD,
   BR_CD,
   ACC_NO,
   CHEQUE_NO,
   CHEQUE_DT,
   INS_TP_CD,
   PAYABLE_OFFICE,
   AGENT_PAYMENT_TYPE,
   TOT_DED_AMOUNT,
   TOT_PAID_DED_AMOUNT,
   TOT_PAID_INTEREST_AMT,
   TOT_PAID_BILL_AMT
)
AS
   SELECT   m.agent_id,
            rep_f_salutation (h.salut) || ' ' || h.agent_nm_eng agent_nm_eng,
            m.office_cd,
            (SELECT   office_nm
               FROM   hrm_office
              WHERE   office_cd = m.office_cd)
               agent_off_nm,
            h.join_dt,
            h.license_no,
            h.license_valid_from_dt,
            h.license_valid_to_dt,
            rep_fun_activity_nm (h.activity_cd) activity_cd,
            m.bill_no,
            m.bill_date,
            m.gross_payable_amt com_paid_amt,
            m.bill_amount tot_paid_amount,
            NVL (m.disburse_status, '0') dispatch_status,
            m.disburse_dt dispatch_dt,
            m.agent_acc_bank_cd bank_cd,
            m.agent_acc_br_cd br_cd,
            m.agent_acc_no acc_no,
            m.cheque_no,
            m.cheque_dt,
            m.ins_tp_cd,
            m.payable_office,
            m.agent_payment_type,
            m.tot_ded_amount,
            m.tot_paid_ded_amount,
            m.tot_paid_interest_amt,
            NVL (m.tot_paid_bill_amt, m.bill_amount) tot_paid_bill_amt
     FROM   com_agent_com_bill_mst m, hrm_agent h
    WHERE   m.agent_id = h.agent_id AND NVL (m.disburse_status, '0') = '0';


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- VCOM_DEV_EMP_COMM_BILL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VCOM_DEV_EMP_COMM_BILL
(
   EMP_GID,
   EMP_ID,
   EMP_NM_ENG,
   EMP_TYPE_CD,
   OFFICE_CD,
   EMP_OFF_NM,
   JOIN_DT,
   ACTIVITY_CD,
   BILL_NO,
   BILL_DATE,
   COM_PAID_AMT,
   TOT_PAID_AMOUNT,
   DISPATCH_STATUS,
   DISPATCH_DT,
   CHEQUE_DT,
   CHEQUE_NO,
   EMP_ACC_NO,
   EMP_ACC_BANK_CD,
   EMP_ACC_BR_CD,
   INS_TP_CD,
   PAYABLE_OFFICE,
   EMP_PAYMENT_TYPE,
   TOT_DED_AMOUNT,
   TOT_PAID_DED_AMOUNT,
   TOT_PAID_INTEREST_AMT,
   TOT_PAID_BILL_AMT
)
AS
     SELECT   emp_gid,
              emp_id,
              emp_nm_eng,
              emp_type_cd,
              office_cd,
              emp_off_nm,
              join_dt,
              activity_cd,
              bill_no,
              bill_date,
              SUM (com_paid_amt) com_paid_amt,
              SUM (payable_amount) tot_paid_amount,
              dispatch_status,
              dispatch_dt,
              cheque_dt,
              cheque_no,
              emp_acc_no,
              emp_acc_bank_cd,
              emp_acc_br_cd,
              ins_tp_cd,
              payable_office,
              emp_payment_type,
              SUM (tot_ded_amount) tot_ded_amount,
              SUM (tot_paid_ded_amount) tot_paid_ded_amount,
              SUM (tot_paid_interest_amt) tot_paid_interest_amt,
              SUM (NVL (tot_paid_bill_amt, payable_amount)) tot_paid_bill_amt
       FROM   (SELECT   m.emp_gid,
                        e.emp_id,
                        rep_f_salutation (e.salut) || ' ' || e.emp_nm_eng
                           emp_nm_eng,
                        e.emp_type_cd,
                        m.office_cd,
                        (SELECT   office_nm
                           FROM   hrm_office
                          WHERE   office_cd = m.office_cd)
                           emp_off_nm,
                        e.join_dt,
                        rep_fun_activity_nm (e.activity_cd) activity_cd,
                        m.bill_no,
                        m.bill_date,
                        gross_payable_amt com_paid_amt,
                        m.bill_amount payable_amount,
                        NVL (m.disburse_status, '0') dispatch_status,
                        TRUNC (m.disburse_dt) dispatch_dt,
                        m.cheque_dt,
                        m.cheque_no,
                        m.emp_acc_no,
                        m.emp_acc_bank_cd,
                        m.emp_acc_br_cd,
                        m.ins_tp_cd,
                        m.payable_office,
                        m.emp_payment_type,
                        m.tot_ded_amount,
                        m.tot_paid_ded_amount,
                        m.tot_paid_interest_amt,
                        m.tot_paid_bill_amt
                 FROM   com_emp_com_bill_mst m, hrm_employee e
                WHERE   m.emp_gid = e.emp_gid
                        AND NVL (m.disburse_status, '0') = '0'
               UNION ALL
               SELECT   m.emp_gid,
                        e.emp_id,
                        rep_f_salutation (e.salut) || ' ' || e.emp_nm_eng
                           emp_nm_eng,
                        e.emp_type_cd,
                        m.office_cd,
                        (SELECT   office_nm
                           FROM   hrm_office
                          WHERE   office_cd = m.office_cd)
                           emp_off_nm,
                        e.join_dt,
                        rep_fun_activity_nm (e.activity_cd) activity_cd,
                        m.bill_no,
                        m.bill_date,
                        gross_payable_amt com_paid_amt,
                        m.bill_amount payable_amount,
                        NVL (m.disburse_status, '0') dispatch_status,
                        TRUNC (m.disburse_dt) dispatch_dt,
                        m.cheque_dt,
                        m.cheque_no,
                        m.emp_acc_no,
                        m.emp_acc_bank_cd,
                        m.emp_acc_br_cd,
                        m.ins_tp_cd,
                        m.payable_office,
                        m.emp_payment_type,
                        NULL tot_ded_amount,
                        NULL tot_paid_ded_amount,
                        NULL tot_paid_interest_amt,
                        NULL tot_paid_bill_amt
                 FROM   com_emp_bon_com_bil_mst m, hrm_employee e
                WHERE   m.emp_gid = e.emp_gid
                        AND NVL (m.disburse_status, '0') = '0')
   GROUP BY   emp_gid,
              emp_id,
              emp_nm_eng,
              emp_type_cd,
              office_cd,
              emp_off_nm,
              join_dt,
              activity_cd,
              bill_no,
              bill_date,
              dispatch_status,
              dispatch_dt,
              cheque_dt,
              cheque_no,
              emp_acc_no,
              emp_acc_bank_cd,
              emp_acc_br_cd,
              ins_tp_cd,
              payable_office,
              emp_payment_type;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- VGRP_CLAIM_APPL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VGRP_CLAIM_APPL
(
   CLM_ID,
   CLM_DT,
   CLAIM_TYPE,
   CLAIM_TYPE_DESC,
   PGID,
   POLICY_NO,
   ORG_ID,
   ORG_NAME,
   SL_NO,
   EMP_NAME,
   SUM_ASSURED,
   MATURITY_AGE
)
AS
   SELECT   CM.CLM_ID,
            CM.CLM_DT,
            CM.CLAIM_TYPE,
            /* (CASE
                 WHEN CM.CLAIM_TYPE = '01' THEN 'DEATH CLAIM'
                 WHEN CM.CLAIM_TYPE = '02' THEN 'MATURITY CLAIM'
                 WHEN CM.CLAIM_TYPE = '04' THEN 'PROFIT COMMISION CLAIM'
                 ELSE NULL
              END)
                CLAIM_TYPE_DESC,*/
            ---DISABLE BY SHARMIN SULTANA PRITE
            (SELECT   TP.CLAIM_TP_NM
               FROM   GRP_CLAIM_TYPE TP
              WHERE   TP.CLAIM_TP_CD = CM.CLAIM_TYPE)
               CLAIM_TYPE_DESC,
            CM.PGID,
            (SELECT   GS.POLICY_NO
               FROM   GRP_GROUP_INS_SUMMERY GS
              WHERE   GS.PGID = CM.PGID)
               POLICY_NO,
            GA.ORG_ID,
            GA.ORG_NAME,
            CD.SL_NO,
            GP.EMP_NAME,
            GP.SUM_ASSURED,
            (SELECT   GS.MATURITY_AGE
               FROM   GRP_GROUP_INS_SUMMERY GS
              WHERE   GS.PGID = CM.PGID)
               MATURITY_AGE
     FROM   GRP_INS_CLAIM_APPL_MST CM,
            GRP_INS_CLAIM_APPL_DTL CD,
            GRP_GROUP_INS_ADDRESS GA,
            GRP_GROUP_INS_PERSONAL GP
    WHERE       CM.CLM_ID = CD.CLM_ID
            AND CM.PGID = GA.PGID
            AND GP.PGID = CM.PGID
            AND GP.SL_NO = CD.SL_NO
   WITH READ ONLY;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- VHRM_EMP_TARGET  (View)
--

CREATE OR REPLACE FORCE VIEW INS.VHRM_EMP_TARGET
(
   EMP_GID,
   EMP_ID,
   EMP_NM_ENG,
   FIRST_YR_TARGET,
   RENEWAL_TARGET,
   TOTAL_TARGET,
   START_DT,
   END_DT
)
AS
   SELECT   e.emp_gid,
            e.emp_id,
            e.emp_nm_eng,
            t.FIRST_YR_TARGET,
            t.RENEWAL_TARGET,
            t.TOTAL_TARGET,
            t.start_dt,
            t.end_dt
     FROM   hrm_employee e, hrm_emp_target t
    WHERE   e.desig_cd = t.desig_cd
            AND NOT EXISTS (SELECT   1
                              FROM   hrm_emp_target r
                             WHERE   r.emp_gid = e.emp_gid)
   UNION ALL
   SELECT   e.emp_gid,
            e.emp_id,
            e.emp_nm_eng,
            t.FIRST_YR_TARGET,
            t.RENEWAL_TARGET,
            t.TOTAL_TARGET,
            t.start_dt,
            t.end_dt
     FROM   hrm_employee e, hrm_emp_target t
    WHERE   e.emp_gid = t.emp_gid
   WITH READ ONLY;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_ACC_BRANCH  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_ACC_BRANCH
(
   BANK_CD,
   BANK_NM,
   BR_CD,
   BR_NM,
   BR_SHNM,
   ADDRESS,
   ROUTING_NO
)
AS
   SELECT   bank_cd,
            f_bank (bank_cd) bank_nm,
            br_cd,
            br_nm,
            br_shnm,
            address,
            routing_no
     FROM   acc_branch;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_ACC_PARTIAL_COLLECTION  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_ACC_PARTIAL_COLLECTION
(
   RECEIVE_ID,
   RECEIVE_DATE,
   RECEIVED_BY,
   COLL_MEDIA,
   MEDIA_NO,
   MEDIA_DT,
   COLL_TYPE,
   COLL_AMOUNT,
   PGID,
   REQ_PREMIUM_AMT,
   COLLECTION_NO
)
AS
   SELECT   ap.receive_id,
            ap.receive_date,
            ap.received_by,
            ap.coll_media,
            ap.media_no,
            ap.media_dt,
            DECODE (ap.coll_type, 1, 'Cash', 2, 'Bank', 'Others'),
            ap.coll_amount,
            pgid,
            req_premium_amt,
               ap.active_office_cd
            || '-'
            || TO_CHAR (ap.receive_date, 'RR')
            || '-'
            || ap.coll_sl_no
     FROM   acc_partial_receivables ap
    WHERE   NVL (ap.rec_status, '0') = '1' AND ap.service_id IS NULL
            AND NVL (ap.coll_check_status, '0') =
                  DECODE (ap.mode_tp, '1', '0', '1')
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '2'
                            AND d.pgid = ap.pgid
                            AND d.receive_id = ap.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id);


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_ADVANCE_COLL_SUMMARY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_ADVANCE_COLL_SUMMARY
(
   RECEIVE_ID,
   RECEIVE_DATE,
   PROPOSAL_NO,
   PGID,
   COLL_AMOUNT,
   OFFICE_CODE,
   RECEIVE_MODE,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   STATUS,
   CHEQUE_DEPOSIT,
   COM_CALCULATED,
   ACTIVE_OFFICE_CD,
   REC_STATUS,
   COLLECTION_TYPE,
   I_DT,
   DATE_BACK_LATE_FEE,
   ACTUAL_COLL_DATE,
   POL_FRM_PREV_POL_ST
)
AS
   SELECT   c.receive_id,
            b.receive_date,
            c.proposal_no,
            fun_ins_proposal_no_to_pgid (c.proposal_no) pgid,
            b.coll_amount,
            c.office_code,
            c.receive_mode,
            c.vouch_ref,
            c.interoffice_voucher,
            c.status,
            c.cheque_deposit,
            c.com_calculated,
            c.active_office_cd,
            c.rec_status,
            c.collection_type,
            b.i_dt,
            NVL (p.date_back_late_fee, 0) date_back_late_fee,
            b.actual_coll_date,
            b.pol_frm_prev_pol_st
     FROM   (  SELECT   SUM (a.coll_amount) coll_amount,
                        a.receive_id,
                        a.proposal_no,
                        MAX (a.slno) slno,
                        TRUNC (MAX (a.receive_date)) receive_date,
                        TRUNC (MAX (a.i_dt)) i_dt,
                        /*NVL (MIN (a.coll_slip_rec_dt),
                             MAX (a.receive_date)
                            ) actual_coll_date*/
                        MAX(CASE
                               WHEN a.receive_date < TO_DATE ('16-mar-2016')
                               THEN
                                  DECODE (a.mode_tp,
                                          1, TRUNC (a.receive_date),
                                          a.coll_slip_rec_dt)
                               ELSE
                                  TRUNC (a.receive_date)
                            END)
                           actual_coll_date,
                        NVL (MAX (a.pol_frm_prev_pol_st), 0)
                           pol_frm_prev_pol_st
                 FROM   ins.acc_advance_receivables a
                WHERE   a.rec_status = '1' AND a.status = '1'
             GROUP BY   a.receive_id, a.proposal_no, a.receive_mode) b,
            acc_advance_receivables c,
            ins_unaccpted_policy p
    WHERE       b.proposal_no = c.proposal_no
            AND b.slno = c.slno
            AND c.pgid = p.pgid(+);


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_ADVANCE_RECEIVABLES  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_ADVANCE_RECEIVABLES
(
   RECEIVE_ID,
   RECEIVE_DATE,
   PROPOSAL_NO,
   PGID,
   COLL_AMOUNT,
   COLL_SLIP_REC_DT,
   OFFICE_CODE,
   RECEIVE_MODE,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   STATUS,
   CHEQUE_DEPOSIT,
   COM_CALCULATED,
   ACTIVE_OFFICE_CD,
   REC_STATUS
)
AS
   SELECT   c.receive_id,
            c.receive_date,
            c.proposal_no,
            fun_ins_proposal_no_to_pgid (c.proposal_no) pgid,
            b.coll_amount,
            b.coll_slip_rec_dt,
            c.office_code,
            c.receive_mode,
            c.vouch_ref,
            c.interoffice_voucher,
            c.status,
            c.cheque_deposit,
            c.com_calculated,
            c.active_office_cd,
            c.rec_status
     FROM   (  SELECT   SUM (a.coll_amount) coll_amount,
                        a.receive_id,
                        a.proposal_no,
                        MAX (a.slno) slno,
                        MAX (a.coll_slip_rec_dt) coll_slip_rec_dt
                 FROM   acc_advance_receivables a
                WHERE   a.rec_status = '1' AND a.status = '1'
                        AND (a.com_calculated = 'N' OR a.com_calculated IS NULL)
                        AND NVL (a.cheque_deposit, 'N') =
                              DECODE (a.receive_mode,
                                      '1', NVL (a.cheque_deposit, 'N'),
                                      '3', NVL (a.cheque_deposit, 'N'),
                                      '4', NVL (a.cheque_deposit, 'N'),
                                      '5', NVL (a.cheque_deposit, 'N'),
                                      '7', NVL (a.cheque_deposit, 'N'),
                                      'Y')
                        AND NVL (a.coll_check_status, '0') =
                              DECODE (a.mode_tp, '1', '0', '1')
                        AND EXISTS
                              (SELECT   1
                                 FROM   acc_bank_tran_mst m,
                                        acc_bank_tran_dtl d
                                WHERE       m.coll_purpose = '1'
                                        AND d.pgid = a.pgid
                                        AND d.receive_id = a.receive_id
                                        AND d.slno = a.slno
                                        AND NVL (d.deposit_st, '0') = '1'
                                        AND m.tran_id = d.tran_id)
             GROUP BY   a.receive_id, a.proposal_no) b,
            acc_advance_receivables c
    WHERE       b.proposal_no = c.proposal_no
            AND c.rec_status = '1'
            AND c.status = '1'
            AND (c.com_calculated = 'N' OR c.com_calculated IS NULL)
            AND NVL (c.cheque_deposit, 'N') =
                  DECODE (c.receive_mode,
                          '1', NVL (c.cheque_deposit, 'N'),
                          '3', NVL (c.cheque_deposit, 'N'),
                          '4', NVL (c.cheque_deposit, 'N'),
                          '5', NVL (c.cheque_deposit, 'N'),
                          '7', NVL (c.cheque_deposit, 'N'),
                          'Y')
            AND NVL (c.coll_check_status, '0') =
                  DECODE (c.mode_tp, '1', '0', '1')
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '1'
                            AND d.pgid = c.pgid
                            AND d.receive_id = c.receive_id
                            AND d.slno = c.slno
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
            AND b.slno = c.slno;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_ADVANCE_RECEIVABLES_TMP  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_ADVANCE_RECEIVABLES_TMP
(
   RECEIVE_ID,
   RECEIVE_DATE,
   PROPOSAL_NO,
   PGID,
   COLL_AMOUNT,
   OFFICE_CODE,
   RECEIVE_MODE,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   STATUS,
   CHEQUE_DEPOSIT,
   COM_CALCULATED,
   ACTIVE_OFFICE_CD,
   REC_STATUS
)
AS
   SELECT   c.receive_id,
            c.receive_date,
            c.proposal_no,
            fun_ins_proposal_no_to_pgid (c.proposal_no) pgid,
            b.coll_amount,
            c.office_code,
            c.receive_mode,
            c.vouch_ref,
            c.interoffice_voucher,
            c.status,
            c.cheque_deposit,
            c.com_calculated,
            c.active_office_cd,
            c.rec_status
     FROM   (  SELECT   SUM (a.coll_amount) coll_amount,
                        a.receive_id,
                        a.proposal_no,
                        MAX (a.slno) slno
                 FROM   ins.acc_advance_receivables a
                WHERE       a.rec_status = '1'
                        AND a.status = '1'
                        AND NVL (a.com_calculated, 'N') = 'Y'
             GROUP BY   a.receive_id, a.proposal_no) b,
            acc_advance_receivables c
    WHERE       b.proposal_no = c.proposal_no
            AND c.rec_status = '1'
            AND c.status = '1'
            AND NVL (c.com_calculated, 'N') = 'Y'
            AND b.slno = c.slno;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_ADV_COLL_SUMMARY_CFO  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_ADV_COLL_SUMMARY_CFO
(
   RECEIVE_ID,
   RECEIVE_DATE,
   PROPOSAL_NO,
   PGID,
   COLL_AMOUNT,
   OFFICE_CODE,
   RECEIVE_MODE,
   VOUCH_REF,
   RECEIPT_NO,
   INTEROFFICE_VOUCHER,
   STATUS,
   CHEQUE_DEPOSIT,
   COM_CALCULATED,
   ACTIVE_OFFICE_CD,
   REC_STATUS,
   COLLECTION_TYPE,
   I_DT,
   I_USR,
   RECEIVED_BY,
   DATE_BACK_LATE_FEE,
   ACTUAL_COLL_DATE,
   POL_FRM_PREV_POL_ST
)
AS
   SELECT   c.receive_id,
            b.receive_date,
            c.proposal_no,
            fun_ins_proposal_no_to_pgid (c.proposal_no) pgid,
            b.coll_amount,
            c.office_code,
            c.receive_mode,
            c.vouch_ref,
               c.active_office_cd
            || '-'
            || TO_CHAR (c.receive_date, 'RR')
            || '-'
            || NVL (c.coll_sl_no, c.coll_slip_no)
               receipt_no,
            c.interoffice_voucher,
            c.status,
            c.cheque_deposit,
            c.com_calculated,
            c.active_office_cd,
            c.rec_status,
            c.collection_type,
            b.i_dt,
            C.I_USR,
            C.RECEIVED_BY,
            NVL (p.date_back_late_fee, 0) date_back_late_fee,
            b.actual_coll_date,
            b.pol_frm_prev_pol_st
     FROM   (  SELECT   SUM (a.coll_amount) coll_amount,
                        a.receive_id,
                        a.proposal_no,
                        MAX (a.slno) slno,
                        TRUNC (MAX (a.receive_date)) receive_date,
                        TRUNC (MAX (a.i_dt)) i_dt,
                        /*NVL (MIN (a.coll_slip_rec_dt),
                             MAX (a.receive_date)
                            ) actual_coll_date*/
                        MAX(CASE
                               WHEN a.receive_date < TO_DATE ('16-mar-2016')
                               THEN
                                  DECODE (a.mode_tp,
                                          1, a.receive_date,
                                          a.coll_slip_rec_dt)
                               ELSE
                                  a.receive_date
                            END)
                           actual_coll_date,
                        NVL (MAX (a.pol_frm_prev_pol_st), 0)
                           pol_frm_prev_pol_st
                 FROM   ins.acc_advance_receivables a
                WHERE   a.rec_status = '1' AND a.status = '1'
             GROUP BY   a.receive_id, a.proposal_no, a.receive_mode) b,
            acc_advance_receivables c,
            ins_unaccpted_policy p
    WHERE       b.proposal_no = c.proposal_no
            AND b.slno = c.slno
            AND c.pgid = p.pgid(+);


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_BANK_RECON  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_BANK_RECON
(
   REF_SL,
   TRANS_DATE,
   OFFICE_CODE,
   AMT,
   OFFICE_DIV,
   CHEQUE_NO,
   CHEQUE_DATE,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   PGID_PROPOSAL,
   SOURCE_ENTRY,
   BANK_CD,
   BR_CD,
   RECEIVE_MODE,
   DUE_DT_FROM,
   DUE_DT_TO,
   CHEQUE_STATUS,
   SLNO
)
AS
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            receive_date trans_date,
            active_office_cd office_code,
            coll_amount amt,
            1 office_div,
            cheque_no,
            cheque_date,
            vouch_ref,
            interoffice_voucher,
            fun_ins_pgid_to_policy_no (pgid) pgid_proposal,
            'acc_receivables' source_entry,
            to_bank_cd bank_cd,
            to_br_cd br_cd,
            receive_mode,
            due_dt_from,
            due_dt_to,
            (CASE
                WHEN cheque_deposit = 'N' THEN 3
                WHEN cheque_deposit = 'R' THEN 2
                WHEN cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status,
            1 slno
     FROM   acc_receivables r
    WHERE   receive_mode IN ('2', '3')
            AND (cheque_deposit = 'R' OR (status = '0' AND rec_status = '1'))
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '2'
                            AND d.pgid = r.pgid
                            AND d.receive_id = r.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
   UNION ALL
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            receive_date trans_date,
            active_office_cd office_code,
            coll_amount amt,
            1 office_div,
            cheque_no,
            cheque_date,
            vouch_ref,
            interoffice_voucher,
            fun_ins_pgid_to_policy_no (pgid) pgid_proposal,
            'acc_partial_receivables' source_entry,
            to_bank_cd bank_cd,
            to_br_cd br_cd,
            coll_type receive_mode,
            due_date_from,
            due_date_to,
            (CASE
                WHEN cheque_deposit = 'N' THEN 3
                WHEN cheque_deposit = 'R' THEN 2
                WHEN cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status,
            1 slno
     FROM   acc_partial_receivables r
    WHERE   coll_type IN ('2', '3')
            AND (cheque_deposit = 'R'
                 OR (service_id IS NULL AND rec_status = '1'))
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '2'
                            AND d.pgid = r.pgid
                            AND d.receive_id = r.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
   UNION ALL
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            receive_date trans_date,
            active_office_cd office_code,
            coll_amount amt,
            1 office_div,
            cheque_no,
            cheque_date,
            vouch_ref,
            interoffice_voucher,
            proposal_no pgid_proposal,
            'acc_advance_receivables' source_entry,
            to_bank_cd bank_cd,
            to_br_cd br_cd,
            receive_mode,
            receive_date due_dt_from,
            receive_date due_dt_to,
            (CASE
                WHEN cheque_deposit = 'N' THEN 3
                WHEN cheque_deposit = 'R' THEN 2
                WHEN cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status,
            slno
     FROM   acc_advance_receivables r
    WHERE   receive_mode IN ('2', '3')
            AND (cheque_deposit = 'R' OR (status = '0' AND rec_status = '1'))
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '1'
                            AND d.pgid = r.pgid
                            AND d.receive_id = r.receive_id
                            AND d.slno = r.slno
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
   UNION ALL
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            receive_date trans_date,
            active_office_cd office_code,
            coll_amount amt,
            1 office_div,
            cheque_no,
            cheque_date,
            vouch_ref,
            interoffice_voucher,
            TO_CHAR (emp_gid) pgid_proposal,
            'PAY_LOAN_RECOVERY' source_entry,
            to_bank_cd bank_cd,
            to_br_cd br_cd,
            receive_mode,
            NULL due_dt_from,
            NULL due_dt_to,
            (CASE
                WHEN cheque_deposit = 'N' THEN 3
                WHEN cheque_deposit = 'R' THEN 2
                WHEN cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status,
            1 slno
     FROM   pay_loan_recovery r
    WHERE   receive_mode IN ('2', '3')
            AND (cheque_deposit = 'R' OR (status = '0' AND rec_status = '1'))
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '6'
                            AND d.receive_id = r.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
   UNION ALL
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            receive_dt trans_date,
            office_cd office_code,
            trns_amt amt,
            1 office_div,
            chq_no,
            chq_dt,
            vouch_ref,
            NULL interoffice_voucher,
            fun_ins_pgid_to_policy_no (pgid) pgid_proposal,
            'acc_oth_coll_mst' source_entry,
            bank_cd bank_cd,
            br_cd br_cd,
            receive_mode_cd,
            NULL due_dt_from,
            NULL due_dt_to,
            (CASE
                WHEN cheque_honor_st = '0' THEN 3
                WHEN cheque_honor_st = '2' THEN 2
                WHEN cheque_honor_st = '1' THEN 1
                ELSE 3
             END)
               cheque_status,
            1 slno
     FROM   acc_oth_coll_mst r
    WHERE   receive_mode_cd IN ('2', '3')
            AND NVL (cheque_honor_st, 0) IN ('0', '1', '2')
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '3'
                            AND d.receive_id = r.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
   UNION ALL
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            receive_date trans_date,
            active_office_cd office_code,
            coll_amount amt,
            1 office_div,
            cheque_no,
            cheque_date,
            vouch_ref,
            interoffice_voucher,
            fun_ins_pgid_to_policy_no (pgid) pgid_proposal,
            'acc_alt_receivables' source_entry,
            to_bank_cd bank_cd,
            to_br_cd br_cd,
            receive_mode,
            due_dt_from,
            due_dt_to,
            (CASE
                WHEN cheque_deposit = 'N' THEN 3
                WHEN cheque_deposit = 'R' THEN 2
                WHEN cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status,
            1 slno
     FROM   acc_alt_receivables r
    WHERE   receive_mode IN ('2', '3')
            AND (cheque_deposit = 'R' OR (status = '0' AND rec_status = '1'))
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '5'
                            AND d.pgid = r.pgid
                            AND d.receive_id = r.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
   UNION ALL
   SELECT   LPAD (receive_id, 12, '0') ref_sl,
            NVL (r.coll_slip_rec_dt, r.receive_date) trans_date,
            active_office_cd office_code,
            coll_amount amt,
            1 office_div,
            cheque_no,
            cheque_date,
            vouch_ref,
            interoffice_voucher,
            fun_ins_pgid_to_policy_no (pgid) pgid_proposal,
            'POL_LOAN_RECOVERY' source_entry,
            to_bank_cd bank_cd,
            to_br_cd br_cd,
            receive_mode,
            NULL due_dt_from,
            NULL due_dt_to,
            (CASE
                WHEN cheque_deposit = 'N' THEN 3
                WHEN cheque_deposit = 'R' THEN 2
                WHEN cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status,
            1 slno
     FROM   pol_loan_recovery r
    WHERE   receive_mode IN ('2', '3')
            AND (cheque_deposit = 'R' OR (status = '0' AND rec_status = '1'))
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '4'
                            AND d.pgid = r.pgid
                            AND d.receive_id = r.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id);


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_COLL_ALL_RECEIVABLES  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_COLL_ALL_RECEIVABLES
(
   PGID,
   OFFICE_CODE,
   ACTIVE_OFFICE_CD,
   DUE_DT_FROM,
   DUE_DT_TO,
   COLLECTION_TYPE,
   COLL_SLIP_NO,
   COLL_SLIP_REC_DT,
   RECEIVE_DATE,
   RECEIVED_BY,
   COLL_AMOUNT,
   STATUS,
   COM_CALCULATED,
   REC_STATUS,
   ADV_STATUS,
   MAN_ADJUSTED
)
AS
   SELECT   pgid,
            office_code,
            active_office_cd,
            due_dt_from,
            due_dt_to,
            collection_type,
            coll_slip_no,
            coll_slip_rec_dt,
            receive_date,
            received_by,
            coll_amount,
            status,
            com_calculated,
            rec_status,
            ADV_STATUS,
            MAN_ADJUSTED
     FROM   acc_receivables
   UNION ALL
   SELECT   pgid,
            office_code,
            active_office_cd,
            NULL,
            NULL,
            collection_type,
            coll_slip_no,
            coll_slip_rec_dt,
            receive_date,
            received_by,
            coll_amount,
            status,
            com_calculated,
            rec_status,
            NULL,
            NULL
     FROM   acc_advance_receivables;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_EMP_ADV_PAYMENT  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_EMP_ADV_PAYMENT
(
   OFFICE_CD,
   EMP_GID,
   SUPPLIER_ID,
   GLAC_SL_NO,
   APPROVED_DATE,
   PAY_AMT
)
AS
     SELECT   office_cd,
              emp_gid,
              supplier_id,
              glac_sl_no,
              approved_date,
              SUM (pay_amt) pay_amt
       FROM   (SELECT   o.office_cd,
                        emp_gid,
                        o.supplier_id,
                        c.glac_sl_no,
                        o.approved_date,
                        trans_amt pay_amt
                 FROM   acc_oth_pay_mst o, acc_gl_trans_dtl m, acc_gl_coa c
                WHERE   o.vouch_ref = m.vouch_no
                        AND m.glac_sl_no = c.glac_sl_no
                        AND EXISTS
                              (SELECT   1
                                 FROM   acc_oth_coll_pay_setup_mst b,
                                        acc_oth_coll_pay_setup_dtl d
                                WHERE       b.trans_tp_cd = d.trans_tp_cd
                                        AND b.trans_group_cd IN ('15', '16')
                                        AND d.trans_type = 'D'
                                        AND b.trans_tp_cd = o.trans_tp_cd
                                        AND m.glac_sl_no = d.glac_sl_no)
                        AND trans_tp_cd IN
                                 (SELECT   trans_tp_cd
                                    FROM   acc_oth_coll_pay_setup_mst
                                   WHERE   trans_group_cd IN ('15', '16'))
                        --AND emp_gid IS NOT NULL   --Musha on 26.07.2017
                        AND approved_st = '1'
               UNION ALL
               SELECT   l.active_office_cd office_cd,
                        l.emp_gid,
                        NULL,
                        DECODE (o.employment_tp_cd, '02', '101499', '101428')
                           glac_sl_no,
                        l.apprv_dt approved_date,
                        l.loan_amt pay_amt
                 FROM   pay_loan_appl_apprvl l, hrm_employee o
                WHERE       loan_type_cd = '01'
                        AND l.emp_gid = o.emp_gid
                        AND l.emp_gid IS NOT NULL
                        AND l.disburse_flag = 'Y'  --AND cheque_dt IS NOT NULL
                                                 )
   GROUP BY   office_cd,
              emp_gid,
              supplier_id,
              glac_sl_no,
              approved_date;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_EMP_ADV_PAYMENT_RECOVERY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_EMP_ADV_PAYMENT_RECOVERY
(
   OFFICE_CD,
   EMP_GID,
   SUPPLIER_ID,
   GLAC_SL_NO,
   RECOVERY_DATE,
   JV_AMT,
   MR_AMT
)
AS
     SELECT   office_cd,
              emp_gid,
              supplier_id,
              glac_sl_no,
              recovery_date,
              SUM (jv_amt) jv_amt,
              SUM (mr_amt) mr_amt
       FROM   (SELECT   o.office_cd,
                        p.emp_gid,
                        NULL supplier_id,
                        m.glac_sl_no,
                        o.approved_date recovery_date,
                        DECODE (o.coll_media_cd, '03', trans_amt, 0) jv_amt,
                        DECODE (o.coll_media_cd, '03', 0, trans_amt) mr_amt
                 FROM   acc_oth_coll_mst o,
                        acc_gl_trans_dtl m,
                        acc_gl_coa c,
                        acc_oth_pay_mst p
                WHERE       o.vouch_ref = m.vouch_no
                        AND m.glac_sl_no = c.glac_sl_no
                        AND o.payment_id = p.payment_id
                        AND EXISTS
                              (SELECT   1
                                 FROM   acc_oth_coll_pay_setup_mst b,
                                        acc_oth_coll_pay_setup_dtl d
                                WHERE       b.trans_tp_cd = d.trans_tp_cd
                                        AND b.trans_group_cd IN ('15', '16')
                                        AND d.trans_type = 'D'
                                        --AND b.trans_tp_cd = o.trans_tp_cd --Musha on 23.07.2017
                                        AND m.glac_sl_no = d.glac_sl_no)
               UNION ALL
                 SELECT   am.office_cd,
                          am.emp_gid,
                          am.supplier_id,
                          adv_glac_sl_no glac_sl_no,
                          am.adj_date recovery_date,
                          SUM (adj_bill_amt) jv_amt,
                          0 mr_amt
                   FROM   acc_oth_adv_adjust_mst am, acc_oth_adv_adjust_dtl ad
                  WHERE   am.adj_id = ad.adj_id
                          AND am.trans_tp_cd IN
                                   (SELECT   trans_tp_cd
                                      FROM   acc_oth_coll_pay_setup_mst
                                     WHERE   trans_group_cd IN ('15', '16'))
                          AND adj_glac_sl_no IS NOT NULL
               GROUP BY   am.office_cd,
                          am.emp_gid,
                          am.supplier_id,
                          adv_glac_sl_no,
                          am.adj_date
               UNION ALL
                 SELECT   r.active_office_cd office_cd,
                          r.emp_gid,
                          NULL supplier_id,
                          m.glac_sl_no,
                          r.receive_date recovery_date,
                          SUM (DECODE (recovery_from, 3, coll_amount, 0)) jv_amt,
                          SUM (DECODE (recovery_from, 1, coll_amount, 0)) mr_amt
                   FROM   pay_loan_recovery r,
                          pay_loan_appl_apprvl a,
                          acc_gl_trans_dtl m,
                          hrm_employee o
                  WHERE       r.loan_no = a.loan_no
                          AND loan_type_cd = '01'
                          AND m.glac_sl_no IN ('101428', '101499', '101500')
                          AND r.vouch_ref = m.vouch_no
                          AND r.emp_gid = o.emp_gid
                          AND r.emp_gid IS NOT NULL
               GROUP BY   r.active_office_cd,
                          r.emp_gid,
                          m.glac_sl_no,
                          r.receive_date)
   GROUP BY   office_cd,
              emp_gid,
              supplier_id,
              glac_sl_no,
              recovery_date;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_GRP_BANK_RECON  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_GRP_BANK_RECON
(
   REF_SL,
   TRANS_DATE,
   OFFICE_CODE,
   AMT,
   OFFICE_DIV,
   CHEQUE_NO,
   CHEQUE_DATE,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   PGID_PROPOSAL,
   SOURCE_ENTRY,
   BANK_CD,
   BR_CD,
   RECEIVE_MODE,
   DUE_DT_FROM,
   DUE_DT_TO,
   CHEQUE_STATUS
)
AS
   SELECT   a.receive_id ref_sl,
            a.receive_date trans_date,
            a.active_office_cd office_code,
            a.coll_amount amt,
            1 office_div,
            a.cheque_no,
            a.cheque_date,
            a.vouch_ref,
            a.interoffice_voucher,
            a.pgid pgid_proposal,
            'acc_receivables' source_entry,
            a.to_bank_cd bank_cd,
            a.to_br_cd br_cd,
            a.receive_mode receive_mode,
            a.due_dt_from due_dt_from,
            a.due_dt_to due_dt_to,
            (CASE
                WHEN a.cheque_deposit = 'N' THEN 3
                WHEN a.cheque_deposit = 'R' THEN 2
                WHEN a.cheque_deposit = 'Y' THEN 1
                ELSE 3
             END)
               cheque_status
     FROM   grp_receivables a, grp_group_ins_summery b
    WHERE       receive_mode = '2'
            AND a.pgid = b.pgid
            AND (cheque_deposit = 'R' OR (status = '0' AND rec_status = '1'));


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_GRP_COLL_VIEW  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_GRP_COLL_VIEW
(
   RECEIVE_ID,
   PGID,
   RECEIPT_NO,
   RECEIVE_DATE,
   COLLECTION_MEDIA,
   MEDIA_NO,
   COLL_AMOUNT
)
AS
   SELECT   a.receive_id,
            a.pgid,
               a.active_office_cd
            || '-'
            || TO_CHAR (a.receive_date, 'RR')
            || '-'
            || a.coll_sl_no
               receipt_no,
            a.receive_date,
            a.collection_type collection_media,
            a.coll_slip_no media_no,
            a.coll_amount
     FROM   grp_receivables a;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_GRP_POLICY_HISTORY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_GRP_POLICY_HISTORY
(
   TABLE_TERM,
   TERM,
   SUM_ASSURED,
   POL_STAT,
   POLICY_STATUS,
   POL_HOLDER,
   LAST_PAID_DATE,
   PGID,
   OFFICE_CD,
   AGENT_ID,
   REGIONAL_OFF,
   COMM_DATE,
   RISK_DATE,
   PAY_MODE_CD,
   PAY_MODE,
   INSTALL_QTY,
   INSTALLMENT_PREMIUM,
   PRODUCT_NM,
   ADDRESS
)
AS
   SELECT                                                     --s.suspense_amt
         s  .product_cd || '-' || s.term table_term,
            s.term,
            s.sum_assured,
            s.policy_status pol_stat --,rep_fun_ins_policy_status (s.policy_status) policy_status
                                    ,
            DECODE (s.policy_status,
                    '1',
                    'Proposed',
                    '2',
                    'Calculate',
                    '3',
                    'Approved',
                    '4',
                    'In-progress',
                    '5',
                    'Matured',
                    '6',
                    'Closed')
               policy_status             --,fun_party_name (s.pgid) pol_holder
                            ,
            ad.org_name pol_holder,
            s.last_paid_date,
            s.pgid,
            s.office_cd /*,    s.agent_id
                          || '-'
                          || f_emp_cd (s.do_gid)
                          || '-'
                          || f_emp_cd (s.dm_gid)
                          || '-'
                          || s.branch_off
                          || '-'
                          || s.sales_off
                          || '-'
                          || s.zonal_off
                          || '-'
                          || s.regional_off off_setup*/
                       ,
            s.agent_id,
            s.regional_off,
            s.comm_date,
            s.risk_date              --,fun_ins_option (s.option_cd) option_cd
                       --,s.option_cd opt
            ,
            fun_ins_pay_mode (s.pay_mode_cd) pay_mode_cd,
            s.pay_mode_cd pay_mode,
            fun_ins_yrly_no_inst (s.pay_mode_cd) install_qty,
            s.installment_premium installment_premium,
            p.product_nm,
            DECODE (ad.m_address, NULL, ad.p_address, ad.m_address) address
     FROM   grp_group_ins_summery s, grp_product p, grp_group_ins_address ad
    WHERE   s.product_cd = p.product_cd AND s.pgid = ad.pgid(+);


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_GRP_POLICY_PAY_HISTORY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_GRP_POLICY_PAY_HISTORY
(
   PGID,
   INSTALLMENT_NO,
   BALANCE,
   PAY_STATUS,
   NEXT_DUE_DT
)
AS
   SELECT   i.pgid,
            i.installment_no,
            i.installment_premium balance,
            DECODE (i.proposed_status,
                    0, 'Due',
                    1, 'Paid',
                    7, 'In-progress',
                    'N/A')
               pay_status                                           --,i.sl_no
                         ,
            i.next_due_dt
     FROM   grp_prem_acc_receivable i, grp_group_ins_summery p
    WHERE   i.pgid = p.pgid;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_LATEFEE_NESTED  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_LATEFEE_NESTED
(
   WAIVER_RATE,
   DUE_DATE,
   CIRCULAR_ID,
   CIRCULAR_MSG,
   CIRCULAR_DT
)
AS
     SELECT   MAX (waiver_rate) waiver_rate,
              due_date,
              circular_id,
              circular_msg,
              circular_dt
       FROM   (SELECT   due_date,
                        circular_id,
                        waiver_category,
                        waiver_rate,
                        circular_msg,
                        circular_dt
                 FROM   temp_latefee_waiver_circular
                WHERE   due_date IN (SELECT   DISTINCT due_date
                                       FROM   temp_latefee_waiver_circular
                                      WHERE   waiver_category = '2')) x
      WHERE   x.waiver_category = '2'
     HAVING   MAX (waiver_rate) > 0
   GROUP BY   due_date,
              circular_id,
              circular_msg,
              circular_dt;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_LATE_FEE_WAIVE_APP  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_LATE_FEE_WAIVE_APP
(
   PGID,
   APPLICATION_DT,
   APPROVAL_DT,
   LATEFEE_AMT,
   APPROVED_PERCENTAGE,
   APPROVED_AMT,
   EMP_NAME,
   DUE_DATE_FR,
   DUE_DATE_TO
)
AS
   SELECT   a.pgid,
            a.application_dt,
            a.approve_reject_dt,
            a.latefee_amt,
            a.approved_percentage,
            a.waived_amt approved_amt,
            f_emp_nm (a.emp_gid) emp_name,
            b.due_date_fr,
            b.due_date_to
     FROM   ser_app_latefee_waiv_approval a, ser_latefee_waiver_application b
    WHERE   a.pgid = b.pgid;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_PEN_RE_INS_POLICY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_PEN_RE_INS_POLICY
(
   PGID,
   POLICY_NO,
   COMM_DATE,
   SERVICING_OFF,
   TOT_SUM_ASSURED
)
AS
   (SELECT   a.pgid,
             fun_ins_pgid_to_policy_no (a.pgid) policy_no,
             a.comm_date,
             a.servicing_off,
             (a.sum_assured + a.pre_sum_ass) tot_sum_assured
      FROM   (  SELECT   s.pgid,
                         s.comm_date,
                         s.servicing_off,
                         s.sum_assured,
                         NVL (SUM (o.sum_assured), 0) pre_sum_ass
                  FROM   ins_p_summery s, ins_p_o_policy o
                 WHERE   NVL (s.re_ins_status, '0') = '0'
                         AND s.pgid = o.pgid(+)
              GROUP BY   s.pgid,
                         s.comm_date,
                         s.servicing_off,
                         s.sum_assured) a,
             ins_re_insur_setup r
     WHERE   a.comm_date BETWEEN r.valid_dt_fr AND r.valid_dt_to
             AND r.status = '1'
             AND (a.sum_assured + a.pre_sum_ass) >
                   (r.max_insur_amount + r.coridor_amount));


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_POLICY_HISTORY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_POLICY_HISTORY
(
   SUSPENSE_AMT,
   TABLE_TERM,
   PRODUCT_CD,
   TERM,
   SUM_ASSURED,
   POL_STAT,
   POLICY_STATUS,
   POL_HOLDER,
   LAST_PAID_DATE,
   PGID,
   OFFICE_CD,
   OFF_SETUP,
   COMM_DATE,
   RISK_DATE,
   MATURITY_DATE,
   OPTION_CD,
   OPT,
   PAY_MODE_CD,
   PAY_MODE,
   INSTALL_QTY,
   INSTALLMENT_PREMIUM,
   PRODUCT_NM,
   ADDRESS
)
AS
   SELECT   s.suspense_amt,
            s.product_cd || '-' || s.term table_term,
            s.product_cd,
            s.term,
            s.sum_assured,
            s.policy_status pol_stat,
            rep_fun_ins_policy_status (s.policy_status) policy_status,
            fun_party_name (s.pgid) pol_holder,
            s.last_paid_date,
            s.pgid,
            s.office_cd,
               s.agent_id
            || '-'
            || f_agent_idra_cd (s.agent_id)
            || '-'
            || f_emp_cd (s.do_gid)
            || '-'
            || f_emp_cd (s.dm_gid)
            || '-'
            || s.branch_off
            || '-'
            || s.sales_off
            || '-'
            || s.zonal_off
            || '-'
            || s.regional_off
               off_setup,
            s.comm_date,
            s.risk_date,
            s.maturity_date,
            fun_ins_option (s.option_cd) option_cd,
            s.option_cd opt,
            fun_ins_pay_mode (s.pay_mode_cd) pay_mode_cd,
            s.pay_mode_cd pay_mode,
            fun_ins_yrly_no_inst (s.pay_mode_cd) install_qty,
            s.installment_premium installment_premium,
            p.product_nm,
            DECODE (ad.t_address,
                    NULL, ad.p_address_1 || ' ' || ad.p_address_2,
                    ad.t_address)
               address
     FROM   ins_p_summery s, ins_product p, ins_p_address ad
    WHERE   s.product_cd = p.product_cd AND s.pgid = ad.pgid(+)
   UNION ALL
   SELECT   0 suspense_amt,
            s.pro_product_cd table_term,
            s.pro_product_cd,
            NULL term,
            NULL sum_assured,
            NULL pol_stat,
            NULL policy_status,
            pro_party_name pol_holder,
            NULL last_paid_date,
            s.pgid,
            s.office_cd,
            fun_fa_organogram (s.agent_id) off_setup,
            s.comm_dt comm_date,
            NULL risk_date,
            NULL maturity_date,
            NULL option_cd,
            NULL opt,
            NULL pay_mode_cd,
            NULL pay_mode,
            NULL install_qty,
            NULL installment_premium,
            p.product_nm,
            NULL address
     FROM   ins_p_proposal s, ins_product p
    WHERE   s.pro_product_cd = p.product_cd(+);


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_POLICY_PAY_HISTORY  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_POLICY_PAY_HISTORY
(
   PGID,
   INSTALLMENT_NO,
   BALANCE,
   PAY_STATUS,
   SL_NO,
   NEXT_DUE_DT
)
AS
   SELECT   i.pgid,
            i.installment_no,
            i.installment_premium balance,
            DECODE (i.proposed_status,
                    0, 'Due',
                    1, 'Paid',
                    2, 'Auto Loan',
                    3, 'Auto loan Paid',
                    4, 'Paid by suspense adjustment',
                    5, 'Discontinue',
                    6, 'LAPS',
                    7, 'In-progress',
                    'N/A')
               pay_status,
            i.sl_no,
            i.next_due_dt
     FROM   ins_prem_acc_receivable i, ins_p_summery p
    WHERE   i.pgid = p.pgid
            AND i.next_due_dt >= TO_DATE ('12/31/2015', 'MM/DD/YYYY');


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_POL_LOAN_APRVL_PENDING  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_POL_LOAN_APRVL_PENDING
(
   POLICY_NO,
   PGID,
   SL_NO,
   ASKING_AMOUNT,
   APPROVED_AMOUNT,
   SERVICING_OFF,
   APPL_DT
)
AS
   SELECT   fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.pgid,
            c.sl_no,
            c.ASKING_AMOUNT,
            c.APPROVED_AMOUNT,
            a.servicing_off,
            a.APPL_DT
     FROM   pol_loan_calculation c, pol_loan_application a
    WHERE   c.approved_st = '1' AND c.pgid = a.pgid AND c.sl_no = a.sl_no
   WITH READ ONLY;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_POL_LOAN_BANK_RECON  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_POL_LOAN_BANK_RECON
(
   RECEIVE_ID,
   RECEIVE_DATE,
   TO_BANK_CD,
   TO_BR_CD,
   PGID,
   SL_NO,
   ACTIVE_OFFICE_CD,
   CHEQUE_STATUS,
   COLL_AMOUNT,
   CHEQUE_NO,
   CHEQUE_DATE
)
AS
   SELECT   receive_id,
            r.receive_date,
            r.to_bank_cd,
            r.to_br_cd,
            pgid,
            sl_no,
            r.active_office_cd,
            NVL (cheque_status, 'P') cheque_status,
            coll_amount,
            cheque_no,
            cheque_date
     FROM   pol_loan_recovery r
    WHERE   receive_mode = '2'                     --AND cheque_status IS NULL
            AND (bank_deposit = 'Y' OR (status = '0' AND rec_status = '1'));


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_POL_LOAN_CHEQUE_WRITE  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_POL_LOAN_CHEQUE_WRITE
(
   POLICY_NO,
   PGID,
   SL_NO,
   NET_DISBURS_AMOUNT,
   CONTROL_OFFICE_CD,
   PAY_ORDER_DATE,
   ACCOUNT_NO
)
AS
   SELECT   fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.pgid,
            c.sl_no,
            c.net_payable_amount,
            ap.servicing_off,
            c.cheque_date,
            a.account_no
     FROM   pol_loan_summary c, clm_client_account a, pol_loan_application ap
    WHERE       cheque_date IS NOT NULL
            AND c.pgid = a.pgid
            AND c.pgid = ap.pgid
            AND c.sl_no = ap.sl_no
            AND NVL (c.cheque_issue_st, '0') = '0';


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_SER_COLL_PAY_DUE  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_SER_COLL_PAY_DUE
(
   RECEIVE_DATE,
   RECEIVE_ID,
   PGID,
   COLL_SL_NO,
   RECEIVE_MODE,
   COLLECTION_TYPE,
   DUE_DT_FROM,
   DUE_DT_TO,
   COLL_AMOUNT,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   USER_INFO,
   SLNO,
   COLL_SLIP_NO,
   ACTIVE_OFFICE_CD,
   COLL_PURPOSE
)
AS
   SELECT   a.receive_date,
            a.receive_id,
            a.pgid,
            a.coll_sl_no,
            DECODE (a.receive_mode,
                    '1', 'Cash',
                    '2', 'Cheque',
                    '3', 'DD',
                    'Others')
               receive_mode,
            a.collection_type,
            a.due_dt_from,
            a.due_dt_to,
            a.coll_amount,
            a.vouch_ref,
            a.interoffice_voucher,
            a.i_usr || '@' || fun_office_shnm (b.office_cd) user_info,
            0 slno,
            a.coll_slip_no,
            a.active_office_cd,
            '1' coll_purpose
     FROM   acc_receivables a, sec_user_info b
    WHERE   a.rec_status = '1' AND a.status = '0'
            AND a.receive_id NOT IN                           ---a.pgid NOT IN
                     (SELECT   n.receive_id_ref                       --m.pgid
                        FROM   acc_partial_receivables m,
                               acc_partial_receivables_ref n
                       WHERE       m.rec_status = '1'
                               AND m.receive_id = n.receive_id
                               AND n.receive_id_ref = a.receive_id)
            --AND NVL (a.adv_status, '0') = '0'
            --AND NVL (a.com_calculated, 'N') = 'N'
            --AND TRUNC (a.i_dt) = TRUNC (SYSDATE)
            AND ( (a.collection_type = '05'
                   AND TRUNC (a.i_dt) = TRUNC (SYSDATE))
                 OR (a.collection_type != '05'))
            AND ( (a.receive_mode = '2'
                   AND NVL (a.cheque_deposit, 'N') != 'R')
                 OR a.receive_mode != '2')
            AND UPPER (TRIM (a.i_usr)) = UPPER (TRIM (b.user_nm))
   UNION ALL
   SELECT   m.receive_date,
            m.receive_id,
            m.pgid,
            m.coll_sl_no,
            DECODE (m.coll_type,
                    '1', 'Cash',
                    '2', 'Cheque',
                    '3', 'DD',
                    'Others')
               receive_mode,
            m.coll_media,
            m.due_date_from,
            m.due_date_to,
            m.coll_amount,
            m.vouch_ref,
            m.interoffice_voucher,
            m.i_usr || '@' || fun_office_shnm (b.office_cd) user_info,
            0 slno,
            m.media_no,
            m.active_office_cd,
            '2' coll_purpose
     FROM   acc_partial_receivables m, sec_user_info b
    WHERE       m.rec_status = '1'
            AND NVL (m.status, '0') = '0'
            AND m.service_id IS NULL
            --AND TRUNC (m.i_dt) = TRUNC (SYSDATE)
            AND ( (m.coll_media = '05' AND TRUNC (m.i_dt) = TRUNC (SYSDATE))
                 OR (m.coll_media != '05'))
            AND ( (m.coll_type = '2' AND NVL (m.cheque_deposit, 'N') != 'R')
                 OR m.coll_type != '2')
            AND UPPER (TRIM (m.i_usr)) = UPPER (TRIM (b.user_nm))
   UNION ALL
   SELECT   a.receive_date,
            a.receive_id,
            a.pgid,
            a.coll_sl_no,
            DECODE (a.receive_mode,
                    '1', 'Cash',
                    '2', 'Cheque',
                    '3', 'DD',
                    'Others')
               receive_mode,
            a.collection_type,
            NULL due_dt_from,
            NULL due_dt_to,
            a.coll_amount,
            a.vouch_ref,
            a.interoffice_voucher,
            a.i_usr || '@' || fun_office_shnm (b.office_cd) user_info,
            a.slno,
            a.coll_slip_no,
            a.active_office_cd,
            '0' coll_purpose
     FROM   acc_advance_receivables a, sec_user_info b     --, ins_p_summery s
    WHERE   a.rec_status = '1' AND a.status = '0' --AND NVL (a.adv_status, '0') = '0'
            --AND NVL (a.com_calculated, 'N') = 'N'
            --AND TRUNC (a.i_dt) = TRUNC (SYSDATE)
            AND ( (a.collection_type = '05'
                   AND TRUNC (a.i_dt) = TRUNC (SYSDATE))
                 OR (a.collection_type != '05'))
            AND ( (a.receive_mode = '2'
                   AND NVL (a.cheque_deposit, 'N') != 'R')
                 OR a.receive_mode != '2')
            --AND a.pgid = s.pgid
            AND UPPER (TRIM (a.i_usr)) = UPPER (TRIM (b.user_nm));


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_SER_COLL_PAY_DUE_SPC  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_SER_COLL_PAY_DUE_SPC
(
   RECEIVE_DATE,
   RECEIVE_ID,
   PGID,
   COLL_SL_NO,
   RECEIVE_MODE,
   COLLECTION_TYPE,
   DUE_DT_FROM,
   DUE_DT_TO,
   COLL_AMOUNT,
   VOUCH_REF,
   INTEROFFICE_VOUCHER,
   USER_INFO,
   COLL_PURPOSE,
   SLNO
)
AS
   SELECT   a.receive_date,
            a.receive_id,
            a.pgid,
            a.coll_sl_no,
            DECODE (a.receive_mode,
                    '1', 'Cash',
                    '2', 'Cheque',
                    '3', 'DD',
                    'Others')
               receive_mode,
            a.collection_type,
            a.due_dt_from,
            a.due_dt_to,
            a.coll_amount,
            a.vouch_ref,
            a.interoffice_voucher,
            a.i_usr || '@' || fun_office_shnm (b.office_cd) user_info,
            '1' coll_purpose,
            NULL slno
     FROM   acc_receivables a, sec_user_info b
    WHERE   a.rec_status = '1' AND a.status = '0'
            AND a.pgid NOT IN
                     (SELECT   m.pgid
                        FROM   acc_partial_receivables m,
                               acc_partial_receivables_ref n
                       WHERE       m.rec_status = '1'
                               AND m.receive_id = n.receive_id
                               AND n.receive_id_ref = a.receive_id)
            --AND NVL (a.adv_status, '0') = '0'
            AND NVL (a.com_calculated, 'N') = 'N'
            --AND (    (    a.collection_type = 'OL'
            --        AND TRUNC (a.i_dt) = TRUNC (SYSDATE) )
            -- OR (a.collection_type != 'OL') )
            AND ( (a.receive_mode = '2'
                   AND NVL (a.cheque_deposit, 'N') != 'R')
                 OR a.receive_mode != '2')
            AND UPPER (TRIM (a.i_usr)) = UPPER (TRIM (b.user_nm))
   UNION ALL
   SELECT   m.receive_date,
            m.receive_id,
            m.pgid,
            m.coll_sl_no,
            DECODE (m.coll_type,
                    '1', 'Cash',
                    '2', 'Cheque',
                    '3', 'DD',
                    'Others')
               receive_mode,
            m.coll_media,
            m.due_date_from,
            m.due_date_to,
            m.coll_amount,
            m.vouch_ref,
            m.interoffice_voucher,
            m.i_usr || '@' || fun_office_shnm (b.office_cd) user_info,
            '2' coll_purpose,
            NULL slno
     FROM   acc_partial_receivables m, sec_user_info b
    WHERE       m.rec_status = '1'
            AND NVL (m.status, '0') = '0'
            AND m.service_id IS NULL
            --AND TRUNC (m.i_dt) = TRUNC (SYSDATE)   --Musha on 14.05.2018
            AND ( (m.coll_type = '2' AND NVL (m.cheque_deposit, 'N') != 'R')
                 OR m.coll_type != '2')
            AND UPPER (TRIM (m.i_usr)) = UPPER (TRIM (b.user_nm))
   UNION ALL
   SELECT   a.receive_date,
            a.receive_id,
            a.pgid,
            a.coll_sl_no,
            a.receive_mode,
            a.collection_type,
            NULL due_date_from,
            NULL due_date_to,
            a.coll_amount,
            a.vouch_ref,
            a.interoffice_voucher,
            a.i_usr || '@' || fun_office_shnm (b.office_cd) user_info,
            '0' coll_purpose,
            a.slno
     FROM   acc_advance_receivables a, sec_user_info b
    WHERE       a.rec_status = '1'
            AND a.status = '0'
            AND NOT EXISTS (SELECT   1
                              FROM   namfile n
                             WHERE   LPAD (
                                        n.proposal
                                        || TO_CHAR (n.proposal_dt, 'RRRR'),
                                        16,
                                        0
                                     ) = a.proposal_no)
            AND NVL (a.com_calculated, 'N') = 'N'
            AND ( (a.collection_type = 'OL'
                   AND TRUNC (a.i_dt) = TRUNC (SYSDATE))
                 OR (a.collection_type != 'OL'))
            AND ( (a.receive_mode = '2'
                   AND NVL (a.cheque_deposit, 'N') != 'R')
                 OR a.receive_mode != '2')
            AND UPPER (TRIM (a.i_usr)) = UPPER (TRIM (b.user_nm));


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_SURRENDER_APRVL_PENDING  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_SURRENDER_APRVL_PENDING
(
   POLICY_NO,
   APPL_SL_NO,
   PGID,
   APPROVED_AMOUNT,
   SERVICING_OFF,
   APPL_DT
)
AS
   SELECT   fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.appl_sl_no,
            c.pgid,
            c.APPROVED_AMOUNT,
            a.servicing_off,
            a.APPL_DT
     FROM   sur_sur_calculation c, sur_sur_application a
    WHERE   c.approved_st = '1' AND c.appl_sl_no = a.appl_sl_no
   WITH READ ONLY;


/* Formatted on 10/12/2023 12:07:46 PM (QP5 v5.115.810.9015) */
--
-- V_SURRENDER_CHEQUE_WRITE  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_SURRENDER_CHEQUE_WRITE
(
   POLICY_NO,
   PGID,
   APPL_SL_NO,
   NET_DISBURS_AMOUNT,
   CONTROL_OFFICE_CD,
   PAY_ORDER_DATE,
   ACCOUNT_NO
)
AS
   SELECT   fun_ins_pgid_to_policy_no (c.pgid) policy_no,
            c.pgid,
            c.appl_sl_no,
            c.net_disburs_amount,
            c.control_office_cd,
            c.pay_order_date,
            c.account_no
     FROM   SUR_DISBURS_MST c
    WHERE       pay_order_date IS NOT NULL
            AND pay_order_no IS NULL
            AND NVL (check_issue_st, '0') = '0';


/* Formatted on 10/12/2023 12:07:47 PM (QP5 v5.115.810.9015) */
--
-- V_UNADJUSTED_COLLECTION  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_UNADJUSTED_COLLECTION
(
   RECEIVE_ID,
   PGID,
   RECEIVE_DATE,
   COLL_SLIP_REC_DT,
   COLLECTION_TYPE,
   DUE_DT_FROM,
   DUE_DT_TO,
   TOT_PREMIUM_AMT,
   LATE_FEE,
   LATEFEE_WAIVER,
   COLL_AMOUNT,
   INSTALLMENT_NO_FROM,
   INSTALLMENT_NO_TO,
   AVL_SUS_AMT,
   COLLECTION_NO,
   ADV_STATUS,
   TOTAL_DUE
)
AS
   SELECT   a.receive_id,
            a.pgid,
            a.receive_date,
            a.coll_slip_rec_dt,
            a.collection_type,
            a.due_dt_from,
            a.due_dt_to,
            a.tot_premium_amt,
            NVL (a.late_fee, 0),
            NVL (a.latefee_waiver, 0),
            a.coll_amount,
            a.installment_no_from,
            a.installment_no_to,
            a.avl_sus_amt,
               a.active_office_cd
            || '-'
            || TO_CHAR (a.receive_date, 'RR')
            || '-'
            || a.coll_sl_no,
            a.adv_status,
            (a.tot_premium_amt + NVL (a.late_fee, 0))
            - (NVL (a.latefee_waiver, 0) + a.avl_sus_amt + a.coll_amount)
               total_due
     FROM   acc_receivables a
    WHERE   a.status = '0' AND a.rec_status = '1' AND a.receipt_status = '0'
            AND NVL (a.cheque_deposit, 'N') =
                  DECODE (a.receive_mode,
                          '2', 'Y',
                          NVL (a.cheque_deposit, 'N'))
            AND NVL (a.coll_check_status, '0') =
                  DECODE (a.mode_tp, '1', '0', '1')
            AND EXISTS
                  (SELECT   1
                     FROM   acc_bank_tran_mst m, acc_bank_tran_dtl d
                    WHERE       m.coll_purpose = '2'
                            AND d.pgid = a.pgid
                            AND d.receive_id = a.receive_id
                            AND NVL (d.deposit_st, '0') = '1'
                            AND m.tran_id = d.tran_id)
            AND NVL (a.man_adjusted, '0') != '1';


/* Formatted on 10/12/2023 12:07:47 PM (QP5 v5.115.810.9015) */
--
-- V_UNADJ_PARTIAL_COLL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_UNADJ_PARTIAL_COLL
(
   RECEIVE_ID,
   RECEIVE_DATE,
   RECEIVED_BY,
   COLL_MEDIA,
   MEDIA_NO,
   MEDIA_DT,
   COLL_TYPE,
   COLL_AMOUNT,
   PGID,
   REQ_PREMIUM_AMT,
   COLLECTION_NO
)
AS
   SELECT   ap.receive_id,
            ap.receive_date,
            ap.received_by,
            m.SHORT_NM coll_media,
            ap.media_no,
            ap.media_dt,
            DECODE (ap.coll_type, 1, 'Cash', 2, 'Bank', 'Others'),
            ap.coll_amount,
            pgid,
            req_premium_amt,
               ap.active_office_cd
            || '-'
            || TO_CHAR (ap.receive_date, 'RR')
            || '-'
            || ap.coll_sl_no
     FROM   acc_partial_receivables ap, ACC_COLLECTION_MEDIA m
    WHERE       NVL (ap.rec_status, '0') = '1'
            AND ap.service_id IS NULL
            AND ap.coll_media = m.COLL_MEDIA_CD;


/* Formatted on 10/12/2023 12:07:47 PM (QP5 v5.115.810.9015) */
--
-- V_UNADJ_PREM_COLL  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_UNADJ_PREM_COLL
(
   RECEIVE_ID,
   PGID,
   RECEIVE_DATE,
   COLL_SLIP_REC_DT,
   COLLECTION_TYPE,
   DUE_DT_FROM,
   DUE_DT_TO,
   TOT_PREMIUM_AMT,
   LATE_FEE,
   LATEFEE_WAIVER,
   COLL_AMOUNT,
   INSTALLMENT_NO_FROM,
   INSTALLMENT_NO_TO,
   AVL_SUS_AMT,
   COLLECTION_NO,
   ADV_STATUS,
   TOTAL_DUE
)
AS
   SELECT   a.receive_id,
            a.pgid,
            a.receive_date,
            a.coll_slip_rec_dt,
            a.collection_type,
            a.due_dt_from,
            a.due_dt_to,
            a.tot_premium_amt,
            NVL (a.late_fee, 0),
            NVL (a.latefee_waiver, 0),
            a.coll_amount,
            a.installment_no_from,
            a.installment_no_to,
            a.avl_sus_amt,
               a.active_office_cd
            || '-'
            || TO_CHAR (a.receive_date, 'RR')
            || '-'
            || a.coll_sl_no,
            a.adv_status,
            (a.tot_premium_amt + NVL (a.late_fee, 0))
            - (NVL (a.latefee_waiver, 0) + a.avl_sus_amt + a.coll_amount)
     FROM   acc_receivables a
    WHERE       a.status = '0'
            AND a.rec_status = '1'
            AND a.receipt_status = '0'
            AND NVL (a.man_adjusted, '0') != '1';


--
-- HRMV_OFFICE_SETUP  (Synonym) 
--
CREATE PUBLIC SYNONYM HRMV_OFFICE_SETUP FOR INS.HRMV_OFFICE_SETUP;


--
-- V_ACC_BRANCH  (Synonym) 
--
CREATE PUBLIC SYNONYM V_ACC_BRANCH FOR INS.V_ACC_BRANCH;


--
-- V_ACC_PARTIAL_COLLECTION  (Synonym) 
--
CREATE PUBLIC SYNONYM V_ACC_PARTIAL_COLLECTION FOR INS.V_ACC_PARTIAL_COLLECTION;


--
-- V_ADVANCE_COLL_SUMMARY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_ADVANCE_COLL_SUMMARY FOR INS.V_ADVANCE_COLL_SUMMARY;


--
-- V_ADVANCE_RECEIVABLES  (Synonym) 
--
CREATE PUBLIC SYNONYM V_ADVANCE_RECEIVABLES FOR INS.V_ADVANCE_RECEIVABLES;


--
-- V_ADVANCE_RECEIVABLES_TMP  (Synonym) 
--
CREATE PUBLIC SYNONYM V_ADVANCE_RECEIVABLES_TMP FOR INS.V_ADVANCE_RECEIVABLES_TMP;


--
-- V_BANK_RECON  (Synonym) 
--
CREATE PUBLIC SYNONYM V_BANK_RECON FOR INS.V_BANK_RECON;


--
-- V_COLL_ALL_RECEIVABLES  (Synonym) 
--
CREATE PUBLIC SYNONYM V_COLL_ALL_RECEIVABLES FOR INS.V_COLL_ALL_RECEIVABLES;


--
-- V_GRP_BANK_RECON  (Synonym) 
--
CREATE PUBLIC SYNONYM V_GRP_BANK_RECON FOR INS.V_GRP_BANK_RECON;


--
-- V_GRP_COLL_VIEW  (Synonym) 
--
CREATE PUBLIC SYNONYM V_GRP_COLL_VIEW FOR INS.V_GRP_COLL_VIEW;


--
-- V_GRP_POLICY_HISTORY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_GRP_POLICY_HISTORY FOR INS.V_GRP_POLICY_HISTORY;


--
-- V_GRP_POLICY_PAY_HISTORY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_GRP_POLICY_PAY_HISTORY FOR INS.V_GRP_POLICY_PAY_HISTORY;


--
-- V_LATE_FEE_WAIVE_APP  (Synonym) 
--
CREATE PUBLIC SYNONYM V_LATE_FEE_WAIVE_APP FOR INS.V_LATE_FEE_WAIVE_APP;


--
-- V_LATEFEE_NESTED  (Synonym) 
--
CREATE PUBLIC SYNONYM V_LATEFEE_NESTED FOR INS.V_LATEFEE_NESTED;


--
-- V_PEN_RE_INS_POLICY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_PEN_RE_INS_POLICY FOR INS.V_PEN_RE_INS_POLICY;


--
-- V_POL_LOAN_APRVL_PENDING  (Synonym) 
--
CREATE PUBLIC SYNONYM V_POL_LOAN_APRVL_PENDING FOR INS.V_POL_LOAN_APRVL_PENDING;


--
-- V_POL_LOAN_BANK_RECON  (Synonym) 
--
CREATE PUBLIC SYNONYM V_POL_LOAN_BANK_RECON FOR INS.V_POL_LOAN_BANK_RECON;


--
-- V_POL_LOAN_CHEQUE_WRITE  (Synonym) 
--
CREATE PUBLIC SYNONYM V_POL_LOAN_CHEQUE_WRITE FOR INS.V_POL_LOAN_CHEQUE_WRITE;


--
-- V_POLICY_HISTORY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_POLICY_HISTORY FOR INS.V_POLICY_HISTORY;


--
-- V_POLICY_PAY_HISTORY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_POLICY_PAY_HISTORY FOR INS.V_POLICY_PAY_HISTORY;


--
-- V_SER_COLL_PAY_DUE  (Synonym) 
--
CREATE PUBLIC SYNONYM V_SER_COLL_PAY_DUE FOR INS.V_SER_COLL_PAY_DUE;


--
-- V_SER_COLL_PAY_DUE_SPC  (Synonym) 
--
CREATE PUBLIC SYNONYM V_SER_COLL_PAY_DUE_SPC FOR INS.V_SER_COLL_PAY_DUE_SPC;


--
-- V_SURRENDER_APRVL_PENDING  (Synonym) 
--
CREATE PUBLIC SYNONYM V_SURRENDER_APRVL_PENDING FOR INS.V_SURRENDER_APRVL_PENDING;


--
-- V_SURRENDER_CHEQUE_WRITE  (Synonym) 
--
CREATE PUBLIC SYNONYM V_SURRENDER_CHEQUE_WRITE FOR INS.V_SURRENDER_CHEQUE_WRITE;


--
-- V_UNADJ_PARTIAL_COLL  (Synonym) 
--
CREATE PUBLIC SYNONYM V_UNADJ_PARTIAL_COLL FOR INS.V_UNADJ_PARTIAL_COLL;


--
-- V_UNADJ_PREM_COLL  (Synonym) 
--
CREATE PUBLIC SYNONYM V_UNADJ_PREM_COLL FOR INS.V_UNADJ_PREM_COLL;


--
-- VHRM_EMP_TARGET  (Synonym) 
--
CREATE PUBLIC SYNONYM VHRM_EMP_TARGET FOR INS.VHRM_EMP_TARGET;


--
-- VCLM_COMMUTE_PAYMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_COMMUTE_PAYMENT FOR INS.VCLM_COMMUTE_PAYMENT;


--
-- VCLM_DEDUCTION  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_DEDUCTION FOR INS.VCLM_DEDUCTION;


--
-- VCLM_PAYABLE_APPROVAL  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_PAYABLE_APPROVAL FOR INS.VCLM_PAYABLE_APPROVAL;


--
-- VCOM_AGENT_COMM_BILL  (Synonym) 
--
CREATE PUBLIC SYNONYM VCOM_AGENT_COMM_BILL FOR INS.VCOM_AGENT_COMM_BILL;


--
-- VCOM_DEV_EMP_COMM_BILL  (Synonym) 
--
CREATE PUBLIC SYNONYM VCOM_DEV_EMP_COMM_BILL FOR INS.VCOM_DEV_EMP_COMM_BILL;


--
-- VGRP_CLAIM_APPL  (Synonym) 
--
CREATE PUBLIC SYNONYM VGRP_CLAIM_APPL FOR INS.VGRP_CLAIM_APPL;


--
-- V_UNADJUSTED_COLLECTION  (Synonym) 
--
CREATE PUBLIC SYNONYM V_UNADJUSTED_COLLECTION FOR INS.V_UNADJUSTED_COLLECTION;


--
-- VCLM_CLAIM_PAYMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_CLAIM_PAYMENT FOR INS.VCLM_CLAIM_PAYMENT;


--
-- VCLM_CLAIM_PRIVILEGE  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_CLAIM_PRIVILEGE FOR INS.VCLM_CLAIM_PRIVILEGE;


--
-- VCLM_COMMUT_APP_APPROVAL  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_COMMUT_APP_APPROVAL FOR INS.VCLM_COMMUT_APP_APPROVAL;


--
-- VCLM_COMMUTE_APPROVAL  (Synonym) 
--
CREATE PUBLIC SYNONYM VCLM_COMMUTE_APPROVAL FOR INS.VCLM_COMMUTE_APPROVAL;


--
-- DCAV_DOC_RETRIEVAL  (Synonym) 
--
CREATE PUBLIC SYNONYM DCAV_DOC_RETRIEVAL FOR INS.DCAV_DOC_RETRIEVAL;


--
-- V_EMP_ADV_PAYMENT_RECOVERY  (Synonym) 
--
CREATE PUBLIC SYNONYM V_EMP_ADV_PAYMENT_RECOVERY FOR INS.V_EMP_ADV_PAYMENT_RECOVERY;


--
-- V_EMP_ADV_PAYMENT  (Synonym) 
--
CREATE PUBLIC SYNONYM V_EMP_ADV_PAYMENT FOR INS.V_EMP_ADV_PAYMENT;


--
-- V_ADV_COLL_SUMMARY_CFO  (Synonym) 
--
CREATE PUBLIC SYNONYM V_ADV_COLL_SUMMARY_CFO FOR INS.V_ADV_COLL_SUMMARY_CFO;


/* Formatted on 10/12/2023 12:07:47 PM (QP5 v5.115.810.9015) */
--
-- V_LATEFEE  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_LATEFEE
(
   WAIVER_RATE,
   DUE_DATE,
   CIRCULAR_ID,
   CIRCULAR_MSG,
   CIRCULAR_DT
)
AS
     SELECT   MAX (a.waiver_rate) waiver_rate,
              a.due_date,
              a.circular_id,
              a.circular_msg,
              a.circular_dt
       FROM   temp_latefee_waiver_circular a
      WHERE   due_date NOT IN (  SELECT   due_date FROM v_latefee_nested)
              AND a.waiver_category = '1'
   GROUP BY   a.waiver_rate,
              a.due_date,
              a.circular_id,
              a.circular_msg,
              a.circular_dt
   ORDER BY   a.circular_id;


/* Formatted on 10/12/2023 12:07:47 PM (QP5 v5.115.810.9015) */
--
-- V_LATEFEE_WAIVER  (View)
--

CREATE OR REPLACE FORCE VIEW INS.V_LATEFEE_WAIVER
(
   PGID,
   CIRCULAR_ID,
   CIRCULAR_MSG,
   CIRCULAR_DT,
   WAIVER_RATE
)
AS
   SELECT   DISTINCT y.pgid,
                     x.circular_id,
                     x.circular_msg,
                     x.circular_dt,
                     x.waiver_rate
     FROM   (  SELECT   MAX (waiver_rate) waiver_rate,
                        due_date,
                        circular_id,
                        circular_msg,
                        circular_dt
                 FROM   (SELECT   waiver_rate,
                                  due_date,
                                  circular_id,
                                  circular_msg,
                                  circular_dt
                           FROM   v_latefee_nested
                         UNION ALL
                         SELECT   waiver_rate,
                                  due_date,
                                  circular_id,
                                  circular_msg,
                                  circular_dt
                           FROM   v_latefee)
             GROUP BY   due_date,
                        circular_id,
                        circular_msg,
                        circular_dt,
                        waiver_rate
             ORDER BY   due_date) x, temp_latefee_waiver_circular y;


--
-- V_LATEFEE  (Synonym) 
--
CREATE PUBLIC SYNONYM V_LATEFEE FOR INS.V_LATEFEE;


--
-- V_LATEFEE_WAIVER  (Synonym) 
--
CREATE PUBLIC SYNONYM V_LATEFEE_WAIVER FOR INS.V_LATEFEE_WAIVER;


GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_ACC_AGE;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_ACC_AGE;

GRANT SELECT ON INS.V_BANK_RECON TO RL_ACC_AGE;

GRANT SELECT ON INS.V_LATEFEE_NESTED TO RL_ACC_AGE;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ACC_AGE;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_AGE;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_ACC_AGE;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_ACC_AGE;

GRANT SELECT ON INS.V_UNADJ_PARTIAL_COLL TO RL_ACC_AGE;

GRANT SELECT ON INS.V_UNADJ_PREM_COLL TO RL_ACC_AGE;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_LATEFEE_NESTED TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_UNADJ_PARTIAL_COLL TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_UNADJ_PREM_COLL TO RL_ACC_AGENCY;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_ACC_CASH_HEAD_TRF;

GRANT SELECT ON INS.V_GRP_COLL_VIEW TO RL_ACC_CASH_TRF;

GRANT SELECT ON INS.V_GRP_POLICY_HISTORY TO RL_ACC_CASH_TRF;

GRANT SELECT ON INS.V_GRP_POLICY_PAY_HISTORY TO RL_ACC_CASH_TRF;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_ACC_INCHARGE_SER;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ACC_INCHARGE_SER;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_INCHARGE_SER;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_ACC_NB_AGENCY;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_ACC_ORG;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_ACC_ORG;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ACC_ORG;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_ORG;

GRANT SELECT ON INS.V_ACC_BRANCH TO RL_ACC_PRF;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_RPT;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE_SPC TO RL_ACC_RPT;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_ACC_RPT_ICD;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_ACC_RPT_ORG;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_ACC_RPT_ORG;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_ACC_SALARY_TRF;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_ACC_SALARY_TRF;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_ACC_TRF;

GRANT SELECT ON INS.V_BANK_RECON TO RL_ACC_TRF;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_ACC_TRF;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ACC_TRF;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_TRF;

GRANT SELECT ON INS.V_POL_LOAN_CHEQUE_WRITE TO RL_ACC_TRF;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_ACC_TRF_ORG;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_ACC_TRF_ORG;

GRANT SELECT ON INS.V_BANK_RECON TO RL_ACC_TRF_ORG;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ACC_TRF_ORG;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ACC_TRF_ORG;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_ACC_ZONE;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_ALTERATION_APPLICATION_TRF;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_ALTERATION_APPLICATION_TRF;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_AUDIT;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_AUDIT;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_AUDIT;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_AUDIT;

GRANT SELECT ON INS.V_PEN_RE_INS_POLICY TO RL_AUDIT;

GRANT SELECT ON INS.V_POL_LOAN_CHEQUE_WRITE TO RL_AUDIT;

GRANT SELECT ON INS.V_ACC_BRANCH TO RL_BANK_BRANCH_INFORMATION_TRF;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_CAHSIAR;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_CAHSIAR;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_CAHSIAR;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_CAHSIAR;

GRANT SELECT ON INS.V_BANK_RECON TO RL_CAHSIAR;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_CAHSIAR;

GRANT SELECT ON INS.V_LATEFEE_NESTED TO RL_CAHSIAR;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_CAHSIAR;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_CAHSIAR;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_CAHSIAR;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_CAHSIAR;

GRANT SELECT ON INS.V_UNADJ_PARTIAL_COLL TO RL_CAHSIAR;

GRANT SELECT ON INS.V_UNADJ_PREM_COLL TO RL_CAHSIAR;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_CASHIER_02;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_CASHIER_02;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_CASHIER_02;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_CHAQUE_WRITE_PRINT;

GRANT SELECT ON INS.V_SURRENDER_CHEQUE_WRITE TO RL_CHAQUE_WRITE_PRINT;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_CHEAK_TRF;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_CHEQUE_TRF_HEAD;

GRANT SELECT ON INS.V_POL_LOAN_CHEQUE_WRITE TO RL_CHEQUE_TRF_HEAD;

GRANT SELECT ON INS.VCLM_CLAIM_PRIVILEGE TO RL_CLAIM_APPROVAL;

GRANT SELECT ON INS.VCLM_PAYABLE_APPROVAL TO RL_CLAIM_APPROVAL;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_CLAIM_DEPUTY_TRF;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE TO RL_CLAIM_DEPUTY_TRF;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_CLAIM_PRIVILEGE TO RL_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_COMMUTE_APPROVAL TO RL_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_COMMUTE_PAYMENT TO RL_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_COMMUT_APP_APPROVAL TO RL_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_CLAIM_TRF_ORG;

GRANT SELECT ON INS.VCLM_CLAIM_PRIVILEGE TO RL_CLAIM_TRF_ORG;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_CMS_BILL_DISBUSEMENT;

GRANT SELECT ON INS.VCOM_DEV_EMP_COMM_BILL TO RL_CMS_BILL_DISBUSEMENT;

GRANT SELECT ON INS.VCOM_AGENT_COMM_BILL TO RL_CMS_TRF;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_CMS_TRR;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_DALIL_TRF;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_DEATH_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_CLAIM_PRIVILEGE TO RL_DEATH_CLAIM_TRF;

GRANT SELECT ON INS.VCLM_COMMUT_APP_APPROVAL TO RL_DEATH_CLAIM_TRF;

GRANT SELECT ON INS.DCAV_DOC_RETRIEVAL TO RL_DRC_TRF;

GRANT SELECT ON INS.VGRP_CLAIM_APPL TO RL_GROUP_TRF;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_ICD_PR;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_INCHARGE_CLAIM;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_INCHARGE_CLAIM;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_INCHARGE_CLAIM;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE TO RL_INCHARGE_CLAIM;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_INCHARGE_CLAIM;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.VCLM_CLAIM_PRIVILEGE TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.VCLM_COMMUT_APP_APPROVAL TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_INCHARGE_IT_CLAIM;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_INCHARGE_PR;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE TO RL_INCHARGE_PR;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE_SPC TO RL_INCHARGE_PR;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_MEDIA_NO_USE_INFORMATION;

GRANT SELECT ON INS.VHRM_EMP_TARGET TO RL_MIS_RPT_ACC;

GRANT SELECT ON INS.VHRM_EMP_TARGET TO RL_MIS_TRF_RPT;

GRANT SELECT ON INS.VHRM_EMP_TARGET TO RL_MIS_TRR;

GRANT SELECT ON INS.V_BANK_RECON TO RL_MODHUMOTI_BANK_PREM_COLLECT;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_PMIS_ADM_PRF;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_PMIS_OFFICE_CTRL_PRF;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_POLICY_DALIL_INCHARGE;

GRANT SELECT ON INS.V_PEN_RE_INS_POLICY TO RL_POLICY_DALIL_INCHARGE;

GRANT SELECT ON INS.V_LATE_FEE_WAIVE_APP TO RL_POLICY_DOC_SERVICE;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_POLICY_LOAN_TRF;

GRANT SELECT ON INS.V_POL_LOAN_APRVL_PENDING TO RL_POLICY_LOAN_TRF;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_PR_DEP_TRF;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_PR_DEP_TRF;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE TO RL_PR_DEP_TRF;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE_SPC TO RL_PR_DEP_TRF;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_PR_DEP_TRF;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_PR_MANAGEMENT;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_PR_TRF;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_PR_TRF;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_PR_TRF_OFFICE;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_PR_TRF_OFFICE;

GRANT SELECT ON INS.V_PEN_RE_INS_POLICY TO RL_REIINSURANCE_TRF;

GRANT SELECT ON INS.V_PEN_RE_INS_POLICY TO RL_RE_INSURANCE_TRF;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_SER_TRF;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_SER_TRF;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_SER_TRF;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_SER_TRF_IT;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_SER_TRF_IT;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_SER_TRF_ORG;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_SER_TRF_ORG;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_SER_UPGRADE_INCHARGE;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_SER_UPGRADE_INCHARGE;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE TO RL_SER_UPGRADE_INCHARGE;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE_SPC TO RL_SER_UPGRADE_INCHARGE;

GRANT SELECT ON INS.HRMV_OFFICE_SETUP TO RL_SP_INCHARGE;

GRANT SELECT ON INS.VCLM_CLAIM_PAYMENT TO RL_SP_INCHARGE;

GRANT SELECT ON INS.VCLM_CLAIM_PRIVILEGE TO RL_SP_INCHARGE;

GRANT SELECT ON INS.VCLM_COMMUT_APP_APPROVAL TO RL_SP_INCHARGE;

GRANT SELECT ON INS.V_ACC_PARTIAL_COLLECTION TO RL_SP_INCHARGE;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_SP_INCHARGE;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_SP_INCHARGE;

GRANT SELECT ON INS.V_UNADJUSTED_COLLECTION TO RL_SP_INCHARGE;

GRANT SELECT ON INS.V_SURRENDER_APRVL_PENDING TO RL_SUR_TRF;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_UPDATE_LEGER_TRF;

GRANT SELECT ON INS.V_POLICY_PAY_HISTORY TO RL_UPDATE_LEGER_TRF;

GRANT SELECT ON INS.V_COLL_ALL_RECEIVABLES TO RL_UPGREAD_DEPUTY;

GRANT SELECT ON INS.V_POLICY_HISTORY TO RL_UPGREAD_DEPUTY;

GRANT SELECT ON INS.V_SER_COLL_PAY_DUE TO RL_UPGREAD_DEPUTY;

GRANT SELECT ON INS.V_LATEFEE TO RL_ACC_AGE;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ACC_AGE;

GRANT SELECT ON INS.V_LATEFEE TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ACC_AGENCY;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ACC_INCHARGE_SER;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ACC_ORG;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ACC_TRF;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ACC_TRF_ORG;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_ALTERATION_APPLICATION_TRF;

GRANT SELECT ON INS.V_LATEFEE TO RL_CAHSIAR;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_CAHSIAR;

GRANT SELECT ON INS.V_LATEFEE_WAIVER TO RL_SER_TRF;

