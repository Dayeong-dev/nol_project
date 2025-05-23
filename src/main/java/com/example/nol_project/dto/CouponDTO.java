package com.example.nol_project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CouponDTO {
    private int cno;               // 시퀀스로 자동 부여됨
    private int eno;               // 이벤트 번호 (외래키)
    private String name;           // 쿠폰 이름
    private String description;    // 쿠폰 설명
    private int discount_rate;     // 할인률 (예: 15%)
}

