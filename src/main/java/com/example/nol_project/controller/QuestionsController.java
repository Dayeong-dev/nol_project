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
    
//    @GetMapping("/")
//    public String root() {
//    	System.out.println("root....");
//        return "index";
//    }

//관리자 전용 답 안한 리스트만 보이도록 변경 + 페이지네이션
//    @GetMapping("/QuestionsList")
//    public String questions(@RequestParam(name = "page", defaultValue = "1") int page, Model model, HttpSession session) {
//        int pageSize = 10;
//        List<QuestionsDTO> list = questionsService.getPagedQuestions(page, pageSize);
//        int totalPages = questionsService.getTotalPages(pageSize);
//    
//        String adminId = (String) session.getAttribute("adminId");
//        boolean isAdmin = "admin1234".equals(adminId);
//        model.addAttribute("isAdmin", isAdmin);
//        
//        model.addAttribute("questions", list);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", totalPages);
//        return "QuestionsList";
//    }
    
    @GetMapping("/QuestionsList")
    public String showQuestionsList(
        @RequestParam(value = "category", required = false) String category,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "page", defaultValue = "1") int page,
        Model model, HttpSession session) {
    	
    	String adminId = (String) session.getAttribute("adminId");
    	   boolean isAdmin = "admin1234".equals(adminId);
    	   model.addAttribute("isAdmin", isAdmin);  
        // 검색 + 페이징 처리
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
    public String unansweredList(Model model) {
        List<QuestionsDTO> list = questionsService.getUnansweredList();
        model.addAttribute("questions", list);
        return "admin/UnansweredList";
    }
    
    // 폼 페이지
    @GetMapping("/QuestionsForm")
    public String questionsForm() {
    	//System.out.println("QuestionsForm 요청 도달");
        return "QuestionsForm";
    }

    // 질문 등록 처리
    @PostMapping("/insertQuestion")
    public String insertQuestion(QuestionsDTO dto, HttpSession session) {
        String id = (String) session.getAttribute("id");
        dto.setId(id);  // 세션에서 사용자 ID 설정
        questionsService.insertQuestion(dto);
        return "redirect:/QuestionsList";
    }
    
    @GetMapping("/QuestionsDetail")
    public String questionsDetail(@RequestParam("qno") int qno, Model model) {
        QuestionsDTO dto = questionsService.getQuestionDetail(qno);
        model.addAttribute("questions", dto);
        //일단 쓰고 붙일때 삭제하기
        AnswersDTO answer = answersService.getAnswerByQno(qno);
        model.addAttribute("answer", answer);

        return "QuestionsDetail";
    }
    
    //하드코딩
    @GetMapping("/Questions")
    public String questions(HttpSession session, Model model) {
//        session.setAttribute("id", "user01");

        List<QuestionsDTO> list = questionsService.getUnansweredList();
        model.addAttribute("questionsList", list);
        return "questions";
    }
    @GetMapping("/fakeLogin")
    public String fakeLogin(HttpSession session) {
//        session.setAttribute("id", "user01"); // DB에 있는 id여야 함
        return "redirect:/Questions";
    }
}