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
	img {
		width: 300px;
	}
	
	.item {
		display: inline-block;
	}
	
	.item a {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 4px;
	}
</style>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section id="eventList">
		<c:forEach var="event" items="${elist}" varStatus="status">
			<c:if test="${!event.isPast()}">
				<div class="item">
					<a href="/eventDetail?eno=${event.eno}">
						<img src="${event.thumbnailURL}" />
						<span>${event.name}</span>
						<span>
							<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
							-
							<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />						
						</span>
					</a>
				</div>
			</c:if>
		</c:forEach>
	</section>
</body>
</html>