-- INNER JOIN: 주문한 사용자만
SELECT u.username, o.order_date, o.total_amount
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

-- LEFT JOIN: 주문 안 한 사용자 포함
SELECT u.username, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.username;

-- 3개 테이블 JOIN
SELECT 
  u.username,
  p.product_name,
  oi.quantity,
  oi.price
FROM users u
INNER JOIN orders o ON u.id = o.user_id
INNER JOIN order_items oi ON o.id = oi.order_id
INNER JOIN products p ON oi.product_id = p.id;
