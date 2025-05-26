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

	<h1>재미있고 즐거운 다양한 어트랙션</h1>

	<%
	if ("on".equals(popupMode)) {
	%>
	<div id="popup">
		<a href="/eventDetail?eno=1"> <img
			src="/images/summerEventThumb.png" alt="이벤트 배너" width="100%">
		</a>
		<div align="right" style="margin-top: 10px;">
			<input type="checkbox" id="inactiveToday" value="1"> 하루 동안 열지
			않음 <input type="button" value="닫기" id="closeBtn">
		</div>
	</div>
	<%
	}
	%>
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
</body>
<jsp:include page="./fragments/footer.jsp"></jsp:include>
</html>