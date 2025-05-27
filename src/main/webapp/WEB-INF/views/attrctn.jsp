<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	box-sizing: border-box;
}

li {
	list-style-type: none;
}

a {
	text-decoration: none;
}

ul {
	display: flex;
	gap: 20px;
}

body {
	height: 100vh;
	background-image:
		url('https://t1.daumcdn.net/news/202203/31/joongang/20220331050117701ewhl.jpg');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	/*
	justify-content: center;
	align-items: center;
	*/
}

/* 섹션 스타일 */
.at-section {
	/*padding: 60px 20px;*/
	max-width: 1200px;
	margin: 0 auto;
}

.title-text {
	text-align: center;
	color: white;
	font-size: 30px;
	margin-bottom: 160px;
	margin-top: 100px
}
.title-text p{
	font-size: 20px;
}

.overlay {
	background: rgba(255, 255, 255, 0.8); /* 흰색 반투명 */
	backdrop-filter: blur(10px); /* 살짝 블러 */
	color: black;
	border-radius: 20px;
	padding: 30px;
	margin: 0 auto 40px auto;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	/*
	
	*/
}

/* 검색 폼 내부 요소 정리 */
form select,
form input[type="text"],
form input[type="submit"] {
  padding: 10px 15px;
  border: none;
  border-radius: 10px;
  margin: 5px;
  font-size: 1em;
}
form input[type="submit"] {
  background-color: #d62828;
  color: white;
  cursor: pointer;
}
/* 어트랙션 카드 리스트 */
.at-list ul {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); 
  max-width: 1200px;
  margin: 0 auto;
  /*
  justify-content: center;
  */
  gap: 30px;
  list-style: none;
  padding: 0;
}

.at-list li {
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
}

/* 개별 카드 스타일 */
.at-list ul li {
  background: rgba(255, 255, 255, 0.8); /* 반투명 */
  backdrop-filter: blur(5px);
  border-radius: 20px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  width: 280px;
  overflow: hidden;
  transition: transform 0.3s;
  /*
  */
}
.at-list ul li img {
  width: 100%;
  height: 230px;
  border-bottom: 1px solid #ddd;
  object-fit: cover;
}

.at-list ul li h2 {
  margin: 8px 15px;
  font-size: 1.3em;
  color: #222;
}
.at-list ul li p {
  margin: 0 15px 15px;
  
  /*
  background-color: #d62828;
  color: #444;
  */
}
.title-text h1 {
	margin-bottom: 20px;
}
</style>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section class="at-section">
		<!-- 반투명 검색 박스 -->
		<div class="title-text">
			<h1>어트랙션</h1>
			<p>언제나 새롭고 즐거운 경험을 주는 어트랙션을 소개합니다!</p>
		</div>
		<div class="overlay">
			<form action="attrctn" method="get">
				<select name="alevel">
					<option value="">난이도 선택</option>
					<option value="1">초급</option>
					<option value="2">중급</option>
					<option value="3">고급</option>
				</select> <input type="text" name="name" placeholder="어트랙션 이름을 입력"> <input
					type="submit" value="검색">
			</form>
		</div>
		<div class="at-list">
			<ul>
				<c:forEach var="attrctn" items="${list }">
					<li><a href="detail?atno=${attrctn.atno }"> <img
							src="${attrctn.imageURL }" alt="어트랙션 이미지" width="250">
							<h2>${attrctn.name }</h2>
							<p>
								<c:choose>
									<c:when test="${attrctn.alevel == 1 }">초급</c:when>
									<c:when test="${attrctn.alevel == 2 }">중급</c:when>
									<c:when test="${attrctn.alevel == 3 }">고급</c:when>
								</c:choose>
							</p>
							<p>
								<c:choose>
									<c:when test="${attrctn.state == 1}">운행중</c:when>
									<c:otherwise>점검중</c:otherwise>
								</c:choose>
							</p>
					</a></li>
				</c:forEach>
			</ul>
		</div>

	</section>
</body>
</html>










