<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 목록</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fff5f5;
  --text-color: #333;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #fffdfd;
  color: var(--text-color);
  padding: 40px 20px;
}

h2 {
  text-align: center;
  color: var(--main-color);
  margin-bottom: 30px;
}

table {
  width: 90%;
  max-width: 1000px;
  margin: 0 auto 40px;
  border-collapse: collapse;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

table th {
  background-color: var(--main-color);
  color: white;
  padding: 12px;
  font-weight: bold;
}

table td {
  background-color: #fff;
  text-align: center;
  padding: 12px;
  border-bottom: 1px solid #eee;
  font-size: 14px;
}

table tr:hover td {
  background-color: #fef0f0;
}

.pagination {
  text-align: center;
  margin-top: 20px;
}

.pagination a,
.pagination strong {
  display: inline-block;
  margin: 0 4px;
  padding: 6px 12px;
  font-weight: bold;
  text-decoration: none;
  border-radius: 4px;
  color: var(--main-color);
  border: 1px solid transparent;
}

.pagination a:hover {
  background-color: #fce8e8;
  border: 1px solid var(--main-color);
}

.pagination strong {
  background-color: var(--main-color);
  color: white;
  border: 1px solid var(--main-color);
}
</style>
</head>
<body>

<h2>🎟 예매 목록 조회</h2>

<table>
  <thead>
    <tr>
      <th>예매번호</th>
      <th>회원 이름</th>
      <th>티켓명</th>
      <th>예매 날짜</th>
      <th>수량</th>
      <th>총 금액</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="res" items="${reservationList}">
      <tr>
        <td>${res.rno}</td>
        <td>${res.memberName}</td>
        <td>${res.ticketName}</td>
        <td><fmt:formatDate value="${res.tdate}" pattern="yyyy-MM-dd" /></td>
        <td>${res.quantity}</td>
        <td><fmt:formatNumber value="${res.totalPrice}" pattern="#,##0" />원</td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<%
  int pageBlock = 5;  // 한 블럭에 보여줄 페이지 수
  int currentPage = Integer.parseInt(String.valueOf(request.getAttribute("currentPage")));
  int totalPage = Integer.parseInt(String.valueOf(request.getAttribute("totalPage")));
  int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
  int endPage = startPage + pageBlock - 1;
  if (endPage > totalPage) endPage = totalPage;
%>

<div class="pagination">
  <%-- ◀ 이전 블럭 --%>
  <c:if test="<%= startPage > 1 %>">
    <a href="/admin/reservationList?page=<%= startPage - 1 %>">◀ 이전</a>
  </c:if>

  <%-- 페이지 숫자 출력 --%>
  <c:forEach var="i" begin="<%= startPage %>" end="<%= endPage %>">
    <c:choose>
      <c:when test="${i == currentPage}">
        <strong>${i}</strong>
      </c:when>
      <c:otherwise>
        <a href="/admin/reservationList?page=${i}">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>

  <%-- ▶ 다음 블럭 --%>
  <c:if test="<%= endPage < totalPage %>">
    <a href="/admin/reservationList?page=<%= endPage + 1 %>">다음 ▶</a>
  </c:if>
</div>

</body>
</html>
