<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
</head>
<body>
	<h1>Admin Main</h1>
	<hr/>
	<a href="/admin/event">이벤트/쿠폰 관리 페이지</a>
	<a href="/admin/reservationList">예매 목록 페이지</a>
	<a href="${pageContext.request.contextPath}/admin/answers/UnansweredList">미답변 QnA 보기</a>
	<a href="${pageContext.request.contextPath}/notice/NoticeList">공지사항 목록보기</a>
</body>
</html>