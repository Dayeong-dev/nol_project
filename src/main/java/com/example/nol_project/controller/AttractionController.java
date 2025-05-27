package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.nol_project.dto.AttractionDTO;
import com.example.nol_project.service.AttractionService;

@Controller
public class AttractionController {
	
	@Autowired
	private AttractionService attrctnService;
	
	
	@GetMapping("/attrctn")
	public String listAttrctn(Model model, 
							  @RequestParam(name = "alevel" ,required = false)Integer alevel,
							  @RequestParam(name = "name" ,required = false)String name
							  ) {
		List<AttractionDTO> list = attrctnService.searchAttrctn(alevel, name);
		model.addAttribute("list", list);
		
		return "attrctn";
	}

	@GetMapping("/detail")
	public String detailAttrctn(Model model, @RequestParam("atno") int atno) {
		List<AttractionDTO> list = attrctnService.getAtno(atno);
		model.addAttribute("list", list);
		
		return "detail";
	}
	
	//---------관리자----------
	@GetMapping("/admin/attrctnList")
	public String attrctnList(Model model) {
		List<AttractionDTO> list = attrctnService.getAttrctnList();
		model.addAttribute("list", list);
		
		return "admin/attrctnList";
	}
	
	@GetMapping("/admin/attrctnDetail.do")
	public String attrctnDetail(@RequestParam("atno")int atno, Model model) {
		AttractionDTO attrctn = attrctnService.attrctnDetail(atno);
		model.addAttribute("at", attrctn);
		
		return "admin/attrctnDetail";
	}
	
	@GetMapping("/admin/attrctnDelete.do")
	public String attrctnDelete(@RequestParam("atno")int atno) {
		attrctnService.attrctnDelete(atno);
		
		return "redirect:/admin/attrctnList";
	}
	
	@PostMapping("/admin/attrctnUpdate.do")
	public String attrctnUpdate(AttractionDTO atDto, RedirectAttributes rdab) {
		attrctnService.attrctnUpdate(atDto);
		rdab.addFlashAttribute("message", "수정되었습니다.");
		
		return "redirect:/admin/attrctnDetail.do?atno=" + atDto.getAtno();
	}
	
	@PostMapping("/admin/attrctnForm")
	public String attrctnInsert(AttractionDTO atDto ,Model model) {
		attrctnService.attrctnInsert(atDto);
		
		return "redirect:/admin/attrctnList";
	}
	
	@GetMapping("/admin/attrctnForm")
	public String attrctnForm() {
		System.out.println("attrctnForm..........");
		return "admin/attrctnForm";
	}
	
}

















