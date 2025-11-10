-- 평균보다 비싼 상품
SELECT name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 가장 많이 주문한 사용자
SELECT username
FROM users
WHERE id = (
  SELECT user_id 
  FROM orders 
  GROUP BY user_id 
  ORDER BY COUNT(*) DESC 
  LIMIT 1
);

-- IN 사용
SELECT name
FROM products
WHERE id IN (
  SELECT product_id 
  FROM order_items 
  WHERE quantity > 5
);
