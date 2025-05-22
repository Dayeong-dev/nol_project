package com.example.nol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.nol.util.PasswordEncryptor;

@Controller
public class MainController {
	PasswordEncryptor pe = new PasswordEncryptor();
	@GetMapping
	public String root() {
		System.out.println("root......");
		
		return "index";
	}
}
