<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매출 상세</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="/js/salesGraphFunc.js"></script>
	<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section id="salesDetail">
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>매출 상세</h2>
			<div id="btnList">
				<button id="prevBtn" onclick="prevPage()">지난 해</button>
				<button id="nextBtn" onclick="nextPage()">다음 해</button>
			</div>
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
		const $prevBtn = document.getElementById('prevBtn');
		const $nextBtn = document.getElementById('nextBtn');
		
		// 오늘 날짜 문자열 포맷
		let dateTime = new Date();

		// 그래프 범위 저장
		let salesRange;
		let btnType = "1";		// 1: 연간, 2: 월간, 3: 주간
		
		fetch("/getSalesRange")
			.then(response => response.json())
			.then(data => {
				salesRange = data;
			})
			.catch(error => console.log(error));
		
		// 올해 연간 매출 그래프 출력
		setYearlyGraph(dateTime);
		
		$radios.forEach(radio => {
			radio.addEventListener("change", async(e) => {
				const value = e.currentTarget.value;
				btnType = value;
				
				dateTime = new Date();
				
				if(value === "1") {			// 연간
					$prevBtn.innerText = "지난 해";
					$nextBtn.innerText = "다음 해";
					setYearlyGraph(dateTime);
				}
				else if(value === "2") {		// 월간
					$prevBtn.innerText = "지난 달";
					$nextBtn.innerText = "다음 달";
					setMonthlyGraph(dateTime);
				}
				else {							// 주간
					$prevBtn.innerText = "지난 주";
					$nextBtn.innerText = "다음 주";
					const obj = setWeeklyGraph(dateTime);
				}
			})
		})
		
		function prevPage() {
			if(btnType === "1") {			// 연간
				const year = dateTime.getFullYear();
				if(salesRange.earliestYear === year.toString()) {
					alert("첫 페이지 입니다.");
					return;
				}
				dateTime.setFullYear(dateTime.getFullYear() - 1);
				
				setYearlyGraph(dateTime);
			}
			else if(btnType === "2") {		// 월간
				const year = dateTime.getFullYear();
				const month = dateTime.getMonth();
				
				if(salesRange.earliestYear === year.toString() 
						&& salesRange.earliestMonth === (month + 1).toString().padStart(2, '0')) {
					alert("첫 페이지 입니다.");
					return;
				}
				dateTime.setMonth(month - 1);
				
				setMonthlyGraph(dateTime);
			}
			else {							// 주간
				const isoYear = getISOWeekYear(dateTime);
				const isoWeek = getISOWeek(dateTime);
				
				if(salesRange.earliestIsoYear === isoYear.toString() 
						&& salesRange.earliestIsoWeek === isoWeek.toString()) {
					alert("첫 페이지 입니다.");
					return;
				}
				dateTime.setDate(dateTime.getDate() - 7);
				
				setWeeklyGraph(dateTime);
			}
		}
		
		function nextPage() {
			if(btnType === "1") {				// 연간
				const year = dateTime.getFullYear();
				if(salesRange.latestYear === year.toString()) {
					alert("마지막 페이지 입니다.");
					return;
				}
				
				dateTime.setFullYear(dateTime.getFullYear() + 1);
				
				setYearlyGraph(dateTime);
			}
			else if(btnType === "2") {		// 월간
				const year = dateTime.getFullYear();
				const month = dateTime.getMonth();
				
				if(salesRange.latestYear === year.toString() 
						&& salesRange.latestMonth === (month + 1).toString().padStart(2, '0')) {
					alert("마지막 페이지 입니다.");
					return;
				}
				
				dateTime.setMonth(month + 1);
				
				setMonthlyGraph(dateTime);
			}
			else {							// 주간
				const isoYear = getISOWeekYear(dateTime);
				const isoWeek = getISOWeek(dateTime);
				
				if(salesRange.latestIsoYear === isoYear.toString() 
						&& salesRange.latestIsoWeek === isoWeek.toString()) {
					alert("마지막 페이지 입니다.");
					return;
				}
				dateTime.setDate(dateTime.getDate() + 7);
				
				setWeeklyGraph(dateTime);
			}
		}
	</script>
</body>
</html>