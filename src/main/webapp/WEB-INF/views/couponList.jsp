<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
:root {
  --main-color: #d62828;
  --hover-color: #b71c1c;
  --bg-light: #fff5f5;
  --text-dark: #333;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #fffdfd;
}

h2 {
  text-align: center;
  color: var(--main-color);
  margin: 40px 0 20px 0;
}

.empty-msg {
  text-align: center;
  color: #aaa;
  font-size: 16px;
  margin-top: 30px;
}

table {
  width: 60%;
  margin: 0 auto 50px;
  border-collapse: separate;
  border-spacing: 0;
  border: 2px solid var(--main-color);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  background-color: var(--bg-light);
}

table th {
  background-color: var(--main-color);
  color: #fff;
  padding: 12px 16px;
  font-weight: bold;
  font-size: 15px;
}

table td {
  padding: 14px;
  color: var(--text-dark);
  background-color: #fff;
  font-size: 14px;
}

table tr:nth-child(even) td {
  background-color: #fdf2f2;
}
</style>
<jsp:include page="./fragments/header.jsp"></jsp:include>
<h2>내 쿠폰 목록</h2>

<c:if test="${empty couponList}">
  <p class="empty-msg">보유한 쿠폰이 없습니다.</p>
</c:if>

<c:if test="${not empty couponList}">
  <table>
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
