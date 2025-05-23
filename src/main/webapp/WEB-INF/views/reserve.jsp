<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예매하기</title>
    <style>
        .ticket-btn {
            width: 150px;
            height: 150px;
            background-color: #2e2e8c;
            color: white;
            font-weight: bold;
            text-align: center;
            line-height: 150px;
            margin: 20px;
            display: inline-block;
            border: 1px solid #000;
            cursor: pointer;
        }
        .calendar-form {
            display: none;
            margin-top: 10px;
        }
    </style>
    <script>
        function toggleCalendar(tno) {
            document.querySelectorAll(".calendar-form").forEach(f => f.style.display = "none");
            document.getElementById("calendar_" + tno).style.display = "block";
        }
    </script>
</head>
<body>
    <h2 style="text-align:center;">예매</h2>
    <div style="text-align:center;">
        <c:forEach var="ticket" items="${ticketList}">
            <div class="ticket-btn" onclick="location.href='/reserveForm?tno=${ticket.tno}'"> 
                ${ticket.name}
            </div>
        </c:forEach>
    </div>

    <c:forEach var="ticket" items="${ticketList}">
        <div id="calendar_${ticket.tno}" class="calendar-form" style="text-align:center;">
            <form action="reserve.do" method="post">
                <input type="hidden" name="tno" value="${ticket.tno}">
              
                <p><strong>${ticket.name}</strong></p>
                날짜: <input type="date" name="tdate" required><br>
                수량: <input type="number" name="quantity" value="1" min="1"><br>
                <input type="submit" value="예매하기">
            </form>
        </div>
    </c:forEach>
</body>
</html>
