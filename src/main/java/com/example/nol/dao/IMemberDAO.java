package com.example.nol.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol.dto.MemberDTO;

@Mapper
public interface IMemberDAO {

	public MemberDTO selectMemberById(@Param("id") String id);

	public int join(@Param("m") MemberDTO member);

}
