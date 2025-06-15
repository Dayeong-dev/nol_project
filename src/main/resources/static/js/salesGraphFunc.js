let myLineChart;

let tickets = [];
fetch("/getTicketType")
	.then(response => response.json())
	.then(data => {
		tickets = data;
	})
	.catch(error => console.log(error));

function getISOWeekYear(tmpDate) {
	 tmpDate.setDate(tmpDate.getDate() + 3 - ((tmpDate.getDay() + 6) % 7));
	 return tmpDate.getFullYear();
}

function getISOWeek(tmpDate) {		  
	 // ISO 기준으로 목요일 기준
	 tmpDate.setHours(0, 0, 0, 0);
	 tmpDate.setDate(tmpDate.getDate() + 3 - ((tmpDate.getDay() + 6) % 7));

	 const firstThursday = new Date(tmpDate.getFullYear(), 0, 4);
	 const diff = tmpDate - firstThursday;

	 // 1주 = 7 * 24 * 60 * 60 * 1000 = 604800000
	 return 1 + Math.round(diff / 604800000);
}

// 올해 연간 매출
async function setYearlyGraph(curr_date) {
	let labels = [];
	let dataObj = {};
	
	const year = curr_date.getFullYear();
	
	await fetch("/yearlySales?year=" + year)
		.then(response => response.json())
		.then(data => {
			const month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
			labels = month.map(v => v + '월');
			
			for(let ticket of tickets) {
				dataObj[ticket.name] = Array(labels.length).fill(0);				
			}

			for(let row of data) {			
				if(!dataObj[row.tname]) {
					dataObj[row.tname] = labels.map(() => 0);
				}
								
				const idx = month.indexOf(Number(row.tmonth));
				dataObj[row.tname][idx] += row.monthlySales;
			}
			
			setChart(labels, dataObj, year + "년 연간 매출");
		})
		.catch(error => console.log(error));
	
	return {labels: labels, dataObj: dataObj};
}

// 이번 달 월간 매출
async function setMonthlyGraph(curr_date) {
	let labels = [];
	let dataObj = {};
		
	const year = curr_date.getFullYear();
	const month = curr_date.getMonth() + 1;

	await fetch("/monthlySales?year=" + year + "&month=" + month.toString().padStart(2, '0'))
		.then(response => response.json())
		.then(data => {
			const lastDay = new Date(year, month, 0).getDate(); 
			const days = Array(lastDay).fill(1).map((v, i) => v + i);
			
			labels = days.map(v => year + "-" + month.toString().padStart(2, '0') + "-" + v.toString().padStart(2, '0'));
			// labels = days.map(v => v + "일");

			for(let ticket of tickets) {
				dataObj[ticket.name] = Array(labels.length).fill(0);				
			}

			for(let row of data) {
				if(!dataObj[row.tname]) {
					dataObj[row.tname] = labels.map(() => 0);
				}
				
				const idx = labels.indexOf(row.tdate);
				dataObj[row.tname][idx] += row.dailySales;
			}
			
			
			setChart(labels, dataObj, year + "년 " + (curr_date.getMonth() + 1) + "월 매출");
		})
		.catch(error => console.log(error));
	
	return {labels: labels, dataObj: dataObj};
}

// 이번 주 주간 매출
async function setWeeklyGraph(curr_date) {
	let labels = [];
	let dataObj = {};
	
	const isoYear = getISOWeekYear(curr_date);
	const isoWeek = getISOWeek(curr_date);
	
	const year = curr_date.getFullYear();
	const month = curr_date.getMonth() + 1;
	const date = curr_date.getDate();
	
	const dateStr = year + month.toString().padStart(2, '0') + date.toString().padStart(2, '0');
	
	await fetch("/weeklySales?date=" + dateStr)
		.then(response => response.json())
		.then(data => {
			const day = curr_date.getDay();
			
			// ISO 기준에서 주의 시작은 월요일이므로, 보정값 계산
			// Sunday: -6, Monday: 0, Tuesday: -1, ...
			const diffToMonday = (day === 0 ? -6 : 1 - day);
			
			const monday = new Date(curr_date);
			monday.setDate(curr_date.getDate() + diffToMonday);
			
			for (let i = 0; i < 7; i++) {
			  	const d = new Date(monday);
			  	d.setDate(monday.getDate() + i);
			  	// result.push(d.toLocaleDateString().split('T')[0]); // 'YYYY-MM-DD' 형식
			  	
			  	let dYear = d.getFullYear();
			  	let dMonth = (d.getMonth() + 1).toString().padStart(2, '0');
			  	let dDay = d.getDate().toString().padStart(2, '0');

			  	labels.push(dYear + "-" + dMonth + "-" + dDay);
			}

			for(let ticket of tickets) {
				dataObj[ticket.name] = Array(labels.length).fill(0);				
			}
			
			for(let row of data) {
				if(!dataObj[row.tname]) {
					dataObj[row.tname] = labels.map(() => 0);
				}
				
				const idx = labels.indexOf(row.tdate);
				dataObj[row.tname][idx] += row.dailySales;
			}
			
			setChart(labels, dataObj, isoYear + "년 " + isoWeek + "주차 매출");
		})
		.catch(error => console.log(error));
		
	return {labels: labels, dataObj: dataObj};
}

function setChart(labels, dataObj, title) {	
	if(myLineChart != undefined) {
		myLineChart.destroy();
	}
	
	let datasets = [];
	
	for(let key in dataObj) {
		datasets.push({
			label: key,
			data: dataObj[key],
			borderWidth: 1
		});
	}
	
	myLineChart = new Chart($ctx, {
		type: 'bar',
		data: {
			labels: labels,
		    datasets: datasets
		},
		options: {
		    responsive: false, 
		    scales: {
		    	y: {
		          	beginAtZero: true
		        }
		    }, 
			interaction: {
			  mode: 'nearest',
			  intersect: true
			},
		    plugins: {
		        legend: {
		          	position: 'top',
		        },
		        title: {
		          	display: true,
		          	text: title
		        }, 
				tooltip: {
			    	mode: 'nearest',
			    	intersect: true
			 	}
		    }, 
			hover: {
				mode: 'nearest',
				intersect: true
			}
		}
	});	
}