package com.example.nol_project.dto;

import lombok.Data;

@Data
public class NoticeDTO {

	private int nno;
	private String adminId;
	private String title;
	private String content;
	private int isFixed;
	private int hit;
	private String category;
}
