<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 목록</h2>
	<table border="1">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	    </tr>
	    <c:forEach var="notice" items="${list}">
	        <tr>  
	            <td>${notice.nno}</td>
	            <td><a href="/notice/NoticeDetail?nno=${notice.nno}">${notice.title}</a></td>
	            <td>${notice.adminId}</td>
	        </tr>  
	    </c:forEach>
	</table>
</body>	
</html>