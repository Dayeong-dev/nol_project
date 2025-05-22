package com.example.nol.service;

import org.springframework.stereotype.Service;

import com.example.nol.dao.IMemberDAO;
import com.example.nol.dto.MemberDTO;
import com.example.nol.util.PasswordEncryptor;

@Service
public class MemberService {
	private final IMemberDAO memberDao;
	private PasswordEncryptor pwEncryptor = new PasswordEncryptor();
	
	public MemberService(IMemberDAO memberDao) {
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
