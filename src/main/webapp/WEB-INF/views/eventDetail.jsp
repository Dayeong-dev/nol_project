<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세</title>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section id="eventList">
		<table border="1">
			<tbody>
				<tr>
					<th>이벤트 명</th>
					<td>${event.name}</td>
				</tr>
				<tr>
					<th>이벤트 기간</th>
					<td>
						<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
						-
						<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />						
					</td>
				</tr>
				<tr>
					<th>이벤트 설명</th>
					<td>${event.description}</td>
				</tr>
				<c:if test="${!event.isPast()}">
					<tr>
						<td colspan="2">
							<button onclick="addCoupon(${event.eno})">쿠폰 받기</button>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</section>
	<script>
		function addCoupon(eno) {
			fetch("/addCoupon?eno=" + eno)
				.then(response => response.json())
				.then(data => {
					if(data.result) {
						alert(data.message);
					}
				})
				.catch(error => alert(error));
		}
	</script>
</body>
</html>