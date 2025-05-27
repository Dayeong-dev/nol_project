<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>티켓 예매</title>
    <style>

        h2 {
            color: #d62828;
            text-align: center;
            margin-bottom: 30px;
            margin: 0;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"], input[type="date"], input[type="number"], select {
            width: 100%;
            padding: 8px 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .price-box {
            font-size: 20px;
            color: #d62828;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
        }

        input[type="submit"] {
            background-color: #d62828;
            color: white;
            border: none;
            padding: 12px 20px;
            font-weight: bold;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 20px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #a81e1e;
        }

        .back-link {
            display: block;
            margin-top: 25px;
            text-align: center;
            color: #555;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
            color: #d62828;
        }
    </style>
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
    </script>
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
    <input type="text" value="${ticket.price}원" disabled>

    <label>내용</label>
    <input type="text" value="${ticket.content}" disabled>

    <label for="tdate">이용 날짜</label>
    <input type="date" name="tdate" required>

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
        총 가격: <span id="totalPrice">${ticket.price}원</span>
    </div>

    <input type="submit" value="예매하기">
</form>

<a class="back-link" href="/reserve">← 티켓 목록으로 돌아가기</a>
</section>

<script>
    updateTotal();
</script>

<jsp:include page="./fragments/footer.jsp" />
</body>
</html>
