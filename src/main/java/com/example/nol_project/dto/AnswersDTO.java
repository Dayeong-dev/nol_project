package com.example.nol_project.dto;

import lombok.Data;

@Data
public class AnswersDTO {
	private int ano;
	private int qno;
	private String adminId;
	private String content;
	
	// 조회용으로 활용할수도 있음
	private String adminName;     	  // 관리자 이름 (JOIN용)
	private String questionTitle;   // 질문 제목 (JOIN용)
	private String memberName;
}
