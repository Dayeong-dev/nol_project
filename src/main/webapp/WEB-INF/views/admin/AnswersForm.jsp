<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 작성</title>
<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>답변 작성</h2> 
			<form action="${pageContext.request.contextPath}/admin/AnswersInsert" method="post">
				<input type="hidden" name="qno" value="${qno}"/>
				<input type="hidden" name="memberName" value="${memberName}"/>
				<textarea name="content" placeholder="답변을 입력하세요" required></textarea>
				<input type="submit" value="등록"/>
			</form>
		</div>
	</section>
</body>
</html>