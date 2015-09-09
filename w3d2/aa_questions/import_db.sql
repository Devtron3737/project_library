DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER REFERENCES users(id) NOT NULL
);


DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) NOT NULL,
  question_id INTEGER REFERENCES questions(id) NOT NULL
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER REFERENCES questions(id) NOT NULL,
  parent_id INTEGER REFERENCES replies(id),
  user_id INTEGER REFERENCES users(id) NOT NULL,
  body TEXT NOT NULL
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER REFERENCES questions(id) NOT NULL,
  user_id INTEGER REFERENCES users(id) NOT NULL
);


INSERT INTO
  users(fname, lname)
VALUES
  ("Ned", "Starks");

INSERT INTO
  users(fname, lname)
VALUES
  ("Jon", "Snow");

INSERT INTO
  users(fname, lname)
VALUES
  ("Ami", "Hays");

INSERT INTO
  users(fname, lname)
VALUES
  ("Devin", "Miranda");

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("HEY", "hiya", (SELECT id FROM users WHERE fname = 'Ned'));

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("q2", "q2body", (SELECT id FROM users WHERE fname = 'Jon'));

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("q3", "q3body", (SELECT id FROM users WHERE fname = 'Ami'));

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("q4", "q4body", (SELECT id FROM users WHERE fname = 'Devin'));

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("q5", "q5body", (SELECT id FROM users WHERE fname = 'Ned'));

INSERT INTO
  questions(title, body, user_id)
VALUES
  ("q6", "q6body", (SELECT id FROM users WHERE fname = 'Ned'));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Ned"),(SELECT id FROM questions WHERE title = "HEY"));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Ami"),(SELECT id FROM questions WHERE title = "HEY"));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Devin"),(SELECT id FROM questions WHERE title = "q4"));

INSERT INTO
  replies(question_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "HEY"),(SELECT id FROM users WHERE fname = "Ned"), 'this is the answer');

INSERT INTO
  replies(question_id, parent_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "HEY"),(SELECT id FROM replies WHERE body = "this is the answer"),(SELECT id FROM users WHERE fname = "Jon"), "answer's answer");

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = "HEY"),(SELECT id FROM users WHERE fname = "Jon"));

  INSERT INTO
    question_likes(question_id, user_id)
  VALUES
    ((SELECT id FROM questions WHERE title = "q4"),(SELECT id FROM users WHERE fname = "Devin"));

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = "q4"),(SELECT id FROM users WHERE fname = "Ami"));

INSERT INTO
  question_likes(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = "HEY"),(SELECT id FROM users WHERE fname = "Ami"));

  INSERT INTO
    question_likes(question_id, user_id)
  VALUES
    ((SELECT id FROM questions WHERE title = "q5"),(SELECT id FROM users WHERE fname = "Ami"));

    INSERT INTO
      question_likes(question_id, user_id)
    VALUES
      ((SELECT id FROM questions WHERE title = "q6"),(SELECT id FROM users WHERE fname = "Devin"));
