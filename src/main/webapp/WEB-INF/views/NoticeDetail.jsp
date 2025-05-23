<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>공지사항 상세</title>
    
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>공지사항 상세</h2>
    <p>번호: ${notice.nno}</p>
    <p>제목: ${notice.title}</p>
    <p>작성자: ${notice.adminId}</p>
    <p>내용: ${notice.content}</p>

    <!-- 수정 버튼 -->
    <button type="button" class="btn btn-primary btn-update" data-nno="${notice.nno}">수정</button>
    <a href="delete?nno=${notice.nno}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
    <a href="/notice/NoticeList" class="btn btn-secondary">목록</a>
</div>

<!-- 수정 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form id="updateForm" method="post" action="/notice/NoticeUpdate">
      <input type="hidden" name="nno" id="modalNno" />
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">공지사항 수정</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <input type="text" name="title" id="modalTitle" placeholder="제목" class="form-control mb-2" required>
          <textarea name="content" id="modalContent" placeholder="내용" class="form-control" rows="4" required></textarea>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">저장</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- jQuery & Bootstrap JS (필수 순서대로 넣기!) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<!-- 수정 버튼 클릭 시 모달 호출 -->
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
                $('#updateModal').modal('show');
            },
            error: function () {
                alert("공지사항 정보를 불러오는데 실패했습니다.");
            }
        });
    });
</script>
</body>
</html>