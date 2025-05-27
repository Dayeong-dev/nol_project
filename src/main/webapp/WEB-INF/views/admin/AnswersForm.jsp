<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 작성</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

#answersForm {
  background: #fff;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #333;
  max-width: 800px;
  margin: 30px auto;
  padding: 0 20px;
}

#answersForm h2 {
  text-align: center;
  color: #d62828;
  margin-top: 30px;
  margin-bottom: 30px;
  font-size: 2rem;
}

form {
  display: flex;
  flex-direction: column;
  gap: 16px;
  background: #fffafa;
  padding: 24px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

textarea {
  padding: 10px 14px;
  font-size: 0.95rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  background: #fafafa;
  min-height: 150px;
  resize: vertical;
  transition: border 0.3s, box-shadow 0.3s;
}

textarea:focus {
  border-color: #d62828;
  box-shadow: 0 0 6px rgba(214, 40, 40, 0.3);
  outline: none;
}

button, input[type="submit"] {
  background-color: #d62828;
  color: white;
  font-weight: bold;
  padding: 10px;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover, input[type="submit"]:hover {
  background-color: #a81e1e;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
<section id="answersForm">
<h2>답변 작성</h2> 
<form action="${pageContext.request.contextPath}/admin/AnswersInsert" method="post">
    <input type="hidden" name="qno" value="${qno}"/>
    <input type="hidden" name="memberName" value="${memberName}"/>
    <textarea name="content" placeholder="답변을 입력하세요" required></textarea>
    <input type="submit" value="등록"/>
</form>
</section>
<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>