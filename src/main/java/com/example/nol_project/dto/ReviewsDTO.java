package com.example.nol_project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewsDTO {
	private int rvno;	//리뷰번호
	private int rno;	//예매번호
	private String content;
	private Date rvdate;
}
