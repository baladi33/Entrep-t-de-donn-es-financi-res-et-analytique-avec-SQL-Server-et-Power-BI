-----------2. Transformation
insert into [silver].[account] 
    select distinct 
        account_number,
        Upper(Trim(account_name)),
        Upper(Trim(account_type)),
        Upper(Trim(currency))
    from [bronze].[account]  
    where account_number is not null
select * from silver.account
-------________________________________------------
insert into [silver].[account_mapping] 
    select distinct 
        AccountNumber,
        Upper(Trim(AccountName)),
        Upper(Trim(PLLine)),
        case 
            when Trim([StatementType]) = 'P L' then 'P&L'
            else Upper(Trim([StatementType]))
        end as [StatementType],
        cast(cast(SortOrder as float) as int),
        Trim(Notes)    
    from [bronze].[account_mapping]  
-------___________________________________-------------
insert into [silver].[store]
    select distinct
        Upper(Trim(store_code)),
        Upper(Trim(country)),
        Upper(Trim(region))
    from [bronze].[store];
-------_________________________________-------------
insert into [silver].[gl_trasaction]
select distinct 
    transaction_id,
    Cast(transaction_date AS DATE),
    Upper(Trim(store_code)),
    Cast(account_number AS float),
    amount_local,
    Upper(Trim(currency)),
    Trim(document_number),
    Trim([description])
from [bronze].[gl_transaction]
where transaction_id IS NOT NULL;
-------_____________________________--------------
insert into [silver].[store_master]
    select distinct
        Upper(Trim(store_code)),
        Upper(Trim(store_name)),
        Upper(Trim(store_type))
    from [bronze].[store_master];
   