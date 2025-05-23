package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.nol_project.dto.FaqDTO;

@Mapper
public interface FaqDAO {

	List<FaqDTO> getFaqList();

}
