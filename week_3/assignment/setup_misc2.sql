CREATE DATABASE IF NOT EXISTS misc2;
USE misc2;

CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(128),
    email VARCHAR(128),
    password VARCHAR(128),
    PRIMARY KEY (user_id),
    UNIQUE (email)
);

CREATE TABLE Profile (
    profile_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    headline VARCHAR(255),
    summary TEXT,
    PRIMARY KEY (profile_id),
    KEY (user_id),
    CONSTRAINT fk_profile_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE Position (
    position_id INT NOT NULL AUTO_INCREMENT,
    profile_id INT NOT NULL,
    rank INT,
    year INT,
    description TEXT,
    PRIMARY KEY (position_id),
    KEY (profile_id),
    CONSTRAINT fk_position_profile FOREIGN KEY (profile_id) REFERENCES Profile(profile_id)
);

INSERT INTO users (name, email, password)
VALUES ('Chuck Severance', 'csev@umich.edu', '1a52e17fa899cf40fb04cfc42e6352f1');

SELECT 'Database misc2 is ready.' AS status;
