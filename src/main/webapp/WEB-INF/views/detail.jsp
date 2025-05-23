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
<c:forEach var="attrctn" items="${list }">
	<h1>${attrctn.name }</h1>
	<p>${attrctn.description }</p>
	<img src="${attrctn.imageURL }" alt="${attrctn.name }" width="300">
	<p>
		<c:choose>
			<c:when test="${attrctn.alevel == 1}">초급</c:when>
			<c:when test="${attrctn.alevel == 2}">중급</c:when>
			<c:when test="${attrctn.alevel == 3}">고급</c:when>
		</c:choose>
		/
		<c:choose>
			<c:when test="${attrctn.state == 1}">운행중</c:when>
			<c:otherwise>점검중</c:otherwise>
		</c:choose>
	</p>
</c:forEach>
<a href="attrctn">목록</a>
</body>
</html>









