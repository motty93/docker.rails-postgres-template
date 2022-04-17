-- must change your name and databasename, passward.
CREATE ROLE rails7 LOGIN PASSWORD 'rails7';
CREATE DATABASE rails7;
GRANT ALL PRIVILEGES ON DATABASE rails7 TO rails7;
ALTER ROLE rails7 WITH CREATEROLE CREATEDB;
