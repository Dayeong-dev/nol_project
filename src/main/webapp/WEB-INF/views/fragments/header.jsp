<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header>
	<a href="/">Logo</a>
	<c:choose>
		<c:when test="${sessionScope.id != null}">
			<ul>
				<li><a href="/reserve">예매하기</a></li>
				<li>어트랙션</li>
				<li>QnA</li>
				<li>FAQ</li>
				<li>마이페이지</li>
				<li><a href="/logout">로그아웃</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul>
				<li><a href="/reserve">예매하기</a></li>
				<li>어트랙션</li>
				<li>FAQ</li>
				<li><a href="login">로그인</a></li>
				<li><a href="join">회원가입</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</header>