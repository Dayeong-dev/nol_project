<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions Detail Page</title>
</head>

<body>
    <h2>QnA 상세</h2>
    <hr>
    번호: ${questions.qno}<br>
    제목: ${questions.title}<br>
    작성자 ID: ${questions.id}<br>
    작성자 이름: ${questions.memberName}<br>
    전화번호: ${questions.memberPhone}<br>
    작성일: ${questions.createDate}<br>
    내용:<br>${questions.content}<br>
   답변 여부:
        <c:choose>
            <c:when test="${questions.isAnswered == 1}">답변 완료</c:when>
      	<c:otherwise>미답변</c:otherwise>
        </c:choose>

    <c:if test="${answer != null}">
	    <hr>
	    <h3>답변 내용</h3>
	    ${answer.content}
	    답변 관리자: ${answer.adminId != null ? answer.adminId : answer.adminId}
	</c:if>
	
    <br><a href="QuestionsList">← 목록으로 돌아가기</a>
    
  	<!--<c:if test="${answer == null}">
	    <a href="${pageContext.request.contextPath}/answers/AnswersForm?qno=${questions.qno}">답변 작성하기</a>
	</c:if>-->
	
	<!-- questionsDetail.jsp 내부에서 관리자 전용 버튼 (임시 테스트용) -->
	<c:if test="${sessionScope.role eq 'admin'}">
	    <a href="${pageContext.request.contextPath}/admin/answers/QuestionsForm?qno=${questions.qno}">답변 작성</a>
	</c:if>
	
</body>

</html>