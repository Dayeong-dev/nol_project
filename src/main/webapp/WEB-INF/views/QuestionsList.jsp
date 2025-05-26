<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions Page</title>
</head>
<body>
	<h2>QnA</h2>
	<hr> 
	<a href="QuestionsForm">질문 등록하기</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>질문</th>	
			<th>작성자</th>
			<th>작성일</th>
			<th>답변여부</th>
		</tr>
		<c:forEach var="q" items="${questions}">
			<tr>
				<td>${q.qno}</td>
				<td><a href="QuestionsDetail?qno=${q.qno}">${q.title}</a></td>
				<td><a href="QuestionsDetail?qno=${q.qno}">${q.content}</a></td>
				<td>${q.memberName}</td>
				<td>${q.createDate}</td>
				<td><c:choose>
						<c:when test="${q.isAnswered == 1}">답변 완료</c:when>
						<c:otherwise>미답변</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>
	    <c:if test="${currentPage > 1}">
	        <a href="QuestionsList?page=${currentPage - 1}">이전</a>
	    </c:if>

	    <c:forEach begin="1" end="${totalPages}" var="i">
	        <c:choose>
	            <c:when test="${i == currentPage}">
	                <b>[${i}]</b>
	            </c:when>
	            <c:otherwise>
	                <a href="QuestionsList?page=${i}">[${i}]</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>

	    <c:if test="${currentPage < totalPages}">
	        <a href="QuestionsList?page=${currentPage + 1}">다음</a>
	    </c:if>
	</div>
	<a href="/">Home</a>
</body>
</html>