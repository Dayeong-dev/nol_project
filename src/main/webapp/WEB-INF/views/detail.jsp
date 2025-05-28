<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.at-section {
  text-align: center; /* 자식 인라인 요소 가운데 정렬 */
}
.at-title {
  text-align: center;
  margin-bottom: 50px;
  margin-right: 10px;
}
.at-title h1 {
/*
  font-weight: 800;
  margin-bottom: 20px;
  color: #d62828;
*/
  font-size: 30px;
  display: inline-block;
  background-color: #d62828; /* 빨간 버튼 배경 */
  color: #fff;                /* 흰 글자 */
  padding: 10px 30px;
  border-radius: 15px;
  font-weight: bold;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  margin: 20px auto;
  text-align: center;
}
.at-p {
  font-size: 18px;
  margin-left: 5px;
  margin-top: 50px;
  margin-bottom: 40px;
}
.image-container {
  display: block;
  width: 100%;
  text-align: center;
}

.at-img{
  width: 50%;
  max-height: 300px;
  object-fit: contain;
  
  margin: 25px 0px;
}
.at-map{
  width: 100%;
  max-height: 600px;
  object-fit: contain;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  margin: 25px 0;
  margin-top: 100px;
}

.tag {
  display: inline-block;
  background: #d62828;
  color: white;
  font-size: 23px;
  padding: 10px 26px;
  border-radius: 9999px;
  font-weight: 600;
  text-align: center;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
  transition: transform 0.2s ease;
  margin-right: 5px;
  margin-bottom: 50px;
  margin-top: 20px;
  
}
a[href="attrctn"] {
  display: inline-block;
  text-align: center;
  background-color: #d62828;
  color: white;
  padding: 12px 50px;
  border-radius: 10px;
  text-decoration: none;
  font-weight: 600;
  transition: background-color 0.3s ease;
  margin-top: 40px;
  margin-right: 5px;
  font-size: 20px;
  margin-bottom: 50px;
}
a[href="attrctn"]:hover {
  background-color: #a61b1b;
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>
<section class="at-section">
	<c:forEach var="attrctn" items="${list }">
		<div class="at-title">
			<h1>${attrctn.name }</h1>
			<p class="at-p">"모험과 스릴이 가득한 롯데월드의 인기 어트랙션을 만나보세요!"</p>
		</div>
			<p class="at-p">${attrctn.description }</p>
		<div class="img-container">
			<img src="${attrctn.imageURL }" alt="${attrctn.name }" class="at-img">
		</div>
		<p class="at-info">
			<span class="tag">
				<c:choose>
					<c:when test="${attrctn.alevel == 1}">초급</c:when>
					<c:when test="${attrctn.alevel == 2}">중급</c:when>
					<c:when test="${attrctn.alevel == 3}">고급</c:when>
				</c:choose>
				/
				<c:choose>
					<c:when test="${attrctn.state == 1}">운행중</c:when>
					<c:otherwise>점검중</c:otherwise>
				</c:choose>
			</span>
		</p>
		<div class="img-container">
			<img src="/nol_image/map.png" alt="지도" class="at-map">
		</div>
		<!-- 
		 -->
	</c:forEach>
	<a href="attrctn">목록</a>
</section>
<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>









