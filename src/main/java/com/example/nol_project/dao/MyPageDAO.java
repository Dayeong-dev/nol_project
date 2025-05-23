package com.example.nol_project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {
	
	 List<Map<String, Object>> getMyReserveList(String id);
}
