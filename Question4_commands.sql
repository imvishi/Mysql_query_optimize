DROP DATABASE IF EXISTS user_article_schema;

CREATE DATABASE user_article_schema;

USE user_article_schema;


/*Create and populate users table*/

CREATE TABLE users(
    id int,
    name varchar(255),
    PRIMARY KEY (id)
    );
    
INSERT INTO users VALUES(1, "user1");
INSERT INTO users VALUES(2, "user2");
INSERT INTO users VALUES(3, "user3");

/*Create and populate article table*/

CREATE TABLE articles(
    id int,
    user_id int,
    title varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
    );
    
INSERT INTO articles VALUES(1,1, "article1");
INSERT INTO articles VALUES(2,1, "article2");
INSERT INTO articles VALUES(3,1, "article3");
INSERT INTO articles VALUES(4,1, "article4");
INSERT INTO articles VALUES(5,2, "article5");
INSERT INTO articles VALUES(6,2, "article6");


/*Explain plan when using join*/
EXPLAIN SELECT DISTINCT name from users INNER JOIN articles on users.id = articles.user_id;

/*Using empty select to print empty line between two queries result in command line to increase readability */
SELECT "";

/*Explain plan when using subquery*/
EXPLAIN SELECT name FROM users WHERE id IN (SELECT user_id FROM articles);
