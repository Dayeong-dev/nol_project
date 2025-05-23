package com.example.nol_project.service;

import org.springframework.stereotype.Service;

import com.example.nol.util.PasswordEncryptor;
import com.example.nol_project.dao.MemberDAO;
import com.example.nol_project.dto.MemberDTO;

@Service
public class MemberService {
	private final MemberDAO memberDao;
	private PasswordEncryptor pwEncryptor = new PasswordEncryptor();
	
	public MemberService(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}

	public boolean checkId(String id) {
		MemberDTO member = memberDao.selectMemberById(id);

		if(member == null) {
			return true;
		}

		return false;
	}

	public boolean join(MemberDTO member) {
		member.setPhone(member.getPhone().replace("-", ""));
		member.setPw(pwEncryptor.encrypt(member.getPw()));	// 비밀번호 암호화
		
		int result = memberDao.join(member);
		
		if(result == 1) {
			return true;
		}
		
		return false;
	}

	public MemberDTO login(String id, String pw) {
		MemberDTO member = memberDao.selectMemberById(id);
		
		if(member != null) {
			String realPw = pwEncryptor.decrypt(member.getPw());	// 비밀번호 복호화
			if(pw.equals(realPw)) {
				return member;
			}
		}

		return null;
	}
}
