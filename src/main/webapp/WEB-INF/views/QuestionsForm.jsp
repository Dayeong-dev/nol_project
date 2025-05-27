<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 질문 등록</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff7f7;
  --text-gray: #555;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background: #fff;
  color: #333;
  margin: 0;
  padding: 0 20px 40px;
}

h2 {
  text-align: center;
  color: var(--main-color);
  margin-top: 30px;
  margin-bottom: 20px;
  font-size: 26px;
}

form {
  max-width: 600px;
  margin: 0 auto;
  background: var(--bg-light);
  border-radius: 10px;
  padding: 25px 30px;
  box-shadow: 0 3px 6px rgba(0,0,0,0.1);
  display: flex;
  flex-direction: column;
  gap: 20px;
}

label {
  font-weight: bold;
  color: var(--main-color);
  margin-bottom: 6px;
  display: block;
  font-size: 14px;
}

select, input[type="text"], textarea {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 14px;
  resize: vertical;
  box-sizing: border-box;
}

input[type="submit"] {
  background-color: var(--main-color);
  color: white;
  font-weight: bold;
  border: none;
  border-radius: 20px;
  padding: 12px 0;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
  background-color: var(--hover-color);
}

.no-login-message {
  max-width: 600px;
  margin: 40px auto;
  color: var(--text-gray);
  font-size: 16px;
  text-align: center;
  font-style: italic;
}
</style>
</head>
<body>
<jsp:include page="fragments/header.jsp" />
<h2>QnA 질문 등록</h2>

<c:if test="${not empty sessionScope.id}">
  <form action="insertQuestion" method="post">
    <label for="category">카테고리</label>
    <select id="category" name="category" required>
      <option value="">-- 선택 --</option>
      <option value="일반">일반</option>
      <option value="계정">계정</option>
      <option value="서비스">서비스</option>
      <option value="기타">기타</option>
    </select>

    <label for="title">제목</label>
    <input id="title" type="text" name="title" required>

    <label for="content">내용</label>
    <textarea id="content" name="content" rows="6" required></textarea>

    <input type="submit" value="등록">
  </form>
</c:if>

<c:if test="${empty sessionScope.id}">
  <div class="no-login-message">
    로그인 후 질문 등록이 가능합니다.
  </div>
</c:if>

<jsp:include page="fragments/footer.jsp" />
</body>
</html>