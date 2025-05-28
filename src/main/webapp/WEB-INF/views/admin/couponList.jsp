<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 - 사용자 쿠폰 목록</title>
    <link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
    <section>
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
	    	<h2>관리자 - 전체 사용자 쿠폰 목록</h2>
		    <table class="list-table">
		        <thead>
		            <tr>
		                <th>UCNO</th>
		                <th>회원 ID</th>
		                <th>쿠폰 이름</th>
		                <th>할인율</th>
		                <th>만료일</th>
		                <th>사용 여부</th>
		                <th>관리</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="coupon" items="${couponList}">
		                <tr>
		                    <td>${coupon.ucno}</td>
		                    <td>${coupon.id}</td>
		                    <td>${coupon.name}</td>
		                    <td>${coupon.discount_rate}%</td>
		                    <td>${coupon.expire_date}</td>
		                    <td>
		                        <c:choose>
		                            <c:when test="${coupon.used == 1}">✅ 사용됨</c:when>
		                            <c:otherwise>❌ 미사용</c:otherwise>
		                        </c:choose>
		                    </td>
		                    <td>
		                        <a href="/admin/deleteCoupon?ucno=${coupon.ucno}" class="button">삭제</a>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		    <a href="/admin/couponInsert" class="button">➕ 쿠폰 수동 발급</a>
    	</div>
    </section>
</body>
</html>
