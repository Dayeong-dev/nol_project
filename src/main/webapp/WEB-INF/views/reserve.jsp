<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매하기</title>
<link rel="stylesheet" href="/css/style.css" />
<style>
h2 {
	text-align: center;
	color: #d62828;
	margin: 40px 0 20px;
	font-size: 26px;
}

.ticket-grid {
	display: flex;
	justify-content: center;
	gap: 40px;
	flex-wrap: wrap;
	padding-bottom: 100px;
}

.ticket-card {
	width: 220px; /* ✅ 기존 280보다 좁게 */
	height: 360px; /* ✅ 기존보다 짧게 */
	background: linear-gradient(to bottom, #d62828, #a81e1e);
	border-radius: 20px;
	color: white;
	text-align: center;
	padding: 24px 16px;
	position: relative;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	flex-shrink: 0;
}

.ticket-card img {
	height: 100px;
	margin-bottom: 16px;
}

.ticket-card h3 {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 6px;
}

.ticket-card p {
	font-size: 13px;
	margin: 4px 0;
}

.ticket-card .price {
	font-size: 20px;
	font-weight: bold;
	margin: 16px 0;
}

.ticket-card button {
	position: absolute;
	bottom: 16px;
	left: 50%;
	transform: translateX(-50%);
	background: white;
	color: #d62828;
	font-weight: bold;
	padding: 8px 20px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.ticket-card button:hover {
	background-color: #fceeee;
}

.ticket-card {
	width: 220px;
	height: 360px;
	background: linear-gradient(to bottom, #d62828, #a81e1e);
	border-radius: 20px;
	color: white;
	text-align: center;
	padding: 24px 16px;
	position: relative;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	flex-shrink: 0;
	transition: all 0.3s ease; /* ✅ 부드러운 전환 */
}

.ticket-card:hover {
	transform: scale(1.05); /* ✅ 살짝 확대 */
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25); /* ✅ 그림자 강조 */
	cursor: pointer;
}
</style>
</head>
<body>

	<jsp:include page="./fragments/header.jsp" />

	<h2>🎟️ 이지월드 티켓 예매</h2>

	<div class="ticket-grid">
		<c:forEach var="ticket" items="${ticketList}">
			<div class="ticket-card">
				<img src="/nol_image/logo.png" alt="티켓 이미지">
				<h3>${ticket.name}</h3>
				<p>★ 쿠폰을 받아서 할인된★</p>
				<p>★ 가격으로 이용하세요 ★</p>
				<p class="price">
					<fmt:formatNumber value="${ticket.price}" pattern="#,###" />
					원~
				</p>
				<button onclick="location.href='/reserveForm?tno=${ticket.tno}'">예매하기</button>
			</div>
		</c:forEach>
	</div>

	<jsp:include page="./fragments/footer.jsp" />

</body>
</html>
