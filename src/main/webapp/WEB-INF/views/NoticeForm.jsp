<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 등록</h2>
	<form action="${pageContext.request.contextPath}/notice/insert" method="post">
	    <p>
	        <label>
	            <input type="checkbox" name="isFixed" value="1"> 상단 고정
	        </label>
	    </p>
	    <p>제목: <input type="text" name="title" required></p>
	    <p>내용: <textarea name="content" required></textarea></p>
	    <p>카테고리:
			<select name="category" required>
				<option value="">선택</option>
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
				<option value="점검">점검</option>
			</select>
		</p>
	    <button type="submit">등록</button>
	</form>
	<a href="/notice/NoticeList">목록</a>
</body>
</html>