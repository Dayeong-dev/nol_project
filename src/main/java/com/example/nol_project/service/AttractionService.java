package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.AttractionDAO;
import com.example.nol_project.dto.AttractionDTO;


@Service
public class AttractionService {
		
	@Autowired
	private AttractionDAO attrctnDao;
	
	
	public List<AttractionDTO> allSelectAttrctn(){
		
		return attrctnDao.getAllAttrctn();
	}
	
	public List<AttractionDTO> searchAttrctn(Integer alevel, String name){
		if((alevel == null) && (name == null || name.trim().isEmpty())) {
			return attrctnDao.getAllAttrctn();
		}else {
			return attrctnDao.search(alevel, name);		//검색 조건을 입력했을 때 검색
		}
	}

	public List<AttractionDTO> getAtno(int atno) {
		// TODO Auto-generated method stub
		return attrctnDao.getDetail(atno);
	}

	
}








