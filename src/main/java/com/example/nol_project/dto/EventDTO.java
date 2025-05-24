package com.example.nol_project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EventDTO {
	private int eno;
	private String name;
	private String description;
	private Date startDate;
	private Date endDate;
	private String thumbnailURL;
	private String contentImgURL;
	
	private boolean isPast;
}
