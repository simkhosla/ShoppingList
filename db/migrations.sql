CREATE DATABASE shoppinglistapp;
\c bee_crypt
CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255), is_admin BOOLEAN);
CREATE TABLE items (id SERIAL PRIMARY KEY, itemtext VARCHAR(255), quantity INTEGER);

\dt
