CREATE TABLE hap.task_tag_association (
tag_id INT NOT NULL,
task_id INT NOT NULL,
PRIMARY KEY (tag_id, task_id),
FOREIGN KEY (tag_id) REFERENCES hap.tag(tag_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id)
);

