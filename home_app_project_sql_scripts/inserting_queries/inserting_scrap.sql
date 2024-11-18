INSERT INTO calendar_objects.hap.tag (tag_name, tag_desc, user_id) 
VALUES ('', 'Has a cost in money', 
(SELECT [user_id] FROM calendar_objects.hap.[user] WHERE first_name = 'Vincent' AND last_name = 'Preikstas'))


INSERT INTO calendar_objects.hap.[user] (first_name, last_name, email_address, password_hash) VALUES ('Vincent', 'Preikstas', 'vincentpreikstas@gmail.com', 'SOMEPASSWORDHASH')