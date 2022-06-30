package com.pro.cda;

import java.util.List;

public interface CDA_campingDAO {

	//예약 리스트 보여주기
	//public List<CDA_roomDTO> cda_getRoomList(Long num);
	
	//예약 리스트 보여주기2
	public List<CDA_roomDTO> cda_getRoomList(String date);
	
	
	//예약한 정보 리스트
	public CDA_roomDTO cda_getreserveRoom(Long num);
	
	//예약 완료 페이지로 이동
	//회원번호 받아오기
	public int cda_getmemmo(String id);
	//결제
	public int cda_paymentConfirm(CDA_paymentDTO paymentdto);
	
	//결제번호 가져오기
	public int cda_getpatmentno();
	//결제 디테일
	public int cda_reserveComfirmdetail(CDA_paymentdetailDTO paymentdetailDTO);
	
	//결제 디테일 삭제
	public int cda_paymentDetailremCancel(int no);
	
	//결제 삭제
	public int cda_paymentCancel(int no);
	
	
	//로그인 세션 정보(나중에 병합시 삭제!!!!!)
	public testidDTO gettestid(String id);
	
}
