-- 인덱스 없을 때
EXPLAIN SELECT * FROM users WHERE email = 'user50000@example.com';

결과 분석:
□ type: ALL (전체 스캔) 확인
□ rows: 100000 (전체 검색) 확인
□ 실행 시간 측정

-- 인덱스 생성
CREATE INDEX idx_email ON users(email);

-- 인덱스 있을 때
EXPLAIN SELECT * FROM users WHERE email = 'user50000@example.com';