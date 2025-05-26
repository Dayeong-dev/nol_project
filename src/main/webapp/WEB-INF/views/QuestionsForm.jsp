<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionsForm Page</title>
</head>
<body>
<h2>QnA Form Page</h2>
<hr>
	
<c:if test="${not empty sessionScope.id}">
	<form action="insertQuestion" method="post">
		카테고리:<select name="category" required>
		    <option value="">-- 선택 --</option>
		    <option value="일반">일반</option>
		    <option value="계정">계정</option>
		    <option value="서비스">서비스</option>
		    <option value="기타">기타</option>
			</select>
		<br><br>
	    제목:<input type="text" name="title" required>
	    <br><br>
	    내용:<textarea name="content" rows="5" cols="50" required></textarea><br><br>
	    <input type="submit" value="등록">
	</form>
</c:if>
</body>
</html>