package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.ReviewsDTO;

@Mapper
public interface ReviewsDAO {

	//사용자 페이지
	void insertReview(ReviewsDTO reviews);

	//사용자 페이지
	List<ReviewsDTO> getReviewsList();

	//관리자 페이지
	List<ReviewsDTO> getReviewList();
	
	//관리자
	ReviewsDTO getReviewNo(@Param("rvno")int rvno);

	//관리자
	int getReviewDelete(@Param("rvno")int rvno);
	
	
}
