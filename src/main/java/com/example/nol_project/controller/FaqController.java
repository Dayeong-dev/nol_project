package com.example.nol_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.nol_project.dao.FaqDAO;
import com.example.nol_project.dto.FaqDTO;

@Controller
public class FaqController {
	
	@Autowired
	private FaqDAO faqDao;
	
	@GetMapping("/faq")
	public String faq(Model model) {
		List<FaqDTO> list = faqDao.getFaqList();
		model.addAttribute("list", list);
		
		return "faq";
	}
	
}





