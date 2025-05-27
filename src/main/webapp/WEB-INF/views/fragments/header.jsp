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
<!-- 로그인 여부를 JS 변수로 전달 -->
<c:choose>
  <c:when test="${sessionScope.id != null}">
    <script>const isLoggedIn = true;</script>
  </c:when>
  <c:otherwise>
    <script>const isLoggedIn = false;</script>
  </c:otherwise>
</c:choose>
<header>
	<!-- 왼쪽 로고 -->
	<div class="logo">
		<a href="/"><img src="/nol_image/logo.png" alt="EASYWORLD 로고"></a>
	</div>

	<!-- 중앙 메뉴 -->
	<nav>
		<ul>
			<li><a onclick="requireLogin('/reserve')">예매</a></li>
			<li><a href="/attrctn">어트랙션</a></li>
			<li><a href="/notice/NoticeList">공지사항</a></li>
			<li><a href="/eventList">이벤트</a></li>
			<li><a onclick="requireLogin('/QuestionsList')">QnA</a></li>
			<li><a href="/faq">FAQ</a></li>
			<li><a href="/reviews">리뷰보기</a></li>
			<li><a onclick="requireLogin('/mypage')">마이페이지</a></li>
		</ul>
	</nav>

	<!-- 오른쪽 유저 정보 -->
	<div class="user-section">
		<c:choose>
			<c:when test="${sessionScope.id != null}">
				<span><strong><c:out value="${sessionScope.name}" default="회원" /></strong>님 환영합니다</span>
				<a href="/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="/login">로그인</a>
				<a href="/join">회원가입</a>
			</c:otherwise>
		</c:choose>
	</div>
</header>
<!-- 로그인 체크 -->
<script>
function requireLogin(targetUrl) {
  if (!isLoggedIn) {
    alert("로그인 후 이용해주세요.");
    window.location.href = "/login";
  } else {
    window.location.href = targetUrl;
  }
}
</script>
<link rel="stylesheet" href="/css/style.css" />
