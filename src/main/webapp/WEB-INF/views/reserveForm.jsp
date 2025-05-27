<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 예매</title>
<style>
:root {
  --main-color: #d62828;
  --hover-color: #a81e1e;
  --bg-light: #fffdfd;
  --text-color: #333;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: var(--bg-light);
  color: var(--text-color);
  margin: 0;
  padding: 0;
}

h2 {
  color: var(--main-color);
  text-align: center;
  margin: 40px 0 24px;
  font-size: 26px;
}

form {
  max-width: 500px;
  margin: 0 auto;
  background-color: #fff;
  padding: 30px 40px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

label {
  font-weight: bold;
  display: block;
  margin-top: 18px;
  font-size: 15px;
}

input[type="text"],
input[type="date"],
input[type="number"],
select {
  width: 100%;
  padding: 10px 12px;
  margin-top: 6px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  box-sizing: border-box;
}

.price-box {
  font-size: 18px;
  color: var(--main-color);
  font-weight: bold;
  margin-top: 24px;
  text-align: right;
}

input[type="submit"] {
  background-color: var(--main-color);
  color: white;
  border: none;
  padding: 12px 20px;
  font-weight: bold;
  font-size: 15px;
  border-radius: 6px;
  cursor: pointer;
  margin-top: 24px;
  width: 100%;
}

input[type="submit"]:hover {
  background-color: var(--hover-color);
}

.back-link {
  display: block;
  margin-top: 30px;
  text-align: center;
  color: #555;
  font-size: 14px;
  text-decoration: none;
}

.back-link:hover {
  text-decoration: underline;
  color: var(--main-color);
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp" />

<section>
  <h2>🎟️ ${ticket.name} 예매하기</h2>

  <form action="/reserve" method="post">
    <input type="hidden" name="tno" value="${ticket.tno}">
    <input type="hidden" name="id" value="${sessionScope.id}">
    <input type="hidden" id="unitPrice" value="${ticket.price}">
    <input type="hidden" name="discountRate" id="discountRate" value="0">

    <label>티켓명</label>
    <input type="text" value="${ticket.name}" disabled>

    <label>1장 가격</label>
    <input type="text" value="<fmt:formatNumber value='${ticket.price}' pattern='#,##0' />원" disabled>

    <label>내용</label>
    <input type="text" value="${ticket.content}" disabled>

    <label for="tdate">이용 날짜</label>
    <input type="date" name="tdate" id="tdate"
           min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>

    <label for="quantity">수량</label>
    <input type="number" id="quantity" name="quantity" value="1" min="1"
           required onchange="updateTotal()" oninput="updateTotal()">

    <label for="coupon">쿠폰 선택</label>
    <select name="ucno" id="coupon" onchange="updateTotal()">
      <option value="0" data-discount="0">선택 안함</option>
      <c:forEach var="coupon" items="${userCoupons}">
        <option value="${coupon.ucno}" data-discount="${coupon.discount_rate}">
          ${coupon.name} (${coupon.discount_rate}% 할인)
        </option>
      </c:forEach>
    </select>

    <div class="price-box">
      총 가격: <span id="totalPrice"><fmt:formatNumber value="${ticket.price}" pattern="#,##0" />원</span>
    </div>

    <input type="submit" value="예매하기">
  </form>

  <a class="back-link" href="/reserve">← 티켓 목록으로 돌아가기</a>
</section>

<script>
  function updateTotal() {
    const price = parseInt(document.getElementById("unitPrice").value);
    const qty = parseInt(document.getElementById("quantity").value);
    const select = document.getElementById("coupon");
    const discount = parseInt(select.options[select.selectedIndex].getAttribute("data-discount"));

    let total = price * qty;
    if (!isNaN(discount) && discount > 0) {
      total -= total * discount / 100;
    }

    document.getElementById("totalPrice").innerText = Math.floor(total).toLocaleString() + "원";
    document.getElementById("discountRate").value = discount;
  }

  document.addEventListener("DOMContentLoaded", () => {
    updateTotal(); // 최초 로딩 시 가격 계산
  });
</script>

<jsp:include page="./fragments/footer.jsp" />
</body>
</html>
