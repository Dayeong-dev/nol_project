<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
#noticeList {
  background: #fff;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #333;
  max-width: 800px; /* 줄임 */
  margin: 0 auto;
  padding: 40px 15px; /* 살짝 줄임 */
}

#noticeList h2 {
  	color: #d62828;
  	font-size: 1.8rem; /* 줄임 */
}

form {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  margin-bottom: 20px;
  justify-content: center;
  align-items: center;
}

select,
input[type="text"] {
  padding: 8px 12px;
  font-size: 0.95rem;
  border: 1px solid #eee;
  border-radius: 6px;
  outline: none;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
  background: #fafafa;
  box-shadow: 0 2px 4px rgba(0,0,0,0.04);
}

select:hover,
input[type="text"]:hover,
select:focus,
input[type="text"]:focus {
  border-color: #a81e1e;
  box-shadow: 0 0 6px rgba(168,30,30,0.4);
}

button {
  background-color: #d62828;
  color: white;
  border: none;
  padding: 8px 16px;
  font-weight: bold;
  font-size: 0.95rem;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #a81e1e;
}

table {
  width: 100%;
  border-collapse: collapse;
  box-shadow: 0 3px 8px rgba(0,0,0,0.04);
  margin-bottom: 25px;
}

th, td {
  border: 1px solid #ddd;
  padding: 10px 8px;
  text-align: center;
  font-size: 0.95rem;
  color: #555;
}

th {
  background-color: #d62828;
  color: white;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #fff7f7;
}

tr:hover {
  background-color: #fff0f0;
  cursor: pointer;
}

.notice-fixed span {
  color: #d90429;
  font-weight: 700;
}

.pagination {
  text-align: center;
  margin: 25px 0 30px;
}

.pagination a,
.pagination strong {
  display: inline-block;
  margin: 0 4px;
  padding: 6px 10px;
  font-size: 0.95rem;
  font-weight: bold;
  color: #d62828;
  border: 2px solid #d62828;
  border-radius: 5px;
  text-decoration: none;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.pagination strong {
  background-color: #d62828;
  color: white;
}

.pagination a:hover {
  background-color: #a81e1e;
  color: white;
}

a {
  color: #d62828;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

.btn-success {
  background-color: #d62828;
  color: white;
  padding: 8px 14px;
  font-weight: bold;
  border-radius: 6px;
  text-decoration: none;
  transition: background-color 0.3s ease;
  display: inline-block;
  margin-top: 12px;
}

.btn-success:hover {
  background-color: #a81e1e;
}

.admin-links {
  color: #d62828;
  font-weight: bold;
  margin-top: 10px;
  display: inline-block;
  transition: color 0.3s ease;
}

.admin-links:hover {
  color: #a81e1e;
}
</style>
</head>
<body>

	<jsp:include page="fragments/header.jsp" />

	<section id="noticeList">
		
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
	</section>
	
	<jsp:include page="fragments/footer.jsp" />
</body>	
</html>