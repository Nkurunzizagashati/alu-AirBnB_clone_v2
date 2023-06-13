-- create a database hebnb_test_db if it doesn't exist
CREATE DATABASE IF NOT EXISTS hebnb_test_db;

-- create a user 'hbnb_test'@'localhost' if doesn't exist already
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- grant all privileges on hbnb_test_db to 'hbnb_test'@'localhost'
GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';

-- grant SELECT privilege on performance_schema to 'hbnb_test'@'localhost'
GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';