<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="/css/admin.css">
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
    </div>
  </section>
</body>
</html>