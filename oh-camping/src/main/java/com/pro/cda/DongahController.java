package com.pro.cda;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pro.cda.CalendarDTO;

@Controller
@SessionAttributes
public class DongahController {

	@Autowired
	CDA_campingDAO dao;
	
	
	//세션 로그인 test
	@RequestMapping("login_test.do")
	public String logintest(HttpServletRequest request) {
		String test_id = (String) request.getParameter("mem_id");
		
		HttpSession session = request.getSession();
		session.setAttribute("testId",test_id );
		
		System.out.println("id>>" + test_id);
		
		return "cda/dongad_1";
		
	}

	@RequestMapping("dong.do")
	public String test() {
		System.out.println("test로 이동");
		return "cda/login_test";
	}

	@RequestMapping("reserve_reserve.do")
	public String reserve_confirm(Model model, CalendarDTO dateDTO) {

		// 날짜 관련 정보 넘겨주기

		Calendar cal = Calendar.getInstance();

		CalendarDTO calendarData = new CalendarDTO(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH),
				cal.get(Calendar.DATE));

		model.addAttribute("calendarInfo", calendarData);
		
		
		//

		return "cda/reserv_reserve";
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
	//주말 : 10% 할인
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
	
	//주중list(30%할인 적용)
	@RequestMapping("reserve_getInfo_weekday.do")
	public String getroomWeekday(@RequestParam("calYear") int year,@RequestParam("calMonth") int month,@RequestParam("calDate") int date, Model model) {
		List<CDA_roomDTO> room_list = new ArrayList<CDA_roomDTO>();

		CDA_roomDTO dto = new CDA_roomDTO();

		System.out.println(year+"-"+month+"-"+date);	
		
		  Calendar cal = Calendar.getInstance();
		  
		  cal.set(year,month,date);
		  
		  SimpleDateFormat msdf = new SimpleDateFormat("yy/MM/dd");
		  
		  String dayday = msdf.format(cal.getTime());
		  
		  //System.out.println("dayday>>"+dayday);
		  
		room_list = this.dao.cda_getRoomList(dayday);

		model.addAttribute("room_list", room_list);
		
		//System.out.println("room_list>>" + room_list);

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
	public String payment(Model model, CDA_reserveInfoDTO reserveInfoDTO, HttpServletRequest request) {
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
			roomdto.setRoom_price(reservedto.getDiscountprice());
			
			roomList.add(roomdto);
			
			//reserveList.add(reservedto);

			
		}//for문 end

		
		//////////////////////////////////////////////////////////
		//session으로 id 가져오기
		HttpSession session = request.getSession();
		
		
		String testId = (String) session.getAttribute("testId");
		System.out.println("testid>>" + testId);
		
		//session으로 가져오 id로 회원 이름 전화번호 찾기
		testidDTO testiddto = new testidDTO();
		testiddto = this.dao.gettestid(testId);	
		
		model.addAttribute("testiddto", testiddto);
		
		System.out.println("testiddot>>" +testiddto);
		/////////////////////////////////////////////////

		
		  System.out.println("roomlist>>"+roomList);
		  //System.out.println("reserveList>>"+reserveList);		  
		 			
		 model.addAttribute("roomList",roomList);			 

		return "cda/reserve_payment";
	}
	
	//결제 완료 페이지
	@RequestMapping("reserve_confirm.do")
	public String reserve_confirm(Model model, HttpServletRequest request, HttpServletResponse response,
			CDA_paymentdetailDTO paymentdetailDTO, CDA_paymentDTO paymentDTO) throws IOException {
		//결제	
		
		HttpSession session = request.getSession();	
		String testId = (String) session.getAttribute("testId");		

		paymentDTO.setPayment_memno(this.dao.cda_getmemmo(testId));
		
		this.dao.cda_paymentConfirm(paymentDTO);
		
		
		
		
		//결제 디테일
		List<CDA_paymentdetailDTO> detailDTOList = new ArrayList<CDA_paymentdetailDTO>();		
		for(CDA_paymentdetailDTO paymentdetilDTO: paymentdetailDTO.getPaymentdetailDTO()) {
			
			//payment_no가져오기(마지막꺼)
			int payment_no = this.dao.cda_getpatmentno();
			
			
			paymentdetilDTO.setPaymentDetail_paymentno(payment_no);
			this.dao.cda_reserveComfirmdetail(paymentdetilDTO);
			detailDTOList.add(paymentdetilDTO);
			
			System.out.println("paymentdetail>>"+paymentdetilDTO );
		}
		
		//System.out.println("paymentList>>"+detailDTOList );
		
		model.addAttribute("paymentDTO",paymentDTO );
		model.addAttribute("detailList",detailDTOList );
		

		return "cda/reserve_confirm";
		
	}
	
	
	
	
	//location 위치 정보
	@RequestMapping("camping_location.do")
	public String campingLocation() {
		return "cda/camping_location";
	}
	
	
	

}
