--
-- PostgreSQL database dump
--

\restrict kSnAjnpbjrpG0bRHDy0NSzCiFxrnRDKlKsurUDwCaIPV5TdOJ7bMAmjlw4l2pao

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dm_aa_account_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_account_details (
    id numeric(18,0) NOT NULL,
    arr_age_status text,
    arr_dormancy_status text,
    arrangement_id text,
    manual_ageing text,
    created_date date,
    business_date date,
    maturity_date date
);


ALTER TABLE public.dm_aa_account_details OWNER TO postgres;

--
-- Name: TABLE dm_aa_account_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_aa_account_details IS 'Stores aging and status details for banking arrangements/accounts.';


--
-- Name: COLUMN dm_aa_account_details.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.id IS 'Unique identifier of the record (often used as PK).';


--
-- Name: COLUMN dm_aa_account_details.arr_age_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.arr_age_status IS 'Status of aging for the arrangement (e.g., current, overdue).';


--
-- Name: COLUMN dm_aa_account_details.arr_dormancy_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.arr_dormancy_status IS 'Indicates whether the arrangement is active or dormant/inactive.';


--
-- Name: COLUMN dm_aa_account_details.arrangement_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.arrangement_id IS 'Links the aging record to the core Arrangement (customer contract).';


--
-- Name: COLUMN dm_aa_account_details.manual_ageing; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.manual_ageing IS 'Indicates whether aging was applied manually or system-computed.';


--
-- Name: COLUMN dm_aa_account_details.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.created_date IS 'Date when this aging record was created in the system.';


--
-- Name: COLUMN dm_aa_account_details.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.business_date IS 'Bank business date on which the aging status applies.';


--
-- Name: COLUMN dm_aa_account_details.maturity_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details.maturity_date IS 'The maturity date of the arrangement (e.g., loan/cycle end date).';


--
-- Name: dm_aa_account_details_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_account_details_details (
    id numeric NOT NULL,
    arrangement_id character varying(50),
    age_all_date timestamp without time zone,
    age_all_status character varying(50),
    hol_start_date timestamp without time zone,
    m numeric,
    num_payments numeric,
    payment_date timestamp without time zone,
    repay_reference character varying(50),
    s numeric,
    bill_id character varying(20),
    schedule_type character varying(50),
    bill_type character varying(20),
    bill_status character varying(100),
    set_status character varying(50),
    business_date timestamp without time zone,
    created_date timestamp without time zone,
    aging_status character varying(50)
);


ALTER TABLE public.dm_aa_account_details_details OWNER TO postgres;

--
-- Name: COLUMN dm_aa_account_details_details.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.id IS 'Unique identifier for the account details record';


--
-- Name: COLUMN dm_aa_account_details_details.arrangement_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.arrangement_id IS 'Links to the main arrangement/account';


--
-- Name: COLUMN dm_aa_account_details_details.age_all_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.age_all_date IS 'Date of the last aging calculation';


--
-- Name: COLUMN dm_aa_account_details_details.age_all_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.age_all_status IS 'Status of overall aging (e.g., current, overdue)';


--
-- Name: COLUMN dm_aa_account_details_details.hol_start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.hol_start_date IS 'Start date of any holiday/deferral period';


--
-- Name: COLUMN dm_aa_account_details_details.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.m IS 'Generic numeric field (possibly aging factor)';


--
-- Name: COLUMN dm_aa_account_details_details.num_payments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.num_payments IS 'Number of payments made';


--
-- Name: COLUMN dm_aa_account_details_details.payment_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.payment_date IS 'Date of a specific payment';


--
-- Name: COLUMN dm_aa_account_details_details.repay_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.repay_reference IS 'Reference for repayment transaction';


--
-- Name: COLUMN dm_aa_account_details_details.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.s IS 'Generic numeric field (possibly schedule sequence)';


--
-- Name: COLUMN dm_aa_account_details_details.bill_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.bill_id IS 'Identifier for the bill';


--
-- Name: COLUMN dm_aa_account_details_details.schedule_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.schedule_type IS 'Type of repayment schedule';


--
-- Name: COLUMN dm_aa_account_details_details.bill_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.bill_type IS 'Type of bill';


--
-- Name: COLUMN dm_aa_account_details_details.bill_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.bill_status IS 'Status of the bill';


--
-- Name: COLUMN dm_aa_account_details_details.set_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.set_status IS 'Status of the set/collection';


--
-- Name: COLUMN dm_aa_account_details_details.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.business_date IS 'Business date for the record';


--
-- Name: COLUMN dm_aa_account_details_details.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.created_date IS 'Date when the record was created';


--
-- Name: COLUMN dm_aa_account_details_details.aging_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_account_details_details.aging_status IS 'Current aging status of the account';


--
-- Name: dm_aa_arr_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_arr_account (
    id numeric,
    business_date timestamp without time zone NOT NULL,
    arrangement_id character varying(20),
    property character varying(20),
    date_seq_no character varying(50),
    csd_class character varying(50),
    csd_loan_purpos character varying(100),
    csd_sub_class character varying(50),
    csd_sub_sector character varying(50),
    co_code character varying(20),
    authoriser character varying(100),
    csd_mob_bank character varying(200),
    created_date timestamp without time zone,
    csd_sector character varying(50),
    category character varying(50)
);


ALTER TABLE public.dm_aa_arr_account OWNER TO postgres;

--
-- Name: COLUMN dm_aa_arr_account.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.id IS 'Unique numeric identifier for the record in the ARR_ACCOUNT table, typically used as the primary key to uniquely identify each arrangement entry.';


--
-- Name: COLUMN dm_aa_arr_account.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.business_date IS 'The banking business date for this record, representing the effective date on which the arrangement status or transaction applies.';


--
-- Name: COLUMN dm_aa_arr_account.arrangement_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.arrangement_id IS 'Identifier linking this record to a specific customer arrangement or contract, serving as a foreign key to the main arrangement master.';


--
-- Name: COLUMN dm_aa_arr_account.property; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.property IS 'Code or attribute describing the property or type of the arrangement, helping classify the account in reporting.';


--
-- Name: COLUMN dm_aa_arr_account.date_seq_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.date_seq_no IS 'Sequence number associated with dates for reporting or internal processing, used for ordering multiple entries per arrangement.';


--
-- Name: COLUMN dm_aa_arr_account.csd_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.csd_class IS 'Customer or credit class code, indicating the main classification of the arrangement for reporting, risk assessment, or portfolio management.';


--
-- Name: COLUMN dm_aa_arr_account.csd_loan_purpos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.csd_loan_purpos IS 'Description of the purpose of the loan as recorded by the Customer/Credit Department, indicating why the loan was granted.';


--
-- Name: COLUMN dm_aa_arr_account.csd_sub_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.csd_sub_class IS 'Sub-classification of the arrangement within the main CSD_CLASS, providing finer granularity for reporting and analysis.';


--
-- Name: COLUMN dm_aa_arr_account.csd_sub_sector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.csd_sub_sector IS 'Sub-sector code of the customer or arrangement, used for sector-specific reporting, analytics, or regulatory requirements.';


--
-- Name: COLUMN dm_aa_arr_account.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.co_code IS 'Company or branch code responsible for the arrangement, used for organizational reporting and accountability.';


--
-- Name: COLUMN dm_aa_arr_account.authoriser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.authoriser IS 'Name or identifier of the person who authorized the arrangement or any updates to it, used for audit and control purposes.';


--
-- Name: COLUMN dm_aa_arr_account.csd_mob_bank; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.csd_mob_bank IS 'Information related to mobile banking or digital channel associated with the customer or arrangement, such as mobile account ID or channel details.';


--
-- Name: COLUMN dm_aa_arr_account.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.created_date IS 'Timestamp indicating when this record was created in the system, useful for tracking record origination.';


--
-- Name: COLUMN dm_aa_arr_account.csd_sector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.csd_sector IS 'Sector code of the customer or arrangement, typically used for classification, reporting, and regulatory compliance.';


--
-- Name: COLUMN dm_aa_arr_account.category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account.category IS 'High-level categorization of the arrangement, used for grouping, reporting, portfolio segmentation, or risk analysis.';


--
-- Name: dm_aa_arr_account_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_arr_account_details (
    arrangement_id character varying(20),
    property character varying(20),
    date_seq_no character varying(50),
    start_date timestamp without time zone,
    expiry_date timestamp without time zone,
    posting_restrict character varying(30),
    business_date timestamp without time zone,
    created_date timestamp without time zone,
    m numeric,
    s numeric
);


ALTER TABLE public.dm_aa_arr_account_details OWNER TO postgres;

--
-- Name: TABLE dm_aa_arr_account_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_aa_arr_account_details IS 'Stores detailed account and lifecycle information related to customer arrangements or contracts';


--
-- Name: COLUMN dm_aa_arr_account_details.arrangement_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.arrangement_id IS 'Identifier linking this record to a specific customer arrangement or contract (foreign key added later)';


--
-- Name: COLUMN dm_aa_arr_account_details.property; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.property IS 'Code or attribute describing the type or property of the arrangement, used for classification and reporting';


--
-- Name: COLUMN dm_aa_arr_account_details.date_seq_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.date_seq_no IS 'Sequence number associated with dates for internal processing or reporting, used to order multiple entries per arrangement';


--
-- Name: COLUMN dm_aa_arr_account_details.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.start_date IS 'Start date of the arrangement or agreement, indicating when the arrangement became active';


--
-- Name: COLUMN dm_aa_arr_account_details.expiry_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.expiry_date IS 'Expiry or end date of the arrangement, defining the period for which the arrangement is valid';


--
-- Name: COLUMN dm_aa_arr_account_details.posting_restrict; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.posting_restrict IS 'Code indicating any posting restrictions on the account or arrangement, used to control transactions or updates';


--
-- Name: COLUMN dm_aa_arr_account_details.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.business_date IS 'Banking business date for this record, representing the effective date on which the arrangement status applies';


--
-- Name: COLUMN dm_aa_arr_account_details.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.created_date IS 'Timestamp indicating when this record was created in the system, useful for tracking record origination and audit purposes';


--
-- Name: COLUMN dm_aa_arr_account_details.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.m IS 'Generic numeric field, possibly representing an internal calculation, aging factor, or metric associated with the arrangement';


--
-- Name: COLUMN dm_aa_arr_account_details.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arr_account_details.s IS 'Generic numeric field, often used to track sequence, schedule, or system-specific metrics related to the arrangement';


--
-- Name: dm_aa_arrangement_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_arrangement_activity (
    activity character varying(100),
    arr_sequence character varying(50) NOT NULL,
    arrangement character varying(50),
    authoriser character varying(100),
    effective_date timestamp without time zone,
    orig_txn_amt numeric,
    co_code character varying(50),
    business_date timestamp without time zone,
    product character varying(100)
);


ALTER TABLE public.dm_aa_arrangement_activity OWNER TO postgres;

--
-- Name: TABLE dm_aa_arrangement_activity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_aa_arrangement_activity IS 'Records activities performed on customer arrangements, including authorization, effective dates, and transaction context';


--
-- Name: COLUMN dm_aa_arrangement_activity.activity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.activity IS 'Name or type of the activity performed on the arrangement';


--
-- Name: COLUMN dm_aa_arrangement_activity.arr_sequence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.arr_sequence IS 'Sequence number associated with the arrangement’s activities (Primary Key)';


--
-- Name: COLUMN dm_aa_arrangement_activity.arrangement; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.arrangement IS 'Identifier linking this activity record to the main customer arrangement or contract (foreign key added later)';


--
-- Name: COLUMN dm_aa_arrangement_activity.authoriser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.authoriser IS 'Name or identifier of the person who authorized the activity for audit and control purposes';


--
-- Name: COLUMN dm_aa_arrangement_activity.effective_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.effective_date IS 'Date on which the activity takes effect, representing when changes or actions are applied';


--
-- Name: COLUMN dm_aa_arrangement_activity.orig_txn_amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.orig_txn_amt IS 'Original transaction amount associated with the activity, used for reporting and reconciliation';


--
-- Name: COLUMN dm_aa_arrangement_activity.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.co_code IS 'Company or branch code responsible for the activity, used for organizational reporting and accountability';


--
-- Name: COLUMN dm_aa_arrangement_activity.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.business_date IS 'Banking business date for the activity, indicating the date considered in system processing';


--
-- Name: COLUMN dm_aa_arrangement_activity.product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity.product IS 'Product or service associated with the arrangement, providing context for reporting and analytics';


--
-- Name: dm_aa_arrangement_activity_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_arrangement_activity_details (
    id numeric NOT NULL,
    arr_sequence character varying(50),
    field_name character varying(50),
    inputter character varying(100),
    date_time timestamp without time zone,
    reason character varying(255),
    narrative character varying(255),
    m numeric,
    s numeric,
    business_date timestamp without time zone,
    created_date timestamp without time zone
);


ALTER TABLE public.dm_aa_arrangement_activity_details OWNER TO postgres;

--
-- Name: TABLE dm_aa_arrangement_activity_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_aa_arrangement_activity_details IS 'Stores detailed field-level information for activities performed on customer arrangements';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.id IS 'Unique numeric identifier for the activity detail record (Primary Key)';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.arr_sequence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.arr_sequence IS 'Sequence number linking this detail to the corresponding arrangement activity (foreign key added later)';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.field_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.field_name IS 'Name of the field or attribute being updated or recorded in this activity detail entry';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.inputter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.inputter IS 'Name or identifier of the person who entered or performed this activity detail';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.date_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.date_time IS 'Timestamp indicating when this activity detail was entered or occurred';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.reason; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.reason IS 'Reason provided for the activity or change, explaining why this activity detail was recorded';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.narrative; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.narrative IS 'Detailed narrative or description associated with the activity, providing additional context';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.m IS 'Generic numeric field used for internal metrics, calculations, or system-specific values';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.s IS 'Generic numeric field possibly representing sequence, status, or other system-specific metric';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.business_date IS 'Banking business date for this record, indicating the effective date for processing and reporting';


--
-- Name: COLUMN dm_aa_arrangement_activity_details.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_arrangement_activity_details.created_date IS 'Timestamp indicating when this record was created in the system for auditing purposes';


--
-- Name: dm_aa_arrangements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_arrangements (
    arrangement_id character varying(50) NOT NULL,
    customer_id character varying(50) NOT NULL,
    product_code character varying(20),
    start_date date,
    end_date date,
    status character varying(20),
    created_date timestamp without time zone,
    business_date date
);


ALTER TABLE public.dm_aa_arrangements OWNER TO postgres;

--
-- Name: dm_aa_contract_d; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_contract_d (
    business_date timestamp without time zone,
    arrangement_id character varying(50),
    customer_code character varying(50),
    linked_appl_id numeric NOT NULL,
    account_officer_code character varying(50),
    branch_code character varying(20),
    product character varying(50),
    product_line character varying(50),
    currency_code character varying(10),
    limit_ref character varying(200),
    fixed_rate numeric,
    maturity_date timestamp without time zone,
    payment_end_date timestamp without time zone,
    payment_start_date timestamp without time zone,
    dept_officer_name character varying(255),
    insurance_name character varying(255),
    manual_class character varying(20),
    sector_name character varying(255),
    restructure_amt numeric,
    start_date timestamp without time zone,
    profile_id character varying(50),
    arr_status character varying(50),
    hash_column character varying(256),
    arrangement_seq_no character varying(128),
    co_code character varying(50),
    customer character varying(50),
    product_group character varying(200),
    orig_contract_date timestamp without time zone
);


ALTER TABLE public.dm_aa_contract_d OWNER TO postgres;

--
-- Name: TABLE dm_aa_contract_d; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_aa_contract_d IS 'Stores detailed contract-level information for customer arrangements, including product, dates, status, and financial attributes';


--
-- Name: COLUMN dm_aa_contract_d.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.business_date IS 'Banking business date representing the effective date of this contract record';


--
-- Name: COLUMN dm_aa_contract_d.arrangement_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.arrangement_id IS 'Identifier linking this contract to a specific customer arrangement (foreign key added later)';


--
-- Name: COLUMN dm_aa_contract_d.customer_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.customer_code IS 'Unique code identifying the customer associated with this contract';


--
-- Name: COLUMN dm_aa_contract_d.linked_appl_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.linked_appl_id IS 'Reference to any linked application ID related to this contract (Primary Key)';


--
-- Name: COLUMN dm_aa_contract_d.account_officer_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.account_officer_code IS 'Code of the account officer responsible for managing this contract';


--
-- Name: COLUMN dm_aa_contract_d.branch_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.branch_code IS 'Code of the branch where this contract is maintained or originated';


--
-- Name: COLUMN dm_aa_contract_d.product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.product IS 'Name or code of the product associated with this contract';


--
-- Name: COLUMN dm_aa_contract_d.product_line; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.product_line IS 'Product line classification for grouping similar products';


--
-- Name: COLUMN dm_aa_contract_d.currency_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.currency_code IS 'Currency in which the contract is denominated';


--
-- Name: COLUMN dm_aa_contract_d.limit_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.limit_ref IS 'Reference identifier for the credit or loan limit associated with this contract';


--
-- Name: COLUMN dm_aa_contract_d.fixed_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.fixed_rate IS 'Fixed interest rate applicable to the contract, if any';


--
-- Name: COLUMN dm_aa_contract_d.maturity_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.maturity_date IS 'Date on which the contract matures or ends';


--
-- Name: COLUMN dm_aa_contract_d.payment_end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.payment_end_date IS 'Date when the payment schedule for this contract ends';


--
-- Name: COLUMN dm_aa_contract_d.payment_start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.payment_start_date IS 'Date when the payment schedule for this contract begins';


--
-- Name: COLUMN dm_aa_contract_d.dept_officer_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.dept_officer_name IS 'Name of the department officer handling this contract';


--
-- Name: COLUMN dm_aa_contract_d.insurance_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.insurance_name IS 'Name of any insurance associated with this contract';


--
-- Name: COLUMN dm_aa_contract_d.manual_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.manual_class IS 'Manual classification applied to the contract for reporting or risk assessment';


--
-- Name: COLUMN dm_aa_contract_d.sector_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.sector_name IS 'Sector to which the customer or contract belongs';


--
-- Name: COLUMN dm_aa_contract_d.restructure_amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.restructure_amt IS 'Amount involved if the contract has been restructured';


--
-- Name: COLUMN dm_aa_contract_d.start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.start_date IS 'Start date of the contract or arrangement';


--
-- Name: COLUMN dm_aa_contract_d.profile_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.profile_id IS 'Identifier for the customer profile linked to this contract';


--
-- Name: COLUMN dm_aa_contract_d.arr_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.arr_status IS 'Status of the arrangement or contract (e.g., active, closed, overdue)';


--
-- Name: COLUMN dm_aa_contract_d.hash_column; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.hash_column IS 'Hash value used for data integrity or deduplication checks';


--
-- Name: COLUMN dm_aa_contract_d.arrangement_seq_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.arrangement_seq_no IS 'Sequence number for the arrangement within this contract';


--
-- Name: COLUMN dm_aa_contract_d.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.co_code IS 'Company or organizational code responsible for this contract';


--
-- Name: COLUMN dm_aa_contract_d.customer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.customer IS 'Customer identifier or name associated with the contract';


--
-- Name: COLUMN dm_aa_contract_d.product_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.product_group IS 'Group or category of products to which this contract belongs';


--
-- Name: COLUMN dm_aa_contract_d.orig_contract_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_contract_d.orig_contract_date IS 'Original date when the contract was first created or approved';


--
-- Name: dm_aa_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_aa_product (
    available_date timestamp without time zone,
    cat_expiry_date timestamp without time zone,
    description character varying(255),
    product_status character varying(50),
    product character varying(100) NOT NULL,
    m numeric,
    s numeric
);


ALTER TABLE public.dm_aa_product OWNER TO postgres;

--
-- Name: TABLE dm_aa_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_aa_product IS 'Stores master product information including availability, status, and descriptive attributes';


--
-- Name: COLUMN dm_aa_product.available_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.available_date IS 'Date when the product becomes available or active for customers';


--
-- Name: COLUMN dm_aa_product.cat_expiry_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.cat_expiry_date IS 'Expiry date of the product category or the product itself';


--
-- Name: COLUMN dm_aa_product.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.description IS 'Detailed textual description of the product for reporting and analytics';


--
-- Name: COLUMN dm_aa_product.product_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.product_status IS 'Current status of the product (e.g., active, inactive, discontinued)';


--
-- Name: COLUMN dm_aa_product.product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.product IS 'Unique identifier or name of the product (Primary Key)';


--
-- Name: COLUMN dm_aa_product.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.m IS 'Generic numeric field used for internal metrics, calculations, or system-specific values';


--
-- Name: COLUMN dm_aa_product.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_aa_product.s IS 'Generic numeric field used for sequencing, ordering, or internal product-related calculations';


--
-- Name: dm_ac_charge_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_ac_charge_request (
    request_id character varying(500) NOT NULL,
    request_type character varying(500),
    debit_account character varying(500),
    customer_no character varying(500),
    charge_date character varying(500),
    charge_ccy character varying(500),
    total_chg_amt character varying(500),
    related_ref character varying(500),
    msg_series character varying(500),
    swift_to_raise character varying(500),
    charge_detail character varying(500),
    ord_inst_type character varying(500),
    acct_with_type character varying(500),
    sender_detail character varying(500),
    status character varying(500),
    remove_date character varying(500),
    csd_channelid character varying(500),
    csd_req_type character varying(500),
    csd_date character varying(500),
    csd_nof_entry character varying(500),
    csd_requestid character varying(500),
    csd_start_date character varying(500),
    csd_book_date character varying(500),
    csd_trans_type character varying(500),
    txn_reference character varying(500),
    receiver_bic character varying(500),
    record_status character varying(500),
    curr_no character varying(500),
    authoriser character varying(500),
    co_code character varying(500),
    dept_code character varying(500),
    auditor_code character varying(500),
    audit_date_time character varying(500),
    m numeric,
    s numeric,
    charge_code character varying(500),
    charge_amount character varying(500),
    tax_code character varying(500),
    tax_amt character varying(500),
    extra_details character varying(500),
    ordering_inst character varying(500),
    acct_with_bank character varying(500),
    sender_info character varying(500),
    remarks character varying(500),
    send_notice character varying(500),
    csd_keyfactor character varying(500),
    hist_status character varying(500),
    status_date character varying(500),
    activity_code character varying(500),
    activity_date character varying(500),
    mapping_key character varying(500),
    delivery_ref character varying(500),
    stmt_nos character varying(500),
    override character varying(500),
    inputter character varying(500),
    date_time character varying(500),
    business_date timestamp without time zone
);


ALTER TABLE public.dm_ac_charge_request OWNER TO postgres;

--
-- Name: TABLE dm_ac_charge_request; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_ac_charge_request IS 'Stores all charge requests for accounts, including processing, audit, and transactional details';


--
-- Name: COLUMN dm_ac_charge_request.request_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.request_id IS 'Unique identifier for each charge request (Primary Key)';


--
-- Name: COLUMN dm_ac_charge_request.request_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.request_type IS 'Type of charge request (e.g., service charge, fee, penalty)';


--
-- Name: COLUMN dm_ac_charge_request.debit_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.debit_account IS 'Account from which the charge will be debited';


--
-- Name: COLUMN dm_ac_charge_request.customer_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.customer_no IS 'Customer number associated with the charge request';


--
-- Name: COLUMN dm_ac_charge_request.charge_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.charge_date IS 'Date on which the charge is applied or scheduled';


--
-- Name: COLUMN dm_ac_charge_request.total_chg_amt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.total_chg_amt IS 'Total charge amount for the request';


--
-- Name: COLUMN dm_ac_charge_request.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_ac_charge_request.business_date IS 'Banking business date for this charge request, representing the effective date for processing';


--
-- Name: dm_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_account (
    account_seq_no character varying(20) NOT NULL,
    contract_code numeric,
    contract_dao character varying(10),
    co_code character varying(10),
    currency character varying(3),
    customer character varying(20),
    customer_dao character varying(10),
    prod_code character varying(10),
    account_title_1 character varying(100),
    limit_ref character varying(20),
    opening_date timestamp without time zone,
    cheque_book character varying(1),
    date_time timestamp without time zone,
    alternate_acct character varying(20),
    date_last_crcust timestamp without time zone,
    date_last_drcust timestamp without time zone,
    in_ordering_bk character varying(1),
    effective_start_date timestamp without time zone,
    effective_end_date timestamp without time zone,
    status numeric,
    posting_restrict numeric,
    category numeric,
    curr_no numeric,
    date_last_update timestamp without time zone,
    acc_deb_limit timestamp without time zone
);


ALTER TABLE public.dm_account OWNER TO postgres;

--
-- Name: TABLE dm_account; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_account IS 'Stores account-level master data, linking accounts to contracts, customers, and product codes, including operational and financial attributes';


--
-- Name: COLUMN dm_account.account_seq_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.account_seq_no IS 'Unique sequence number identifying the account (Primary Key)';


--
-- Name: COLUMN dm_account.contract_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.contract_code IS 'Code linking the account to a specific contract or arrangement (foreign key added later)';


--
-- Name: COLUMN dm_account.contract_dao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.contract_dao IS 'DAO code related to the contract for internal processing';


--
-- Name: COLUMN dm_account.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.co_code IS 'Company or branch code responsible for maintaining the account';


--
-- Name: COLUMN dm_account.currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.currency IS 'Currency code of the account (e.g., USD, EUR)';


--
-- Name: COLUMN dm_account.customer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.customer IS 'Customer identifier associated with the account (foreign key added later)';


--
-- Name: COLUMN dm_account.customer_dao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.customer_dao IS 'DAO code related to the customer for internal processing';


--
-- Name: COLUMN dm_account.prod_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.prod_code IS 'Product code associated with the account';


--
-- Name: COLUMN dm_account.account_title_1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.account_title_1 IS 'Primary title or name associated with the account';


--
-- Name: COLUMN dm_account.limit_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.limit_ref IS 'Reference code for credit or account limit associated with this account';


--
-- Name: COLUMN dm_account.opening_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.opening_date IS 'Date when the account was opened';


--
-- Name: COLUMN dm_account.cheque_book; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.cheque_book IS 'Indicator if a cheque book is issued (Y/N)';


--
-- Name: COLUMN dm_account.date_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.date_time IS 'Timestamp of account record creation or last update';


--
-- Name: COLUMN dm_account.alternate_acct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.alternate_acct IS 'Alternate account number or reference, if applicable';


--
-- Name: COLUMN dm_account.date_last_crcust; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.date_last_crcust IS 'Date of the last credit transaction by the customer';


--
-- Name: COLUMN dm_account.date_last_drcust; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.date_last_drcust IS 'Date of the last debit transaction by the customer';


--
-- Name: COLUMN dm_account.in_ordering_bk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.in_ordering_bk IS 'Indicator if the account is included in the ordering bank (Y/N)';


--
-- Name: COLUMN dm_account.effective_start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.effective_start_date IS 'Start date from which the account record is effective';


--
-- Name: COLUMN dm_account.effective_end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.effective_end_date IS 'End date until which the account record is effective';


--
-- Name: COLUMN dm_account.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.status IS 'Numeric code representing the current status of the account';


--
-- Name: COLUMN dm_account.posting_restrict; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.posting_restrict IS 'Numeric code representing any posting restrictions applied to the account';


--
-- Name: COLUMN dm_account.category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.category IS 'Numeric code classifying the account into a specific category';


--
-- Name: COLUMN dm_account.curr_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.curr_no IS 'Numeric representation of the currency code';


--
-- Name: COLUMN dm_account.date_last_update; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.date_last_update IS 'Timestamp of the last update made to the account record';


--
-- Name: COLUMN dm_account.acc_deb_limit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account.acc_deb_limit IS 'Represents the debit limit on the account';


--
-- Name: dm_account_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_account_f (
    account_seq_no character varying(20) NOT NULL,
    contract_code numeric,
    working_balance numeric(30,9),
    open_actual_bal numeric(30,9),
    open_cleared_bal numeric(30,9),
    online_actual_bal numeric(30,9),
    online_cleared_bal numeric(30,9),
    working_balance_lcy numeric(30,9),
    open_cleared_bal_lcy numeric(30,9),
    online_cleared_bal_lcy numeric(30,9),
    online_actual_bal_lcy numeric(30,9),
    inactive_marker character varying(1),
    locked_amount numeric(30,9),
    effective_start_date timestamp without time zone,
    effective_end_date timestamp without time zone,
    status character varying(10),
    co_code character varying(10),
    posting_restrict numeric,
    business_date timestamp without time zone,
    date_last_crcust timestamp without time zone,
    date_last_drcust timestamp without time zone,
    category_code numeric,
    date_last_update timestamp without time zone,
    acc_deb_limit timestamp without time zone
);


ALTER TABLE public.dm_account_f OWNER TO postgres;

--
-- Name: TABLE dm_account_f; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_account_f IS 'Stores financial account balances and reporting information, including online and cleared balances, currency conversions, and account status';


--
-- Name: COLUMN dm_account_f.account_seq_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.account_seq_no IS 'Unique sequence number identifying the account for financial balances (Primary Key)';


--
-- Name: COLUMN dm_account_f.contract_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.contract_code IS 'Code linking this financial record to the related contract or arrangement';


--
-- Name: COLUMN dm_account_f.working_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.working_balance IS 'Current working balance of the account, reflecting available funds including pending transactions';


--
-- Name: COLUMN dm_account_f.open_actual_bal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.open_actual_bal IS 'Actual opening balance at the start of the business day';


--
-- Name: COLUMN dm_account_f.open_cleared_bal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.open_cleared_bal IS 'Cleared opening balance, i.e., only settled transactions counted';


--
-- Name: COLUMN dm_account_f.online_actual_bal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.online_actual_bal IS 'Real-time actual balance including all posted and pending transactions online';


--
-- Name: COLUMN dm_account_f.online_cleared_bal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.online_cleared_bal IS 'Real-time cleared balance online, reflecting only settled transactions';


--
-- Name: COLUMN dm_account_f.locked_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.locked_amount IS 'Amount currently blocked or locked in the account, not available for transactions';


--
-- Name: COLUMN dm_account_f.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.business_date IS 'Banking business date for this financial record, used for reporting and reconciliations';


--
-- Name: COLUMN dm_account_f.acc_deb_limit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_account_f.acc_deb_limit IS 'Maximum debit limit on the account, used for risk and transaction control';


--
-- Name: dm_atm_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_atm_transaction (
    atm_txn_id character varying(50) NOT NULL,
    trans_ref character varying(30),
    company_code character varying(20),
    value_date timestamp without time zone,
    booking_date timestamp without time zone,
    debit_acct_no character varying(50),
    dr_customer_id character varying(20),
    credit_acct_no character varying(20),
    txn_amount numeric(18,2),
    dr_txn_code character varying(10),
    cr_txn_code character varying(10),
    charge_code character varying(20),
    chrg_amount numeric(18,2),
    chrg_account character varying(20),
    chrg_cust_id character varying(20),
    chrg_cr_acct character varying(20),
    narrative character varying(1000),
    trans_status character varying(20),
    reversal_flag character varying(5),
    network_type character varying(20),
    locked_amount numeric(18,2),
    retrieval_ref_no character varying(30),
    atm_or_pos character varying(10),
    proc_code character varying(10),
    merchant_id character varying(30),
    version_name character varying(100),
    card_acc_id character varying(30),
    card_acc_name_loc character varying(100),
    chrg_trans_ref character varying(50),
    error_msg character varying(1000),
    error_code character varying(50),
    txn_timestamp timestamp without time zone,
    txn_type character varying(20),
    account_officer character varying(20),
    record_status character varying(5),
    inputter character varying(50),
    input_date_time timestamp without time zone,
    authoriser character varying(50),
    co_code character varying(20),
    bal_aft_txn character varying(100),
    reversal_trans_ref character varying(50),
    reversal_chrg_trans_ref character varying(50),
    request_time timestamp without time zone,
    response_time timestamp without time zone,
    business_date timestamp without time zone,
    m numeric(1,0),
    s numeric(1,0),
    stmt_nos character varying(20)
);


ALTER TABLE public.dm_atm_transaction OWNER TO postgres;

--
-- Name: TABLE dm_atm_transaction; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_atm_transaction IS 'Stores detailed ATM and POS transactions, including debit/credit accounts, amounts, charges, network type, processing status, timestamps, and audit info';


--
-- Name: COLUMN dm_atm_transaction.atm_txn_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.atm_txn_id IS 'Unique identifier for each ATM transaction (Primary Key)';


--
-- Name: COLUMN dm_atm_transaction.debit_acct_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.debit_acct_no IS 'Account number debited in the transaction (foreign key to account table added later)';


--
-- Name: COLUMN dm_atm_transaction.dr_customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.dr_customer_id IS 'Customer identifier for the debit account holder (foreign key added later)';


--
-- Name: COLUMN dm_atm_transaction.credit_acct_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.credit_acct_no IS 'Account number credited in the transaction (foreign key added later)';


--
-- Name: COLUMN dm_atm_transaction.txn_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.txn_amount IS 'Amount of the ATM transaction';


--
-- Name: COLUMN dm_atm_transaction.trans_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.trans_status IS 'Current processing status of the transaction (e.g., posted, pending, reversed)';


--
-- Name: COLUMN dm_atm_transaction.reversal_flag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.reversal_flag IS 'Flag indicating if the transaction is a reversal';


--
-- Name: COLUMN dm_atm_transaction.network_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.network_type IS 'Type of network used for the transaction (e.g., VISA, Mastercard, local ATM network)';


--
-- Name: COLUMN dm_atm_transaction.locked_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.locked_amount IS 'Amount temporarily held or locked during transaction processing';


--
-- Name: COLUMN dm_atm_transaction.txn_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.txn_type IS 'Type of transaction (e.g., withdrawal, deposit, balance inquiry) (foreign key added later)';


--
-- Name: COLUMN dm_atm_transaction.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_atm_transaction.business_date IS 'Banking business date for the transaction, used for reporting and reconciliation';


--
-- Name: dm_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_company (
    branch_code character varying(20) NOT NULL,
    branch_name character varying(100),
    name_address character varying(200),
    branch_mnemonic character(3),
    date_opened timestamp without time zone,
    financial_co_code character varying(20),
    financial_mnemonic character(3),
    local_currency character(3),
    status character varying(20),
    co_code character varying(20),
    zone_code numeric,
    zone_name character varying(200),
    zone_description character varying(200),
    csd_city character varying(200)
);


ALTER TABLE public.dm_company OWNER TO postgres;

--
-- Name: TABLE dm_company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_company IS 'Stores branch and company details including branch codes, names, addresses, financial company associations, zone information, and operational status';


--
-- Name: COLUMN dm_company.branch_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.branch_code IS 'Unique code identifying the branch within the banking system (Primary Key)';


--
-- Name: COLUMN dm_company.branch_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.branch_name IS 'Name of the branch for reporting and identification purposes';


--
-- Name: COLUMN dm_company.name_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.name_address IS 'Full address of the branch including street, city, and other relevant details';


--
-- Name: COLUMN dm_company.branch_mnemonic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.branch_mnemonic IS 'Short mnemonic code representing the branch, often used in transaction references';


--
-- Name: COLUMN dm_company.date_opened; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.date_opened IS 'Date when the branch was officially opened or became operational';


--
-- Name: COLUMN dm_company.financial_co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.financial_co_code IS 'Code representing the financial company the branch belongs to';


--
-- Name: COLUMN dm_company.local_currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.local_currency IS 'ISO currency code representing the local currency of the branch (e.g., USD, INR)';


--
-- Name: COLUMN dm_company.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.status IS 'Current operational status of the branch (e.g., Active, Inactive, Closed)';


--
-- Name: COLUMN dm_company.zone_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.zone_code IS 'Numeric code representing the geographical or administrative zone of the branch';


--
-- Name: COLUMN dm_company.csd_city; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_company.csd_city IS 'City where the branch is located, used for reporting, analytics, and customer correspondence';


--
-- Name: dm_currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_currency (
    business_date timestamp without time zone,
    currency_code character varying(10) NOT NULL,
    currency_name character varying(100),
    currency_market character varying(50),
    currency_rank numeric(5,0),
    mid_reval_rate numeric(18,6),
    no_of_decimals numeric(2,0),
    buy_rate numeric(18,6),
    sell_rate numeric(18,6),
    quotation_code character varying(10),
    operator character varying(50),
    country_code character varying(10),
    numeric_ccy_code numeric(10,0),
    interest_day_basis character varying(10),
    m numeric,
    s numeric,
    curr_no numeric
);


ALTER TABLE public.dm_currency OWNER TO postgres;

--
-- Name: TABLE dm_currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_currency IS 'Stores currency information including codes, names, market, rates, numeric identifiers, and system metadata for banking operations';


--
-- Name: COLUMN dm_currency.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.business_date IS 'Banking business date for which the currency data is valid, used for reporting and calculations';


--
-- Name: COLUMN dm_currency.currency_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.currency_code IS 'ISO or system-specific code representing the currency (Primary Key, e.g., USD, EUR)';


--
-- Name: COLUMN dm_currency.currency_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.currency_name IS 'Full name of the currency for display and reporting purposes';


--
-- Name: COLUMN dm_currency.currency_market; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.currency_market IS 'Market or region where the currency is primarily traded or applicable';


--
-- Name: COLUMN dm_currency.currency_rank; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.currency_rank IS 'Numeric ranking or priority of the currency for reporting or conversion purposes';


--
-- Name: COLUMN dm_currency.mid_reval_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.mid_reval_rate IS 'Mid-market revaluation rate, used to convert balances and perform foreign exchange adjustments';


--
-- Name: COLUMN dm_currency.no_of_decimals; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.no_of_decimals IS 'Number of decimal places allowed for the currency in transactions';


--
-- Name: COLUMN dm_currency.buy_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.buy_rate IS 'Rate at which the currency is bought, used in FX calculations';


--
-- Name: COLUMN dm_currency.sell_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.sell_rate IS 'Rate at which the currency is sold, used in FX calculations';


--
-- Name: COLUMN dm_currency.operator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.operator IS 'Name or identifier of the operator who updated or manages this currency record';


--
-- Name: COLUMN dm_currency.country_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.country_code IS 'ISO code of the country associated with the currency';


--
-- Name: COLUMN dm_currency.curr_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_currency.curr_no IS 'Internal numeric identifier for the currency, used in the banking system';


--
-- Name: dm_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_customer (
    customer_code character varying(50) NOT NULL,
    sector character varying(100),
    industry character varying(100),
    calc_risk_class character varying(50),
    customer_status character varying(50),
    customer_since timestamp without time zone,
    title character varying(50),
    middle_name character varying(100),
    family_name character varying(100),
    gender character varying(10),
    authoriser character varying(100),
    birth_city character varying(100),
    nationality character varying(100),
    residence character varying(100),
    birth_incorp_date timestamp without time zone,
    building_name character varying(200),
    district_name character varying(100),
    tin_id character varying(50),
    account_officer character varying(100),
    manual_risk_class character varying(50),
    customer_type character varying(50),
    vat_id character varying(50),
    date_of_birth timestamp without time zone,
    target character varying(100),
    l_cus_type character varying(50),
    l_seg_lvl2 character varying(100),
    l_seg_lvl3 character varying(100),
    net_monthly_in character varying(200),
    l_political_exp character varying(50),
    csd_pep_posn character varying(100),
    manual_next_kyc_review_date timestamp without time zone,
    l_primaryid_typ character varying(50),
    l_primaryid_no character varying(50),
    business_type character varying(100),
    annual_turnover character varying(200),
    l_pee_entity character varying(50),
    phone_number character varying(20),
    sms character varying(20),
    email character varying(255),
    legal_document_name character varying(100),
    company_code character varying(50),
    inputter character varying(100),
    street character varying(255),
    town_country character varying(100),
    employment_status character varying(100),
    occupation character varying(100),
    legal_holder_name character varying(100),
    legal_id character varying(50),
    legal_iss_date timestamp without time zone,
    legal_iss_auth character varying(100),
    legal_iss_ctry character varying(100),
    override_reason character varying(255),
    short_name character varying(100),
    tax_id character varying(50),
    employers_name character varying(100),
    employers_add character varying(255),
    other_officer character varying(100),
    pref_channel character varying(50),
    tzbu_full_name character varying(100),
    tzbu_dob timestamp without time zone,
    tzbu_fcm_countr character varying(100),
    tzbu_phone character varying(20),
    tzbu_occupation character varying(100),
    tzbu_home_addr character varying(255),
    tzbu_regist_no character varying(50),
    off_phone character varying(20),
    l_fgn_subs_ctry character varying(100),
    tzbu_pr_sh_hold character varying(100),
    tzbu_sor_of_inc character varying(100),
    legal_exp_date timestamp without time zone,
    l_regprov_ob character varying(100),
    l_id_expdt timestamp without time zone,
    l_partyid_type character varying(50),
    l_sof_type character varying(50),
    effective_start_date timestamp without time zone,
    effective_end_date timestamp without time zone,
    status character varying(50),
    given_names character varying(100),
    first_name character varying(100),
    name_2 character varying(100),
    date_time timestamp without time zone,
    curr_no character varying(100),
    l_party_gender character varying(10),
    address character varying(255),
    death_date timestamp without time zone,
    exit_reason character varying(255),
    co_code character varying(50),
    l_primexp_date timestamp without time zone,
    address_country character varying(100),
    l_primid_name character varying(100),
    l_primiss_date timestamp without time zone,
    l_primiss_auth character varying(100),
    l_primiss_ctry character varying(100),
    l_cus_type_description character varying(255),
    l_seg_lvl2_description character varying(255),
    l_seg_lvl3_description character varying(255),
    name_1 character varying(100),
    address_type character varying(100),
    l_party_categ character varying(100),
    tzbu_email character varying(100),
    relation_code numeric,
    mnemonic character varying(128),
    country character varying(20)
);


ALTER TABLE public.dm_customer OWNER TO postgres;

--
-- Name: TABLE dm_customer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_customer IS 'Stores detailed customer information including personal, corporate, identification, contact, risk, KYC, and internal classification data for banking and compliance purposes';


--
-- Name: COLUMN dm_customer.customer_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.customer_code IS 'Unique identifier for the customer in the banking system (Primary Key)';


--
-- Name: COLUMN dm_customer.calc_risk_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.calc_risk_class IS 'System-calculated risk classification based on credit/transaction history';


--
-- Name: COLUMN dm_customer.customer_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.customer_status IS 'Current operational status of the customer (e.g., Active, Dormant, Closed)';


--
-- Name: COLUMN dm_customer.customer_since; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.customer_since IS 'Date when the customer was onboarded in the bank';


--
-- Name: COLUMN dm_customer.date_of_birth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.date_of_birth IS 'Birthdate of the customer for identity verification and age-related regulations';


--
-- Name: COLUMN dm_customer.l_primaryid_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.l_primaryid_no IS 'Number of the primary identification document for the customer';


--
-- Name: COLUMN dm_customer.effective_start_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.effective_start_date IS 'Start date for which the customer record is valid';


--
-- Name: COLUMN dm_customer.effective_end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.effective_end_date IS 'End date for which the customer record is valid';


--
-- Name: COLUMN dm_customer.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.status IS 'Operational or system status of the customer record';


--
-- Name: COLUMN dm_customer.curr_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_customer.curr_no IS 'System numeric identifier for the customer';


--
-- Name: dm_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_dates (
    business_date timestamp without time zone NOT NULL,
    current_week numeric,
    current_month numeric,
    current_year numeric,
    current_quarter character varying(20),
    month_end_date timestamp without time zone
);


ALTER TABLE public.dm_dates OWNER TO postgres;

--
-- Name: TABLE dm_dates; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_dates IS 'Stores calendar-related reference data for each business date, including week, month, quarter, year, and month-end date, used for reporting and date-based calculations';


--
-- Name: COLUMN dm_dates.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_dates.business_date IS 'The specific date for the record, used as the reference date in all date-based calculations (Primary Key)';


--
-- Name: COLUMN dm_dates.current_week; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_dates.current_week IS 'Week number of the year corresponding to the BUSINESS_DATE, typically 1–52';


--
-- Name: COLUMN dm_dates.current_month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_dates.current_month IS 'Month number of the year (1–12) for the BUSINESS_DATE';


--
-- Name: COLUMN dm_dates.current_year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_dates.current_year IS 'Year corresponding to the BUSINESS_DATE';


--
-- Name: COLUMN dm_dates.current_quarter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_dates.current_quarter IS 'Quarter of the year (e.g., Q1, Q2, Q3, Q4) in which the BUSINESS_DATE falls';


--
-- Name: COLUMN dm_dates.month_end_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_dates.month_end_date IS 'Last date of the month for the BUSINESS_DATE, useful for month-end reporting and calculations';


--
-- Name: dm_eb_queries_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_eb_queries_answers (
    eb_queries_ans_id character varying(100) NOT NULL,
    rel_reference character varying(100),
    customer_no character varying(50),
    status character varying(20),
    creation_date timestamp without time zone,
    co_code character varying(20),
    business_date timestamp without time zone
);


ALTER TABLE public.dm_eb_queries_answers OWNER TO postgres;

--
-- Name: TABLE dm_eb_queries_answers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_eb_queries_answers IS 'Stores queries and answers from the electronic banking system, linked to customers and transactions, with tracking for status, creation date, and business date.';


--
-- Name: COLUMN dm_eb_queries_answers.eb_queries_ans_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.eb_queries_ans_id IS 'Unique identifier for each query or answer record in the electronic banking system (Primary Key)';


--
-- Name: COLUMN dm_eb_queries_answers.rel_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.rel_reference IS 'Reference linking the query/answer to a related transaction, account, or case';


--
-- Name: COLUMN dm_eb_queries_answers.customer_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.customer_no IS 'Identifier of the customer who raised the query or to whom the answer pertains (Foreign Key)';


--
-- Name: COLUMN dm_eb_queries_answers.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.status IS 'Current status of the query/answer (e.g., open, closed, pending)';


--
-- Name: COLUMN dm_eb_queries_answers.creation_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.creation_date IS 'Date and time when the query/answer was created';


--
-- Name: COLUMN dm_eb_queries_answers.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.co_code IS 'Company or branch code associated with the query/answer, for organizational tracking';


--
-- Name: COLUMN dm_eb_queries_answers.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_eb_queries_answers.business_date IS 'Business date for the record, typically used for reporting and reconciliation';


--
-- Name: dm_gl_bal_crb_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_gl_bal_crb_f (
    business_date timestamp without time zone,
    co_code character varying(52),
    contract_code character varying(500) NOT NULL,
    line_no character varying(16),
    asst_type character varying(2000),
    cal_key character varying(500),
    apl_code character varying(8),
    customer_id character varying(500),
    currency_market character varying(2000),
    position_type character varying(2000),
    currency character varying(2000),
    category character varying(2000),
    sector character varying(2000),
    industry character varying(2000),
    department character varying(2000),
    cussegment character varying(2000),
    overduestat character varying(2000),
    nationality character varying(2000),
    residence character varying(2000),
    lcy_balance numeric(36,2),
    lcy_cr_amount numeric(36,2),
    lcy_dr_amount numeric(36,2),
    lcy_closing_balance numeric(36,2),
    open_balance numeric,
    ccy_cr_amount numeric,
    ccy_dr_amount numeric,
    fcy_closing_balance numeric,
    usd_equ_balance numeric,
    maturity_date timestamp without time zone,
    value_date timestamp without time zone,
    lcy_working_balance numeric(36,2),
    ccy_working_balance numeric(36,2)
);


ALTER TABLE public.dm_gl_bal_crb_f OWNER TO postgres;

--
-- Name: TABLE dm_gl_bal_crb_f; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_gl_bal_crb_f IS 'Stores General Ledger balances and credit/loan account balances per contract/customer for financial reporting and analysis.';


--
-- Name: COLUMN dm_gl_bal_crb_f.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.business_date IS 'The business date for which the balances are recorded; used for time-based reporting';


--
-- Name: COLUMN dm_gl_bal_crb_f.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.co_code IS 'Company or branch code associated with the balance record';


--
-- Name: COLUMN dm_gl_bal_crb_f.contract_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.contract_code IS 'Unique identifier for the contract/account for which balances are maintained (Primary Key)';


--
-- Name: COLUMN dm_gl_bal_crb_f.line_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.line_no IS 'Line number for the record, useful if multiple entries exist per contract';


--
-- Name: COLUMN dm_gl_bal_crb_f.asst_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.asst_type IS 'Type of asset associated with the contract (e.g., cash, securities, loans)';


--
-- Name: COLUMN dm_gl_bal_crb_f.cal_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.cal_key IS 'Calculation key for identifying balance computation logic or aggregation';


--
-- Name: COLUMN dm_gl_bal_crb_f.apl_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.apl_code IS 'Application code or module identifier within the core banking system';


--
-- Name: COLUMN dm_gl_bal_crb_f.customer_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.customer_id IS 'Identifier of the customer to whom the contract/account belongs (Foreign Key)';


--
-- Name: COLUMN dm_gl_bal_crb_f.currency_market; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.currency_market IS 'Market or currency classification for the balance (e.g., FX, local market)';


--
-- Name: COLUMN dm_gl_bal_crb_f.position_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.position_type IS 'Type of position recorded (e.g., debit, credit, contingent)';


--
-- Name: COLUMN dm_gl_bal_crb_f.currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.currency IS 'Currency code of the balance (e.g., USD, EUR) (Foreign Key)';


--
-- Name: COLUMN dm_gl_bal_crb_f.category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.category IS 'Category of the balance (e.g., retail, corporate, treasury)';


--
-- Name: COLUMN dm_gl_bal_crb_f.sector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.sector IS 'Sector classification of the customer or account';


--
-- Name: COLUMN dm_gl_bal_crb_f.industry; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.industry IS 'Industry classification of the customer';


--
-- Name: COLUMN dm_gl_bal_crb_f.department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.department IS 'Internal department code responsible for the account/contract';


--
-- Name: COLUMN dm_gl_bal_crb_f.cussegment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.cussegment IS 'Customer segment classification (e.g., SME, VIP, mass market)';


--
-- Name: COLUMN dm_gl_bal_crb_f.overduestat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.overduestat IS 'Overdue status indicator of the contract/account';


--
-- Name: COLUMN dm_gl_bal_crb_f.nationality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.nationality IS 'Nationality of the customer';


--
-- Name: COLUMN dm_gl_bal_crb_f.residence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.residence IS 'Country of residence of the customer';


--
-- Name: COLUMN dm_gl_bal_crb_f.lcy_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.lcy_balance IS 'Balance in local currency at the start of the period';


--
-- Name: COLUMN dm_gl_bal_crb_f.lcy_cr_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.lcy_cr_amount IS 'Total credit amount in local currency for the period';


--
-- Name: COLUMN dm_gl_bal_crb_f.lcy_dr_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.lcy_dr_amount IS 'Total debit amount in local currency for the period';


--
-- Name: COLUMN dm_gl_bal_crb_f.lcy_closing_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.lcy_closing_balance IS 'Closing balance in local currency at the end of the period';


--
-- Name: COLUMN dm_gl_bal_crb_f.open_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.open_balance IS 'Opening balance for the account/contract';


--
-- Name: COLUMN dm_gl_bal_crb_f.ccy_cr_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.ccy_cr_amount IS 'Total credit amount in account currency for the period';


--
-- Name: COLUMN dm_gl_bal_crb_f.ccy_dr_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.ccy_dr_amount IS 'Total debit amount in account currency for the period';


--
-- Name: COLUMN dm_gl_bal_crb_f.fcy_closing_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.fcy_closing_balance IS 'Closing balance in foreign currency for the account/contract';


--
-- Name: COLUMN dm_gl_bal_crb_f.usd_equ_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.usd_equ_balance IS 'USD equivalent of the account balance, used for reporting and consolidation';


--
-- Name: COLUMN dm_gl_bal_crb_f.maturity_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.maturity_date IS 'Date on which the contract or position matures';


--
-- Name: COLUMN dm_gl_bal_crb_f.value_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.value_date IS 'Date used for valuation of the balance';


--
-- Name: COLUMN dm_gl_bal_crb_f.lcy_working_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.lcy_working_balance IS 'Working balance in local currency, reflecting ongoing transactions';


--
-- Name: COLUMN dm_gl_bal_crb_f.ccy_working_balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_gl_bal_crb_f.ccy_working_balance IS 'Working balance in account currency, reflecting ongoing transactions';


--
-- Name: dm_posting_restrict; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_posting_restrict (
    id character varying(50) NOT NULL,
    posting_restr_code numeric,
    restriction_type character varying(50),
    record_status numeric,
    curr_no numeric,
    authoriser character varying(100),
    co_code character varying(20),
    dept_code numeric,
    auditor_code character varying(50),
    audit_date_time timestamp without time zone,
    dispo_officer character varying(50),
    allow_txn character varying(10),
    alt_override character varying(50),
    override character varying(50),
    description character varying(255),
    inputter character varying(100),
    date_time timestamp without time zone,
    txn_code character varying(50),
    local_ref character varying(50),
    block_reason_codes character varying(255),
    unblock_reason_codes character varying(255)
);


ALTER TABLE public.dm_posting_restrict OWNER TO postgres;

--
-- Name: TABLE dm_posting_restrict; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_posting_restrict IS 'Stores posting restriction rules applied to accounts or transactions, including overrides and audit information.';


--
-- Name: COLUMN dm_posting_restrict.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.id IS 'Unique identifier for the posting restriction record (Primary Key)';


--
-- Name: COLUMN dm_posting_restrict.posting_restr_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.posting_restr_code IS 'Numeric code representing the specific posting restriction applied';


--
-- Name: COLUMN dm_posting_restrict.restriction_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.restriction_type IS 'Type of restriction applied (e.g., debit block, credit block, transaction limit)';


--
-- Name: COLUMN dm_posting_restrict.record_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.record_status IS 'Status of the record (e.g., active, inactive, pending approval)';


--
-- Name: COLUMN dm_posting_restrict.curr_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.curr_no IS 'Internal numeric identifier for currency context if restriction is currency-specific';


--
-- Name: COLUMN dm_posting_restrict.authoriser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.authoriser IS 'User or officer who authorized the restriction';


--
-- Name: COLUMN dm_posting_restrict.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.co_code IS 'Company or branch code associated with the restriction';


--
-- Name: COLUMN dm_posting_restrict.dept_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.dept_code IS 'Internal department code linked to the restriction';


--
-- Name: COLUMN dm_posting_restrict.auditor_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.auditor_code IS 'Code of the auditor responsible for reviewing or approving the restriction';


--
-- Name: COLUMN dm_posting_restrict.audit_date_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.audit_date_time IS 'Date and time when the restriction was audited or reviewed';


--
-- Name: COLUMN dm_posting_restrict.dispo_officer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.dispo_officer IS 'Disposal officer responsible for handling override or exception actions';


--
-- Name: COLUMN dm_posting_restrict.allow_txn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.allow_txn IS 'Indicator if transactions are allowed despite restriction (e.g., YES/NO)';


--
-- Name: COLUMN dm_posting_restrict.alt_override; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.alt_override IS 'Alternative override code or reference for exception handling';


--
-- Name: COLUMN dm_posting_restrict.override; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.override IS 'Override code used to bypass the restriction';


--
-- Name: COLUMN dm_posting_restrict.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.description IS 'Detailed textual description of the restriction, purpose, and application';


--
-- Name: COLUMN dm_posting_restrict.inputter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.inputter IS 'User who entered or created the restriction record';


--
-- Name: COLUMN dm_posting_restrict.date_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.date_time IS 'Timestamp when the restriction record was created or last updated';


--
-- Name: COLUMN dm_posting_restrict.txn_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.txn_code IS 'Code of the transaction type affected by this restriction';


--
-- Name: COLUMN dm_posting_restrict.local_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.local_ref IS 'Local reference code or identifier linked to this restriction record';


--
-- Name: COLUMN dm_posting_restrict.block_reason_codes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.block_reason_codes IS 'Codes indicating reasons for blocking transactions under this restriction';


--
-- Name: COLUMN dm_posting_restrict.unblock_reason_codes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_posting_restrict.unblock_reason_codes IS 'Codes indicating reasons for lifting or unblocking transactions under this restriction';


--
-- Name: dm_pp_msgpaymenttyp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_pp_msgpaymenttyp (
    messagepaymenttype character varying(20) NOT NULL,
    co_code character varying(10),
    messagepaymenttypedesc character varying(200)
);


ALTER TABLE public.dm_pp_msgpaymenttyp OWNER TO postgres;

--
-- Name: TABLE dm_pp_msgpaymenttyp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_pp_msgpaymenttyp IS 'Stores payment message types (e.g., MT103, MT202) and their descriptions, linked to company/branch codes.';


--
-- Name: COLUMN dm_pp_msgpaymenttyp.messagepaymenttype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_msgpaymenttyp.messagepaymenttype IS 'Code representing the type of payment message (Primary Key)';


--
-- Name: COLUMN dm_pp_msgpaymenttyp.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_msgpaymenttyp.co_code IS 'Company or branch code associated with this payment message type (Foreign Key)';


--
-- Name: COLUMN dm_pp_msgpaymenttyp.messagepaymenttypedesc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_msgpaymenttyp.messagepaymenttypedesc IS 'Detailed description of the payment message type, including purpose and usage in the banking system';


--
-- Name: dm_pp_statuscode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_pp_statuscode (
    statuscode numeric NOT NULL,
    statusdescription character varying(200),
    co_code character varying(50),
    csrstatus character varying(50),
    csrstatusdescription character varying(200),
    gpistatus character varying(50),
    reasoncode character varying(50)
);


ALTER TABLE public.dm_pp_statuscode OWNER TO postgres;

--
-- Name: TABLE dm_pp_statuscode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_pp_statuscode IS 'Stores status codes for payments or transactions, including CSR and GPI statuses, with descriptions and associated company/branch codes.';


--
-- Name: COLUMN dm_pp_statuscode.statuscode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.statuscode IS 'Unique code representing the status of a payment or transaction (Primary Key)';


--
-- Name: COLUMN dm_pp_statuscode.statusdescription; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.statusdescription IS 'Detailed description of the status code, explaining its meaning and usage';


--
-- Name: COLUMN dm_pp_statuscode.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.co_code IS 'Company or branch code associated with this status code (Foreign Key)';


--
-- Name: COLUMN dm_pp_statuscode.csrstatus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.csrstatus IS 'Code representing the Customer Service Representative (CSR) status';


--
-- Name: COLUMN dm_pp_statuscode.csrstatusdescription; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.csrstatusdescription IS 'Detailed description of the CSR status, clarifying the status for operational purposes';


--
-- Name: COLUMN dm_pp_statuscode.gpistatus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.gpistatus IS 'Global Payment Initiative (GPI) status code, used in cross-border payment tracking';


--
-- Name: COLUMN dm_pp_statuscode.reasoncode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_pp_statuscode.reasoncode IS 'Code representing the reason for the status, providing context or explanation';


--
-- Name: dm_stmt_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_stmt_entry (
    id character varying(100) NOT NULL,
    account_number character varying(50),
    amount_lcy numeric,
    amount_fcy numeric,
    currency character varying(10),
    exchange_rate numeric,
    trans_reference character varying(100),
    their_reference character varying(100),
    transaction_code character varying(50),
    account_officer character varying(50),
    value_date timestamp without time zone,
    booking_date timestamp without time zone,
    reversal_marker character(1),
    prod_code character varying(50),
    company character varying(50),
    co_code character varying(50),
    dept_code character varying(50),
    customer character varying(50),
    consol_key character varying(100),
    curr_no numeric,
    currency_market character varying(50),
    orig_amountlcy numeric,
    orig_localequiv numeric,
    original_acct character varying(50),
    original_amount numeric,
    original_ccy character varying(10),
    original_exchrate numeric,
    our_reference character varying(100),
    outstanding_bal numeric,
    processing_date timestamp without time zone,
    record_status character(50),
    repay_date timestamp without time zone,
    trade_date timestamp without time zone,
    accounting_date timestamp without time zone,
    amount_dealccy numeric,
    authoriser character varying(50),
    cheque_number character varying(50),
    chqtype character varying(50),
    crf_type character varying(50),
    deal_ccy character varying(10),
    inputter character varying(50),
    narrative character varying(500),
    position_type character varying(50),
    system_id character varying(50),
    date_time timestamp without time zone,
    product_category numeric,
    running_balance_lcy numeric,
    business_date timestamp without time zone,
    m numeric,
    s numeric
);


ALTER TABLE public.dm_stmt_entry OWNER TO postgres;

--
-- Name: TABLE dm_stmt_entry; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_stmt_entry IS 'Stores detailed statement entries for accounts, including transaction amounts, currencies, references, dates, authorizers, and status, used for reporting and reconciliation.';


--
-- Name: COLUMN dm_stmt_entry.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.id IS 'Unique identifier for the statement entry (Primary Key)';


--
-- Name: COLUMN dm_stmt_entry.account_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.account_number IS 'Account number associated with the transaction (Foreign Key)';


--
-- Name: COLUMN dm_stmt_entry.amount_lcy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.amount_lcy IS 'Transaction amount in local currency (LCY)';


--
-- Name: COLUMN dm_stmt_entry.amount_fcy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.amount_fcy IS 'Transaction amount in foreign currency (FCY)';


--
-- Name: COLUMN dm_stmt_entry.currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.currency IS 'Currency code of the transaction amount';


--
-- Name: COLUMN dm_stmt_entry.exchange_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.exchange_rate IS 'Exchange rate used to convert between currencies';


--
-- Name: COLUMN dm_stmt_entry.trans_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.trans_reference IS 'Internal reference for the transaction';


--
-- Name: COLUMN dm_stmt_entry.their_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.their_reference IS 'Reference provided by the counterparty or external entity';


--
-- Name: COLUMN dm_stmt_entry.transaction_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.transaction_code IS 'Code identifying the type of transaction';


--
-- Name: COLUMN dm_stmt_entry.account_officer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.account_officer IS 'Account officer responsible for the transaction';


--
-- Name: COLUMN dm_stmt_entry.value_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.value_date IS 'Date on which the transaction value is effective';


--
-- Name: COLUMN dm_stmt_entry.booking_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.booking_date IS 'Date on which the transaction is recorded in the books';


--
-- Name: COLUMN dm_stmt_entry.reversal_marker; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.reversal_marker IS 'Indicates if the transaction is a reversal';


--
-- Name: COLUMN dm_stmt_entry.prod_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.prod_code IS 'Product or service code associated with the transaction';


--
-- Name: COLUMN dm_stmt_entry.company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.company IS 'Company name or identifier linked to the transaction';


--
-- Name: COLUMN dm_stmt_entry.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.co_code IS 'Company code for organizational reference';


--
-- Name: COLUMN dm_stmt_entry.dept_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.dept_code IS 'Department code responsible for the transaction';


--
-- Name: COLUMN dm_stmt_entry.customer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.customer IS 'Customer associated with the transaction (Foreign Key)';


--
-- Name: COLUMN dm_stmt_entry.consol_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.consol_key IS 'Key used for consolidation or grouping of related entries';


--
-- Name: COLUMN dm_stmt_entry.curr_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.curr_no IS 'Internal numeric code for the currency';


--
-- Name: COLUMN dm_stmt_entry.currency_market; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.currency_market IS 'Market or exchange where the currency rate is applicable';


--
-- Name: COLUMN dm_stmt_entry.orig_amountlcy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.orig_amountlcy IS 'Original amount in local currency before adjustments';


--
-- Name: COLUMN dm_stmt_entry.orig_localequiv; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.orig_localequiv IS 'Local currency equivalent of the original transaction amount';


--
-- Name: COLUMN dm_stmt_entry.original_acct; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.original_acct IS 'Original account involved in the transaction';


--
-- Name: COLUMN dm_stmt_entry.original_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.original_amount IS 'Original transaction amount before conversions';


--
-- Name: COLUMN dm_stmt_entry.original_ccy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.original_ccy IS 'Original transaction currency';


--
-- Name: COLUMN dm_stmt_entry.original_exchrate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.original_exchrate IS 'Exchange rate applied to the original transaction';


--
-- Name: COLUMN dm_stmt_entry.our_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.our_reference IS 'Bank’s reference for the transaction';


--
-- Name: COLUMN dm_stmt_entry.outstanding_bal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.outstanding_bal IS 'Outstanding balance related to the transaction';


--
-- Name: COLUMN dm_stmt_entry.processing_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.processing_date IS 'Date when the transaction was processed';


--
-- Name: COLUMN dm_stmt_entry.record_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.record_status IS 'Status of the record (e.g., posted, pending, reversed)';


--
-- Name: COLUMN dm_stmt_entry.repay_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.repay_date IS 'Repayment date associated with the transaction';


--
-- Name: COLUMN dm_stmt_entry.trade_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.trade_date IS 'Trade date for financial or securities transactions';


--
-- Name: COLUMN dm_stmt_entry.accounting_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.accounting_date IS 'Date used for accounting purposes';


--
-- Name: COLUMN dm_stmt_entry.amount_dealccy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.amount_dealccy IS 'Transaction amount in the deal currency';


--
-- Name: COLUMN dm_stmt_entry.authoriser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.authoriser IS 'User or officer who authorised the transaction';


--
-- Name: COLUMN dm_stmt_entry.cheque_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.cheque_number IS 'Cheque number, if applicable';


--
-- Name: COLUMN dm_stmt_entry.chqtype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.chqtype IS 'Type of cheque (e.g., bearer, crossed)';


--
-- Name: COLUMN dm_stmt_entry.crf_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.crf_type IS 'CRF (Customer Request Form) type, if applicable';


--
-- Name: COLUMN dm_stmt_entry.deal_ccy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.deal_ccy IS 'Currency of the deal';


--
-- Name: COLUMN dm_stmt_entry.inputter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.inputter IS 'User who inputted the transaction';


--
-- Name: COLUMN dm_stmt_entry.narrative; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.narrative IS 'Description or remarks about the transaction';


--
-- Name: COLUMN dm_stmt_entry.position_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.position_type IS 'Type of position affected by the transaction (e.g., asset, liability)';


--
-- Name: COLUMN dm_stmt_entry.system_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.system_id IS 'System identifier from which the transaction originated';


--
-- Name: COLUMN dm_stmt_entry.date_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.date_time IS 'Timestamp of the transaction entry';


--
-- Name: COLUMN dm_stmt_entry.product_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.product_category IS 'Category of the product associated with the transaction';


--
-- Name: COLUMN dm_stmt_entry.running_balance_lcy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.running_balance_lcy IS 'Running balance in local currency after the transaction';


--
-- Name: COLUMN dm_stmt_entry.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.business_date IS 'Business date associated with the transaction';


--
-- Name: COLUMN dm_stmt_entry.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.m IS 'Generic numeric field, often used for internal calculations';


--
-- Name: COLUMN dm_stmt_entry.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_stmt_entry.s IS 'Generic numeric field, often used for internal calculations';


--
-- Name: dm_tph_csd_bop_purpose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_tph_csd_bop_purpose (
    purpose_id numeric NOT NULL,
    description character varying(500) NOT NULL,
    sector_id numeric,
    short_name character varying(500)
);


ALTER TABLE public.dm_tph_csd_bop_purpose OWNER TO postgres;

--
-- Name: TABLE dm_tph_csd_bop_purpose; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_tph_csd_bop_purpose IS 'Stores Balance of Payments (BOP) purposes, linking each purpose to a sector and including descriptive and short name information.';


--
-- Name: COLUMN dm_tph_csd_bop_purpose.purpose_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_csd_bop_purpose.purpose_id IS 'Unique identifier for the BOP purpose (Primary Key)';


--
-- Name: COLUMN dm_tph_csd_bop_purpose.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_csd_bop_purpose.description IS 'Full description of the BOP purpose';


--
-- Name: COLUMN dm_tph_csd_bop_purpose.sector_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_csd_bop_purpose.sector_id IS 'Identifier linking the purpose to a specific sector';


--
-- Name: COLUMN dm_tph_csd_bop_purpose.short_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_csd_bop_purpose.short_name IS 'Abbreviated or short name for the BOP purpose';


--
-- Name: dm_tph_por; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_tph_por (
    tph_por_id character varying(50) NOT NULL,
    beneficiary_id character varying(50),
    cheque_status character varying(20),
    cancel_msg_reference character varying(50),
    payment_status_msg_ref character varying(50),
    original_or_return_id character varying(50),
    id character varying(50),
    companyid character varying(10),
    statuscode character varying(10),
    parentftnumber character varying(50),
    paymentdirection character varying(10),
    ctrbtrindicator character varying(10),
    statusdatetime timestamp without time zone,
    specificweightcode character varying(50),
    weightcode character varying(50),
    domesticinternational character varying(10),
    messageformat character varying(50),
    transactionreferenceincoming character varying(50),
    companyregion character varying(50),
    senderaddress character varying(255),
    receiveraddress character varying(255),
    sendersreferenceincoming character varying(50),
    sendersreferenceoutgoing character varying(50),
    bankoperationcode character varying(10),
    debitmainaccount character varying(50),
    debitmainaccountcurrencycode character varying(10),
    debitpartyline1 character varying(100),
    debitpartyline2 character varying(100),
    debitmainamount numeric(20,5),
    creditmainaccount character varying(50),
    creditpartyline1 character varying(100),
    creditpartyline2 character varying(100),
    creditmainamount numeric(18,2),
    transactionamount numeric(18,2),
    transactioncurrencycode character varying(10),
    detailsofcharges character varying(200),
    requestedexecutiondate timestamp without time zone,
    debitvaluedate timestamp without time zone,
    creditvaluedate timestamp without time zone,
    originatingsource character varying(50),
    originatingchannel character varying(50),
    incomingmessagetype character varying(50),
    outputchannel character varying(50),
    outgoingmessagetype character varying(50),
    batchindicator character varying(10),
    numberofchildren numeric(5,0),
    batchreference character varying(50),
    filereferenceincoming character varying(50),
    filereferenceoutgoing character varying(50),
    filesendersreference character varying(50),
    reasondescription character varying(255),
    chequenumber character varying(50),
    chequetype character varying(20),
    processingdate timestamp without time zone,
    orderingpartyresidency character varying(50),
    rejectdescription character varying(255),
    returntrigger character varying(50),
    entryuserid timestamp without time zone,
    entrydatetime timestamp without time zone,
    approveddatetime character varying(50),
    approveruserid1 timestamp without time zone,
    statusdate character varying(50),
    endtoendreference timestamp without time zone,
    bulksendersreference character varying(50),
    postingchargeamountdebit timestamp without time zone,
    postingchargeamountcredit character varying(50),
    bulkreferenceoutgoing numeric(18,2),
    bulkreferenceincoming numeric(18,2),
    business_date character varying(50),
    transaction_ref_no character varying(50),
    source timestamp without time zone,
    direction character varying(30),
    process_company character varying(10),
    processing_date character(1),
    output_channel character varying(10),
    transaction_currency timestamp without time zone,
    transaction_amount character varying(20),
    charge_option character(3),
    debit_account_number numeric(18,2),
    debit_amount character varying(10),
    debit_value_date character varying(30),
    credit_account_number numeric(20,2),
    credit_amount timestamp without time zone,
    credit_value_date character varying(30),
    status numeric(20,2),
    created_date timestamp without time zone,
    updated_date character varying(10),
    bop_sector timestamp without time zone,
    csd_bop_purpose timestamp without time zone,
    receiverinstitutionbic character varying(50),
    tph_id_no numeric,
    debittreasuryrate character varying(50),
    credittreasuryrate numeric,
    transactionreferencenumber numeric,
    capture_id numeric,
    beneficiaryaccount character varying(50),
    co_code character varying(50),
    rscpaymentorder character varying(50),
    transactionamounthome character varying(50),
    orderingidentifiercode character varying(50),
    senderinstitutionbic character varying(100),
    senderscorresidentidentifiercode character varying(100),
    receiverscorresidentidentifiercode character varying(100),
    thirdreimburseinstidentifiercode character varying(100),
    intermediaryinstidentifiercode character varying(100),
    accountwithinstidentifiercode character varying(100),
    beneficiaryidentifiercode character varying(100),
    beneficiaryname character varying(100),
    paymentdetails character varying(100),
    chargeoption character varying(100),
    sendersreferencenumber character varying(100),
    relatedreference character varying(100),
    exchangerate character varying(100),
    bookdate timestamp without time zone,
    debitpartyline3 character varying(100),
    inputter character varying(500),
    authoriser character varying(500)
);


ALTER TABLE public.dm_tph_por OWNER TO postgres;

--
-- Name: TABLE dm_tph_por; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_tph_por IS 'TPH Payment Order Records table. Tracks all payment transactions, including details of debit/credit accounts, transaction references, processing status, message formats, and BOP categorization.';


--
-- Name: COLUMN dm_tph_por.tph_por_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.tph_por_id IS 'Unique identifier assigned to each TPH POR record to track payments.';


--
-- Name: COLUMN dm_tph_por.beneficiary_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.beneficiary_id IS 'Identifier linking the payment to the correct beneficiary in the system.';


--
-- Name: COLUMN dm_tph_por.cheque_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.cheque_status IS 'Current status of the cheque such as issued, cleared, or returned.';


--
-- Name: COLUMN dm_tph_por.cancel_msg_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.cancel_msg_reference IS 'Reference number for any message requesting cancellation of this payment.';


--
-- Name: COLUMN dm_tph_por.payment_status_msg_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.payment_status_msg_ref IS 'Reference to the status message received confirming payment processing.';


--
-- Name: COLUMN dm_tph_por.original_or_return_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.original_or_return_id IS 'Reference to the original payment or a returned payment if applicable.';


--
-- Name: COLUMN dm_tph_por.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.id IS 'Internal system identifier used for processing and reconciliation.';


--
-- Name: COLUMN dm_tph_por.companyid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.companyid IS 'Identifier of the company initiating or responsible for this payment.';


--
-- Name: COLUMN dm_tph_por.statuscode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.statuscode IS 'Current status code reflecting the processing stage of the payment.';


--
-- Name: COLUMN dm_tph_por.parentftnumber; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.parentftnumber IS 'Reference to the parent financial transaction number, if part of a larger batch.';


--
-- Name: COLUMN dm_tph_por.paymentdirection; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.paymentdirection IS 'Indicates whether the payment is incoming or outgoing.';


--
-- Name: COLUMN dm_tph_por.ctrbtrindicator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.ctrbtrindicator IS 'Indicator specifying the contributor type for the transaction.';


--
-- Name: COLUMN dm_tph_por.statusdatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.statusdatetime IS 'Date and time when the current status was recorded.';


--
-- Name: COLUMN dm_tph_por.specificweightcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.specificweightcode IS 'Code representing any specific weight or priority assigned to this payment.';


--
-- Name: COLUMN dm_tph_por.weightcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.weightcode IS 'General weight code indicating processing priority or category.';


--
-- Name: COLUMN dm_tph_por.domesticinternational; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.domesticinternational IS 'Flag indicating if the payment is domestic or international.';


--
-- Name: COLUMN dm_tph_por.messageformat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.messageformat IS 'Format of the message associated with this transaction, e.g., ISO20022.';


--
-- Name: COLUMN dm_tph_por.transactionreferenceincoming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transactionreferenceincoming IS 'Reference number for the incoming transaction linked to this payment.';


--
-- Name: COLUMN dm_tph_por.companyregion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.companyregion IS 'Geographical region or branch associated with the company initiating the payment.';


--
-- Name: COLUMN dm_tph_por.senderaddress; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.senderaddress IS 'Full address of the sender involved in the transaction.';


--
-- Name: COLUMN dm_tph_por.receiveraddress; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.receiveraddress IS 'Full address of the receiver of the payment.';


--
-- Name: COLUMN dm_tph_por.sendersreferenceincoming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.sendersreferenceincoming IS 'Reference provided by the sender for incoming messages.';


--
-- Name: COLUMN dm_tph_por.sendersreferenceoutgoing; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.sendersreferenceoutgoing IS 'Reference provided by the sender for outgoing messages.';


--
-- Name: COLUMN dm_tph_por.bankoperationcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.bankoperationcode IS 'Bank operation code specifying the type of transaction performed.';


--
-- Name: COLUMN dm_tph_por.debitmainaccount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitmainaccount IS 'Account number from which the debit is made.';


--
-- Name: COLUMN dm_tph_por.debitmainaccountcurrencycode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitmainaccountcurrencycode IS 'Currency code of the debit account.';


--
-- Name: COLUMN dm_tph_por.debitpartyline1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitpartyline1 IS 'First line of the debit party’s name or address.';


--
-- Name: COLUMN dm_tph_por.debitpartyline2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitpartyline2 IS 'Second line of the debit party’s name or address.';


--
-- Name: COLUMN dm_tph_por.debitmainamount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitmainamount IS 'Amount debited from the sender’s account.';


--
-- Name: COLUMN dm_tph_por.creditmainaccount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.creditmainaccount IS 'Account number to which the credit is made.';


--
-- Name: COLUMN dm_tph_por.creditpartyline1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.creditpartyline1 IS 'First line of the credit party’s name or address.';


--
-- Name: COLUMN dm_tph_por.creditpartyline2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.creditpartyline2 IS 'Second line of the credit party’s name or address.';


--
-- Name: COLUMN dm_tph_por.creditmainamount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.creditmainamount IS 'Amount credited to the receiver’s account.';


--
-- Name: COLUMN dm_tph_por.transactionamount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transactionamount IS 'Total transaction amount.';


--
-- Name: COLUMN dm_tph_por.transactioncurrencycode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transactioncurrencycode IS 'Currency code used for the transaction.';


--
-- Name: COLUMN dm_tph_por.detailsofcharges; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.detailsofcharges IS 'Details describing any charges applied to the transaction.';


--
-- Name: COLUMN dm_tph_por.requestedexecutiondate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.requestedexecutiondate IS 'Date requested for execution of the transaction.';


--
-- Name: COLUMN dm_tph_por.debitvaluedate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitvaluedate IS 'Value date when the debit is effective.';


--
-- Name: COLUMN dm_tph_por.creditvaluedate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.creditvaluedate IS 'Value date when the credit is effective.';


--
-- Name: COLUMN dm_tph_por.originatingsource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.originatingsource IS 'Source system from which the transaction originated.';


--
-- Name: COLUMN dm_tph_por.originatingchannel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.originatingchannel IS 'Channel through which the transaction was initiated, e.g., online, branch.';


--
-- Name: COLUMN dm_tph_por.incomingmessagetype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.incomingmessagetype IS 'Type of incoming message received for this payment.';


--
-- Name: COLUMN dm_tph_por.outputchannel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.outputchannel IS 'Output channel used for sending transaction messages.';


--
-- Name: COLUMN dm_tph_por.outgoingmessagetype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.outgoingmessagetype IS 'Type of outgoing message generated for this payment.';


--
-- Name: COLUMN dm_tph_por.batchindicator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.batchindicator IS 'Indicator if the transaction is part of a batch.';


--
-- Name: COLUMN dm_tph_por.numberofchildren; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.numberofchildren IS 'Number of child transactions included in the batch.';


--
-- Name: COLUMN dm_tph_por.batchreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.batchreference IS 'Reference number for the batch this payment belongs to.';


--
-- Name: COLUMN dm_tph_por.filereferenceincoming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.filereferenceincoming IS 'Reference to the incoming file associated with this transaction.';


--
-- Name: COLUMN dm_tph_por.filereferenceoutgoing; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.filereferenceoutgoing IS 'Reference to the outgoing file associated with this transaction.';


--
-- Name: COLUMN dm_tph_por.filesendersreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.filesendersreference IS 'Sender’s reference for the file containing this payment.';


--
-- Name: COLUMN dm_tph_por.reasondescription; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.reasondescription IS 'Description of the reason for any rejection or special status.';


--
-- Name: COLUMN dm_tph_por.chequenumber; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.chequenumber IS 'Cheque number associated with the transaction.';


--
-- Name: COLUMN dm_tph_por.chequetype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.chequetype IS 'Type of cheque, e.g., bearer, order, or crossed.';


--
-- Name: COLUMN dm_tph_por.processingdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.processingdate IS 'Date when the payment was processed.';


--
-- Name: COLUMN dm_tph_por.orderingpartyresidency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.orderingpartyresidency IS 'Residency of the ordering party, e.g., local or foreign.';


--
-- Name: COLUMN dm_tph_por.rejectdescription; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.rejectdescription IS 'Detailed description of the reason for rejection, if applicable.';


--
-- Name: COLUMN dm_tph_por.returntrigger; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.returntrigger IS 'Trigger causing a payment return, if applicable.';


--
-- Name: COLUMN dm_tph_por.entryuserid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.entryuserid IS 'User ID of the person who entered the transaction.';


--
-- Name: COLUMN dm_tph_por.entrydatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.entrydatetime IS 'Datetime when the entry was made.';


--
-- Name: COLUMN dm_tph_por.approveddatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.approveddatetime IS 'Datetime when the transaction was approved.';


--
-- Name: COLUMN dm_tph_por.approveruserid1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.approveruserid1 IS 'User ID of the approver.';


--
-- Name: COLUMN dm_tph_por.statusdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.statusdate IS 'Date when the status was last updated.';


--
-- Name: COLUMN dm_tph_por.endtoendreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.endtoendreference IS 'Unique end-to-end reference for the transaction.';


--
-- Name: COLUMN dm_tph_por.bulksendersreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.bulksendersreference IS 'Bulk sender’s reference for group payments.';


--
-- Name: COLUMN dm_tph_por.postingchargeamountdebit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.postingchargeamountdebit IS 'Amount of charges posted to the debit side.';


--
-- Name: COLUMN dm_tph_por.postingchargeamountcredit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.postingchargeamountcredit IS 'Amount of charges posted to the credit side.';


--
-- Name: COLUMN dm_tph_por.bulkreferenceoutgoing; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.bulkreferenceoutgoing IS 'Reference for outgoing bulk payment.';


--
-- Name: COLUMN dm_tph_por.bulkreferenceincoming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.bulkreferenceincoming IS 'Reference for incoming bulk payment.';


--
-- Name: COLUMN dm_tph_por.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.business_date IS 'Business date associated with the transaction.';


--
-- Name: COLUMN dm_tph_por.transaction_ref_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transaction_ref_no IS 'Transaction reference number used for reconciliation.';


--
-- Name: COLUMN dm_tph_por.source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.source IS 'Source system code of the transaction.';


--
-- Name: COLUMN dm_tph_por.direction; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.direction IS 'Direction of payment: debit or credit.';


--
-- Name: COLUMN dm_tph_por.process_company; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.process_company IS 'Company responsible for processing the transaction.';


--
-- Name: COLUMN dm_tph_por.processing_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.processing_date IS 'Date when the transaction was processed.';


--
-- Name: COLUMN dm_tph_por.output_channel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.output_channel IS 'Channel used for output messages.';


--
-- Name: COLUMN dm_tph_por.transaction_currency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transaction_currency IS 'Currency of the transaction.';


--
-- Name: COLUMN dm_tph_por.transaction_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transaction_amount IS 'Amount of the transaction.';


--
-- Name: COLUMN dm_tph_por.charge_option; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.charge_option IS 'Charge option selected for the payment.';


--
-- Name: COLUMN dm_tph_por.debit_account_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debit_account_number IS 'Account number to be debited.';


--
-- Name: COLUMN dm_tph_por.debit_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debit_amount IS 'Amount to be debited.';


--
-- Name: COLUMN dm_tph_por.debit_value_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debit_value_date IS 'Value date for the debit entry.';


--
-- Name: COLUMN dm_tph_por.credit_account_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.credit_account_number IS 'Account number to be credited.';


--
-- Name: COLUMN dm_tph_por.credit_amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.credit_amount IS 'Amount to be credited.';


--
-- Name: COLUMN dm_tph_por.credit_value_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.credit_value_date IS 'Value date for the credit entry.';


--
-- Name: COLUMN dm_tph_por.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.status IS 'Current status of the transaction.';


--
-- Name: COLUMN dm_tph_por.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.created_date IS 'Date when the record was created.';


--
-- Name: COLUMN dm_tph_por.updated_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.updated_date IS 'Date when the record was last updated.';


--
-- Name: COLUMN dm_tph_por.bop_sector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.bop_sector IS 'BOP sector code associated with the transaction.';


--
-- Name: COLUMN dm_tph_por.csd_bop_purpose; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.csd_bop_purpose IS 'CSD BOP purpose code for categorizing the transaction.';


--
-- Name: COLUMN dm_tph_por.receiverinstitutionbic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.receiverinstitutionbic IS 'BIC code of the receiver institution.';


--
-- Name: COLUMN dm_tph_por.tph_id_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.tph_id_no IS 'TPH system identification number.';


--
-- Name: COLUMN dm_tph_por.debittreasuryrate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debittreasuryrate IS 'Treasury rate used for debit calculations.';


--
-- Name: COLUMN dm_tph_por.credittreasuryrate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.credittreasuryrate IS 'Treasury rate used for credit calculations.';


--
-- Name: COLUMN dm_tph_por.transactionreferencenumber; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transactionreferencenumber IS 'Transaction reference number for TPH reconciliation.';


--
-- Name: COLUMN dm_tph_por.capture_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.capture_id IS 'Capture ID for identifying the transaction capture event.';


--
-- Name: COLUMN dm_tph_por.beneficiaryaccount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.beneficiaryaccount IS 'Account of the beneficiary receiving the funds.';


--
-- Name: COLUMN dm_tph_por.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.co_code IS 'Company code associated with the transaction.';


--
-- Name: COLUMN dm_tph_por.rscpaymentorder; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.rscpaymentorder IS 'Payment order reference code in RSC system.';


--
-- Name: COLUMN dm_tph_por.transactionamounthome; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.transactionamounthome IS 'Transaction amount in home currency.';


--
-- Name: COLUMN dm_tph_por.orderingidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.orderingidentifiercode IS 'Ordering identifier code assigned by the sender.';


--
-- Name: COLUMN dm_tph_por.senderinstitutionbic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.senderinstitutionbic IS 'BIC of the sender institution.';


--
-- Name: COLUMN dm_tph_por.senderscorresidentidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.senderscorresidentidentifiercode IS 'Sender’s correspondent identifier code.';


--
-- Name: COLUMN dm_tph_por.receiverscorresidentidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.receiverscorresidentidentifiercode IS 'Receiver’s correspondent identifier code.';


--
-- Name: COLUMN dm_tph_por.thirdreimburseinstidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.thirdreimburseinstidentifiercode IS 'Identifier code of the third reimbursement institution.';


--
-- Name: COLUMN dm_tph_por.intermediaryinstidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.intermediaryinstidentifiercode IS 'Identifier code of any intermediary institution involved.';


--
-- Name: COLUMN dm_tph_por.accountwithinstidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.accountwithinstidentifiercode IS 'Account-with institution identifier code.';


--
-- Name: COLUMN dm_tph_por.beneficiaryidentifiercode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.beneficiaryidentifiercode IS 'Beneficiary identifier code.';


--
-- Name: COLUMN dm_tph_por.beneficiaryname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.beneficiaryname IS 'Name of the beneficiary receiving the payment.';


--
-- Name: COLUMN dm_tph_por.paymentdetails; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.paymentdetails IS 'Details describing the purpose or information about the payment.';


--
-- Name: COLUMN dm_tph_por.chargeoption; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.chargeoption IS 'Charge option description used in the transaction.';


--
-- Name: COLUMN dm_tph_por.sendersreferencenumber; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.sendersreferencenumber IS 'Sender’s reference number for tracking.';


--
-- Name: COLUMN dm_tph_por.relatedreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.relatedreference IS 'Related reference linking to other transactions.';


--
-- Name: COLUMN dm_tph_por.exchangerate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.exchangerate IS 'Exchange rate applied to the transaction.';


--
-- Name: COLUMN dm_tph_por.bookdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.bookdate IS 'Book date when the transaction was recorded.';


--
-- Name: COLUMN dm_tph_por.debitpartyline3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.debitpartyline3 IS 'Third line of the debit party’s address or name.';


--
-- Name: COLUMN dm_tph_por.inputter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.inputter IS 'User who inputted the transaction.';


--
-- Name: COLUMN dm_tph_por.authoriser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por.authoriser IS 'User who authorized the transaction.';


--
-- Name: dm_tph_por_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_tph_por_details (
    tph_detail_id numeric NOT NULL,
    tph_por_id character varying(50),
    additional_inf_line character varying(255),
    loc_field_name character varying(100),
    loc_field_value character varying(255),
    response_details character varying(255),
    entry_ids character varying(200),
    account_number character varying(200),
    business_date timestamp without time zone,
    m numeric,
    s numeric
);


ALTER TABLE public.dm_tph_por_details OWNER TO postgres;

--
-- Name: TABLE dm_tph_por_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_tph_por_details IS 'Details of TPH Payment Orders. Contains additional information, custom fields, responses, and account-level data linked to a TPH POR transaction.';


--
-- Name: COLUMN dm_tph_por_details.tph_detail_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.tph_detail_id IS 'Unique identifier for each detail record associated with a TPH POR transaction.';


--
-- Name: COLUMN dm_tph_por_details.tph_por_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.tph_por_id IS 'Reference to the main TPH POR record this detail belongs to.';


--
-- Name: COLUMN dm_tph_por_details.additional_inf_line; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.additional_inf_line IS 'Contains any additional information or notes for the transaction detail.';


--
-- Name: COLUMN dm_tph_por_details.loc_field_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.loc_field_name IS 'Name of the local or custom field for additional information.';


--
-- Name: COLUMN dm_tph_por_details.loc_field_value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.loc_field_value IS 'Value associated with the local or custom field.';


--
-- Name: COLUMN dm_tph_por_details.response_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.response_details IS 'Information about the response received for this transaction detail.';


--
-- Name: COLUMN dm_tph_por_details.entry_ids; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.entry_ids IS 'Comma-separated list of entry IDs related to this detail.';


--
-- Name: COLUMN dm_tph_por_details.account_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.account_number IS 'Account number associated with the transaction detail.';


--
-- Name: COLUMN dm_tph_por_details.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.business_date IS 'The business date on which this detail was recorded or processed.';


--
-- Name: COLUMN dm_tph_por_details.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.m IS 'Internal marker field, often used for metadata or partitioning.';


--
-- Name: COLUMN dm_tph_por_details.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_por_details.s IS 'Internal marker field, often used for metadata or partitioning.';


--
-- Name: dm_tph_ppt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_tph_ppt (
    tph_ppt_id character varying(100) NOT NULL,
    bulk_companyid character varying(10),
    bulk_filereference character varying(50),
    bulkreference character varying(100),
    bulkreferenceincoming character varying(50),
    creationdatetime timestamp without time zone,
    bulkformat character varying(20),
    bulkpaymenttype character varying(10),
    numberoftransactions numeric,
    settlementamount numeric(18,2),
    settlementcurrency character varying(10),
    settlementdate timestamp without time zone,
    statuscodereceivedbulk character varying(20),
    bulk_errorcode character varying(20),
    bulk_errorinformation character varying(255),
    authoiser character varying(50),
    co_code character varying(20),
    sourcetype character varying(20),
    bulkpaymentmethod character varying(20),
    file_filereference character varying(50),
    receiveddatetime timestamp without time zone,
    file_companyid character varying(10),
    originatingchannel character varying(50),
    messageformat character varying(50),
    filetype character varying(50),
    filename character varying(255),
    numberofrecords numeric,
    statuscodereceivedfile character varying(20),
    file_errorcode character varying(20),
    file_errorinformation character varying(255),
    originatingreference character varying(100),
    entryuserid character varying(50),
    entrydatetime timestamp without time zone,
    approveruserid character varying(50),
    approveddatetime timestamp without time zone,
    filereferenceincoming character varying(100),
    filetotalam numeric(18,2),
    originatingsource character varying(50),
    uniquereference character varying(100),
    hdrinitptynm character varying(100),
    numberofbulks numeric,
    businessdate timestamp without time zone
);


ALTER TABLE public.dm_tph_ppt OWNER TO postgres;

--
-- Name: TABLE dm_tph_ppt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_tph_ppt IS 'TPH PPT table stores bulk payment header information, including bulk files, references, settlement details, and processing metadata.';


--
-- Name: COLUMN dm_tph_ppt.tph_ppt_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.tph_ppt_id IS 'Unique identifier for the TPH PPT record';


--
-- Name: COLUMN dm_tph_ppt.bulk_companyid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulk_companyid IS 'Identifier of the company for the bulk payment';


--
-- Name: COLUMN dm_tph_ppt.bulk_filereference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulk_filereference IS 'Reference of the bulk file';


--
-- Name: COLUMN dm_tph_ppt.bulkreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulkreference IS 'Unique reference for the bulk payment transaction';


--
-- Name: COLUMN dm_tph_ppt.bulkreferenceincoming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulkreferenceincoming IS 'Incoming bulk reference from source system';


--
-- Name: COLUMN dm_tph_ppt.creationdatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.creationdatetime IS 'Datetime when the record was created';


--
-- Name: COLUMN dm_tph_ppt.bulkformat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulkformat IS 'Format of the bulk file (e.g., MT, XML)';


--
-- Name: COLUMN dm_tph_ppt.bulkpaymenttype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulkpaymenttype IS 'Type of bulk payment';


--
-- Name: COLUMN dm_tph_ppt.numberoftransactions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.numberoftransactions IS 'Total number of transactions in this bulk';


--
-- Name: COLUMN dm_tph_ppt.settlementamount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.settlementamount IS 'Settlement amount for the bulk payment';


--
-- Name: COLUMN dm_tph_ppt.settlementcurrency; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.settlementcurrency IS 'Currency of the settlement amount';


--
-- Name: COLUMN dm_tph_ppt.settlementdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.settlementdate IS 'Date when the bulk settlement occurs';


--
-- Name: COLUMN dm_tph_ppt.statuscodereceivedbulk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.statuscodereceivedbulk IS 'Status code received for the bulk';


--
-- Name: COLUMN dm_tph_ppt.bulk_errorcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulk_errorcode IS 'Error code related to the bulk';


--
-- Name: COLUMN dm_tph_ppt.bulk_errorinformation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulk_errorinformation IS 'Detailed information on bulk errors';


--
-- Name: COLUMN dm_tph_ppt.authoiser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.authoiser IS 'User who authorised the record';


--
-- Name: COLUMN dm_tph_ppt.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.co_code IS 'Company code associated with the bulk';


--
-- Name: COLUMN dm_tph_ppt.sourcetype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.sourcetype IS 'Source type of the bulk payment';


--
-- Name: COLUMN dm_tph_ppt.bulkpaymentmethod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.bulkpaymentmethod IS 'Method of bulk payment (e.g., bank transfer)';


--
-- Name: COLUMN dm_tph_ppt.file_filereference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.file_filereference IS 'Reference of the file associated with the bulk';


--
-- Name: COLUMN dm_tph_ppt.receiveddatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.receiveddatetime IS 'Datetime when the file was received';


--
-- Name: COLUMN dm_tph_ppt.file_companyid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.file_companyid IS 'Company ID from the file';


--
-- Name: COLUMN dm_tph_ppt.originatingchannel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.originatingchannel IS 'Channel through which the bulk originated';


--
-- Name: COLUMN dm_tph_ppt.messageformat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.messageformat IS 'Format of the message/file';


--
-- Name: COLUMN dm_tph_ppt.filetype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.filetype IS 'Type of the file (e.g., CSV, XML)';


--
-- Name: COLUMN dm_tph_ppt.filename; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.filename IS 'Name of the file received';


--
-- Name: COLUMN dm_tph_ppt.numberofrecords; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.numberofrecords IS 'Number of records in the file';


--
-- Name: COLUMN dm_tph_ppt.statuscodereceivedfile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.statuscodereceivedfile IS 'Status code received for the file';


--
-- Name: COLUMN dm_tph_ppt.file_errorcode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.file_errorcode IS 'Error code related to the file';


--
-- Name: COLUMN dm_tph_ppt.file_errorinformation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.file_errorinformation IS 'Detailed information on file errors';


--
-- Name: COLUMN dm_tph_ppt.originatingreference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.originatingreference IS 'Original reference associated with this bulk';


--
-- Name: COLUMN dm_tph_ppt.entryuserid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.entryuserid IS 'User ID who entered the record';


--
-- Name: COLUMN dm_tph_ppt.entrydatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.entrydatetime IS 'Datetime when the record was entered';


--
-- Name: COLUMN dm_tph_ppt.approveruserid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.approveruserid IS 'User ID of the approver';


--
-- Name: COLUMN dm_tph_ppt.approveddatetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.approveddatetime IS 'Datetime when the record was approved';


--
-- Name: COLUMN dm_tph_ppt.filereferenceincoming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.filereferenceincoming IS 'Incoming file reference for the bulk';


--
-- Name: COLUMN dm_tph_ppt.filetotalam; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.filetotalam IS 'Total amount in the file';


--
-- Name: COLUMN dm_tph_ppt.originatingsource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.originatingsource IS 'Source from which the bulk originated';


--
-- Name: COLUMN dm_tph_ppt.uniquereference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.uniquereference IS 'Unique reference for tracking';


--
-- Name: COLUMN dm_tph_ppt.hdrinitptynm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.hdrinitptynm IS 'Name of the initiating party';


--
-- Name: COLUMN dm_tph_ppt.numberofbulks; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.numberofbulks IS 'Total number of bulks in this batch';


--
-- Name: COLUMN dm_tph_ppt.businessdate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_tph_ppt.businessdate IS 'Business date of the bulk';


--
-- Name: dm_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dm_user (
    user_id character varying(50) NOT NULL,
    user_name character varying(100),
    sign_on_name character varying(50),
    start_date_profile timestamp without time zone,
    end_date_profile timestamp without time zone,
    init_application character varying(500),
    date_last_sign_on timestamp without time zone,
    login_status character varying(20),
    channel character varying(50),
    co_code character varying(20),
    dept_code numeric,
    company_restr character varying(50),
    application character varying(50),
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    passw_change_date timestamp without time zone,
    attributes character varying(25),
    curr_no numeric,
    user_roles character varying(25),
    date_time timestamp without time zone,
    company_code character varying(100),
    user_seq_no numeric,
    business_date timestamp without time zone,
    inputter character varying(128),
    authoriser character varying(128),
    m numeric,
    s numeric
);


ALTER TABLE public.dm_user OWNER TO postgres;

--
-- Name: TABLE dm_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dm_user IS 'DM_USER table stores information about system users including login, roles, profile dates, and company/department associations.';


--
-- Name: COLUMN dm_user.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.user_id IS 'Unique identifier for the user';


--
-- Name: COLUMN dm_user.user_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.user_name IS 'Full name of the user';


--
-- Name: COLUMN dm_user.sign_on_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.sign_on_name IS 'Sign-on/login name of the user';


--
-- Name: COLUMN dm_user.start_date_profile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.start_date_profile IS 'Start date of the user profile';


--
-- Name: COLUMN dm_user.end_date_profile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.end_date_profile IS 'End date of the user profile';


--
-- Name: COLUMN dm_user.init_application; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.init_application IS 'Initial applications assigned to the user';


--
-- Name: COLUMN dm_user.date_last_sign_on; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.date_last_sign_on IS 'Datetime of the last sign-on by the user';


--
-- Name: COLUMN dm_user.login_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.login_status IS 'Current login status of the user (active/inactive)';


--
-- Name: COLUMN dm_user.channel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.channel IS 'Channel through which the user accesses the system';


--
-- Name: COLUMN dm_user.co_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.co_code IS 'Company code associated with the user';


--
-- Name: COLUMN dm_user.dept_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.dept_code IS 'Department code for the user';


--
-- Name: COLUMN dm_user.company_restr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.company_restr IS 'Company restrictions applied to the user';


--
-- Name: COLUMN dm_user.application; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.application IS 'Primary application assigned to the user';


--
-- Name: COLUMN dm_user.created_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.created_date IS 'Datetime when the user record was created';


--
-- Name: COLUMN dm_user.modified_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.modified_date IS 'Datetime when the user record was last modified';


--
-- Name: COLUMN dm_user.passw_change_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.passw_change_date IS 'Datetime when the user last changed their password';


--
-- Name: COLUMN dm_user.attributes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.attributes IS 'Additional attributes for the user profile';


--
-- Name: COLUMN dm_user.curr_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.curr_no IS 'Current numeric code associated with the user';


--
-- Name: COLUMN dm_user.user_roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.user_roles IS 'Roles assigned to the user';


--
-- Name: COLUMN dm_user.date_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.date_time IS 'Datetime of the record entry';


--
-- Name: COLUMN dm_user.company_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.company_code IS 'Company code the user belongs to';


--
-- Name: COLUMN dm_user.user_seq_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.user_seq_no IS 'Sequential number for the user';


--
-- Name: COLUMN dm_user.business_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.business_date IS 'Business date associated with the record';


--
-- Name: COLUMN dm_user.inputter; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.inputter IS 'User who entered the record';


--
-- Name: COLUMN dm_user.authoriser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.authoriser IS 'User who authorised the record';


--
-- Name: COLUMN dm_user.m; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.m IS 'Miscellaneous numeric field';


--
-- Name: COLUMN dm_user.s; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dm_user.s IS 'Miscellaneous numeric field';


--
-- Name: dm_aa_account_details_details dm_aa_account_details_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_account_details_details
    ADD CONSTRAINT dm_aa_account_details_details_pkey PRIMARY KEY (id);


--
-- Name: dm_aa_account_details dm_aa_account_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_account_details
    ADD CONSTRAINT dm_aa_account_details_pkey PRIMARY KEY (id);


--
-- Name: dm_aa_arr_account dm_aa_arr_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arr_account
    ADD CONSTRAINT dm_aa_arr_account_pkey PRIMARY KEY (business_date);


--
-- Name: dm_aa_arrangement_activity_details dm_aa_arrangement_activity_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arrangement_activity_details
    ADD CONSTRAINT dm_aa_arrangement_activity_details_pkey PRIMARY KEY (id);


--
-- Name: dm_aa_arrangement_activity dm_aa_arrangement_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arrangement_activity
    ADD CONSTRAINT dm_aa_arrangement_activity_pkey PRIMARY KEY (arr_sequence);


--
-- Name: dm_aa_arrangements dm_aa_arrangements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arrangements
    ADD CONSTRAINT dm_aa_arrangements_pkey PRIMARY KEY (arrangement_id);


--
-- Name: dm_aa_contract_d dm_aa_contract_d_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_contract_d
    ADD CONSTRAINT dm_aa_contract_d_pkey PRIMARY KEY (linked_appl_id);


--
-- Name: dm_aa_product dm_aa_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_product
    ADD CONSTRAINT dm_aa_product_pkey PRIMARY KEY (product);


--
-- Name: dm_ac_charge_request dm_ac_charge_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_ac_charge_request
    ADD CONSTRAINT dm_ac_charge_request_pkey PRIMARY KEY (request_id);


--
-- Name: dm_account_f dm_account_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_account_f
    ADD CONSTRAINT dm_account_f_pkey PRIMARY KEY (account_seq_no);


--
-- Name: dm_account dm_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_account
    ADD CONSTRAINT dm_account_pkey PRIMARY KEY (account_seq_no);


--
-- Name: dm_atm_transaction dm_atm_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_atm_transaction
    ADD CONSTRAINT dm_atm_transaction_pkey PRIMARY KEY (atm_txn_id);


--
-- Name: dm_company dm_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_company
    ADD CONSTRAINT dm_company_pkey PRIMARY KEY (branch_code);


--
-- Name: dm_currency dm_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_currency
    ADD CONSTRAINT dm_currency_pkey PRIMARY KEY (currency_code);


--
-- Name: dm_customer dm_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_customer
    ADD CONSTRAINT dm_customer_pkey PRIMARY KEY (customer_code);


--
-- Name: dm_dates dm_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_dates
    ADD CONSTRAINT dm_dates_pkey PRIMARY KEY (business_date);


--
-- Name: dm_eb_queries_answers dm_eb_queries_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_eb_queries_answers
    ADD CONSTRAINT dm_eb_queries_answers_pkey PRIMARY KEY (eb_queries_ans_id);


--
-- Name: dm_gl_bal_crb_f dm_gl_bal_crb_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_gl_bal_crb_f
    ADD CONSTRAINT dm_gl_bal_crb_f_pkey PRIMARY KEY (contract_code);


--
-- Name: dm_posting_restrict dm_posting_restrict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_posting_restrict
    ADD CONSTRAINT dm_posting_restrict_pkey PRIMARY KEY (id);


--
-- Name: dm_pp_msgpaymenttyp dm_pp_msgpaymenttyp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_pp_msgpaymenttyp
    ADD CONSTRAINT dm_pp_msgpaymenttyp_pkey PRIMARY KEY (messagepaymenttype);


--
-- Name: dm_pp_statuscode dm_pp_statuscode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_pp_statuscode
    ADD CONSTRAINT dm_pp_statuscode_pkey PRIMARY KEY (statuscode);


--
-- Name: dm_stmt_entry dm_stmt_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_stmt_entry
    ADD CONSTRAINT dm_stmt_entry_pkey PRIMARY KEY (id);


--
-- Name: dm_tph_csd_bop_purpose dm_tph_csd_bop_purpose_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_tph_csd_bop_purpose
    ADD CONSTRAINT dm_tph_csd_bop_purpose_pkey PRIMARY KEY (purpose_id);


--
-- Name: dm_tph_por_details dm_tph_por_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_tph_por_details
    ADD CONSTRAINT dm_tph_por_details_pkey PRIMARY KEY (tph_detail_id);


--
-- Name: dm_tph_por dm_tph_por_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_tph_por
    ADD CONSTRAINT dm_tph_por_pkey PRIMARY KEY (tph_por_id);


--
-- Name: dm_tph_ppt dm_tph_ppt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_tph_ppt
    ADD CONSTRAINT dm_tph_ppt_pkey PRIMARY KEY (tph_ppt_id);


--
-- Name: dm_user dm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_user
    ADD CONSTRAINT dm_user_pkey PRIMARY KEY (user_id);


--
-- Name: dm_tph_por_details dm_tph_por_details_tph_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_tph_por_details
    ADD CONSTRAINT dm_tph_por_details_tph_por_id_fkey FOREIGN KEY (tph_por_id) REFERENCES public.dm_tph_por(tph_por_id);


--
-- Name: dm_aa_account_details fk_dm_aa_account_details_arrangement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_account_details
    ADD CONSTRAINT fk_dm_aa_account_details_arrangement FOREIGN KEY (arrangement_id) REFERENCES public.dm_aa_arrangements(arrangement_id);


--
-- Name: dm_aa_account_details_details fk_dm_aa_account_details_details_arrangement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_account_details_details
    ADD CONSTRAINT fk_dm_aa_account_details_details_arrangement FOREIGN KEY (arrangement_id) REFERENCES public.dm_aa_arrangements(arrangement_id);


--
-- Name: dm_aa_arr_account fk_dm_aa_arr_account_arrangement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arr_account
    ADD CONSTRAINT fk_dm_aa_arr_account_arrangement FOREIGN KEY (arrangement_id) REFERENCES public.dm_aa_arrangements(arrangement_id);


--
-- Name: dm_aa_arr_account_details fk_dm_aa_arr_account_details_arrangement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arr_account_details
    ADD CONSTRAINT fk_dm_aa_arr_account_details_arrangement FOREIGN KEY (arrangement_id) REFERENCES public.dm_aa_arrangements(arrangement_id);


--
-- Name: dm_aa_arrangement_activity fk_dm_aa_arr_activity_arrangement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arrangement_activity
    ADD CONSTRAINT fk_dm_aa_arr_activity_arrangement FOREIGN KEY (arrangement) REFERENCES public.dm_aa_arrangements(arrangement_id);


--
-- Name: dm_aa_arrangement_activity_details fk_dm_aa_arr_activity_details_arr_sequence; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_arrangement_activity_details
    ADD CONSTRAINT fk_dm_aa_arr_activity_details_arr_sequence FOREIGN KEY (arr_sequence) REFERENCES public.dm_aa_arrangement_activity(arr_sequence);


--
-- Name: dm_aa_contract_d fk_dm_aa_contract_d_arrangement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_aa_contract_d
    ADD CONSTRAINT fk_dm_aa_contract_d_arrangement FOREIGN KEY (arrangement_id) REFERENCES public.dm_aa_arrangements(arrangement_id);


--
-- Name: dm_account_f fk_dm_account_f_contract_code__dm_aa_contract_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_account_f
    ADD CONSTRAINT fk_dm_account_f_contract_code__dm_aa_contract_d FOREIGN KEY (contract_code) REFERENCES public.dm_aa_contract_d(linked_appl_id);


--
-- Name: dm_atm_transaction fk_dm_atm_credit_acct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_atm_transaction
    ADD CONSTRAINT fk_dm_atm_credit_acct FOREIGN KEY (credit_acct_no) REFERENCES public.dm_account(account_seq_no);


--
-- Name: dm_atm_transaction fk_dm_atm_debit_acct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_atm_transaction
    ADD CONSTRAINT fk_dm_atm_debit_acct FOREIGN KEY (debit_acct_no) REFERENCES public.dm_account(account_seq_no);


--
-- Name: dm_atm_transaction fk_dm_atm_stmt_nos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_atm_transaction
    ADD CONSTRAINT fk_dm_atm_stmt_nos FOREIGN KEY (stmt_nos) REFERENCES public.dm_account_f(account_seq_no);


--
-- Name: dm_eb_queries_answers fk_eb_queries_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_eb_queries_answers
    ADD CONSTRAINT fk_eb_queries_customer FOREIGN KEY (customer_no) REFERENCES public.dm_customer(customer_code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: dm_gl_bal_crb_f fk_gl_crb_currency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_gl_bal_crb_f
    ADD CONSTRAINT fk_gl_crb_currency FOREIGN KEY (currency) REFERENCES public.dm_currency(currency_code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: dm_gl_bal_crb_f fk_gl_crb_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_gl_bal_crb_f
    ADD CONSTRAINT fk_gl_crb_customer FOREIGN KEY (customer_id) REFERENCES public.dm_customer(customer_code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: dm_pp_msgpaymenttyp fk_msgpaymenttyp_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_pp_msgpaymenttyp
    ADD CONSTRAINT fk_msgpaymenttyp_company FOREIGN KEY (co_code) REFERENCES public.dm_company(branch_code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: dm_pp_statuscode fk_pp_statuscode_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_pp_statuscode
    ADD CONSTRAINT fk_pp_statuscode_company FOREIGN KEY (co_code) REFERENCES public.dm_company(branch_code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: dm_stmt_entry fk_stmt_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_stmt_entry
    ADD CONSTRAINT fk_stmt_company FOREIGN KEY (company) REFERENCES public.dm_company(branch_code);


--
-- Name: dm_stmt_entry fk_stmt_currency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_stmt_entry
    ADD CONSTRAINT fk_stmt_currency FOREIGN KEY (currency) REFERENCES public.dm_currency(currency_code);


--
-- Name: dm_stmt_entry fk_stmt_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_stmt_entry
    ADD CONSTRAINT fk_stmt_customer FOREIGN KEY (customer) REFERENCES public.dm_customer(customer_code);


--
-- Name: dm_tph_por_details fk_tph_por_details_por; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dm_tph_por_details
    ADD CONSTRAINT fk_tph_por_details_por FOREIGN KEY (tph_por_id) REFERENCES public.dm_tph_por(tph_por_id);


--
-- PostgreSQL database dump complete
--

\unrestrict kSnAjnpbjrpG0bRHDy0NSzCiFxrnRDKlKsurUDwCaIPV5TdOJ7bMAmjlw4l2pao

