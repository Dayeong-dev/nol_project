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
	
	//사용자
	public List<AttractionDTO> allSelectAttrctn(){
		return attrctnDao.getAllAttrctn();
	}
	//사용자
	public List<AttractionDTO> searchAttrctn(Integer alevel, String name){
		if((alevel == null) && (name == null || name.trim().isEmpty())) {
			return attrctnDao.getAllAttrctn();
		}else {
			return attrctnDao.search(alevel, name);		//검색 조건을 입력했을 때 검색
		}
	}
	//사용자
	public List<AttractionDTO> getAtno(int atno) {
		return attrctnDao.getDetail(atno);
	}
	
	//관리자
	public List<AttractionDTO> getAttrctnList() {
		return attrctnDao.getAttrctnList();
	}
	//관리자
	public AttractionDTO attrctnDetail(int atno) {
		return attrctnDao.attrctnDetail(atno);
	}
	//관리자
	public void attrctnDelete(int atno) {
		attrctnDao.attrctnDelete(atno);
	}
	//관리자
	public void attrctnUpdate(AttractionDTO atDto) {
		attrctnDao.attrctnUpdate(atDto);
	}
	
	public void attrctnInsert(AttractionDTO atDto) {
		attrctnDao.attrctnInsert(atDto);
	}

}








