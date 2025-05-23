<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<c:if test="${not empty msg}">
    <p style="color:green;">✅ ${msg}</p>
</c:if>

<h2>예매된 티켓</h2>

<br>

<c:if test="${empty myReserveList}">
    <p>예매 내역이 없습니다.</p>
</c:if>

<c:forEach var="reservelist" items="${myReserveList}">
    <div style="border:1px solid #ccc; padding:10px; margin-bottom:15px;">
        <p>🎫 티켓명: ${reservelist.TICKETNAME}</p>
		<p>📅 이용일: <fmt:formatDate value="${reservelist.RESERVEDATE}" pattern="yyyy-MM-dd" /></p>
		<p>👥 수량: ${reservelist.QUANTITY}장</p>
		<p>💰 단가: <fmt:formatNumber value="${reservelist.UNITPRICE}" pattern="#,##0" />원</p>
		<p>💳 총 금액: <fmt:formatNumber value="${reservelist.TOTALPRICE}" pattern="#,##0" />원</p>
		

    </div>
</c:forEach>

<a href="/reserve">← 다시 예매하러 가기</a>

</body>
</html>
