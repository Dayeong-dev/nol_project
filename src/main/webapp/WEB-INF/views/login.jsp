<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	<section>
		<h2>로그인</h2>
		<form action="/login" method="post">
			<table>
				<tbody>
					<tr>
						<td><label>아이디</label></td>
						<td><input type="text" name="id" autocomplete="username" placeholder="아이디를 입력하세요." /></td>
					</tr>
					<tr>
						<td><label>비밀번호</label></td>
						<td><input type="password" name="pw" autocomplete="new-password" placeholder="비밀번호를 입력하세요." /></td>
					</tr>
					<c:if test="${message != null}">
						<tr>
							<td></td>
							<td>
								<p>${message}</p>
							</td>
						</tr>
					</c:if>
					<tr>
						<td></td>
						<td><input type="submit" value="로그인" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
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