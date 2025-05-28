<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<%
String popupMode = "on";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		if ("PopupClose".equals(c.getName())) {
	popupMode = c.getValue(); // "off"면 안 보여줌
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이지월드 메인페이지</title>
<style>
* {
	padding: 0;
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
	padding: 0;
}

#popup {
	width: 400px;
	border: 2px solid #aaa;
	background: #fff;
	position: fixed;
	top: 100px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
	padding: 15px 20px;
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.25);
	border-radius: 12px;
	text-align: center;
	font-family: 'Segoe UI', sans-serif;
}

#popup img {
	max-width: 100%;
	height: auto;
	border-radius: 8px;
}

.popup-bottom {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 14px;
}

.popup-bottom label {
	display: flex;
	align-items: center;
	font-size: 14px;
	color: #555;
	cursor: pointer;
}

.popup-bottom input[type="checkbox"] {
	margin-right: 6px;
	cursor: pointer;
}

#closeBtn {
	padding: 6px 14px;
	background-color: #d62828;
	color: white;
	font-weight: bold;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

#closeBtn:hover {
	background-color: #a81e1e;
}

#main .slider {
	position: relative;
	width: 100%;
	height: 600px;
	overflow: hidden;
	margin: 0 auto;
	border-radius: 10px;
}

#main .slides {
	display: flex;
	transition: transform 0.5s ease-in-out;
	width: 100%;
}

#main .slide {
	width: 100%;
	height: 600px;
	object-fit: cover;
	flex-shrink: 0;
	background-color: #000;
}

#main .prev, #main .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	font-size: 2rem;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	cursor: pointer;
	padding: 10px;
	z-index: 10;
}

#main .prev {
	left: 10px;
}

#main .next {
	right: 10px;
}

#attrctn {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	list-style: none;
	padding: 0;
	margin: 0 auto;
	max-width: 1300px;
}
/* 각 어트랙션 항목 */
#attrctn li {
	width: 250px;
	margin: 20px;
	text-align: center;
	border-radius: 8px;
	overflow: hidden;
	background: rgba(255, 255, 255, 0.25); /* 반투명 흰색 */
	backdrop-filter: blur(10px); /* 배경 블러 처리 */
	-webkit-backdrop-filter: blur(10px); /* Safari 지원 */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s;
}
/* 어트랙션 이미지 */
#attrctn li img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	transition: transform 0.3s ease;
}

#attrctn li:hover {
	transform: scale(1.05);
}
/* 어트랙션 제목 */
#attrctn li h2 {
	font-size: 1.2rem;
	margin-top: 10px;
	color: #333;
}

.at-h1 {
	text-align: center;
	padding: 40px 20px;
	font-size: 30px;
	background-color: #d32f2f;
	border-radius: 12px;
	color: white;
}
/* 더 보러가기 링크 */
.more-link {
  display: inline-block;
  margin-top: 30px;
  padding: 12px 28px;
  background-color: #d32f2f; /* 진한 빨강 */
  color: #fff;
  font-size: 1rem;
  font-weight: bold;
  text-decoration: none;
  border-radius: 12px;
  transition: background-color 0.3s;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
.more-link:hover {
  background-color: #b71c1c;
}
.more-wrap{
	text-align: center;
 	margin-top: 30px;
}
</style>

<script>
	$(function() {
		$('#closeBtn').click(function() {
			$('#popup').hide();
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
			if (chkVal == "1") {
				$.ajax({
					url : '/popupCookie',
					type : 'get',
					data : {
						inactiveToday : chkVal
					},
					dataType : 'text',
					success : function(resData) {
						console.log("✅ " + resData);
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>

	<section id="main">
		<%
		if ("on".equals(popupMode)) {
		%>
		<div id="popup">
			<a href="/eventDetail?eno=1"> <img
				src="/nol_image/summerEventThumb.png" alt="이벤트 배너">
			</a>
			<div class="popup-bottom">
				<label for="inactiveToday"> <input type="checkbox"
					id="inactiveToday" value="1"> 하루 동안 열지 않음
				</label>
				<button id="closeBtn">닫기</button>
			</div>
		</div>
		<%
		}
		%>
		<div class="slider">
			<div class="slides">
				<img src="/nol_image/slider_img1.png" class="slide" /> <img
					src="/nol_image/slider_img2.png" class="slide" /> <img
					src="/nol_image/slider_img3.gif" class="slide" />
			</div>
			<div class="cover"></div>
			<button class="prev">‹</button>
			<button class="next">›</button>
		</div>

		<h1 class="at-h1">재미있고 즐거운 다양한 어트랙션</h1>
		<ul id="attrctn">
			<c:forEach var="attrctn" items="${list }" varStatus="status">
				<c:if test="${status.index < 4 }">
					<li><a href="detail?atno=${attrctn.atno }"> <img
							src="${attrctn.imageURL }" alt="어트랙션 이미지" width="250">
							<h2>${attrctn.name }</h2>
					</a></li>
				</c:if>
			</c:forEach>
		</ul>
		<div class="more-wrap">
			<a href="attrctn" class="more-link">더 보러가기</a>
		</div>
	</section>
	<script>
		const slides = document.querySelector('.slides');
		const slideImages = document.querySelectorAll('.slide');
		const prev = document.querySelector('.prev');
		const next = document.querySelector('.next');

		let currentIndex = 0;
		const totalSlides = slideImages.length;

		function showSlide(index) {
			slides.style.transform = `translateX(-\${100 * index}%)`;
		}

		function nextSlide() {
			currentIndex = (currentIndex + 1) % totalSlides;
			showSlide(currentIndex);
			resetAutoSlide();
		}

		function prevSlide() {
			currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
			showSlide(currentIndex);
			resetAutoSlide();
		}

		// 타이머 초기화 함수
		function resetAutoSlide() {
			clearInterval(autoSlideInterval);
			autoSlideInterval = setInterval(nextSlide, 5000);
		}

		next.addEventListener('click', nextSlide);
		prev.addEventListener('click', prevSlide);

		// 자동 슬라이드 타이머 ID
		let autoSlideInterval = setInterval(nextSlide, 5000);
	</script>
</body>
<jsp:include page="./fragments/footer.jsp"></jsp:include>
</html>