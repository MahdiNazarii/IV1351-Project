INSERT INTO person (name, person_number)
VALUES
  ('Oliver Ellis', 199403151234),
  ('Cassandra Levy', 199404151234),
  ('Cade Levy', 199203151324),
  ('Chase Britt', 200403151234),
  ('Kirby Mcpherson', 199403151234);


INSERT INTO address (street,city,zip, person_id)
VALUES
  ('Ap #335-700 Sed Road','Borlänge','38477', 1),
  ('153-2547 Imperdiet, Av.','Kovel','21209', 2),
  ('415-1987 Ac Rd.','Ceuta','K1 2WD', 3),
  ('P.O. Box 412, 7917 Gravida Road','Lochgilphead','981840', 4),
  ('Ap #540-9335 In St.','Pocatello','447875', 5);

INSERT INTO phone_number (phone_number, person_id)
VALUES
  ('1-761-738-7608', 1),
  ('1-823-878-5272', 2),
  ('1-445-543-2492', 3),
  ('1-932-346-8165', 4),
  ('(579) 141-3366', 5);

INSERT INTO email (email, person_id)
VALUES
  ('ultricies.ornare@google.com', 1),
  ('quis.turpis.vitae@icloud.edu', 2),
  ('ac.turpis@outlook.com', 3),
  ('magna.a@icloud.net', 4),
  ('sit.amet@aol.org', 5);

INSERT INTO contact_person (person_id)
VALUES
  (2);


INSERT INTO student (person_id, contact_person_id)
VALUES
  (3, NULL),
  (4, 1),
  (5, 1);

INSERT INTO instructor (person_id)
VALUES
	(1);

INSERT INTO price_schema (price, skill_level, discount, instructor_payment, initial_time)
VALUES
(100, 'Beginner', 0.2, 50, NOW()),
(100, 'Intermediate', 0.2, 50, NOW()),
(200, 'Advanced', 0.2, 100, NOW());

INSERT INTO lesson (instructor_id, start_time, end_time, place, price_schema_id)
VALUES
	(1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '2 hours', 'room 301', 1),
	(1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '2 hours', 'room 302', 2),
	(1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '2 hours', 'room 303', 3);


INSERT INTO instrument_type(name, present_skill_id)
VALUES
	('guitar', NULL),
	('piano', NULL);

INSERT INTO individual_lesson(lesson_id, skill_level, instrument_type_id)
VALUES
	(1,'Beginner', 1);

INSERT INTO instrument_details (brand, price)
VALUES
	('Gibson', 420);

INSERT INTO ensemble_lesson(lesson_id, genre, minimum_of_students, maximum_of_students)
VALUES
	(2, 'Jazz', 5, 10);


INSERT INTO group_lesson(lesson_id, skill_level, minimum_of_students, maximum_of_students, instrument_type_id)
VALUES
	(3, 'Advanced', 5, 10, 2);
	
INSERT INTO instruments (instrument_type_id, instrument_details_id)
VALUES
	(1, 1);

INSERT INTO constraints_config (rule_id, constraint_value, constraint_description, start_time, end_time)
VALUES (1, 2, 'maximum rented instruments', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '12 months');
INSERT INTO rented_instrument (rental_start_time, rental_end_time, instrument_id, student_id, instrument_type_id, instrument_details_id, constraints_config_id)
VALUES (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '12 months', 1, 1, 1, 1, 1);

INSERT INTO instructor_instrument_type (instructor_id, instrument_type_id)
VALUES (1, 1),
	(1, 2);

INSERT INTO student_sibling (student_id_0, student_id_1)
VALUES(1, 2),
(2, 1);


INSERT INTO student_lesson(lesson_id, student_id)
VALUES
	(1, 1),
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 3);

UPDATE ensemble_lesson
SET minimum_of_students = '2'
WHERE minimum_of_students = '5';



UPDATE group_lesson
SET minimum_of_students = '2'
WHERE minimum_of_students = '5';


INSERT INTO instructor_availability (instructor_id, date, duration)
VALUES
(1, CURRENT_TIMESTAMP + INTERVAL '1 months', 60);