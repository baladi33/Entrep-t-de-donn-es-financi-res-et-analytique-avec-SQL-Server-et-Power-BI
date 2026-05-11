create table bronze.account(
account_number INT,
account_name NVARCHAR(80),
account_type NVARCHAR(80),
currency NVARCHAR(80)
);


create table bronze.account_mapping(
AccountNumber INT,
AccountName NVARCHAR(100) ,
PLLine NVARCHAR(100),
StatementType NVARCHAR(100),
SortOrder NVARCHAR(100),
Notes VARCHAR(100)
);
--SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

create table bronze.store(
store_code Nvarchar(80),
country Nvarchar(80),
region Nvarchar (80)
);

create table bronze.store_master(
store_code NVARCHAR(100),
store_name NVARCHAR(100),
store_type NVARCHAR(100)
);
/* IF OBJECT_ID('bronze.gl_transaction','U') IS NOT NULL */
/* DROP TABLE bronze.gl_transaction;*/ 
create table bronze.gl_transaction(
transaction_id INT,
transaction_date DATE,
store_code NVARCHAR(100), 
account_number NVARCHAR(100),
amount_local NVARCHAR(100),
currency NVARCHAR(100),
document_number NVARCHAR(100),
description NVARCHAR(100)
);