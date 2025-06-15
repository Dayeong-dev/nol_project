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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.nol_project.dto.AnswersDTO;
import com.example.nol_project.dto.QuestionsDTO;
import com.example.nol_project.service.AnswersService;
import com.example.nol_project.service.QuestionsService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class adminQuestionsController {

    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private AnswersService answersService;
    
    @Autowired
    private HttpSession session;

    @GetMapping("/QuestionsList")
    public String adminList(@RequestParam(value = "category", required = false) String category,
                            @RequestParam(value = "keyword", required = false) String keyword,
                            @RequestParam(value = "page", defaultValue = "1") int page,
                            RedirectAttributes rttr, 
                            Model model) {

        String adminId = (String) session.getAttribute("adminId");
        
        if (adminId == null) {
        	rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
            return "redirect:/admin/login";
        }

        List<QuestionsDTO> filteredList = questionsService.getFilteredQuestions(category, keyword, page);
        int totalPages = questionsService.getTotalPages(category, keyword);

        model.addAttribute("questions", filteredList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("keyword", keyword);
        model.addAttribute("isAdmin", true);

        return "admin/QuestionsList";
    }

    @GetMapping("/QuestionsDetail")
    public String adminDetail(@RequestParam("qno") int qno, RedirectAttributes rttr, Model model) {
        String adminId = (String) session.getAttribute("adminId");
        
        if (adminId == null) {
        	rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
            return "redirect:/admin/login";
        }

        QuestionsDTO dto = questionsService.getQuestionDetail(qno);
        AnswersDTO answer = answersService.getAnswerByQno(qno);

        model.addAttribute("questions", dto);
        model.addAttribute("answer", answer);
        model.addAttribute("isAdmin", true);

        return "admin/QuestionsDetail";
    }
    
    @GetMapping("/UnansweredList")
    public String unansweredList(RedirectAttributes rttr, Model model) {
        String adminId = (String) session.getAttribute("adminId"); 
        if (adminId == null) {
        	rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
            return "redirect:/admin/login";
        }

        List<QuestionsDTO> unanswered = questionsService.getUnansweredList();
        model.addAttribute("questions", unanswered);
        model.addAttribute("isAdmin", true);
        return "admin/UnansweredList";
    }
    
    @GetMapping("/AnsweredList")
    public String AnsweredList(RedirectAttributes rttr, Model model) {
    	String adminId = (String) session.getAttribute("adminId"); 
        if (adminId == null) {
        	rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
            return "redirect:/admin/login";
        }
        // 답변 질문 목록을 가져와서 모델에 담기
        List<QuestionsDTO> answered = questionsService.getAnsweredQuestions();
        model.addAttribute("questions", answered);
        model.addAttribute("isAdmin", true);
        return "admin/AnsweredList"; 
    }
    
    @GetMapping("/AnswersForm")
    public String showAnswerForm(@RequestParam("qno") int qno, RedirectAttributes rttr, Model model) {
        String adminId = (String) session.getAttribute("adminId");
        if (adminId == null) {
        	rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
            return "redirect:/admin/login";
        }

        QuestionsDTO question = questionsService.getQuestionDetail(qno);
        model.addAttribute("qno", qno);
        model.addAttribute("memberName", question.getMemberName());
        return "admin/AnswersForm";
    }
    
    @PostMapping("/AnswersInsert")
    public String insertAnswer(@ModelAttribute AnswersDTO answer, RedirectAttributes rttr, Model model) {
        String adminId = (String) session.getAttribute("adminId");
        if (adminId == null) {
        	rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
            return "redirect:/admin/login";
        }
        answer.setAdminId(adminId);
        answersService.insertAnswer(answer);
        answersService.updateIsAnswered(answer.getQno());
        
        return "redirect:/admin/QuestionsDetail?qno="+answer.getQno();
    }
    
    
}