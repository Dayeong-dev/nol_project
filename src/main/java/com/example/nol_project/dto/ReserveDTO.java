package com.example.nol_project.dto;

import lombok.Data;

@Data
public class ReserveDTO {
    private int tno;          // 티켓 번호
    private String tdate;     // 예매 날짜 (yyyy-MM-dd)
    private int quantity;     // 예매 수량
    private String id;        // 회원 아이디

   
}
