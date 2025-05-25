<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 메인</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<h1>Admin Main</h1>
	<hr/>
	<a href="/admin/event">이벤트 관리 페이지</a>
	<a href="${pageContext.request.contextPath}/admin/answers/UnansweredList">미답변 QnA 보기</a>
	<section id="chart">
	  	<canvas id="myChart" style="width:50vw;height:30vh;"></canvas>
	</section>
	<script>
		const $ctx = document.getElementById('myChart');
		
		// 오늘 날짜 문자열 포맷
		let today = new Date();
		let year = today.getFullYear();
		let month = (today.getMonth() + 1).toString().padStart(2, '0');
		let day = today.getDate().toString().padStart(2, '0');

		let todayDate = year + month + day;
		
		// 그래프 범위 저장
		let salesRange;
		
		fetch("/getSalesRange")
			.then(response => response.json())
			.then(data => {
				salesRange = data;
				console.log(salesRange);
			})
			.catch(error => console.log(error));
		
		// 올해 연간 매출 그래프 출력
		setThisWeekly();
		
		// 올해 연간 매출
		function setThisYearly() {
			fetch("/yearlySales?date=" + todayDate)
				.then(response => response.json())
				.then(data => {
					const month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
					
					let labels = month.map(v => v + "월");
					let dataObj = {};
					
					for(let row of data) {
						if(!dataObj[row.tname]) {
							dataObj[row.tname] = labels.map(() => 0);
						}
						dataObj[row.tname][month.indexOf(Number(row.tmonth))] += row.monthlySales;
					}
					
					setChart(labels, dataObj);
				})
				.catch(error => console.log(error));
		}
		
		// 이번 달 월간 매출
		function setThisMonthly() {
			fetch("/monthlySales?date=" + todayDate)
				.then(response => response.json())
				.then(data => {
					const lastDay = new Date(year, (today.getMonth() + 1), 0).getDate(); 
					const days = Array(lastDay).fill(1).map((v, i) => v + i);
					
					let labels = days.map(v => year + "-" + month + "-" + v.toString().padStart(2, '0'));
					// let labels = days.map(v => v + "일");
					let dataObj = {};
					
					for(let row of data) {
						if(!dataObj[row.tname]) {
							dataObj[row.tname] = labels.map(() => 0);
						}
						dataObj[row.tname][labels.indexOf(row.tdate)] += row.dailySales;
					}
					
					setChart(labels, dataObj);
				})
				.catch(error => console.log(error));
		}
		
		// 이번 주 주간 매출
		function setThisWeekly() {
			fetch("/weeklySales?date=" + todayDate)
				.then(response => response.json())
				.then(data => {
					const labels = [];
					const day = today.getDay(); // 0 (Sun) ~ 6 (Sat)
					
					// ISO 기준에서 주의 시작은 월요일이므로, 보정값 계산
					// Sunday: -6, Monday: 0, Tuesday: -1, ...
					const diffToMonday = (day === 0 ? -6 : 1 - day);
					
					const monday = new Date(today);
					monday.setDate(today.getDate() + diffToMonday);
					
					for (let i = 0; i < 7; i++) {
					  	const d = new Date(monday);
					  	d.setDate(monday.getDate() + i);
					  	// result.push(d.toLocaleDateString().split('T')[0]); // 'YYYY-MM-DD' 형식
					  	
					  	let dYear = d.getFullYear();
					  	let dMonth = String(d.getMonth() + 1).padStart(2, '0');
					  	let dDay = String(d.getDate()).padStart(2, '0');

					  	labels.push(dYear + "-" + dMonth + "-" + dDay);
					}

					let dataObj = {};
					
					for(let row of data) {
						if(!dataObj[row.tname]) {
							dataObj[row.tname] = labels.map(() => 0);
						}
						dataObj[row.tname][labels.indexOf(row.tdate)] += row.dailySales;
					}
					
					setChart(labels, dataObj);
				})
				.catch(error => console.log(error));
		}
		
		function setChart(labels, dataObj) {
			
			let datasets = [];
			
			for(let key in dataObj) {
				datasets.push({
					label: key,
					data: dataObj[key],
					borderWidth: 1
				});
			}
			
			new Chart($ctx, {
				type: 'bar',
				data: {
					labels: labels,
				    datasets: datasets
				},
				options: {
					reponsive: false,
					scales: {
				    	y: {
				          	beginAtZero: true
				        }
				    }
				}
			});	
		}
	</script>
 
</body>
</html>