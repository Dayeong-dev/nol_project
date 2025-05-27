<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
:root {
   --main-color: #d62828;
   --hover-color: #b71c1c;
   --light-bg: #fff0f0;
   --text-color: #333;
}

body {
   font-family: 'Segoe UI', sans-serif;
   background-color: #fffdfd;
   color: var(--text-color);
   line-height: 1.6;
}

h2 {
   text-align: center;
   color: var(--main-color);
   font-size: 28px;
   margin: 40px 0 30px;
}

/* 📦 예약 내역 컨테이너 */
.reservation-box {
   display: flex;
   border: 2px solid var(--main-color);
   border-radius: 10px;
   overflow: hidden;
   margin: 30px auto;
   max-width: 900px;
   box-shadow: 0 4px 10px rgba(0,0,0,0.08);
   background: #fffdfd;
}

/* 🎫 왼쪽 티켓 이미지 */
.reservation-image {
   flex: 0 0 200px;
   background-color: var(--light-bg);
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 20px;
}

.reservation-image img {
   max-height: 180px;
}

/* 📝 오른쪽 정보 테이블 */
.reservation-info {
   flex: 1;
   background-color: #fff;
}

.reservation-info table {
   width: 100%;
   border-collapse: collapse;
}

.reservation-info th,
.reservation-info td {
  text-align: left;
  padding: 12px 16px;
  font-size: 14px;
  border-bottom: 1px solid #eee;
}

.reservation-info th {
  background-color: #fff; /* 🔴 왼쪽 배경 흰색으로 통일 */
  color: var(--text-color); /* 🔴 글자색 기본 검정 */
  width: 120px;
  font-weight: bold;
}

.review-button {
   display: flex;
   padding: 16px;
   justify-content: flex-end;
   gap: 15px;
}

.review-button button {
   padding: 8px 20px;
   background-color: var(--main-color);
   border: none;
   color: white;
   font-weight: bold;
   border-radius: 5px;
   cursor: pointer;
}

.review-button button:hover {
   background-color: var(--hover-color);
}

.empty-message {
   text-align: center;
   color: #aaa;
   font-size: 16px;
   margin-top: 30px;
}

.bottom-buttons {
   display: flex;
   justify-content: center;
   gap: 20px;
   margin: 50px auto;
}
.bottom-buttons a {
   background-color: var(--main-color);
   color: white;
   text-decoration: none;
   padding: 10px 24px;
   border-radius: 6px;
   font-weight: bold;
}
.bottom-buttons a:hover {
   background-color: var(--hover-color);
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>

<h2>예매 내역</h2>

<c:if test="${empty myReserveList}">
   <p class="empty-message">예매 내역이 없습니다.</p>
</c:if>

<c:forEach var="reservelist" items="${myReserveList}">
   <div class="reservation-box">

      <!-- 🎫 티켓 이미지 -->
      <div class="reservation-image">
         <c:choose>
            <c:when test="${reservelist.TICKETNAME.contains('오전')}">
               <img src="/nol_image/morningpass.png" alt="오전권">
            </c:when>
            <c:when test="${reservelist.TICKETNAME.contains('오후')}">
               <img src="/nol_image/afternoonpass.png" alt="오후권">
            </c:when>
            <c:when test="${reservelist.TICKETNAME.contains('종일')}">
               <img src="/nol_image/alldaypass.png" alt="종일권">
            </c:when>
            <c:otherwise>
               <img src="/nol_image/logo.png" alt="기본 로고">
            </c:otherwise>
         </c:choose>
      </div>

      <!-- 📝 예매 정보 -->
      <div class="reservation-info">
         <table>
            <tr><th>티켓명</th><td>${reservelist.TICKETNAME}</td></tr>
            <tr><th>이용일</th><td><fmt:formatDate value="${reservelist.RESERVEDATE}" pattern="yyyy-MM-dd" /></td></tr>
            <tr><th>수량</th><td>${reservelist.QUANTITY}장</td></tr>
            <tr><th>1장 단가</th><td><fmt:formatNumber value="${reservelist.UNITPRICE}" pattern="#,##0" />원</td></tr>
            <tr><th>총 금액</th><td><fmt:formatNumber value="${reservelist.TOTALPRICE}" pattern="#,##0" />원</td></tr>
         </table>
         <div class="review-button">
            <form action="reviewWrite" method="get">
               <input type="hidden" name="rno" value="${reservelist.RNO}">
               <button type="submit">리뷰 작성</button>
            </form>
            <form action="reviewDetail" method="get" style="display:inline;">
				<button type="submit">나의 리뷰 보기</button>
			</form>
         </div>
      </div>
   </div>
</c:forEach>

<div class="bottom-buttons">
   <a href="/reserve">🎟 다시 예매하러 가기</a>
   <a href="/mypage/couponList" onclick="requireLogin('/mypage/couponList')">🎁 내 쿠폰함 보기</a>
</div>

<script>
   const isLoggedIn = "${sessionScope.id}" !== "";
   function requireLogin(targetUrl) {
      if (!isLoggedIn) {
         alert("로그인 후 이용해주세요.");
         window.location.href = "/login";
      } else {
         window.location.href = targetUrl;
      }
   }
</script>

<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
