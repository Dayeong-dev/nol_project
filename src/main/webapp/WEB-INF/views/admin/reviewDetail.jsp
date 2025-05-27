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
		<div id="reviewDetail" class="admin-content">
		    <h2>리뷰 상세 보기</h2>
		  	<div class="review-card">
		    	<ul class="review-info">
		      		<li>
		        		<span class="label">리뷰 번호</span>
		        		<span class="value">${review.rvno}</span>
		      		</li>
		      		<li>
		        		<span class="label">예매 번호</span>
		        		<span class="value">${review.rno}</span>
		      		</li>
		      		<li>
		        		<span class="label">작성일</span>
		        		<span class="value">${review.rvdate}</span>
		      		</li>
		      		<li>
		        		<span class="label">내용</span>
		        		<span class="value">${review.content}</span>
		      		</li>
		    	</ul>
		  	</div>
		</div>
	</section>
</body>
</html>