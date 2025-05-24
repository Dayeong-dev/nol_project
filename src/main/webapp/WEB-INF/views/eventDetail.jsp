<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세</title>
<style>
	img {
		width: 500px;
	}
</style>
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
				<tr>
					<td colspan="2">
						<img src="${event.contentImgURL}" />
					</td>
				</tr>
				<c:if test="${!event.isPast() && sessionScope.id != null}">
					<tr>
						<td colspan="2">
							<button onclick="addCoupon(${event.cno})">쿠폰 받기</button>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</section>
	<script>
		function addCoupon(cno) {
			fetch("/addCoupon?cno=" + cno)
				.then(response => response.text())
				.then(data => {
					console.log(data);
					if(data === "success") {
						alert("쿠폰을 발급받았습니다. ");
					}
					else if(data === "exist"){
						alert("쿠폰을 이미 발급받았습니다. ");
					}
					else {
						alert("쿠폰 발급 중 문제가 발생했습니다. ");
					}
				})
				.catch(error => alert(error));
		}
	</script>
</body>
</html>