package com.example.nol_project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QuestionsDTO {
	private int qno;
	private String id;
	private String title;
	private String content;
	private Date createDate;
	private Integer isAnswered;
	
	// JOIN 결과용
	private String memberName;      // 질문한 사람 이름
	private String memberPhone;     // 질문한 사람 전화번호
	private String answerContent;   // 답변 내용 (있을 경우)
	private String adminId;       // 답변한 관리자 ID (있을 경우)
}
