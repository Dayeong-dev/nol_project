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

@Controller
@RequestMapping("/answers")
public class AnswersController {

    @Autowired
    private AnswersService answersService;

    // 답변 등록 폼
    @GetMapping("/AnswersForm")
    public String answerForm(@RequestParam("qno") int qno, Model model) {
        model.addAttribute("qno", qno); // 질문 번호를 전달
        return "AnswersForm";
    }

    // 답변 등록 처리
    @PostMapping("/AnwersInsert")
    public String insertAnswer(AnswersDTO answer) {
    	answer.setAdminId("admin1234"); // 하드코딩
        answersService.insertAnswer(answer);
        return "redirect:/QuestionsDetail?qno=" + answer.getQno(); //질문 상세 페이지로
    }

    // 답변 상세 보기
    @GetMapping("/detail")
    public String answerDetail(@RequestParam("qno") int qno, Model model) {
        AnswersDTO answer = answersService.getAnswerByQno(qno);
        model.addAttribute("answer", answer);
        return "AnswersDetail";
    }
}