CREATE TABLE hap.single_date (
task_id INT NOT NULL,
single_date_created_date DATETIME DEFAULT GETDATE() NOT NULL,
[status] VARCHAR (255) NOT NULL DEFAULT 'incomplete',
scheduled_date DATE NOT NULL,
FOREIGN KEY (task_id) REFERENCES hap.task(task_id)
);