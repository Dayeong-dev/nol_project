package com.example.nol_project.service;

import org.springframework.stereotype.Service;

import com.example.nol.util.PasswordEncryptor;
import com.example.nol_project.dao.AdminDAO;
import com.example.nol_project.dto.AdminDTO;

@Service
public class AdminService {
	private final AdminDAO adminDao;
	private PasswordEncryptor pwEncryptor = new PasswordEncryptor();
	
	public AdminService(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	public AdminDTO login(String adminId, String pw) {
		AdminDTO admin = adminDao.selectAdminById(adminId);
		
		if(admin != null) {
			String realPw = pwEncryptor.decrypt(admin.getPw());
			
			if(pw.equals(realPw)) {
				return admin;
			}
		}
		
		return null;
	}
}