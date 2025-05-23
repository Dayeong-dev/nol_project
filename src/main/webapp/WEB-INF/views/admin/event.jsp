<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>쿠폰 등록</title>
</head>
<body>
    <h2>쿠폰 발급</h2>

   <form action="/admin/insertCoupon" method="post">
	    이벤트 선택:
	    <select name="eno">
	        <c:forEach var="event" items="${eventList}">
	            <option value="${event.eno}">${event.name}</option>
	        </c:forEach>
	    </select><br><br>
	
	    쿠폰 이름: <input type="text" name="name"><br>
	    설명: <input type="text" name="description"><br>
	    할인율: <input type="number" name="discount_rate"><br>
	
	    <input type="submit" value="쿠폰 발급">
	</form>
</body>
</html>
