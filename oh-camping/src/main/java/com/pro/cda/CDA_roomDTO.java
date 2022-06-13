package com.pro.cda;

import lombok.Data;

@Data
public class CDA_roomDTO {
	
	
	//room_no 시퀀스로 변경?
	//room_table에 image 추가.

	private Long room_resdate;
	private Long room_no;
	private String room_name;
	private int room_people;
	private int room_mpeople;
	private int room_price;
	private int room_possible;
	public Long getRoom_resdate() {
		return room_resdate;
	}
	public void setRoom_resdate(Long room_resdate) {
		this.room_resdate = room_resdate;
	}
	public Long getRoom_no() {
		return room_no;
	}
	public void setRoom_no(Long room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getRoom_people() {
		return room_people;
	}
	public void setRoom_people(int room_people) {
		this.room_people = room_people;
	}
	public int getRoom_mpeople() {
		return room_mpeople;
	}
	public void setRoom_mpeolpe(int room_mpeople) {
		this.room_mpeople = room_mpeople;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getRoom_possible() {
		return room_possible;
	}
	public void setRoom_possible(int room_possible) {
		this.room_possible = room_possible;
	}
	
	
	
	
}
