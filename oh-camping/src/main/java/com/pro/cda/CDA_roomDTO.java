package com.pro.cda;

import lombok.Data;

@Data
public class CDA_roomDTO {
	
	
	//room_no 시퀀스로 변경?
	//room_table에 image 추가.

	private String room_resdate;
	private Long room_no;
	private String room_name;
	private int room_people;
	private int room_mpeople;
	private int room_price;
	private int room_possible;
	
	
	private int addday;
	private int addpeople;	//추가인원수 아니고 객실당 예약 인원수!!
	private int addprice;
	

	
	
}
