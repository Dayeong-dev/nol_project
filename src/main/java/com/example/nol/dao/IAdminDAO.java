package com.example.nol.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol.dto.AdminDTO;

@Mapper
public interface IAdminDAO {

	public AdminDTO selectAdminById(@Param("adminId") String adminId);

}
