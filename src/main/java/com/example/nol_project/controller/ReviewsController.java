package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.nol_project.dto.ReviewsDTO;
import com.example.nol_project.dto.TicketDTO;
import com.example.nol_project.service.ReviewsService;

@Controller
public class ReviewsController {
	
	@Autowired
	private ReviewsService reviewsService;
	
	@GetMapping("/reviews")
	public String reviews(Model model) {
		System.out.println("reviews.............");
		
		List<ReviewsDTO> list = reviewsService.getReviewsList();
		model.addAttribute("list", list);
		
		return "reviews";
	}
	
	@GetMapping("/reviewWrite")
	public String reviewWrite(Model model,
							  @RequestParam("rno") int rno) {
//		List<TicketDTO> myReserveList = reviewsService.getTno(rno);
		model.addAttribute("rno", rno);
		
		return "reviewForm";
	}
	
	@PostMapping("/reviewForm")
	public String insertReview(@ModelAttribute ReviewsDTO reviews) {
		reviewsService.insertReview(reviews);
		
		return "redirect:/mypage";
	}
	
	//---------관리자----------
	@GetMapping("/admin/reviewList")
	public String reviewList(Model model) {
		
		List<ReviewsDTO> list = reviewsService.getReviewList();
		model.addAttribute("list", list);
		
		return "admin/reviewList";
	}
	
	@GetMapping("/admin/reviewDetail.do")
	public String reviewDetail(@RequestParam("rvno")int rvno, Model model) {
		ReviewsDTO review = reviewsService.getReviewNO(rvno);
		model.addAttribute("review", review);
		
		return "admin/reviewDetail";
	}
	
	@PostMapping("/admin/reviewDelete")
	public String reviewDelete(@RequestParam("rvno")int rvno) {
		reviewsService.getReviewDelete(rvno);
		
		return "redirect:/admin/reviewList";
	}
	
}












