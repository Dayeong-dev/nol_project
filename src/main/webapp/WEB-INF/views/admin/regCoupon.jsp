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
		<div id="regCoupon" class="admin-content">
			  <h2>쿠폰 발급</h2>
			
			  <!-- 이벤트 정보 테이블 -->
			  <table class="event-info-table">
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
			
			  <!-- 쿠폰 등록 폼 -->
			  <form action="/admin/regCoupon/${event.eno}" method="post">
				    <p>
					      <label for="name">쿠폰 이름</label>
					      <input type="text" id="name" name="name" placeholder="쿠폰 이름을 입력하세요.">
				    </p>
				    <p>
					      <label for="description">설명</label>
					      <input type="text" id="description" name="description" placeholder="설명을 입력하세요.">
				    </p>
				    <p>
					      <label for="discount_rate">할인율 (%)</label>
					      <input type="number" id="discount_rate" name="discount_rate" placeholder="할인율을 입력하세요.">
				    </p>
				    <p>
				      	<input type="submit" value="쿠폰 발급" />
				    </p>
			  	</form>
			</div>
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
