PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  question_author_id INTEGER NOT NULL,

  FOREIGN KEY (question_author_id) REFERENCES users(id)--(?)
);

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY, --(?)
  user_id INTEGER NOT NULL, -- primary in users table
  question_id INTEGER NOT NULL, -- #primary in questions table
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY, --(?)
  question_id INTEGER NOT NULL, 
  parent_reply_id INTEGER, -- 
  reply_author_id INTEGER NULL, -- user who wrote the reply
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),--(?)
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),--(?) ???
  FOREIGN KEY (reply_author_id) REFERENCES users(id)--(?)
);

CREATE TABLE questions_likes ( 
  id INTEGER PRIMARY KEY, --(?)
  question_id INTEGER NOT NULL, -- or reply id?
  user_id INTEGER NOT NULL, -- user who liked
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);




INSERT INTO
  users (fname, lname)
VALUES
  ('Arthur', 'Miller'), --1
  ('Eugene O', 'Neil'), --2
  ('jill', 'bruh'), --3
  ('Professor', 'Farnsworth'), --4
  ('Nibbler', 'Intergalactic dog'), --5

  --Followers
  ('Dude', 'A'), --6
  ('Dudette', 'B'); --7

INSERT INTO
  questions (title, body, question_author_id)
VALUES
  ('How do I breathe air', 'I dont get how to breathe, please help ASAP Im running out of ai-', 1),
  ('is it wednsday my dudes', 'yes or no please help', 2),
  ('Am I pregnante??!?', 'pls help my dad will kill me', 3),
  ('order corn', 'order corn', 4),
  ('how do i *arguably questionable censorship*', 'this isnt google undo undo', 5),
  ('order cornn', 'order cornn', 4),
  ('test', 'testing', 3);

INSERT INTO
questions_follows (user_id, question_id)
VALUES
(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(3,3),
(4,3),
(1,1),
(2,2),
(4,4),
(6,5),
(7,5),
(3,5),
(4,5),
(2,5);

INSERT INTO
  replies(question_id, parent_reply_id, reply_author_id, body)
VALUES
  (1, NULL, 7, 'You good bro?'), --1
  (1, 1, 6, 'Nah he dead'), --2 is replying to reply 1
  (1, 2, 7, 'RIP'), --3
  (1, 3, 6, 'We couldve saved him but we failed..'), --4
  (1, 1, 5, 'Yea! thanks for asking woof'), --5
  (1, NULL, 4, 'Sit up straight. And take a big inhale fill all the way up and the next deep breath in and exhale..'), --1
  (1, 6, 3, 'Hi professor can you answer the question I just asked???!'),
  (2, NULL, 6, 'yes'),
  (2, NULL, 7, 'im from india so no'),
  (3, NULL, 4, 'yeah u dun goofed'),
  (3, NULL, 5, 'woof'),
  (4, NULL, 4, 'order corn');


INSERT INTO
questions_likes (user_id, question_id)
VALUES
(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(6,3),
(7,2),
(3,3),
(2,1),
(1,2),
(6,2),
(4,4),
(2,2),
(1,6),
(2,6),
(3,6),
(4,6),
(6,1);
