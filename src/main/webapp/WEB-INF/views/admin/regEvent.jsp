<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트 ${mode == 1 ? '수정' : '등록'}</title>
	<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<jsp:include page="./fragments/aside.jsp"></jsp:include>
	<section id="regEvent">
		<jsp:include page="./fragments/header.jsp" />
		<div class="admin-content">
			<h2>
				이벤트 
				<c:choose>
				    <c:when test="${mode == 1}">수정</c:when>
				    <c:otherwise>등록</c:otherwise>
				</c:choose>
			</h2>
			<c:choose>
				<c:when test="${mode == 1}">
				    <form action="/admin/updateEvent/${eno}" method="post">
				</c:when>
				<c:otherwise>
				    <form action="/admin/regEvent" method="post">
				</c:otherwise>
			</c:choose>
				<label>이벤트 명</label>
				<input type="text" name="name" placeholder="이벤트 명을 입력하세요. " value="${event.name}" /><br/>
				<label>이벤트 내용</label>
				<input type="text" name="description" placeholder="이벤트 내용을 입력하세요. " value="${event.description}" /><br/>
				
				<label>이벤트 기간</label>
				<input type="date" name="startDate" value="" onchange="setStartDate()" />
				-
				<input type="date" name="endDate" value="" onchange="setEndDate()" /><br/>
				
				<label>이벤트 썸네일 이미지 URL</label>
				<input type="text" name="thumbnailURL" placeholder="이벤트 썸네일 이미지 주소를 입력하세요. " value="${event.thumbnailURL}" /><br/>
				<label>이벤트 컨텐츠 이미지 URL</label>
				<input type="text" name="contentImgURL" placeholder="이벤트 컨텐츠 이미지 주소를 입력하세요. " value="${event.contentImgURL}" /><br/>
				<input type="submit" value="${mode == 1 ? '수정' : '등록'}" />
			</form>
			<c:if test="${errorMsg != null}">
				<p id="errorMsg">${errorMsg}</p>
			</c:if>
		</div>
	</section>
	<script>
		const $form = document.querySelector("form");
		const $startDate = $form.querySelector('input[name="startDate"]');
		const $endDate = $form.querySelector('input[name="endDate"]');
		
		// 이벤트 기간 min 세팅(내일부터)
		const tomorrow = new Date();
		tomorrow.setDate(tomorrow.getDate() + 1);
		
		const year = tomorrow.getFullYear();
		const month = (tomorrow.getMonth() + 1).toString().padStart(2, '0');
		const date = tomorrow.getDate().toString().padStart(2, '0');
		
		const tomorrowStr = year + "-" + month + "-" + date;
		$startDate.min = tomorrowStr;
		$endDate.min = tomorrowStr;
		
		// 등록 유효성 검사
		$form.addEventListener("submit", e => {
			e.preventDefault();
			
			const name = $form.name.value.trim();
			const description = $form.description.value.trim();
			const startDate = $form.startDate.value.trim();
			const endDate = $form.endDate.value.trim();
			const thumbnailURL = $form.thumbnailURL.value.trim();
			const contentImgURL = $form.contentImgURL.value.trim();
			
			if(name === "") {
				alert("이벤트 명을 입력하세요. ");
				$form.name.focus();
				return;
			}
			if(description === "") {
				alert("이벤트 내용을 입력하세요. ");
				$form.description.focus();
				return;
			}
			if(startDate === "") {
				alert("시작 기간을 입력하세요. ");
				$form.startDate.focus();
				return;
			}
			if(endDate === "") {
				alert("종료 기간을 입력하세요. ");
				$form.endDate.focus();
				return;
			}
			if(thumbnailURL === "") {
				alert("이벤트 썸네일 이미지 URL을 입력하세요. ");
				$form.thumbnailURL.focus();
				return;
			}
			if(contentImgURL === "") {
				alert("이벤트 컨텐츠 이미지 URL을 입력하세요. ");
				$form.contentImgURL.focus();
				return;
			}
			
			$form.submit();
		})
		
		function setStartDate() {
			const startDate = $startDate.value.trim();
			
			$endDate.min = startDate;
		}
		
		function setEndDate() {
			const endDate = $endDate.value.trim();
			
			$startDate.max = endDate;
		}
	</script>
</body>
</html>