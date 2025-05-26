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

	public void insertReview(ReviewsDTO reviews) {
		reviewsDao.insertReview(reviews);
	}

	public List<ReviewsDTO> getReviewsList() {
		
		return reviewsDao.getReviewsList();
	}
	
	
}
