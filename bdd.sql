-- DROP TABLE account cascade;

/*======================= LES TABLES ===================*/
CREATE TABLE account (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    tel VARCHAR(50) NOT NULL,
    user_name VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);

/* ------------- remarque pour l'auto-increment --------*/
/* CREATE TABLE account (
    id SERIAL,          SERIAL -> raccourci de INT GENERATED ALWAYS AS IDENTITY

    également                   Raccourci pour la PRIMARY KEY
    id SERIAL PRIMARY KEY,      tout en UNE ligne
    */

-- DROP TABLE follower cascade;
CREATE TABLE follower (
    id SERIAL PRIMARY KEY,
    notification bool DEFAULT false
);

-- DROP TABLE "group" cascade;
CREATE TABLE "group" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(155),
    visibility VARCHAR(50) DEFAULT 'private'
);

-- DROP TABLE post cascade;
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    account_id INT REFERENCES account (id),  /* défini la clé étrangère vers account  */
    group_id INT REFERENCES "group" (id),
    date TIMESTAMP NOT NULL,
    parent_post INT
);

/* ------ Remarque : Raccourci pour définir la clé étrangère ---------------*/
/*------- au lieu de :
    PRIMARY KEY(id),
        CONSTRAINT fk_account
        FOREIGN KEY(account_id)
        REFERENCES account(id)

-------- mettre :
    account INT REFERENCES account (id),
*/

-- DROP TABLE attachment;
CREATE TABLE attachment ( 
    id SERIAL PRIMARY KEY,
    image VARCHAR(500),
    link VARCHAR(500),
    document VARCHAR(500),
    post_id INT REFERENCES post (id)
);





/* ================= LES TABLES INTERMEDIAIRES ===============*/

-- DROP TABLE "like" cascade;
CREATE TABLE "like" ( 
account_id INT NOT NULL REFERENCES account(id),
post_id INT NOT NULL REFERENCES post(id)
);

-- DROP TABLE share cascade;
CREATE TABLE share (
    group_id INT NOT NULL REFERENCES "group" (id),
    account_id INT NOT NULL REFERENCES account (id),
    role VARCHAR(50) NOT NULL DEFAULT 'visitor',
    PRIMARY KEY (account_id, group_id)
);




































