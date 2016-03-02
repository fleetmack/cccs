create or replace PACKAGE edw_finaid_extr IS
--
  TYPE tab_finaid_appl_extr IS TABLE OF WTT_FINAID_APPLICATION_INPUT%ROWTYPE;
  TYPE tab_finaid_awd_aid_year_extr IS TABLE OF WTT_FINAID_AWARD_AIDYEAR_INPUT%ROWTYPE;
  TYPE tab_finaid_awd_acad_pd_extr IS TABLE OF WTT_FINAID_AWARD_ACADPD_INPUT%ROWTYPE;
--
  FUNCTION f_get_finaid_application(financial_aid_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_finaid_appl_extr PIPELINED;
  FUNCTION f_get_finaid_awd_aid_year(financial_aid_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_finaid_awd_aid_year_extr PIPELINED;
  FUNCTION f_get_finaid_awd_acad_pd(financial_aid_year_in VARCHAR2, process_ind_in VARCHAR2, process_date DATE, debug_var_in VARCHAR2 DEFAULT NULL) RETURN tab_finaid_awd_acad_pd_extr PIPELINED;
--
CURSOR get_finaid_appl_amts (def_multi_source_in VARCHAR2, financial_aid_year_in VARCHAR2) IS
         SELECT FA1.PERSON_UID              PERSON_UID,
                FA1.AID_YEAR                AID_YEAR,
                DECODE(FA1.PERSON_UID, NULL,'N','Y') APPLICATION_IND,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_INAS
                                ELSE NULL
                END) FM_STUDENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_PARENT_INAS
                                ELSE NULL
                END) FM_PARENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_TOTAL_INCOME
                                ELSE NULL
                END) FM_STUDENT_INCOME,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_PARENT_TOTAL_INCOME
                                ELSE NULL
                END) FM_PARENT_INCOME,
                MAX(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' AND FA2.DEPENDENCY_INDEPEND = 'D' THEN 'Y'
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' AND FA2.DEPENDENCY_INDEPEND = 'I' THEN 'N'
                                ELSE NULL
                END) DEPENDENCY_IND,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_CONTRIBUTION
                                ELSE NULL
                END) IM_STUDENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_PARENT_CONTRIBUTION
                                ELSE NULL
                END) IM_PARENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_TOTAL_INCOME
                                ELSE NULL
                END) IM_STUDENT_INCOME,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_PARENT_TOTAL_INCOME
                                ELSE NULL
                END) IM_CUSTODIAL_PARENT_INCOME,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = -1 THEN FA2.IM_PARENT_TOTAL_INCOME
                                ELSE NULL
                END) IM_NON_CUST_PARENT_INCOME,
                MIN(CASE
                                WHEN FA1.APPLICATION_NUMBER = -1 THEN 1
                                ELSE 0
                END) IM_NON_CUSTODIAL_INCOME_IND,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_PARENT_HOME_EQUITY
                                ELSE NULL
                END)   IM_PARENT_HOME_EQUITY,
           NVL(MIN(FA1.MIF_VALUE), def_multi_source_in)   MULTI_SRC_IN
           FROM MRT_FINAID_APPLICATION2 FA2, MRT_FINAID_APPLICATION1 FA1
          WHERE NVL(FA1.MIF_VALUE, def_multi_source_in) = NVL(FA2.MIF_VALUE,def_multi_source_in)
            AND (financial_aid_year_in = 'ALL' OR FA1.AID_YEAR = financial_aid_year_in)
            AND FA2.AID_YEAR = FA1.AID_YEAR
            AND FA2.PERSON_UID = FA1.PERSON_UID
            AND FA2.INTERFACE_TAPE_CODE = FA1.INTERFACE_TAPE_CODE
            AND FA2.APPLICATION_NUMBER = FA1.APPLICATION_NUMBER
          GROUP BY FA1.PERSON_UID, FA1.AID_YEAR, DECODE(FA1.PERSON_UID, NULL,'N','Y'), FA1.MIF_VALUE;
--
 CURSOR get_finaid_appl_need(def_multi_source_in VARCHAR2, financial_aid_year_in VARCHAR2) IS
     SELECT PERSON_UID,
            AID_YEAR,
            AID_PERIOD,
            FM_TFC FM_EXPECT_FAMILY_CONTRIBUTION,
            FM_GROSS_NEED,
            FM_UNMET_NEED,
            CASE
                WHEN FM_GROSS_NEED > 0 THEN 'Y'
                ELSE 'N'
            END FM_NEED_ELIGIBLE_IND,
            CASE
                WHEN FM_UNMET_NEED > 0 THEN 'N'
                ELSE 'Y'
            END FM_FULLY_MET_NEED_IND,
            IM_GROSS_NEED,
            IM_UNMET_NEED,
            IM_TFC IM_EXPECT_FAMILY_CONTRIBUTION,
            CASE
                WHEN IM_GROSS_NEED > 0 THEN 'Y'
                ELSE 'N'
            END IM_NEED_ELIGIBLE_IND,
            CASE
                WHEN IM_UNMET_NEED > 0 THEN 'N'
                ELSE 'Y'
            END IM_FULLY_MET_NEED_IND,
            COST_OF_EDUCATION,
            RESOURCE_AMOUNT,
            CASE
                WHEN RESOURCE_AMOUNT > 0 THEN 1
                ELSE 0
            END OTHER_RESOURCE_IND,
            NVL(MIF_VALUE,  def_multi_source_in)   MULTI_SRC_IN
       FROM MRT_APPLICANT_NEED
      WHERE (financial_aid_year_in = 'ALL' OR AID_YEAR = financial_aid_year_in);
--
  CURSOR get_tuition_fee_bdgt_amt (def_multi_source_in VARCHAR2, financial_aid_year_in VARCHAR2) IS
     SELECT SUM(BUDGET_COMPONENT_AMOUNT) TUITION_FEE_BUDGET_AMT,
     AID_YEAR,
     PERSON_UID,
     NVL(min(MIF_VALUE), def_multi_source_in)   MULTI_SRC_IN
       FROM MRT_FINAID_BUDGET_COMPONENT bc
      WHERE EXISTS (SELECT 'X'
                                      FROM MTVPARM
                                     WHERE MTVPARM_INTERNAL_CODE_GROUP = 'EDW EXTRACT PARAMETERS'
                                       AND MTVPARM_INTERNAL_CODE = 'BUDGET_COMPONENT'
                                       AND MTVPARM_INTERNAL_CODE_2 = 'TUITION_FEE'
                                      AND MTVPARM_EXTERNAL_CODE = BC.BUDGET_COMPONENT)
       AND (financial_aid_year_in = 'ALL' OR AID_YEAR = financial_aid_year_in)
      GROUP BY      AID_YEAR, PERSON_UID, MIF_VALUE      ;
--
CURSOR get_total_offer_amts (def_multi_source_in VARCHAR2, financial_aid_year_in VARCHAR2) IS
 SELECT AAY.PERSON_UID,
        AAY.AID_YEAR,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'I' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_INSTITUTION_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'F' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_FEDERAL_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'S' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_STATE_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'O' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_OTHER_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'S' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_SCHOLARSHIP_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'L' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_LOAN_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'W' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_WORK_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'G' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_GRANT_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'L' THEN AAY.OFFER_AMOUNT
                WHEN 'W' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_SELF_HELP_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'S' THEN AAY.OFFER_AMOUNT
                WHEN 'G' THEN AAY.OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_GIFT_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'I' THEN
                        CASE  FF.FINANCIAL_AID_TYPE
                                WHEN 'S' THEN AAY.OFFER_AMOUNT
                                WHEN 'G' THEN AAY.OFFER_AMOUNT
                        ELSE NULL
                        END
                ELSE 0
        END) TOTAL_INST_GIFT_OFFER_AMOUNT,
        SUM(AAY.OFFER_AMOUNT)  TOTAL_AWARD_OFFERED,
        SUM(TOTAL_OFFER_AMOUNT)  TOTAL_AWARD_ORIGINAL_OFFERED,
        SUM(TOTAL_ACCEPT_AMOUNT)  TOTAL_AWARD_ACCEPTED,
        SUM(TOTAL_DECLINE_AMOUNT)  TOTAL_AWARD_DECLINED,
        SUM(ANNUAL_AWARD_CANCEL_AMOUNT)  TOTAL_AWARD_CANCELED,
        SUM(TOTAL_PAID_AMOUNT)  TOTAL_AWARD_PAID_IND,
        CASE
          WHEN SUM(AAY.OFFER_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_OFFERED_IND,
        CASE
          WHEN SUM(TOTAL_ACCEPT_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_ACCEPTED_IND,
        CASE
          WHEN SUM(TOTAL_DECLINE_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_DECLINED_IND,
        CASE
          WHEN SUM(ANNUAL_AWARD_CANCEL_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_CANCELED_IND,
        CASE
          WHEN SUM(TOTAL_PAID_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_PAID_IND,
       NVL(min(AAY.MIF_VALUE), def_multi_source_in)   MULTI_SRC_IN
       FROM MRT_FINAID_FUND FF, MRT_AWARD_BY_AID_YEAR AAY
      WHERE NVL(FF.MIF_VALUE, def_multi_source_in) =  NVL(AAY.MIF_VALUE, def_multi_source_in)
        AND FF.AID_YEAR = AAY.AID_YEAR
        AND FF.FUND = AAY.FUND
        AND (financial_aid_year_in = 'ALL' OR FF.AID_YEAR = financial_aid_year_in)
      GROUP BY  AAY.PERSON_UID, AAY.AID_YEAR, AAY.MIF_VALUE;
--
CURSOR get_total_offer_amts_acad_pd (def_multi_source_in VARCHAR2) IS
 SELECT AAY.PERSON_UID,
        AAY.ACADEMIC_PERIOD,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'I' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_INSTITUTION_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'F' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_FEDERAL_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_STATE_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'O' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_OTHER_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_SCHOLARSHIP_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'L' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_LOAN_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'W' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_WORK_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'G' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_GRANT_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'L' THEN AAY.AWARD_OFFER_AMOUNT
                WHEN 'W' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_SELF_HELP_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                WHEN 'G' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_GIFT_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'I' THEN
                        CASE  FF.FINANCIAL_AID_TYPE
                                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                                WHEN 'G' THEN AAY.AWARD_OFFER_AMOUNT
                        ELSE NULL
                        END
                ELSE NULL
        END) TOTAL_INST_GIFT_OFFER_AMOUNT,
        SUM(AWARD_OFFER_AMOUNT)  TOTAL_AWARD_OFFERED,
        SUM(AWARD_ORIGINAL_OFFER_AMOUNT)  TOTAL_AWARD_ORIGINAL_OFFERED,
        SUM(AWARD_ACCEPT_AMOUNT)  TOTAL_AWARD_ACCEPTED,
        SUM(AWARD_DECLINE_AMOUNT)  TOTAL_AWARD_DECLINED,
        SUM(AWARD_CANCEL_AMOUNT)  TOTAL_AWARD_CANCELED,
        SUM(AWARD_PAID_AMOUNT)  TOTAL_AWARD_PAID,
        CASE
          WHEN SUM(AWARD_OFFER_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_OFFERED_IND,
        CASE
          WHEN SUM(AWARD_ACCEPT_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_ACCEPTED_IND,
        CASE
          WHEN SUM(AWARD_DECLINE_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_DECLINED_IND,
        CASE
          WHEN SUM(AWARD_CANCEL_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_CANCELED_IND,
        CASE
          WHEN SUM(AWARD_PAID_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_PAID_IND,
       NVL(min(AAY.MIF_VALUE),  def_multi_source_in)   MULTI_SRC_IN
       FROM MRT_FINAID_FUND FF, MRT_AWARD_BY_PERSON AAY
      WHERE FF.AID_YEAR = AAY.AID_YEAR
        AND FF.FUND = AAY.FUND
        AND NVL(FF.MIF_VALUE, def_multi_source_in) = NVL(AAY.MIF_VALUE, def_multi_source_in)
        AND FF.AID_YEAR = AAY.AID_YEAR
        AND FF.FUND = AAY.FUND
      GROUP BY AAY.PERSON_UID, AAY.ACADEMIC_PERIOD, AAY.MIF_VALUE;
--
 CURSOR get_application_inds (def_multi_source_in VARCHAR2, financial_aid_year_in VARCHAR2) IS
     SELECT CASE
                WHEN MAX(APPLICATION_NUMBER) > 0 THEN 'Y'
                ELSE 'N'
            END FM_APPLICATION_IND,
            CASE
                WHEN MIN(APPLICATION_NUMBER) < 1 THEN 'Y'
                ELSE 'N'
            END IM_APPLICATION_IND,
            PERSON_UID,
            AID_YEAR,
       NVL(MIF_VALUE,  def_multi_source_in)   MULTI_SRC_IN
       FROM MRT_FINAID_APPLICATION1
      WHERE (financial_aid_year_in = 'ALL' OR AID_YEAR = financial_aid_year_in)
      GROUP BY PERSON_UID, AID_YEAR, MIF_VALUE;
--
TYPE tab_finaid_appl_amts                           IS TABLE OF   get_finaid_appl_amts%ROWTYPE INDEX BY VARCHAR2(2000);
TYPE tab_finaid_appl_need                           IS TABLE OF  get_finaid_appl_need%ROWTYPE INDEX BY VARCHAR2(2000);
TYPE tab_tuition_fee_bdgt_amt                     IS TABLE OF   get_tuition_fee_bdgt_amt%ROWTYPE INDEX BY VARCHAR2(2000);
TYPE tab_offer_composition_amts                 IS TABLE OF   get_total_offer_amts%ROWTYPE INDEX BY VARCHAR2(2000);
TYPE tab_total_offer_amts_acad_pd              IS TABLE OF   get_total_offer_amts_acad_pd%ROWTYPE INDEX BY VARCHAR2(2000);
TYPE tab_application_inds                             IS TABLE OF   get_application_inds%ROWTYPE INDEX BY VARCHAR2(2000);
--
CURSOR get_finaid_appl_amt(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_uid_in NUMBER, finaid_year_in VARCHAR2) IS
         SELECT FA1.PERSON_UID              PERSON_UID,
                FA1.AID_YEAR                AID_YEAR,
                DECODE(FA1.PERSON_UID, NULL,'N','Y') APPLICATION_IND,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_INAS
                                ELSE NULL
                END) FM_STUDENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_PARENT_INAS
                                ELSE NULL
                END) FM_PARENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_TOTAL_INCOME
                                ELSE NULL
                END) FM_STUDENT_INCOME,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' THEN FA2.FM_PARENT_TOTAL_INCOME
                                ELSE NULL
                END) FM_PARENT_INCOME,
                MAX(CASE
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' AND FA2.DEPENDENCY_INDEPEND = 'D' THEN 'Y'
                                WHEN FA1.APPLICATION_NUMBER > 0 AND FA1.CURRENT_RECORD_IND = 'Y' AND FA2.DEPENDENCY_INDEPEND = 'I' THEN 'N'
                                ELSE NULL
                END) DEPENDENCY_IND,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_CONTRIBUTION
                                ELSE NULL
                END) IM_STUDENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_PARENT_CONTRIBUTION
                                ELSE NULL
                END) IM_PARENT_CONTRIBUTION,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_TOTAL_INCOME
                                ELSE NULL
                END) IM_STUDENT_INCOME,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_PARENT_TOTAL_INCOME
                                ELSE NULL
                END) IM_CUSTODIAL_PARENT_INCOME,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = -1 THEN FA2.IM_PARENT_TOTAL_INCOME
                                ELSE NULL
                END) IM_NON_CUST_PARENT_INCOME,
                MIN(CASE
                                WHEN FA1.APPLICATION_NUMBER = -1 THEN 1
                                ELSE 0
                END) IM_NON_CUSTODIAL_INCOME_IND,
                SUM(CASE
                                WHEN FA1.APPLICATION_NUMBER = 0 THEN FA2.IM_PARENT_HOME_EQUITY
                                ELSE NULL
                END)   IM_PARENT_HOME_EQUITY
           FROM MRT_FINAID_APPLICATION2 FA2, MRT_FINAID_APPLICATION1 FA1
          WHERE NVL(FA1.MIF_VALUE, def_multi_source_in) = multi_src_in
            AND NVL(FA2.MIF_VALUE, def_multi_source_in) = multi_src_in
            AND FA1.PERSON_UID = person_uid_in
            AND FA1.AID_YEAR = finaid_year_in
            AND FA2.AID_YEAR = FA1.AID_YEAR
            AND FA2.PERSON_UID = FA1.PERSON_UID
            AND FA2.INTERFACE_TAPE_CODE = FA1.INTERFACE_TAPE_CODE
            AND FA2.APPLICATION_NUMBER = FA1.APPLICATION_NUMBER
          GROUP BY FA1.PERSON_UID, FA1.AID_YEAR, DECODE(FA1.PERSON_UID, NULL,'N','Y');
--
 CURSOR get_finaid_appl_needs(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_uid_in NUMBER, finaid_year_in VARCHAR2) IS
     SELECT PERSON_UID,
            AID_YEAR,
            AID_PERIOD,
            FM_TFC FM_EXPECT_FAMILY_CONTRIBUTION,
            FM_GROSS_NEED,
            FM_UNMET_NEED,
            CASE
                WHEN FM_GROSS_NEED > 0 THEN 'Y'
                ELSE 'N'
            END FM_NEED_ELIGIBLE_IND,
            CASE
                WHEN FM_UNMET_NEED > 0 THEN 'N'
                ELSE 'Y'
            END FM_FULLY_MET_NEED_IND,
            IM_GROSS_NEED,
            IM_UNMET_NEED,
            IM_TFC IM_EXPECT_FAMILY_CONTRIBUTION,
            CASE
                WHEN IM_GROSS_NEED > 0 THEN 'Y'
                ELSE 'N'
            END IM_NEED_ELIGIBLE_IND,
            CASE
                WHEN IM_UNMET_NEED > 0 THEN 'N'
                ELSE 'Y'
            END IM_FULLY_MET_NEED_IND,
            COST_OF_EDUCATION,
            RESOURCE_AMOUNT,
            CASE
                WHEN RESOURCE_AMOUNT > 0 THEN 1
                ELSE 0
            END OTHER_RESOURCE_IND
       FROM MRT_APPLICANT_NEED
      WHERE NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
        AND PERSON_UID = person_uid_in
        AND AID_YEAR = finaid_year_in;
--
 CURSOR get_total_offer_amts_acad_pds(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_uid_in NUMBER, academic_period_in VARCHAR2) IS
 SELECT PERSON_UID,
        ACADEMIC_PERIOD,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'I' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_INSTITUTION_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'F' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_FEDERAL_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_STATE_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'O' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_OTHER_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_SCHOLARSHIP_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'L' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_LOAN_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'W' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_WORK_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'G' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_GRANT_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'L' THEN AAY.AWARD_OFFER_AMOUNT
                WHEN 'W' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_SELF_HELP_OFFER_AMOUNT,
        SUM(CASE FF.FINANCIAL_AID_TYPE
                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                WHEN 'G' THEN AAY.AWARD_OFFER_AMOUNT
                ELSE NULL
        END) TOTAL_GIFT_OFFER_AMOUNT,
        SUM(CASE FF.FUND_SOURCE_TYPE
                WHEN 'I' THEN
                        CASE  FF.FINANCIAL_AID_TYPE
                                WHEN 'S' THEN AAY.AWARD_OFFER_AMOUNT
                                WHEN 'G' THEN AAY.AWARD_OFFER_AMOUNT
                        ELSE NULL
                        END
                ELSE NULL
        END) TOTAL_INST_GIFT_OFFER_AMOUNT,
        SUM(AWARD_OFFER_AMOUNT)  TOTAL_AWARD_OFFERED,
        SUM(AWARD_ORIGINAL_OFFER_AMOUNT)  TOTAL_AWARD_ORIGINAL_OFFERED,
        SUM(AWARD_ACCEPT_AMOUNT)  TOTAL_AWARD_ACCEPTED,
        SUM(AWARD_DECLINE_AMOUNT)  TOTAL_AWARD_DECLINED,
        SUM(AWARD_CANCEL_AMOUNT)  TOTAL_AWARD_CANCELED,
        SUM(AWARD_PAID_AMOUNT)  TOTAL_AWARD_PAID,
        CASE
          WHEN SUM(AWARD_OFFER_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_OFFERED_IND,
        CASE
          WHEN SUM(AWARD_ACCEPT_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_ACCEPTED_IND,
        CASE
          WHEN SUM(AWARD_DECLINE_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_DECLINED_IND,
        CASE
          WHEN SUM(AWARD_CANCEL_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_CANCELED_IND,
        CASE
          WHEN SUM(AWARD_PAID_AMOUNT) > 0 THEN 'Y'
          ELSE 'N'
        END AWARD_PAID_IND
       FROM MRT_FINAID_FUND FF, MRT_AWARD_BY_PERSON AAY
      WHERE FF.AID_YEAR = AAY.AID_YEAR
        AND FF.FUND = AAY.FUND
        AND NVL(FF.MIF_VALUE, def_multi_source_in) = multi_src_in
        AND NVL(AAY.MIF_VALUE, def_multi_source_in) = multi_src_in
        AND FF.AID_YEAR = AAY.AID_YEAR
        AND FF.FUND = AAY.FUND
        AND AAY.ACADEMIC_PERIOD = academic_period_in
        AND AAY.PERSON_UID = person_uid_in
      GROUP BY PERSON_UID, ACADEMIC_PERIOD;
--
 CURSOR get_application_ind(def_multi_source_in VARCHAR2, multi_src_in VARCHAR2, person_uid_in NUMBER, finaid_year_in VARCHAR2) IS
     SELECT CASE
                WHEN MAX(APPLICATION_NUMBER) > 0 THEN 'Y'
                ELSE 'N'
            END FM_APPLICATION_IND,
            CASE
                WHEN MIN(APPLICATION_NUMBER) < 1 THEN 'Y'
                ELSE 'N'
            END IM_APPLICATION_IND
       FROM MRT_FINAID_APPLICATION1
      WHERE NVL(MIF_VALUE, def_multi_source_in) = multi_src_in
        AND PERSON_UID = person_uid_in
        AND AID_YEAR = finaid_year_in;
--
END edw_finaid_extr;
/
create or replace PACKAGE BODY edw_finaid_extr IS
/******************************************************************************/
  FUNCTION f_get_finaid_application(financial_aid_year_in VARCHAR2,
                                    process_ind_in VARCHAR2,
                                    process_date DATE,
                                    debug_var_in VARCHAR2 DEFAULT NULL)
                                RETURN tab_finaid_appl_extr PIPELINED IS
--
    ret_row                             WTT_FINAID_APPLICATION_INPUT%ROWTYPE;
    ret_row_init                        WTT_FINAID_APPLICATION_INPUT%ROWTYPE;
    fm_total_family_income_rec          NUMBER;
    im_parent_total_income_rec          NUMBER;
    im_total_family_income_rec          NUMBER;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                            MTVPARM%ROWTYPE;
    null_nation_rec                     MTVPARM%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;
    fetch_finaid_details                BOOLEAN := TRUE;
--




finaid_appl_amt_recs            tab_finaid_appl_amts;
finaid_appl_need_recs           tab_finaid_appl_need;
tuit_fee_bdgt_amt_recs          tab_tuition_fee_bdgt_amt;
offer_composition_amt_recs      tab_offer_composition_amts;
application_ind_recs            tab_application_inds;

finaid_indx VARCHAR2(2000);
--
        TYPE finaid_application_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          AID_YEAR                                VARCHAR2(63),
          AID_PERIOD                              VARCHAR2(63),
          BUDGET_GROUP                            VARCHAR2(63),
          PACKAGING_GROUP                         VARCHAR2(63),
          TRACKING_GROUP                          VARCHAR2(63),
          PACKAGE_COMPLETE_DATE                   DATE,
          PACKAGE_COMPLETE_IND                    NUMBER,
          ALL_REQUIRE_COMPLETE_DATE               DATE,
          PACKAGE_REQUIRE_COMPLETE_DATE           DATE,
          DISBURSE_REQUIRE_COMPLETE_DATE          DATE,
          VERIFICATION_REQUIRED_IND               VARCHAR2(1),
          VERIFICATION_COMPLETE_IND               VARCHAR2(1),
          VERIFICATION_COMPLETE_DATE              DATE,
          VERIFICATION_TRANSACTION_NO             VARCHAR2(63),
          FM_BATCH_LOCK_IND                       NUMBER,
          IM_BATCH_LOCK_IND                       NUMBER,
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    finaid_application_cur       refCurType;
    finaid_application_rec        finaid_application_rec_type;
    TYPE tab_f_application_rec_type   IS TABLE OF finaid_application_rec_type INDEX BY PLS_INTEGER;
    finaid_application_recs        tab_f_application_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(AA.MIF_VALUE, def_multi_source_in)    multi_source,
                 AA.ZONE_VALUE                             process_group,
                 AA.DOMAIN_VALUE                           administrative_group,
                 AA.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)            warehouse_entity_uid,
                 AA.AID_YEAR,
                 AA.AID_PERIOD,
                 AA.BUDGET_GROUP,
                 AA.PACKAGING_GROUP,
                 AA.TRACKING_GROUP,
                 AA.PACKAGE_COMPLETE_DATE,
                 CASE
                    WHEN AA.PACKAGE_COMPLETE_DATE IS NULL THEN 0
                    ELSE 1
                 END PACKAGE_COMPLETE_IND,
                 AA.ALL_REQUIRE_COMPLETE_DATE,
                 AA.PACKAGE_REQUIRE_COMPLETE_DATE,
                 AA.DISBURSE_REQUIRE_COMPLETE_DATE,
                 AA.VERIFICATION_REQUIRED_IND,
                 AA.VERIFICATION_COMPLETE_IND,
                 AA.VERIFICATION_COMPLETE_DATE,
                 AA.VERIFICATION_TRANSACTION_NO,
                 CASE AA.FM_BATCH_LOCK_IND
                    WHEN 'Y' THEN 1
                    ELSE 0
                 END FM_BATCH_LOCK_IND,
                 CASE AA.IM_BATCH_LOCK_IND
                    WHEN 'Y' THEN 1
                    ELSE 0
                 END IM_BATCH_LOCK_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MRT_FINAID_APPLICANT_STATUS AA,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE ((financial_aid_year_in = 'ALL' OR financial_aid_year_in = AID_YEAR))
             AND (debug_var_in IS NULL OR AA.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = AA.PERSON_UID
             --BLM mepped 7/30/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = aa.mif_value
             AND AA.PERSON_UID =  PD.PERSON_ID
--klf WCV_EXTR_PERSON_DETAILS does not contain mif values - remove join
--             AND NVL(AA.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(AA.MIF_VALUE, def_multi_source_in)    multi_source,
                 AA.ZONE_VALUE                             process_group,
                 AA.DOMAIN_VALUE                           administrative_group,
                 AA.PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)            warehouse_entity_uid,
                 AA.AID_YEAR,
                 AA.AID_PERIOD,
                 AA.BUDGET_GROUP,
                 AA.PACKAGING_GROUP,
                 AA.TRACKING_GROUP,
                 AA.PACKAGE_COMPLETE_DATE,
                 CASE
                    WHEN AA.PACKAGE_COMPLETE_DATE IS NULL THEN 0
                    ELSE 1
                 END PACKAGE_COMPLETE_IND,
                 AA.ALL_REQUIRE_COMPLETE_DATE,
                 AA.PACKAGE_REQUIRE_COMPLETE_DATE,
                 AA.DISBURSE_REQUIRE_COMPLETE_DATE,
                 AA.VERIFICATION_REQUIRED_IND,
                 AA.VERIFICATION_COMPLETE_IND,
                 AA.VERIFICATION_COMPLETE_DATE,
                 AA.VERIFICATION_TRANSACTION_NO,
                 CASE AA.FM_BATCH_LOCK_IND
                    WHEN 'Y' THEN 1
                    ELSE 0
                 END FM_BATCH_LOCK_IND,
                 CASE AA.IM_BATCH_LOCK_IND
                    WHEN 'Y' THEN 1
                    ELSE 0
                 END IM_BATCH_LOCK_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MRT_FINAID_APPLICANT_STATUS AA,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_FINAID_APPLICATION CHG
           WHERE CHG.PERSON_UID = AA.PERSON_UID
             AND (debug_var_in IS NULL OR AA.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = AA.PERSON_UID
             --BLM mepped 7/30/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = aa.mif_value
             AND AA.PERSON_UID =  PD.PERSON_ID
--klf remove mep join - WCV_EXTR_PERSON_DETAILS is not mepped
--             AND NVL(AA.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN

    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_FINAID_APPLICATION', financial_aid_year_in, 'AID_YEAR');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_FINAID_APPLICATION', 'WFT_FINAID_APPLICATION', 'PERSON_UID');
       END IF;
    END IF;

    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','FINAID_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        finaid_application_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        finaid_application_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH finaid_application_cur BULK COLLECT INTO finaid_application_recs LIMIT bulk_size;
       EXIT WHEN finaid_application_recs.COUNT = 0;
--
      IF finaid_application_recs.COUNT > 0  AND fetch_finaid_details THEN
--
         fetch_finaid_details := FALSE;
--
         FOR finaid_appl_amts in get_finaid_appl_amts(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).APPLICATION_IND :=finaid_appl_amts.APPLICATION_IND;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).FM_STUDENT_CONTRIBUTION :=finaid_appl_amts.FM_STUDENT_CONTRIBUTION;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).FM_PARENT_CONTRIBUTION :=finaid_appl_amts.FM_PARENT_CONTRIBUTION;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).FM_STUDENT_INCOME :=finaid_appl_amts.FM_STUDENT_INCOME;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).FM_PARENT_INCOME :=finaid_appl_amts.FM_PARENT_INCOME;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).DEPENDENCY_IND :=finaid_appl_amts.DEPENDENCY_IND;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_STUDENT_CONTRIBUTION :=finaid_appl_amts.IM_STUDENT_CONTRIBUTION;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_PARENT_CONTRIBUTION :=finaid_appl_amts.IM_PARENT_CONTRIBUTION;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_STUDENT_INCOME :=finaid_appl_amts.IM_STUDENT_INCOME;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_CUSTODIAL_PARENT_INCOME :=finaid_appl_amts.IM_CUSTODIAL_PARENT_INCOME;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_NON_CUST_PARENT_INCOME :=finaid_appl_amts.IM_NON_CUST_PARENT_INCOME;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_NON_CUSTODIAL_INCOME_IND :=finaid_appl_amts.IM_NON_CUSTODIAL_INCOME_IND;
             finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID || '{' ||  finaid_appl_amts.AID_YEAR).IM_PARENT_HOME_EQUITY :=finaid_appl_amts.IM_PARENT_HOME_EQUITY;
         END LOOP;

         FOR finaid_appl_need in get_finaid_appl_need(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).AID_PERIOD :=finaid_appl_need.AID_PERIOD;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_EXPECT_FAMILY_CONTRIBUTION :=finaid_appl_need.FM_EXPECT_FAMILY_CONTRIBUTION;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_GROSS_NEED :=finaid_appl_need.FM_GROSS_NEED;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_UNMET_NEED :=finaid_appl_need.FM_UNMET_NEED;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN || '{' ||  finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_NEED_ELIGIBLE_IND :=finaid_appl_need.FM_NEED_ELIGIBLE_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_FULLY_MET_NEED_IND :=finaid_appl_need.FM_FULLY_MET_NEED_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_GROSS_NEED :=finaid_appl_need.IM_GROSS_NEED;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_UNMET_NEED :=finaid_appl_need.IM_UNMET_NEED;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_EXPECT_FAMILY_CONTRIBUTION :=finaid_appl_need.IM_EXPECT_FAMILY_CONTRIBUTION;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_NEED_ELIGIBLE_IND :=finaid_appl_need.IM_NEED_ELIGIBLE_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_FULLY_MET_NEED_IND :=finaid_appl_need.IM_FULLY_MET_NEED_IND;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).COST_OF_EDUCATION :=finaid_appl_need.COST_OF_EDUCATION;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).RESOURCE_AMOUNT :=finaid_appl_need.RESOURCE_AMOUNT;
             finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).OTHER_RESOURCE_IND :=finaid_appl_need.OTHER_RESOURCE_IND;
         END LOOP;

         FOR tuition_fee_bdgt_amt in get_tuition_fee_bdgt_amt(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
             tuit_fee_bdgt_amt_recs(tuition_fee_bdgt_amt.MULTI_SRC_IN ||  '{' || tuition_fee_bdgt_amt.PERSON_UID ||  '{' || tuition_fee_bdgt_amt.AID_YEAR).TUITION_FEE_BUDGET_AMT :=tuition_fee_bdgt_amt.TUITION_FEE_BUDGET_AMT;
         END LOOP;

        FOR offer_composition_amt in get_total_offer_amts(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_INSTITUTION_OFFER_AMOUNT :=offer_composition_amt.TOTAL_INSTITUTION_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_FEDERAL_OFFER_AMOUNT :=offer_composition_amt.TOTAL_FEDERAL_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_STATE_OFFER_AMOUNT :=offer_composition_amt.TOTAL_STATE_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_OTHER_OFFER_AMOUNT :=offer_composition_amt.TOTAL_OTHER_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_SCHOLARSHIP_OFFER_AMOUNT :=offer_composition_amt.TOTAL_SCHOLARSHIP_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_LOAN_OFFER_AMOUNT :=offer_composition_amt.TOTAL_LOAN_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_WORK_OFFER_AMOUNT :=offer_composition_amt.TOTAL_WORK_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_GRANT_OFFER_AMOUNT :=offer_composition_amt.TOTAL_GRANT_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_SELF_HELP_OFFER_AMOUNT :=offer_composition_amt.TOTAL_SELF_HELP_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_GIFT_OFFER_AMOUNT :=offer_composition_amt.TOTAL_GIFT_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_INST_GIFT_OFFER_AMOUNT :=offer_composition_amt.TOTAL_INST_GIFT_OFFER_AMOUNT;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_AWARD_OFFERED :=offer_composition_amt.TOTAL_AWARD_OFFERED;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_AWARD_ORIGINAL_OFFERED :=offer_composition_amt.TOTAL_AWARD_ORIGINAL_OFFERED;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_AWARD_ACCEPTED :=offer_composition_amt.TOTAL_AWARD_ACCEPTED;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_AWARD_DECLINED :=offer_composition_amt.TOTAL_AWARD_DECLINED;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_AWARD_CANCELED :=offer_composition_amt.TOTAL_AWARD_CANCELED;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).TOTAL_AWARD_PAID_IND :=offer_composition_amt.TOTAL_AWARD_PAID_IND;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_OFFERED_IND :=offer_composition_amt.AWARD_OFFERED_IND;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_ACCEPTED_IND :=offer_composition_amt.AWARD_ACCEPTED_IND;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_DECLINED_IND :=offer_composition_amt.AWARD_DECLINED_IND;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_CANCELED_IND :=offer_composition_amt.AWARD_CANCELED_IND;
             offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_PAID_IND :=offer_composition_amt.AWARD_PAID_IND;
         END LOOP;

         FOR application_ind in get_application_inds(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
             application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).FM_APPLICATION_IND :=application_ind.FM_APPLICATION_IND;
             application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).IM_APPLICATION_IND :=application_ind.IM_APPLICATION_IND;
         END LOOP;
--
      END IF;
--
      FOR i IN finaid_application_recs.FIRST..finaid_application_recs.LAST
      LOOP
            finaid_indx    := finaid_application_recs(i).multi_source || '{' || finaid_application_recs(i).person_uid || '{' ||  finaid_application_recs(i).aid_year;
--
            ret_row.multi_source := finaid_application_recs(i).multi_source;
            ret_row.process_group := finaid_application_recs(i).process_group;
            ret_row.administrative_group := finaid_application_recs(i).administrative_group;
            --BLM mepped 6/2/14 for security join
            --ret_row.msrc_user_attribute_01 := NULL;
            ret_row.msrc_user_attribute_01 := ret_row.multi_source;
            ret_row.msrc_user_attribute_02 := NULL;
            ret_row.msrc_user_attribute_03 := NULL;
            ret_row.msrc_user_attribute_04 := NULL;
            ret_row.msrc_user_attribute_05 := NULL;
            ret_row.person_uid := finaid_application_recs(i).warehouse_entity_uid;

            ret_row.id := finaid_application_recs(i).id;
            ret_row.birth_date := finaid_application_recs(i).birth_date;
            ret_row.deceased_date := finaid_application_recs(i).deceased_date;
            ret_row.email_address := finaid_application_recs(i).email_address;
            ret_row.full_name_lfmi := finaid_application_recs(i).full_name_lfmi;
            ret_row.confidentiality_ind := finaid_application_recs(i).confidentiality_ind;
            ret_row.gender := finaid_application_recs(i).gender;
            ret_row.ethnicity_category := finaid_application_recs(i).ethnicity_category;
            ret_row.hispanic_latino_ethn_ind := finaid_application_recs(i).hispanic_latino_ethnicity_ind;
            IF NVL(finaid_application_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N'
                AND finaid_application_recs(i).number_of_races = 0
                AND finaid_application_recs(i).resident_alien_visa_count = 0 THEN
                  ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
            ELSE
                  ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
            END IF;
            ret_row.race_ethnicity_confirm_ind := finaid_application_recs(i).race_ethnicity_confirm_ind;
            ret_row.ethnicity := finaid_application_recs(i).ethnicity;
            ret_row.deceased_ind := finaid_application_recs(i).deceased_ind;
            ret_row.citizenship_ind := finaid_application_recs(i).citizenship_ind;
            ret_row.citizenship_type := finaid_application_recs(i).citizenship_type;
            ret_row.nation_of_citizenship := finaid_application_recs(i).nation_of_citizenship;
            ret_row.nation_of_birth := finaid_application_recs(i).nation_of_birth;
            ret_row.primary_disability := finaid_application_recs(i).primary_disability;
            ret_row.legacy := finaid_application_recs(i).legacy;
            ret_row.marital_status := finaid_application_recs(i).marital_status;
            ret_row.religion := finaid_application_recs(i).religion;
            ret_row.veteran_category := finaid_application_recs(i).veteran_category;
--
            ret_row.phone_number_combined := finaid_application_recs(i).phone_number_combined;
--
            --BLM mepped 6/2/14 for security reasons
            --ret_row.pers_user_attribute_01 := NULL;
            ret_row.pers_user_attribute_01 := ret_row.multi_source;
            ret_row.pers_user_attribute_02 := NULL;
            ret_row.pers_user_attribute_03 := NULL;
            ret_row.pers_user_attribute_04 := NULL;
            ret_row.pers_user_attribute_05 := NULL;
--
            ret_row.asian_ind :=finaid_application_recs(i).asian_ind;
            ret_row.native_amer_or_alaskan_ind := finaid_application_recs(i).native_american_or_alaskan_ind;
            ret_row.black_or_african_ind := finaid_application_recs(i).black_or_african_ind;
            ret_row.pacific_islander_ind := finaid_application_recs(i).pacific_islander_ind;
            ret_row.white_ind := finaid_application_recs(i).white_ind;
            ret_row.two_or_more_ind := finaid_application_recs(i).two_or_more_ind;
            ret_row.minority_ind := finaid_application_recs(i).minority_ind;
            IF finaid_application_recs(i).number_of_races = 0 and finaid_application_recs(i).resident_alien_visa_count > 0 THEN
               ret_row.non_resident_ind := 'Y';
            ELSE
                ret_row.non_resident_ind := 'N';
            END IF;

            ret_row.visa_type :=  finaid_application_recs(i).visa_type;
            ret_row.veteran_type := finaid_application_recs(i).veteran_type;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.demo_user_attribute_01 := NULL;
            ret_row.demo_user_attribute_01 := ret_row.multi_source;
            ret_row.demo_user_attribute_02 := NULL;
            ret_row.demo_user_attribute_03 := NULL;
            ret_row.demo_user_attribute_04 := NULL;
            ret_row.demo_user_attribute_05 := NULL;
            ret_row.financial_aid_year := finaid_application_recs(i).aid_year;
        --   ret_row.fayr_user_attribute_01 := NULL;
/*** CCCS - Need below line instead of above line to provide MEP ***/
			ret_row.fayr_user_attribute_01 := ret_row.multi_source;
            ret_row.fayr_user_attribute_02 := NULL;
            ret_row.fayr_user_attribute_03 := NULL;
            ret_row.fayr_user_attribute_04 := NULL;
            ret_row.fayr_user_attribute_05 := NULL;
            ret_row.financial_aid_period := finaid_application_recs(i).aid_period;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.fapd_user_attribute_01 := NULL;
            ret_row.fapd_user_attribute_01 := ret_row.multi_source;
            ret_row.fapd_user_attribute_02 := NULL;
            ret_row.fapd_user_attribute_03 := NULL;
            ret_row.fapd_user_attribute_04 := NULL;
            ret_row.fapd_user_attribute_05 := NULL;
            ret_row.financial_aid_applicant_ind := 'Y';

           IF finaid_appl_amt_recs.EXISTS(finaid_indx) THEN
                 ret_row.finaid_application_ind := NVL(finaid_appl_amt_recs(finaid_indx).application_ind,'N');
                 ret_row.dependent_ind := finaid_appl_amt_recs(finaid_indx).dependency_ind;
                 ret_row.fm_student_contribution := finaid_appl_amt_recs(finaid_indx).fm_student_contribution;
                 ret_row.fm_parent_contribution := finaid_appl_amt_recs(finaid_indx).fm_parent_contribution;
                 ret_row.fm_student_income := finaid_appl_amt_recs(finaid_indx).fm_student_income;
                 ret_row.fm_parent_income := finaid_appl_amt_recs(finaid_indx).fm_parent_income;
                 IF finaid_appl_amt_recs(finaid_indx).dependency_ind = 'Y' THEN
                           IF (finaid_appl_amt_recs(finaid_indx).fm_parent_income IS NULL AND finaid_appl_amt_recs(finaid_indx).fm_student_income IS NULL) THEN
                                  fm_total_family_income_rec :=  NULL;
                           ELSE
                                  fm_total_family_income_rec := nvl(finaid_appl_amt_recs(finaid_indx).fm_parent_income,0) + nvl(finaid_appl_amt_recs(finaid_indx).fm_student_income,0);
                           END IF;
                 ELSE
                           fm_total_family_income_rec := finaid_appl_amt_recs(finaid_indx).fm_student_income;
                 END IF;
                 ret_row.im_student_contribution := finaid_appl_amt_recs(finaid_indx).im_student_contribution;
                 ret_row.im_parent_contribution := finaid_appl_amt_recs(finaid_indx).im_parent_contribution;
                 ret_row.im_student_income := finaid_appl_amt_recs(finaid_indx).im_student_income;
                 ret_row.im_custodial_parent_income := finaid_appl_amt_recs(finaid_indx).im_custodial_parent_income;
                 ret_row.im_non_custodial_parent_income := finaid_appl_amt_recs(finaid_indx).im_non_cust_parent_income;
                 IF (finaid_appl_amt_recs(finaid_indx).im_custodial_parent_income IS NULL AND finaid_appl_amt_recs(finaid_indx).im_non_cust_parent_income IS NULL) THEN
                        im_parent_total_income_rec := NULL;
                 ELSE
                        im_parent_total_income_rec := nvl(finaid_appl_amt_recs(finaid_indx).im_custodial_parent_income,0) + nvl(finaid_appl_amt_recs(finaid_indx).im_non_cust_parent_income, 0);
                 END IF;
                 ret_row.im_parent_income := im_parent_total_income_rec;
                 IF finaid_appl_amt_recs(finaid_indx).dependency_ind = 'Y' THEN
                           IF (finaid_appl_amt_recs(finaid_indx).im_custodial_parent_income IS NULL AND finaid_appl_amt_recs(finaid_indx).im_non_cust_parent_income IS NULL AND finaid_appl_amt_recs(finaid_indx).im_student_income IS NULL) THEN
                                im_total_family_income_rec := NULL;
                           ELSE
                                im_total_family_income_rec := nvl(finaid_appl_amt_recs(finaid_indx).im_custodial_parent_income,0) + nvl(finaid_appl_amt_recs(finaid_indx).im_non_cust_parent_income,0) + nvl(finaid_appl_amt_recs(finaid_indx).im_student_income,0);
                           END IF;
                 ELSE
                           im_total_family_income_rec := finaid_appl_amt_recs(finaid_indx).im_student_income;
                 END IF;
                 ret_row.im_non_custodial_income_ind := finaid_appl_amt_recs(finaid_indx).im_non_custodial_income_ind;
                 ret_row.im_parent_home_equity := finaid_appl_amt_recs(finaid_indx).im_parent_home_equity;
           ELSE
                ret_row.finaid_application_ind := 'N' ;
           END IF;

           IF application_ind_recs.EXISTS(finaid_indx) THEN
                 ret_row.fm_application_ind := NVL(application_ind_recs(finaid_indx).fm_application_ind,'N');
                 ret_row.im_application_ind := NVL(application_ind_recs(finaid_indx).im_application_ind,'N');
           ELSE
                 ret_row.fm_application_ind := 'N';
                 ret_row.im_application_ind := 'N';
           END IF;

           IF offer_composition_amt_recs.EXISTS(finaid_indx) THEN
                 ret_row.award_offered_ind := offer_composition_amt_recs(finaid_indx).award_offered_ind;
                 ret_row.award_accepted_ind := offer_composition_amt_recs(finaid_indx).award_accepted_ind;
                 ret_row.award_declined_ind := offer_composition_amt_recs(finaid_indx).award_declined_ind;
                 ret_row.award_canceled_ind := offer_composition_amt_recs(finaid_indx).award_canceled_ind;
                 ret_row.award_paid_ind := offer_composition_amt_recs(finaid_indx).award_paid_ind;
                 ret_row.total_offer_amount := offer_composition_amt_recs(finaid_indx).total_award_offered;
                 ret_row.total_original_offer_amount := offer_composition_amt_recs(finaid_indx).total_award_original_offered;
                 ret_row.total_institution_offer_amount := offer_composition_amt_recs(finaid_indx).total_institution_offer_amount;
                 ret_row.total_federal_offer_amount := offer_composition_amt_recs(finaid_indx).total_federal_offer_amount;
                 ret_row.total_state_offer_amount := offer_composition_amt_recs(finaid_indx).total_state_offer_amount;
                 ret_row.total_other_offer_amount := offer_composition_amt_recs(finaid_indx).total_other_offer_amount;
                 ret_row.total_scholarship_offer_amount := offer_composition_amt_recs(finaid_indx).total_scholarship_offer_amount;
                 ret_row.total_loan_offer_amount := offer_composition_amt_recs(finaid_indx).total_loan_offer_amount;
                 ret_row.total_work_offer_amount := offer_composition_amt_recs(finaid_indx).total_work_offer_amount;
                 ret_row.total_grant_offer_amount := offer_composition_amt_recs(finaid_indx).total_grant_offer_amount;
                 ret_row.total_self_help_offer_amount := offer_composition_amt_recs(finaid_indx).total_self_help_offer_amount;
                 ret_row.total_gift_offer_amount := offer_composition_amt_recs(finaid_indx).total_gift_offer_amount;
                 ret_row.total_inst_gift_offer_amount := offer_composition_amt_recs(finaid_indx).total_inst_gift_offer_amount;
           END IF;

           IF finaid_appl_need_recs.EXISTS(finaid_indx) THEN
                 ret_row.fm_need_eligible_ind := finaid_appl_need_recs(finaid_indx).fm_need_eligible_ind;
                 ret_row.fm_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).fm_fully_met_need_ind;
                 ret_row.im_need_eligible_ind := finaid_appl_need_recs(finaid_indx).im_need_eligible_ind;
                 ret_row.im_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).im_fully_met_need_ind;
                 ret_row.fm_gross_need := finaid_appl_need_recs(finaid_indx).fm_gross_need;
                 ret_row.fm_expect_family_contribution := finaid_appl_need_recs(finaid_indx).fm_expect_family_contribution;
                 ret_row.fm_unmet_need := finaid_appl_need_recs(finaid_indx).fm_unmet_need;
                 ret_row.im_gross_need := finaid_appl_need_recs(finaid_indx).im_gross_need;
                 ret_row.im_expect_family_contribution := finaid_appl_need_recs(finaid_indx).im_expect_family_contribution;
                 ret_row.im_unmet_need := finaid_appl_need_recs(finaid_indx).im_unmet_need;
                 ret_row.cost_of_attendance := finaid_appl_need_recs(finaid_indx).cost_of_education;
                 ret_row.resource_amount := finaid_appl_need_recs(finaid_indx).resource_amount;
                 ret_row.other_resource_ind := finaid_appl_need_recs(finaid_indx).other_resource_ind;
           END IF;

           IF tuit_fee_bdgt_amt_recs.EXISTS(finaid_indx) THEN
                 ret_row.tuition_fee_budget_amount := tuit_fee_bdgt_amt_recs(finaid_indx).tuition_fee_budget_amt;
           END IF;

            --BLM mepped 6/2/14 for security reasons
            --ret_row.fast_user_attribute_01 := NULL;
            ret_row.fast_user_attribute_01 := ret_row.multi_source;
            ret_row.fast_user_attribute_02 := NULL;
            ret_row.fast_user_attribute_03 := NULL;
            ret_row.fast_user_attribute_04 := NULL;
            ret_row.fast_user_attribute_05 := NULL;
            ret_row.financial_aid_budget_grp := finaid_application_recs(i).budget_group;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.fabg_user_attribute_01 := NULL;
            ret_row.fabg_user_attribute_01 := ret_row.multi_source;
            ret_row.fabg_user_attribute_02 := NULL;
            ret_row.fabg_user_attribute_03 := NULL;
            ret_row.fabg_user_attribute_04 := NULL;
            ret_row.fabg_user_attribute_05 := NULL;
            ret_row.financial_aid_package_grp := finaid_application_recs(i).packaging_group;
            --BLM mepped 6/2/14 for security reasons
            --ret_row.fapg_user_attribute_01 := NULL;
            ret_row.fapg_user_attribute_01 := ret_row.multi_source;
            ret_row.fapg_user_attribute_02 := NULL;
            ret_row.fapg_user_attribute_03 := NULL;
            ret_row.fapg_user_attribute_04 := NULL;
            ret_row.fapg_user_attribute_05 := NULL;
            ret_row.fm_total_family_income := fm_total_family_income_rec;
            ret_row.im_total_family_income := im_total_family_income_rec;
            ret_row.packaging_complete_date := TRUNC(NVL(finaid_application_recs(i).package_complete_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
            ret_row.packaging_complete_ind := finaid_application_recs(i).package_complete_ind;
            ret_row.fm_batch_lock_ind := finaid_application_recs(i).fm_batch_lock_ind;
            ret_row.im_batch_lock_ind := finaid_application_recs(i).im_batch_lock_ind;
            ret_row.user_measure_01 := NULL;
            ret_row.user_measure_02 := NULL;
            ret_row.user_measure_03 := NULL;
            ret_row.user_measure_04 := NULL;
            ret_row.user_measure_05 := NULL;
            ret_row.system_load_process := 'FINAID_APPLICATION';
--
            PIPE ROW(ret_row);
--
            ret_row := ret_row_init;
            fm_total_family_income_rec := NULL;
            im_parent_total_income_rec := NULL;
            im_total_family_income_rec := NULL;
--
          END LOOP; -- finaid_application_recs
--
     END LOOP;
--
     CLOSE finaid_application_cur;
--
     RETURN;
--
  END f_get_finaid_application;
  /******************************************************************************/
  FUNCTION f_get_finaid_awd_aid_year(financial_aid_year_in VARCHAR2,
                                     process_ind_in VARCHAR2,
                                     process_date DATE,
                                     debug_var_in VARCHAR2 DEFAULT NULL)
                                RETURN tab_finaid_awd_aid_year_extr PIPELINED IS
--
    ret_row                             WTT_FINAID_AWARD_AIDYEAR_INPUT%ROWTYPE;
    ret_row_init                        WTT_FINAID_AWARD_AIDYEAR_INPUT%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                            MTVPARM%ROWTYPE;
    null_nation_rec                     MTVPARM%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;
    fetch_finaid_details                BOOLEAN := TRUE;
--
--

--
finaid_appl_amt_recs            tab_finaid_appl_amts;
finaid_appl_need_recs           tab_finaid_appl_need;
offer_composition_amt_recs      tab_offer_composition_amts;
application_ind_recs            tab_application_inds;
--
finaid_indx VARCHAR2(2000);
--
        TYPE finaid_award_aid_year_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          AID_YEAR                                VARCHAR2(63),
          AID_PERIOD                              VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          FUND                                    VARCHAR2(63),
          FUND_TYPE                               VARCHAR2(63),
          FINANCIAL_AID_TYPE                      VARCHAR2(63),
          FUND_SOURCE                             VARCHAR2(63),
          FINANCIAL_AID_SOURCE_TYPE               VARCHAR2(63),
          GIFT_OR_SELF_HELP_AID                   VARCHAR2(63),
          REPLACE_EFC_IND                         VARCHAR2(1),
          REDUCE_NEED_IND                         VARCHAR2(1),
          OVERRIDE_UNMET_NEED_IND                 VARCHAR2(1),
          OVERRIDE_NEED_TO_COA_IND                VARCHAR2(1),
          NEED_ANALYSIS_IND                       VARCHAR2(1),
          AWARD_ACCEPTED_AMOUNT                   NUMBER,
          AWARD_ACCEPTED_DATE                     DATE,
          AWARD_AUTHORIZED_AMOUNT                 NUMBER,
          AWARD_AUTHORIZED_DATE                   DATE,
          AWARD_MEMO_AMOUNT                       NUMBER,
          AWARD_MEMO_EXPIRATION_DATE              DATE,
          AWARD_PAID_AMOUNT                       NUMBER,
          AWARD_PAID_DATE                         DATE,
          AWARD_ORIGINAL_OFFERED_AMOUNT           NUMBER,
          AWARD_ORIGINAL_OFFERED_DATE             DATE,
          AWARD_OFFERED_AMOUNT                    NUMBER,
          AWARD_OFFERED_DATE                      DATE,
          AWARD_DECLINED_AMOUNT                   NUMBER,
          AWARD_DECLINED_DATE                     DATE,
          AWARD_CANCELED_AMOUNT                   NUMBER,
          AWARD_CANCELED_DATE                     DATE,
          FUND_AWARD_OFFERED_IND                  CHAR(1),
          FUND_AWARD_ACCEPTED_IND                 CHAR(1),
          FUND_AWARD_DECLINED_IND                 CHAR(1),
          FUND_AWARD_CANCELED_IND                 CHAR(1),
          FUND_AWARD_PAID_IND                     CHAR(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    finaid_award_aid_year_cur       refCurType;
    finaid_award_aid_year_rec        finaid_award_aid_year_rec_type;
    TYPE tab_f_award_aid_year_rec_type   IS TABLE OF finaid_award_aid_year_rec_type INDEX BY PLS_INTEGER;
    finaid_award_aid_year_recs        tab_f_award_aid_year_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(AAY.MIF_VALUE, def_multi_source_in)    MULTI_SOURCE,
                 AAY.ZONE_VALUE                             PROCESS_GROUP,
                 AAY.DOMAIN_VALUE                           ADMINISTRATIVE_GROUP,
                 AAY.AID_YEAR                               AID_YEAR,
                 AAY.AID_PERIOD                             AID_PERIOD,
                 AAY.PERSON_UID                             PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)             WAREHOUSE_ENTITY_UID,
                 AAY.FUND                                   FUND,
                 FF.FUND_TYPE                               FUND_TYPE,
                 FF.FINANCIAL_AID_TYPE                      FINANCIAL_AID_TYPE,
                 FF.FUND_SOURCE                             FUND_SOURCE,
                 FF.FUND_SOURCE_TYPE                        FINANCIAL_AID_SOURCE_TYPE,
                 FF.GIFT_OR_SELF_HELP_AID                   GIFT_OR_SELF_HELP_AID,
                 FF.REPLACE_TFC_IND                         REPLACE_EFC_IND,
                 FF.NEED_BASED_IND                          REDUCE_NEED_IND,
                 FF.OVERRIDE_UNMET_NEED_IND                 OVERRIDE_UNMET_NEED_IND,
                 FF.OVERRIDE_NEED_TO_COA_IND                OVERRIDE_NEED_TO_COA_IND,
                 FF.NEED_ANALYSIS_IND                       NEED_ANALYSIS_IND,
                 AAY.TOTAL_ACCEPT_AMOUNT                    AWARD_ACCEPTED_AMOUNT,
                 AAY.TOTAL_ACCEPT_DATE                      AWARD_ACCEPTED_DATE,
                 AAY.ANNUAL_AWARD_AUTHORIZE_AMOUNT          AWARD_AUTHORIZED_AMOUNT,
                 AAY.ANNUAL_AWARD_AUTHORIZE_DATE            AWARD_AUTHORIZED_DATE,
                 AAY.ANNUAL_AWARD_MEMO_AMOUNT               AWARD_MEMO_AMOUNT,
                 AAY.ANNUAL_AWARD_MEMO_DATE                 AWARD_MEMO_EXPIRATION_DATE,
                 AAY.TOTAL_PAID_AMOUNT                      AWARD_PAID_AMOUNT,
                 AAY.TOTAL_PAID_DATE                        AWARD_PAID_DATE,
                 AAY.TOTAL_OFFER_AMOUNT                     AWARD_ORIGINAL_OFFERED_AMOUNT,
                 AAY.TOTAL_ORIGINAL_OFFER_DATE              AWARD_ORIGINAL_OFFERED_DATE,
                 AAY.OFFER_AMOUNT                           AWARD_OFFERED_AMOUNT,
                 AAY.OFFER_DATE                             AWARD_OFFERED_DATE,
                 AAY.TOTAL_DECLINE_AMOUNT                   AWARD_DECLINED_AMOUNT,
                 AAY.TOTAL_DECLINE_DATE                     AWARD_DECLINED_DATE,
                 AAY.ANNUAL_AWARD_CANCEL_AMOUNT             AWARD_CANCELED_AMOUNT,
                 AAY.ANNUAL_AWARD_CANCEL_DATE               AWARD_CANCELED_DATE,
                 CASE
                    WHEN AAY.OFFER_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_OFFERED_IND,
                 CASE
                    WHEN AAY.TOTAL_ACCEPT_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_ACCEPTED_IND,
                 CASE
                    WHEN AAY.TOTAL_DECLINE_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_DECLINED_IND,
                 CASE
                    WHEN AAY.ANNUAL_AWARD_CANCEL_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_CANCELED_IND,
                 CASE
                    WHEN AAY.TOTAL_PAID_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_PAID_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MRT_FINAID_FUND FF,
                 MRT_AWARD_BY_AID_YEAR AAY,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE NVL(FF.MIF_VALUE, def_multi_source_in) = NVL(AAY.MIF_VALUE, def_multi_source_in)
             AND FF.AID_YEAR = AAY.AID_YEAR
             AND FF.FUND = AAY.FUND
             AND ((financial_aid_year_in = 'ALL' OR financial_aid_year_in = AAY.AID_YEAR))
             AND (debug_var_in IS NULL OR AAY.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = AAY.PERSON_UID
             --BLM mepped 7/30/14 for wdt_warehouse_Entity mep effort
             and we.user_attribute_01 = aay.mif_value
             AND AAY.PERSON_UID =  PD.PERSON_ID
--klf remove mep join WCV_EXTR_PERSON_DETAILS is not mepped
--             AND NVL(AAY.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(AAY.MIF_VALUE, def_multi_source_in)    MULTI_SOURCE,
                 AAY.ZONE_VALUE                             PROCESS_GROUP,
                 AAY.DOMAIN_VALUE                           ADMINISTRATIVE_GROUP,
                 AAY.AID_YEAR                               AID_YEAR,
                 AAY.AID_PERIOD                             AID_PERIOD,
                 AAY.PERSON_UID                             PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)             WAREHOUSE_ENTITY_UID,
                 AAY.FUND                                   FUND,
                 FF.FUND_TYPE                               FUND_TYPE,
                 FF.FINANCIAL_AID_TYPE                      FINANCIAL_AID_TYPE,
                 FF.FUND_SOURCE                             FUND_SOURCE,
                 FF.FUND_SOURCE_TYPE                        FINANCIAL_AID_SOURCE_TYPE,
                 FF.GIFT_OR_SELF_HELP_AID                   GIFT_OR_SELF_HELP_AID,
                 FF.REPLACE_TFC_IND                         REPLACE_EFC_IND,
                 FF.NEED_BASED_IND                          REDUCE_NEED_IND,
                 FF.OVERRIDE_UNMET_NEED_IND                 OVERRIDE_UNMET_NEED_IND,
                 FF.OVERRIDE_NEED_TO_COA_IND                OVERRIDE_NEED_TO_COA_IND,
                 FF.NEED_ANALYSIS_IND                       NEED_ANALYSIS_IND,
                 AAY.TOTAL_ACCEPT_AMOUNT                    AWARD_ACCEPTED_AMOUNT,
                 AAY.TOTAL_ACCEPT_DATE                      AWARD_ACCEPTED_DATE,
                 AAY.ANNUAL_AWARD_AUTHORIZE_AMOUNT          AWARD_AUTHORIZED_AMOUNT,
                 AAY.ANNUAL_AWARD_AUTHORIZE_DATE            AWARD_AUTHORIZED_DATE,
                 AAY.ANNUAL_AWARD_MEMO_AMOUNT               AWARD_MEMO_AMOUNT,
                 AAY.ANNUAL_AWARD_MEMO_DATE                 AWARD_MEMO_EXPIRATION_DATE,
                 AAY.TOTAL_PAID_AMOUNT                      AWARD_PAID_AMOUNT,
                 AAY.TOTAL_PAID_DATE                        AWARD_PAID_DATE,
                 AAY.TOTAL_OFFER_AMOUNT                     AWARD_ORIGINAL_OFFERED_AMOUNT,
                 AAY.TOTAL_ORIGINAL_OFFER_DATE              AWARD_ORIGINAL_OFFERED_DATE,
                 AAY.OFFER_AMOUNT                           AWARD_OFFERED_AMOUNT,
                 AAY.OFFER_DATE                             AWARD_OFFERED_DATE,
                 AAY.TOTAL_DECLINE_AMOUNT                   AWARD_DECLINED_AMOUNT,
                 AAY.TOTAL_DECLINE_DATE                     AWARD_DECLINED_DATE,
                 AAY.ANNUAL_AWARD_CANCEL_AMOUNT             AWARD_CANCELED_AMOUNT,
                 AAY.ANNUAL_AWARD_CANCEL_DATE               AWARD_CANCELED_DATE,
                 CASE
                    WHEN AAY.OFFER_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_OFFERED_IND,
                 CASE
                    WHEN AAY.TOTAL_ACCEPT_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_ACCEPTED_IND,
                 CASE
                    WHEN AAY.TOTAL_DECLINE_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_DECLINED_IND,
                 CASE
                    WHEN AAY.ANNUAL_AWARD_CANCEL_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_CANCELED_IND,
                 CASE
                    WHEN AAY.TOTAL_PAID_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_PAID_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MRT_FINAID_FUND FF,
                 MRT_AWARD_BY_AID_YEAR AAY,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_FINAID_AWARD_AID_YEAR CHG
           WHERE CHG.PERSON_UID = AAY.PERSON_UID
             AND (debug_var_in IS NULL OR AAY.PERSON_UID LIKE debug_var_in)
             AND NVL(FF.MIF_VALUE, def_multi_source_in) = NVL(AAY.MIF_VALUE, def_multi_source_in)
             AND FF.AID_YEAR = AAY.AID_YEAR
             AND FF.FUND = AAY.FUND
             AND WE.BANNER_PIDM = AAY.PERSON_UID
             --BLM mepped 7/30/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = aay.mif_value
             AND AAY.PERSON_UID =  PD.PERSON_ID
--klf wcv_extr_person_details is not mepped - remove mep join
--             AND NVL(AAY.MIF_VALUE, def_multi_source_in) =  PD.MULTI_SRC
;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_FINAID_AWARD_AID_YEAR', financial_aid_year_in, 'AID_YEAR');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_FINAID_AWARD_AID_YEAR', 'WFT_FINAID_AWARD_AID_YEAR', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','FINAID_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        finaid_award_aid_year_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        finaid_award_aid_year_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH finaid_award_aid_year_cur BULK COLLECT INTO finaid_award_aid_year_recs LIMIT bulk_size;
       EXIT WHEN finaid_award_aid_year_recs.COUNT = 0 ;

       IF finaid_award_aid_year_recs.COUNT > 0  AND fetch_finaid_details THEN
--
                 fetch_finaid_details := FALSE;
--
           FOR finaid_appl_amts in get_finaid_appl_amts(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
               finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID ||  '{' || finaid_appl_amts.AID_YEAR).APPLICATION_IND :=finaid_appl_amts.APPLICATION_IND;
               finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID ||  '{' || finaid_appl_amts.AID_YEAR).DEPENDENCY_IND :=finaid_appl_amts.DEPENDENCY_IND;
           END LOOP;

           FOR finaid_appl_need in get_finaid_appl_need(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
               finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_NEED_ELIGIBLE_IND :=finaid_appl_need.FM_NEED_ELIGIBLE_IND;
               finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).FM_FULLY_MET_NEED_IND :=finaid_appl_need.FM_FULLY_MET_NEED_IND;
               finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_NEED_ELIGIBLE_IND :=finaid_appl_need.IM_NEED_ELIGIBLE_IND;
               finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||  '{' || finaid_appl_need.PERSON_UID ||  '{' || finaid_appl_need.AID_YEAR).IM_FULLY_MET_NEED_IND :=finaid_appl_need.IM_FULLY_MET_NEED_IND;
           END LOOP;

          FOR offer_composition_amt in get_total_offer_amts(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
               offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_OFFERED_IND :=offer_composition_amt.AWARD_OFFERED_IND;
               offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_ACCEPTED_IND :=offer_composition_amt.AWARD_ACCEPTED_IND;
               offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_DECLINED_IND :=offer_composition_amt.AWARD_DECLINED_IND;
               offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_CANCELED_IND :=offer_composition_amt.AWARD_CANCELED_IND;
               offer_composition_amt_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID || '{' || offer_composition_amt.AID_YEAR).AWARD_PAID_IND :=offer_composition_amt.AWARD_PAID_IND;
           END LOOP;

           FOR application_ind in get_application_inds(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
               application_ind_recs(application_ind.MULTI_SRC_IN ||  '{' || application_ind.PERSON_UID ||  '{' || application_ind.AID_YEAR ).FM_APPLICATION_IND :=application_ind.FM_APPLICATION_IND;
               application_ind_recs(application_ind.MULTI_SRC_IN ||  '{' || application_ind.PERSON_UID ||  '{' || application_ind.AID_YEAR ).IM_APPLICATION_IND :=application_ind.IM_APPLICATION_IND;
           END LOOP;
--
       END IF;
--
       FOR i IN finaid_award_aid_year_recs.FIRST..finaid_award_aid_year_recs.LAST
       LOOP
         finaid_indx    := finaid_award_aid_year_recs(i).multi_source || '{' || finaid_award_aid_year_recs(i).person_uid || '{' || finaid_award_aid_year_recs(i).aid_year;
--
         ret_row.multi_source := finaid_award_aid_year_recs(i).multi_source;
         ret_row.process_group := finaid_award_aid_year_recs(i).process_group;
         ret_row.administrative_group := finaid_award_aid_year_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons         
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.person_uid := finaid_award_aid_year_recs(i).warehouse_entity_uid;
         ret_row.id := finaid_award_aid_year_recs(i).id;
         ret_row.full_name_lfmi := finaid_award_aid_year_recs(i).full_name_lfmi;
         ret_row.birth_date := finaid_award_aid_year_recs(i).birth_date;
         ret_row.deceased_date := finaid_award_aid_year_recs(i).deceased_date;
         ret_row.email_address := finaid_award_aid_year_recs(i).email_address;

         ret_row.phone_number_combined := finaid_award_aid_year_recs(i).phone_number_combined;
         ret_row.confidentiality_ind := finaid_award_aid_year_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons          
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := finaid_award_aid_year_recs(i).gender;
         ret_row.ethnicity_category := finaid_award_aid_year_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := finaid_award_aid_year_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.race_ethnicity_confirm_ind := finaid_award_aid_year_recs(i).race_ethnicity_confirm_ind;
         ret_row.ethnicity := finaid_award_aid_year_recs(i).ethnicity;
         ret_row.deceased_ind := finaid_award_aid_year_recs(i).deceased_ind;
         ret_row.citizenship_ind := finaid_award_aid_year_recs(i).citizenship_ind;
         ret_row.citizenship_type := finaid_award_aid_year_recs(i).citizenship_type;

         ret_row.visa_type :=  finaid_award_aid_year_recs(i).visa_type;

         ret_row.nation_of_citizenship := finaid_award_aid_year_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := finaid_award_aid_year_recs(i).nation_of_birth;
         ret_row.primary_disability := finaid_award_aid_year_recs(i).primary_disability;
         ret_row.legacy := finaid_award_aid_year_recs(i).legacy;
         ret_row.marital_status := finaid_award_aid_year_recs(i).marital_status;
         ret_row.religion := finaid_award_aid_year_recs(i).religion;
--
         ret_row.asian_ind := finaid_award_aid_year_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := finaid_award_aid_year_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := finaid_award_aid_year_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := finaid_award_aid_year_recs(i).pacific_islander_ind;
         ret_row.white_ind := finaid_award_aid_year_recs(i).white_ind;
         IF finaid_award_aid_year_recs(i).number_of_races = 0 and finaid_award_aid_year_recs(i).resident_alien_visa_count > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         ret_row.two_or_more_ind :=finaid_award_aid_year_recs(i).two_or_more_ind;
         ret_row.minority_ind := finaid_award_aid_year_recs(i).minority_ind;
--
         IF NVL(finaid_award_aid_year_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N'
            AND finaid_award_aid_year_recs(i).number_of_races = 0
            AND  finaid_award_aid_year_recs(i).resident_alien_visa_count = 0 THEN
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
         ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
         END IF;
--
         ret_row.veteran_type := finaid_award_aid_year_recs(i).veteran_type;
         ret_row.veteran_category := finaid_award_aid_year_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.financial_aid_year := finaid_award_aid_year_recs(i).aid_year;
         --BLM mepped 6/2/14 for security reasons         
         --ret_row.fayr_user_attribute_01 := NULL;
         ret_row.fayr_user_attribute_01 := ret_row.multi_source;
         ret_row.fayr_user_attribute_02 := NULL;
         ret_row.fayr_user_attribute_03 := NULL;
         ret_row.fayr_user_attribute_04 := NULL;
         ret_row.fayr_user_attribute_05 := NULL;
         ret_row.fund :=  finaid_award_aid_year_recs(i).fund;
         ret_row.fund_type :=  finaid_award_aid_year_recs(i).fund_type;
         ret_row.financial_aid_type :=  finaid_award_aid_year_recs(i).financial_aid_type;
         ret_row.fund_source :=  finaid_award_aid_year_recs(i).fund_source;
         ret_row.financial_aid_source_type :=  finaid_award_aid_year_recs(i).financial_aid_source_type;
         ret_row.gift_or_self_help_aid :=  finaid_award_aid_year_recs(i).gift_or_self_help_aid;
         ret_row.replace_efc_ind :=  finaid_award_aid_year_recs(i).replace_efc_ind;
         ret_row.reduce_need_ind :=  finaid_award_aid_year_recs(i).reduce_need_ind;
         ret_row.override_unmet_need_ind :=  finaid_award_aid_year_recs(i).override_unmet_need_ind;
         ret_row.override_need_to_coa_ind :=  finaid_award_aid_year_recs(i).override_need_to_coa_ind;
         ret_row.need_analysis_ind :=  finaid_award_aid_year_recs(i).need_analysis_ind;
         --BLM mepped 6/2/14 for security reasons             
         --ret_row.fafd_user_attribute_01 :=  NULL;
         ret_row.fafd_user_attribute_01 :=  ret_row.multi_source;
         ret_row.fafd_user_attribute_02 :=  NULL;
         ret_row.fafd_user_attribute_03 :=  NULL;
         ret_row.fafd_user_attribute_04 :=  NULL;
         ret_row.fafd_user_attribute_05 :=  NULL;
         ret_row.financial_aid_applicant_ind := 'Y';

         IF finaid_appl_amt_recs.EXISTS(finaid_indx) THEN
               ret_row.finaid_application_ind := NVL(finaid_appl_amt_recs(finaid_indx).application_ind,'N');
               ret_row.dependent_ind := finaid_appl_amt_recs(finaid_indx).dependency_ind;
         ELSE
               ret_row.finaid_application_ind := 'N';
         END IF;
--
         IF finaid_appl_need_recs.EXISTS(finaid_indx) THEN
               ret_row.fm_need_eligible_ind := finaid_appl_need_recs(finaid_indx).fm_need_eligible_ind;
               ret_row.fm_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).fm_fully_met_need_ind;
               ret_row.im_need_eligible_ind := finaid_appl_need_recs(finaid_indx).im_need_eligible_ind;
               ret_row.im_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).im_fully_met_need_ind;
         END IF;
--
         IF offer_composition_amt_recs.EXISTS(finaid_indx) THEN
               ret_row.award_offered_ind := offer_composition_amt_recs(finaid_indx).award_offered_ind;
               ret_row.award_accepted_ind := offer_composition_amt_recs(finaid_indx).award_accepted_ind;
               ret_row.award_declined_ind := offer_composition_amt_recs(finaid_indx).award_declined_ind;
               ret_row.award_canceled_ind := offer_composition_amt_recs(finaid_indx).award_canceled_ind;
               ret_row.award_paid_ind := offer_composition_amt_recs(finaid_indx).award_paid_ind;
         END IF;
--
         IF application_ind_recs.EXISTS(finaid_indx) THEN
               ret_row.fm_application_ind := NVL(application_ind_recs(finaid_indx).fm_application_ind,'N');
               ret_row.im_application_ind := NVL(application_ind_recs(finaid_indx).im_application_ind,'N');
         ELSE
               ret_row.fm_application_ind :='N';
               ret_row.im_application_ind := 'N';
         END IF;
--
         --BLM mepped 6/2/14 for security reasons  
         --ret_row.fast_user_attribute_01 := NULL;
         ret_row.fast_user_attribute_01 := ret_row.multi_source;
         ret_row.fast_user_attribute_02 := NULL;
         ret_row.fast_user_attribute_03 := NULL;
         ret_row.fast_user_attribute_04 := NULL;
         ret_row.fast_user_attribute_05 := NULL;
         ret_row.fund_award_offered_ind :=  finaid_award_aid_year_recs(i).fund_award_offered_ind;
         ret_row.fund_award_accepted_ind :=  finaid_award_aid_year_recs(i).fund_award_accepted_ind;
         ret_row.fund_award_declined_ind :=  finaid_award_aid_year_recs(i).fund_award_declined_ind;
         ret_row.fund_award_canceled_ind :=  finaid_award_aid_year_recs(i).fund_award_canceled_ind;
         ret_row.fund_award_paid_ind :=  finaid_award_aid_year_recs(i).fund_award_paid_ind;
         --BLM mepped 6/2/14 for security reasons          
         --ret_row.fund_user_attribute_01 :=  NULL;
         ret_row.fund_user_attribute_01 :=  ret_row.multi_source;
         ret_row.fund_user_attribute_02 :=  NULL;
         ret_row.fund_user_attribute_03 :=  NULL;
         ret_row.fund_user_attribute_04 :=  NULL;
         ret_row.fund_user_attribute_05 :=  NULL;
         ret_row.award_authorized_amount :=  finaid_award_aid_year_recs(i).award_authorized_amount;
         ret_row.award_authorized_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_authorized_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_offered_amount :=  finaid_award_aid_year_recs(i).award_offered_amount;
         ret_row.award_offered_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_offered_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_original_offered_amount :=  finaid_award_aid_year_recs(i).award_original_offered_amount;
         ret_row.award_original_offered_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_original_offered_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_accepted_amount :=  finaid_award_aid_year_recs(i).award_accepted_amount;
         ret_row.award_accepted_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_accepted_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_declined_amount :=  finaid_award_aid_year_recs(i).award_declined_amount;
         ret_row.award_declined_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_declined_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_canceled_amount :=  finaid_award_aid_year_recs(i).award_canceled_amount;
         ret_row.award_canceled_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_canceled_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_memo_amount :=  finaid_award_aid_year_recs(i).award_memo_amount;
         ret_row.award_memo_expiration_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_memo_expiration_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_paid_amount :=  finaid_award_aid_year_recs(i).award_paid_amount;
         ret_row.award_paid_date :=  TRUNC(NVL(finaid_award_aid_year_recs(i).award_paid_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'FINAID_AWARD_AIDYEAR';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
--
      END LOOP; -- finaid_award_aid_year_recs
--
    END LOOP;
--
    CLOSE finaid_award_aid_year_cur;
--
    RETURN;
--
  END f_get_finaid_awd_aid_year;
/******************************************************************************/
  FUNCTION f_get_finaid_awd_acad_pd(financial_aid_year_in VARCHAR2,
                                    process_ind_in VARCHAR2,
                                    process_date DATE,
                                    debug_var_in VARCHAR2 DEFAULT NULL)
                                RETURN tab_finaid_awd_acad_pd_extr PIPELINED IS
--
    ret_row                             WTT_FINAID_AWARD_ACADPD_INPUT%ROWTYPE;
    ret_row_init                        WTT_FINAID_AWARD_ACADPD_INPUT%ROWTYPE;
    acad_time_rec                       MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    acad_time_rec_init                  MGT_YEAR_TYPE_DEFINITION%ROWTYPE;
    default_rec                         WCV_DEFAULT_VALUES%ROWTYPE;
    parm_rec                            MTVPARM%ROWTYPE;
    null_nation_rec                     MTVPARM%ROWTYPE;
    bulk_limit                          MTVPARM%ROWTYPE;
    bulk_size                           NUMBER;
    fetch_finaid_details                BOOLEAN := TRUE;
--
--

--
finaid_appl_amt_recs            tab_finaid_appl_amts;
finaid_appl_need_recs           tab_finaid_appl_need;
total_offer_amts_acad_pd_recs   tab_total_offer_amts_acad_pd;
application_ind_recs            tab_application_inds;
--
finaid_indx       VARCHAR2(2000);
finaid_ap_indx  VARCHAR2(2000);
--
        TYPE finaid_award_acad_pd_rec_type IS RECORD (
          MULTI_SOURCE                            VARCHAR2(500),
          PROCESS_GROUP                           VARCHAR2(255),
          ADMINISTRATIVE_GROUP                    VARCHAR2(255),
          AID_YEAR                                VARCHAR2(63),
          AID_PERIOD                              VARCHAR2(63),
          ACADEMIC_PERIOD                         VARCHAR2(63),
          PERSON_UID                              NUMBER,
          WAREHOUSE_ENTITY_UID                    NUMBER,
          FUND                                    VARCHAR2(63),
          FUND_TYPE                               VARCHAR2(63),
          FINANCIAL_AID_TYPE                      VARCHAR2(63),
          FUND_SOURCE                             VARCHAR2(63),
          FINANCIAL_AID_SOURCE_TYPE               VARCHAR2(63),
          GIFT_OR_SELF_HELP_AID                   VARCHAR2(63),
          REPLACE_EFC_IND                         VARCHAR2(1),
          REDUCE_NEED_IND                         VARCHAR2(1),
          OVERRIDE_UNMET_NEED_IND                 VARCHAR2(1),
          OVERRIDE_NEED_TO_COA_IND                VARCHAR2(1),
          NEED_ANALYSIS_IND                       VARCHAR2(1),
          AWARD_ACCEPTED_AMOUNT                   NUMBER,
          AWARD_ACCEPTED_DATE                     DATE,
          AWARD_AUTHORIZED_AMOUNT                 NUMBER,
          AWARD_AUTHORIZED_DATE                   DATE,
          AWARD_MEMO_AMOUNT                       NUMBER,
          AWARD_MEMO_EXPIRATION_DATE              DATE,
          AWARD_PAID_AMOUNT                       NUMBER,
          AWARD_PAID_DATE                         DATE,
          AWARD_ORIGINAL_OFFERED_AMOUNT           NUMBER,
          AWARD_ORIGINAL_OFFERED_DATE             DATE,
          AWARD_OFFERED_AMOUNT                    NUMBER,
          AWARD_OFFERED_DATE                      DATE,
          AWARD_DECLINED_AMOUNT                   NUMBER,
          AWARD_DECLINED_DATE                     DATE,
          AWARD_CANCELED_AMOUNT                   NUMBER,
          AWARD_CANCELED_DATE                     DATE,
          FUND_AWARD_OFFERED_IND                  CHAR(1),
          FUND_AWARD_ACCEPTED_IND                 CHAR(1),
          FUND_AWARD_DECLINED_IND                 CHAR(1),
          FUND_AWARD_CANCELED_IND                 CHAR(1),
          FUND_AWARD_PAID_IND                     CHAR(1),
          PERSON_ID                               NUMBER,
          MULTI_SRC                               VARCHAR2(63),
          ID                                      VARCHAR2(63),
          FULL_NAME_LFMI                          VARCHAR2(255),
          BIRTH_DATE                              DATE,
          DECEASED_DATE                           DATE,
          EMAIL_ADDRESS                           VARCHAR2(255),
          CONFIDENTIALITY_IND                     VARCHAR2(1),
          GENDER                                  VARCHAR2(63),
          ETHNICITY_CATEGORY                      VARCHAR2(63),
          HISPANIC_LATINO_ETHNICITY_IND           VARCHAR2(1),
          ETHNICITY                               VARCHAR2(63),
          DECEASED_IND                            VARCHAR2(1),
          CITIZENSHIP_IND                         VARCHAR2(1),
          CITIZENSHIP_TYPE                        VARCHAR2(63),
          NATION_OF_CITIZENSHIP                   VARCHAR2(63),
          NATION_OF_BIRTH                         VARCHAR2(63),
          PRIMARY_DISABILITY                      VARCHAR2(63),
          LEGACY                                  VARCHAR2(63),
          MARITAL_STATUS                          VARCHAR2(63),
          RELIGION                                VARCHAR2(63),
          VETERAN_CATEGORY                        VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_IND              VARCHAR2(1),
          RACE_ETHNICITY_CONFIRM_DATE             DATE,
          PHONE_NUMBER_COMBINED                   VARCHAR2(63),
          VISA_TYPE                               VARCHAR2(63),
          NATIVE_AMERICAN_OR_ALASKAN_IND          VARCHAR2(1),
          ASIAN_IND                               VARCHAR2(1),
          BLACK_OR_AFRICAN_IND                    VARCHAR2(1),
          PACIFIC_ISLANDER_IND                    VARCHAR2(1),
          WHITE_IND                               VARCHAR2(1),
          TWO_OR_MORE_IND                         VARCHAR2(1),
          NUMBER_OF_RACES                         NUMBER,
          MINORITY_IND                            NUMBER,
          RESIDENT_ALIEN_VISA_COUNT               NUMBER,
          VETERAN_TYPE                            VARCHAR2(1),
          MAX_ACAD_PER                            VARCHAR2(63),
          ADDRESS_TYPE                            VARCHAR2(63),
          ADDRESS_SEQ_NO                          NUMBER,
          POSTAL_CODE                             VARCHAR2(63),
          CITY                                    VARCHAR2(63),
          COUNTY_CODE                             VARCHAR2(63),
          STATE_PROVINCE                          VARCHAR2(63),
          NATION                                  VARCHAR2(63),
          STREET_LINE1                            VARCHAR2(255),
          STREET_LINE2                            VARCHAR2(255),
          STREET_LINE3                            VARCHAR2(255),
          STREET_LINE4                            VARCHAR2(255)
    );
    TYPE refCurType     IS REF CURSOR;
    finaid_award_acad_pd_cur       refCurType;
    finaid_award_acad_pd_rec        finaid_award_acad_pd_rec_type;
    TYPE tab_f_award_acad_pd_rec_type   IS TABLE OF finaid_award_acad_pd_rec_type INDEX BY PLS_INTEGER;
    finaid_award_acad_pd_recs        tab_f_award_acad_pd_rec_type;
    --
    FUNCTION f_getLoadResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT NVL(ABP.MIF_VALUE, def_multi_source_in)    MULTI_SOURCE,
                 ABP.ZONE_VALUE                             PROCESS_GROUP,
                 ABP.DOMAIN_VALUE                           ADMINISTRATIVE_GROUP,
                 ABP.AID_YEAR                               AID_YEAR,
                 ABP.AID_PERIOD                             AID_PERIOD,
                 ABP.ACADEMIC_PERIOD                        ACADEMIC_PERIOD,
                 ABP.PERSON_UID                             PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)             WAREHOUSE_ENTITY_UID,
                 ABP.FUND                                   FUND,
                 FF.FUND_TYPE                               FUND_TYPE,
                 FF.FINANCIAL_AID_TYPE                      FINANCIAL_AID_TYPE,
                 FF.FUND_SOURCE                             FUND_SOURCE,
                 FF.FUND_SOURCE_TYPE                        FINANCIAL_AID_SOURCE_TYPE,
                 FF.GIFT_OR_SELF_HELP_AID                   GIFT_OR_SELF_HELP_AID,
                 FF.REPLACE_TFC_IND                         REPLACE_EFC_IND,
                 FF.NEED_BASED_IND                          REDUCE_NEED_IND,
                 FF.OVERRIDE_UNMET_NEED_IND                 OVERRIDE_UNMET_NEED_IND,
                 FF.OVERRIDE_NEED_TO_COA_IND                OVERRIDE_NEED_TO_COA_IND,
                 FF.NEED_ANALYSIS_IND                       NEED_ANALYSIS_IND,
                 ABP.AWARD_ACCEPT_AMOUNT                    AWARD_ACCEPTED_AMOUNT,
                 ABP.AWARD_ACCEPT_DATE                      AWARD_ACCEPTED_DATE,
                 ABP.AWARD_AUTHORIZE_AMOUNT                 AWARD_AUTHORIZED_AMOUNT,
                 ABP.AWARD_AUTHORIZE_DATE                   AWARD_AUTHORIZED_DATE,
                 ABP.AWARD_MEMO_AMOUNT                      AWARD_MEMO_AMOUNT,
                 ABP.AWARD_MEMO_EXPIRATION_DATE             AWARD_MEMO_EXPIRATION_DATE,
                 ABP.AWARD_PAID_AMOUNT                      AWARD_PAID_AMOUNT,
                 ABP.AWARD_PAID_DATE                        AWARD_PAID_DATE,
                 ABP.AWARD_ORIGINAL_OFFER_AMOUNT            AWARD_ORIGINAL_OFFERED_AMOUNT,
                 ABP.AWARD_ORIGINAL_OFFER_DATE              AWARD_ORIGINAL_OFFERED_DATE,
                 ABP.AWARD_OFFER_AMOUNT                     AWARD_OFFERED_AMOUNT,
                 ABP.AWARD_OFFER_DATE                       AWARD_OFFERED_DATE,
                 ABP.AWARD_DECLINE_AMOUNT                   AWARD_DECLINED_AMOUNT,
                 ABP.AWARD_DECLINE_DATE                     AWARD_DECLINED_DATE,
                 ABP.AWARD_CANCEL_AMOUNT                    AWARD_CANCELED_AMOUNT,
                 ABP.AWARD_CANCEL_DATE                      AWARD_CANCELED_DATE,
                 CASE
                    WHEN ABP.AWARD_OFFER_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_OFFERED_IND,
                 CASE
                    WHEN ABP.AWARD_ACCEPT_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_ACCEPTED_IND,
                 CASE
                    WHEN ABP.AWARD_DECLINE_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_DECLINED_IND,
                 CASE
                    WHEN ABP.AWARD_CANCEL_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_CANCELED_IND,
                 CASE
                    WHEN ABP.AWARD_PAID_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_PAID_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MRT_FINAID_FUND FF,
                 MRT_AWARD_BY_PERSON ABP,
                 WCV_EXTR_PERSON_DETAILS PD
           WHERE NVL(FF.MIF_VALUE, def_multi_source_in) = NVL(ABP.MIF_VALUE, def_multi_source_in)
             AND FF.AID_YEAR = ABP.AID_YEAR
             AND FF.FUND = ABP.FUND
             AND ((financial_aid_year_in = 'ALL' OR financial_aid_year_in = ABP.AID_YEAR))
             AND (debug_var_in IS NULL OR ABP.PERSON_UID LIKE debug_var_in)
             AND WE.BANNER_PIDM = ABP.PERSON_UID
             --BLM mepped 7/30/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = abp.mif_value
             AND ABP.PERSON_UID =  PD.PERSON_ID
--klf remove mep join - WCV_EXTR_PERSON_DETAILS id not meped
--           AND NVL(ABP.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
;
            RETURN localCursor;
    END f_getLoadResults;
    --
    FUNCTION f_getRefreshResults(def_multi_source_in VARCHAR2) RETURN refCurType IS
        localCursor         refCurType;
        BEGIN
            OPEN localCursor FOR
          SELECT DISTINCT NVL(ABP.MIF_VALUE, def_multi_source_in)    MULTI_SOURCE,
                 ABP.ZONE_VALUE                             PROCESS_GROUP,
                 ABP.DOMAIN_VALUE                           ADMINISTRATIVE_GROUP,
                 ABP.AID_YEAR                               AID_YEAR,
                 ABP.AID_PERIOD                             AID_PERIOD,
                 ABP.ACADEMIC_PERIOD                        ACADEMIC_PERIOD,
                 ABP.PERSON_UID                             PERSON_UID,
                 NVL(WE.WAREHOUSE_ENTITY_UID,0)             WAREHOUSE_ENTITY_UID,
                 ABP.FUND                                   FUND,
                 FF.FUND_TYPE                               FUND_TYPE,
                 FF.FINANCIAL_AID_TYPE                      FINANCIAL_AID_TYPE,
                 FF.FUND_SOURCE                             FUND_SOURCE,
                 FF.FUND_SOURCE_TYPE                        FINANCIAL_AID_SOURCE_TYPE,
                 FF.GIFT_OR_SELF_HELP_AID                   GIFT_OR_SELF_HELP_AID,
                 FF.REPLACE_TFC_IND                         REPLACE_EFC_IND,
                 FF.NEED_BASED_IND                          REDUCE_NEED_IND,
                 FF.OVERRIDE_UNMET_NEED_IND                 OVERRIDE_UNMET_NEED_IND,
                 FF.OVERRIDE_NEED_TO_COA_IND                OVERRIDE_NEED_TO_COA_IND,
                 FF.NEED_ANALYSIS_IND                       NEED_ANALYSIS_IND,
                 ABP.AWARD_ACCEPT_AMOUNT                    AWARD_ACCEPTED_AMOUNT,
                 ABP.AWARD_ACCEPT_DATE                      AWARD_ACCEPTED_DATE,
                 ABP.AWARD_AUTHORIZE_AMOUNT                 AWARD_AUTHORIZED_AMOUNT,
                 ABP.AWARD_AUTHORIZE_DATE                   AWARD_AUTHORIZED_DATE,
                 ABP.AWARD_MEMO_AMOUNT                      AWARD_MEMO_AMOUNT,
                 ABP.AWARD_MEMO_EXPIRATION_DATE             AWARD_MEMO_EXPIRATION_DATE,
                 ABP.AWARD_PAID_AMOUNT                      AWARD_PAID_AMOUNT,
                 ABP.AWARD_PAID_DATE                        AWARD_PAID_DATE,
                 ABP.AWARD_ORIGINAL_OFFER_AMOUNT            AWARD_ORIGINAL_OFFERED_AMOUNT,
                 ABP.AWARD_ORIGINAL_OFFER_DATE              AWARD_ORIGINAL_OFFERED_DATE,
                 ABP.AWARD_OFFER_AMOUNT                     AWARD_OFFERED_AMOUNT,
                 ABP.AWARD_OFFER_DATE                       AWARD_OFFERED_DATE,
                 ABP.AWARD_DECLINE_AMOUNT                   AWARD_DECLINED_AMOUNT,
                 ABP.AWARD_DECLINE_DATE                     AWARD_DECLINED_DATE,
                 ABP.AWARD_CANCEL_AMOUNT                    AWARD_CANCELED_AMOUNT,
                 ABP.AWARD_CANCEL_DATE                      AWARD_CANCELED_DATE,
                 CASE
                    WHEN ABP.AWARD_OFFER_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_OFFERED_IND,
                 CASE
                    WHEN ABP.AWARD_ACCEPT_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_ACCEPTED_IND,
                 CASE
                    WHEN ABP.AWARD_DECLINE_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_DECLINED_IND,
                 CASE
                    WHEN ABP.AWARD_CANCEL_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_CANCELED_IND,
                 CASE
                    WHEN ABP.AWARD_PAID_AMOUNT > 0 THEN 'Y'
                    ELSE 'N'
                 END                                        FUND_AWARD_PAID_IND,
                 PD.*
            FROM WDT_WAREHOUSE_ENTITY WE,
                 MRT_FINAID_FUND FF,
                 MRT_AWARD_BY_PERSON ABP,
                 WCV_EXTR_PERSON_DETAILS PD,
                 CHG_FINAID_AWARD_ACAD_PERIOD CHG
           WHERE CHG.PERSON_UID = ABP.PERSON_UID
             AND (debug_var_in IS NULL OR ABP.PERSON_UID LIKE debug_var_in)
             AND NVL(FF.MIF_VALUE, def_multi_source_in) = NVL(ABP.MIF_VALUE, def_multi_source_in)
             AND FF.AID_YEAR = ABP.AID_YEAR
             AND FF.FUND = ABP.FUND
             AND WE.BANNER_PIDM = ABP.PERSON_UID
             --BLM mepped 7/30/14 for wdt_warehouse_entity mep effort
             and we.user_attribute_01 = abp.mif_value
             AND ABP.PERSON_UID =  PD.PERSON_ID
--klf remove mep join - WCV_EXTR_PERSON_DETAILS is not mepped
--             AND NVL(ABP.MIF_VALUE, def_multi_source_in) = PD.MULTI_SRC
             ;
            RETURN localCursor;
    END f_getRefreshResults;
  BEGIN
--
    IF debug_var_in IS NULL THEN
       IF process_ind_in = 'L' THEN
          edw_general_extr.p_delete_fact_table('WFT_FINAID_AWARD_ACAD_PERIOD', financial_aid_year_in, 'AID_YEAR');
       ELSE
          edw_general_extr.p_delete_fact_records('CHG_FINAID_AWARD_ACAD_PERIOD', 'WFT_FINAID_AWARD_ACAD_PERIOD', 'PERSON_UID');
       END IF;
    END IF;
--
    OPEN edw_general_extr.get_default_values;
    FETCH edw_general_extr.get_default_values INTO default_rec;
    CLOSE edw_general_extr.get_default_values;
--
    OPEN edw_general_extr.get_mtvparm('EDW EXTRACT PARAMETERS','BULK_OPERATIONS_SIZE','FINAID_EXTRACT_PROCESS');
    FETCH edw_general_extr.get_mtvparm INTO bulk_limit;
    CLOSE edw_general_extr.get_mtvparm;
--
    bulk_size := NVL(bulk_limit.mtvparm_desc, 10000);
--
    IF process_ind_in = 'L' THEN
        finaid_award_acad_pd_cur := f_getLoadResults(default_rec.multi_source_cleanse_value);
    ELSE
        finaid_award_acad_pd_cur := f_getRefreshResults(default_rec.multi_source_cleanse_value);
    END IF;
    LOOP
       FETCH finaid_award_acad_pd_cur BULK COLLECT INTO finaid_award_acad_pd_recs LIMIT bulk_size;
       EXIT WHEN finaid_award_acad_pd_recs.COUNT = 0;
--
       IF finaid_award_acad_pd_recs.COUNT > 0  AND fetch_finaid_details THEN
--
          fetch_finaid_details := FALSE;
--
          FOR finaid_appl_amts in get_finaid_appl_amts(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
              finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID ||   '{' || finaid_appl_amts.AID_YEAR).APPLICATION_IND :=finaid_appl_amts.APPLICATION_IND;
              finaid_appl_amt_recs(finaid_appl_amts.MULTI_SRC_IN ||  '{' || finaid_appl_amts.PERSON_UID ||   '{' || finaid_appl_amts.AID_YEAR).DEPENDENCY_IND :=finaid_appl_amts.DEPENDENCY_IND;
          END LOOP;

          FOR finaid_appl_need in get_finaid_appl_need(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||   '{' || finaid_appl_need.PERSON_UID ||   '{' || finaid_appl_need.AID_YEAR).FM_NEED_ELIGIBLE_IND :=finaid_appl_need.FM_NEED_ELIGIBLE_IND;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||   '{' || finaid_appl_need.PERSON_UID ||   '{' || finaid_appl_need.AID_YEAR).FM_FULLY_MET_NEED_IND :=finaid_appl_need.FM_FULLY_MET_NEED_IND;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||   '{' || finaid_appl_need.PERSON_UID ||   '{' || finaid_appl_need.AID_YEAR).IM_NEED_ELIGIBLE_IND :=finaid_appl_need.IM_NEED_ELIGIBLE_IND;
              finaid_appl_need_recs(finaid_appl_need.MULTI_SRC_IN ||   '{' || finaid_appl_need.PERSON_UID ||   '{' || finaid_appl_need.AID_YEAR).IM_FULLY_MET_NEED_IND :=finaid_appl_need.IM_FULLY_MET_NEED_IND;
          END LOOP;

         FOR offer_composition_amt in get_total_offer_amts_acad_pd(default_rec.multi_source_cleanse_value) LOOP
              total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_OFFERED_IND :=offer_composition_amt.AWARD_OFFERED_IND;
              total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_ACCEPTED_IND :=offer_composition_amt.AWARD_ACCEPTED_IND;
              total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_DECLINED_IND :=offer_composition_amt.AWARD_DECLINED_IND;
              total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_CANCELED_IND :=offer_composition_amt.AWARD_CANCELED_IND;
              total_offer_amts_acad_pd_recs(offer_composition_amt.MULTI_SRC_IN ||  '{' || offer_composition_amt.PERSON_UID ||   '{' || offer_composition_amt.ACADEMIC_PERIOD).AWARD_PAID_IND :=offer_composition_amt.AWARD_PAID_IND;
          END LOOP;

          FOR application_ind in get_application_inds(default_rec.multi_source_cleanse_value, financial_aid_year_in) LOOP
              application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).FM_APPLICATION_IND :=application_ind.FM_APPLICATION_IND;
              application_ind_recs(application_ind.MULTI_SRC_IN ||   '{' || application_ind.PERSON_UID ||   '{' || application_ind.AID_YEAR ).IM_APPLICATION_IND :=application_ind.IM_APPLICATION_IND;
          END LOOP;
--
       END IF;
--
       FOR i IN finaid_award_acad_pd_recs.FIRST..finaid_award_acad_pd_recs.LAST
       LOOP
         finaid_indx      := finaid_award_acad_pd_recs(i).multi_source || '{' || finaid_award_acad_pd_recs(i).person_uid ||  '{' || finaid_award_acad_pd_recs(i).aid_year;
         finaid_ap_indx :=  finaid_award_acad_pd_recs(i).multi_source || '{' || finaid_award_acad_pd_recs(i).person_uid || '{' || finaid_award_acad_pd_recs(i).academic_period;
--
         OPEN edw_general_extr.get_year_type(default_rec.multi_source_cleanse_value, finaid_award_acad_pd_recs(i).multi_source, finaid_award_acad_pd_recs(i).academic_period, 'ACYR');
         FETCH edw_general_extr.get_year_type INTO acad_time_rec;
         CLOSE edw_general_extr.get_year_type;
--
         ret_row.multi_source := finaid_award_acad_pd_recs(i).multi_source;
         ret_row.process_group := finaid_award_acad_pd_recs(i).process_group;
         ret_row.administrative_group := finaid_award_acad_pd_recs(i).administrative_group;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.msrc_user_attribute_01 := NULL;
         ret_row.msrc_user_attribute_01 := ret_row.multi_source;
         ret_row.msrc_user_attribute_02 := NULL;
         ret_row.msrc_user_attribute_03 := NULL;
         ret_row.msrc_user_attribute_04 := NULL;
         ret_row.msrc_user_attribute_05 := NULL;
         ret_row.person_uid := finaid_award_acad_pd_recs(i).warehouse_entity_uid;
         ret_row.id := finaid_award_acad_pd_recs(i).id;
         ret_row.full_name_lfmi := finaid_award_acad_pd_recs(i).full_name_lfmi;
         ret_row.birth_date := finaid_award_acad_pd_recs(i).birth_date;
         ret_row.deceased_date := finaid_award_acad_pd_recs(i).deceased_date;
         ret_row.email_address := finaid_award_acad_pd_recs(i).email_address;

         ret_row.phone_number_combined := finaid_award_acad_pd_recs(i).phone_number_combined;

         ret_row.confidentiality_ind := finaid_award_acad_pd_recs(i).confidentiality_ind;
         --BLM mepped 6/2/14 for security reasons         
         --ret_row.pers_user_attribute_01 := NULL;
         ret_row.pers_user_attribute_01 := ret_row.multi_source;
         ret_row.pers_user_attribute_02 := NULL;
         ret_row.pers_user_attribute_03 := NULL;
         ret_row.pers_user_attribute_04 := NULL;
         ret_row.pers_user_attribute_05 := NULL;
         ret_row.gender := finaid_award_acad_pd_recs(i).gender;
         ret_row.ethnicity_category := finaid_award_acad_pd_recs(i).ethnicity_category;
         ret_row.hispanic_latino_ethn_ind := finaid_award_acad_pd_recs(i).hispanic_latino_ethnicity_ind;
         ret_row.asian_ind := finaid_award_acad_pd_recs(i).asian_ind;
         ret_row.native_amer_or_alaskan_ind := finaid_award_acad_pd_recs(i).native_american_or_alaskan_ind;
         ret_row.black_or_african_ind := finaid_award_acad_pd_recs(i).black_or_african_ind;
         ret_row.pacific_islander_ind := finaid_award_acad_pd_recs(i).pacific_islander_ind;
         ret_row.white_ind := finaid_award_acad_pd_recs(i).white_ind;
         IF finaid_award_acad_pd_recs(i).number_of_races = 0 and NVL(finaid_award_acad_pd_recs(i).resident_alien_visa_count,0) > 0 THEN
            ret_row.non_resident_ind := 'Y';
         ELSE
            ret_row.non_resident_ind := 'N';
         END IF;
         ret_row.two_or_more_ind := finaid_award_acad_pd_recs(i).two_or_more_ind;
         ret_row.minority_ind := finaid_award_acad_pd_recs(i).minority_ind;

        IF NVL(finaid_award_acad_pd_recs(i).hispanic_latino_ethnicity_ind,'N') = 'N'
           AND finaid_award_acad_pd_recs(i).number_of_races = 0
           AND finaid_award_acad_pd_recs(i).resident_alien_visa_count = 0 THEN
           ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'Y';
        ELSE
            ret_row.RACE_ETHNICITY_UNKNOWN_IND := 'N';
        END IF;

         ret_row.race_ethnicity_confirm_ind := finaid_award_acad_pd_recs(i).race_ethnicity_confirm_ind;
         ret_row.ethnicity := finaid_award_acad_pd_recs(i).ethnicity;
         ret_row.deceased_ind := finaid_award_acad_pd_recs(i).deceased_ind;
         ret_row.citizenship_ind := finaid_award_acad_pd_recs(i).citizenship_ind;
         ret_row.citizenship_type := finaid_award_acad_pd_recs(i).citizenship_type;

        ret_row.visa_type :=  finaid_award_acad_pd_recs(i).visa_type;

         ret_row.nation_of_citizenship := finaid_award_acad_pd_recs(i).nation_of_citizenship;
         ret_row.nation_of_birth := finaid_award_acad_pd_recs(i).nation_of_birth;
         ret_row.primary_disability := finaid_award_acad_pd_recs(i).primary_disability;
         ret_row.legacy := finaid_award_acad_pd_recs(i).legacy;
         ret_row.marital_status := finaid_award_acad_pd_recs(i).marital_status;
         ret_row.religion := finaid_award_acad_pd_recs(i).religion;

         ret_row.veteran_type := finaid_award_acad_pd_recs(i).veteran_type;

         ret_row.veteran_category := finaid_award_acad_pd_recs(i).veteran_category;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.demo_user_attribute_01 := NULL;
         ret_row.demo_user_attribute_01 := ret_row.multi_source;
         ret_row.demo_user_attribute_02 := NULL;
         ret_row.demo_user_attribute_03 := NULL;
         ret_row.demo_user_attribute_04 := NULL;
         ret_row.demo_user_attribute_05 := NULL;
         ret_row.financial_aid_year := finaid_award_acad_pd_recs(i).aid_year;
--         ret_row.fayr_user_attribute_01 := NULL;
/*** CCCS - Need below line instead of above line to provide MEP ***/
				 ret_row.fayr_user_attribute_01 := ret_row.multi_source;
         ret_row.fayr_user_attribute_02 := NULL;
         ret_row.fayr_user_attribute_03 := NULL;
         ret_row.fayr_user_attribute_04 := NULL;
         ret_row.fayr_user_attribute_05 := NULL;
         ret_row.academic_period := finaid_award_acad_pd_recs(i).academic_period;
         ret_row.academic_period_begin_date := acad_time_rec.start_date;
         ret_row.academic_period_end_date := acad_time_rec.end_date;
         ret_row.academic_year := acad_time_rec.year_code;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.atim_user_attribute_01 := NULL;
         ret_row.atim_user_attribute_01 := ret_row.multi_source;
         ret_row.atim_user_attribute_02 := NULL;
         ret_row.atim_user_attribute_03 := NULL;
         ret_row.atim_user_attribute_04 := NULL;
         ret_row.atim_user_attribute_05 := NULL;
         ret_row.fund :=  finaid_award_acad_pd_recs(i).fund;
         ret_row.fund_type :=  finaid_award_acad_pd_recs(i).fund_type;
         ret_row.financial_aid_type :=  finaid_award_acad_pd_recs(i).financial_aid_type;
         ret_row.fund_source :=  finaid_award_acad_pd_recs(i).fund_source;
         ret_row.financial_aid_source_type :=  finaid_award_acad_pd_recs(i).financial_aid_source_type;
         ret_row.gift_or_self_help_aid :=  finaid_award_acad_pd_recs(i).gift_or_self_help_aid;
         ret_row.replace_efc_ind :=  finaid_award_acad_pd_recs(i).replace_efc_ind;
         ret_row.reduce_need_ind :=  finaid_award_acad_pd_recs(i).reduce_need_ind;
         ret_row.override_unmet_need_ind :=  finaid_award_acad_pd_recs(i).override_unmet_need_ind;
         ret_row.override_need_to_coa_ind :=  finaid_award_acad_pd_recs(i).override_need_to_coa_ind;
         ret_row.need_analysis_ind :=  finaid_award_acad_pd_recs(i).need_analysis_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.fafd_user_attribute_01 :=  NULL;
         ret_row.fafd_user_attribute_01 :=  ret_row.multi_source;
         ret_row.fafd_user_attribute_02 :=  NULL;
         ret_row.fafd_user_attribute_03 :=  NULL;
         ret_row.fafd_user_attribute_04 :=  NULL;
         ret_row.fafd_user_attribute_05 :=  NULL;
         ret_row.financial_aid_applicant_ind := 'Y';

         IF finaid_appl_amt_recs.EXISTS(finaid_indx) THEN
               ret_row.finaid_application_ind := NVL(finaid_appl_amt_recs(finaid_indx).application_ind,'N');
               ret_row.dependent_ind := finaid_appl_amt_recs(finaid_indx).dependency_ind;
         ELSE
               ret_row.finaid_application_ind := 'N';
         END IF;

         IF application_ind_recs.EXISTS(finaid_indx) THEN
               ret_row.fm_application_ind := NVL(application_ind_recs(finaid_indx).fm_application_ind,'N');
               ret_row.im_application_ind := NVL(application_ind_recs(finaid_indx).im_application_ind,'N');
         ELSE
               ret_row.fm_application_ind := 'N';
               ret_row.im_application_ind := 'N';
         END IF;

         IF total_offer_amts_acad_pd_recs.EXISTS(finaid_ap_indx) THEN
               ret_row.award_offered_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_offered_ind;
               ret_row.award_accepted_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_accepted_ind;
               ret_row.award_declined_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_declined_ind;
               ret_row.award_canceled_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_canceled_ind;
               ret_row.award_paid_ind := total_offer_amts_acad_pd_recs(finaid_ap_indx).award_paid_ind;
         END IF;

         IF finaid_appl_need_recs.EXISTS(finaid_indx) THEN
               ret_row.fm_need_eligible_ind := finaid_appl_need_recs(finaid_indx).fm_need_eligible_ind;
               ret_row.fm_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).fm_fully_met_need_ind;
               ret_row.im_need_eligible_ind := finaid_appl_need_recs(finaid_indx).im_need_eligible_ind;
               ret_row.im_fully_met_need_ind := finaid_appl_need_recs(finaid_indx).im_fully_met_need_ind;
         END IF;

         --BLM mepped 6/2/14 for security reasons
         --ret_row.fast_user_attribute_01 := NULL;
         ret_row.fast_user_attribute_01 := ret_row.multi_source;
         ret_row.fast_user_attribute_02 := NULL;
         ret_row.fast_user_attribute_03 := NULL;
         ret_row.fast_user_attribute_04 := NULL;
         ret_row.fast_user_attribute_05 := NULL;
         ret_row.fund_award_offered_ind :=  finaid_award_acad_pd_recs(i).fund_award_offered_ind;
         ret_row.fund_award_accepted_ind :=  finaid_award_acad_pd_recs(i).fund_award_accepted_ind;
         ret_row.fund_award_declined_ind :=  finaid_award_acad_pd_recs(i).fund_award_declined_ind;
         ret_row.fund_award_canceled_ind :=  finaid_award_acad_pd_recs(i).fund_award_canceled_ind;
         ret_row.fund_award_paid_ind :=  finaid_award_acad_pd_recs(i).fund_award_paid_ind;
         --BLM mepped 6/2/14 for security reasons
         --ret_row.fund_user_attribute_01 :=  NULL;
         ret_row.fund_user_attribute_01 :=  ret_row.multi_source;
         ret_row.fund_user_attribute_02 :=  NULL;
         ret_row.fund_user_attribute_03 :=  NULL;
         ret_row.fund_user_attribute_04 :=  NULL;
         ret_row.fund_user_attribute_05 :=  NULL;
         ret_row.award_authorized_amount :=  finaid_award_acad_pd_recs(i).award_authorized_amount;
         ret_row.award_authorized_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_authorized_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_offered_amount :=  finaid_award_acad_pd_recs(i).award_offered_amount;
         ret_row.award_offered_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_offered_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_original_offered_amount :=  finaid_award_acad_pd_recs(i).award_original_offered_amount;
         ret_row.award_original_offered_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_original_offered_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_accepted_amount :=  finaid_award_acad_pd_recs(i).award_accepted_amount;
         ret_row.award_accepted_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_accepted_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_declined_amount :=  finaid_award_acad_pd_recs(i).award_declined_amount;
         ret_row.award_declined_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_declined_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_canceled_amount :=  finaid_award_acad_pd_recs(i).award_canceled_amount;
         ret_row.award_canceled_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_canceled_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_memo_amount :=  finaid_award_acad_pd_recs(i).award_memo_amount;
         ret_row.award_memo_expiration_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_memo_expiration_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.award_paid_amount :=  finaid_award_acad_pd_recs(i).award_paid_amount;
         ret_row.award_paid_date :=  TRUNC(NVL(finaid_award_acad_pd_recs(i).award_paid_date,TO_DATE('31-DEC-2099', 'DD-MON-YYYY')));
         ret_row.user_measure_01 := NULL;
         ret_row.user_measure_02 := NULL;
         ret_row.user_measure_03 := NULL;
         ret_row.user_measure_04 := NULL;
         ret_row.user_measure_05 := NULL;
         ret_row.system_load_process := 'FINAID_AWARD_ACADPD';
--
         PIPE ROW(ret_row);
--
         ret_row := ret_row_init;
         acad_time_rec := acad_time_rec_init;
--
      END LOOP; -- finaid_award_acad_pd_recs
--
    END LOOP;
--
    CLOSE  finaid_award_acad_pd_cur;
--
    RETURN;
--
  END f_get_finaid_awd_acad_pd;
/******************************************************************************/

END edw_finaid_extr;
/