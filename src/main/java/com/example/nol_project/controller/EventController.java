package com.example.nol_project.controller;

import java.util.Date;
import java.util.List;

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

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
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
	@ResponseBody
	public String addCoupon(@RequestParam("cno") int cno, HttpSession session) {
	    String id = (String) session.getAttribute("id");

	    if (id == null) {
	        return "unauthorized";
	    }

	    // 그 다음 발급 시도
	    try {
	        boolean result = couponService.addUserCoupon(cno, id);

	        return result ? "success" : "fail";
	    } catch (RuntimeException e) {
	        return e.getMessage(); // "exist", "fail" 등이 반환될 수 있음
	    }
	}
	
	@GetMapping("/mypage/couponList")
	public String showMyCouponList(HttpSession session, Model model) {
	    String id = (String) session.getAttribute("id");

	    if (id == null) {
	        return "redirect:/login"; // 비로그인 시 로그인 페이지로 이동
	    }

	    List<UserCouponDTO> myCoupons = couponService.getCouponsByUserId(id);
	    model.addAttribute("couponList", myCoupons);

	    return "couponList"; // ⬅ JSP 파일 경로
	}
	
	 @GetMapping("/popupCookie")
	    @ResponseBody
	    public String popupCookie(@RequestParam(required = false) String inactiveToday,
	                              HttpServletResponse response) {

	        if ("1".equals(inactiveToday)) {
	            Cookie cookie = new Cookie("PopupClose", "off");
	            cookie.setPath("/"); // 모든 경로에서 적용
	            cookie.setMaxAge(60 * 60 * 24); // 1일 
	            response.addCookie(cookie);
	        }
	        return "하루 동안 열지 않음";
	    }
}
