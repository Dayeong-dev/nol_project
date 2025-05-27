package com.example.nol_project.controller;

import com.example.nol_project.dto.QuestionsDTO;
import com.example.nol_project.dto.AnswersDTO;
import com.example.nol_project.service.QuestionsService;
import com.example.nol_project.service.AnswersService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class QuestionsController {

    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private AnswersService answersService;

    @GetMapping("/QuestionsList")
    public String showQuestionsList(
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "page", defaultValue = "1") int page,
            HttpSession session,
            Model model) {

        String id = (String) session.getAttribute("id");
        String adminId = (String) session.getAttribute("adminId");

        if (id == null && adminId == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }

        model.addAttribute("isAdmin", false);

        List<QuestionsDTO> filteredList = questionsService.getFilteredQuestions(category, keyword, page);
        int totalPages = questionsService.getTotalPages(category, keyword);

        model.addAttribute("questions", filteredList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("keyword", keyword);

        return "QuestionsList";
    }

    @GetMapping("/QuestionsDetail")
    public String questionsDetail(@RequestParam("qno") int qno, HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }

        QuestionsDTO dto = questionsService.getQuestionDetail(qno);
        AnswersDTO answer = answersService.getAnswerByQno(qno);

        model.addAttribute("questions", dto);
        model.addAttribute("answer", answer);
        model.addAttribute("isAdmin", false);

        return "QuestionsDetail";
    }

    @GetMapping("/QuestionsForm")
    public String questionsForm(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");
        if (id == null) {
            model.addAttribute("loginMessage", "로그인이 필요합니다.");
            return "login";
        }
        return "QuestionsForm";
    }

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
}