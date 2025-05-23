package com.example.nol_project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.AdminDTO;

@Mapper
public interface AdminDAO {

	public AdminDTO selectAdminById(@Param("adminId") String adminId);

}
