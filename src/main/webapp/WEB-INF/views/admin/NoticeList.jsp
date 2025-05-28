<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="/css/admin.css">
<style>
  .filter-row {
    margin-bottom: 20px;
  }

  .action-bar {
    margin-top: 20px;
    text-align: center;
  }

  .action-bar a, .action-bar b {
    display: inline-block;
    margin: 0 5px;
    padding: 6px 12px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
  }

  .action-bar a {
    background-color: #eee;
    color: #333;
  }

  .action-bar a:hover {
    background-color: #ddd;
  }

  .action-bar b {
    background-color: #333;
    color: #fff;
   }
  .filter-box select {
	  padding: 6px 8px;
	  font-size: 14px;
	  border-radius: 4px;
	  border: 1px solid #ccc;
	  margin-right: 8px;
	}
	
	.filter-box button {
	  padding: 6px 12px;
	  font-size: 14px;
	  border-radius: 4px;
	  background-color: #337ab7;
	  color: white;
	  border: none;
	  cursor: pointer;
	}
	
	.filter-box button:hover {
	  background-color: #286090;
	}
  
  	.filter-box {
	  display: flex;
	  justify-content: space-between; /* 좌우 끝으로 배치 */
	  align-items: center;
	  gap: 10px; /* 요소 사이 간격 */
	  flex-wrap: wrap; /* 화면 작을 때 줄바꿈 가능 */
	}
	
	.filter-left select {
	  min-width: 120px; /* select 너비 지정 */
	  padding: 5px;
	  font-size: 14px;
	}
	
	.filter-right {
	  display: flex;
	  gap: 8px;
	}
	
	.filter-right input[type="text"] {
	  padding: 5px 8px;
	  font-size: 14px;
	  width: 200px; /* 원하는 너비 지정 */
	}
	
	.filter-right button {
	  padding: 6px 15px;
	  font-size: 14px;
	  cursor: pointer;
	}
	.admin-buttons .btn {
	  background-color: #003366; /* 남색 */
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
	  background-color: #002244;
	  color: white;
	}
	
	.admin-buttons {
	  margin-top: 30px; /* 위쪽 여백 (페이징과 간격) */
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
	  margin-right: 15px; /* 버튼 간 간격 */
	}
	
	.admin-buttons .btn:hover {
	  background-color: #254f7d; /* 약간 더 진한 색, 호버용 */
	  color: white;
	}
</style>
</head>
<body>
  <jsp:include page="./fragments/aside.jsp" />
  <section>
    <jsp:include page="./fragments/header.jsp" />
    <div id="noticeList" class="admin-content">
      <h2>공지사항</h2>

      <!-- 🔍 필터 영역 -->
      <div class="filter-row">
        <form action="/admin/NoticeList" method="get" class="filter-box">
          <select name="category">
            <option value="" ${selectedCategory == null || selectedCategory == '' ? 'selected' : ''}>전체</option>
            <option value="공지" ${selectedCategory == '공지' ? 'selected' : ''}>공지</option>
            <option value="이벤트" ${selectedCategory == '이벤트' ? 'selected' : ''}>이벤트</option>
            <option value="점검" ${selectedCategory == '점검' ? 'selected' : ''}>점검</option>
          </select>
          <input type="text" name="keyword" value="${keyword}" placeholder="제목 검색">
          <button type="submit">검색</button>
        </form>
      </div>

      <!-- 📋 공지 목록 테이블 -->
      <table class="list-table">
        <thead>
          <tr>
            <th>번호</th>
            <th>카테고리</th>
            <th>제목</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="notice" items="${list}">
            <tr class="${notice.isFixed == 1 ? 'notice-fixed' : ''}" onclick="location.href='/admin/NoticeDetail?nno=${notice.nno}'" style="cursor:pointer;">
              <td>${notice.nno}</td>
              <td>${notice.category}</td>
              <td>
                <c:if test="${notice.isFixed == 1}">
                  <span class="badge-important">중요 공지 💡</span>
                </c:if>
                ${notice.title}
              </td>
              <td>${notice.hit}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- 🔢 페이지네이션 -->
      <div class="action-bar">
        <c:forEach var="i" begin="1" end="${totalPages}">
          <c:choose>
            <c:when test="${i == currentPage}">
              <b style="margin: 0 6px;">${i}</b>
            </c:when>
            <c:otherwise>
              <a href="?page=${i}">${i}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </div>

      <!-- ➕ 등록 버튼 -->
      <c:if test="${isAdmin}">
        <div class="admin-buttons">
        	<a href="/admin" class="btn btn-secondary">← 관리자 메인</a>
          	<a href="/admin/NoticeForm" class="btn btn-success">공지 등록</a>
        </div>
      </c:if>
    </div>
  </section>
</body>
</html>