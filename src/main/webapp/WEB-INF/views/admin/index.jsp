<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	<section>
		<jsp:include page="./fragments/header.jsp"></jsp:include>
		<div class="admin-content">
			<div id="salesChart">
				<div class="radio-area">
				  <input type="radio" name="chartType" value="1" id="yearly" checked>
				  <label for="yearly">연간</label>
				
				  <input type="radio" name="chartType" value="2" id="monthly">
				  <label for="monthly">월간</label>
				
				  <input type="radio" name="chartType" value="3" id="weekly">
				  <label for="weekly">주간</label>
				</div>
			  	<canvas id="myChart" width="1200" height="400"></canvas>
			</div>
			<div id="unAnsweredList">
				<h3>미답변 QnA 미리보기</h3>
			
				<a class="plusBtn" href="/admin/UnansweredList"><button>더보기</button></a>
			
				<div>
					<c:choose>
						<c:when test="${empty questions}">
							<p class="empty-message">현재 미답변 QnA가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<table class="list-table">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>답변 작성</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="q" items="${questions}" varStatus="status">
										<c:if test="${status.index < 4}">
											<tr>
												<td>${q.qno}</td>
												<td>${q.title}</td>
												<td>${q.memberName}</td>
												<td>${q.createDate}</td>
												<td>
													<a href="/admin/answers/QuestionsForm?qno=${q.qno}">작성</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
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