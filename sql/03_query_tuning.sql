-- 🐌 느린 쿼리 (문제)
SELECT u.username, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at > '2024-01-01'
GROUP BY u.id
HAVING COUNT(o.id) > 5
ORDER BY order_count DESC;

작업:
□ EXPLAIN으로 문제점 찾기
□ 인덱스 추가: CREATE INDEX idx_created_at ON users(created_at);
□ 개선 후 다시 EXPLAIN
□ 실행 시간 전후 비교

-- ⚡ 개선된 쿼리
-- 필요 없는 LEFT JOIN을 INNER JOIN으로 변경
SELECT u.username, COUNT(o.id) as order_count
FROM users u
INNER JOIN orders o ON u.id = o.user_id
WHERE u.created_at > '2024-01-01'
GROUP BY u.id
HAVING order_count > 5
ORDER BY order_count DESC;