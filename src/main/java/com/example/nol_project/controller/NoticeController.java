package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.nol_project.dto.NoticeDTO;
import com.example.nol_project.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // 공지사항 목록
    @GetMapping("/NoticeList")
    public String NoticeList(Model model) {
        List<NoticeDTO> list = noticeService.getAllNotices();
        model.addAttribute("list", list);
        return "NoticeList";
    }

    // 공지사항 상세보기
    @GetMapping("/NoticeDetail")
    public String NoticeDetail(@RequestParam("nno") int nno, Model model) {
        NoticeDTO notice = noticeService.getNoticeByNno(nno);
        model.addAttribute("notice", notice);
        return "NoticeDetail";
    }

    // 공지사항 등록 폼
    @GetMapping("/NoticeForm")
    public String form() {
        return "NoticeForm";
    }
    
    //공지사항 추가
    @PostMapping("/insert")
    public String insert(NoticeDTO notice) {
        System.out.println("등록 요청 - 제목: " + notice.getTitle() + ", 내용: " + notice.getContent());
        notice.setAdminId("admin1234");
        try {
            noticeService.insert(notice);
            System.out.println("등록 성공");
        } catch (Exception e) {
            System.out.println("등록 실패: " + e.getMessage());
            e.printStackTrace();
        }
        return "redirect:/notice/NoticeList";
    }
    
    // 공지사항 수정 폼
    @GetMapping("/NoticeEdit")
    public String edit(@RequestParam("nno") int nno, Model model) {
        NoticeDTO notice = noticeService.getNoticeByNno(nno);
        model.addAttribute("notice", notice);
        return "notice/NoticeEdit";
    }

    @GetMapping("/NoticeUpdate")
    public String NoticeUpdate(@RequestParam("nno") int nno, Model model) {
        NoticeDTO notice = noticeService.getNoticeByNno(nno);  // 공지사항 상세 조회 서비스 호출
        model.addAttribute("notice", notice);             // JSP에 데이터 전달
        return "NoticeUpdate";                             // 수정 폼 JSP
    }
    
    // 공지사항 수정 처리
    @PostMapping("/NoticeUpdate")
    public String NoticeUpdate(NoticeDTO notice) {
        noticeService.NoticeUpdate(notice);
        return "redirect:/notice/NoticeDetail?nno=" + notice.getNno();
    }
    
    // 공지사항 정보 JSON으로 반환 (모달 수정을 위한 API)
    @GetMapping("/getNotice")
    @ResponseBody
    public NoticeDTO getNotice(@RequestParam("nno") int nno) {
        return noticeService.getNoticeByNno(nno);
    }

    // 공지사항 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("nno") int nno) {
        noticeService.delete(nno);
        return "redirect:/notice/NoticeList";
    }
}