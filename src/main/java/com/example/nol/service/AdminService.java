package com.example.nol.service;

import org.springframework.stereotype.Service;

import com.example.nol.dao.IAdminDAO;
import com.example.nol.dto.AdminDTO;
import com.example.nol.util.PasswordEncryptor;

@Service
public class AdminService {
	private final IAdminDAO adminDao;
	private PasswordEncryptor pwEncryptor = new PasswordEncryptor();
	
	public AdminService(IAdminDAO adminDao) {
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