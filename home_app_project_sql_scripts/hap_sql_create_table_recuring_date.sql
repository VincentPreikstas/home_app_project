CREATE TABLE hap.recuring_date(
recuring_date_id INT IDENTITY(10000,1) NOT NULL,
recuring_date DATE UNIQUE DEFAULT CAST(GETDATE() AS DATE) NOT NULL,  
PRIMARY KEY (recuring_date_id)
);