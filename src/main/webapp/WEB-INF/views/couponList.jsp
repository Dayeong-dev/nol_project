<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
table {
  width: 60%;
  border-collapse: collapse;
  margin: 30px auto;
  font-family: Arial, sans-serif;
}

table th, table td {
  border: 1px solid #ccc;
  padding: 10px 15px;
  text-align: center;
}

table th {
  background-color: #f9f9f9;
  color: #333;
}

table tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>

<h2 style="text-align: center;">내 쿠폰 목록</h2>

<c:if test="${empty couponList}">
  <p style="text-align: center;">보유한 쿠폰이 없습니다.</p>
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
