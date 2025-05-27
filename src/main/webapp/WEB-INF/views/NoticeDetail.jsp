<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <style>
        body {
            background: #fff;
            font-family: 'Segoe UI', sans-serif;
            color: #333;
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }

        h2 {
		    color: #b30000;
		    border-bottom: 3px solid #b30000;
		    padding-bottom: 12px;
		    margin: 40px 0 30px;
		    text-align: center;
		}
        .container p {
            font-size: 1rem;
            margin-bottom: 12px;
        }

        /* 버튼 스타일 */
        .btn {
            padding: 8px 16px;
            margin: 6px 4px 6px 0;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.95rem;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-primary {
            background-color: #b30000;
            color: white;
        }

        .btn-primary:hover {
            background-color: #800000;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #a71d2a;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-success:hover {
            background-color: #1e7e34;
        }

        /* 모달 스타일 */
        .modal-overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-box {
            background: #fff;
            padding: 24px;
            width: 420px;
            border-radius: 10px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
            position: relative;
        }

        .modal-close {
            position: absolute;
            top: 12px;
            right: 16px;
            font-size: 20px;
            cursor: pointer;
            font-weight: bold;
            color: #b30000;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 0.95rem;
            border: 2px solid #ccc;
            border-radius: 6px;
            margin-bottom: 12px;
            transition: 0.3s ease;
        }

        .form-control:focus {
            border-color: #b30000;
            box-shadow: 0 0 6px rgba(179, 0, 0, 0.4);
            outline: none;
        }
    </style>
</head>
<body>
<jsp:include page="fragments/header.jsp" />

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
                <input type="text" name="title" id="modalTitle" placeholder="제목" class="form-control" required>
                <textarea name="content" id="modalContent" placeholder="내용" class="form-control" rows="4" required></textarea>
            </div>
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

<jsp:include page="fragments/footer.jsp" />
</body>
</html>