package com.example.nol_project.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.nol_project.dto.AnswersDTO;

@Mapper
public interface IAnswersDAO {
	
	// 답변 등록
	@Insert("""
		    INSERT INTO nol_answers (ano, qno, adminId, content)
		    VALUES (
		        seq_nol_answers.NEXTVAL,
		        #{qno},
		        #{adminId},
		        #{content}
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
}