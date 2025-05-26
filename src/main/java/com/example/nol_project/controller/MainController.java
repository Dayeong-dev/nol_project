package com.example.nol_project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.nol.util.PasswordEncryptor;
import com.example.nol_project.dao.AttractionDAO;
import com.example.nol_project.dto.AttractionDTO;
import com.example.nol_project.dto.NoticeDTO;
import com.example.nol_project.service.NoticeService;

@Controller
public class MainController {
	private final AttractionDAO attrctnDao;
	private final NoticeService noticeService;
	PasswordEncryptor pe = new PasswordEncryptor();

	public MainController(AttractionDAO attrctnDao, NoticeService noticeService) {
		this.attrctnDao = attrctnDao;
		this.noticeService = noticeService;
	}

	@GetMapping
	public String root(Model model) {
		List<AttractionDTO> list = attrctnDao.getMainAttrctn();

		model.addAttribute("list", list);

		return "index";
	}

	@GetMapping("/NoticeList")
	public String showNoticeList(Model model) {
		List<NoticeDTO> list = noticeService.getAllNotices(); // 예시
		model.addAttribute("list", list);
		return "NoticeList";
	}
}
