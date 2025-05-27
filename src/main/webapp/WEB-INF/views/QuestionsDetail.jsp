<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions Detail Page</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff7f7;
  --text-gray: #555;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background: #fff;
  color: #333;
  margin: 20px;
}

h2 {
  text-align: center;
  color: var(--main-color);
  margin-bottom: 30px;
  font-size: 26px;
  margin-top: 30px;
  font-weight: bold;
}

.detail-container {
  max-width: 900px;
  margin: 0 auto;
  background: var(--bg-light);
  padding: 25px 30px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  line-height: 1.6;
  font-size: 15px;
}

.detail-row {
  margin-bottom: 14px;
  color: var(--text-gray);
}

.detail-label {
  font-weight: 600;
  color: var(--main-color);
  min-width: 120px;
  display: inline-block;
}

.content-box {
  margin-top: 10px;
  padding: 15px;
  background: white;
  border: 1px solid #ddd;
  border-radius: 8px;
  white-space: pre-wrap;
  color: #444;
  font-size: 15px;
  box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
}

.answer-section {
  margin-top: 30px;
  padding: 20px;
  background: #fff0f0;
  border-left: 5px solid var(--main-color);
  border-radius: 10px;
}

.answer-section h3 {
  color: var(--main-color);
  margin-bottom: 15px;
  font-weight: bold;
}

.back-link {
  display: inline-block;
  margin-top: 40px;
  color: var(--main-color);
  font-weight: bold;
  text-decoration: none;
  font-size: 14px;
  border: 1.5px solid var(--main-color);
  padding: 6px 14px;
  border-radius: 20px;
  transition: background-color 0.3s, color 0.3s;
}

.back-link:hover {
  background-color: var(--main-color);
  color: white;
}

/* 관리자 답변 작성 버튼 */
.admin-btn {
  margin-top: 20px;
  display: inline-block;
  background-color: var(--main-color);
  color: white;
  padding: 10px 18px;
  font-weight: bold;
  border-radius: 20px;
  text-decoration: none;
  box-shadow: 0 2px 6px rgba(0,0,0,0.15);
  transition: background-color 0.3s;
}

.admin-btn:hover {
  background-color: var(--hover-color);
}
</style>
</head>

<body>
<jsp:include page="fragments/header.jsp" />
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

    <c:if test="${answer != null}">
    <div class="answer-section">
        <h3>답변 내용</h3>
        <div class="content-box">${answer.content}</div>
        <div style="margin-top:10px; font-size: 13px; color: var(--text-gray);">
          답변 관리자: ${answer.adminId != null ? answer.adminId : '알 수 없음'}
        </div>
    </div>
    </c:if>
</div>

<a href="QuestionsList" class="back-link">← 목록으로 돌아가기</a>

<!-- 관리자 전용 답변 작성 버튼 -->
<c:if test="${sessionScope.role eq 'admin'}">
    <a href="${pageContext.request.contextPath}/admin/answers/QuestionsForm?qno=${questions.qno}" class="admin-btn">답변 작성</a>
</c:if>

<jsp:include page="fragments/footer.jsp" />
</body>
</html>