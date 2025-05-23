<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionsForm Page</title>
<%
    if (session.getAttribute("id") == null) {
        session.setAttribute("id", "user01");
    }
%>
</head>
<body>
<h2>QnA Form Page</h2>
<hr>

<c:if test="${not empty sessionScope.id}">
	<form action="insertQuestion" method="post">
	
	    제목:<input type="text" name="title" required>
	    <br><br>
	    내용:<textarea name="content" rows="5" cols="50" required></textarea><br><br>
	    <input type="submit" value="등록">
	</form>
</c:if>
</body>
</html>