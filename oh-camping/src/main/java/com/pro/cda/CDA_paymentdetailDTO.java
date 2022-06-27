package com.pro.cda;

import java.util.List;

import lombok.Data;

@Data
public class CDA_paymentdetailDTO {
	
	private int paymentDetail_no;
	private int paymentDetail_paymentno;
	private int paymentDetail_roomno;
	private int paymentDetail_people;
	private int paymentDetail_price;
	
	//DB에 안들어감.
	private String paymentDetail_resdate;
	private String paymentDetail_roomname;
	
	private List<CDA_paymentdetailDTO> paymentdetailDTO;

}


