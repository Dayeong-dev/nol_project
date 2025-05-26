<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <style>
        .modal-overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .modal-box {
            background: #fff;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        .modal-close {
            float: right;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }
        .btn {
            padding: 6px 12px;
            margin: 4px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-danger { background-color: #dc3545; color: white; }
        .btn-secondary { background-color: #6c757d; color: white; }
        .btn-success { background-color: #28a745; color: white; }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2>공지사항 상세</h2>
    <p>번호: ${notice.nno}</p>
    <p>제목: ${notice.title}</p>
    <p>작성자: ${notice.adminId}</p>
    <p>내용: ${notice.content}</p>
	<p>조회수: ${notice.hit}</p>

    <c:if test="${isAdmin}">
        <button type="button" class="btn btn-primary btn-update" data-nno="${notice.nno}">수정</button>
        <a href="delete?nno=${notice.nno}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
    </c:if>
    <a href="/notice/NoticeList" class="btn btn-secondary">목록</a>
</div>

<!-- 수정 모달 -->
<div class="modal-overlay" id="customModal">
    <div class="modal-box">
        <span class="modal-close" id="modalCloseBtn">&times;</span>
        <form id="updateForm" method="post" action="/notice/NoticeUpdate">
            <input type="hidden" name="nno" id="modalNno" />
            <p>
                <label>
                    <input type="checkbox" name="isFixed" id="modalIsFixed" value="1"> 상단 고정
                </label>
            </p>
            <div>
                <input type="text" name="title" id="modalTitle" placeholder="제목" class="form-control mb-2" required style="width:100%; margin-bottom:10px;">
                <textarea name="content" id="modalContent" placeholder="내용" class="form-control" rows="4" required style="width:100%;"></textarea>
            </div>
            <div style="margin-top:10px; text-align:right;">
                <button type="submit" class="btn btn-success">저장</button>
                <button type="button" class="btn btn-secondary" id="modalCancelBtn">닫기</button>
            </div>
        </form>
    </div>
</div>

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
</body>
</html>