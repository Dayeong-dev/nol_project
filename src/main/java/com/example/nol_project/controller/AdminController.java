package com.example.nol_project.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.nol_project.dto.AdminDTO;
import com.example.nol_project.dto.CouponDTO;
import com.example.nol_project.dto.EventCouponDTO;
import com.example.nol_project.dto.EventDTO;
import com.example.nol_project.dto.ReserveDTO;
import com.example.nol_project.dto.UserCouponDTO;
import com.example.nol_project.service.AdminService;
import com.example.nol_project.service.CouponService;
import com.example.nol_project.service.EventService;
import com.example.nol_project.service.ReserveService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final AdminService adminService;
	private final CouponService couponService;
	private final ReserveService reserveService;
	private final EventService eventService;
	
	public AdminController(AdminService adminService, 
						   CouponService couponService, 
						   ReserveService reserveService, 
						   EventService eventService) {
		this.adminService = adminService;
		this.couponService = couponService;
		this.reserveService = reserveService;
		this.eventService = eventService;
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
	
	@GetMapping("/regCoupon/{eno}")
	public String regCouponForm(@PathVariable("eno") int eno, Model model) {
	    EventDTO event = eventService.getEventByEno(eno); // 이벤트 정보 가져오기

	    model.addAttribute("event", event);
	    return "admin/regCoupon"; // views/admin/event.jsp
	}
	
	@PostMapping("/regCoupon/{eno}")
	public String regCoupon(@PathVariable("eno") int eno, @ModelAttribute CouponDTO dto, RedirectAttributes rttr) {
	    System.out.println(eno);
	    System.out.println(dto);
		
		couponService.insertCoupon(dto);
	    rttr.addFlashAttribute("msg", "쿠폰이 발급되었습니다.");
	    
	    return "redirect:/admin/eventDetail?eno=" + eno;
	}
	
	@GetMapping("/couponList")
	public String showAdminCouponList(Model model) {
	    List<UserCouponDTO> list = couponService.getAllUserCoupons(); // 전체 유저 쿠폰
	    model.addAttribute("couponList", list);
	    return "admin/couponList"; // views/admin/couponList.jsp
	}
	
	@GetMapping("/salesDetail")
	public String salesDetail() {
		
		return "admin/salesDetail";
	}

	@GetMapping("/reservationList")
	public String showReservationList(@RequestParam(value = "page", defaultValue = "1") int page,
	                                   Model model) {
	    int pageSize = 10;
	    List<ReserveDTO> list = reserveService.getReservationPage(page, pageSize);
	    int totalCount = reserveService.getReservationCount();
	    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

	    model.addAttribute("reservationList", list);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPage", totalPage);

	    return "admin/reservationList";
	}
	
	@GetMapping("/eventList")
	public String eventList(Model model) {
		List<EventDTO> elist = eventService.getEventList();
		model.addAttribute("elist", elist);
		
		return "admin/eventList";
	}
	
	@GetMapping("/eventDetail")
	public String eventDetail(@RequestParam("eno") int eno, Model model) {
		EventCouponDTO eventCoupon = eventService.getEventDetail(eno);
		System.out.println(eventCoupon);
		
		Date now = new Date();
		eventCoupon.setPast(now.after(eventCoupon.getEndDate()));
		
		model.addAttribute("event", eventCoupon);
		
		return "admin/eventDetail";
	}
	
	@GetMapping("/regEvent")
	public String regEventForm() {
		
		return "admin/regEvent";
	}
	
	@PostMapping("/regEvent")
	public String regEvent(EventDTO event, RedirectAttributes rttr) {
		boolean result = eventService.regEvent(event);
		
		if(!result) {
			rttr.addFlashAttribute("errorMsg", "이벤트 등록 중 문제가 발생하였습니다. ");
			
			return "redirect:/admin/regEvent";
		}
		
		return "redirect:/admin/eventList";
	}
	
	@GetMapping("/updateEvent/{eno}")
	public String updateEventFrom(@PathVariable("eno") int eno, Model model) {
		EventDTO event = eventService.getEventByEno(eno); // 이벤트 정보 가져오기

		model.addAttribute("mode", 1);	// mode 1: 수정
		model.addAttribute("eno", eno);
		model.addAttribute("event", event);
		
		return "admin/regEvent";
	}
	
	@PostMapping("/updateEvent/{eno}")
	public String updateEvent(@PathVariable("eno") int eno, EventDTO event, RedirectAttributes rttr) {
		boolean result = eventService.updateEvent(event, eno);
		
		if(!result) {
			rttr.addFlashAttribute("errorMsg", "이벤트 수정 중 문제가 발생하였습니다. ");
			
			return "redirect:/admin/updateEvent/" + eno;
		}
		
		return "redirect:/admin/eventDetail?eno=" + eno;
	}
	
	@GetMapping("/deleteEvent/{eno}")
	public String deleteEvent(@PathVariable("eno") int eno, RedirectAttributes rttr) {
		boolean result = eventService.deleteEvent(eno);
		
		if(!result) {
			rttr.addFlashAttribute("errorMsg", "이벤트 삭제 중 오류가 발생했습니다.");
			return "redirect:/admin/eventDetail/" + eno;
		}
		
		return "redirect:/admin/eventList";
	}
	
	@GetMapping("/admin/dashboard")
	public String adminDashboard() {
		
	    return "admin/dashboard"; 
	}
}
