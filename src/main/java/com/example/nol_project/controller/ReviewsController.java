package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.nol_project.dto.ReviewsDTO;
import com.example.nol_project.dto.TicketDTO;
import com.example.nol_project.service.ReviewsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewsController {
	
	@Autowired
	private ReviewsService reviewsService;
	
	@GetMapping("/reviewWrite")
	public String reviewWrite(Model model, @RequestParam("rno") int rno, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
	        return "redirect:/login";  
	    }
		
		TicketDTO dto = reviewsService.getReviewRno(rno);
		model.addAttribute("rno", rno);
		
		return "reviewForm";
	}
	
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model, @SessionAttribute("id") String id) {
		
		List<ReviewsDTO> list = reviewsService.getMyReview(id);
		model.addAttribute("list", list);
		
		return "reviewDetail";
	}
	
	@GetMapping("/reviews")
	public String reviews(Model model) {
		System.out.println("reviews.............");
		
		List<ReviewsDTO> list = reviewsService.getReviewsList();
		model.addAttribute("list", list);
		
		return "reviews";
	}
	@GetMapping("/reviewForm")
    public String reviewForm(@RequestParam("rno") int rno, HttpSession session, Model model) {
        if (session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        model.addAttribute("rno", rno);
        return "reviewForm";
    }
	
	@PostMapping("/reviewForm")
	public String insertReview(@ModelAttribute ReviewsDTO reviews, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) return "redirect:/login";
		
		reviewsService.insertReview(reviews);
		
		return "redirect:/mypage";
	}
	
	@PostMapping("/reviewUpdate")
	public String reviewUpdate(@ModelAttribute ReviewsDTO review) {
		reviewsService.reviewUpdate(review);
		
		return "redirect:/reviewDetail";
	}
	
	@PostMapping("/reviewDelete")
	public String myReviewDelete(@RequestParam("rvno")int rvno) {
		reviewsService.myReviewDelete(rvno);
		
		return "redirect:/reviewDetail";
	}
}












