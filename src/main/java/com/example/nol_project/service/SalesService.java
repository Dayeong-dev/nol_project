package com.example.nol_project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.nol_project.dao.SalesDAO;
import com.example.nol_project.dto.SalesChartDTO;
import com.example.nol_project.dto.SalesRangeDTO;

@Service
public class SalesService {
	private final SalesDAO salesDao;
	
	public SalesService(SalesDAO salesDao) {
		this.salesDao = salesDao;
	}
	

	public SalesRangeDTO getSalesRange() {
		SalesRangeDTO salesRange = salesDao.selectSalesRange();

		return salesRange;
	}
	

	public List<SalesChartDTO> getYearlySales(String date) {	
		List<SalesChartDTO> slist = salesDao.selectYearlySales(date);

		return slist;
	}


	public List<SalesChartDTO> getMonthlySales(String date) {	
		List<SalesChartDTO> slist = salesDao.selectMonthlySales(date);
		
		return slist;
	}


	public List<SalesChartDTO> getWeeklySales(String date) {
		List<SalesChartDTO> slist = salesDao.selectWeeklySales(date);
		
		return slist;
	}
}
