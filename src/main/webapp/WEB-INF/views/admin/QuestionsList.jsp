<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnA 목록</title>
	<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<div id="questionList" class="admin-content">
			<h2>QnA</h2>
			<!-- 🔍 필터 + 등록 버튼 묶는 영역 -->
			<div class="filter-row">
			  	<form action="QuestionsList" method="get" class="filter-box">
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
			</div>

			<!-- 📋 QnA 목록 테이블 -->
			<table class="list-table qna-table">
			  	<thead>
			    	<tr>
			      		<th>카테고리</th>
			      		<th>번호</th>
			      		<th>제목</th>
			      		<th>작성자</th>
			      		<th>작성일</th>
			      		<th>답변여부</th>
			    	</tr>
 					</thead>
 					<tbody>
 						<c:forEach var="q" items="${questions}">
   						<tr onclick="location.href='QuestionsDetail?qno=${q.qno}'" style="cursor:pointer;">
     							<td>${q.category}</td>
     							<td>${q.qno}</td>
     							<td>${q.title}</td>
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
				</tbody>
			</table>

			<!-- 🔢 페이지네이션 -->
			<div class="action-bar">
			  	<c:if test="${currentPage > 1}">
			    	<a href="QuestionsList?page=${currentPage - 1}">이전</a>
			  	</c:if>
			
			  	<c:forEach begin="1" end="${totalPages}" var="i">
			    	<c:choose>
			      	<c:when test="${i == currentPage}">
			        	<b style="margin: 0 6px;">${i}</b>
			      	</c:when>
			      	<c:otherwise>
			        	<a href="QuestionsList?page=${i}">${i}</a>
			      	</c:otherwise>
			    	</c:choose>
			  	</c:forEach>
			
			  	<c:if test="${currentPage < totalPages}">
			    	<a href="QuestionsList?page=${currentPage + 1}">다음</a>
			  	</c:if>
			</div>
		</div>
	</section>
</body>
</html>
 