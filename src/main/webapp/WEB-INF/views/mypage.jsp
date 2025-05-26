<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
:root {
	--main-color: #d62828;
	--hover-color: #b71c1c;
	--light-bg: #fff0f0;
	--text-color: #333;
}

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

body {
	font-family: 'Segoe UI', sans-serif;
	padding: 40px;
	background-color: #fffdfd;
	color: var(--text-color);
}

h2 {
	margin-bottom: 24px;
	color: var(--main-color);
	text-align: center;
}

.notice {
	color: green;
	text-align: center;
	margin-bottom: 20px;
	font-weight: bold;
}

.empty-message {
	color: #aaa;
	text-align: center;
	margin-bottom: 30px;
	font-size: 16px;
}

.ticket-box {
	border: 2px solid var(--main-color);
	padding: 20px;
	margin: 20px auto;
	width: 80%;
	border-radius: 10px;
	background-color: var(--light-bg);
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.05);
}

.ticket-box p {
	margin: 10px 0;
	font-size: 15px;
}

.ticket-box strong {
	color: var(--main-color);
}

.ticket-box button {
	margin-top: 10px;
	padding: 8px 16px;
	background-color: var(--main-color);
	border: none;
	color: white;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.ticket-box button:hover {
	background-color: var(--hover-color);
}

/* 하단 버튼 */
.bottom-buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 40px;
}

.bottom-buttons a {
	display: inline-block;
	padding: 10px 24px;
	background-color: var(--main-color);
	color: #fff;
	text-decoration: none;
	border-radius: 6px;
	font-weight: bold;
	transition: background-color 0.2s ease;
}

.bottom-buttons a:hover {
	background-color: var(--hover-color);
}
</style>
</head>
<body>

<jsp:include page="./fragments/header.jsp"></jsp:include>

<c:if test="${not empty msg}">
    <p class="notice">✅ ${msg}</p>
</c:if>

<h2>예매 내역</h2>

<c:if test="${empty myReserveList}">
    <p class="empty-message">예매 내역이 없습니다.</p>
</c:if>

<c:forEach var="reservelist" items="${myReserveList}">
	<div class="ticket-box">
		<p>🎫 <strong>티켓명:</strong> ${reservelist.TICKETNAME}</p>
		<p>📅 <strong>이용일:</strong> <fmt:formatDate value="${reservelist.RESERVEDATE}" pattern="yyyy-MM-dd" /></p>
		<p>👥 <strong>수량:</strong> ${reservelist.QUANTITY}장</p>
		<p>💰 <strong>단가:</strong> <fmt:formatNumber value="${reservelist.UNITPRICE}" pattern="#,##0" />원</p>
		<p>💳 <strong>총 금액:</strong> <fmt:formatNumber value="${reservelist.TOTALPRICE}" pattern="#,##0" />원</p>
		
		<form action="reviewWrite" method="get">
			<input type="hidden" name="rno" value="${reservelist.RNO}">
			<button type="submit">리뷰 작성</button>
		</form>
	</div>
</c:forEach>

<div class="bottom-buttons">
	<a href="/reserve">🎟 다시 예매하러 가기</a>
	<a href="/mypage/couponList" onclick="requireLogin('/mypage/couponList')">🎁 내 쿠폰함 보기</a>
</div>

<script>
	const isLoggedIn = "${sessionScope.id}" !== "";
	function requireLogin(targetUrl) {
		if (!isLoggedIn) {
			alert("로그인 후 이용해주세요.");
			window.location.href = "/login";
		} else {
			window.location.href = targetUrl;
		}
	}
</script>

<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
