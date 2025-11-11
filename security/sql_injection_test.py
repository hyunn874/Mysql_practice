# import mysql.connector


# # ❌ 취약한 코드
# def login_vulnerable(username, password):
#     conn = mysql.connector.connect(user="root", password="****", database="practice_db")
#     cursor = conn.cursor()

#     # 직접 문자열 결합 (위험!)
#     query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
#     cursor.execute(query)
#     return cursor.fetchone()


# # 공격 시도
# result = login_vulnerable("admin' OR '1'='1", "아무거나")
# # 결과: 로그인 성공! (모든 사용자 정보 노출)


# # ✅ 안전한 코드
# def login_safe(username, password):
#     conn = mysql.connector.connect(user="root", password="****", database="practice_db")
#     cursor = conn.cursor()

#     # 파라미터 바인딩 (안전!)
#     query = "SELECT * FROM users WHERE username=%s AND password=%s"
#     cursor.execute(query, (username, password))
#     return cursor.fetchone()


# # 공격 시도
# result = login_safe("admin' OR '1'='1", "아무거나")
# # 결과: 로그인 실패 (공격 차단)
