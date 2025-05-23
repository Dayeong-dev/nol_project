package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.CouponDAO;
import com.example.nol_project.dto.CouponDTO;
import com.example.nol_project.dto.UserCouponDTO;

@Service
public class CouponService {

	@Autowired
    private CouponDAO couponDAO;

    public List<UserCouponDTO> getCouponsByUserId(String id) {
        return couponDAO.getCouponsByUserId(id);
    }
    
    //쿠폰등록
    public void insertCoupon(CouponDTO dto) {
        couponDAO.insertCoupon(dto);
    }
    
    public List<UserCouponDTO> getAllUserCoupons() {
        return couponDAO.getAllUserCoupons();
    }
    
    public List<CouponDTO> getAllEvents() {
        return couponDAO.getAllEvents(); // mapper 연동
    }
}
