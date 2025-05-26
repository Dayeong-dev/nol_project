let myLineChart;

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
function setThisYearly(curr_date) {
	const year = curr_date.getFullYear();
	
	fetch("/yearlySales?year=" + year)
		.then(response => response.json())
		.then(data => {
			const month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
			
			let labels = month.map(v => v + "월");
			let dataObj = {
				"오전 이용권": [], 
				"오후 이용권": [], 
				"종일 이용권": [], 
			};

			for(let row of data) {
				if(!dataObj[row.tname]) {
					dataObj[row.tname] = labels.map(() => 0);
				}
				dataObj[row.tname][month.indexOf(Number(row.tmonth))] += row.monthlySales;
			}
			
			setChart(labels, dataObj, year + "년 연간 매출");
		})
		.catch(error => console.log(error));
}

// 이번 달 월간 매출
function setThisMonthly(curr_date) {
	const year = curr_date.getFullYear();
	const month = curr_date.getMonth() + 1;

	fetch("/monthlySales?year=" + year + "&month=" + month.toString().padStart(2, '0'))
		.then(response => response.json())
		.then(data => {
			const lastDay = new Date(year, month, 0).getDate(); 
			const days = Array(lastDay).fill(1).map((v, i) => v + i);
			
			let labels = days.map(v => year + "-" + month.toString().padStart(2, '0') + "-" + v.toString().padStart(2, '0'));
			// let labels = days.map(v => v + "일");
			let dataObj = {
				"오전 이용권": [], 
				"오후 이용권": [], 
				"종일 이용권": [], 
			};

			for(let row of data) {
				if(!dataObj[row.tname]) {
					dataObj[row.tname] = labels.map(() => 0);
				}
				dataObj[row.tname][labels.indexOf(row.tdate)] += row.dailySales;
			}
			
			
			setChart(labels, dataObj, year + "년 " + (curr_date.getMonth() + 1) + "월 매출");
		})
		.catch(error => console.log(error));
}

// 이번 주 주간 매출
function setThisWeekly(curr_date) {
	const isoYear = getISOWeekYear(curr_date);
	const isoWeek = getISOWeek(curr_date);
	
	const year = curr_date.getFullYear();
	const month = curr_date.getMonth() + 1;
	const date = curr_date.getDate();
	
	const dateStr = year + month.toString().padStart(2, '0') + date.toString().padStart(2, '0');
	
	fetch("/weeklySales?date=" + dateStr)
		.then(response => response.json())
		.then(data => {
			const labels = [];
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
			  	let dMonth = String(d.getMonth() + 1).padStart(2, '0');
			  	let dDay = String(d.getDate()).padStart(2, '0');

			  	labels.push(dYear + "-" + dMonth + "-" + dDay);
			}

			let dataObj = {
				"오전 이용권": [], 
				"오후 이용권": [], 
				"종일 이용권": [], 
			};
			
			for(let row of data) {
				if(!dataObj[row.tname].length) {
					dataObj[row.tname] = labels.map(() => 0);
				}
				dataObj[row.tname][labels.indexOf(row.tdate)] += row.dailySales;
			}
			
			setChart(labels, dataObj, isoYear + "년 " + isoWeek + "주차 매출");
		})
		.catch(error => console.log(error));
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
		    plugins: {
		        legend: {
		          	position: 'top',
		        },
		        title: {
		          	display: true,
		          	text: title
		        }
		     }
		}
	});	
}