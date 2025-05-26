package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.ReviewsDAO;
import com.example.nol_project.dto.ReviewsDTO;
import com.example.nol_project.dto.TicketDTO;

@Service
public class ReviewsService {
	
	@Autowired
	private ReviewsDAO reviewsDao;

	//사용자 페이지
	public void insertReview(ReviewsDTO reviews) {
		reviewsDao.insertReview(reviews);
	}

	//사용자 페이지
	public List<ReviewsDTO> getReviewsList() {
		return reviewsDao.getReviewsList();
	}

	//관리자 페이지
	public List<ReviewsDTO> getReviewList() {
		return reviewsDao.getReviewList();
	}
	
	//관리자 페이지
	public ReviewsDTO getReviewNO(int rvno) {
		return reviewsDao.getReviewNo(rvno);
	}

	//관리자
	public int getReviewDelete(int rvno) {
		return reviewsDao.getReviewDelete(rvno);
	}
	
	
}
