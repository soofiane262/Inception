CREATE DATABASE IF NOT EXISTS wp;
GRANT ALL PRIVILEGES ON wp.* TO 'souf'@'%' IDENTIFIED BY 'souf123';
GRANT ALL PRIVILEGES ON *.* TO 'root'@localhost IDENTIFIED BY 'root123';
FLUSH PRIVILEGES;