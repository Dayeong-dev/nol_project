package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nol_project.dto.AnswersDTO;
import com.example.nol_project.dto.QuestionsDTO;
import com.example.nol_project.service.AnswersService;
import com.example.nol_project.service.QuestionsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class QuestionsController {

    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private AnswersService answersService; 

//관리자 전용 답 안한 리스트만 보이도록 변경 + 페이지네이션
    @GetMapping("/QuestionsList")
    public String showQuestionsList(
        @RequestParam(value = "category", required = false) String category,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "page", defaultValue = "1") int page,
        Model model, HttpSession session) {

        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }

        String adminId = (String) session.getAttribute("adminId");
        boolean isAdmin = "admin1234".equals(adminId);
        model.addAttribute("isAdmin", isAdmin);

        List<QuestionsDTO> filteredList = questionsService.getFilteredQuestions(category, keyword, page);
        int totalPages = questionsService.getTotalPages(category, keyword);

        model.addAttribute("questions", filteredList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("keyword", keyword);

        return "QuestionsList";
    }
    
    @GetMapping("/admin/UnansweredList")
    public String unansweredList(HttpSession session, Model model) {
        String adminId = (String) session.getAttribute("adminId");
        if (adminId == null || !adminId.equals("admin1234")) {
            model.addAttribute("loginMessage", "관리자 로그인 필요합니다.");
            return "redirect:/login";
        }
        
        List<QuestionsDTO> list = questionsService.getUnansweredList();
        model.addAttribute("questions", list);
        return "admin/UnansweredList";
    }
    
    @GetMapping("/QuestionsForm")
    public String questionsForm(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login"; // 로그인 페이지로 이동
        }
        return "QuestionsForm";
    }

    // 질문 등록 처리
    @PostMapping("/insertQuestion")
    public String insertQuestion(QuestionsDTO dto, HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }
        dto.setId(id);
        questionsService.insertQuestion(dto);
        return "redirect:/QuestionsList";
    }
    
    @GetMapping("/QuestionsDetail")
    public String questionsDetail(@RequestParam("qno") int qno, Model model, HttpSession session) {
        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }

        QuestionsDTO dto = questionsService.getQuestionDetail(qno);
        model.addAttribute("questions", dto);

        AnswersDTO answer = answersService.getAnswerByQno(qno);
        model.addAttribute("answer", answer);

        return "QuestionsDetail";
    }
    
    //하드코딩
    @GetMapping("/Questions")
    public String questions(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }

        List<QuestionsDTO> list = questionsService.getUnansweredList();
        model.addAttribute("questionsList", list);
        return "questions";
    }

    @GetMapping("/fakeLogin")
    public String fakeLogin(HttpSession session) {
        // session.setAttribute("id", "user01"); // 개발 중 테스트용
        return "redirect:/Questions";
    }
}