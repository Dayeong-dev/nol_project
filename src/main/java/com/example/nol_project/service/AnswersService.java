package com.example.nol_project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.IAnswersDAO;
import com.example.nol_project.dto.AnswersDTO;

@Service
public class AnswersService {
    @Autowired
    private IAnswersDAO answersDAO;

    public void insertAnswer(AnswersDTO answer) {
        answersDAO.insertAnswer(answer);
    }

    public AnswersDTO getAnswerByQno(int qno) {
        return answersDAO.selectAnswerByQno(qno);
    }
}