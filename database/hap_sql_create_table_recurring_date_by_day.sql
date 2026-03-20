CREATE TABLE hap.recurring_date_by_day (
recurring_date_by_day_id INT IDENTITY (10000,1) NOT NULL,
task_id INT NOT NULL,
monday_flag BIT NOT NULL DEFAULT 0,
tuesday_flag BIT NOT NULL DEFAULT 0,
wednesday_flag BIT NOT NULL DEFAULT 0,
thursday_flag BIT NOT NULL DEFAULT 0,
friday_flag BIT NOT NULL DEFAULT 0,
saturday_flag BIT NOT NULL DEFAULT 0,
sunday_flag BIT NOT NULL DEFAULT 0,
week_skip_interval INT NULL DEFAULT NULL,
PRIMARY KEY(recurring_date_by_day_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id)
);