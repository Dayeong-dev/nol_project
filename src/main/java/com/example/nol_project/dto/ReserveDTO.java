package com.example.nol_project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReserveDTO {
	 // 예매 등록용
    private int tno;            // 티켓 번호
    
    @DateTimeFormat(pattern = "yyyy-MM-dd") 
    private Date tdate;       // 예매 날짜 (yyyy-MM-dd)
    
    private int quantity;       // 예매 수량
    private String id;          // 회원 아이디
    private int ucno;           // 사용자 쿠폰 번호
    private int discountRate;   // 할인율
    private int totalPrice;     // 할인 적용 최종 결제 금액

    // 예매 조회용
    private int rno;            // 예매 번호 (PK)
    private String memberName;  // 회원 이름
    private String ticketName;  // 티켓 이름
   
}
