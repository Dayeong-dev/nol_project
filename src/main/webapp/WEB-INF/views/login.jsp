<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
  	<title>로그인</title>
  	<style>  
	    #login {
	      	display: flex;
	      	justify-content: center;
	      	padding-top: 40px;
	    }
	    
	    #login .login-box {
		  	padding: 60px 0;
		  	width: 360px;
		}
		
		#login .login-box h2 {
		  	text-align: center;
		  	margin: 0;
	  		margin-bottom: 24px;
		}
	
	    #login .form-group {
	      	margin-bottom: 18px;
	    }
	
	    #login label {
	      	display: block;
	      	font-weight: bold;
	      	margin-bottom: 6px;
	    }
	
	    #login input[type="text"],
	    #login input[type="password"] {
	      	width: 100%;
	      	padding: 10px;
	      	box-sizing: border-box;
	      	border: 1px solid #ccc;
	      	border-radius: 6px;
	    }
	
	    #login input[type="submit"] {
	      	width: 100%;
	      	padding: 12px;
	      	background-color: #d62828;
	      	color: white;
	      	font-weight: bold;
	      	border: none;
	      	border-radius: 6px;
	      	cursor: pointer;
	    }
	
	    #login input[type="submit"]:hover {
	      	background-color: #b71c1c;
	    }
	
	    #login p.message {
	      	font-size: 13px;
	      	color: red;
	      	margin-top: -10px;
	      	margin-bottom: 10px;
	    }
  </style>
</head>

<body>
  	<jsp:include page="./fragments/header.jsp"></jsp:include>

  	<section id="login">
    	<div class="login-box">
    		<h2>로그인</h2>
	    	<form action="/login" method="post">
	      		<div class="form-group">
	        		<label for="id">아이디</label>
	        		<input type="text" name="id" id="id" autocomplete="username" placeholder="아이디를 입력하세요." />
	      		</div>
	
		      	<div class="form-group">
		        	<label for="pw">비밀번호</label>
		        	<input type="password" name="pw" id="pw" autocomplete="current-password" placeholder="비밀번호를 입력하세요." />
		      	</div>
	
		      	<c:if test="${message != null}">
		        	<div class="form-group">
		          	<p class="message">${message}</p>
		        	</div>
		      	</c:if>
	
		      	<div class="form-group">
		        	<input type="submit" value="로그인" />
		      	</div>
	    	</form>
    	</div>
  	</section>
  	<jsp:include page="./fragments/footer.jsp"></jsp:include>
	<script>
		const $form = document.querySelector("form");
		
		$form.addEventListener("submit", e => {
			e.preventDefault();
			
			const id = $form.id.value.trim();
			const pw = $form.pw.value.trim();
			
			if(id === "") {
				alert("아이디를 입력하세요.");
				$form.id.focus();
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