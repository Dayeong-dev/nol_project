package com.example.nol_project.service;

import com.example.nol_project.dao.ReserveDAO;
import com.example.nol_project.dto.ReserveDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveService {

    @Autowired
    private ReserveDAO reserveDAO;

    public boolean processReserve(ReserveDTO dto) {
        // 1. 날짜별 수량 정보가 없으면 MERGE로 자동 생성
        reserveDAO.mergeTicketDate(dto);

        // 2. 남은 수량 조회
        int remainQty = reserveDAO.getTicketDateQuantity(dto);
        if (remainQty < dto.getQuantity()) return false;

        // 3. 수량 차감
        reserveDAO.updateQuantity(dto);

        // 4. 예매 등록
        reserveDAO.insertReserve(dto);

        return true;
    }
}
