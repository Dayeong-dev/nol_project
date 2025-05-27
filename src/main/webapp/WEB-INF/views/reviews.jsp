<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<style>
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}

.wrapper {
  min-height: calc(100vh - 120px); 
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff7f7;
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

.review-table {
  width: 90%;
  max-width: 1000px;
  margin: 0 auto 60px;
  border-collapse: collapse;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

.review-table thead {
  background-color: var(--main-color);
  color: white;
}

.review-table th, .review-table td {
  padding: 14px;
  text-align: center;
  border: 1px solid #ddd;
  font-size: 14px;
}

.review-table tbody tr:nth-child(even) {
  background-color: #fdf2f2;
}

.review-table tbody tr:hover {
  background-color: #fff0f0;
  transition: background-color 0.3s ease;
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>

<div class="wrapper">
    <!-- 본문 내용 시작 -->
    <h1>리뷰 목록</h1>

    <table class="review-table">
      <thead>
        <tr>
          <th>번호</th>
          <th>리뷰 내용</th>
          <th>예매 번호</th>
          <th>작성일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="reviews" items="${list}">
          <tr>
            <td>${reviews.rvno}</td>
            <td>${reviews.content}</td>
            <td>${reviews.rno}</td>
            <td>${reviews.rvdate}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <!-- 본문 내용 끝 -->
</div>

<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>

</html>
