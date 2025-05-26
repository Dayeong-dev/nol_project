<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

body {
	font-family: 'Segoe UI', sans-serif;
	padding: 40px;
}

h2 {
	margin-bottom: 20px;
	color: #333;
}

ul {
	display: flex;
	gap: 20px;
	padding: 0;
}

li {
	list-style-type: none;
}

a {
	text-decoration: none;
	color: #0077cc;
}

.ticket-box {
	border: 1px solid #ccc;
	padding: 20px;
	margin-bottom: 20px;
	border-radius: 8px;
	background-color: #fafafa;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.ticket-box p {
	margin: 8px 0;
}

.ticket-box form {
	margin-top: 10px;
}

.ticket-box button {
	padding: 8px 16px;
	background-color: #0077cc;
	border: none;
	color: white;
	border-radius: 4px;
	cursor: pointer;
}

.ticket-box button:hover {
	background-color: #005fa3;
}

.notice {
	color: green;
	margin-bottom: 10px;
}

.empty-message {
	color: #999;
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<jsp:include page="./fragments/header.jsp"></jsp:include>

	<c:if test="${not empty msg}">
		<p class="notice">✅ ${msg}</p>
	</c:if>

	<h2>예매된 티켓</h2>

	<c:if test="${empty myReserveList}">
		<p class="empty-message">예매 내역이 없습니다.</p>
	</c:if>

	<c:forEach var="reservelist" items="${myReserveList}">
		<div class="ticket-box">
			<p>
				🎫 <strong>티켓명:</strong> ${reservelist.TICKETNAME}
			</p>
			<p>
				📅 <strong>이용일:</strong>
				<fmt:formatDate value="${reservelist.RESERVEDATE}"
					pattern="yyyy-MM-dd" />
			</p>
			<p>
				👥 <strong>수량:</strong> ${reservelist.QUANTITY}장
			</p>
			<p>
				💰 <strong>단가:</strong>
				<fmt:formatNumber value="${reservelist.UNITPRICE}" pattern="#,##0" />
				원
			</p>
			<p>
				💳 <strong>총 금액:</strong>
				<fmt:formatNumber value="${reservelist.TOTALPRICE}" pattern="#,##0" />
				원
			</p>

			<form action="reviewWrite" method="get">
				<input type="hidden" name="rno" value="${reservelist.RNO}">
				<button type="submit">리뷰 하기</button>
			</form>
		</div>
	</c:forEach>
	
	<script>
		const isLoggedIn = "${sessionScope.id}" !== "";
	</script>
	
	<script>
		function requireLogin(targetUrl) {
			if (!isLoggedIn) {
				alert("로그인 후 이용해주세요.");
				window.location.href = "/login";
			} else {
				window.location.href = targetUrl;
			}
		}
	</script>
	<a href="/reserve">← 다시 예매하러 가기</a>
	<hr>

	<a href="/mypage/couponList" onclick="requireLogin">내 쿠폰함 보기</a>

</body>
</html>
