package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.CouponDTO;
import com.example.nol_project.dto.UserCouponDTO;

@Mapper
public interface CouponDAO {
	
	List<UserCouponDTO> getCouponsByUserId(@Param("id") String id);
	 
	void insertCoupon(CouponDTO dto);
	 
	List<UserCouponDTO> getAllUserCoupons();
	 
	List<CouponDTO> getAllEvents(); // 이벤트 목록 조회
	 
	CouponDTO getCouponByEno(@Param("eno") int eno);
}
