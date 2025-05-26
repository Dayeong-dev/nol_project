package com.example.nol_project.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.nol_project.dto.SalesChartDTO;
import com.example.nol_project.dto.SalesRangeDTO;
import com.example.nol_project.service.SalesService;

@RestController
public class SalesController {
	private final SalesService salesService;
	
	public SalesController(SalesService salesService) {
		this.salesService = salesService;
	}
	
	@GetMapping("/getSalesRange")
	public SalesRangeDTO getSalesRange() {
		SalesRangeDTO salesRange = salesService.getSalesRange();
		
		return salesRange;
	}
	
	@GetMapping("/yearlySales")
	public List<SalesChartDTO> yearlySales(@RequestParam("year") String year) {
		List<SalesChartDTO> slist = salesService.getYearlySales(year);
		
		return slist;
	}
	
	@GetMapping("/monthlySales")
	public List<SalesChartDTO> monthlySales(@RequestParam("year") String year, @RequestParam("month") String month) {
		List<SalesChartDTO> slist = salesService.getMonthlySales(year, month);
		
		return slist;
	}
	
	@GetMapping("/weeklySales")
	public List<SalesChartDTO> weeklySales(@RequestParam("date") String date) {
		List<SalesChartDTO> slist = salesService.getWeeklySales(date);
		
		return slist;
	}
}
