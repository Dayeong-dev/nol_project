package com.example.nol_project.dto;

import lombok.Data;

@Data
public class SalesRangeDTO {
	private String earliestYear;	// 최소 날짜 연도
	private String earliestMonth;	// 최소 날짜 월
	private String latestYear;		// 최대 날짜 연도
	private String latestMonth;		// 최대 날짜 월
	private String earliestIsoYear;	// 최소 날짜 ISO 연도
	private String earliestIsoWeek;	// 최소 날짜 ISO 주
	private String latestIsoYear;	// 최대 날짜 ISO 연도
	private String latestIsoWeek;	// 최대 날짜 ISO 주
}
