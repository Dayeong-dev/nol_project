<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff5f5;
  --text-color: #333;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #fffdfd;
  color: var(--text-color);
}

h1 {
  text-align: center;
  margin: 40px 0 20px;
  color: var(--main-color);
  font-size: 28px;
}

.review-form-container {
  max-width: 600px;
  margin: 0 auto 60px;
  background-color: #fff;
  border: 2px solid var(--main-color);
  border-radius: 12px;
  padding: 30px;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
}

.review-form-container label {
  display: block;
  font-weight: bold;
  margin-bottom: 10px;
  font-size: 15px;
}

.review-form-container textarea {
  width: 100%;
  height: 280px;
  padding: 12px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 8px;
  resize: none; /* ✅ 사용자 조절 불가 */
  margin-bottom: 20px;
  box-sizing: border-box;
}

.review-form-container button {
  background-color: var(--main-color);
  color: white;
  border: none;
  padding: 10px 24px;
  font-size: 14px;
  border-radius: 8px;
  cursor: pointer;
  font-weight: bold;
  transition: background-color 0.2s ease;
}

.review-form-container button:hover {
  background-color: var(--hover-color);
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>

<h1>리뷰 작성</h1>

<div class="review-form-container">
  <form action="/reviewForm" method="post">
    <input type="hidden" name="rno" value="${rno}">
    
    <label for="content">리뷰 내용</label>
    <textarea name="content" required placeholder="내용을 입력해주세요..."></textarea>
    
    <button type="submit">리뷰 등록</button>
  </form>
</div>

<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
