package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.nol_project.dto.QuestionsDTO;

@Mapper
public interface IQuestionsDAO {

	@Select("""
		    SELECT 
		        q.qno, q.id, q.title, q.content, q.createDate,
		        q.isAnswered, m.name AS memberName, m.phone AS memberPhone,
		        a.content AS answerContent
		    FROM nol_questions q JOIN nol_member m ON q.id = m.id
		    LEFT JOIN nol_answers a ON q.qno = a.qno
		    WHERE q.qno = #{qno}""")
		QuestionsDTO getQuestionDetail(int qno);

	@Select("""
		    SELECT 
		        q.qno, q.title, q.content, q.createDate,
		        q.isAnswered, m.name AS memberName FROM nol_questions q
		    JOIN nol_member m ON q.id = m.id ORDER BY q.qno DESC
		""")
		List<QuestionsDTO> getAllQuestions();

    @Insert("INSERT INTO nol_questions (qno, id, title, content, createDate) " +
            "VALUES (seq_nol_questions.NEXTVAL, #{id}, #{title}, #{content}, SYSDATE)")
    void insertQuestion(QuestionsDTO dto);

}
