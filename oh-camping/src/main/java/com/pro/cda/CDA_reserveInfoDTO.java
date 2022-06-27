package com.pro.cda;

import java.util.List;

import lombok.Data;

@Data
public class CDA_reserveInfoDTO {

		private int room_no;
		private int addpeople;
		private int addday;
		private int addprice;
		private int discountprice;
		
		
		private List<CDA_reserveInfoDTO> reserveInfoDTO;
		
		

	
		
}
