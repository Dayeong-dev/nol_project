<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예매하기</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fdfdfd;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #d62828; /* EASYWORLD 레드 */
            margin-bottom: 40px;
        }

        .ticket-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .ticket-card {
            width: 220px;
            height: 300px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            position: relative;
            text-align: center;
            padding: 20px;
            box-sizing: border-box;
            transition: transform 0.3s ease;
        }

        .ticket-card:hover {
            transform: translateY(-10px);
        }

        .ticket-card h3 {
            color: #d62828;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .ticket-card .price {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
            color: #444;
        }

        .ticket-card button {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #d62828;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: bold;
        }

        .ticket-card button:hover {
            background-color: #a81e1e;
        }
    </style>
</head>
<body>

    <jsp:include page="./fragments/header.jsp" />

    <h2>🎟️ 이지월드 티켓 예매</h2>

    <div class="ticket-container">
        <c:forEach var="ticket" items="${ticketList}">
            <div class="ticket-card">
                <h3>${ticket.name}</h3>
                <p>이용권 설명 또는 안내 문구</p>
                <p class="price">${ticket.price}원~</p>
                <button onclick="location.href='/reserveForm?tno=${ticket.tno}'">예매하기</button>
            </div>
        </c:forEach>
    </div>

    <jsp:include page="./fragments/footer.jsp" />
</body>
</html>
