-- creating a database if it doesn't exists
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;

-- create a user 'hbnb_dev'@'localhost' if s/he doesn't exists
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';

-- granting all previleges on hbnb_dev_db to 'hbnb_dev'@'localhost'
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';

-- granting SELECT previlege on performance_schema to 'hbnb_dev'@'localhost'
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';