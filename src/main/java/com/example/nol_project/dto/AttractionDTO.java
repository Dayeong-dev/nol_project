package com.example.nol_project.dto;

import lombok.Data;

@Data
public class AttractionDTO {
	private int atno;			//어트랙션 번호
	private String name;		//어트랙션 명
	private String description;	//어트랙션 설명
	private String imageURL;	//이미지 주소
	private int alevel;			//어트랙션 난이도(1, 2, 3)
	private int state;			//운행여부(1, 0)
}
