<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="/css/admin.css">
<style>
  /* 모달 오버레이 - 화면 전체 덮음 */
  .modal-overlay {
    display: none; /* 기본 숨김 */
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center; /* 플렉스 중앙 정렬 */
    align-items: center;
    z-index: 1000;
  }

  /* 모달 박스 */
  .modal-box {
    background: white;
    padding: 20px;
    border-radius: 8px;
    width: 400px;
    max-width: 90%;
    box-shadow: 0 2px 10px rgba(0,0,0,0.3);
    position: relative;
  }

  /* 닫기 버튼 */
  .modal-close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
  }

  .modal-buttons .btn {
	  margin-left: 10px;
	  background-color: #001f4d; /* 남색 계열 컬러 */
	  color: white; /* 글자색 흰색 */
	  border: none;
	  padding: 8px 16px;
	  border-radius: 4px;
	  cursor: pointer;
	  transition: background-color 0.3s ease;
	}
	
	.modal-buttons .btn:hover {
	  background-color: #003366; /* 좀 더 진한 남색으로 호버 효과 */
	}
  /* 모달 폼 요소 스타일 */
  #updateForm input[type="text"],
  #updateForm textarea {
    width: 100%;
    margin-top: 8px;
    margin-bottom: 15px;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }

  /* 버튼 그룹 */
  .modal-buttons {
    text-align: right;
  }

  .modal-buttons .btn {
    margin-left: 10px;
    }
    
  .container {
    max-width: 700px;
    margin: 30px auto;
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  .container h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #333;
  }

  /* 상세 항목 스타일 */
  .detail-row {
    display: flex;
    padding: 12px 0;
    border-bottom: 1px solid #eee;
  }

  .detail-label {
    width: 120px;
    font-weight: 600;
    color: #555;
  }

  .detail-value {
    flex: 1;
    color: #333;
    white-space: pre-wrap; /* 줄바꿈 유지 */
  }

  /* 버튼 그룹 */
  .btn-group {
    margin-top: 30px;
    text-align: center;
  }

  .btn-group .btn {
    margin: 0 10px;
    min-width: 100px;
  }
	
	button {
	  background-color: #2c3e50;
	  color: white;
	  border: none;
	  padding: 10px 18px;
	  font-size: 15px;
	  border-radius: 6px;
	  cursor: pointer;
	  margin-right: 10px;
	}

	button:hover {
	  background-color: #526473;
	}
</style>
</head>
<body>
<jsp:include page="./fragments/aside.jsp" />
<section id="noticeDetail">
    <jsp:include page="./fragments/header.jsp" />

    <div class="container">
  <h2>공지사항 상세</h2>

  <div class="detail-row">
    <div class="detail-label">번호:</div>
    <div class="detail-value">${notice.nno}</div>
  </div>

  <div class="detail-row">
    <div class="detail-label">제목:</div>
    <div class="detail-value">${notice.title}</div>
  </div>

  <div class="detail-row">
    <div class="detail-label">작성자:</div>
    <div class="detail-value">${notice.adminId}</div>
  </div>

  <div class="detail-row">
    <div class="detail-label">내용:</div>
    <div class="detail-value">${notice.content}</div>
  </div>

  <div class="detail-row">
    <div class="detail-label">조회수:</div>
    <div class="detail-value">${notice.hit}</div>
  </div>

  <c:if test="${isAdmin}">
    <div class="btn-group">
      <button type="button" class="btn btn-primary btn-update" data-nno="${notice.nno}">수정</button>
      <a href="delete?nno=${notice.nno}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
    </div>
  </c:if>

  <div class="btn-group">
    <a href="/admin/NoticeList" class="btn btn-secondary">← 목록으로</a>
  </div>
</div>
<!-- 수정 모달 -->
<div class="modal-overlay" id="customModal">
    <div class="modal-box">
        <span class="modal-close" id="modalCloseBtn">&times;</span>
        <form id="updateForm" method="post" action="/admin/NoticeUpdate">
            <input type="hidden" name="nno" id="modalNno" />
            <p>
                <label>
                    <input type="checkbox" name="isFixed" id="modalIsFixed" value="1"> 상단 고정
                </label>
            </p>
            <input type="text" name="title" id="modalTitle" placeholder="제목" class="form-control" required>
            <textarea name="content" id="modalContent" placeholder="내용" class="form-control" rows="4" required></textarea>
            <div style="text-align:right;">
                <button type="submit" class="btn btn-success">저장</button>
                <button type="button" class="btn btn-secondary" id="modalCancelBtn">닫기</button>
            </div>
        </form>
    </div>
</div>

<!-- jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).on('click', '.btn-update', function () {
        var nno = $(this).data('nno');
        $.ajax({
            url: '/notice/getNotice',
            data: { nno: nno },
            success: function (data) {
                $('#modalNno').val(data.nno);
                $('#modalTitle').val(data.title);
                $('#modalContent').val(data.content);
                $('#modalIsFixed').prop('checked', data.isFixed === 1);
                $('#customModal').css('display', 'flex');
            },
            error: function () {
                alert("공지사항 정보를 불러오는데 실패했습니다.");
            }
        });
    });

    $('#modalCloseBtn, #modalCancelBtn').on('click', function () {
        $('#customModal').hide();
    });
</script>
</section>
</body>
</html>