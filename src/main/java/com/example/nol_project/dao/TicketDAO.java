package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.TicketDTO;

@Mapper
public interface TicketDAO {

	List<TicketDTO> getAllTickets();
	
	TicketDTO getTicketByTno(@Param("tno") int tno);
}
