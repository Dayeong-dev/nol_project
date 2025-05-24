package com.example.nol_project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.UserCouponDTO;


@Mapper
public interface UserCouponDAO {

	public int insertUserCoupon(@Param("cno") int cno, @Param("id") String id);

	public UserCouponDTO selectUserCoupon(@Param("cno") int cno);

}
