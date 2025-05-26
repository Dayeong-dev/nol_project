<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 목록</title>
</head>
<body>

	<h2>예매 목록 조회</h2>

	<table border="1">
		<thead>
			<tr>
				<th>예매번호</th>
				<th>회원이름</th>
				<th>티켓명</th>
				<th>예매날짜</th>
				<th>수량</th>
				<th>총금액</th>

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
					<td><fmt:formatNumber value="${res.totalPrice}" type="number"
							pattern="#,###" />원</td>


				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin-top: 20px;">
		<c:if test="${totalPage > 1}">
			<c:forEach var="i" begin="1" end="${totalPage}">
				<c:choose>
					<c:when test="${i == currentPage}">
						<strong>[${i}]</strong>
					</c:when>
					<c:otherwise>
						<a href="/admin/reservationList?page=${i}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</div>


</body>
</html>
