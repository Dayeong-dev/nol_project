<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff7f7;
  --text-gray: #555;
}

#questionsList {
  font-family: 'Segoe UI', sans-serif;
  background: #fff;
  color: #333;
}

#questionsList h2 {
  color: var(--main-color);
}

/* 🔄 검색 + 등록 버튼 전체 감싸는 컨테이너 */
.filter-row {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;
  flex-wrap: wrap;
  margin-bottom: 30px;
}

/* 🔍 검색 박스 */
.filter-box {
  background: #fafafa;
  border: 1px solid #eee;
  border-radius: 10px;
  padding: 20px;
  max-width: 800px;
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  align-items: center;
  box-shadow: 0 3px 6px rgba(0,0,0,0.05);
}

.filter-box select,
.filter-box input[type="text"] {
  padding: 8px 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}

.filter-box button {
  background-color: var(--main-color);
  color: white;
  border: none;
  padding: 8px 16px;
  font-weight: bold;
  border-radius: 6px;
  cursor: pointer;
}

.filter-box button:hover {
  background-color: var(--hover-color);
}

/* ➕ 질문 등록 버튼 */
.register-btn a {
  background-color: var(--main-color);
  color: white;
  padding: 10px 18px;
  border-radius: 20px;
  font-weight: bold;
  text-decoration: none;
  font-size: 14px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.register-btn a:hover {
  background-color: var(--hover-color);
}

/* 📋 QnA 테이블 */
.qna-table {
  width: 90%;
  max-width: 1000px;
  margin: 0 auto;
  border-collapse: collapse;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

.qna-table th, .qna-table td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: center;
  font-size: 14px;
}

.qna-table th {
  background-color: var(--main-color);
  color: white;
}

.qna-table tr:hover {
  background-color: #fff0f0;
}

/* 페이지네이션 & 기타 버튼들 */
.action-bar {
  text-align: center;
  margin-top: 30px;
}

.action-bar a {
  display: inline-block;
  margin: 0 5px;
  padding: 6px 14px;
  border-radius: 20px;
  background: var(--main-color);
  color: white;
  font-size: 13px;
  text-decoration: none;
  font-weight: bold;
}

.action-bar a:hover {
  background-color: var(--hover-color);
}

.admin-links {
  margin-top: 20px;
  text-align: center;
}

.admin-links a {
  color: var(--main-color);
  margin: 0 8px;
  font-weight: bold;
  text-decoration: none;
}

.admin-links a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
<section id="questionsList">
<%-- <c:if test="${isAdmin}">
  <div class="action-bar"><span style="color: var(--main-color); font-weight: bold;">※ 관리자 전용</span></div>
</c:if> --%>

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
  
  <div class="register-btn">
    <a href="QuestionsForm">➕ 질문 등록하기</a>
  </div>

</div>

<!-- 📋 QnA 목록 테이블 -->
<table class="qna-table">
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
        <b style="margin: 0 6px;">[${i}]</b>
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
</section>
<jsp:include page="./fragments/footer.jsp"></jsp:include>

</body>
</html>
 