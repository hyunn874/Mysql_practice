-- 프로시저로 10만 건 삽입
DELIMITER //
CREATE PROCEDURE insert_dummy_users()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 100000 DO
    INSERT INTO users (username, email, created_at)
    VALUES (
      CONCAT('user', i),
      CONCAT('user', i, '@example.com'),
      NOW() - INTERVAL FLOOR(RAND() * 365) DAY
    );
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;

CALL insert_dummy_users();