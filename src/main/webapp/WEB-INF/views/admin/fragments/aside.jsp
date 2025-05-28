<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="admin-sidebar">
  <h1><a href="/admin">Admin</a></h1>
  <ul>
    <li class="menu-group">
      <span class="menu-toggle">매출 관리</span>
      <ul class="submenu">
        <li><a href="/admin/salesDetail">매출 상세</a></li>
      </ul>
    </li>
    <li class="menu-group">
    	<span class="menu-toggle">예매 관리</span>
    	<ul class="submenu">
    		<li><a href="/admin/reservationList">예매 목록</a></li>
    	</ul>
    </li>
    <li class="menu-group">
      <span class="menu-toggle">이벤트 관리</span>
      <ul class="submenu">
        <li><a href="/admin/eventList">이벤트 목록</a></li>
        <li><a href="/admin/regEvent">이벤트 작성</a></li>
      </ul>
    </li>
    <li class="menu-group">
    	<span class="menu-toggle">어트랙션 관리</span>
    	<ul class="submenu">
    		<li><a href="/admin/attrctnList">어트랙션 목록</a></li>
    		<li><a href="/admin/attrctnForm">어트랙션 작성</a></li>
    	</ul>
    </li>
    <li class="menu-group">
    	<span class="menu-toggle">QnA 관리</span>
    	<ul class="submenu">
    		<li><a href="/admin/QuestionsList">QnA 전체 목록</a></li>
    		<li><a href="/admin/UnansweredList">QnA 미답변 목록</a></li>
    	</ul>
    </li>
    <li class="menu-group">
    	<span class="menu-toggle">공지사항 관리</span>
    	<ul class="submenu">
    		<li><a href="/admin/NoticeList">공지사항 목록</a></li>
    		<li><a href="/admin/NoticeForm">공지사항 작성</a></li>
    	</ul>
    </li>
    <li class="menu-group">
    	<span class="menu-toggle">리뷰 관리</span>
    	<ul class="submenu">
    		<li><a href="/admin/reviewList">리뷰 목록</a></li>
    	</ul>
    </li>
  </ul>
</aside>

<script>
	document.addEventListener('DOMContentLoaded', function () {
	  const toggles = document.querySelectorAll('.menu-toggle');

	  toggles.forEach(toggle => {
	    toggle.addEventListener('click', () => {
	      const parent = toggle.closest('.menu-group');
	      const isActive = parent.classList.contains('active');

	      // 먼저 모든 메뉴 닫기
	      document.querySelectorAll('.menu-group').forEach(group => group.classList.remove('active'));

	      // 원래 닫혀 있던 경우에만 열기
	      if (!isActive) {
	        parent.classList.add('active');
	      }
	    });
	  });
	});
</script>