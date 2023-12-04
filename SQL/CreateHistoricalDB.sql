CREATE TABLE lesson_history (
 lesson_id INT NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 price INT NOT NULL,
 instrument VARCHAR(100),
 genre VARCHAR(100)
);

ALTER TABLE lesson_history ADD CONSTRAINT PK_lesson_history PRIMARY KEY (lesson_id);


CREATE TABLE student_history (
 student_id INT NOT NULL,
 email VARCHAR(100) NOT NULL,
 name VARCHAR(100) NOT NULL
);

ALTER TABLE student_history ADD CONSTRAINT PK_student_history PRIMARY KEY (student_id);


CREATE TABLE student_lesson_history (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_lesson_history ADD CONSTRAINT PK_student_lesson_history PRIMARY KEY (lesson_id,student_id);


ALTER TABLE student_lesson_history ADD CONSTRAINT FK_student_lesson_history_0 FOREIGN KEY (lesson_id) REFERENCES lesson_history (lesson_id);
ALTER TABLE student_lesson_history ADD CONSTRAINT FK_student_lesson_history_1 FOREIGN KEY (student_id) REFERENCES student_history (student_id);