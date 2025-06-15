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
}

















