<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form{
		display: inline;
	}
	button{
		all: unset;
		cursor: pointer;
		margin: 0 10px 0 5px;
	}
	a{
		text-decoration: none;
		color: black;
		margin: 0 5px;
	}
	.color:hover {
		color: #0090aa;
	}
	
</style>
</head>
<body>
<h1>리뷰 목록</h1>
<table border="1">
	<thead>
		<tr>
			<th>번호</th><th>리뷰내용</th><th>예매번호</th><th>작성일</th><th>관리</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="review" items="${list }">
		<tr>
			<td>${review.rvno }</td>
			<td>${review.content }</td>
			<td>${review.rno }</td>
			<td>${review.rvdate }</td>
			<td>
				<a href="reviewDetail.do?rvno=${review.rvno }" class="color">🔍상세 보기</a> | 
				<form action="/admin/reviewDelete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
					<input type="hidden" name="rvno" value="${review.rvno }">
					<button type="submit" class="color">🗑삭제</button>
				</form>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>