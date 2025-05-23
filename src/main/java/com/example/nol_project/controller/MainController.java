package com.example.nol_project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.nol.util.PasswordEncryptor;
import com.example.nol_project.dao.AttractionDAO;
import com.example.nol_project.dto.AttractionDTO;

@Controller
public class MainController {
	private final AttractionDAO attrctnDao;
	PasswordEncryptor pe = new PasswordEncryptor();
	
	public MainController(AttractionDAO attrctnDao) {
		this.attrctnDao = attrctnDao;
	}
	
	@GetMapping
	public String root(Model model) {
		List<AttractionDTO> list = attrctnDao.getMainAttrctn();
		
		model.addAttribute("list", list);
		
		return "index";
	}
}
