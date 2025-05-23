<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header>
	<a href="/">Logo</a>
	<c:choose>
		<c:when test="${sessionScope.id != null}">
			<ul>
				<li><a href="/reserve">예매하기</a></li>
				<li><a href="/attrctn">어트랙션</a></li>
				<li><a href="/notice/NoticeList">공지사항</a></li>
				<li><a href="/QuestionsList">QnA</a></li>
				<li><a href="/faq">FAQ</a></li>
				<li>마이페이지</li>
				<li><a href="/logout">로그아웃</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li><a href="/reserve">예매하기</a></li>
				<li><a href="/attrctn">어트랙션</a></li>
				<li><a href="/notice/NoticeList">공지사항</a></li>
				<li><a href="/faq">FAQ</a></li>
				<li><a href="/login">로그인</a></li>
				<li><a href="/join">회원가입</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</header>