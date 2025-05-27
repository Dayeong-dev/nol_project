<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>쿠폰 등록</title>
    <link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section>
		<jsp:include page="./fragments/header.jsp" />
		<h2>쿠폰 발급</h2>
		<table>
			<tr>
				<th>이벤트 명</th>
				<td>${event.name}</td>
			</tr>
			<tr>
				<th>이벤트 기간</th>
				<td>
					<fmt:formatDate value="${event.startDate}" pattern="yyyy/MM/dd" />
					-
					<fmt:formatDate value="${event.endDate}" pattern="yyyy/MM/dd" />
				</td>
			</tr>
			<tr>
				<th>이벤트 내용</th>
				<td>${event.description}</td>
			</tr>
		</table>
		<form action="/admin/regCoupon/${event.eno}" method="post">
		    쿠폰 이름: 
		    <input type="text" name="name" placeholder="쿠폰 이름을 입력하세요."><br>
		    설명: 
		    <input type="text" name="description" placeholder="설명을 입력하세요."><br>
		    할인율: 
		    <input type="number" name="discount_rate" placeholder="할인율을 입력하세요."><br>
	    	<input type="submit" value="쿠폰 발급" />
		</form>
	</section>
	<script>
		const $form = document.querySelector("form");
		
		// 등록 유효성 검사
		$form.addEventListener("submit", e => {
			e.preventDefault();
			
			const name = $form.name.value.trim();
			const description = $form.description.value.trim();
			const discount_rate = $form.discount_rate.value.trim();

			
			if(name === "") {
				alert("쿠폰 이름을 입력하세요. ");
				$form.name.focus();
				return;
			}
			if(description === "") {
				alert("쿠폰 설명을 입력하세요. ");
				$form.description.focus();
				return;
			}
			if(discount_rate === "") {
				alert("쿠폰 할인율을 입력하세요. ");
				$form.discount_rate.focus();
				return;
			}

			$form.submit();
		})
	</script>
</body>
</html>
