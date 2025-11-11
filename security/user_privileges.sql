-- 읽기 전용 사용자 생성
CREATE USER 'readonly'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON practice_db.* TO 'readonly'@'localhost';

-- 테스트
mysql -u readonly -p
USE practice_db;
SELECT * FROM users; -- 성공
INSERT INTO users VALUES (...); -- 실패!

-- 특정 테이블만 접근
CREATE USER 'limited'@'localhost' IDENTIFIED BY 'password456';
GRANT SELECT, INSERT ON practice_db.orders TO 'limited'@'localhost';