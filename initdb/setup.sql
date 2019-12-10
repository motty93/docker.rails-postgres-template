-- must change your name and databasename, passward.
CREATE ROLE docker_rails LOGIN PASSWORD 'docker_rails';
CREATE DATABASE docker_rails;
GRANT ALL PRIVILEGES ON DATABASE docker_rails TO docker_rails;
ALTER ROLE docker_rails WITH CREATEROLE CREATEDB;
