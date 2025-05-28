<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="/css/admin.css">
<style>
  .admin-buttons {
    margin-top: 30px;
  }

  .admin-buttons .btn {
    background-color: #336699; /* 연한 남색 */
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: 600;
    transition: background-color 0.3s ease;
    display: inline-block;
    margin-right: 10px;
  }

  .admin-buttons .btn:hover {
    background-color: #254f7d; /* 호버 시 더 진한 남색 */
    color: white;
  }

  /* 입력 폼 테이블 스타일 추가 (가독성 향상) */
  .form-table table {
    width: 100%;
    border-collapse: collapse;
  }

  .form-table th, .form-table td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    text-align: left;
  }

  .form-table th {
    width: 120px;
    background-color: #f5f5f5;
    color: #333;
  }

  .form-table input[type="text"],
  .form-table select,
  .form-table textarea {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
</style>
</head>
<body>
  <jsp:include page="./fragments/aside.jsp" />
  <section>
    <jsp:include page="./fragments/header.jsp" />
    <div id="noticeForm" class="admin-content">
      <h2>공지사항 등록</h2>

      <form action="/admin/insert" method="post" class="form-table">
        <table>
          <tr>
            <th>제목</th>
            <td><input type="text" name="title" required></td>
          </tr>
          <tr>
            <th>카테고리</th>
            <td>
              <select name="category" required>
                <option value="">선택</option>
                <option value="공지">공지</option>
                <option value="이벤트">이벤트</option>
                <option value="점검">점검</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>중요공지</th>
            <td>
              <label><input type="radio" name="isFixed" value="1"> 예</label>
              <label><input type="radio" name="isFixed" value="0" checked> 아니오</label>
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10" required></textarea></td>
          </tr>
        </table>

        <div class="admin-buttons">
          <button type="submit" class="btn btn-primary">등록</button>
          <a href="/admin/NoticeList" class="btn btn-secondary">← 목록</a>
        </div>
      </form>
    </div>
  </section>
</body>
</html>