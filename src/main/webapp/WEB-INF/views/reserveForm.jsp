<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>티켓 예매 페이지</title>
    <script>
        function updateTotal() {
            const price = parseInt(document.getElementById("unitPrice").value);
            const qty = parseInt(document.getElementById("quantity").value);
            const total = price * qty;
            document.getElementById("totalPrice").innerText = total.toLocaleString() + "원"; //tolocalestring: 숫자 세자리마다 , 찍어줌
        }
    </script>
</head>
<body>
    <h2>티켓 예매</h2>

    <form action="/reserve" method="post">
     
        <input type="hidden" name="tno" value="${ticket.tno}">
        <input type="hidden" name="id" value="${sessionScope.id}">
        <input type="hidden" id="unitPrice" value="${ticket.price}">

        <!-- 티켓 정보 -->
        <p><strong>${ticket.name}</strong></p>
        <p>가격(1장): ${ticket.price}원</p>
        <p>내용: ${ticket.content}</p>

       
        날짜: <input type="date" name="tdate" required><br><br>

        수량: 
        <input type="number" id="quantity" name="quantity" value="1" min="1" required onchange="updateTotal()" oninput="updateTotal()"><br><br>

        총 가격: <span id="totalPrice">${ticket.price}원</span><br><br>

        <input type="submit" value="예매하기">
    </form>

    <br>
    <a href="/reserve">← 티켓 목록으로 돌아가기</a>

    <script>
        // 페이지 로드 시 총 가격 자동 표시
        updateTotal();
    </script>
</body>
</html>
