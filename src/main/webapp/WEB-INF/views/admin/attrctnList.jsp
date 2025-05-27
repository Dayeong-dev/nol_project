<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>어트랙션 목록</h2>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th><th>이름</th><th>난이도</th><th>운행 여부</th><th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="at" items="${list }">
						<tr>
							<td>${at.atno }</td>
							<td>${at.name }</td>
							<td>
								<c:choose>
									<c:when test="${at.alevel == 1 }">초급</c:when>
									<c:when test="${at.alevel == 2 }">중급</c:when>
									<c:when test="${at.alevel == 3 }">고급</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${at.state == 1}">
										<span>운행 중</span>
									</c:when>
									<c:otherwise>
										<span>운행 중단</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="/admin/attrctnDetail.do?atno=${at.atno }">🔍상세 보기/수정</a> | 
								<a href="/admin/attrctnDelete.do?atno=${at.atno }" onclick="return confirm('정말 삭제하시겠습니끼?');">🗑삭제 </a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>