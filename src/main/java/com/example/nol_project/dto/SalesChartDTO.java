package com.example.nol_project.dto;

import lombok.Data;

@Data
public class SalesChartDTO {
	/* 공통 */
	private int tno;
	private String tname;
	
	/* 연간 */
	private String tmonth;
	private int monthlySales;
	
	/* 월간/주간 */
	private String tdate;
	private int dailySales;
}
