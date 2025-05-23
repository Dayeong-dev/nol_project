package com.example.nol_project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.nol_project.dto.MemberDTO;
import com.example.nol_project.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	private final MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/login")
	public String loginForm() {
		
		return "login";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		
		return "join";
	}
	
	@GetMapping("/checkId")
	public @ResponseBody Map<String, Boolean> checkId(@RequestParam("id") String id) {
		Map<String, Boolean> map = new HashMap<>();
		
		boolean result = memberService.checkId(id);		
		map.put("result", result);
		
		return map;
	}
	
	@PostMapping("/join")
	public String join(MemberDTO member, RedirectAttributes rttr) {
		boolean result = memberService.join(member);
		
		if(!result) {
			rttr.addFlashAttribute("message", "회원가입 중 문제가 발생했습니다. ");
			return "redirect:/join";
		}
		
		return "redirect:/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session, RedirectAttributes rttr) {
		MemberDTO member = memberService.login(id, pw);

		if(member == null) {
			rttr.addFlashAttribute("message", "로그인 중 문제가 발생했습니다. ");
			return "redirect:/login";
		}
		
		session.setAttribute("id", member.getId());
		session.setAttribute("name", member.getName());
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session != null) {
			session.invalidate();
		}
		
		String referer = request.getHeader("referer");
		
		if(referer == null || referer.contains("/logout")) {
			return "redirect:/";
		}
		
		return "redirect:" + referer;
	}
}
