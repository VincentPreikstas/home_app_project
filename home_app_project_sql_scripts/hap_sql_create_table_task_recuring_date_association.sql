CREATE TABLE hap.task_recuring_date_association(
task_id INT NOT NULL,
recuring_date_id INT NOT NULL,
PRIMARY KEY (task_id, recuring_date_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id),
FOREIGN KEY (recuring_date_id) REFERENCES hap.recuring_date(recuring_date_id)
);