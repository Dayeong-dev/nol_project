<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>리뷰</h1>
<hr>
<table border="1">
	<thead>
		<tr>
			<th>번호</th><th>리뷰내용</th><th>예매번호</th><th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="reviews" items="${list }">
			<td>${reviews.rvno }</td>
			<td>${reviews.content }</td>
			<td>${reviews.rno }</td>
			<td>${reviews.rvdate }</td>
		</c:forEach>
	</tbody>
</table>

</body>
</html>