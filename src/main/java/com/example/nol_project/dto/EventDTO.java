package com.example.nol_project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EventDTO {
	private int eno;
	private String name;
	private String description;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String thumbnailURL;
	private String contentImgURL;
	
	private boolean isPast;
}
