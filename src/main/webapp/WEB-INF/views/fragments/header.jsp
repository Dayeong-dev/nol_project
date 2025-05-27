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
	<span id="session-timer" style="margin-left:10px; color:gray;"></span>
	
		<c:choose>
			<c:when test="${sessionScope.id != null}">
				<span><strong><c:out value="${sessionScope.name}" default="회원" /></strong>님 환영합니다</span>
				<a href="/mypage">마이페이지</a>
				<a href="/logout">로그아웃</a>
			</c:when>	
		<c:otherwise>
				<a href="/login">로그인</a>
				<a href="/join">회원가입</a>
			</c:otherwise>
		</c:choose>
	</div>		
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    const isLoggedIn = '${sessionScope.id != null ? "true" : "false"}';
	
	    if (isLoggedIn === "true") {
	      let remainingSeconds = <%= remainingSeconds %>;
	      console.log("초기 세션 시간:", remainingSeconds);
	
	      const timer = document.getElementById("session-timer");
	
	      function updateSessionTimer() {
	        timer.textContent = `남은 시간: ${remainingSeconds}초`;
	        console.log("updateSessionTimer 실행, 남은 시간 =", remainingSeconds);
	
	        if (remainingSeconds <= 0) {
	          clearInterval(interval);
	          alert("세션이 만료되었습니다. 다시 로그인 해주세요.");
	          window.location.href = "/logout";
	        } else {
	          remainingSeconds--;
	        }
	      }
	
	      updateSessionTimer();
	      const interval = setInterval(updateSessionTimer, 1000);
	    }
	  });
	</script>
</header>
<link rel="stylesheet" href="/css/style.css" />