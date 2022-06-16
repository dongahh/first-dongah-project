package com.pro.cda;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.cda.CalendarDTO;

@Controller
public class DongahController {
	
	@Autowired
	CDA_campingDAO dao;

	@RequestMapping("dong.do")
	public String test() {
		System.out.println("test로 이동");
		return "cda/dongad_1";
	}
	
	
	@RequestMapping("reserve_confirm.do")
	public String reserve_confirm(Model model, CalendarDTO dateDTO) {
		
		//날짜 관련 정보 넘겨주기
		
		Calendar cal = Calendar.getInstance();
		
		CalendarDTO calendarData = new CalendarDTO(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE));
		
		model.addAttribute("calendarInfo", calendarData);
		
		
		
		return "cda/reserv_comfirm";
	}
	
	//달력이 나오는 ajax 
	@RequestMapping("reserv_next_calendar.do")
	public String reserve_confirm_nextcalendar(@RequestParam("calendar_year") int year,@RequestParam("calendar_month") int month, Model model, CalendarDTO dateDTO) {
		
		//날짜 관련 정보 넘겨주기
		
		Calendar cal = Calendar.getInstance();
		
		CalendarDTO calendarData = new CalendarDTO(year, month, cal.get(Calendar.DATE));
		
		model.addAttribute("calendarInfo", calendarData);
		
		
		
		return "cda/reserv_calendar_ajax";
	}
	
	/*
	 * @RequestMapping("reserve_getInfo.do") 
	 * public @ResponseBody List<CDA_roomDTO>
	 * reserve_getroomInfor(@RequestParam("dayofcalendar") long num, Model model){
	 * 
	 * List<CDA_roomDTO> room_list = new ArrayList<CDA_roomDTO>();
	 * 
	 * CDA_roomDTO dto = new CDA_roomDTO();
	 * 
	 * room_list = this.dao.cda_getRoomList(num);
	 * 
	 * 
	 * //model.addAttribute("room_list", room_list); 
	 * System.out.println("num>>"+num); 
	 * System.out.println("room_list>>"+room_list);
	 * 
	 * 
	 * return room_list;
	 * 
	 * }
	 */
	
	@RequestMapping("reserve_getInfo.do")
	/*
	 * @ResponseBody
	 */	
	public String getroomofday(@RequestParam("dayofcalendar") long num, Model model) {
		 List<CDA_roomDTO> room_list = new ArrayList<CDA_roomDTO>();
		  
		 CDA_roomDTO dto = new CDA_roomDTO();
		 
		 room_list = this.dao.cda_getRoomList(num);
		  
		 
		 model.addAttribute("room_list", room_list); 
		 System.out.println("num>>"+num); 
		 System.out.println("room_list>>"+room_list);
		 
		 return "cda/reserve_roomOfDayList_ajax";
		 
		
	}
	
	
	@RequestMapping("reserve_payment.do")
	//@ResponseBody							
	public String payment(Model model, CDA_reserveInfoDTO reserveInfoDTO ) {
		//@ModelAttribute : @RequestParam과 다르게  
		
		List<CDA_roomDTO> roomList = new ArrayList<CDA_roomDTO>();
		
		//List<HashMap<String, Integer>> list = new ArrayList<HashMap<String,Integer>>();
		for(CDA_reserveInfoDTO dto:reserveInfoDTO.getReserveInfoDTO()) {
			
			
			/*
			 * HashMap<String, Integer> result = new HashMap<String, Integer>();
			 * result.put("room_no",dto.getRoom_no());
			 * result.put("addpeople",dto.getAddpeople()); //result.put("addday",
			 * dto.getAddday());
			 */ 
			
			//넘겨주는 것은 객실 리스트와 ㅈ
			// 룸번호에 해댕하는 값을 가져오기 DTO로 받아서 나중에 list에 넣는으로 하자	
			//1. 
			
			 System.out.println("list.getRoom_no()>>"+dto.getRoom_no());
			 
			 
			
			
			
			
			
			
			
		}
		
		/*
		 * System.out.println("list>>"+list);
		 * 
		 * model.addAttribute(list);
		 */
		
		
		
		return "cda/payment";
	}
	
}
