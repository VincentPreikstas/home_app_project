CREATE TABLE hap.[user] (
[user_id] INT IDENTITY (100,1) NOT NULL,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
password_hash VARCHAR(255),
PRIMARY KEY ([user_id])
);