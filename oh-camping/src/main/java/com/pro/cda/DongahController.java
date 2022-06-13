package com.pro.cda;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
}
