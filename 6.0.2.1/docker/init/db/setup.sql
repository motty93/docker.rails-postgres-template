-- must change your name and databasename, passward.
CREATE ROLE docker_rails_6021 LOGIN PASSWORD 'docker_rails_6021';
CREATE DATABASE docker_rails_6021;
GRANT ALL PRIVILEGES ON DATABASE docker_rails_6021 TO docker_rails_6021;
ALTER ROLE docker_rails_6021 WITH CREATEROLE CREATEDB;
