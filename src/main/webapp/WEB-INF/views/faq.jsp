<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.faq-items{
		cursor: pointer;
	}
</style>
</head>
<body>
<h1>FAQ</h1>
<hr>
<h2>자주 묻는 질문</h2>
<c:forEach var="faq" items="${list }">
	<div class="faq-items">
		<div class="FQ"><strong>Q</strong>. ${faq.title }</div>
		<div class="FA" style="display: none;">${faq.reply }</div><br>
	</div>
</c:forEach>
	
	
<script>
	const faqItems = document.querySelectorAll('.faq-items');
	
	faqItems.forEach(items => {
		const FQ = items.querySelector('.FQ');
		const FA = items.querySelector('.FA');
		
		FQ.addEventListener('click', function() {
			
			if(FA.style.display === 'none'){
				FA.style.display = 'block';
			}else{
				FA.style.display = 'none';
			}
		});
	});
</script>
</body>
</html>








