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

	//답변 안한 내용만 보이도록 추가
    public List<QuestionsDTO> getUnansweredList() {
        return questionsDAO.getUnansweredList();
    }

	public void insertQuestion(QuestionsDTO dto) {
	    questionsDAO.insertQuestion(dto);
	}

	public QuestionsDTO getQuestionDetail(int qno) {
	    return questionsDAO.getQuestionDetail(qno);
	}

	public List<QuestionsDTO> getPagedQuestions(int page, int size) {
	    int startRow = (page - 1) * size + 1;
	    int endRow = page * size;
	    return questionsDAO.getPagedQuestions(startRow, endRow);
	}

	public int getTotalPages(int size) {
	    int totalCount = questionsDAO.getTotalQuestionCount();
	    return (int) Math.ceil((double) totalCount / size);
	}
    
}