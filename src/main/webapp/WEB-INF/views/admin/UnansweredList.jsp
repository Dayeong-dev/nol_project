<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미답변 QnA 목록</title>
<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>미답변 QnA 목록</h2>
			<table class="list-table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변 작성</th>
				</tr>
				<c:forEach var="q" items="${questions}">
				<tr>
					<td>${q.qno}</td>
					<td>${q.title}</td>
					<td>${q.memberName}</td>
					<td>${q.createDate}</td>
					<td>
						<a href="/admin/AnswersForm?qno=${q.qno}">답변 작성</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</section>
</body>
</html>