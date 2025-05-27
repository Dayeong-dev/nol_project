package com.example.nol_project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nol_project.dto.AnswersDTO;
import com.example.nol_project.service.AnswersService;
import com.example.nol_project.service.QuestionsService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/answers")
public class AnswersController {

    @Autowired
    private AnswersService answersService;
    
    @Autowired
    private QuestionsService questionsService;
    
    // 답변 등록 폼
    @GetMapping("/AnswersForm")
    public String answerForm(@RequestParam("qno") int qno, Model model) {
        model.addAttribute("qno", qno); // 질문 번호를 전달
        
        String memberName = questionsService.getMemberNameByQno(qno);
        model.addAttribute("memberName", memberName);

        return "admin/AnswersForm";
    }

    // 답변 등록 처리
    @PostMapping("/AnswersInsert")
    public String insertAnswer(HttpSession session, AnswersDTO answer) {
        String adminId = (String) session.getAttribute("adminId"); // 세션에서 가져오기
        
        answer.setAdminId(adminId); // DTO에 주입
        
        answersService.insertAnswer(answer);
        answersService.updateIsAnswered(answer.getQno());
        System.out.println("insertAnswer 호출, adminId=" + adminId);
        return "redirect:/QuestionsDetail?qno=" + answer.getQno();
    }

    // 답변 상세 보기
    @GetMapping("/detail")
    public String answerDetail(@RequestParam("qno") int qno, Model model) {
        AnswersDTO answer = answersService.getAnswerByQno(qno);
        model.addAttribute("answer", answer);
        return "AnswersDetail";
    }
    
    @GetMapping("/UnansweredList")
    public String unansweredList(Model model) {
        // 미답변 질문 목록을 가져와서 모델에 담기
        model.addAttribute("questions", answersService.getUnansweredList()); 
        return "admin/UnansweredList"; 
    }
    
    @GetMapping("/AnsweredList")
    public String AnsweredList(Model model) {
        // 답변 질문 목록을 가져와서 모델에 담기
        model.addAttribute("questions", answersService.getAnsweredList()); 
        return "admin/AnsweredList"; 
    }
}
