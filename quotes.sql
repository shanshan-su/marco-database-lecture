-- create codeup test db if it doesn't exist and then use it
CREATE DATABASE IF NOT EXISTS codeup_test_db;
USE codeup_test_db;

-- create quotes table
CREATE TABLE IF NOT EXISTS quotes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    PRIMARY KEY (id)
);

-- try rto run a select on the quotes table
SELECT * FROM quotes;