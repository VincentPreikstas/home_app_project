CREATE TABLE hap.task_expense_association (
expense_id INT NOT NULL,
task_id INT NOT NULL,
single_cost_bool BIT NOT NULL DEFAULT 0,
cost_every_occurance_bool BIT NOT NULL DEFAULT 0,
cost_specific_num INT NULL DEFAULT NULL,
PRIMARY KEY (expense_id, task_id),
FOREIGN KEY (expense_id) REFERENCES hap.expense(expense_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id)
);