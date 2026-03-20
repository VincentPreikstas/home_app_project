CREATE TABLE hap.date_ranges_for_recurring_date_by_day (
recurring_date_by_day_id INT NOT NULL,
the_start_date datetime NOT NULL,
the_end_date datetime NOT NULL,
FOREIGN KEY (recurring_date_by_day_id) REFERENCES hap.recurring_date_by_day(recurring_date_by_day_id)
);