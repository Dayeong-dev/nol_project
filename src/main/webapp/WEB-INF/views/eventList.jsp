<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section id="eventList">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이벤트 명</th>
					<th>기간</th>
					<th>진행여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="event" items="${elist}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="/eventDetail?eno=${event.eno}">${event.name}</a></td>
						<td>
							<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
							-
							<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />						
						</td>
						<c:choose>
							<c:when test="${event.isPast()}">
								<td>종료</td>	
							</c:when>
							<c:otherwise>
								<td>진행중</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
</body>
</html>