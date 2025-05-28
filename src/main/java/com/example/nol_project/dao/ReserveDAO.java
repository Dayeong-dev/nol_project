package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.nol_project.dto.ReserveDTO;

@Mapper
public interface ReserveDAO {
    void mergeTicketDate(ReserveDTO dto); // 날짜 없으면 자동 등록
    int getTicketDateQuantity(ReserveDTO dto); // 남은 수량 조회
    void updateQuantity(ReserveDTO dto); // 수량 차감
    void insertReserve(ReserveDTO dto); // 예매 등록
    List showReservation(ReserveDTO DTO); //예매 목록 조회
    
    List<ReserveDTO> getReservationPage(@Param("offset") int offset, @Param("pageSize") int pageSize); // 페이지네이션
    int getReservationCount();
    
    int deleteReservation(@Param("rno") int rno, @Param("id") String id);//예매 삭제기능


}
