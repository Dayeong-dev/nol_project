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
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>매출 상세</h2>
			<div id="salesDetail">
				<div class="chartHeader">
					<div id="btn-area">
						<button id="prevBtn" onclick="prevPage()">지난 해</button>
						<button id="nextBtn" onclick="nextPage()">다음 해</button>
					</div>
					<div class="radio-area">
						<div class="radio-area">
						  	<input type="radio" name="chartType" value="1" id="yearly" checked>
						  	<label for="yearly">연간</label>
						
						  	<input type="radio" name="chartType" value="2" id="monthly">
						  	<label for="monthly">월간</label>
						
						  	<input type="radio" name="chartType" value="3" id="weekly">
						  	<label for="weekly">주간</label>
						</div>
					</div>			
				</div>
			  	<canvas id="myChart" width="930" height="400"></canvas>
			</div>
			<div id="salesDetail">
				<div class="scrollx-wrap">
					<table>
						<thead></thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<script>
		const $ctx = document.getElementById('myChart');
		const $radios = document.querySelectorAll('input[name="chartType"]');
		const $prevBtn = document.getElementById('prevBtn');
		const $nextBtn = document.getElementById('nextBtn');
		
		const $table = document.querySelector('table');
		
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
		(async () => {
			const graphData = await setYearlyGraph(dateTime);
			setTable(graphData.labels, graphData.dataObj, $table);
		})();
		
		
		$radios.forEach(radio => {
			radio.addEventListener("change", async(e) => {
				const value = e.currentTarget.value;
				btnType = value;
				
				dateTime = new Date();
				let graphData;
				
				if(value === "1") {			// 연간
					$prevBtn.innerText = "지난 해";
					$nextBtn.innerText = "다음 해";
					graphData = await setYearlyGraph(dateTime);
				}
				else if(value === "2") {		// 월간
					$prevBtn.innerText = "지난 달";
					$nextBtn.innerText = "다음 달";
					graphData = await setMonthlyGraph(dateTime);
				}
				else {							// 주간
					$prevBtn.innerText = "지난 주";
					$nextBtn.innerText = "다음 주";
					graphData = await setWeeklyGraph(dateTime);
				}
				
				setTable(graphData.labels, graphData.dataObj, $table);
			})
		})
		
		async function prevPage() {
			let graphData;
			
			if(btnType === "1") {			// 연간
				const year = dateTime.getFullYear();
				if(salesRange.earliestYear === year.toString()) {
					alert("첫 페이지 입니다.");
					return;
				}
				dateTime.setFullYear(dateTime.getFullYear() - 1);
				
				graphData = await setYearlyGraph(dateTime);
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
				
				graphData = await setMonthlyGraph(dateTime);
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
				
				graphData = await setWeeklyGraph(dateTime);
			}
			
			setTable(graphData.labels, graphData.dataObj, $table);
		}
		
		async function nextPage() {
			const today = new Date();
			let graphData;
			
			if(btnType === "1") {				// 연간
				const currYear = dateTime.getFullYear();
				const latestYear = today.getFullYear();
				
				if(latestYear <= currYear) {
					alert("마지막 페이지 입니다.");
					return;
				}
				
				dateTime.setFullYear(dateTime.getFullYear() + 1);
				
				graphData = await setYearlyGraph(dateTime);
			}
			else if(btnType === "2") {		// 월간
				const currYear = dateTime.getFullYear();
				const currMonth = dateTime.getMonth();
				
				const latestYear = today.getFullYear();
				const latestMonth = today.getMonth();
				
				
				if(latestYear <= currYear 
						&& latestMonth <= currMonth) {
					alert("마지막 페이지 입니다.");
					return;
				}
				
				dateTime.setMonth(currMonth + 1);
				graphData = await setMonthlyGraph(dateTime);
			}
			else {							// 주간
				const isoYear = getISOWeekYear(dateTime);
				const isoWeek = getISOWeek(dateTime);
				
				const latestIsoYear = getISOWeekYear(today);
				const latestIsoWeek = getISOWeek(today);
				
				if(latestIsoYear <= isoYear 
						&& latestIsoWeek <= isoWeek) {
					alert("마지막 페이지 입니다.");
					return;
				}
				dateTime.setDate(dateTime.getDate() + 7);
				
				graphData = await setWeeklyGraph(dateTime);
			}
			setTable(graphData.labels, graphData.dataObj, $table);
		}
		
		function setTable(labels, dataObj, $table) {
			const $thead = $table.querySelector('thead');
			const $tbody = $table.querySelector('tbody');
			
			$thead.innerHTML = "";
			$tbody.innerHTML = "";
			
			const tr = document.createElement("tr");
			$thead.appendChild(tr);
			
			const keys = Object.keys(labels);
			let idx = 0;
			
			for(let i = 0; i < keys.length + 2; i++) {
				const th = document.createElement("th");
				tr.appendChild(th);
				
				if(i === 0) {
					th.innerText = "티켓 종류";	// 첫 번째 열
					th.setAttribute("class", "sticky-left");
				} 
				else if(idx === keys.length) {
					th.innerText = "총합";		// 마지막 열
					th.setAttribute("class", "sticky-right");
				} 
				else {
					th.innerText = labels[keys[idx++]];
				}
			}
			
			for(let ticket in dataObj) {
				const tr = document.createElement("tr");
				$tbody.appendChild(tr);
				
				// 첫 번째 열
				const td1 = document.createElement("td");
				tr.appendChild(td1);
				
				td1.innerText = ticket;
				td1.setAttribute("class", "sticky-left");
				
				// 중간 열
				let sum = 0;
				for(let cnt of dataObj[ticket]) {
					const td = document.createElement("td");
					tr.appendChild(td);
					
					td.innerText = cnt.toLocaleString() + "원";
					sum += cnt;
				}
				
				// 마지막 열
				const td2 = document.createElement("td");
				tr.appendChild(td2);
				
				td2.innerText = sum.toLocaleString() + "원";
				td2.setAttribute("class", "sticky-right");
			}
		}
	</script>
</body>
</html>