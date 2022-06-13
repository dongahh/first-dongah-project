package com.pro.cda;

import java.text.SimpleDateFormat;
import java.util.Calendar;


import lombok.Data;

@Data
public class CalendarDTO {
	
	private int year;	//검색 연도
	private int month;	//검색 월
	private int date;	//검색 일

	private int dayofweek;
	private int lastday;
	
	private int before_lastday;	//전달의 마지막 날
	private int after_dayofweek;	//다음달의 시작요일
	
	
	

	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	public int getDate() {
		return date;
	}


	public void setDate(int date) {
		this.date = date;
	}


	public int getDayofweek() {
		return dayofweek;
	}


	public void setDayofweek(int dayofweek) {
		this.dayofweek = dayofweek;
	}


	public int getLastday() {
		return lastday;
	}


	public void setLastday(int lastday) {
		this.lastday = lastday;
	}


	public int getBefore_lastday() {
		return before_lastday;
	}


	public void setBefore_lastday(int before_lastday) {
		this.before_lastday = before_lastday;
	}


	public int getAfter_dayofweek() {
		return after_dayofweek;
	}


	public void setAfter_dayofweek(int after_dayofweek) {
		this.after_dayofweek = after_dayofweek;
	}


	public CalendarDTO() {	} //기본 생성자
	
	
	public CalendarDTO(int year, int month, int date) {
		
			this.year = year;
			this.month = month;
			this.date = date;
			
			Calendar cal = Calendar.getInstance();
			
			//시작일의 요일을 받아오기 위해 date에 1을 입력.
			cal.set(year, month, 1);
			this.dayofweek = cal.get(Calendar.DAY_OF_WEEK);	//일:1, 토:7
			this.lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 월의 마지막 일
		
			
			//SimpleDateFormat msdf = new SimpleDateFormat("MM");
			//SimpleDateFormat dsdf = new SimpleDateFormat("dd");
			
			
			//이전 달
			if(month-1<0) {
				cal.set(year-1, 11, 1);				
			}else {
				cal.set(year, month-1, 1);				
			}
			this.before_lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
					
			
			//다음달
			if(month+1==12) {
				cal.set(year+1, 0, 1);				
			}else {
				cal.set(year, month+1, 1);
			}
			this.after_dayofweek = cal.get(Calendar.DAY_OF_WEEK);
			
			
		System.out.println(this.dayofweek +"/"+this.lastday);
		System.out.println(this.year +"/"+this.month+"/"+ this.date);
		System.out.println(this.after_dayofweek+"/"+this.before_lastday);
	}

	
	
}
