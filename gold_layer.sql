IF OBJECT_ID('gold.store', 'V') IS NOT NULL
    DROP VIEW gold.store;
GO

CREATE VIEW gold.store AS
SELECT
    ROW_NUMBER() OVER (ORDER BY s.store_code) AS store_key,
    s.store_code,
    s.country,
    s.region,
    sm.store_name,
    sm.store_type
FROM silver.store s
LEFT JOIN silver.store_master sm
    ON s.store_code = sm.store_code;
GO
-----------------------------------------------------
-----------------------------------------------------
IF OBJECT_ID('gold.account', 'V') IS NOT NULL
    DROP VIEW gold.account;
GO
CREATE VIEW gold.account AS
SELECT
    ROW_NUMBER() OVER (ORDER BY a.account_number) AS account_key,
    a.account_number,
    a.account_name,
    m.plline,
    m.statementtype,
    m.sortorder
FROM silver.account a
LEFT JOIN silver.account_mapping m
    ON a.account_number = m.accountnumber;
GO
---------------------------------------------------
---------------------------------------------------
IF OBJECT_ID('gold.gl_transaction', 'V') IS NOT NULL
    DROP VIEW gold.gl_transaction;
GO

CREATE VIEW gold.gl_transaction AS
SELECT
    transaction_id,
    transaction_date,
    store_key,
    account_key,
    amount_local,
    currency,
    document_number,
    description
FROM silver.gl_transaction t
LEFT JOIN gold.store s
    ON t.store_code = s.store_code
LEFT JOIN gold.account ac
    ON t.account_number = ac.account_number;
GO
-----------------------------------------------------
-----------------------------------------------------
IF OBJECT_ID('gold.pnl', 'V') IS NOT NULL
    DROP VIEW gold.pnl;
GO

CREATE VIEW gold.pnl AS
SELECT
    CASE 
        WHEN da.pl_line IN ('Admin Costs', 'Marketing', 'Salaries & Wages', 'Rent Expense')
            THEN 'Operating Expenses'
        ELSE da.pl_line
    END AS pl_line,
    SUM(f.amount_local) AS total_amount
FROM gold.fact_gl f
LEFT JOIN gold.dim_account da
    ON f.account_key = da.account_key
WHERE da.statement_type = 'P&L'
  AND da.pl_line IS NOT NULL
GROUP BY 
    CASE 
        WHEN da.pl_line IN ('Admin Costs', 'Marketing', 'Salaries & Wages', 'Rent Expense')
            THEN 'Operating Expenses'
        ELSE da.pl_line
    END;
GO

IF OBJECT_ID('gold.pnl_final', 'V') IS NOT NULL
    DROP VIEW gold.pnl_final;
GO

CREATE VIEW gold.pnl_final AS
SELECT * FROM gold.pnl

UNION ALL

SELECT
    'PROFIT' AS pl_line,
    SUM(total_amount)
FROM gold.pnl;
GO

SELECT * FROM gold.pnl;
SELECT * FROM gold.pnl_final;