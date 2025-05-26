package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.nol_project.dto.AnswersDTO;
import com.example.nol_project.dto.QuestionsDTO;

@Mapper
public interface IAnswersDAO {
	
	// 답변 등록
	@Insert("""
		    INSERT INTO nol_answers (ano, qno, adminId, content, memberName)
		    VALUES (
		        seq_nol_answers.NEXTVAL,
		        #{qno},
		        #{adminId},
		        #{content},
		        #{memberName}
		    )
		""")
	void insertAnswer(AnswersDTO answer);

	// 특정 질문의 답변 조회 (관리자 이름, 질문 제목 포함)
	@Select("""
		    SELECT a.*, ad.name AS adminId, q.title AS questionTitle
		    FROM nol_answers a
		    JOIN nol_admin ad ON a.adminId = ad.adminId
		    JOIN nol_questions q ON a.qno = q.qno
		    WHERE a.qno = #{qno}
	""")
	AnswersDTO selectAnswerByQno(int qno);
	
	// 질문 isAnswered 업데이트
	@Update("""
	    UPDATE nol_questions
	    SET isAnswered = 1
	    WHERE qno = #{qno}
	""")
	void updateIsAnswered(int qno);

	@Select("""
		    SELECT q.*, m.name AS memberName
		    FROM nol_questions q
		    JOIN nol_member m ON q.id = m.id
		    WHERE q.isAnswered = 0
		    ORDER BY q.createDate DESC
		""")
		List<QuestionsDTO> selectUnansweredList();
	
//	@Select("SELECT * FROM nol_questions WHERE isAnswered = 1 ORDER BY createDate DESC")
//	List<QuestionsDTO> selectAnsweredList();

	@Select("""
		    SELECT q.*, m.name AS memberName
		    FROM nol_questions q
		    JOIN nol_member m ON q.id = m.id
		    WHERE q.isAnswered = 1
		    ORDER BY q.createDate DESC
		""")
	List<QuestionsDTO> selectAnsweredList();
}