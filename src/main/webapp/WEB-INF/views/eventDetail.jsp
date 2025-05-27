<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세</title>
<script>
	var isLoggedIn = "${sessionScope.id}" !== "";
</script>
<style>
	#eventDetail {
	  	max-width: 800px;
	  	margin: 40px auto;
	  	background-color: #ffffff;
	  	border-radius: 12px;
	  	font-family: 'Nanum Gothic', sans-serif;
	}
	
	#eventDetail h2 {
	  	margin: 0 auto 40px;
	}
	
	#eventDetail table {
	  	width: 100%;
	  	border: none;
	  	border-collapse: collapse;
	  	border-top: 2px solid #000;
	  	border-bottom: 2px solid #000;
	}
	
	#eventDetail th,
	#eventDetail td {
	  	text-align: left;
	  	padding: 12px 16px;
	  	vertical-align: top;
	  	border: none;
	  	border-bottom: 1px solid #e0e0e0;
	  	font-size: 15px;
	}
	
	#eventDetail th {
	  	width: 150px;
	  	background-color: #f9f9f9;
	  	color: #333;
	  	font-weight: 600;
	}
	
	#eventDetail img {
	  	max-width: 100%;
	  	height: auto;
	  	display: block;
	  	border-radius: 8px;
	  	margin: 10px 0;
	}
	
	#eventDetail .eventDescription td {
		text-align: center;
	}
	
	#eventDetail button {
		display: block;
  		margin: 0 auto;
	  	background: linear-gradient(45deg, #d62828, #ff7f50);
	  	color: #fff;
	  	padding: 14px 32px;
	  	font-size: 16px;
	  	font-weight: 700;
	  	border: none;
	  	border-radius: 30px;
	  	cursor: pointer;
	}
	
	#eventDetail button:hover {
	  	background: linear-gradient(45deg, #b71c1c, #ff5722);
	}
</style>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section id="eventDetail">
		<h2>이벤트 상세</h2>
		<table border="1">
			<tbody>
				<tr>
					<th>이벤트 명</th>
					<td>${event.name}</td>
				</tr>
				<tr>
					<th>이벤트 기간</th>
					<td><fmt:formatDate value="${event.startDate}"
							pattern="yyyy/MM/dd" /> - <fmt:formatDate
							value="${event.endDate}" pattern="yyyy/MM/dd" /></td>
				</tr>
				<tr class="eventDescription">
					<td colspan="2">${event.description}</td>
				</tr>
				<tr>
					<td colspan="2"><img src="${event.contentImgURL}" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<button onclick="addCoupon(${event.cno})">쿠폰 받기</button>
					</td>
				</tr>
			</tbody>
		</table>
	</section>
	<jsp:include page="./fragments/footer.jsp"></jsp:include>
	<script>
	function addCoupon(cno) {
		if (!isLoggedIn) {
			alert("로그인 후 쿠폰을 발급받을 수 있습니다.");
			location.href = "/login";
			return;
		}

		fetch("/addCoupon?cno=" + cno)
			.then(response => response.text())
			.then(data => {
				console.log(data);
				if (data === "success") {
					alert("쿠폰을 발급받았습니다.");
				} else if (data === "exist") {
					alert("쿠폰을 이미 발급받았습니다.");
				} else {
					alert("쿠폰 발급 중 문제가 발생했습니다.");
				}
			})
			.catch(error => alert("에러 발생: " + error));
	}
	</script>

</body>
</html>