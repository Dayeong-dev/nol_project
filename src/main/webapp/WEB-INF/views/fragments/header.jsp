<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    long now = System.currentTimeMillis();
    long lastAccess = session.getLastAccessedTime();
    int maxInactiveInterval = session.getMaxInactiveInterval(); 
    int elapsed = (int)((now - lastAccess) / 1000); 
    int remainingSeconds = maxInactiveInterval - elapsed;
    if (remainingSeconds < 0) remainingSeconds = 0;
%>

<header>
	<!-- 왼쪽 로고 -->
	<div class="logo">
		<a href="/">  <img src="/nol_image/logo.png" alt="EASYWORLD 로고" height="140"> 
		</a>
	</div>
	<!-- 중앙 메뉴 -->
	<nav>
		<ul>
			<li><a href="/reserve">예매</a></li>
			<li><a href="/coupon">쿠폰</a></li>
			<li><a href="/mypage">마이페이지</a></li>
			<li><a href="/attrctn">어트랙션</a></li>
			<li><a href="/notice/NoticeList">공지사항</a></li>
			<li><a href="/QuestionsList">QnA</a></li>
			<li><a href="/faq">FAQ</a></li>
			<li><a href="/reviews">리뷰보기</a></li>
		</ul>
	</nav>

	<!-- 오른쪽 유저 정보 -->
	<div class="user-section">

	
		<c:choose>
			<c:when test="${sessionScope.id != null}">
				<span><strong><c:out value="${sessionScope.name}" default="회원" /></strong>님 환영합니다</span>
				<a href="/mypage">마이페이지</a>
				<a href="/logout">로그아웃</a>
				 <%-- <br>
    <span style="font-size: 12px; color: gray;">세션 남은 시간: <span id="session-timer"><%= remainingSeconds %></span>초</span> --%>
			</c:when>	
		<c:otherwise>
				<a href="/login">로그인</a>
				<a href="/join">회원가입</a>
			</c:otherwise>
		</c:choose>
	</div>
</header>
<link rel="stylesheet" href="/css/style.css" />
