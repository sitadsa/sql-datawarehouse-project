/* 
====================================================
DDL Script - Create Bronze Tables
====================================================
Script Purpose: 
This script creates tables in the bronze schema, 
truncating the schema before the load.
=====================================================

*/


SELECT schema_name, schema_owner
FROM information_schema.schemata
WHERE schema_name = 'bronze';

DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date TIMESTAMP
);

CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key VARCHAR (50),
prd_nm VARCHAR (50),
prd_cost VARCHAR (50),
prd_line VARCHAR (50),
prd_start_dt TIMESTAMP,
prd_end_dt TIMESTAMP
);

CREATE TABLE bronze.crm_sales_details(
sls_ord_num VARCHAR (50),
sls_prd_key VARCHAR (50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);


ALTER TABLE bronze.crm_sales_details
ADD COLUMN sls_ship_dt INT;

CREATE TABLE bronze.erp_loc_a101(
cid VARCHAR (50),
cntry VARCHAR (50)
);

CREATE TABLE bronze.erp_cust_az12(
cid VARCHAR (50),
bgate DATE,
gen VARCHAR (50)
);

CREATE TABLE bronze.erp_px_cat_g1v2(
id VARCHAR (50),
cat VARCHAR (50),
subcat VARCHAR (50),
maintenance VARCHAR (50)
);

COPY bronze.crm_cust_info
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
DELIMITER ','
CSV HEADER;

SELECT  COUNT (*) FROM bronze.crm_cust_info;


COPY bronze.crm_prd_info
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.crm_prd_info;

TRUNCATE TABLE bronze.crm_sales_details;

COPY bronze.crm_sales_details
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.crm_sales_details;

SELECT  COUNT(*) FROM bronze.crm_sales_details;

DROP TABLE bronze.crm_sales_details; 


COPY bronze.erp_loc_a101
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.erp_loc_a101;

SELECT  COUNT(*) FROM bronze.erp_loc_a101;


COPY bronze.erp_cust_az12
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.erp_cust_az12;

SELECT  COUNT(*) FROM bronze.erp_cust_az12;

COPY bronze.erp_px_cat_g1v2
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.erp_px_cat_g1v2;

SELECT  COUNT(*) FROM bronze.erp_px_cat_g1v2;


/* Stored Procedure for load the data into the Bronze layer */
/* 
====================================================
DDL Script - Create Bronze Tables
====================================================
Script Purpose: 
This script creates tables in the bronze schema, 
truncating the schema before the load.
=====================================================

*/


SELECT schema_name, schema_owner
FROM information_schema.schemata
WHERE schema_name = 'bronze';

DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date TIMESTAMP
);

CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key VARCHAR (50),
prd_nm VARCHAR (50),
prd_cost VARCHAR (50),
prd_line VARCHAR (50),
prd_start_dt TIMESTAMP,
prd_end_dt TIMESTAMP
);

CREATE TABLE bronze.crm_sales_details(
sls_ord_num VARCHAR (50),
sls_prd_key VARCHAR (50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);


ALTER TABLE bronze.crm_sales_details
ADD COLUMN sls_ship_dt INT;

CREATE TABLE bronze.erp_loc_a101(
cid VARCHAR (50),
cntry VARCHAR (50)
);

CREATE TABLE bronze.erp_cust_az12(
cid VARCHAR (50),
bgate DATE,
gen VARCHAR (50)
);

CREATE TABLE bronze.erp_px_cat_g1v2(
id VARCHAR (50),
cat VARCHAR (50),
subcat VARCHAR (50),
maintenance VARCHAR (50)
);

COPY bronze.crm_cust_info
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
DELIMITER ','
CSV HEADER;

SELECT  COUNT (*) FROM bronze.crm_cust_info;


COPY bronze.crm_prd_info
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.crm_prd_info;

TRUNCATE TABLE bronze.crm_sales_details;

COPY bronze.crm_sales_details
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.crm_sales_details;

SELECT  COUNT(*) FROM bronze.crm_sales_details;

DROP TABLE bronze.crm_sales_details; 


COPY bronze.erp_loc_a101
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.erp_loc_a101;

SELECT  COUNT(*) FROM bronze.erp_loc_a101;


COPY bronze.erp_cust_az12
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.erp_cust_az12;

SELECT  COUNT(*) FROM bronze.erp_cust_az12;

COPY bronze.erp_px_cat_g1v2
FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
DELIMITER ','
CSV HEADER;

SELECT  * FROM bronze.erp_px_cat_g1v2;

SELECT  COUNT(*) FROM bronze.erp_px_cat_g1v2;


/* Stored Procedure for load the data into the Bronze layer */

CREATE OR REPLACE PROCEDURE bronze.load_bronze_layer()
LANGUAGE plpgsql
AS $$
BEGIN
    BEGIN
        -- Load crm_cust_info
        TRUNCATE TABLE bronze.crm_cust_info;

        COPY bronze.crm_cust_info
        FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
        DELIMITER ','
        CSV HEADER;

        RAISE NOTICE '=============== LOADING DATA FINISHED IN BRONZE LAYER: %', 'crm_cust_info';


        -- Load crm_prd_info
        TRUNCATE TABLE bronze.crm_prd_info;

        COPY bronze.crm_prd_info
        FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
        DELIMITER ','
        CSV HEADER;

        RAISE NOTICE '=============== LOADING DATA FINISHED IN BRONZE LAYER: %', 'crm_prd_info';


        -- Load crm_sales_details
        TRUNCATE TABLE bronze.crm_sales_details;

        COPY bronze.crm_sales_details
        FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
        DELIMITER ','
        CSV HEADER;

        RAISE NOTICE '=============== LOADING DATA FINISHED IN BRONZE LAYER: %', 'crm_sales_details';


        -- Load erp_loc_a101
        TRUNCATE TABLE bronze.erp_loc_a101;

        COPY bronze.erp_loc_a101
        FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
        DELIMITER ','
        CSV HEADER;

        RAISE NOTICE '=============== LOADING DATA FINISHED IN BRONZE LAYER: %', 'erp_loc_a101';


        -- Load erp_cust_az12
        TRUNCATE TABLE bronze.erp_cust_az12;

        COPY bronze.erp_cust_az12
        FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
        DELIMITER ','
        CSV HEADER;

        RAISE NOTICE '=============== LOADING DATA FINISHED IN BRONZE LAYER: %', 'erp_cust_az12';


        -- Load erp_px_cat_g1v2
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        COPY bronze.erp_px_cat_g1v2
        FROM '/Users/brajbhooshan/Desktop/SQL_BY_BARA/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
        DELIMITER ','
        CSV HEADER;

        RAISE NOTICE '=============== LOADING DATA FINISHED IN BRONZE LAYER: %', 'erp_px_cat_g1v2';

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'INSIDE THE EXCEPTION BLOCK: %', SQLERRM;
    END;
END;
$$;
