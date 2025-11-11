-- 세션 A
START TRANSACTION;
SELECT * FROM products WHERE id = 1 FOR UPDATE; -- 행 잠금

-- 세션 B
UPDATE products SET stock = stock - 1 WHERE id = 1; -- 대기 중...

-- 세션 A
COMMIT; -- 잠금 해제

-- 세션 B
-- 이제 UPDATE 실행됨!