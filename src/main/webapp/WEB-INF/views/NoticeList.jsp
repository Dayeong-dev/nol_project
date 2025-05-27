<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-color: #fff;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #222;
  max-width: 1000px;
  margin: 30px auto;
  padding: 0 20px;
}

h2 {
  margin: 40px 0 30px;
  color: #b30000;
  font-size: 2.4rem;
  margin-bottom: 30px;
  padding-bottom: 12px;
  /* border-bottom 제거 */
  border-bottom: none;
  text-align: center;
}

form {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-bottom: 30px;
  align-items: center;
  justify-content: center;
}

select {
  padding: 10px 16px;
  font-size: 1rem;
  border: 2px solid #b30000;
  border-radius: 8px;
  outline: none;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
}

select:hover {
  border-color: #800000;
  box-shadow: 0 0 8px rgba(179, 0, 0, 0.4);
}

select:focus {
  border-color: #800000;
  box-shadow: 0 0 10px rgba(179, 0, 0, 0.6);
  outline: none;
}

select,
input[type="text"] {
  padding: 10px 16px;
  font-size: 1rem;
  border: 2px solid #b30000;
  border-radius: 8px;
  outline: none;
  transition: 0.3s ease;
  background-color: #fff;
}

select:hover,
input[type="text"]:hover {
  border-color: #800000;
  box-shadow: 0 0 8px rgba(179, 0, 0, 0.3);
}

button {
  background-color: #b30000;
  color: white;
  font-weight: bold;
  padding: 10px 20px;
  font-size: 1rem;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #800000;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 30px;
}

th, td {
  padding: 14px 12px;
  border: 1px solid #f5c1c1;
  font-size: 0.95rem;
  text-align: center;
}

th {
  background-color: #ffe5e5;
  color: #b30000;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #fff5f5;
}

.pagination {
  text-align: center;
  margin: 20px 0 40px;
}

.pagination a,
.pagination strong {
  display: inline-block;
  margin: 0 4px;
  padding: 8px 14px;
  font-size: 1rem;
  font-weight: bold;
  color: #b30000;
  border: 2px solid #b30000;
  border-radius: 6px;
  text-decoration: none;
}

.pagination strong {
  background-color: #b30000;
  color: white;
}

.pagination a:hover {
  background-color: #800000;
  color: white;
}

a {
  color: #b30000;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* 관리자 버튼 스타일 */
.btn-success {
  display: inline-block;
  background-color: #b30000;
  color: white;
  padding: 10px 18px;
  font-weight: bold;
  border-radius: 6px;
  text-decoration: none;
  transition: background-color 0.3s;
}

.btn-success:hover {
  background-color: #800000;
}

.admin-links {
  font-weight: bold;
  color: #b30000;
  margin-top: 12px;
  display: inline-block;
}

.admin-links:hover {
  color: #800000;
}
table tr {
  transition: background-color 0.3s ease;
  cursor: pointer;  /* 커서도 포인터로 변경 */
}

table tr:hover {
  background-color: #fddede;  /* 연한 빨간색 배경 */
}
</style>
</head>
<body>
<jsp:include page="fragments/header.jsp" />
	<c:if test="${isAdmin}">
		<th>관리자 전용</th>
	</c:if>
	
	<h2>공지사항</h2>
	
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
	
	<table border="0">
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="notice" items="${list}">
			<tr class="${notice.isFixed == 1 ? 'notice-fixed' : ''}"
			    onclick="location.href='/notice/NoticeDetail?nno=${notice.nno}'"
			    style="cursor: pointer;">
			  <td><a href="/notice/NoticeDetail?nno=${notice.nno}">${notice.nno}</a></td>
			  <td><a href="/notice/NoticeDetail?nno=${notice.nno}">${notice.category}</a></td>
			  <td>
			    <c:if test="${notice.isFixed == 1}">
			      <span style="color:#d90429; font-weight:700;">중요 공지 💡</span>
			    </c:if>
			    <a href="/notice/NoticeDetail?nno=${notice.nno}">${notice.title}</a>
			  </td>
			  <td>${notice.hit}</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${isAdmin}">
	    <a href="/notice/NoticeForm" class="btn btn-success mt-3">공지 등록</a><br><br>
		<a href="/admin" class="admin-links">← 관리자 메인</a><br>
	</c:if>
	
	<div class="pagination">
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
	<a href="/" style="color:#d90429; font-weight:700;">Home</a>
<jsp:include page="fragments/footer.jsp" />
</body>	
</html>