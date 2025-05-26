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

	<c:if test="${isAdmin}">
		    <th>관리자 전용</th>
	</c:if>
	
	<h2>공지사항 목록</h2>
	
	<form action="/notice/NoticeList" method="get">
	
	<select name="category">
		<option value="" ${selectedCategory == null || selectedCategory == '' ? 'selected' : ''}>전체</option>
		<option value="공지" ${selectedCategory == '공지' ? 'selected' : ''}>공지</option>
		<option value="이벤트" ${selectedCategory == '이벤트' ? 'selected' : ''}>이벤트</option>
		<option value="점검" ${selectedCategory == '점검' ? 'selected' : ''}>점검</option>
	</select>

	<input type="text" name="keyword" value="${keyword}" placeholder="제목 검색">
	
	<button type="submit">검색</button>
	</form>


	<table border="1">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="notice" items="${list}">
			<tr>
				<td>${notice.nno}</td>
				<td>${notice.category}</td>
				<td>
					<c:if test="${notice.isFixed == 1}">
						<span style="color:red;">📢중요 공지</span>
					</c:if>
					<a href="/notice/NoticeDetail?nno=${notice.nno}">${notice.title}</a>
				</td>
				<td>${notice.hit}</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${isAdmin}">
	    <a href="/notice/NoticeForm" class="btn btn-success mt-3">공지 등록</a><br><br>
		<a href="/admin">← 관리자 메인</a><br>
	</c:if>
	
	<div style="margin-top:20px;">
	    <c:forEach var="i" begin="1" end="${totalPages}">
	        <c:choose>
	            <c:when test="${i == currentPage}">
	                <strong>[${i}]</strong>
	            </c:when>
	            <c:otherwise>
	                <a href="?page=${i}">[${i}]</a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	</div>
	<a href="/">Home</a>
</body>	
</html>