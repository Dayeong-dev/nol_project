package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.IAnswersDAO;
import com.example.nol_project.dto.AnswersDTO;
import com.example.nol_project.dto.QuestionsDTO;

@Service
public class AnswersService {
    @Autowired
    private IAnswersDAO answersDAO;

    public void insertAnswer(AnswersDTO answer) {
        answersDAO.insertAnswer(answer);
        answersDAO.updateIsAnswered(answer.getQno()); // QnA 답변 완료
    }

    public AnswersDTO getAnswerByQno(int qno) {
        return answersDAO.selectAnswerByQno(qno);
    }

    // AnswersService.java
    public List<QuestionsDTO> getUnansweredList() {
        return answersDAO.selectUnansweredList();
    }

	public void updateIsAnswered(int qno) {
		 answersDAO.updateIsAnswered(qno);
	}
    
}