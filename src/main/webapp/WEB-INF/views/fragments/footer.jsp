<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>

footer {
  position: fixed;         /* 위치 고정 */
  bottom: 0;               /* 하단에 붙임 */
  left: 0;
  width: 100%;             /* 전체 너비 */
  background-color: #f5f5f5;
  color: #444;
  font-size: 13px;
  padding: 20px 40px;
  text-align: center;
  border-top: 1px solid #ccc;
  z-index: 1000;
}

footer a {
  color: #0077cc;
  text-decoration: none;
  margin: 0 10px;
}

footer a:hover {
  text-decoration: underline;
}

footer .footer-links {
  margin-bottom: 10px;
}
</style>



<footer>
  <div class="footer-links">
    <a href="/eventList">이벤트</a> |
    <a href="/QuestionsList">Q&A</a> |
    <a href="/faq">FAQ</a> |
    <a href="/NoticeList">공지사항</a>
  </div>
  <div>
    ⓒ 2025 Easy World Adventure. All rights reserved.
  </div>
</footer>
