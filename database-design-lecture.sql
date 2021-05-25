USE codeup_test_db;

DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL DEFAULT 'NONE',
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO authors(first_name, last_name) VALUES
('Douglas', 'Adams'),
('Mark', 'Twain'),
('Kurt', 'Vonnegut');

CREATE TABLE quotes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    content TEXT NOT NULL,
    author_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES authors (id)
);

INSERT INTO quotes (author_id, content)
VALUES ((SELECT id FROM authors WHERE first_name = 'Douglas' AND last_name = 'Adams'),
        'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO quotes (author_id, content)
VALUES ((SELECT id FROM authors WHERE first_name = 'Douglas' AND last_name = 'Adams'),
        'Time is an illusion. Lunchtime doubly so.');
INSERT INTO quotes (author_id, content)
VALUES ((SELECT id FROM authors WHERE first_name = 'Mark' AND last_name = 'Twain'),
        'Clothes make the man. Naked people have little or no influence on society.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
        'The universe is a big place, perhaps the biggest.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');

# SELECT * FROM authors;
# SELECT * FROM quotes;

CREATE TABLE topics (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
('Space and Time'),
('Humor'),
('Office Life'),
('Hitchiker''s Guide to the Galaxy');

CREATE TABLE quote_topic (
     quote_id INTEGER UNSIGNED NOT NULL,
     topic_id INTEGER UNSIGNED NOT NULL,
     FOREIGN KEY (quote_id) REFERENCES quotes(id),
     FOREIGN KEY (topic_id) REFERENCES topics(id)
);

SELECT * FROM quote_topic;

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
       (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);

SELECT first_name, last_name, content, t.name FROM quotes
JOIN quote_topic qt ON quotes.id = qt.quote_id
JOIN topics t ON qt.topic_id = t.id
JOIN authors a ON quotes.author_id = a.id;

SELECT * FROM quote_topic ORDER BY topic_id;
SELECT * FROM quotes WHERE id = 1;
SELECT * FROM topics WHERE id IN (2, 3);

SELECT * FROM quote_topic
JOIN topics ON quote_topic.topic_id = topics.id
JOIN quotes ON quote_topic.quote_id = quotes.id
WHERE topic_id = 1;


# SELECT
#        authors.first_name,
#        authors.last_name,
#        quotes.content
# FROM quotes
# JOIN authors on quotes.author_id = authors.id;
#
# UPDATE authors SET first_name = 'Douglas' WHERE id = 1;
