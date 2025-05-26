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
	<table border="1">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
			<th>조회수</th>
			<!-- 관리자만 보는 열 -->
			<!--<c:if test="${isAdmin}">
				<th>관리자</th>
			</c:if>-->
	    </tr>
		<c:forEach var="notice" items="${list}">
		    <tr>
		        <td>${notice.nno}</td>
		        <td>
		            <c:if test="${notice.isFixed == 1}">
		                <span style="color:red;">[중요 사항]</span>
		            </c:if>
		            <a href="/notice/NoticeDetail?nno=${notice.nno}">${notice.title}</a>
		        </td>
		        <td>${notice.adminId}</td>
				<td>${notice.hit}</td>
		    </tr>
		</c:forEach>
	</table><br>
	
	<c:if test="${isAdmin}">
	    <a href="/notice/NoticeForm" class="btn btn-success mt-3">공지 등록</a><br><br>
		<a href="/admin">← 관리자 메인</a><br><br>
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