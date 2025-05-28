<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
/*
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff5f5;
  --text-color: #333;
}
*/
.rv-form-section {
	max-width: 800px;
 	margin: 0 auto;
}
h1 {
	font-size: 26px;
	text-align: center;
	color: #c62828;
	margin-bottom: 40px;
}
.review-form-container {
	border: 2px solid #c62828;
	border-radius: 10px;
	padding: 20px;
	background-color: #fff;
	margin-left: 15px;
}
.review-form-container label {
  display: block;
  font-weight: bold;
  color: #333;
  margin-bottom: 8px;
}
.review-form-container textarea {
  width: 100%;
  height: 280px;
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 12px;
  font-size: 15px;
  resize: vertical;
  box-sizing: border-box;
  margin-bottom: 20px;
}

.review-form-container button {
  background-color: #d32f2f;
  color: white;
  border: none;
  padding: 10px 18px;
  border-radius: 6px;
  font-size: 15px;
  cursor: pointer;
  transition: filter 0.2s ease;
}
.review-form-container button:hover {
  filter: brightness(85%);
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>
<section class="rv-form-section">
<h1>리뷰 작성</h1>
	<div class="review-form-container">
	  <form action="/reviewForm" method="post">
	    <input type="hidden" name="rno" value="${rno}">
	    
	    <label for="content">리뷰 내용</label>
	    <textarea name="content" required placeholder="내용을 입력해주세요..."></textarea>
	    
	    <button type="submit">리뷰 등록</button>
	  </form>
	</div>
</section>
<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
