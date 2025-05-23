<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	* {
		padding: 0;
		
	}

	li {
		list-style-type: none;
	}
	
	a{
		text-decoration: none;
	}

	ul {
		display: flex;
		gap: 20px;
	}
</style>
<body>
<!-- 다중검색기능 -->	
<h1>어트랙션 페이지</h1>
<p>언제나 새롭고 즐거운 경험을 주는 어트랙션을 소개합니다!</p>
<hr>
<form action="attrctn" method="get">
	<select name="alevel">
		<option value="">난이도 선택</option>
		<option value="1">초급</option>
		<option value="2">중급</option>
		<option value="3">고급</option>
	</select>
	<input type="text" name="name" placeholder="어트랙션 이름을 입력">
	<input type="submit" value="검색">
</form>
<ul>
	<c:forEach var="attrctn" items="${list }">
		<li>
			<a href="detail?atno=${attrctn.atno }">
				<img src="${attrctn.imageURL }" alt="어트랙션 이미지" width="250">
			<h2>${attrctn.name }</h2>
			<p>
				<c:choose>
					<c:when test="${attrctn.alevel == 1 }">초급</c:when>
					<c:when test="${attrctn.alevel == 2 }">중급</c:when>
					<c:when test="${attrctn.alevel == 3 }">고급</c:when>
				</c:choose>
			</p>
			<p>
				<c:choose>
					<c:when test="${attrctn.state == 1}">운행중</c:when>
					<c:otherwise>점검중</c:otherwise>
				</c:choose>
			</p>
			</a>
		</li>
	</c:forEach>
</ul>

</body>
</html>










