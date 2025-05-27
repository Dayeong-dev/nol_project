package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.nol_project.dto.NoticeDTO;
import com.example.nol_project.service.NoticeService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/NoticeList")
    public String NoticeList(
        @RequestParam(name = "page", defaultValue = "1") int page,
        @RequestParam(name = "category", required = false) String category,
        @RequestParam(name = "keyword", required = false) String keyword,
        Model model, HttpSession session) {

        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "redirect:/login";
        }

        int pageSize = 10;

        List<NoticeDTO> list = noticeService.getPagedNotices(page, pageSize, category, keyword);
        int totalPages = noticeService.getTotalPages(pageSize, category, keyword);

        model.addAttribute("list", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("keyword", keyword);

        String adminId = (String) session.getAttribute("adminId");
        model.addAttribute("isAdmin", "admin1234".equals(adminId));

        return "NoticeList";
    }
    
 // 공지사항 상세보기
    @GetMapping("/NoticeDetail")
    public String NoticeDetail(@RequestParam("nno") int nno, Model model, HttpSession session) {
        // 세션에서 사용자 정보 가져오기
        String id = (String) session.getAttribute("id");
        String adminId = (String) session.getAttribute("adminId");
        
        if (id == null && adminId == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }

        noticeService.increaseHit(nno);

        NoticeDTO notice = noticeService.getNoticeByNno(nno);
        model.addAttribute("notice", notice);

        // 관리자 여부 확인
        boolean isAdmin = "admin1234".equals(adminId);
        model.addAttribute("isAdmin", isAdmin);

        return "NoticeDetail";
    }

    // 공지사항 등록 폼
    @GetMapping("/NoticeForm")
    public String noticeForm(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        String adminId = (String) session.getAttribute("adminId");
        
        if (id == null && adminId == null) {
        	//System.out.println("로그인 안됨 → 로그인 페이지로 이동");
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }
        //System.out.println("로그인 안됨 → 로그인 페이지로 이동");
        return "NoticeForm";
    }
    
    @PostMapping("/insert")
    public String insert(@ModelAttribute NoticeDTO notice) {
        notice.setAdminId("admin1234");

        if (notice.getIsFixed() != 1) {
            notice.setIsFixed(0);
        }

        noticeService.insert(notice);
        return "redirect:/notice/NoticeList";
    }

    @PostMapping("/NoticeUpdate")
    public String NoticeUpdate(@ModelAttribute NoticeDTO notice) {
        if (notice.getIsFixed() != 1) {
            notice.setIsFixed(0);
        }

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