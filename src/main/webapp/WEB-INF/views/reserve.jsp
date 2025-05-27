<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매하기</title>
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
	width: 220px;
	background: linear-gradient(to bottom, #d62828, #a81e1e);
	border-radius: 20px;
	color: white;
	text-align: center;
	padding: 24px 16px;
	position: relative;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	flex-shrink: 0;
	transition: all 0.3s ease;
}

.ticket-card:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
	cursor: pointer;
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

.ticket-card img {
	height: 200px;
	object-fit: contain;  /* 비율 유지하며 꽉 채움 */
	display: block;
	margin: 0 auto 20px;  /* 가운데 정렬 */
}
</style>
</head>
<body>

<jsp:include page="./fragments/header.jsp" />

<section>
	<h2>티켓 예매</h2>
	<div class="ticket-grid">
		<c:forEach var="ticket" items="${ticketList}">
			<div class="ticket-card">
				<c:choose>
					<c:when test="${ticket.name eq '오전 이용권'}">
						<img src="/nol_image/morningpass.png" alt="오전 티켓">
					</c:when>
					<c:when test="${ticket.name eq '오후 이용권'}">
						<img src="/nol_image/afternoonpass.png" alt="오후 티켓">
					</c:when>
					<c:when test="${ticket.name eq '종일 이용권'}">
						<img src="/nol_image/alldaypass.png" alt="종일 티켓">
					</c:when>
					<c:otherwise>
						<img src="/nol_image/default.png" alt="기본 티켓">
					</c:otherwise>
				</c:choose>
	
				<h3>${ticket.name}</h3>
				<p>★ 쿠폰을 받아서 할인된★</p>
				<p>★ 가격으로 이용하세요 ★</p>
				<p class="price">
					<fmt:formatNumber value="${ticket.price}" pattern="#,###" />원~
				</p>
				<button onclick="location.href='/reserveForm?tno=${ticket.tno}'">예매하기</button>
			</div>
		</c:forEach>
	</div>
</section>

<jsp:include page="./fragments/footer.jsp" />

</body>
</html>
