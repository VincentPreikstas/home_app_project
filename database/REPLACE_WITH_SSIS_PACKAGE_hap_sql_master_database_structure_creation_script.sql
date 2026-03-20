-- hap master database structure creation script


--Create schema
CREATE SCHEMA hap
GO


--Create user table. This table stores user information in order to control what belongs
--to who
CREATE TABLE hap.[user] (
[user_id] INT IDENTITY (100,1) NOT NULL,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
password_hash VARCHAR(255),
PRIMARY KEY ([user_id])
);


--Create task. This table stores the basic information about a task
CREATE TABLE hap.task (
task_name VARCHAR(255) UNIQUE NOT NULL,
task_desc VARCHAR(2000) NULL, 
task_id INT IDENTITY(10000,1) NOT NULL,
task_estimated_cost MONEY NOT NULL DEFAULT 0,
[user_id] INT NOT NULL,
task_created_date DATETIME DEFAULT GETDATE() NOT NULL,
projected_days_to_complete_amount INT DEFAULT 7 NULL,
PRIMARY KEY(task_id),
FOREIGN KEY([user_id]) REFERENCES hap.[user]([user_id])
);


--Create tag. This table stores info about tags which can then be associated
--with a task and allow for easy grouping of tasks by tags
CREATE TABLE hap.tag (
tag_name VARCHAR(255) UNIQUE NOT NULL,
tag_desc VARCHAR(2000) NULL,
tag_id INT IDENTITY(10000,1) NOT NULL,
[user_id] INT NOT NULL,
tag_created_date DATETIME DEFAULT GETDATE() NOT NULL,
PRIMARY KEY(tag_id),
FOREIGN KEY([user_id]) REFERENCES hap.[user]([user_id])
);


--Create task_tag_association. This table is the bridge between task and tag and
--records that there is an association
CREATE TABLE hap.task_tag_association (
tag_id INT NOT NULL,
task_id INT NOT NULL,
PRIMARY KEY (tag_id, task_id),
FOREIGN KEY (tag_id) REFERENCES hap.tag(tag_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id)
);


--Create single date. This table is for storing task dates that are not recuring
--It will also hold instances of all other task dates that will be updated periodically
CREATE TABLE hap.single_date (
task_id INT NOT NULL,
single_date_created_date DATETIME DEFAULT GETDATE() NOT NULL,
[status] VARCHAR (255) NOT NULL DEFAULT 'incomplete',
scheduled_date DATE NOT NULL,
FOREIGN KEY (task_id) REFERENCES hap.task(task_id)
);


--Create recurring date. This is a single date that can be assigned to a task
--the same recurring date is used for any number of tasks 
CREATE TABLE hap.recurring_date(
recurring_date_id INT IDENTITY(10000,1) NOT NULL,
recurring_date DATE UNIQUE DEFAULT CAST(GETDATE() AS DATE) NOT NULL,  
PRIMARY KEY (recurring_date_id)
);


--Create task_recurring_date_association. This table associates a task with a given
--recurring date meaning it should happen whenever that date happens. Can have multiple
--dates for a given task and multiple tasks for a given date.
CREATE TABLE hap.task_recurring_date_association(
task_id INT NOT NULL,
recurring_date_id INT NOT NULL,
PRIMARY KEY (task_id, recurring_date_id),
FOREIGN KEY (task_id) REFERENCES hap.task(task_id),
FOREIGN KEY (recurring_date_id) REFERENCES hap.recurring_date(recurring_date_id)
);


--Create recurring_date_by_day. This table stores a week template that is assigned
--to a task which dictates what repetitive days that task should happen on. It allows
--for assigning a week skip interval. 2 being every two weeks, 3 every 3 weeks, etc.
--This is then referencesed in date_ranges_for_recurring_date_by_day for the actual
--period this rule should be active for
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


--Create date_ranges_for_recurring_date_by_day. This table one or more date
--range(s) for a given recurring_date_by_day instance. In general these should not
--overlap for the same date_by_day 
CREATE TABLE hap.date_ranges_for_recurring_date_by_day (
recurring_date_by_day_id INT NOT NULL,
the_start_date datetime NOT NULL,
the_end_date datetime NOT NULL,
FOREIGN KEY (recurring_date_by_day_id) REFERENCES hap.recurring_date_by_day(recurring_date_by_day_id)
);




--Creating indexes
CREATE INDEX user_id_index_task_table
ON hap.task([user_id])
CREATE INDEX user_id_task_id_index_task_table
ON hap.task([user_id], task_id)


CREATE INDEX user_id_index_tag_table
ON hap.tag([user_id])
CREATE INDEX user_id_tag_id_index_tag_table
ON hap.tag([user_id], tag_id)


CREATE INDEX task_id_index_task_tag_association_table
ON hap.task_tag_association (task_id)
CREATE INDEX tag_id_index_task_tag_association_table
ON hap.task_tag_association (tag_id)


CREATE INDEX task_id_index_single_date_table
ON hap.single_date(task_id)
CREATE INDEX scheduled_date_index_single_date_table
ON hap.single_date(scheduled_date)


CREATE INDEX task_id_task_recurring_date_association_table
ON hap.task_recurring_date_association(task_id)


CREATE INDEX recurring_date_by_day_id_index_date_ranges_for_recurring_date_by_day_table
ON hap.date_ranges_for_recurring_date_by_day (recurring_date_by_day_id)
CREATE INDEX the_start_date_index_date_ranges_for_recurring_date_by_day_table
ON hap.date_ranges_for_recurring_date_by_day (the_start_date)
CREATE INDEX the_end_date_index_date_ranges_for_recurring_date_by_day_table
ON hap.date_ranges_for_recurring_date_by_day (the_end_date)