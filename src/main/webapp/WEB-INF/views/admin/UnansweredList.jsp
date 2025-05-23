<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UnansweredList Page</title>
</head>
<body>
    <h2>미답변 QnA 목록</h2>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>답변 작성</th>
        </tr>
        <c:forEach var="q" items="${questions}">
        <tr>
            <td>${q.qno}</td>
            <td>${q.title}</td>
            <td>${q.memberName}</td>
            <td>${q.createDate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/answers/AnswersForm?qno=${q.qno}">답변 작성</a>
            </td>
        </tr>
        </c:forEach>
    </table>
    <br>
    <a href="${pageContext.request.contextPath}/admin">← 관리자 메인</a>
</body>
</html>