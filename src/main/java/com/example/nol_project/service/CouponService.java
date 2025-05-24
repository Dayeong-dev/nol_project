package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nol_project.dao.CouponDAO;
import com.example.nol_project.dao.UserCouponDAO;
import com.example.nol_project.dto.CouponDTO;
import com.example.nol_project.dto.UserCouponDTO;

@Service
public class CouponService {

	@Autowired
    private CouponDAO couponDAO;
	
	@Autowired
	private UserCouponDAO userCouponDAO;

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

    @Transactional
	public boolean addUserCoupon(int cno, String userId) {		
		// 사용자의 해당 이벤트 쿠폰 발급 여부 확인
		UserCouponDTO userCoupon = userCouponDAO.selectUserCoupon(cno);
		
		if(userCoupon != null) {
			System.out.println("이미 쿠폰 발급 받음");
			throw new RuntimeException("exist");
		}
		
		// 사용자에게 해당 쿠폰 발급
		int result = userCouponDAO.insertUserCoupon(cno, userId);
		
		if(result == 1) {
			return true;
		}

		System.out.println("쿠폰 발급 실패");
		throw new RuntimeException("fail");
	}
}
