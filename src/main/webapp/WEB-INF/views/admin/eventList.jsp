<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트 목록</title>
	<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section id="eventList">
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>이벤트 목록</h2>
			<table class="list-table" border="1">
				<thead>
					<tr>
						<th>이벤트 번호</th>
						<th>이벤트 명</th>
						<th>이벤트 기간</th>
					</tr>
				</thead>
				
				<tbody>
					<c:choose>
				      	<c:when test="${empty elist}">
				        <tr>
				          <td colspan="5" style="text-align: center; padding: 20px; color: #999;">
				            등록된 이벤트가 없습니다.
				          </td>
				        </tr>
				      	</c:when>
				      	<c:otherwise>
					        <c:forEach var="event" items="${elist}" varStatus="status">
								<tr>
									<td>${event.eno}</td>
									<td><a href="/admin/eventDetail?eno=${event.eno}">${event.name}</a></td>
									<td>
										<span>
											<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
											-
											<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />						
										</span>
									</td>
								</tr>
							</c:forEach>
				      	</c:otherwise>
				    </c:choose>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>