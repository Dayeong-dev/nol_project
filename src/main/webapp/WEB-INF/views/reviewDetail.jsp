<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Review</title>
<style>
.rv-section {
	max-width: 800px;
	margin: 0 auto;
}

.rv-li{
	list-style-type: none;
	border: 2px solid #d62828;
	border-radius: 12px;
    padding: 20px;
    margin-bottom: 20px;
    background-color: #fdfdfd;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    margin-left: 10px;
}

.rv-li textarea {
  width: 100%;
  height: 280px;
  margin-top: 8px;
  margin-bottom: 12px;
  padding: 10px;
  border-radius: 10px;
  border: 1px solid #ccc;
  font-size: 17px;
  resize: vertical;
  font-family: 'Noto Sans KR', sans-serif;
}
.rv-li button {
  padding: 6px 14px;
  margin-right: 8px;
  border: none;
  border-radius: 6px;
  font-size: 0.9rem;
  cursor: pointer;
  transition: 0.2s;
}

.rv-li button[type="submit"] {
  background-color: #d62828;
  color: white;
}

.rv-li form[action="reviewDelete"] button {
  background-color: #d62828;
}

.rv-li strong {
  color: #444;
}

.rv-li button:hover {
  filter: brightness(90%);
}

h2 {
    font-size: 25px;
    color: #d62828;
}
p {
    color: #666;
    margin-bottom: 20px;
    margin-left: 5px;
}
#p {
	margin-left: 20px;
}
</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>
<section class="rv-section">
	<h2>나의 리뷰 목록</h2>
	<p id="p">리뷰를 수정하거나 삭제할 수 있습니다.</p>
	<ul class="rv-ul">
		<c:forEach var="review" items="${list}">
			<li class="rv-li">
				<form action="reviewUpdate" method="post" style="display:inline;" onsubmit="return confirm('수정하시겠습니까?');">
					<p><strong>리뷰번호:</strong> ${review.rvno }</p>
					<p><strong>예약번호:</strong> ${review.rno }</p>
					<p><strong>내용:</strong> ${review.content }</p>
					<textarea name="content" rows="10" cols="50"><c:out value="${review.content}" /></textarea><br>
					<p><strong>작성일:</strong> ${review.rvdate }</p>
					
					<input type="hidden" name="rvno" value="${review.rvno}">
					<button type="submit">수정</button>
				</form>
				
				<form action="reviewDelete" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
					<input type="hidden" name="rvno" value="${review.rvno}">
					<button type="submit">삭제</button>
				</form>
			</li>
			<br>
		</c:forEach>
	</ul>
</section>
<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>