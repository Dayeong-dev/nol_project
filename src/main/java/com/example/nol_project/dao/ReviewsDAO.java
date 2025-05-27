package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.ReviewsDTO;
import com.example.nol_project.dto.TicketDTO;

@Mapper
public interface ReviewsDAO {
	//사용자 페이지
	TicketDTO getReviewRno(int rno);

	//사용자 페이지
	void insertReview(ReviewsDTO reviews);

	//사용자 페이지
	List<ReviewsDTO> getReviewsList();
	//사용자 페이지
	List<ReviewsDTO> getMyReview(String id);
	//사용자 페이지
	void reviewUpdate(ReviewsDTO review);
	//사용자 페이지
	void myReviewDelete(int rvno);
	
	//관리자 페이지
	List<ReviewsDTO> getReviewList();
	
	//관리자
	ReviewsDTO getReviewNo(@Param("rvno")int rvno);

	//관리자
	int getReviewDelete(@Param("rvno")int rvno);


	
}
