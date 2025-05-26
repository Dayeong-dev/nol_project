package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.EventCouponDTO;
import com.example.nol_project.dto.EventDTO;

@Mapper
public interface EventDAO {

	public List<EventDTO> selectAllEvents();

	public List<EventDTO> getAllEvents();

	public EventCouponDTO selectEventWithCno(@Param("eno") int eno);
	
}
