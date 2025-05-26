<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 메인</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="/js/salesGraphFunc.js"></script>
  <style>
    a {
      margin: 10px;
    }
  </style>
</head>
<body>
	<h1>Admin Main</h1>
	<hr/>
	<a href="/admin/event">이벤트/쿠폰 관리 페이지</a>
	<a href="/admin/reservationList">예매 목록 페이지</a>
	<a href="${pageContext.request.contextPath}/QuestionsList">전체 QnA 보기</a>
	<a href="${pageContext.request.contextPath}/notice/NoticeList">공지사항 목록보기</a>
	<a href="/admin/attrctnList">어트랙션 목록보기</a>
	<a href="/admin/reviewList">리뷰 목록보기</a>
	<section id="salesChart">
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
	</section>
	<script>
		const $ctx = document.getElementById('myChart');
		const $radios = document.querySelectorAll('input[name="chartType"]');
		
		// 오늘 날짜 문자열 포맷
		let today = new Date();

		// 그래프 범위 저장
		let salesRange;
		
		fetch("/getSalesRange")
			.then(response => response.json())
			.then(data => {
				salesRange = data;
			})
			.catch(error => console.log(error));
		
		// 올해 연간 매출 그래프 출력
		setThisYearly(today);
		
		$radios.forEach(radio => {
			radio.addEventListener("change", e => {
				const value = e.currentTarget.value;
				
				if(value === "1") {
					setThisYearly(today);
				}
				else if(value === "2") {
					setThisMonthly(today);
				}
				else {
					setThisWeekly(today);
				}
			})
		})
	</script>
</body>
</html>