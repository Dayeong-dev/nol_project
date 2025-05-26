package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.AttractionDTO;

@Mapper
public interface AttractionDAO {

	//사용자
	List<AttractionDTO> search(@Param("alevel")Integer alevel, @Param("name") String name);

	//사용자
	List<AttractionDTO> getAllAttrctn();

	//사용자
	List<AttractionDTO> getMainAttrctn();
	
	//사용자
	List<AttractionDTO> getDetail(@Param("atno")int atno);

	//관리자
	List<AttractionDTO> getAttrctnList();

	//관리자
	AttractionDTO attrctnDetail(int atno);

	//관리자
	void attrctnDelete(int atno);

	//관리자
	void attrctnUpdate(AttractionDTO atDto);

	//관리자
	void attrctnInsert(AttractionDTO atDto);
	
	
}
