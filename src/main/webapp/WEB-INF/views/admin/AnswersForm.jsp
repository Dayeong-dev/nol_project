<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 작성</title>
</head>
<body>
    <h2>답변 작성</h2> 
    <form action="${pageContext.request.contextPath}/admin/answers/AnswersInsert" method="post">
        <input type="hidden" name="qno" value="${qno}"/>
        <!-- <input type="hidden" name="adminid" value="admin01"/> -->
        <textarea name="content" rows="6" cols="50" placeholder="답변을 입력하세요"></textarea><br/>
        <input type="submit" value="등록"/>
    </form>
</body>

</html>