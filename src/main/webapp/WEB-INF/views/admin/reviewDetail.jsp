<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h2>리뷰 상세 보기</h2>
			<p>리뷰 번호: ${review.rvno }</p>
			<p>내용: ${review.content }</p>
			<p>예매 번호: ${review.rno }</p>
			<p>작성일: ${review.rvdate }</p>
		</div>
	</section>
</body>
</html>