--
-- ACC_ADVANCE_RECEIVABLES_FROM  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."ACC_ADVANCE_RECEIVABLES_FROM" 
   BEFORE INSERT
   ON ins.acc_advance_receivables
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       user_insert_from
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        15/01/2015  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any Insert operation perform on  ACC_RECEIVABLES then


******************************************************************************/
BEGIN
   :NEW.create_from_ip := SYS_CONTEXT ('USERENV', 'IP_ADDRESS', 15);
END acc_advance_receivables_from;
/


--
-- ACC_OTH_COLL_DELETE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."ACC_OTH_COLL_DELETE_LOG" 
   BEFORE DELETE
   ON ins.acc_oth_coll_mst
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
BEGIN
   INSERT INTO acc_oth_coll_mst_log
               (receive_id, receive_dt, office_cd,
                trans_tp_cd, mode_tp, coll_media_cd,
                coll_slip_no, coll_slip_rec_dt,
                receive_mode_cd, chq_no, chq_dt,
                bank_cd, br_cd, trns_amt, vouch_ref,
                rev_vouch_ref, remarks, status,
                collected_by, approved_st, approved_by,
                approved_date, bank_depo_st, bank_depo_by,
                bank_depo_dt, cheque_honor_st,
                cheque_honor_by, cheque_honor_dt, i_usr,
                i_dt, u_usr, u_dt, payment_id,
                collection_from, ins_tp_cd, pgid,
                collection_from_gid, action_usr, action_dt
               )
        VALUES (:OLD.receive_id, :OLD.receive_dt, :OLD.office_cd,
                :OLD.trans_tp_cd, :OLD.mode_tp, :OLD.coll_media_cd,
                :OLD.coll_slip_no, :OLD.coll_slip_rec_dt,
                :OLD.receive_mode_cd, :OLD.chq_no, :OLD.chq_dt,
                :OLD.bank_cd, :OLD.br_cd, :OLD.trns_amt, :OLD.vouch_ref,
                :OLD.rev_vouch_ref, :OLD.remarks, :OLD.status,
                :OLD.collected_by, :OLD.approved_st, :OLD.approved_by,
                :OLD.approved_date, :OLD.bank_depo_st, :OLD.bank_depo_by,
                :OLD.bank_depo_dt, :OLD.cheque_honor_st,
                :OLD.cheque_honor_by, :OLD.cheque_honor_dt, :OLD.i_usr,
                :OLD.i_dt, :OLD.u_usr, :OLD.u_dt, :OLD.payment_id,
                :OLD.collection_from, :OLD.ins_tp_cd, :OLD.pgid,
                :OLD.collection_from_gid, USER, SYSDATE
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END acc_oth_coll_delete_log;
/


--
-- ACC_RECEIVABLES_FROM  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."ACC_RECEIVABLES_FROM" 
   BEFORE INSERT
   ON ins.acc_receivables
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       user_insert_from
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        15/01/2015  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any Insert operation perform on  ACC_RECEIVABLES then


******************************************************************************/
BEGIN
   :NEW.create_from_ip := SYS_CONTEXT ('USERENV', 'IP_ADDRESS', 15);
END acc_receivables_from;
/


--
-- AGENT_COM_BILL_MST_UPDEL_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."AGENT_COM_BILL_MST_UPDEL_LOG"
   BEFORE DELETE
   ON INS.COM_AGENT_COM_BILL_MST    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       policy_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        09/03/20231  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  COM_AGENT_COM_BILL_MST then
   old information is inserted into COM_AGENT_COM_BILL_MST_LOG

******************************************************************************/
BEGIN
   INSERT INTO COM_AGENT_COM_BILL_MST_LOG (BILL_NO,
                                           BILL_DATE,
                                           AGENT_ID,
                                           OFFICE_CD,
                                           GROSS_PAYABLE_AMT,
                                           TAX_DED_REQ,
                                           TAX_DED_RATE,
                                           TAX_DED_AMT,
                                           BILL_AMOUNT,
                                           CHEQUE_NO,
                                           CHEQUE_DT,
                                           OFF_BANK_CD,
                                           OFF_BR_CD,
                                           OFF_ACC_NO,
                                           AGENT_ACC_NO,
                                           AGENT_ACC_BANK_CD,
                                           AGENT_ACC_BR_CD,
                                           STAMP_AMT,
                                           STAMP_MONEY_RECEIVE,
                                           STAMP_VR_NO,
                                           DISBURSE_STATUS,
                                           DISBURSE_VR_NO,
                                           DISBURSE_DT,
                                           DISBURSE_BY,
                                           REMARKS,
                                           I_USR,
                                           I_DT,
                                           U_USR,
                                           U_DT,
                                           INS_TP_CD,
                                           SERVICE_CHARGE_ST,
                                           PAYABLE_OFFICE,
                                           TAX_PAYABLE_VR_NO,
                                           AGENT_PAYMENT_TYPE,
                                           TOT_DED_AMOUNT,
                                           TOT_PAID_DED_AMOUNT,
                                           TOT_PAID_INTEREST_AMT,
                                           TOT_PAID_BILL_AMT)
     VALUES   (:OLD.BILL_NO,
               :OLD.BILL_DATE,
               :OLD.AGENT_ID,
               :OLD.OFFICE_CD,
               :OLD.GROSS_PAYABLE_AMT,
               :OLD.TAX_DED_REQ,
               :OLD.TAX_DED_RATE,
               :OLD.TAX_DED_AMT,
               :OLD.BILL_AMOUNT,
               :OLD.CHEQUE_NO,
               :OLD.CHEQUE_DT,
               :OLD.OFF_BANK_CD,
               :OLD.OFF_BR_CD,
               :OLD.OFF_ACC_NO,
               :OLD.AGENT_ACC_NO,
               :OLD.AGENT_ACC_BANK_CD,
               :OLD.AGENT_ACC_BR_CD,
               :OLD.STAMP_AMT,
               :OLD.STAMP_MONEY_RECEIVE,
               :OLD.STAMP_VR_NO,
               :OLD.DISBURSE_STATUS,
               :OLD.DISBURSE_VR_NO,
               :OLD.DISBURSE_DT,
               :OLD.DISBURSE_BY,
               :OLD.REMARKS,
               :OLD.I_USR,
               :OLD.I_DT,
               :OLD.U_USR,
               sysdate,
               :OLD.INS_TP_CD,
               :OLD.SERVICE_CHARGE_ST,
               :OLD.PAYABLE_OFFICE,
               :OLD.TAX_PAYABLE_VR_NO,
               :OLD.AGENT_PAYMENT_TYPE,
               :OLD.TOT_DED_AMOUNT,
               :OLD.TOT_PAID_DED_AMOUNT,
               :OLD.TOT_PAID_INTEREST_AMT,
               :OLD.TOT_PAID_BILL_AMT);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END AGENT_COM_BILL_MST_UPDEL_LOG;
/


--
-- CLM_PAY_GEN_DELETE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS.CLM_PAY_GEN_DELETE_LOG
   BEFORE DELETE
   ON INS.CLM_CLAIM_PAYABLE_GEN    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       CLM_PAY_GEN_DELETE_LOG
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        23-Aug-23  1.Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  CLM_CLAIM_PAYABLE_GEN then
   old information is inserted into CLM_CLAIM_PAYABLE_GEN_LOG

******************************************************************************/
BEGIN
   INSERT INTO CLM_CLAIM_PAYABLE_GEN_LOG (PAYABLE_NO,
                                          CALC_NO,
                                          PGID,
                                          PRODUCT_CD,
                                          SL_NO,
                                          SUPP_FLAG,
                                          SUPP_PROD_CD,
                                          SUPP_BEN_CD,
                                          CLM_CAUSE_CD,
                                          CLM_DETL_CD,
                                          BEN_PARTY_CD,
                                          GEN_DATE,
                                          GROSS_PAYABLE_AMT,
                                          BONUS_PAYABLE,
                                          LOAN_DED_AMT,
                                          OTHER_DED_AMT,
                                          NET_PAYABLE_AMT,
                                          PAYMENT_STATUS,
                                          BANK_CD,
                                          BRANCH_CD,
                                          BANK_ACC_NO,
                                          REMARKS,
                                          PAYMENT_TYPE,
                                          INSTALLMENT_TYPE,
                                          PAY_DEPENDS_ON,
                                          NO_PAYMNET_YR,
                                          PAYMENT_MONTH,
                                          PAYMENT_YEAR,
                                          I_USR,
                                          I_DT,
                                          U_USR,
                                          U_DT,
                                          LAST_APPROVED_BY,
                                          LAST_APVL_LEVEL_CD,
                                          APPROVED_FLAG,
                                          PAYMENT_DT,
                                          CHEQUE_NO,
                                          CHEQUE_DT,
                                          VOUCH_NO,
                                          VOUCH_DT,
                                          ACC_PAYABLE_VRNO,
                                          ACC_INTR_VRNO,
                                          SUSPENSE_AMT,
                                          ANF_PREMIUM_AMT,
                                          ANF_LATE_FEE,
                                          LOAN_INTEREST,
                                          BANK_ADDRESS,
                                          PAY_ORDER_NO,
                                          INTIMATION_NO,
                                          PAYMENT_FOR,
                                          ADVANCE_PAYMENT,
                                          ACTUAL_PAYABLE_AMT,
                                          ACTUAL_PAYABLE_DT,
                                          APPL_NO,
                                          ACTUAL_BONUS_AMT,
                                          DISB_BANK_CD,
                                          DISB_BR_CD,
                                          DISB_ACC_NO,
                                          DISB_GL_NO,
                                          APPROVED_DT,
                                          CHEQUE_WRITTEN_BY,
                                          CHEQUE_WRITTEN_DT,
                                          CHEQUE_ISSUED_BY,
                                          CHEQUE_ISSUED_DT,
                                          CHEQUE_DISB_BY,
                                          CHEQUE_DISB_DT,
                                          CLAIM_APPL_NO,
                                          SOURCE_TAX,
                                          PREM_DUE_LATE_FEE,
                                          OFF_MANUAL_DED_AMT,
                                          CHEQUE_NO_2ND,
                                          CHEQUE_DATE_2ND,
                                          UNADJ_COLL_AMT,
                                          BANK_CD_2ND,
                                          BR_CD_2ND,
                                          BANK_ACC_NO_2ND,
                                          DISB_BANK_CD_2ND,
                                          DISB_BR_CD_2ND,
                                          DISB_ACC_NO_2ND,
                                          CHEQUE_RECEIVER_INFO,
                                          VOUCH_NO_2ND,
                                          CONTROL_OFFICE_CD,
                                          UPDATE_OFFICE,
                                          PAYMENT_STATUS_2ND,
                                          BANK_CD_PREM,
                                          BR_CD_PREM,
                                          BANK_ACC_NO_PREM,
                                          DISB_BANK_CD_PREM,
                                          DISB_BR_CD_PREM,
                                          DISB_ACC_NO_PREM,
                                          VOUCH_NO_PREM,
                                          PAID_PREM_LATE_FEE,
                                          CHEQUE_NO_PREM,
                                          CHEQUE_DT_PREM,
                                          NR_APPROVED_FLAG,
                                          ALT_DUE_AMOUNT)
     VALUES   (:OLD.PAYABLE_NO,
               :OLD.CALC_NO,
               :OLD.PGID,
               :OLD.PRODUCT_CD,
               :OLD.SL_NO,
               :OLD.SUPP_FLAG,
               :OLD.SUPP_PROD_CD,
               :OLD.SUPP_BEN_CD,
               :OLD.CLM_CAUSE_CD,
               :OLD.CLM_DETL_CD,
               :OLD.BEN_PARTY_CD,
               :OLD.GEN_DATE,
               :OLD.GROSS_PAYABLE_AMT,
               :OLD.BONUS_PAYABLE,
               :OLD.LOAN_DED_AMT,
               :OLD.OTHER_DED_AMT,
               :OLD.NET_PAYABLE_AMT,
               :OLD.PAYMENT_STATUS,
               :OLD.BANK_CD,
               :OLD.BRANCH_CD,
               :OLD.BANK_ACC_NO,
               :OLD.REMARKS,
               :OLD.PAYMENT_TYPE,
               :OLD.INSTALLMENT_TYPE,
               :OLD.PAY_DEPENDS_ON,
               :OLD.NO_PAYMNET_YR,
               :OLD.PAYMENT_MONTH,
               :OLD.PAYMENT_YEAR,
               :OLD.I_USR,
               :OLD.I_DT,
               :OLD.U_USR,
               :OLD.U_DT,
               :OLD.LAST_APPROVED_BY,
               :OLD.LAST_APVL_LEVEL_CD,
               :OLD.APPROVED_FLAG,
               :OLD.PAYMENT_DT,
               :OLD.CHEQUE_NO,
               :OLD.CHEQUE_DT,
               :OLD.VOUCH_NO,
               :OLD.VOUCH_DT,
               :OLD.ACC_PAYABLE_VRNO,
               :OLD.ACC_INTR_VRNO,
               :OLD.SUSPENSE_AMT,
               :OLD.ANF_PREMIUM_AMT,
               :OLD.ANF_LATE_FEE,
               :OLD.LOAN_INTEREST,
               :OLD.BANK_ADDRESS,
               :OLD.PAY_ORDER_NO,
               :OLD.INTIMATION_NO,
               :OLD.PAYMENT_FOR,
               :OLD.ADVANCE_PAYMENT,
               :OLD.ACTUAL_PAYABLE_AMT,
               :OLD.ACTUAL_PAYABLE_DT,
               :OLD.APPL_NO,
               :OLD.ACTUAL_BONUS_AMT,
               :OLD.DISB_BANK_CD,
               :OLD.DISB_BR_CD,
               :OLD.DISB_ACC_NO,
               :OLD.DISB_GL_NO,
               :OLD.APPROVED_DT,
               :OLD.CHEQUE_WRITTEN_BY,
               :OLD.CHEQUE_WRITTEN_DT,
               :OLD.CHEQUE_ISSUED_BY,
               :OLD.CHEQUE_ISSUED_DT,
               :OLD.CHEQUE_DISB_BY,
               :OLD.CHEQUE_DISB_DT,
               :OLD.CLAIM_APPL_NO,
               :OLD.SOURCE_TAX,
               :OLD.PREM_DUE_LATE_FEE,
               :OLD.OFF_MANUAL_DED_AMT,
               :OLD.CHEQUE_NO_2ND,
               :OLD.CHEQUE_DATE_2ND,
               :OLD.UNADJ_COLL_AMT,
               :OLD.BANK_CD_2ND,
               :OLD.BR_CD_2ND,
               :OLD.BANK_ACC_NO_2ND,
               :OLD.DISB_BANK_CD_2ND,
               :OLD.DISB_BR_CD_2ND,
               :OLD.DISB_ACC_NO_2ND,
               :OLD.CHEQUE_RECEIVER_INFO,
               :OLD.VOUCH_NO_2ND,
               :OLD.CONTROL_OFFICE_CD,
               :OLD.UPDATE_OFFICE,
               :OLD.PAYMENT_STATUS_2ND,
               :OLD.BANK_CD_PREM,
               :OLD.BR_CD_PREM,
               :OLD.BANK_ACC_NO_PREM,
               :OLD.DISB_BANK_CD_PREM,
               :OLD.DISB_BR_CD_PREM,
               :OLD.DISB_ACC_NO_PREM,
               :OLD.VOUCH_NO_PREM,
               :OLD.PAID_PREM_LATE_FEE,
               :OLD.CHEQUE_NO_PREM,
               :OLD.CHEQUE_DT_PREM,
               :OLD.NR_APPROVED_FLAG,
               :OLD.ALT_DUE_AMOUNT);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END CLM_PAY_GEN_DELETE_LOG;
/


--
-- COLL_MEDIA_DELETE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."COLL_MEDIA_DELETE_LOG" 
   BEFORE DELETE
   ON ins.acc_coll_media_dtl
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
BEGIN
   INSERT INTO acc_coll_media_dtl_log
               (group_number, media_no, pr_book_no,
                status, req_id, office_cd, used_status,
                used_date, i_usr, i_dt, u_usr,
                u_dt, sl_no, send_print_st, receive_st,
                comments, pr_year, pr_serail_number,
                media_type, pre_req_id, update_comm,
                second_update, refund_st,
                applicable_using_yr, bank_cd, br_cd, action_usr,
                action_dt
               )
        VALUES (:OLD.group_number, :OLD.media_no, :OLD.pr_book_no,
                :OLD.status, :OLD.req_id, :OLD.office_cd, :OLD.used_status,
                :OLD.used_date, :OLD.i_usr, :OLD.i_dt, :OLD.u_usr,
                :OLD.u_dt, :OLD.sl_no, :OLD.send_print_st, :OLD.receive_st,
                :OLD.comments, :OLD.pr_year, :OLD.pr_serail_number,
                :OLD.media_type, :OLD.pre_req_id, :OLD.update_comm,
                :OLD.second_update, :OLD.refund_st,
                :OLD.applicable_using_yr, :OLD.bank_cd, :OLD.br_cd, USER,
                SYSDATE
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END coll_media_delete_log;
/


--
-- COLL_MEDIA_DELETE_LOG_BM  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."COLL_MEDIA_DELETE_LOG_BM" 
   BEFORE DELETE
   ON ins.acc_coll_media_dtl_BM
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
BEGIN
   INSERT INTO acc_coll_media_dtl_log
               (group_number, media_no, pr_book_no,
                status, req_id, office_cd, used_status,
                used_date, i_usr, i_dt, u_usr,
                u_dt, sl_no, send_print_st, receive_st,
                comments, pr_year, pr_serail_number,
                media_type, pre_req_id, update_comm,
                second_update, refund_st,
                applicable_using_yr, bank_cd, br_cd, action_usr,
                action_dt
               )
        VALUES (:OLD.group_number, :OLD.media_no, :OLD.pr_book_no,
                :OLD.status, :OLD.req_id, :OLD.office_cd, :OLD.used_status,
                :OLD.used_date, :OLD.i_usr, :OLD.i_dt, :OLD.u_usr,
                :OLD.u_dt, :OLD.sl_no, :OLD.send_print_st, :OLD.receive_st,
                :OLD.comments, :OLD.pr_year, :OLD.pr_serail_number,
                :OLD.media_type, :OLD.pre_req_id, :OLD.update_comm,
                :OLD.second_update, :OLD.refund_st,
                :OLD.applicable_using_yr, :OLD.bank_cd, :OLD.br_cd, USER,
                SYSDATE
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END coll_media_delete_log;
/


--
-- HRM_AGENT_UPDATE_DELETE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."HRM_AGENT_UPDATE_DELETE_LOG" 
   BEFORE UPDATE OR DELETE
   ON ins.hrm_agent
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       policy_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        14-Sep-11  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any update or delete operation perform on  HRM_AGENTthen
   old information is inserted into HRM_AGENT_hist

******************************************************************************/
BEGIN
   INSERT INTO hrm_agent_hist
               (agent_id, file_no, salut, agent_nm_eng,
                agent_nm_bng, sex_cd, birth_dt, join_dt,
                confirm_dt, activity_cd, service_cd,
                employment_st_cd, target_amount,
                marital_stat_cd, religion_cd, license_no,
                license_valid_from_dt, i_usr, i_dt,
                u_usr, u_dt, dev_emp_gid, office_cd,
                target_basis, agent_glac_no, effect_dt,
                target_term, license_valid_to_dt, acc_type,
                account_no, acc_bank_cd, acc_br_cd,
                recruit_cd, lot_no, ledger_no,
                mob_bank_acc_no, mob_acc_bank_cd,
                mob_acc_auth_mob_no, payment_tp,
                activity_cd_change_dt, mr_no, mr_dt,
                mr_amount, action_by, action_date,
                action_from_ip
               )
        VALUES (:OLD.agent_id, :OLD.file_no, :OLD.salut, :OLD.agent_nm_eng,
                :OLD.agent_nm_bng, :OLD.sex_cd, :OLD.birth_dt, :OLD.join_dt,
                :OLD.confirm_dt, :OLD.activity_cd, :OLD.service_cd,
                :OLD.employment_st_cd, :OLD.target_amount,
                :OLD.marital_stat_cd, :OLD.religion_cd, :OLD.license_no,
                :OLD.license_valid_from_dt, :OLD.i_usr, :OLD.i_dt,
                :OLD.u_usr, :OLD.u_dt, :OLD.dev_emp_gid, :OLD.office_cd,
                :OLD.target_basis, :OLD.agent_glac_no, :OLD.effect_dt,
                :OLD.target_term, :OLD.license_valid_to_dt, :OLD.acc_type,
                :OLD.account_no, :OLD.acc_bank_cd, :OLD.acc_br_cd,
                :OLD.recruit_cd, :OLD.lot_no, :OLD.ledger_no,
                :OLD.mob_bank_acc_no, :OLD.mob_acc_bank_cd,
                :OLD.mob_acc_auth_mob_no, :OLD.payment_tp,
                :OLD.activity_cd_change_dt, :OLD.mr_no, :OLD.mr_dt,
                :OLD.mr_amount, USER, SYSDATE,
                SYS_CONTEXT ('USERENV', 'IP_ADDRESS', 15)
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END hrm_agent_update_delete_log;
/


--
-- HRM_EMPLOYEE_UPDATE_DELETE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."HRM_EMPLOYEE_UPDATE_DELETE_LOG" 
   BEFORE UPDATE OR DELETE
   ON ins.hrm_employee
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       policy_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        14-Sep-11  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any update or delete operation perform on  HRM_EMPLOYEE then
   old information is inserted into HRM_EMPLOYEE_hist

******************************************************************************/
BEGIN
   INSERT INTO hrm_employee_hist
               (emp_gid, employment_tp_cd, emp_id,
                emp_file_no, salut, emp_nm_eng,
                emp_nm_bng, emp_type_cd, desig_cd,
                sex_cd, office_cd, divdept_cd, birth_dt,
                join_dt, confirm_dt, lpr_dt, retire_dt,
                activity_cd, service_cd, employment_st_cd,
                paysc_id, pay_level, curr_basic,
                last_incre_dt, last_prom_dt, pen_pay_stat,
                marital_stat_cd, religion_cd, muniloc_cd,
                i_usr, i_dt, u_usr, u_dt,
                previous_basic, pfc_ded_stat, emp_glac_no,
                target_basis, target_amount, effect_dt,
                target_term, sal_pay_stat, bank_account_no,
                bank_br_cd, bank_account_status, grade_cd,
                mem_type, incharge_st, effect_dt_on_salary,
                section_cd, emp_id_old,
                activity_cd_change_dt, bank_cd,
                certificate_no, certificate_dt_from,
                certificate_dt_to, old_emp_file_no, action_by, action_date,
                action_from_ip
               )
        VALUES (:OLD.emp_gid, :OLD.employment_tp_cd, :OLD.emp_id,
                :OLD.emp_file_no, :OLD.salut, :OLD.emp_nm_eng,
                :OLD.emp_nm_bng, :OLD.emp_type_cd, :OLD.desig_cd,
                :OLD.sex_cd, :OLD.office_cd, :OLD.divdept_cd, :OLD.birth_dt,
                :OLD.join_dt, :OLD.confirm_dt, :OLD.lpr_dt, :OLD.retire_dt,
                :OLD.activity_cd, :OLD.service_cd, :OLD.employment_st_cd,
                :OLD.paysc_id, :OLD.pay_level, :OLD.curr_basic,
                :OLD.last_incre_dt, :OLD.last_prom_dt, :OLD.pen_pay_stat,
                :OLD.marital_stat_cd, :OLD.religion_cd, :OLD.muniloc_cd,
                :OLD.i_usr, :OLD.i_dt, :OLD.u_usr, :OLD.u_dt,
                :OLD.previous_basic, :OLD.pfc_ded_stat, :OLD.emp_glac_no,
                :OLD.target_basis, :OLD.target_amount, :OLD.effect_dt,
                :OLD.target_term, :OLD.sal_pay_stat, :OLD.bank_account_no,
                :OLD.bank_br_cd, :OLD.bank_account_status, :OLD.grade_cd,
                :OLD.mem_type, :OLD.incharge_st, :OLD.effect_dt_on_salary,
                :OLD.section_cd, :OLD.emp_id_old,
                :OLD.activity_cd_change_dt, :OLD.bank_cd,
                :OLD.certificate_no, :OLD.certificate_dt_from,
                :OLD.certificate_dt_to, :OLD.old_emp_file_no, USER, SYSDATE,
                SYS_CONTEXT ('USERENV', 'IP_ADDRESS', 15)
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END hrm_employee_update_delete_log;
/


--
-- INS_UW_ACCPT_UPD_DEL_TGR  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS.ins_uw_accpt_upd_del_tgr
   BEFORE DELETE
   ON INS.INS_UW_ACCPT_GEN    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:        ins.ins_uw_accpt_upd_del_tgr
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        07-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  Iins_uw_accpt_gen then
   old information is inserted into ins_uw_accpt_gen_log

******************************************************************************/
BEGIN
   INSERT INTO ins_uw_accpt_gen_log (PGID,
                                     ACCEPTENCE_TYPE,
                                     ASSURANCE_TYPE,
                                     PRODUCT_CD,
                                     TERM,
                                     SUM_ASSURERD,
                                     COMM_DT,
                                     GENDER_EXTRA,
                                     OCCU_EXTRA,
                                     ASSESSED_LIFE_STD_CLASS_CD,
                                     ACCEPTED_LIFE_STD_CLASS_CD,
                                     LIFE_CLASS_EXTRA,
                                     SUPPL_BEN_EXTRA,
                                     SUPPL_PRD_EXTRA,
                                     OTHER_EXTRA,
                                     UW_CD,
                                     REGION,
                                     OPTION_CD,
                                     I_USR,
                                     I_DT,
                                     U_USR,
                                     U_DT,
                                     OBJECTIVE_CD,
                                     PAY_MODE_CD,
                                     YEARLY_PREMIUM,
                                     INSTALLMENT_PREMIUM,
                                     AGE,
                                     STAFF_REBATE,
                                     EMP_ID,
                                     DESIG_CD,
                                     OFFICE_CD,
                                     JOIN_DT,
                                     POLICY_CATG_CD,
                                     APPROVE_LIFE_CLASS_EXTRA,
                                     ALTER_POLICY,
                                     UW_SL,
                                     ALT_SL,
                                     LIFE_PREMIUM,
                                     SUM_ASSURED,
                                     EMP_GID,
                                     RISK_DATE,
                                     action_user,
                                     action_date)
     VALUES   (:old.PGID,
               :old.ACCEPTENCE_TYPE,
               :old.ASSURANCE_TYPE,
               :old.PRODUCT_CD,
               :old.TERM,
               :old.SUM_ASSURERD,
               :old.COMM_DT,
               :old.GENDER_EXTRA,
               :old.OCCU_EXTRA,
               :old.ASSESSED_LIFE_STD_CLASS_CD,
               :old.ACCEPTED_LIFE_STD_CLASS_CD,
               :old.LIFE_CLASS_EXTRA,
               :old.SUPPL_BEN_EXTRA,
               :old.SUPPL_PRD_EXTRA,
               :old.OTHER_EXTRA,
               :old.UW_CD,
               :old.REGION,
               :old.OPTION_CD,
               :old.I_USR,
               :old.I_DT,
               :old.U_USR,
               :old.U_DT,
               :old.OBJECTIVE_CD,
               :old.PAY_MODE_CD,
               :old.YEARLY_PREMIUM,
               :old.INSTALLMENT_PREMIUM,
               :old.AGE,
               :old.STAFF_REBATE,
               :old.EMP_ID,
               :old.DESIG_CD,
               :old.OFFICE_CD,
               :old.JOIN_DT,
               :old.POLICY_CATG_CD,
               :old.APPROVE_LIFE_CLASS_EXTRA,
               :old.ALTER_POLICY,
               :old.UW_SL,
               :old.ALT_SL,
               :old.LIFE_PREMIUM,
               :old.SUM_ASSURED,
               :old.EMP_GID,
               :old.RISK_DATE,
               USER,
               SYSDATE);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END ins_uw_accpt_upd_del_tgr;
/


--
-- POLICY_UPDATE_DELETE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."POLICY_UPDATE_DELETE_LOG" 
   BEFORE UPDATE OR DELETE
   ON INS.INS_P_SUMMERY    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       policy_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        14-Sep-11  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ins_p_summery then
   old information is inserted into ins_p_summery_history

******************************************************************************/
BEGIN
   INSERT INTO ins_p_summery_history
            (pgid
           , proposal_date
           , comm_date
           , risk_date
           , fpr_no
           , dob
           , age
           , age_docu_cd
           , sex_cd
           , option_cd
           , sum_assured
           , product_cd
           , term
           , pay_mode_cd
           , policy_installment
           , life_premium
           , suppl_ben_premium
           , suppl_product_premium
           , pay_mode_rebate
           , staff_rebate
           , sum_rebate
           , total_yearly_premium
           , installment_premium
           , maturity_date
           , zone_cd
           , agent_id
           , cession_no
           , last_paid_inst_no
           , last_paid_date
           , next_due_inst_no
           , next_due_date
           , policy_status
           , apparal_state_cd
           , ownership_cd
           , i_usr
           , i_dt
           , u_usr
           , u_dt
           , emp_gid
           , suspense_amt
           , cession_dt
           , office_cd
           , fpr_issue_invalid
           , policy_status_dt
           , paid_up_dt
           , paid_up_status
           , gender_extra_amt
           , occu_extra_amt
           , life_class_extra_amt
           , accepted_life_std_class_cd
           , extra_premium
           , do_gid
           , do_office_cd
           , dm_gid
           , re_ins_amount
           , last_adjustment_dt
           , fpr_issue
           , branch_off
           , sales_off
           , zonal_off
           , regional_off
           , servicing_off
           , policy_catg_cd
           , remarks_id
           , action_usr
           , action_dt
            )
        VALUES (:OLD.pgid
        , :OLD.proposal_date
        , :OLD.comm_date
        , :OLD.risk_date
        , :OLD.fpr_no
        , :OLD.dob
        , :OLD.age
        , :OLD.age_docu_cd
        , :OLD.sex_cd
        , :OLD.option_cd
        , :OLD.sum_assured
        , :OLD.product_cd
        , :OLD.term
        , :OLD.pay_mode_cd
        , :OLD.policy_installment
        , :OLD.life_premium
        , :OLD.suppl_ben_premium
        , :OLD.suppl_product_premium
        , :OLD.pay_mode_rebate
        , :OLD.staff_rebate
        , :OLD.sum_rebate
        , :OLD.total_yearly_premium
        , :OLD.installment_premium
        , :OLD.maturity_date
        , :OLD.zone_cd
        , :OLD.agent_id
        , :OLD.cession_no
        , :OLD.last_paid_inst_no
        , :OLD.last_paid_date
        , :OLD.next_due_inst_no
        , :OLD.next_due_date
        , :OLD.policy_status
        , :OLD.apparal_state_cd
        , :OLD.ownership_cd
        , :OLD.i_usr
        , :OLD.i_dt
        , :OLD.u_usr
        , :OLD.u_dt
        , :OLD.emp_gid
        , :OLD.suspense_amt
        , :OLD.cession_dt
        , :OLD.office_cd
        , :OLD.fpr_issue_invalid
        , :OLD.policy_status_dt
        , :OLD.paid_up_dt
        , :OLD.paid_up_status
        , :OLD.gender_extra_amt
        , :OLD.occu_extra_amt
        , :OLD.life_class_extra_amt
        , :OLD.accepted_life_std_class_cd
        , :OLD.extra_premium
        , :OLD.do_gid
        , :OLD.do_office_cd
        , :OLD.dm_gid
        , :OLD.re_ins_amount
        , :OLD.last_adjustment_dt
        , :OLD.fpr_issue
        , :OLD.branch_off
        , :OLD.sales_off
        , :OLD.zonal_off
        , :OLD.regional_off
        , :OLD.servicing_off
        , :OLD.policy_catg_cd
        , '03'
        , USER
        , SYSDATE);
EXCEPTION
   WHEN OTHERS THEN
      -- Consider logging the error and then re-raise
      RAISE;
END policy_update_delete_log;
/


--
-- TRG_ACC_ADVANCE_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS.TRG_ACC_advance_LOG
   BEFORE DELETE
   ON INS.ACC_ADVANCE_RECEIVABLES    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   /******************************************************************************
   NAME:       TRG_ACC_advance_LOG
   PURPOSE: TO store  data for tracing which are deleted or updated.

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        30-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ACC_ADV_RECEIVABLES then
   old information is inserted into  ACC_ADV_RECEIVABLES_DELETE_LOG

******************************************************************************/
DECLARE
BEGIN
   INSERT INTO ACC_ADV_RECEIVABLES_DELETE_LOG (RECEIVE_ID,
                                               RECEIVE_DATE,
                                               PGID,
                                               PROPOSAL_NO,
                                               COLLECTION_TYPE,
                                               MODE_TP,
                                               COLL_SLIP_NO,
                                               COLL_SLIP_REC_DT,
                                               RECEIVE_MODE,
                                               CHEQUE_NO,
                                               CHEQUE_DATE,
                                               TO_BANK_CD,
                                               TO_BR_CD,
                                               COLL_AMOUNT,
                                               STATUS,
                                               REC_STATUS,
                                               CHEQUE_DEPOSIT,
                                               COM_CALCULATED,
                                               COLL_SL_NO,
                                               OFFICE_CODE,
                                               ACTIVE_OFFICE_CD,
                                               ADJUSTMENT_DATE,
                                               ADJUSTED_BY,
                                               COM_EXE_DATE,
                                               VOUCH_REF,
                                               INTEROFFICE_VOUCHER,
                                               RECEIVED_BY,
                                               I_USR,
                                               I_DT,
                                               U_USR,
                                               U_DT,
                                               PARTY_NM,
                                               ADJ_VOUCHER,
                                               SLNO,
                                               COLLECTED_LATE_FEE,
                                               STAMP_AMT,
                                               AMT_SUBMIT_ST,
                                               AMT_SUBMIT_DT,
                                               COLL_CHECK_STATUS,
                                               COLL_CHECK_DT,
                                               COLL_CHECKED_BY,
                                               PRODUCT_CD,
                                               REV_VOUCHER,
                                               POL_FRM_PREV_POL_ST,
                                               COLL_FROM,
                                               API_COLLECTION_ID,
                                               PRINT_ST,
                                               PARTNER_TRANSID,
                                               PARTNER_CODE)
     VALUES   (:OLD.RECEIVE_ID,
               :OLD.RECEIVE_DATE,
               :OLD.PGID,
               :OLD.PROPOSAL_NO,
               :OLD.COLLECTION_TYPE,
               :OLD.MODE_TP,
               :OLD.COLL_SLIP_NO,
               :OLD.COLL_SLIP_REC_DT,
               :OLD.RECEIVE_MODE,
               :OLD.CHEQUE_NO,
               :OLD.CHEQUE_DATE,
               :OLD.TO_BANK_CD,
               :OLD.TO_BR_CD,
               :OLD.COLL_AMOUNT,
               :OLD.STATUS,
               :OLD.REC_STATUS,
               :OLD.CHEQUE_DEPOSIT,
               :OLD.COM_CALCULATED,
               :OLD.COLL_SL_NO,
               :OLD.OFFICE_CODE,
               :OLD.ACTIVE_OFFICE_CD,
               :OLD.ADJUSTMENT_DATE,
               :OLD.ADJUSTED_BY,
               :OLD.COM_EXE_DATE,
               :OLD.VOUCH_REF,
               :OLD.INTEROFFICE_VOUCHER,
               :OLD.RECEIVED_BY,
               :OLD.I_USR,
               :OLD.I_DT,
               :OLD.U_USR,
               :OLD.U_DT,
               :OLD.PARTY_NM,
               :OLD.ADJ_VOUCHER,
               :OLD.SLNO,
               :OLD.COLLECTED_LATE_FEE,
               :OLD.STAMP_AMT,
               :OLD.AMT_SUBMIT_ST,
               :OLD.AMT_SUBMIT_DT,
               :OLD.COLL_CHECK_STATUS,
               :OLD.COLL_CHECK_DT,
               :OLD.COLL_CHECKED_BY,
               :OLD.PRODUCT_CD,
               :OLD.REV_VOUCHER,
               :OLD.POL_FRM_PREV_POL_ST,
               :OLD.COLL_FROM,
               :OLD.API_COLLECTION_ID,
               :OLD.PRINT_ST,
               :OLD.PARTNER_TRANSID,
               :OLD.PARTNER_CODE);
END TRG_ACC_advance_LOG;
/


--
-- TRG_ACC_BANK_TRANS_MST_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_BANK_TRANS_MST_LOG"
   BEFORE DELETE 
   ON ins.ACC_BANK_TRAN_MST
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   /******************************************************************************
   NAME:       TRG_ACC_BANK_TRANS_MST_LOG"
   PURPOSE: TO store  data for tracing which are deleted or updated.

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        27-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ACC_BANK_TRANS_MST then
   old information is inserted into  ACC_BANK_TRAN_MST_LOG
******************************************************************************/
DECLARE
BEGIN
   INSERT INTO ACC_BANK_TRAN_MST_LOG (TRAN_ID,
                                      TRAN_DT,
                                      OFFICE_CD,
                                      TRAN_TP,
                                      BANK_ACC_NO,
                                      BANK_CD,
                                      BR_CD,
                                      TRAN_BY,
                                      VOUCHER_NO,
                                      REV_VOUCHER_NO,
                                      I_USR,
                                      I_DT,
                                      U_USR,
                                      U_DT,
                                      PAYMENT_TP,
                                      COLL_DT_FRM,
                                      COLL_DT_TO,
                                      ACC_GLAC_NO,
                                      ACC_TP,
                                      INS_TP_CD,
                                      COLL_PURPOSE,
                                      PAY_SLIP_NO,
                                      TOT_DEPOSIT_AMT,
                                      TAG)
     VALUES   (:OLD.TRAN_ID,
               :OLD.TRAN_DT,
               :OLD.OFFICE_CD,
               :OLD.TRAN_TP,
               :OLD.BANK_ACC_NO,
               :OLD.BANK_CD,
               :OLD.BR_CD,
               :OLD.TRAN_BY,
               :OLD.VOUCHER_NO,
               :OLD.REV_VOUCHER_NO,
               :OLD.I_USR,
               :OLD.I_DT,
               :OLD.U_USR,
               :OLD.U_DT,
               :OLD.PAYMENT_TP,
               :OLD.COLL_DT_FRM,
               :OLD.COLL_DT_TO,
               :OLD.ACC_GLAC_NO,
               :OLD.ACC_TP,
               :OLD.INS_TP_CD,
               :OLD.COLL_PURPOSE,
               :OLD.PAY_SLIP_NO,
               :OLD.TOT_DEPOSIT_AMT,
               :OLD.TAG);
END trg_acc_gl_trans_mst_del;
/


--
-- TRG_ACC_BANK_TRAN_DTL_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_BANK_TRAN_DTL_LOG"
   BEFORE DELETE 
   ON ins.ACC_BANK_TRAN_DTL
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   /******************************************************************************
   NAME:       TRG_ACC_BANK_TRAN_DTL_LOG"
   PURPOSE: TO store  data for tracing which are deleted or updated.

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        27-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ACC_BANK_TRANS_DTL then
   old information is inserted into  ACC_BANK_TRAN_DTL_LOG
******************************************************************************/
DECLARE
BEGIN
   INSERT INTO ACC_BANK_TRAN_DTL_LOG (TRAN_ID,
                                      SL_NO,
                                      PAYMENT_TP,
                                      CHEQUE_NO,
                                      CHEQUE_DT,
                                      BANK_CD,
                                      BR_CD,
                                      PAY_SLIP_NO,
                                      AMOUNT,
                                      I_USR,
                                      I_DT,
                                      U_USR,
                                      U_DT,
                                      PGID,
                                      DEPOSIT_ST,
                                      RECEIVE_ID,
                                      SLNO,
                                      COLL_PURPOSE,
                                      ACC_TP)
     VALUES   (:OLD.TRAN_ID,
               :OLD.SL_NO,
               :OLD.PAYMENT_TP,
               :OLD.CHEQUE_NO,
               :OLD.CHEQUE_DT,
               :OLD.BANK_CD,
               :OLD.BR_CD,
               :OLD.PAY_SLIP_NO,
               :OLD.AMOUNT,
               :OLD.I_USR,
               :OLD.I_DT,
               :OLD.U_USR,
               :OLD.U_DT,
               :OLD.PGID,
               :OLD.DEPOSIT_ST,
               :OLD.RECEIVE_ID,
               :OLD.SLNO,
               :OLD.COLL_PURPOSE,
               :OLD.ACC_TP);
END TRG_ACC_BANK_TRAN_DTL_LOG;
/


--
-- TRG_ACC_COLL_SUMMERY_DEL_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_COLL_SUMMERY_DEL_LOG"
   BEFORE DELETE 
   ON ins.ACC_COLL_SUMMERY
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   /******************************************************************************
   NAME:       TRG_ACC_COLL_SUMMERY_DEL_LOG
  PURPOSE: TO store  data for tracing which are deleted or updated.

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        27-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ACC_COLL_SUMMERY then
   old information is inserted into  ACC_COLL_SUMMERY_DELETE_LOG
******************************************************************************/
DECLARE
BEGIN
   INSERT INTO ACC_COLL_SUMMERY_DELETE_LOG (RECEIVE_ID,
                                            PGID,
                                            COLL_FROM,
                                            INSTALLMENT_NO,
                                            ACTIVE_OFFICE_CD,
                                            ACTIVE_BRANCH_CD,
                                            ACTIVE_SALES_CD,
                                            ACTIVE_ZONAL_CD,
                                            ACTIVE_REGIONAL_CD,
                                            OFFICE_CODE,
                                            RECEIVE_DT,
                                            AMOUNT_TYPE,
                                            STATUS,
                                            COLLECTION_TYPE,
                                            RECEIVE_MODE,
                                            PROCESS_DATE,
                                            FIRST_PREM,
                                            DEFFERED,
                                            SECOND_YR,
                                            RENEWAL,
                                            LATE_FEE,
                                            SUSPENSE_AMT,
                                            F_COLL_AMOUNT,
                                            D_COLL_AMOUNT,
                                            S_COLL_AMOUNT,
                                            R_COLL_AMOUNT,
                                            AVL_SUS_AMT,
                                            DUE_DATE,
                                            BUSINESS_YR,
                                            BRANCH_OFF,
                                            SALES_OFF,
                                            ZONAL_OFF,
                                            REGIONAL_OFF,
                                            SERVICING_OFF,
                                            CHEQUE_NO,
                                            TO_BANK_CD,
                                            TO_BR_CD,
                                            U_DATE,
                                            BUSINESS_DATE,
                                            AGENT_ID,
                                            UM_GID,
                                            BM_GID,
                                            BC_GID,
                                            DC_GID,
                                            RC_GID,
                                            DVC_GID,
                                            CC_GID,
                                            INS_TP_CD,
                                            REC_STATUS,
                                            PROJECT_CD,
                                            POLICY_FILE_TP,
                                            COLL_FROM_DEPT,
                                            COM_BILL_DATE,
                                            COM_EXE_DATE,
                                            AGM_GID,
                                            DGM_GID,
                                            GM_GID)
     VALUES   (:OLD.RECEIVE_ID,
               :OLD.PGID,
               :OLD.COLL_FROM,
               :OLD.INSTALLMENT_NO,
               :OLD.ACTIVE_OFFICE_CD,
               :OLD.ACTIVE_BRANCH_CD,
               :OLD.ACTIVE_SALES_CD,
               :OLD.ACTIVE_ZONAL_CD,
               :OLD.ACTIVE_REGIONAL_CD,
               :OLD.OFFICE_CODE,
               :OLD.RECEIVE_DT,
               :OLD.AMOUNT_TYPE,
               :OLD.STATUS,
               :OLD.COLLECTION_TYPE,
               :OLD.RECEIVE_MODE,
               :OLD.PROCESS_DATE,
               :OLD.FIRST_PREM,
               :OLD.DEFFERED,
               :OLD.SECOND_YR,
               :OLD.RENEWAL,
               :OLD.LATE_FEE,
               :OLD.SUSPENSE_AMT,
               :OLD.F_COLL_AMOUNT,
               :OLD.D_COLL_AMOUNT,
               :OLD.S_COLL_AMOUNT,
               :OLD.R_COLL_AMOUNT,
               :OLD.AVL_SUS_AMT,
               :OLD.DUE_DATE,
               :OLD.BUSINESS_YR,
               :OLD.BRANCH_OFF,
               :OLD.SALES_OFF,
               :OLD.ZONAL_OFF,
               :OLD.REGIONAL_OFF,
               :OLD.SERVICING_OFF,
               :OLD.CHEQUE_NO,
               :OLD.TO_BANK_CD,
               :OLD.TO_BR_CD,
               :OLD.U_DATE,
               :OLD.BUSINESS_DATE,
               :OLD.AGENT_ID,
               :OLD.UM_GID,
               :OLD.BM_GID,
               :OLD.BC_GID,
               :OLD.DC_GID,
               :OLD.RC_GID,
               :OLD.DVC_GID,
               :OLD.CC_GID,
               :OLD.INS_TP_CD,
               :OLD.REC_STATUS,
               :OLD.PROJECT_CD,
               :OLD.POLICY_FILE_TP,
               :OLD.COLL_FROM_DEPT,
               :OLD.COM_BILL_DATE,
               :OLD.COM_EXE_DATE,
               :OLD.AGM_GID,
               :OLD.DGM_GID,
               :OLD.GM_GID);
END TRG_ACC_COLL_SUMMERY_DEL_LOG;
/


--
-- TRG_ACC_GL_TRANS_DTL_DEL  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_GL_TRANS_DTL_DEL" 
   BEFORE DELETE
   ON ins.acc_gl_trans_dtl
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
BEGIN
   INSERT INTO acc_gl_trans_dtl_del_log
               (office_cd, vouch_no, sl_no, glac_sl_no,
                dr_cr, trans_amt, chq_tp, chq_no,
                chq_dt, i_usr, i_dt, u_usr, u_dt,
                create_from_ip, action_usr, action_dt
               )
        VALUES (:OLD.office_cd, :OLD.vouch_no, :OLD.sl_no, :OLD.glac_sl_no,
                :OLD.dr_cr, :OLD.trans_amt, :OLD.chq_tp, :OLD.chq_no,
                :OLD.chq_dt, :OLD.i_usr, :OLD.i_dt, :OLD.u_usr, :OLD.u_dt,
                SYS_CONTEXT ('USERENV', 'IP_ADDRESS', 15), USER, SYSDATE
               );
END trg_acc_gl_trans_dtl_del;
/


--
-- TRG_ACC_GL_TRANS_MST_DEL  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_GL_TRANS_MST_DEL" 
   BEFORE DELETE
   ON ins.acc_gl_trans_mst
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
BEGIN
   INSERT INTO acc_gl_trans_mst_del_log
               (office_cd, vouch_no, vouch_dt, vouch_cd,
                status, bank_recon_st, source_vouch_no,
                cost_center, object_cd, trans_id,
                narration, i_usr, i_dt, u_usr,
                u_dt, ins_tp_cd, old_cost_center,
                cost_center_vr_no, ledger_st, payable_st,
                old_vouch_no, adjustment_st,
                create_from_ip, action_usr, action_dt
               )
        VALUES (:OLD.office_cd, :OLD.vouch_no, :OLD.vouch_dt, :OLD.vouch_cd,
                :OLD.status, :OLD.bank_recon_st, :OLD.source_vouch_no,
                :OLD.cost_center, :OLD.object_cd, :OLD.trans_id,
                :OLD.narration, :OLD.i_usr, :OLD.i_dt, :OLD.u_usr,
                :OLD.u_dt, :OLD.ins_tp_cd, :OLD.old_cost_center,
                :OLD.cost_center_vr_no, :OLD.ledger_st, :OLD.payable_st,
                :OLD.old_vouch_no, :OLD.adjustment_st,
                SYS_CONTEXT ('USERENV', 'IP_ADDRESS', 15), USER, SYSDATE
               );
END trg_acc_gl_trans_mst_del;
/


--
-- TRG_ACC_RECEIVEABLES_DEL_LOG  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_RECEIVEABLES_DEL_LOG"
   BEFORE DELETE
   ON ins.ACC_RECEIVABLES
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
   /******************************************************************************
   NAME:       TRG_ACC_RECEIVEABLES_DEL_LOG
   PURPOSE: TO store  data for tracing which are deleted or updated.

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        30-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ACC_RECEIVABLES_DEL_LOG then
   old information is inserted into  ACC_RECEIVABLES_DEL_LOG
******************************************************************************/
DECLARE
BEGIN
   INSERT INTO ACC_RECEIVABLES_DEL_LOG (RECEIVE_ID,
                                        RECEIVE_DATE,
                                        RECEIVED_BY,
                                        COLLECTION_TYPE,
                                        OFFICE_CODE,
                                        RECEIVE_MODE,
                                        COLL_SLIP_NO,
                                        COLL_AMOUNT,
                                        PGID,
                                        BANK_BRANCH_NAME,
                                        CHEQUE_NO,
                                        CHEQUE_DATE,
                                        VOUCH_REF,
                                        COLL_SLIP_BY,
                                        I_USR,
                                        I_DT,
                                        U_USR,
                                        U_DT,
                                        COLL_SLIP_REC_DT,
                                        TO_BANK_CD,
                                        TO_BR_CD,
                                        STATUS,
                                        PREMIUM_STATUS,
                                        INSTALLMENT_NO_FROM,
                                        AVL_SUS_AMT,
                                        INSTALLMENT_NO_TO,
                                        DUE_DT_FROM,
                                        DUE_DT_TO,
                                        TOT_PREMIUM_AMT,
                                        LATE_FEE,
                                        INTEROFFICE_VOUCHER,
                                        ACTIVE_OFFICE_CD,
                                        MODE_TP,
                                        COLL_SL_NO,
                                        WEB_FEED_SEND,
                                        REC_STATUS,
                                        LATEFEE_WAIVER,
                                        CHEQUE_DEPOSIT,
                                        RECEIPT_STATUS,
                                        COLLECTION_TIME_POL_STAT,
                                        COM_CALCULATED,
                                        ADJUSTMENT_DATE,
                                        ADV_STATUS,
                                        MAN_ADJUSTED,
                                        ADJUSTED_BY,
                                        COM_EXE_DATE,
                                        LAST_DUE_DT_OF_COM_EXE,
                                        ALT_SL,
                                        ADJUSTED_BY_DGH,
                                        STAMP_AMT,
                                        AMT_SUBMIT_ST,
                                        AMT_SUBMIT_DT,
                                        COLL_CHECK_STATUS,
                                        COLL_CHECK_DT,
                                        COLL_CHECKED_BY,
                                        SUMMERY_FLAG,
                                        BANK_DEPOSIT_ST,
                                        ADJ_SLIP_NO,
                                        CREATE_FROM_IP,
                                        RECEIVE_ID_SL_NO,
                                        OLD_ACTIVE_OFFICE_CD,
                                        REV_VOUCHER,
                                        OLD_COLL_SLIP_REC_DT,
                                        RETURN_ST,
                                        ACTION_IP_ADDRESS,
                                        ACTION_TERMINAL_NAME,
                                        ACTION_OS_USER_NAME,
                                        COLL_FROM,
                                        API_COLLECTION_ID,
                                        PRINT_ST,
                                        ACTUAL_I_USR,
                                        NO_OF_SYNC,
                                        LAST_SYNC_DATE,
                                        PARTNER_TRANSID,
                                        PARTNER_CODE,
                                        CNG_DATE,
                                        IDRA_COLL_ENTRY_FLAG)
     VALUES   (:OLD.RECEIVE_ID,
               :OLD.RECEIVE_DATE,
               :OLD.RECEIVED_BY,
               :OLD.COLLECTION_TYPE,
               :OLD.OFFICE_CODE,
               :OLD.RECEIVE_MODE,
               :OLD.COLL_SLIP_NO,
               :OLD.COLL_AMOUNT,
               :OLD.PGID,
               :OLD.BANK_BRANCH_NAME,
               :OLD.CHEQUE_NO,
               :OLD.CHEQUE_DATE,
               :OLD.VOUCH_REF,
               :OLD.COLL_SLIP_BY,
               :OLD.I_USR,
               :OLD.I_DT,
               :OLD.U_USR,
               :OLD.U_DT,
               :OLD.COLL_SLIP_REC_DT,
               :OLD.TO_BANK_CD,
               :OLD.TO_BR_CD,
               :OLD.STATUS,
               :OLD.PREMIUM_STATUS,
               :OLD.INSTALLMENT_NO_FROM,
               :OLD.AVL_SUS_AMT,
               :OLD.INSTALLMENT_NO_TO,
               :OLD.DUE_DT_FROM,
               :OLD.DUE_DT_TO,
               :OLD.TOT_PREMIUM_AMT,
               :OLD.LATE_FEE,
               :OLD.INTEROFFICE_VOUCHER,
               :OLD.ACTIVE_OFFICE_CD,
               :OLD.MODE_TP,
               :OLD.COLL_SL_NO,
               :OLD.WEB_FEED_SEND,
               :OLD.REC_STATUS,
               :OLD.LATEFEE_WAIVER,
               :OLD.CHEQUE_DEPOSIT,
               :OLD.RECEIPT_STATUS,
               :OLD.COLLECTION_TIME_POL_STAT,
               :OLD.COM_CALCULATED,
               :OLD.ADJUSTMENT_DATE,
               :OLD.ADV_STATUS,
               :OLD.MAN_ADJUSTED,
               :OLD.ADJUSTED_BY,
               :OLD.COM_EXE_DATE,
               :OLD.LAST_DUE_DT_OF_COM_EXE,
               :OLD.ALT_SL,
               :OLD.ADJUSTED_BY_DGH,
               :OLD.STAMP_AMT,
               :OLD.AMT_SUBMIT_ST,
               :OLD.AMT_SUBMIT_DT,
               :OLD.COLL_CHECK_STATUS,
               :OLD.COLL_CHECK_DT,
               :OLD.COLL_CHECKED_BY,
               :OLD.SUMMERY_FLAG,
               :OLD.BANK_DEPOSIT_ST,
               :OLD.ADJ_SLIP_NO,
               :OLD.CREATE_FROM_IP,
               :OLD.RECEIVE_ID_SL_NO,
               :OLD.OLD_ACTIVE_OFFICE_CD,
               :OLD.REV_VOUCHER,
               :OLD.OLD_COLL_SLIP_REC_DT,
               :OLD.RETURN_ST,
               :OLD.ACTION_IP_ADDRESS,
               :OLD.ACTION_TERMINAL_NAME,
               :OLD.ACTION_OS_USER_NAME,
               :OLD.COLL_FROM,
               :OLD.API_COLLECTION_ID,
               :OLD.PRINT_ST,
               :OLD.ACTUAL_I_USR,
               :OLD.NO_OF_SYNC,
               :OLD.LAST_SYNC_DATE,
               :OLD.PARTNER_TRANSID,
               :OLD.PARTNER_CODE,
               :OLD.CNG_DATE,
               :OLD.IDRA_COLL_ENTRY_FLAG);
END TRG_ACC_RECEIVEABLES_DEL_LOG;
/


--
-- TRG_ACC_REC_COLL_SLNO  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_REC_COLL_SLNO"
   BEFORE INSERT
   ON acc_receivables
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   v_receive_id   NUMBER (12) := '';
   -------------
   v_coll_sl_no   NUMBER (10);
   v_process_st   VARCHAR2 (200);
/******************************************************************************
   NAME:       data_validation
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                      Description
   ---------  ----------    -------------------------   -----------------------
   1.0        30-Nov-2015   1. Syed Md. Musha   1. Created this trigger.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     data_validation
      Sysdate:         05-Dec-2010
      Date and Time:   05-Dec-2010, 1:34:30 PM, and 05-Dec-2010 1:34:30 PM
      Username:         (set in TOAD Options, Proc Templates)
      Table Name:      ACC_RECEIVABLES (set in the "New PL/SQL Object" dialog)
      Trigger Options:  (set in the "New PL/SQL Object" dialog)
******************************************************************************/
BEGIN
   --Generate collection serial no for online collection--
   IF :NEW.mode_tp = '1' AND :NEW.i_usr <> 'SLICL'
    THEN                                                  ---Online collection
       pro_coll_sl_no (p_office_cd       => :NEW.active_office_cd,
                       p_fiscale_yr      => TO_CHAR (:NEW.receive_date, 'RRRR'),
                       p_mode_tp         => :NEW.mode_tp,
                       p_coll_sl_no      => v_coll_sl_no,
                       p_process_st      => v_process_st
                      );

       IF v_process_st = 'SUCCESS' AND v_coll_sl_no IS NOT NULL
       THEN
          :NEW.coll_sl_no := v_coll_sl_no;
       ELSE
          raise_application_error (-20100, 'Online serial no. not generated');
       END IF;
    END IF; 

   :NEW.actual_i_usr := USER;
END aaa;
/


--
-- TRG_ACC_TRANS_MST_VR  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_ACC_TRANS_MST_VR" 
   BEFORE INSERT
   ON INS.ACC_GL_TRANS_MST    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   v_cost_center_vr_no   VARCHAR2 (30);
   v_error               VARCHAR2 (200);
/******************************************************************************
   NAME:   trg_acc_trans_mst_vr
   PURPOSE: Generate cost center wise voucher no

   REVISIONS:
   Ver        Date          Author                      Description
   ---------  ----------    -------------------------   -----------------------
   1.0        4-Feb-2016    1. Syed Md. Musha           1. Created this trigger.

   NOTES:


******************************************************************************/
BEGIN
   pro_cost_center_voucher_no (p_cost_center       => NVL (:NEW.cost_center,
                                                           :NEW.office_cd
                                                          ),
                               p_voucher_cd        => :NEW.vouch_cd,
                               p_voucher_date      => :NEW.vouch_dt,
                               p_user              => :NEW.i_usr,
                               p_voucher_no        => v_cost_center_vr_no,
                               p_error             => v_error
                              );

   IF v_cost_center_vr_no IS NOT NULL
   THEN
      :NEW.cost_center_vr_no := v_cost_center_vr_no;
   ELSE
      NULL;
      /*raise_application_error (-20100,
                                  v_error
                               || '- Cost Center Voucher No. Not Generated'
                              );*/
   END IF;
END trg_acc_trans_mst_vr;
/


--
-- TRG_CLM_PAYABLE_GEN_DEL_CHK  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_CLM_PAYABLE_GEN_DEL_CHK" 
   BEFORE DELETE
   ON ins.clm_claim_payable_gen
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DISABLE
DECLARE
   v_detl_cnt   NUMBER (2) := 0;
/******************************************************************************
   NAME:       trg_CLM_CLAIM_PAYABLE_GEN_detl_chk
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/7/2013             1. Created this trigger.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     trg_CLM_CLAIM_PAYABLE_GEN_detl_chk
      Sysdate:         10/7/2013
      Date and Time:   10/7/2013, 11:06:39 AM, and 10/7/2013 11:06:39 AM
      Username:         (set in TOAD Options, Proc Templates)
      Table Name:      CLM_CLAIM_PAYABLE_GEN (set in the "New PL/SQL Object" dialog)
      Trigger Options:  (set in the "New PL/SQL Object" dialog)
******************************************************************************/
BEGIN
   SELECT COUNT (pgid)
     INTO v_detl_cnt
     FROM clm_payable_calc_detl d
    WHERE d.payable_no = :OLD.payable_no;

   IF v_detl_cnt > 0
   THEN
      raise_application_error (-20110, 'Details Record Exists');
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END trg_clm_payable_gen_del_chk;
/


--
-- TRG_HRM_AGENT_OFF_INCHRG_HIST  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_HRM_AGENT_OFF_INCHRG_HIST" 
   BEFORE UPDATE OR DELETE
   ON INS.HRM_AGENT_OFF_INCHARGE    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       trg_hrm_agent_off_inchrg_hist
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        26-apr-2021  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any update or delete operation perform on  HRM_AGENT_OFF_INCHARGE then
   old information is inserted into HRM_AGENT_OFF_INCHARGE_HIST

******************************************************************************/
BEGIN
   INSERT INTO hrm_agent_off_incharge_hist (office_code,
                                            incharge_emp_gid,
                                            desig_cd,
                                            start_dt,
                                            end_dt,
                                            mobile,
                                            status,
                                            i_usr,
                                            i_dt,
                                            u_usr,
                                            u_dt)
     VALUES   (:OLD.office_code,
               :OLD.incharge_emp_gid,
               :OLD.desig_cd,
               :OLD.start_dt,
               (:NEW.start_dt - 1),
               :OLD.mobile,
               '0',
               :OLD.i_usr,
               :OLD.i_dt,
               :NEW.i_usr,
               SYSDATE);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END trg_hrm_agent_off_inchrg_hist;
/


--
-- TRG_HRM_OFF_INCHARGE_HIST  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_HRM_OFF_INCHARGE_HIST" 
   BEFORE UPDATE OR DELETE
   ON INS.HRM_OFF_INCHARGE    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       trg_hrm_off_incharge_hist
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        21-Dec-14  1.Md. Sayadur Rahaman Created this trigger.

   NOTES:
   If Any update or delete operation perform on  ihrm_off_incharge then
   old information is inserted into hrm_off_incharge_hist

******************************************************************************/
BEGIN
   INSERT INTO hrm_off_incharge_hist
               (office_code, incharge_emp_gid, desig_cd,
                start_dt, end_dt, mobile, status,
                i_usr, i_dt, u_usr, u_dt
               )
        VALUES (:OLD.office_code, :OLD.incharge_emp_gid, :OLD.desig_cd,
                :OLD.start_dt, (:NEW.start_dt - 1), :OLD.mobile, '0',
                :OLD.i_usr, :OLD.i_dt, :NEW.i_usr, SYSDATE
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END trg_hrm_off_incharge_hist;
/


--
-- TRG_HRM_OFF_MONTH_SETUP  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_HRM_OFF_MONTH_SETUP" 
   BEFORE DELETE OR UPDATE
   ON ins.hrm_off_month_close_setup
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   v_session_user   VARCHAR2 (100);
/******************************************************************************
   NAME:
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        1/28/2018             1. Created this trigger.


******************************************************************************/
BEGIN
   SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER')
     INTO v_session_user
     FROM DUAL;

   INSERT INTO hrm_off_month_close_setup_log
               (office_cd, year_month, desc_off_st,
                month_start_dt, month_end_dt, status,
                action_usr, action_dt
               )
        VALUES (:OLD.office_cd, :OLD.year_month, :OLD.desc_off_st,
                :OLD.month_start_dt, :OLD.month_end_dt, :OLD.status,
                v_session_user, SYSDATE
               );
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      --RAISE;
      NULL;
END;
/


--
-- TRG_POLICY_STATUS  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_POLICY_STATUS" 
   AFTER INSERT OR UPDATE OF policy_status
   ON INS.INS_P_SUMMERY    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
BEGIN
   IF UPDATING
   THEN
      UPDATE ins_policy_status_log
         SET st_dt_to =
                CASE
                   WHEN st_dt_from < TRUNC (SYSDATE) - 1
                      THEN TRUNC (SYSDATE) - 1
                   ELSE st_dt_from
                END,
             u_usr = USER,
             u_dt = SYSDATE
       WHERE pgid = :NEW.pgid AND st_dt_to IS NULL;
   END IF;

   INSERT INTO ins_policy_status_log
               (pgid, policy_status, st_dt_from, i_usr, i_dt
               )
        VALUES (:NEW.pgid, :NEW.policy_status, TRUNC (SYSDATE), USER, SYSDATE
               );
EXCEPTION
   WHEN OTHERS
   THEN
      NULL;
--RAISE;
END;
/


--
-- TRG_SEC_EMP_OFFICE_UPDATE  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."TRG_SEC_EMP_OFFICE_UPDATE" 
   AFTER UPDATE OF office_cd
   ON INS.HRM_EMPLOYEE    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       trg_sec_emp_office_update
   PURPOSE:

   REVISIONS:
   Ver        Date          Author              Description
   ---------  ----------    ---------------     ------------------------------------
   1.0        06-AUG-2014   Md. Zahid Hasan     1. Update employee office code in security table

   NOTES:

******************************************************************************/
BEGIN
   UPDATE   security.sec_user_info
      SET   office_cd = :new.office_cd
    WHERE   emp_gid = :new.emp_gid;
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END trg_sec_emp_office_update;
/


--
-- "address_update_delete_log"  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."address_update_delete_log"
   BEFORE UPDATE OR DELETE
   ON INS.INS_P_ADDRESS    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       address_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        07-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  INS_P_ADDRESS then
   old information is inserted into INS_P_ADDRESS_HISTORY

******************************************************************************/
BEGIN
   INSERT INTO INS_P_ADDRESS_HISTORY (PGID        
                                        ,PARTY_CD            
                                        ,PARTY_ID            
                                        ,P_ADDRESS_1            
                                        ,P_ADDRESS_2    
                                        ,P_COUNTRY_CD    
                                        ,P_DIVISION_CD            
                                        ,P_DISTRICT_CD            
                                        ,P_THANA_CD            
                                        ,P_PO_CD            
                                        ,P_PHONE_NO            
                                        ,T_ADDRESS            
                                        ,T_COUNTRY_CD        
                                        ,T_DIVISION_CD            
                                        ,T_DISTRICT_CD        
                                        ,T_THANA_CD            
                                        ,T_PO_CD            
                                        ,T_PHONE_NO            
                                        ,MOBILE_NO            
                                        ,FAX_NO            
                                        ,E_MAIL        
                                        ,I_USR        
                                        ,I_DT        
                                        ,U_USR            
                                        ,U_DT    )
     VALUES   (:old.PGID        
                ,:old.PARTY_CD            
                ,:old.PARTY_ID            
                ,:old.P_ADDRESS_1            
                ,:old.P_ADDRESS_2    
                ,:old.P_COUNTRY_CD    
                ,:old.P_DIVISION_CD            
                ,:old.P_DISTRICT_CD            
                ,:old.P_THANA_CD            
                ,:old.P_PO_CD            
                ,:old.P_PHONE_NO            
                ,:old.T_ADDRESS            
                ,:old.T_COUNTRY_CD        
                ,:old.T_DIVISION_CD            
                ,:old.T_DISTRICT_CD        
                ,:old.T_THANA_CD            
                ,:old.T_PO_CD            
                ,:old.T_PHONE_NO            
                ,:old.MOBILE_NO            
                ,:old.FAX_NO            
                ,:old.E_MAIL        
                ,:old.I_USR        
                ,:old.I_DT        
                ,:old.U_USR            
                ,:old.U_DT);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END address_update_delete_log;
/


--
-- "client_update_delete_log"  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."client_update_delete_log"
   BEFORE UPDATE OR DELETE
   ON INS.INS_P_PERSONAL    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       policy_CLIENT_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        07-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  INS_P_PERSONAL then
   old information is inserted into ins_p_personal_history

******************************************************************************/
BEGIN
   INSERT INTO INS_P_PERSONAL_HISTORY (PGID,
                                       PARTY_CD,
                                       PARTY_ID,
                                       SL_NO,
                                       PARTY_NAME,
                                       RELATE_PARTY_ID,
                                       PARTY_PARTY_RELATION,
                                       FATHER_NAME,
                                       MOTHER_NAME,
                                       SEX_CD,
                                       DOB,
                                       AGE_DOCU_CD,
                                       POB,
                                       COUNTRY_CD,
                                       MARITAL_STATUS,
                                       CHILDREN_NO,
                                       IDENTIFICATION_MARK,
                                       EDU_QUAL_CD,
                                       EDU_DOCU_CD,
                                       OCCU_CD,
                                       EMPLOYER_NAME,
                                       DESIGNATION,
                                       ANNUAL_INCOME,
                                       INCOME_SOURCE,
                                       TIN,
                                       PERCENTAGE,
                                       I_USR,
                                       I_DT,
                                       U_USR,
                                       U_DT,
                                       OCCU_CLASS_CD,
                                       OCCU_SCOPE_CD,
                                       OCCU_BASE_CD,
                                       NID,
                                       EMPLOYEE_NAME,
                                       AGE,
                                       SPOUSE_NAME,
                                       PASSPORT_NO,
                                       action_user,
                                       dtime)
     VALUES   (:old.pgid,
               :old.party_cd,
               :old.party_id,
               :old.sl_no,
               :old.party_name,
               :old.relate_party_id,
               :old.party_party_relation,
               :old.father_name,
               :old.mother_name,
               :old.sex_cd,
               :old.dob,
               :old.age_docu_cd,
               :old.pob,
               :old.country_cd,
               :old.marital_status,
               :old.children_no,
               :old.identification_mark,
               :old.edu_qual_cd,
               :old.edu_docu_cd,
               :old.occu_cd,
               :old.employer_name,
               :old.designation,
               :old.annual_income,
               :old.income_source,
               :old.tin,
               :old.percentage,
               :old.i_usr,
               :old.i_dt,
               :old.u_usr,
               :old.u_dt,
               :old.occu_class_cd,
               :old.occu_scope_cd,
               :old.occu_base_cd,
               :old.nid,
               :old.employee_name,
               :old.age,
               :old.spouse_name,
               :old.passport_no
               , USER
               , SYSDATE);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END client_update_delete_log;
/


--
-- "proposal_update_delete_log"  (Trigger) 
--
CREATE OR REPLACE TRIGGER INS."proposal_update_delete_log"
   BEFORE DELETE
   ON INS.INS_P_PROPOSAL    REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:       proposal_update_delete_log
   PURPOSE:

   REVISIONS:
   Ver        Date          Author                    Description
   ---------  -----------  ------------------------  --------------------------
   1.0        07-NOV-2022  1.Md. Alamgir Hossain Created this trigger.

   NOTES:
   If Any update or delete operation perform on  INS_P_PROPOSAL then
   old information is inserted into INS_P_PROPOSAL_HISTORY

******************************************************************************/
BEGIN
   INSERT INTO INS_P_PROPOSAL_HISTORY (PGID,
                                       PROPOSAL_DT,
                                       ASSURANCE_TYPE,
                                       I_USR,
                                       I_DT,
                                       U_USR,
                                       U_DT,
                                       POLICY_NO,
                                       COMM_DT,
                                       PROPOSAL_NO,
                                       AGENT_ID,
                                       SERVICING_OFFICE,
                                       POLICY_CATG_CD,
                                       PROJECT_CD,
                                       URBAN_RURAL,
                                       SL_NO,
                                       OFFICE_CD,
                                       INS_TP_CD,
                                       REVIEW,
                                       REVIEW_BY,
                                       REVIEW_DT,
                                       PROPOSAL_SL_NO,
                                       CHECK_DIGIT,
                                       PRO_PRODUCT_CD,
                                       PRO_PARTY_NAME,
                                       OLD_POLICY_NO,
                                       PRO_GROUP_NUMBER,
                                       MIGRATION_ST,
                                       REVIEW_MOBILE_NO,
                                       POL_FRM_PREV_POL_ST,
                                       QUOTATION_NO,
                                       PRO_PARTY_MOBILE_NO,
                                       CHANNEL_CD,
                                       action_user,
                                       action_date)
     VALUES   (:old.PGID,
               :old.PROPOSAL_DT,
               :old.ASSURANCE_TYPE,
               :old.I_USR,
               :old.I_DT,
               :old.U_USR,
               :old.U_DT,
               :old.POLICY_NO,
               :old.COMM_DT,
               :old.PROPOSAL_NO,
               :old.AGENT_ID,
               :old.SERVICING_OFFICE,
               :old.POLICY_CATG_CD,
               :old.PROJECT_CD,
               :old.URBAN_RURAL,
               :old.SL_NO,
               :old.OFFICE_CD,
               :old.INS_TP_CD,
               :old.REVIEW,
               :old.REVIEW_BY,
               :old.REVIEW_DT,
               :old.PROPOSAL_SL_NO,
               :old.CHECK_DIGIT,
               :old.PRO_PRODUCT_CD,
               :old.PRO_PARTY_NAME,
               :old.OLD_POLICY_NO,
               :old.PRO_GROUP_NUMBER,
               :old.MIGRATION_ST,
               :old.REVIEW_MOBILE_NO,
               :old.POL_FRM_PREV_POL_ST,
               :old.QUOTATION_NO,
               :old.PRO_PARTY_MOBILE_NO,
               :old.CHANNEL_CD,
               USER,
               SYSDATE);
EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END proposal_update_delete_log;
/


