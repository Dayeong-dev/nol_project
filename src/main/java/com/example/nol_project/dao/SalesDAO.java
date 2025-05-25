package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.SalesChartDTO;
import com.example.nol_project.dto.SalesRangeDTO;

@Mapper
public interface SalesDAO {

	public SalesRangeDTO selectSalesRange();
	
	public List<SalesChartDTO> selectYearlySales(@Param("date") String date);

	public List<SalesChartDTO> selectMonthlySales(@Param("date") String date);

	public List<SalesChartDTO> selectWeeklySales(@Param("date") String date);
}
