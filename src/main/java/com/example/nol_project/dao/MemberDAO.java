package com.example.nol_project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	public MemberDTO selectMemberById(@Param("id") String id);

	public int join(@Param("m") MemberDTO member);

}
