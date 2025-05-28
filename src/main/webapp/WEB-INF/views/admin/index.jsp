<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 메인</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="/js/salesGraphFunc.js"></script>
	<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section id="salesChart">
		<jsp:include page="./fragments/header.jsp"></jsp:include>
		<div class="admin-content">
			<label>
				<input type="radio" name="chartType" value="1" checked />
				<span>연간</span>
			</label>
			<label>
				<input type="radio" name="chartType" value="2" />
				<span>월간</span>
			</label>
			<label>
				<input type="radio" name="chartType" value="3" />
				<span>주간</span>
			</label>
		  	<canvas id="myChart" width="1200" height="400"></canvas>
		</div>
	</section>
	<script>
		const $ctx = document.getElementById('myChart');
		const $radios = document.querySelectorAll('input[name="chartType"]');
		
		// 오늘 날짜 데이터
		let today = new Date();

		// 그래프 범위 조회
		let salesRange = {};	
		fetch("/getSalesRange")
			.then(response => response.json())
			.then(data => {
				salesRange = data;
			})
			.catch(error => console.log(error));
		
		
		// 올해 연간 매출 그래프 출력
		setYearlyGraph(today);
		
		$radios.forEach(radio => {
			radio.addEventListener("change", e => {
				const value = e.currentTarget.value;
				
				if(value === "1") {
					setYearlyGraph(today);
				}
				else if(value === "2") {
					setMonthlyGraph(today);
				}
				else {
					setWeeklyGraph(today);
				}
			})
		})
	</script>
</body>
</html>