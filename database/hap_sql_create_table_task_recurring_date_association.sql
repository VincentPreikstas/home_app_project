CREATE TABLE hap.task_recurring_date_association(
task_id INT NOT NULL,
recurring_date_id INT NOT NULL,
PRIMARY KEY (task_id, recurring_date_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id),
FOREIGN KEY (recurring_date_id) REFERENCES hap.recurring_date(recurring_date_id)
);