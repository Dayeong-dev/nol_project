<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	#join {
		display: flex;
      	justify-content: center;
      	padding-top: 40px;
	}
	
	#join .join-box {
	  	padding: 60px 0;
	  	width: 520px;
	}
		
	#join .join-box h2 {
	  	text-align: center;
	  	margin: 0;
	  	margin-bottom: 24px;
	}

	#join form {
	  	max-width: 400px;
	  	margin: 0 auto;
	}
	
	#join .form-group {
	  	margin-bottom: 18px;
	}
	
	#join label {
	  	display: block;
	  	font-weight: bold;
	  	margin-bottom: 6px;
	}
	
	#join input[type="text"],
	#join input[type="password"] {
	  	width: 100%;
	  	padding: 10px;
	  	box-sizing: border-box;
	  	border: 1px solid #ccc;
	  	border-radius: 6px;
	}
	
	#join .input-row {
	  	display: flex;
	  	gap: 10px;
	}
	
	#join .input-row input {
	  	flex: 1;
	}
	
	#join .input-row button {
	  	padding: 10px 14px;
	  	border: none;
	  	background: #d62828;
	  	color: white;
	  	border-radius: 6px;
	  	cursor: pointer;
	}
	
	#join .input-row button:hover {
	  	background-color: #b71c1c;
	}
	
	#join button[type="submit"] {
	  	width: 100%;
	  	padding: 12px;
	  	background-color: #d62828;
	  	color: white;
	  	font-weight: bold;
	  	border: none;
	  	border-radius: 6px;
	  	cursor: pointer;
	}
	
	#join button[type="submit"]:hover {
	  	background-color: #b71c1c;
	}
	
	#join small {
	  	font-size: 12px;
	  	display: block;
	  	margin-top: 6px;
	}
	
	#join .error {
	  	font-size: 12px;
	  	color: red;
	  	margin-top: 4px;
	  	display: block;
	}
</style>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section id="join">
		<div class="join-box">
			<h2>회원가입</h2>
		   	<form action="join" method="post" id="joinForm">
	   			<div class="form-group">
					<label for="id">아이디</label>
					<div class="input-row">
	  					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요." autocomplete="username" onchange="changeId()" />
	  					<button type="button" onclick="checkId()">중복확인</button>
	  				</div>
	  				<small id="idError" class="error"></small>
				</div>
				
				<div class="form-group">
				  	<label for="pw">비밀번호</label>
				  	<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요." autocomplete="new-password" />
				  	<small id="pwError" class="error"></small>
				</div>
	
				<div class="form-group">
				  	<label for="checkPw">비밀번호 확인</label>
				  	<input type="password" name="checkPw" id="checkPw" placeholder="비밀번호 확인을 입력하세요." autocomplete="new-password" />
				  	<small id="checkPwError" class="error"></small>
				</div>
	
				<div class="form-group">
				  	<label for="name">이름</label>
				  	<input type="text" name="name" id="name" placeholder="이름을 입력하세요." autocomplete="name" />
				  	<small id="nameError" class="error"></small>
				</div>
	
				<div class="form-group">
				  	<label for="phone">전화번호</label>
				  	<input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요." autocomplete="tel" />
				  	<small id="phoneError" class="error"></small>
				</div>
			
				<div class="form-group">
			  		<button type="submit">회원가입</button>
				</div>
		
				<c:if test="${message != null}">
					<div class="form-group">
			  			<small style="color:red;">${message}</small>
					</div>
				</c:if>
			</form>
		</div>
	</section>
	<jsp:include page="./fragments/footer.jsp"></jsp:include>
	<script>
		const $form = document.querySelector("form");
		const $checkMsg = document.getElementById("checkMsg");
		
		let state_id = false;
		
		$form.addEventListener("submit", e => {
			e.preventDefault();
			clearErrors();
			
			const id = $form.id.value.trim();
			const pw = $form.pw.value.trim();
			const checkPw = $form.checkPw.value.trim();
			const name = $form.name.value.trim();
			const phone = $form.phone.value.trim();
			
			if(id === "") {
				document.getElementById("idError").innerText = "아이디를 입력하세요.";
				$form.id.focus();
				return;
			}
			
			if(!(/^[a-z0-9_-]{5,18}$/.test(id))) {
				document.getElementById("idError").innerText = "5~18자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
				$form.id.focus();
				return;
			}
			
			if(!state_id) {
				document.getElementById("idError").innerText = "아이디 중복확인을 해주세요.";
				return;
			}
			
			if(pw === "") {
				document.getElementById("pwError").innerText = "비밀번호를 입력하세요.";
				$form.pw.focus();
				return;
			}
			 
			if(!(/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,12}$/.test(pw))) {
				document.getElementById("pwError").innerText = "8~12자의 영문자, 숫자, 특수문자를 모두 포함해야 합니다.";
				$form.pw.focus();
				return;
			}
			
			if(checkPw === "") {
				document.getElementById("checkPwError").innerText = "비밀번호 확인을 입력하세요.";
				$form.checkPw.focus();
				return;
			}
			if(pw !== checkPw) {
				document.getElementById("checkPwError").innerText = "비밀번호가 일치하지 않습니다.";
				return;
			}
			if(name === "") {
				document.getElementById("nameError").innerText = "이름을 입력하세요.";
				$form.name.focus();
				return;
			}
			if(phone === "") {
				document.getElementById("phoneError").innerText = "전화번호를 입력하세요.";
				$form.phone.focus();
				return;
			}
			if(!(/^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/.test(phone))) {
				document.getElementById("phoneError").innerText = "전화번호 형식을 확인해주세요.";
				$form.phone.focus();
				return;
			}
			
			$form.submit();
		});
		
		/* 중복확인 */
		function checkId() {
			const id = $form.id.value.trim();
			const $idError = document.getElementById("idError");
			
			if(id === "") {
				$idError.innerText = "아이디를 입력하세요.";
				$form.id.focus();
				return;
			}
			
			if(!(/^[a-z0-9_-]{5,18}$/.test(id))) {
				$idError.innerText = "5~18자의 영문 소문자, 숫자, 특수기호(_),(-)만 사용 가능합니다.";
				$form.id.focus();
				return;
			}
			
			fetch("/checkId?id=" + id)
				.then(response => response.json())
				.then(data => {
					state_id = data.result;
					if(data.result) {
						$idError.innerText = "사용가능한 아이디 입니다. ";
						$idError.style.color = "blue";
					}
					else {
						$idError.innerText = "이미 사용 중인 아이디 입니다. ";
						$idError.style.color = "red";
					}
				})
				.catch(error => {
					state_id = false;
					$idError.innerText = "중복확인 중 오류가 발생했습니다. ";
					$idError.style.color = "red";
					console.log(error);
				});
		}
		
		function clearErrors() {
		  	document.querySelectorAll('.error').forEach(el => el.innerText = '');
		}
		
		/* 아이디 변경 시 */
		function changeId() {
			state_id = false;
			
			const $idError = document.getElementById("idError");
			$idError.innerText = "";
			$idError.style.color = "red"; // 기본값 복원
		}
	</script>
</body>
</html>