<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style-type: none;
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>
	<h1>나의 리뷰 목록</h1>
	<p>리뷰를 수정하거나 삭제할 수 있습니다.</p>
	<ul>
		<c:forEach var="review" items="${list}">
			<li>
				<form action="reviewUpdate" method="post" style="display:inline;" onsubmit="return confirm('수정하시겠습니까?');">
					<strong>리뷰번호:</strong> ${review.rvno }<br> 
					<strong>예약번호:</strong> ${review.rno }<br> 
					<strong>내용:</strong> ${review.content }<br>
					<textarea name="content" rows="10" cols="50"><c:out value="${review.content}" /></textarea><br>
					<strong>작성일:</strong> ${review.rvdate }<br>
					
					<input type="hidden" name="rvno" value="${review.rvno}">
					<button type="submit">수정</button>
				</form>
				
				<form action="reviewDelete" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
					<input type="hidden" name="rvno" value="${review.rvno}">
					<button type="submit">삭제</button>
				</form>
			</li>
			<br>
		</c:forEach>
	</ul>

</body>
</html>