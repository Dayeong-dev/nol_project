<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<style>
/* 헤더 전체 */
header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 40px;
	background-color: #fff;
	border-bottom: 1px solid #ddd;
	font-family: sans-serif;
}

/* 로고 */
header .logo {
	display: flex;
	align-items: center;
}

header .logo img {
	height: 40px;
	margin-right: 10px;
}

/* 메뉴 */
header nav {
	flex: 1;
	text-align: center;
}

header nav ul {
	list-style: none;
	display: inline-flex;
	gap: 40px;
	padding: 0;
	margin: 0;
}

header nav ul li a {
	text-decoration: none;
	color: #222;
	font-weight: bold;
}

/* 로그인/유저정보 */
header .user-section {
	text-align: right;
	font-size: 14px;
}

header .user-section a {
	text-decoration: none;
	color: #0077cc;
	margin-left: 10px;
}
</style>

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
				<span><strong><c:out value="${sessionScope.name}"
							default="회원" /></strong>님 환영합니다</span>
				<a href="/mypage">마이페이지</a>
				<a href="/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="/login">로그인</a>
				<a href="/join">회원가입</a>
			</c:otherwise>
		</c:choose>
	</div>
</header>