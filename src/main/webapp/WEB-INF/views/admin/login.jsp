<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style>
	.login-section {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  height: 100vh;
	  background-color: #f5f6fa;
	}
	
	.login-box {
	  background-color: #ffffff;
	  padding: 40px 32px;
	  border-radius: 12px;
	  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
	  width: 100%;
	  max-width: 420px;
	  box-sizing: border-box;
	}
	
	.login-box h2 {
	  text-align: center;
	  font-size: 24px;
	  color: #2c3e50;
	  margin-bottom: 28px;
	}
	
	.form-row {
	  margin-bottom: 20px;
	}
	
	.form-row label {
	  display: block;
	  margin-bottom: 6px;
	  font-weight: 600;
	  color: #2c3e50;
	}
	
	.form-row input[type="text"],
	.form-row input[type="password"] {
	  width: 100%;
	  padding: 10px 14px;
	  border: 1px solid #ccc;
	  border-radius: 6px;
	  font-size: 15px;
	  box-sizing: border-box;
	  transition: border 0.2s ease;
	}
	
	.form-row input[type="text"]:focus,
	.form-row input[type="password"]:focus {
	  border-color: #2980b9;
	  outline: none;
	}
	
	button[type="submit"] {
	  width: 100%;
	  background-color: #2c3e50;
	  color: white;
	  border: none;
	  padding: 12px;
	  font-size: 16px;
	  font-weight: bold;
	  border-radius: 6px;
	  cursor: pointer;
	  transition: background-color 0.2s ease;
	}
	
	button[type="submit"]:hover {
	  background-color: #34495e;
	}
	
	.error-message {
	  color: #e74c3c;
	  font-size: 14px;
	  margin: -10px 0 20px 0;
	  text-align: left;
	}
</style>
</head>
<body>
	<section class="login-section">
	  <div class="login-box">
	    <h2>관리자 로그인</h2>
	    <form action="/admin/login" method="post">
	      <div class="form-row">
	        <label for="adminId">아이디</label>
	        <input type="text" id="adminId" name="adminId" autocomplete="username" placeholder="아이디를 입력하세요." />
	      </div>
	      <div class="form-row">
	        <label for="pw">비밀번호</label>
	        <input type="password" id="pw" name="pw" autocomplete="new-password" placeholder="비밀번호를 입력하세요." />
	      </div>
	      <c:if test="${message != null}">
	        <p class="error-message">${message}</p>
	      </c:if>
	      <button type="submit">로그인</button>
	    </form>
	  </div>
	</section>
	<script>
		const $form = document.querySelector("form");
		
		$form.addEventListener("submit", e => {
			e.preventDefault();
			
			const id = $form.adminId.value.trim();
			const pw = $form.pw.value.trim();
			
			if(id === "") {
				alert("아이디를 입력하세요.");
				$form.adminId.focus();
				return;
			}
			if(pw === "") {
				alert("비밀번호를 입력하세요.");
				$form.pw.focus();
				return;
			}
			
			$form.submit();
		});
	</script>
</body>
</html>