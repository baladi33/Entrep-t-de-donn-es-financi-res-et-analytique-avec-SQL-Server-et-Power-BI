CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    BEGIN TRY 
print '========================================';
print 'Loading Bronze Layer';
print '========================================';

print '>> Loading Table : bronze.account';
TRUNCATE TABLE bronze.account;
BULK INSERT bronze.account
from 'C:\Users\USER\Desktop\Data Warehouse\account.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
select * from bronze.account

print '>> Loading Table : bronze.account_mapping';
truncate table bronze.account_mapping;
bulk insert bronze.account_mapping
from 'C:\Users\USER\Desktop\Data Warehouse\account_mapping.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
select * from bronze.account_mapping

print '>> Loading Table : bronze.store';
TRUNCATE TABLE bronze.store;
BULK INSERT BRONZE.store
FROM 'C:\Users\USER\Desktop\Data Warehouse\store.csv'
WITH(
   FIRSTROW = 2,
   FIELDTERMINATOR = ',',
   TABLOCK
  );
  SELECT * FROM BRONZE.STORE


TRUNCATE TABLE bronze.store_master;
BULK INSERT bronze.store_master
FROM 'C:\Users\USER\Desktop\Data Warehouse\store_master.csv'
WITH(
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  TABLOCK
);
select * from bronze.store_master


TRUNCATE TABLE bronze.gl_transaction;
bulk insert bronze.gl_transaction
from 'C:\Users\USER\Desktop\Data Warehouse\transaction.csv'
with(
  firstrow = 2,
  fieldterminator = ',',
  tablock
);
select * from bronze.gl_transaction
select count(*) from bronze.gl_transaction
   end try
   BEGIN CATCH
      PRINT '=================================='
      PRINT 'erreur loading bronze layer'
      PRINT '=================================='
   END CATCH
END 
exec bronze.load_bronze;