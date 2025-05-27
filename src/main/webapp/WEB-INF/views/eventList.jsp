<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트 목록</title>
	<style>
		#eventList {
		  	width: 920px; /* 좌우 마진 80px씩 */
		  	margin: 0 auto; /* 위아래 여백 + 중앙 정렬 */
		}

		.event-container {
		  	display: flex;
		  	flex-wrap: wrap;
		  	gap: 32px;
		}

		.event-item {
		  	width: calc((100% - 96px) / 3); /* 4칸 기준, 32px * 3 간격 */
		  	background: #fff;
		  	border-radius: 16px;
		  	overflow: hidden;
		  	transition: transform 0.2s ease, box-shadow 0.2s ease;
		  	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
		}
		
		.event-item:hover {
		  	transform: translateY(-5px);
		}
		
		.event-item a {
		  	display: block;
		  	text-decoration: none;
		  	color: inherit;
		}
		
		/* 썸네일 이미지 */
		.event-item img {
		  	width: 100%;
		  	height: 160px;
		  	object-fit: cover;
		  	border-radius: 16px 16px 0 0; /* 상단만 둥글게 */
		}
		
		/* 텍스트 박스 */
		.event-info {
		  	padding: 16px;
		}
		
		.event-info h3 {
		  	font-size: 16px;
		  	margin: 0 0 8px;
		  	font-weight: bold;
		  	color: #222;
		}
		
		.event-info .date {
		  	font-size: 14px;
		  	color: #666;
		  	margin: 0;
		}
	</style>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section id="eventList">
		<h2>이벤트 목록</h2>
		<div class="event-container">
			<c:forEach var="event" items="${elist}" varStatus="status">
				<c:if test="${!event.isPast()}">
					<div class="event-item">
						<a href="/eventDetail?eno=${event.eno}">
							<img src="${event.thumbnailURL}" />
							<div class="event-info">
				            	<h3>${event.name}</h3>
				            	<p class="date">
				              		<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
				              		-
				              		<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />
				            	</p>
				          	</div>
						</a>
					</div>
					<div class="event-item">
						<a href="/eventDetail?eno=${event.eno}">
							<img src="${event.thumbnailURL}" />
							<div class="event-info">
				            	<h3>${event.name}</h3>
				            	<p class="date">
				              		<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
				              		-
				              		<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />
				            	</p>
				          	</div>
						</a>
					</div>
					<div class="event-item">
						<a href="/eventDetail?eno=${event.eno}">
							<img src="${event.thumbnailURL}" />
							<div class="event-info">
				            	<h3>${event.name}</h3>
				            	<p class="date">
				              		<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
				              		-
				              		<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />
				            	</p>
				          	</div>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>