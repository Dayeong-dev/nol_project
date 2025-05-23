package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.nol_project.dto.AdminDTO;
import com.example.nol_project.dto.CouponDTO;
import com.example.nol_project.dto.UserCouponDTO;
import com.example.nol_project.service.AdminService;
import com.example.nol_project.service.CouponService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final AdminService adminService;
	private final CouponService couponService;
	
	public AdminController(AdminService adminService, CouponService couponService) {
		this.adminService = adminService;
		this.couponService = couponService;
	}
	
	
	@GetMapping({"", "/"})
	public String root(HttpSession session, RedirectAttributes rttr) {
		if(session.getAttribute("adminId") == null) {
			rttr.addFlashAttribute("message", "관리자 전용 페이지 입니다. 로그인 후 진행해주세요. ");
			return "redirect:/admin/login";
		}
		
		return "admin/index";
	}
	
	@GetMapping("/login")
	public String loginForm() {

		return "admin/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("adminId") String adminId, @RequestParam("pw") String pw, HttpSession session, RedirectAttributes rttr) {
		AdminDTO admin = adminService.login(adminId, pw);
		
		if(admin == null) {
			rttr.addFlashAttribute("message", "관리자 로그인 중 문제가 발생했습니다. ");
			return "redirect:/admin/login";
		}
		
		session.setAttribute("adminId", admin.getAdminId());
		session.setAttribute("adminName", admin.getName());
		
		return "redirect:/admin";
	}
	
	@GetMapping("/event")
	public String event(Model model) {
	    List<CouponDTO> eventList = couponService.getAllEvents(); // 이벤트 목록 가져오기
	    System.out.println("✅ 이벤트 개수: " + eventList.size());
	    for (CouponDTO e : eventList) {
	        System.out.println("🟢 " + e.getName());
	    }

	    model.addAttribute("eventList", eventList);
	    return "admin/event"; // views/admin/event.jsp
	}
	
	@PostMapping("/insertCoupon")
	public String insertCoupon(@ModelAttribute CouponDTO dto, RedirectAttributes rttr) {
	    couponService.insertCoupon(dto);
	    rttr.addFlashAttribute("msg", "쿠폰이 발급되었습니다.");
	    return "redirect:/admin/couponList";
	}
	
	@GetMapping("/couponList")
	public String showAdminCouponList(Model model) {
	    List<UserCouponDTO> list = couponService.getAllUserCoupons(); // 전체 유저 쿠폰
	    model.addAttribute("couponList", list);
	    return "admin/couponList"; // views/admin/couponList.jsp
	}
}
