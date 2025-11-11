// ✅ 데이터베이스 선택 또는 생성

// < 중요 > use blog_db;

// ✅ posts 컬렉션에 문서 삽입
db.posts.insertOne({
  title: "첫 번째 글",
  content: "내용입니다",
  tags: ["DB", "NoSQL"],
  author: {
    name: "김개발",
    email: "kim@example.com"
  },
  createdAt: new Date()
});

// ✅ 전체 문서 조회
db.posts.find();

// ✅ 특정 태그("DB")가 포함된 문서 조회
db.posts.find({ tags: "DB" });

// ✅ 중첩 객체(author.name)가 일치하는 문서 조회
db.posts.find({ "author.name": "김개발" });
