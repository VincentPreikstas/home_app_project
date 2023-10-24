CREATE TABLE hap.task (
task_name VARCHAR(255) UNIQUE NOT NULL,
task_desc VARCHAR(2000) NULL, 
task_id INT IDENTITY(10000,1) NOT NULL,
task_created_date DATETIME DEFAULT GETDATE() NOT NULL,
projected_days_to_complete_amount INT DEFAULT 7 NULL,
PRIMARY KEY(task_id)
);