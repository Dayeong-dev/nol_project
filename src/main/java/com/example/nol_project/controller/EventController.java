package com.example.nol_project.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.nol_project.dto.EventCouponDTO;
import com.example.nol_project.dto.EventDTO;
import com.example.nol_project.dto.UserCouponDTO;
import com.example.nol_project.service.CouponService;
import com.example.nol_project.service.EventService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EventController {
	private final EventService eventService;
	private final CouponService couponService;
	
	public EventController(EventService eventService, CouponService couponService) {
		this.eventService = eventService;
		this.couponService = couponService;
	}
	
	@GetMapping("/eventList")
	public String eventList(Model model) {
		List<EventDTO> elist = eventService.getEventList();
		model.addAttribute("elist", elist);
		
		return "eventList";
	}
	
	@GetMapping("/eventDetail")
	public String eventDetail(@RequestParam("eno") int eno, Model model) {
		EventCouponDTO eventCoupon = eventService.getEventDetail(eno);
		
		Date now = new Date();
		eventCoupon.setPast(now.after(eventCoupon.getEndDate()));
		
		model.addAttribute("event", eventCoupon);
		
		return "eventDetail";
	}
	
	@GetMapping("/addCoupon")
	public @ResponseBody String addCoupon(@RequestParam("cno") int cno, HttpSession session, Model model) {
		try {
			String id = (String) session.getAttribute("id");
			boolean result = couponService.addUserCoupon(cno, id);
			
			if(result) {
				return "success";
			}
			
			return "fail";
		} catch(RuntimeException e) {
			return e.getMessage();
		}
		
	}
}
