<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		padding: 0;
	}
</style>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<h1>Index Page</h1>
	<hr/>
	<h1>재미있고 즐거운 다양한 어트랙션</h1>
	<ul id="attrctn">
		<c:forEach var="attrctn" items="${list }" varStatus="status">
			<c:if test="${status.index < 4 }">
				<li>
					<a href="detail?atno=${attrctn.atno }">
						<img src="${attrctn.imageURL }" alt="어트랙션 이미지" width="250">
						<h2>${attrctn.name }</h2>
					</a>
				</li>
			</c:if>
		</c:forEach>
	</ul>
	<a href="attrctn">더 보러가기</a>
</body>
</html>