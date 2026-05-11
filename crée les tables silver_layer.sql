create table silver.account(
account_number INT,
account_name NVARCHAR(80),
account_type NVARCHAR(80),
currency NVARCHAR(80),
--dwh_create_date DATETIME2 DEFAULT GETDATE()
);


create table silver.account_mapping(
AccountNumber INT,
AccountName NVARCHAR(100) ,
PLLine NVARCHAR(100),
StatementType NVARCHAR(100),
SortOrder NVARCHAR(100),
Notes VARCHAR(100),
--dwh_create_date DATETIME2 DEFAULT GETDATE()
);

create table silver.store(
store_code Nvarchar(80),
country Nvarchar(80),
region Nvarchar (80),
-- dwh_create_date DATETIME2 DEFAULT GETDATE()
);

create table silver.store_master(
store_code NVARCHAR(100),
store_name NVARCHAR(100),
store_type NVARCHAR(100),
--dwh_create_date DATETIME2 DEFAULT GETDATE()
);
/* IF OBJECT_ID('silver.gl_transaction','U') IS NOT NULL */
/* DROP TABLE silver.gl_transaction;*/ 
create table silver.gl_trasaction(
transaction_id INT,
transaction_date DATE,
store_code NVARCHAR(100), 
account_number NVARCHAR(100),
amount_local float,
currency NVARCHAR(100),
document_number NVARCHAR(100),
description NVARCHAR(100),
--dwh_create_date DATETIME2 DEFAULT GETDATE()
);