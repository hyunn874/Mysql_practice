-- Atomicity (원자성) 테스트
START TRANSACTION;

UPDATE accounts SET balance = balance - 10000 WHERE user_id = 1;
UPDATE accounts SET balance = balance + 10000 WHERE user_id = 2;

-- 문제 발생 시뮬레이션
-- ROLLBACK; -- 모두 취소

COMMIT; -- 모두 실행
