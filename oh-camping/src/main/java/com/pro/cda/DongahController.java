package com.pro.cda;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

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

		// 날짜 관련 정보 넘겨주기

		Calendar cal = Calendar.getInstance();

		CalendarDTO calendarData = new CalendarDTO(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
				cal.get(Calendar.DATE));

		model.addAttribute("calendarInfo", calendarData);

		return "cda/reserv_comfirm";
	}

	// 달력이 나오는 ajax
	@RequestMapping("reserv_next_calendar.do")
	public String reserve_confirm_nextcalendar(@RequestParam("calendar_year") int year,
			@RequestParam("calendar_month") int month, Model model, CalendarDTO dateDTO) {

		// 날짜 관련 정보 넘겨주기

		Calendar cal = Calendar.getInstance();

		CalendarDTO calendarData = new CalendarDTO(year, month, cal.get(Calendar.DATE));

		model.addAttribute("calendarInfo", calendarData);

		return "cda/reserv_calendar_ajax";
	}

	
	//해당 날짜에 따른 객실 리스트 가져오기
	@RequestMapping("reserve_getInfo_weekend.do")
	public String getroomWeekend(@RequestParam("calYear") int year,@RequestParam("calMonth") int month,@RequestParam("calDate") int date, Model model) {
		List<CDA_roomDTO> room_list = new ArrayList<CDA_roomDTO>();

		CDA_roomDTO dto = new CDA_roomDTO();

		System.out.println(year+"-"+month+"-"+date);	
		
		  Calendar cal = Calendar.getInstance();
		  
		  cal.set(year,month,date);
		  
		  SimpleDateFormat msdf = new SimpleDateFormat("yy/MM/dd");
		  
		  String dayday = msdf.format(cal.getTime());
		  
		  System.out.println("dayday>>"+dayday);
		  
		room_list = this.dao.cda_getRoomList(dayday);

		model.addAttribute("room_list", room_list);
		
		System.out.println("room_list>>" + room_list);

		return "cda/reserve_roomOfDayList_ajax";	

	}
	
	@RequestMapping("reserve_getInfo_weekday.do")
	public String getroomWeekday(@RequestParam("calYear") int year,@RequestParam("calMonth") int month,@RequestParam("calDate") int date, Model model) {
		List<CDA_roomDTO> room_list = new ArrayList<CDA_roomDTO>();

		CDA_roomDTO dto = new CDA_roomDTO();

		System.out.println(year+"-"+month+"-"+date);	
		
		  Calendar cal = Calendar.getInstance();
		  
		  cal.set(year,month,date);
		  
		  SimpleDateFormat msdf = new SimpleDateFormat("yy/MM/dd");
		  
		  String dayday = msdf.format(cal.getTime());
		  
		  System.out.println("dayday>>"+dayday);
		  
		room_list = this.dao.cda_getRoomList(dayday);

		model.addAttribute("room_list", room_list);
		
		System.out.println("room_list>>" + room_list);

		return "cda/reserve_roomOfDayList_weekday_ajax";	

	}
	
	
	
	/*	
	 * 
  	public String getroomofday(@RequestParam("dayofcalendar") Long num, Model model) {
		List<CDA_roomDTO> room_list = new ArrayList<CDA_roomDTO>();

		CDA_roomDTO dto = new CDA_roomDTO();

	
		
 		
		room_list = this.dao.cda_getRoomList(num);

		model.addAttribute("room_list", room_list);
		System.out.println("num>>" + num);
		System.out.println("room_list>>" + room_list);

		return "cda/reserve_roomOfDayList_ajax";	

	}
	
	*/
	

	@RequestMapping("reserve_payment.do")
	// @ResponseBody
	public String payment(Model model, CDA_reserveInfoDTO reserveInfoDTO) {
		// @ModelAttribute : @RequestParam과 다르게

		List<CDA_roomDTO> roomList = new ArrayList<CDA_roomDTO>();
		//List<CDA_reserveInfoDTO> reserveList = new ArrayList<CDA_reserveInfoDTO>();

		// List<HashMap<String, Integer>> list = new
		// ArrayList<HashMap<String,Integer>>();
		for (CDA_reserveInfoDTO reservedto : reserveInfoDTO.getReserveInfoDTO()) {

			/*
			 * HashMap<String, Integer> result = new HashMap<String, Integer>();
			 * result.put("room_no",reservedto.getRoom_no());
			 * result.put("addpeople",reservedto.getAddpeople()); //
			 * result.put("addday",
			 * dto.getAddday());
			 */

			// 넘겨주는 것은 객실 리스트와 ㅈ
			// 룸번호에 해댕하는 값을 가져오기 DTO로 받아서 나중에 list에 넣는으로 하자
			

			System.out.println("list.getRoom_no()>>" + reservedto.getRoom_no());
			CDA_roomDTO roomdto = new CDA_roomDTO();
			roomdto = this.dao.cda_getreserveRoom((long) reservedto.getRoom_no());
			
			roomdto.setAddday(reservedto.getAddday());	
			roomdto.setAddpeople(reservedto.getAddpeople());
			roomdto.setAddprice(reservedto.getAddprice());
			
			roomList.add(roomdto);
			
			//reserveList.add(reservedto);

			
		}//for문 end

		
		  System.out.println("roomlist>>"+roomList);
		  //System.out.println("reserveList>>"+reserveList);		  
		 			
		 model.addAttribute("roomList",roomList);			 

		return "cda/reserve_payment";
	}

}
