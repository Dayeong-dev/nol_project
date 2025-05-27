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
			<h2>리뷰 목록</h2>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th><th>리뷰내용</th><th>예매번호</th><th>작성일</th><th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
				      	<c:when test="${empty list}">
				        <tr>
				          <td colspan="5" style="text-align: center; padding: 20px; color: #999;">
				            등록된 리뷰가 없습니다.
				          </td>
				        </tr>
				      	</c:when>
				      	<c:otherwise>
					        <c:forEach var="review" items="${list }">
								<tr>
									<td>${review.rvno }</td>
									<td>${review.content }</td>
									<td>${review.rno }</td>
									<td>${review.rvdate }</td>
									<td>
										<a href="reviewDetail.do?rvno=${review.rvno }" class="color">🔍상세 보기</a>&nbsp;&nbsp;&nbsp;
										<button type="button" class="color" onclick="deleteReview(${review.rvno})">🗑삭제</button>
									</td>
								</tr>
							</c:forEach>
				      	</c:otherwise>
				    </c:choose>
				</tbody>
			</table>
		</div>
	</section>
	<script>
		function deleteReview(rvno) {
			if(confirm('정말 삭제하시겠습니까?')) {
				location.href = "/admin/reviewDelete/" + rvno;
			}
		}
	</script>
</body>
</html>