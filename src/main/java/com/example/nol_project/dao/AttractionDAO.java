package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.AttractionDTO;

@Mapper
public interface AttractionDAO {

	//service
	List<AttractionDTO> search(@Param("alevel")Integer alevel, @Param("name") String name);

	//service
	List<AttractionDTO> getAllAttrctn();

	List<AttractionDTO> getMainAttrctn();
	
	//service
	List<AttractionDTO> getDetail(@Param("atno")int atno);
	
	
}
