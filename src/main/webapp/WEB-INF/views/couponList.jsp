<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>내 쿠폰함</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #b71c1c;
  --bg-light: #fff7f7;
  --text-color: #333;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #fffdfd;
  color: var(--text-color);
}

h2 {
  text-align: center;
  color: var(--main-color);
  font-size: 26px;
  margin: 40px auto 30px;
}

.empty-msg {
  text-align: center;
  color: #aaa;
  font-size: 16px;
  margin-top: 40px;
}

.coupon-table {
  width: 90%;
  max-width: 600px;
  margin: 0 auto 60px;
  border-collapse: separate;
  border-spacing: 0;
  border: 2px solid var(--main-color);
  border-radius: 12px;
  overflow: hidden;
  background-color: #fff;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

.coupon-table thead th {
  background-color: var(--main-color);
  color: #fff;
  padding: 14px 18px;
  font-size: 15px;
}

.coupon-table tbody td {
  padding: 14px 16px;
  font-size: 14px;
  text-align: center;
  background-color: var(--bg-light);
}

.coupon-table tbody tr:nth-child(even) td {
  background-color: #fdf2f2;
}
</style>

<jsp:include page="./fragments/header.jsp"></jsp:include>

<h2>🎁 내 쿠폰 목록</h2>

<c:if test="${empty couponList}">
  <p class="empty-msg">보유한 쿠폰이 없습니다.</p>
</c:if>

<c:if test="${not empty couponList}">
  <table class="coupon-table">
    <thead>
      <tr>
        <th>쿠폰 이름</th>
        <th>할인율</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="coupon" items="${couponList}">
        <tr>
          <td>${coupon.name}</td>
          <td>${coupon.discount_rate}%</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</c:if>

<jsp:include page="./fragments/footer.jsp"></jsp:include>
