<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">


	/* 초기 화면  */
	$(document).ready(next_calendar(2022,5));
	$(document).ready(getInfoList(2022512));
	
	
  	function next_calendar(year, month){
  		var calendar_year = year;
  		var calendar_month = month;
  		
  		//console.log('calendar_year');
  		//console.log(calendar_month);
  		
  		
  		
  		
		$.ajax({
			
			type: "post",
			url: "reserv_next_calendar.do",
			datatype : "text",
			data : {"calendar_year": calendar_year, "calendar_month":calendar_month},
			success : function(data){
				//alert('성공')
				console.log('달력 ajxa성공');
				console.log(data);
				$("#test").html(data);
				
				
				//var table = document.getElementById("dayofcalendar_dmonth");
				
				//table.innerHTML = "";
				//document.quserySelector("#dayofcalendar_dmonth").remove;									
				
				//$("#dayofcalendar_dmonth").append(data);
				
			},
			error: function(request, status, error){
				alert('통신 에러 발생');				
			}
			
		});	//ajax의 end.
		
	}  //next_calendar() end.
  	
	function getInfoList(num){
		
		var dayofcalendar = num;
		
		$.ajax({
			
			type: "post",
			url: "reserve_getInfo.do",
			dataType: "text",			
			data: {dayofcalendar:dayofcalendar},			
			success: function(data){
				
				//var table = document.getElementById("")
				
				//alert('성공');
				console.log('성공');
				console.log(data);
				
				$("#reserve_choose_room").html(data);
				
				
						
				
			},
			error : function(request, status, error){
				alert('error');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
				
			}
		}); 
	}
	
/* 	function getInfoList(num){
		
		var dayofcalendar = num;
		
		$.ajax({
			
			type: "post",
			url: "reserve_getInfo.do",
			dataType: "json",
			//contentType:"application/json",
			data: {dayofcalendar:dayofcalendar},			
			success: function(data){
				
				alert('성공');
				alert(data);
				
				var list = new Array(data.length);		
				
			},
			error : function(request, status, error){
				alert('error');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
				
			}
		});
		
	} */
	

	
	

	
	
	
	
</script>
</head>
<body>
	<div class="reserve_main">
	<h3>예약 하기 페이지</h3>
	
	<div id="test">
		<!-- 달력 들어가는 공간 -->	
	</div>
	
	<%-- <c:set var="calInfo" value="${calendarInfo }"/>
	<div class="yearAndMonth">
		<input type="button" class="move_month" value="❮❮" >
		<span>${calInfo.getYear() }</span>
		<span>${calInfo.getMonth()+1 }</span>
		<span class="move_month" onclick="next_calendar()">❯❯</span>
		
	</div>
	<br>
	
	
	<div calss="calendar_calendar">
		<table border="1" cellspacing="0" width="300">
			<tr class="calendar_th">
				<th class="sunday">일</th>
				<th class="weekday">월</th>
				<th class="weekday">화</th>
				<th class="weekday">수</th>
				<th class="weekday">목</th>
				<th class="weekday">금</th>
				<th class="saturday">토</th>
			</tr>
			
			
			<div id="dayofcalendar_dmonth">
				<!-- 날짜 입력 -->
				<tr>
					<!-- 지난달 날짜 -->
					<c:forEach begin="${calInfo.before_lastday-calInfo.dayofweek+2 }" end="${calInfo.getBefore_lastday() }" var="j">
						<td calss="calendar_lastDay">${j }</td>
					</c:forEach>
					
					<!-- 이번달 날짜 -->
					<c:forEach begin="1" end="${calInfo.getLastday() }" var="i">
						<c:if test="${i<calInfo.date }">
							<td class="calendar_lastDay">														
								${i }																	
							</td>
						</c:if>
						
						<c:if test="${i>=calInfo.date }">
							<td id="calendar_afterDay">
							
								<span onclick="getInfoList(${calInfo.year}${calInfo.month }${i })">								
										${i }
										<h4>${calInfo.year}${calInfo.month }${i }</h4>
								</span>
						</c:if>
						
						
						<c:if test="${(calInfo.dayofweek+i-1)%7==0 }" >
							</tr>
							<tr>
						</c:if>
					</c:forEach>
					
					<!-- 다음달 날짜 -->
					<c:forEach begin="1" end="${calInfo.after_dayofweek-calInfo.dayofweek+7 }" var="i">
						<td>${i }</td>
						
						<c:if test="${(calInfo.after_dayofweek+i-1)%7==0 }">
							</tr>
							<tr>
						</c:if>
					</c:forEach>
					
				</tr>
			</div>
			</table>
			</div> --%>
			
			
			<div calss="reserve_info">
				
				<h4>선택일 </h4>
				<h5>비수기, 주중 요금이 적용됩니다.</h5>
				<hr>
				<table border="0">
					<tr>
						<th>주소</th>
						<td>경기도 가평군 상면 물골길 102</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>010-1235-6586</td>
					</tr>
					<tr>
						<th>결제방법</th>
						<td>무통장 입금</td>
					</tr>
					<tr>
						<th>기간 안내</th>
						<td>비수기: 2022.06.10 ~ 2022.12.31</td>
					</tr>
				</table>
				
			</div>
			
			
			<div id ="reserve_choose_room">	
				<form action=""></form>			
				<!-- 일자별 객실 정보 -->														
			</div>
			
		
			<div>
				<table class="total_price">
					<tr>
						<th></th>
						<th>현장결제</th>
						<th>즉시결제</th>
					</tr>
					
					<tr>
						<th>객실 이용 요금</th>
						<td>-</td>
						<td>0원</td>
					</tr>
					
					<tr>
						<th>인원 추가 요금</th>
						<td>0원</td>
						<td>0원</td>
					</tr>
					
					<tr>
						<th>합계</th>
						<td>0원</td>
						<td>0원</td>
					</tr>
					
					<tr>
						<th>최종 이용금액</th>
						<td></td>
						<td>0원</td>
					</tr>															
				</table>
				
			</div>
			
			
			
			<div class="total_price_check"> 
				<table border="0" cellspacing="0">
					<tr>
						<th>총 결제금액</th>										
						<td><input class="totalPriceText" value="0">원</td>
					</tr>
					
					<tr>
						<th>입실 시 현장 결제 금액</th>										
						<td><input class="sitePriceText" value="0">원</td>
					</tr>
					
					<tr>
						<th>지금 즉시 결제 금액</th>										
						<td><input class="nowPriceText" value="0">원</td>
					</tr>										
				</table>
			</div>
						
			
			<div class="reserveBtn">
				<input type="button" value="예약하기">			
			</div>
						
			
	
	</div><!-- class="reserve_main" -->
	

</body>
</html>
