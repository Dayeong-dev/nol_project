package com.example.nol_project.dto;

import lombok.Data;

@Data
public class ReserveDTO {
    private int tno;          // 티켓 번호
    private String tdate;     // 예매 날짜 (yyyy-MM-dd)
    private int quantity;     // 예매 수량
    private String id;        // 회원 아이디
    private int ucno;         // 사용자가 선택한 쿠폰 번호 (nol_user_coupon.ucno)
    private int discountRate; // 해당 쿠폰의 할인율 (이건 DB에서 조인해도 되고, 폼에서 hidden으로 받아도 됨)
    private int totalPrice;   // 할인 적용된 최종 결제 금액

   
}
