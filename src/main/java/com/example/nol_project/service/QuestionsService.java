package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.IAnswersDAO;
import com.example.nol_project.dao.IQuestionsDAO;
import com.example.nol_project.dto.QuestionsDTO;

@Service
public class QuestionsService {

    @Autowired
    private IQuestionsDAO questionsDAO;
    
    @Autowired
    private IAnswersDAO answersDAO;
    

    private final int pageSize = 10;
    
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

	 public List<QuestionsDTO> getFilteredQuestions(String category, String keyword, int page) {
	        int startRow = (page - 1) * pageSize + 1;
	        int endRow = page * pageSize;
	        return questionsDAO.getFilteredQuestions(category, keyword, startRow, endRow);
	    }

	    public int getTotalPages(String category, String keyword) {
	        int totalCount = questionsDAO.getFilteredQuestionsCount(category, keyword);
	        return (int) Math.ceil((double) totalCount / pageSize);
	    }

	    public String getMemberNameByQno(int qno) {
	        return answersDAO.getMemberNameByQno(qno);
	    }

		public List<QuestionsDTO> getAnsweredQuestions() {
			return answersDAO.selectAnsweredList();
		}
    
}