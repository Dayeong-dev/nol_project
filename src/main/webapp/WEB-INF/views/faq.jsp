<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
:root {
  --main-color: #d62828;
  --light-bg: #fff7f7;
  --text-color: #333;
  --accent-color: #f0eaea;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #fff;
  color: var(--text-color);
  
}

h1 {
  text-align: center;
  font-size: 28px;
  color: var(--main-color);
  margin-bottom: 10px;
}

h2 {
  text-align: center;
  font-size: 20px;
  margin-bottom: 30px;
  color: #444;
}

.faq-items {
  border: 1px solid #eee;
  border-radius: 10px;
  margin: 20px auto;
  padding: 20px;
  width: 80%;
  max-width: 800px;
  background-color: #fff;
  box-shadow: 0 3px 6px rgba(0,0,0,0.05);
  transition: all 0.3s ease;
  cursor: pointer;
}

.faq-items:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.faq-items .FQ {
  font-weight: bold;
  color: var(--main-color);
  font-size: 16px;
  display: flex;
  align-items: center;
}

.faq-items .FQ::before {
  content: "Q.";
  font-weight: bold;
  color: var(--main-color);
  margin-right: 10px;
}

.faq-items .FA {
  margin-top: 10px;
  background-color: var(--accent-color);
  padding: 15px;
  border-radius: 6px;
  color: #444;
  line-height: 1.6;
  display: none;
  transition: all 0.3s ease;
}

section {
  margin-top: 30px; /* 원하는 만큼 조절 가능 (ex: 60px, 80px, 100px) */
}

.faq-items .FQ {
  font-weight: bold;
  color: var(--main-color);
  font-size: 16px;
  display: flex;
  align-items: center;
  transition: background-color 0.2s ease;
}

.faq-items .FQ::before {
  content: "Q.";
  font-weight: bold;
  color: var(--main-color);
  margin-right: 10px;
}

/* ✅ hover 효과 */
.faq-items .FQ:hover {
  background-color: #fff0f0;
  padding: 6px 10px;
  border-

</style>
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>

<section>
  <h1>FAQ</h1>
  
  <h2>자주 묻는 질문</h2>

  <c:forEach var="faq" items="${list}">
    <div class="faq-items">
      <div class="FQ">${faq.title}</div>
      <div class="FA">${faq.reply}</div>
    </div>
  </c:forEach>
</section>

<script>
  const faqItems = document.querySelectorAll('.faq-items');

  faqItems.forEach(item => {
    const question = item.querySelector('.FQ');
    const answer = item.querySelector('.FA');

    question.addEventListener('click', () => {
      const isVisible = answer.style.display === 'block';
      answer.style.display = isVisible ? 'none' : 'block';
    });
  });
</script>

<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
