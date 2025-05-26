<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
</head>
<body>
	<c:if test="${isAdmin}">
		<th>관리자 전용</th>
	</c:if>

	<h2>QnA</h2>
	<hr>

	<form action="QuestionsList" method="get">
		<select name="category">
			<option value="" ${selectedCategory == null || selectedCategory == '' ? 'selected' : ''}>전체</option>
			<option value="일반" ${selectedCategory == '일반' ? 'selected' : ''}>일반</option>
			<option value="계정" ${selectedCategory == '계정' ? 'selected' : ''}>계정</option>
			<option value="서비스" ${selectedCategory == '서비스' ? 'selected' : ''}>서비스</option>
			<option value="기타" ${selectedCategory == '기타' ? 'selected' : ''}>기타</option>
		</select>
		<input type="text" name="keyword" value="${keyword}" placeholder="제목 또는 내용 검색">
		<button type="submit">검색</button>
	</form>

	<a href="QuestionsForm">질문 등록하기</a>

	<table border="1">
		<tr>
			<th>카테고리</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변여부</th>
		</tr>
		<c:forEach var="q" items="${questions}">
			<tr>
				<td>${q.category}</td>
				<td>${q.qno}</td>
				<td><a href="QuestionsDetail?qno=${q.qno}">${q.title}</a></td>
				<td>${q.memberName}</td>
				<td>${q.createDate}</td>
				<td>
					<c:choose>
						<c:when test="${q.isAnswered == 1}">답변 완료</c:when>
						<c:otherwise>미답변</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>

	<div style="margin-top:20px;">
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

	<c:if test="${isAdmin}">
		<br>
		<a href="${pageContext.request.contextPath}/admin/answers/UnansweredList">미답변 QnA 보기</a><br>
		<a href="${pageContext.request.contextPath}/admin/answers/AnsweredList">답변된 QnA 보기</a><br>
	</c:if>

	<a href="/">Home</a>
</body>
</html>