package com.example.nol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.nol.dto.AdminDTO;
import com.example.nol.service.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private final AdminService adminService;
	
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
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
}
