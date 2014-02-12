CREATE TABLE users (
 id INTEGER PRIMARY KEY,
 fname VARCHAR(255) NOT NULL,
 lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
 id INTEGER PRIMARY KEY,
 title TEXT NOT NULL,
 body TEXT NOT NULL,
 user_id INTEGER NOT NULL,
 FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_followers (
 id INTEGER PRIMARY KEY,
 question_id INTEGER NOT NULL,
 user_id INTEGER NOT NULL,
 FOREIGN KEY (question_id) REFERENCES questions(id),
 FOREIGN KEY (user_id) REFERENCES users(id)
);

 CREATE TABLE replies (
	 id INTEGER PRIMARY KEY,
	 question_id INTEGER NOT NULL,
	 parent_id INTEGER,
	 user_id INTEGER NOT NULL,
	 body TEXT NOT NULL,
   FOREIGN KEY (question_id) REFERENCES questions(id),
   FOREIGN KEY (parent_id) REFERENCES replies(id),
   FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tags (
	id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE question_tags (
	id INTEGER PRIMARY KEY,
	 question_id INTEGER NOT NULL,
	 tag_id INTEGER NOT NULL,
   FOREIGN KEY (question_id) REFERENCES questions(id),
   FOREIGN KEY (tag_id) REFERENCES tags(id)
);

INSERT INTO
	users (fname, lname)
VALUES
	('Alvin', 'Ang'), ('Chrissie', 'Deist'), ('Joe', 'Smoth');

INSERT INTO
	questions (title, body, user_id)
VALUES
	('What is your favorite subject?', 'Describe your favorite subject and why',
		(SELECT id FROM users WHERE fname = 'Chrissie')),
		('Favorite color?', 'Describe your favorite color and why',
			(SELECT id FROM users WHERE fname = 'Alvin')),
			('What is your favorite dog?', 'Describe your favorite dog and why',
				(SELECT id FROM users WHERE fname = 'Chrissie')),
				('Favorite move?', 'Describe your favorite move and why',
					(SELECT id FROM users WHERE fname = 'Alvin'));

INSERT INTO
	replies (question_id, parent_id, user_id, body)
VALUES
	((SELECT id FROM questions WHERE title='What is your favorite subject?'),
						NULL, (SELECT id FROM users WHERE fname='Alvin'), 'Ruby');

INSERT INTO
	question_followers(question_id, user_id)
VALUES
	((SELECT id FROM questions WHERE title='What is your favorite subject?'),
		(SELECT id FROM users WHERE fname='Alvin')),
	((SELECT id FROM questions WHERE title='What is your favorite dog?'),
		(SELECT id FROM users WHERE fname='Alvin')),
	((SELECT id FROM questions WHERE title='Favorite move?'),
		(SELECT id FROM users WHERE fname='Chrissie')),
	((SELECT id FROM questions WHERE title='What is your favorite dog?'),
		(SELECT id FROM users WHERE fname='Joe'));

 INSERT INTO
 	question_likes(question_id, user_id)
 VALUES
 	((SELECT id FROM questions WHERE title='What is your favorite subject?'),
 		(SELECT id FROM users WHERE fname='Alvin')),
	((SELECT id FROM questions WHERE title='What is your favorite dog?'),
	 		(SELECT id FROM users WHERE fname='Chrissie')),
		((SELECT id FROM questions WHERE title='What is your favorite dog?'),
		 		(SELECT id FROM users WHERE fname='Alvin')),
			((SELECT id FROM questions WHERE title='What is your favorite dog?'),
			 		(SELECT id FROM users WHERE fname='Joe')
 	 );

INSERT INTO
	tags(name)
VALUES
	('fun');

INSERT INTO
	question_tags(question_id, tag_id)
VALUES
	((SELECT id FROM questions WHERE title='Favorite move?'),
	(SELECT id FROM tags WHERE name="fun")),
	((SELECT id FROM questions WHERE title='What is your favorite dog?'),
	(SELECT id FROM tags WHERE name="fun")
	);
