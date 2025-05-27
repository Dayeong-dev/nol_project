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
	height: auto;
	border: 2px solid #aaa;
	background: #fff;
	position: fixed;
	top: 100px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
	padding: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	text-align: center;
	
}

#popup img {
    max-width: 100%;
    height: auto;
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

#main .prev,
#main .next {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  font-size: 2rem;
  background: rgba(0,0,0,0.5);
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
				src="/nol_image/summerEventThumb.png" alt="이벤트 배너" width="100%">
			</a>
			<div align="right" style="margin-top: 10px;">
				<input type="checkbox" id="inactiveToday" value="1"> 하루 동안 열지
				않음 <input type="button" value="닫기" id="closeBtn">
			</div>
		</div>
		<%
		}
		%>
		<div class="slider">
		  	<div class="slides">
		    	<img src="/nol_image/slider_img1.png" class="slide" />
		    	<img src="/nol_image/slider_img2.png" class="slide" />
		    	<img src="/nol_image/slider_img3.gif" class="slide" />
		  	</div>
		  	<div class="cover"></div>
		  	<button class="prev">‹</button>
		  	<button class="next">›</button>
		</div>
		<h1>재미있고 즐거운 다양한 어트랙션</h1>
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
		<a href="attrctn">더 보러가기</a>
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
		
		// 🔁 타이머 초기화 함수
		function resetAutoSlide() {
		  clearInterval(autoSlideInterval);
		  autoSlideInterval = setInterval(nextSlide, 3000);
		}
	
		next.addEventListener('click', nextSlide);
		prev.addEventListener('click', prevSlide);
	
		// 자동 슬라이드 타이머 ID
		let autoSlideInterval = setInterval(nextSlide, 3000);
	</script>
</body>
<jsp:include page="./fragments/footer.jsp"></jsp:include>
</html>