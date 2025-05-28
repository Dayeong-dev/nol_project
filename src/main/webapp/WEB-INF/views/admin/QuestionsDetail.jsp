<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnA 상세</title>
	<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp"></jsp:include>
		<div id="questionsDetail" class="admin-content">
			<h2>QnA 상세</h2>
			<div class="detail-container">
			    <div class="detail-row"><span class="detail-label">카테고리:</span> ${questions.category}</div>
			    <div class="detail-row"><span class="detail-label">번호:</span> ${questions.qno}</div>
			    <div class="detail-row"><span class="detail-label">제목:</span> ${questions.title}</div>
			    <div class="detail-row"><span class="detail-label">작성자 ID:</span> ${questions.id}</div>
			    <div class="detail-row"><span class="detail-label">작성자 이름:</span> ${questions.memberName}</div>
			    <div class="detail-row"><span class="detail-label">전화번호:</span> ${questions.memberPhone}</div>
			    <div class="detail-row"><span class="detail-label">작성일:</span> ${questions.createDate}</div>
			    
			    <div class="detail-row"><span class="detail-label">내용:</span>
			      <div class="content-box">${questions.content}</div>
			    </div>
			
			    <div class="detail-row"><span class="detail-label">답변 여부:</span>
			        <c:choose>
			            <c:when test="${questions.isAnswered == 1}">답변 완료</c:when>
			            <c:otherwise>미답변</c:otherwise>
			        </c:choose>
			    </div>
			
			    <c:choose>
			    	<c:when test="${answer != null}">
					   	<div class="answer-section">
							  <h3>답변 내용</h3>
							  <div class="answer-meta">
							    	답변 관리자: ${answer.adminId != null ? answer.adminId : '알 수 없음'}
							  </div>
							  <div class="answer-content">
							    	${answer.content}
							  </div>
						</div>
			    	</c:when>
					<c:otherwise>
						<!-- 관리자 전용 답변 작성 버튼 -->
				    	<a href="${pageContext.request.contextPath}/admin/AnswersForm?qno=${questions.qno}" class="admin-btn">답변 작성</a>
					</c:otherwise>
			    </c:choose>
			</div>
	
		</div>
	</section>
</body>
</html>