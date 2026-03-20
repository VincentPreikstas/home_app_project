CREATE TABLE hap.recurring_date(
recurring_date_id INT IDENTITY(10000,1) NOT NULL,
recurring_date DATE UNIQUE DEFAULT CAST(GETDATE() AS DATE) NOT NULL,  
PRIMARY KEY (recurring_date_id)
);