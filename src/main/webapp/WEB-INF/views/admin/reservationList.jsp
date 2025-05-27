<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 목록</title>
<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>🎟 예매 목록 조회</h2>
			<table border="1">
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
		</div>
	</section>
</body>
</html>
