package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

	//답변 안한 내용이 보이도록 아래 List로 추가
	@Select("""
		    SELECT 
		        q.qno, q.title, q.content, q.createDate,
		        q.isAnswered, m.name AS memberName 
		    FROM nol_questions q
		    JOIN nol_member m ON q.id = m.id 
		    WHERE q.isAnswered = 0
		    ORDER BY q.qno DESC
		""")
		List<QuestionsDTO> getUnansweredList();
	
    @Insert("""
    	    INSERT INTO nol_questions (qno, id, title, content, createDate, category)
    	    VALUES (seq_nol_questions.NEXTVAL, #{id}, #{title}, #{content}, SYSDATE, #{category})
    	""")
    	void insertQuestion(QuestionsDTO dto);
    
    @Select("""
    	    SELECT * FROM (
    	        SELECT q.*, ROWNUM rnum FROM (
    	            SELECT 
    	                q.qno, q.title, q.content, q.createDate,
    	                q.isAnswered, m.name AS memberName 
    	            FROM nol_questions q
    	            JOIN nol_member m ON q.id = m.id 
    	            ORDER BY q.qno DESC
    	        ) q
    	        WHERE ROWNUM <= #{endRow}
    	    )
    	    WHERE rnum >= #{startRow}
    	""")
    	List<QuestionsDTO> getPagedQuestions(
    	    @Param("startRow") int startRow,
    	    @Param("endRow") int endRow
    	);

    @Select("SELECT COUNT(*) FROM nol_questions")
    int getTotalQuestionCount();
    	
    // 필터링 + 검색 + 페이징된 질문 목록 조회
    List<QuestionsDTO> getFilteredQuestions(
            @Param("category") String category,
            @Param("keyword") String keyword,
            @Param("startRow") int startRow,
            @Param("endRow") int endRow
        );

    int getFilteredQuestionsCount(
            @Param("category") String category,
            @Param("keyword") String keyword
        );
}
