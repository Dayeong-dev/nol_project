<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>티켓 예매 페이지</title>
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

    <h2>티켓 예매</h2>
	<p>쿠폰 개수: ${fn:length(userCoupons)}</p>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <form action="/reserve" method="post">
        <!-- hidden 필드들 -->
        <input type="hidden" name="tno" value="${ticket.tno}">
        <input type="hidden" name="id" value="${sessionScope.id}">
        <input type="hidden" id="unitPrice" value="${ticket.price}">
        <input type="hidden" name="discountRate" id="discountRate" value="0">

        <!-- 티켓 정보 -->
        <p><strong>${ticket.name}</strong></p>
        <p>가격(1장): ${ticket.price}원</p>
        <p>내용: ${ticket.content}</p>

        날짜: <input type="date" name="tdate" required><br><br>

        수량: 
        <input type="number" id="quantity" name="quantity" value="1" min="1"
               required onchange="updateTotal()" oninput="updateTotal()"><br><br>

        쿠폰 선택:
        <select name="ucno" id="coupon" onchange="updateTotal()">
		  <option value="0" data-discount="0">선택 안함</option>
		  <c:forEach var="coupon" items="${userCoupons}">
		    <option value="${coupon.ucno}" data-discount="${coupon.discount_rate}">
		      ${coupon.name} (${coupon.discount_rate}% 할인)
		    </option>
		  </c:forEach>
		</select><br><br>

        총 가격: <span id="totalPrice">${ticket.price}원</span><br><br>

        <input type="submit" value="예매하기">
    </form>

    <br>
    <a href="/reserve">← 티켓 목록으로 돌아가기</a>
    

    <script>
        // 페이지 처음 로드 시 총 가격 자동 계산
        updateTotal();
    </script>
</body>
</html>
