package com.pro.cda;

import java.util.List;

public class CDA_reserveInfoDTO {

		private int room_no;
		private int addpeople;
		private int addday;
		
		
		public int getRoom_no() {
			return room_no;
		}
		public void setRoom_no(int room_no) {
			this.room_no = room_no;
		}
		public int getAddpeople() {
			return addpeople;
		}
		public void setAddpeople(int addpeople) {
			this.addpeople = addpeople;
		}
		public int getAddday() {
			return addday;
		}
		public void setAddday(int addday) {
			this.addday = addday;
		}
		
		private List<CDA_reserveInfoDTO> reserveInfoDTO;


		public List<CDA_reserveInfoDTO> getReserveInfoDTO() {
			return reserveInfoDTO;
		}
		public void setReserveInfoDTO(List<CDA_reserveInfoDTO> reserveInfoDTO) {
			this.reserveInfoDTO = reserveInfoDTO;
		}
		
		
		
		/*public CDA_reserveInfoDTO() {	}//기본 생성자
		
		public CDA_reserveInfoDTO(List<CDA_reserveInfoDTO> dto) {	//인자 생성자
			
			this.reserveInfoDTO = dto;	
			
		}*/
		
	
	
		
}
