package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.nol_project.dto.ReviewsDTO;
import com.example.nol_project.dto.TicketDTO;

@Mapper
public interface ReviewsDAO {

	void insertReview(ReviewsDTO reviews);

	List<ReviewsDTO> getReviewsList();

	//List<TicketDTO> getTno();
	
	
}
