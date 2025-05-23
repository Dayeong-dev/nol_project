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
	public String reviewsList() {
		System.out.println("reviews.............");
		
		
		return "reviews";
	}
	
	@GetMapping("/reviewWrite")
	public String reviewWrite(Model model,
							  @RequestParam("rno")int rno) {
//		List<TicketDTO> myReserveList = reviewsService.getTno(rno);
		model.addAttribute("rno", rno);
		
		return "reviewForm";
	}
	
	@PostMapping("/reviewForm")
	public String insertReview(@ModelAttribute ReviewsDTO reviews) {
		reviewsService.insertReview(reviews);
		
		return "redirect:/mypage";
	}
	
}












