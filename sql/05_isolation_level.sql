-- 세션 A
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
SELECT balance FROM accounts WHERE user_id = 1; -- 10000원

-- 세션 B
START TRANSACTION;
UPDATE accounts SET balance = 5000 WHERE user_id = 1;
-- 아직 COMMIT 안 함!

-- 세션 A (다시)
SELECT balance FROM accounts WHERE user_id = 1; -- 5000원 보임 (Dirty Read!)

-- 세션 B
ROLLBACK;

-- 세션 A (다시)
SELECT balance FROM accounts WHERE user_id = 1; -- 10000원으로 돌아옴