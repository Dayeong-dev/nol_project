package com.example.nol_project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserCouponDTO {
	
	    private int ucno;
	    private int cno;
	    private String id;
	    private Date issue_date;
	    private Date expire_date;
	    private int used;
	    
	    private String name;
	    private int discount_rate;
}
