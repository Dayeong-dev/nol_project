package com.example.nol_project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EventCouponDTO {
	private int eno;			// 이벤트 번호
	private String name;
	private String description;
	private Date startDate;
	private Date endDate;
	private String thumbnailURL;
	private String contentImgURL;
	
	private int cno;			// 쿠폰 번호
	private boolean isPast;		// 이벤트 종료 여부
}
