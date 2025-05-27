<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: #fff;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #333;
  max-width: 800px;
  margin: 30px auto;
  padding: 0 20px;
}

h2 {
  text-align: center;
  color: #d62828;
  margin-top: 30px;
  margin-bottom: 30px;
  font-size: 2rem;
}

form {
  display: flex;
  flex-direction: column;
  gap: 16px;
  background: #fffafa;
  padding: 24px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

form p {
  display: flex;
  flex-direction: column;
  font-size: 1rem;
  color: #444;
}

input[type="text"],
textarea,
select {
  padding: 10px 14px;
  font-size: 0.95rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  margin-top: 6px;
  background: #fafafa;
  transition: border 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus,
textarea:focus,
select:focus {
  border-color: #d62828;
  box-shadow: 0 0 6px rgba(214, 40, 40, 0.3);
  outline: none;
}

textarea {
  min-height: 120px;
  resize: vertical;
}

button {
  background-color: #d62828;
  color: white;
  font-weight: bold;
  padding: 10px;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #a81e1e;
}

a {
  display: inline-block;
  margin-top: 20px;
  color: #d62828;
  text-decoration: none;
  font-weight: bold;
}

a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
<jsp:include page="fragments/header.jsp" />

<h2>공지사항 등록</h2>
<form action="${pageContext.request.contextPath}/notice/insert" method="post">
    <p>
        <label>
            <input type="checkbox" name="isFixed" value="1"> 상단 고정
        </label>
    </p>
    <p>
        제목:
        <input type="text" name="title" required>
    </p>
    <p>
        내용:
        <textarea name="content" required></textarea>
    </p>
    <p>
        카테고리:
        <select name="category" required>
            <option value="">선택</option>
            <option value="공지">공지</option>
            <option value="이벤트">이벤트</option>
            <option value="점검">점검</option>
        </select>
    </p>
    <button type="submit">등록</button>
</form>

<a href="/notice/NoticeList">← 목록으로 돌아가기</a>

<jsp:include page="fragments/footer.jsp" />
</body>
</html>