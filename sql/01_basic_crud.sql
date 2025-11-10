-- 1. CREATE
INSERT INTO users (username, email) 
VALUES ('kim123', 'kim@example.com');

-- 2. READ
SELECT * FROM users WHERE username = 'kim123';

-- 3. UPDATE
UPDATE users SET email = 'newemail@example.com' 
WHERE username = 'kim123';

-- 4. DELETE
DELETE FROM users WHERE username = 'kim123';