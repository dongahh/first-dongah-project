package com.pro.cda;

import lombok.Data;

@Data
public class CDA_paymentDTO {
	
	private int payment_no;				//결제번호
	private int payment_memno;			//회원번호
	private String  payment_orderdate;	//주문 날짜
	private String payment_pname;		//주문자 이름
	private String payment_pphone;	//주문자 전호번호
	private int payment_price;	//주문 총 가격
	//private int  payment_state;	//주문 상태?
	private String paymeny_request;	//주문자 요청사항
	
	
	//db에 없는 내용
	private int arrive_time;		//도착시간
	private String arrive_eara;		//도착지역
	private String arrive_getin;	//교통수단
	
	

}
