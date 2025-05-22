<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section>
		<h2>회원가입</h2>
		<form action="join" method="post">
			<table>
				<tbody>
					<tr>
						<td><label>아이디</label></td>
						<td><input type="text" name="id" autocomplete="username" placeholder="아이디를 입력하세요." onchange="changeId()" /></td>
						<td><input type="button" value="중복확인" onclick="checkId()" /></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><p id="checkMsg"></p></td>
					</tr>
					<tr>
						<td><label>비밀번호</label></td>
						<td colspan="2"><input type="password" name="pw" autocomplete="new-password" placeholder="비밀번호를 입력하세요." /></td>
					</tr>
					<tr>
						<td><label>비밀번호 확인</label></td>
						<td colspan="2"><input type="password" name="checkPw" autocomplete="new-password" placeholder="비밀번호 확인을 입력하세요." /></td>
					</tr>
					<tr>
						<td><label>이름</label></td>
						<td colspan="2"><input type="text" name="name" autocomplete="name" placeholder="이름을 입력하세요." /></td>
					</tr>
					<tr>
						<td><label>전화번호</label></td>
						<td colspan="2"><input type="text" name="phone" autocomplete="tel" placeholder="전화번호를 입력하세요." /></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><input type="submit" value="회원가입" /></td>
					</tr>
					<c:if test="${message != null}">
						<tr>
							<td></td>
							<td colspan="2">
								<p>${message}</p>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</form>
	</section>
	<script>
		const $form = document.querySelector("form");
		const $checkMsg = document.getElementById("checkMsg");
		
		let state_id = false;
		
		$form.addEventListener("submit", e => {
			e.preventDefault();
			
			const id = $form.id.value.trim();
			const pw = $form.pw.value.trim();
			const checkPw = $form.checkPw.value.trim();
			const name = $form.name.value.trim();
			const phone = $form.phone.value.trim();
			
			if(id === "") {
				alert("아이디를 입력하세요.");
				$form.id.focus();
				return;
			}
			
			if(!(/^[a-z0-9_-]{5,18}$/.test(id))) {
				alert("5~18자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
				$form.id.focus();
				return;
			}
			
			if(state_id === false) {
				alert("중복체크를 진행해주세요. ");
				return;
			}
			
			if(pw === "") {
				alert("비밀번호를 입력하세요.");
				$form.pw.focus();
				return;
			}
			 
			if(!(/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,12}$/.test(pw))) {
				alert("8~12자의 영문자, 숫자, 특수문자를 모두 사용해주세요.");
				$form.pw.focus();
				return;
			}
			
			if(checkPw === "") {
				alert("비밀번호 확인을 입력하세요.");
				$form.checkPw.focus();
				return;
			}
			if(pw !== checkPw) {
				alert("비밀번호가 다릅니다. ");
				return;
			}
			if(name === "") {
				alert("이름을 입력하세요.");
				$form.name.focus();
				return;
			}
			if(phone === "") {
				alert("전화번호를 입력하세요.");
				$form.phone.focus();
				return;
			}
			if(!(/^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/.test(phone))) {
				alert("휴대전화번호가 정확한지 확인해 주세요.");
				$form.phone.focus();
				return;
			}
			
			$form.submit();
		});
		
		/* 중복확인 */
		function checkId() {
			const id = $form.id.value.trim();
			
			if(id === "") {
				alert("아이디를 입력하세요.");
				$form.id.focus();
				return;
			}
			
			if(!(/^[a-z0-9_-]{5,18}$/.test(id))) {
				alert("5~18자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
				$form.id.focus();
				return;
			}
			
			fetch("/checkId?id=" + id)
				.then(response => response.json())
				.then(data => {
					state_id = data.result;
					if(data.result) {
						$checkMsg.innerText = "사용가능한 아이디 입니다. ";
						$checkMsg.style.color = "blue";
					}
					else {
						$checkMsg.innerText = "이미 사용 중인 아이디 입니다. ";
						$checkMsg.style.color = "red";
					}
				})
				.catch(error => {
					state_id = false;
					$checkMsg.innerText = "중복확인 중 오류가 발생했습니다. ";
					$checkMsg.style.color = "red";
					console.log(error);
				});
		}
		
		/* 아이디 변경 시 */
		function changeId() {
			state_id = false;
			$checkMsg.innerText = "";
		}
	</script>
</body>
</html>