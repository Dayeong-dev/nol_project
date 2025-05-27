<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 QnA 목록</title>
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
  max-width: 1000px;
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

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  background: #fffafa;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

th, td {
  padding: 14px;
  text-align: center;
  border: 1px solid #ddd;
  font-size: 1rem;
}

th {
  background-color: #f8d7da;
  color: #a81e1e;
}

tr:nth-child(even) {
  background-color: #fdf2f2;
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
<jsp:include page="../fragments/header.jsp" />

<h2>답변 QnA 목록</h2>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
    </tr>
    <c:forEach var="q" items="${questions}">
    <tr>
        <td>${q.qno}</td>
        <td>${q.title}</td>
        <td>${q.memberName}</td>
        <td>${q.createDate}</td>
    </tr>
    </c:forEach>
</table>

<a href="${pageContext.request.contextPath}/admin">← 관리자 메인</a>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>