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
<h1>리뷰 작성</h1>
<form action="/reviewForm" method="post">
	<input type="hidden" name="rno" value="${rno }">
	
	<label for="content">리뷰 내용</label><br>
	<textarea name="content" rows="10" cols="50" required></textarea><br>
	<button type="submit">리뷰 등록</button>
</form>
</body>
</html>