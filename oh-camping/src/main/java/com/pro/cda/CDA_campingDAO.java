package com.pro.cda;

import java.util.List;

public interface CDA_campingDAO {

	//예약 리스트 보여주기
	//public List<CDA_roomDTO> cda_getRoomList(Long num);
	
	//예약 리스트 보여주기2
	public List<CDA_roomDTO> cda_getRoomList(String date);
	
	
	//예약한 정보 리스트
	public CDA_roomDTO cda_getreserveRoom(Long num);
	
	
}
