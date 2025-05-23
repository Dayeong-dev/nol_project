package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.IQuestionsDAO;
import com.example.nol_project.dto.QuestionsDTO;

@Service
public class QuestionsService {

    @Autowired
    private IQuestionsDAO questionsDAO;

    public List<QuestionsDTO> getQuestionsList() {
        return questionsDAO.getAllQuestions();
    }

	public void insertQuestion(QuestionsDTO dto) {
	    questionsDAO.insertQuestion(dto);
	}

	public QuestionsDTO getQuestionDetail(int qno) {
	    return questionsDAO.getQuestionDetail(qno);
	}
    
}