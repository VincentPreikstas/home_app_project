CREATE TABLE hap.expense (
expense_id INT IDENTITY(10000,1) NOT NULL,
expense_amount MONEY NOT NULL DEFAULT 0,
expense_description VARCHAR(2000) NULL,
expense_source_or_vender VARCHAR(255) NULL,
expense_source_uri VARCHAR(1000) NULL
PRIMARY KEY(expense_id)
);