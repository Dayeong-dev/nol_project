<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>어트랙션 등록</h1>
<hr>
	<form action="/admin/attrctnForm" method="post">
		<p>
			<label>이름</label><br> 
			<input type="text" name="name" placeholder="어트랙션 이름을 입력하세요">
		</p>
		<p>
			<label>설명</label><br> 
			<input type="text" name="description" placeholder="설명할 내용을 입력해주세요">
		</p>
		<p>
			<label>이미지 주소</label><br> 
			<input type="text" name="imageURL" placeholder="이미지 URL을 입력하세요">
		</p>
		<p>
			<label>난이도</label><br> 
			<select name="alevel">
				<option value="1" >초급</option>
				<option value="2" >중급</option>
				<option value="3" >고급</option>
			</select>
		</p>
		<p>
			<label>운행 여부</label><br>
			<select name="state">
				<option value="1">운행 중</option>
				<option value="0">운행 중단</option>
			</select>
		</p>
		<button type="submit">등록 하기</button>
	</form>
</body>
</html>