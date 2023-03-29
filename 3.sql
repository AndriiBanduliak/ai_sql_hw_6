CREATE TABLE logs (
    id int(11) NOT NULL AUTO_INCREMENT,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    table_name varchar(255) NOT NULL,
    primary_key_id int(11) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE TRIGGER users_insert_trigger
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, primary_key_id) VALUES ('users', NEW.id);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER communities_insert_trigger
AFTER INSERT ON communities
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, primary_key_id) VALUES ('communities', NEW.id);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER messages_insert_trigger
AFTER INSERT ON messages
FOR EACH ROW
BEGIN
    INSERT INTO logs (table_name, primary_key_id) VALUES ('messages', NEW.id);
END$$
DELIMITER ;

