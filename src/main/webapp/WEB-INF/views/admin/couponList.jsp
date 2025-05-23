<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 - 사용자 쿠폰 목록</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        a.button {
            padding: 6px 12px;
            background-color: #2e2e8c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <h2>관리자 - 전체 사용자 쿠폰 목록</h2>

    <table>
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

</body>
</html>
