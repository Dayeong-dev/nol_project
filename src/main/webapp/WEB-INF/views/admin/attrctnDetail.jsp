<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>어트랙션 상세 보기</h1>
	<hr>
	<c:if test="${not empty message}">
	  	<script>
	   		alert('${message}');
	  	</script>
	</c:if>
	<h2>${at.name }</h2>
	<p>${at.description }</p>
	<img src="${at.imageURL }" alt="어트랙션 사진">
	<p>
		난이도 |
		<c:choose>
			<c:when test="${at.alevel == 1}">초급</c:when>
			<c:when test="${at.alevel == 2}">중급</c:when>
			<c:when test="${at.alevel == 3}">고급</c:when>
			<c:otherwise>알 수 없는 정보</c:otherwise>
		</c:choose>
	</p>
	<p>
		<c:choose>
			<c:when test="${at.state == 1 }">운행 중</c:when>
			<c:when test="${at.state == 0 }">운행 중단</c:when>
		</c:choose>
	</p>
	<hr>
	<h3>어트랙션 수정</h3>
	<form action="/admin/attrctnUpdate.do" method="post">
		<input type="hidden" name="atno" value="${at.atno }">
		<p>
			<label>이름</label><br> 
			<input type="text" name="name" value="${at.name }">
		</p>
		<p>
			<label>설명</label><br> 
			<input type="text" name="description" value="${at.description }">
		</p>
		<p>
			<label>이미지 주소</label><br> 
			<input type="text" name="imageURL" value="${at.imageURL }">
		</p>
		<p>
			<label>난이도</label><br> 
			<select name="alevel">
				<option value="1" <c:if test="${at.alevel == 1 }">selected</c:if>>초급</option>
				<option value="2" <c:if test="${at.alevel == 2 }">selected</c:if>>중급</option>
				<option value="3" <c:if test="${at.alevel == 3 }">selected</c:if>>고급</option>
			</select>
		</p>
		<p>
			<label>운행 여부</label><br>
			<select name="state">
				<option value="1" <c:if test="${at.state == 1 }">selected</c:if>>운행 중</option>
				<option value="0" <c:if test="${at.state == 0 }">selected</c:if>>운행 중단</option>
			</select>
		</p>
		<button type="submit">수정 완료</button>
	</form>

</body>
</html>