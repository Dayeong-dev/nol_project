package com.example.nol_project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.nol_project.dto.SalesChartDTO;
import com.example.nol_project.dto.SalesRangeDTO;
import com.example.nol_project.service.SalesService;

@Controller
public class SalesController {
	private final SalesService salesService;
	
	public SalesController(SalesService salesService) {
		this.salesService = salesService;
	}
	
	@GetMapping("/getSalesRange")
	public @ResponseBody SalesRangeDTO getSalesRange() {
		SalesRangeDTO salesRange = salesService.getSalesRange();
		
		return salesRange;
	}
	
	@GetMapping("/yearlySales")
	public @ResponseBody List<SalesChartDTO> yearlySales(@RequestParam("date") String date) {
		List<SalesChartDTO> slist = salesService.getYearlySales(date);
		
		return slist;
	}
	
	@GetMapping("/monthlySales")
	public @ResponseBody List<SalesChartDTO> monthlySales(@RequestParam("date") String date) {
		List<SalesChartDTO> slist = salesService.getMonthlySales(date);
		
		return slist;
	}
	
	@GetMapping("/weeklySales")
	public @ResponseBody List<SalesChartDTO> weeklySales(@RequestParam("date") String date) {
		List<SalesChartDTO> slist = salesService.getWeeklySales(date);
		
		return slist;
	}
}
