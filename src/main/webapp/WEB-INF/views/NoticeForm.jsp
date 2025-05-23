<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 등록</h2>
	<form action="${pageContext.request.contextPath}/notice/insert" method="post">
	    <p>제목: <input type="text" name="title" required></p>
	    <p>내용: <textarea name="content" required></textarea></p>
	    <button type="submit">등록</button>
	</form>
	<a href="/notice/NoticeList">목록</a>
</body>
</html>