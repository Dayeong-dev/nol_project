package com.example.nol.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class PasswordEncryptor {
	public String encrypt(String pw) {
		Random rd = new Random();		
		String encryptedPw = "";	
		
		for(char ch : pw.toCharArray()) {			
			int rdnum1 = rd.nextInt(3) + 1;
			
			for(int j = 0; j < rdnum1; j++) {
				int rdnum2 = rd.nextInt(3);
				int[] rdnumArr = {rd.nextInt(26) + 97, rd.nextInt(26) + 65, rd.nextInt(15) + 33};
				encryptedPw += String.valueOf((char)(rdnumArr[rdnum2]));				
			}
			
			char chr = encryptedPw.charAt(encryptedPw.length() - 1);				
			encryptedPw += (int)(ch + chr);
		}
		
		return encryptedPw;
	}
	
	public String decrypt(String encryptedPw) {
		StringBuilder sb = new StringBuilder();
		List<Integer> numList = new ArrayList<>();
		
		String pw = "";
		char key = ' ';
		
		for(int i = 0; i < encryptedPw.length(); i++) {
			char ch = encryptedPw.charAt(i);
			
			if(Character.isDigit(ch)) {
				if(key == ' ') {
					key = encryptedPw.charAt(i-1);
				}
				sb.append(ch);
			}
			else {
				if(sb.length() > 0) {
					numList.add(Integer.parseInt(sb.toString()) - (int)key);
					sb.setLength(0);
					key = ' ';
				}
			}
		}
		
		if(sb.length() > 0) {
			numList.add(Integer.parseInt(sb.toString()) - (int)key);
		}
		
		for(int num : numList) {
			pw += (char)num;
		}
		
		return pw;
	}
}
