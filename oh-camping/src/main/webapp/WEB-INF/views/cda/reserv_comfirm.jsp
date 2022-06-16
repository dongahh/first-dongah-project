<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	body{margin:0px auto; padding:0px;  font-weight:400; -webkit-overflow-scrolling:touch; }
	body span, h1, h2, h3, h4, h5, tr, td, th, form, p, label, p, input, select,option, button, div{margin:0; padding:0;line-height:1.5; font-size: 12px; font-family: Noto sans kr; }
	
	
	/* 전체 컨테이너*/
	div.reserve_main{font-family:Noto sans kr; word-break:break-all; margin:0px auto; margin-top:50px; padding-bottom:30px; padding: 57px 0px 0px; width:1024px; }
	
	div{display:block;}
	
	/* claendar 부분 + 설명 */
	div.container_calendar_info{width:90%; text-align:center;  }
	
	/* calendar 부분*/
	div#reserve_calendar{
		width:45%; position:relative; text-align:center; display:inline-block; }
	div.yearAndMonth>span { font-size:18px; weight: bold; margin:2px; }
	div.yearAndMonth>span.move_month{border:1px solid #8F8F90; padding:0 4px 1px 4px; margin: 0 3px; color:#8F8F90;}
	div.calendar_calendar{display:inline-block; width:100%}
	div.calendar_calendar>table{border:1px solid #8F8F90; width:100%; border-spacing:0; }
	div.calendar_calendar>table tr th{line-height: 3; background-color:#E4E4E4; font-size: 10; }
	div.calendar_calendar>table tr th.sunday{color:red;}
	div.calendar_calendar>table tr th.saturday{color:blue;}	
	div.calendar_calendar>table tr td{line-height: 2.2; }
	
	
	
	
		
	/*기본 예약 정보 부분*/
	div.reserve_info{
		width:52%; position:relative; text-align:center; display:inline-block;}
	div.reserve_info>h5.info_today{font-size: 7px; color:#8F8F90; padding-bottom: 10px; }
	div.reserve_info>div.reserve_info_content{border:1px solid #8F8F90; width:350px; margin-left:10px; display: inline-block; width:100%;}
	div.reserve_info_content>h4{line-height: 2.5; padding 2px;}
	div.reserve_info_content>table{display:inline-block; border-spacing:0;}
	div.reserve_info_content>table tr th{text-align: left; padding-right: 20px; line-height: 2.5; }
	
	
	/* 날짜별 객실 리스트 */
	div#roomofdaylist_main{width:100%; position:relative; margin-top: 30px; margin-left: 20px;}
	div.roomword{font-weight: bold; text-align: left; padding-bottom: 20px;}
	div.roomofdayContainer, div.roomofdayContainer_on, div.roomofdayContainer_no{width:86%; border-bottom: 1px solid #8F8F90; display: table; padding:2px; }
	div.roomofdayContainer>div{display: inline-table; }
	div.roomofdayContainer_no>div{display: inline-table; }
	div.roomofdayContainer_on>div{display: inline-table; }
	div.checkSe{display: table-cell; width: 4%;}
	div.checkSe>input.chk_lang{width:15px; height: 15px;  position:relative; top:28px;}
	
	div.roomInfoContent{display: table-cell; width:40%;}
	div.roomposs>span.yes_word{pdding 2px 3px; height: 14px; font-size: 11px; background-color: #8FC31F; color: #FFF; display: inline-block;}
	div.roomposs>span.no_word{pdding 2px 3px; height: 14px; font-size: 11px; background-color: #FF6559; color: #FFF; display: inline-block;}
	
	
	
	div.addpeople_roomprice{display: table-cell; width:45%; }
	div.addpeople_roomprice>div.addpeople{display:table-cell; width:70%; position:relative; top:28px;}
	div.addpeople>div{display: inline-block; padding:20px;}
	div.addpeople label {display: block;}
	div.addpeople_roomprice>div.roomprice{display:table-cell; width:30%; position:relative; top:28px;}
	
	
	/* 결제 금액 확인 */
	div.total_priceInfo{width:90%; text-align:center; position: relative; margin-top: 50px;}
	div.total_priceInfo>div{display: inline-block;}
	div.total_priceInfo>div.total_price{width:45%;}
	div.total_price>table{border:2px solid #8F8F90; width:100%; border-spacing:2px;}
	div.total_price>table tr th,td{line-height: 3;}
	div.total_price>table td{font-size: 13px; font-weight: bold;}
	
	div.total_price_check{position:relative; top:-50px; right:-80px; text-align: right;}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		//넘어온값 넣고 넘어온 값이 없으면 오늘 날짜 입력 되도록.
		next_calendar(2022,5);
		getInfoList(2022512);
		
	});

													
	
	/* calendar가져오는 메서드 */
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
				$("#reserve_calendar").html(data);
				
			},
			error: function(request, status, error){
				alert('통신 에러 발생');				
			}
			
		});	//ajax의 end.
		
		
	}  //next_calendar() end.
  	
	
	
	/* 클릭한 날짜에 해당하는 예약정보 리스트 출력 */
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
				
				$("#roomofdaylist_main").html(data);
				
				
						
				
			},
			error : function(request, status, error){
				alert('error');
				
				
			}
		}); 
	}//getInfoList(num) end
	

	
	
	
	/* 체크박스 버튼 클릭시	 */
	function checkclick(){
			 
		 	//1. check버튼 클릭시 class 이름 변경
		 	//체크된 값.
			let checkbox = $("input[name=chk_lang]:checked");
			console.log(checkbox.val());
			
			let container1 = checkbox.parent().parent().attr('class','roomofdayContainer_on');			
			console.log(container1);  //여기선 each사용 x?						
	
			//체크 안된 값.
			let uncheckbox= $("input[name='chk_lang']:not(:checked)");
			console.log(uncheckbox.val());
								
			let container2 = uncheckbox.parent().parent().attr('class','roomofdayContainer');
			console.log(container2);
				
				
			//2. 이름이 변경된 클래스 정보를 리스트에 담아줌.
			let checked_info = document.getElementsByClassName("roomofdayContainer_on");
			
			let checked_roomno =[];
			let checked_roomday=[];
			let checked_addpeople=[];
			
			$('.roomofdayContainer_on').each(function(){
				
				checked_roomno.push($(this).find('.roomno').val());
				let check_roomda = $(this).find('.roomno').val();
				console.log(check_roomda); 
				checked_addpeople.push($(this).find('.people_adult').val());
			});		
		
	 		console.log(checked_roomno);
			console.log(checked_addpeople); 
			
			//3. 리스트를 form에 전달해줌. 클릭할떄마다 갱신.
			$('input.listattri').remove();
			for(let i=0; i<checked_roomno.length; i++){
				$('#sendList').prepend("<input type='hidden' class='listattri' name='reserveInfoDTO["+i+"].room_no' value='"+checked_roomno[i]+"'>");
				$('#sendList').prepend("<input type='hidden' class='listattri' name='reserveInfoDTO["+i+"].addpeople' value='"+checked_addpeople[i]+"'>'");
				
			}
	
			
			//4. ajax로 값을 전달해서 하단에 금액이 뜨도록 설정하기.
			
		} 
	
	
	function changenameofclass(){
		 
		let checkbox = $("input[name=chk_lang]:checked");
		
		checkbox.each(function(){
			
			let container = checkbox.parent().parent().attr('class','roomofdayContainer');
			//console.log(container);
			
			
		});
		
		//class가  roomofdaycontainer_on로 바뀐 것의 데이터만 가져와 form에 넣어주면 됨.
		let checked_info = document.getElementsByClassName("roomofdayContainer_on");
		
		let checked_roomno =[];
		let checked_roomday=[];
		let checked_addpeople=[];
		
		$('.roomofdayContainer_on').each(function(){
			
			checked_roomno.push($(this).find('.roomno').val());
			//check_roomday = $(this).find('.').val();
			checked_addpeople.push($(this).find('.people_adult').val());
		});
		
 		console.log(checked_roomno);
		console.log(checked_addpeople);
		
		//
	
		
	}  

	
</script>


</head>
<body>
	<div class="reserve_main">
	<h3>예약 하기 페이지</h3>
	
	<div class="container_calendar_info"><!-- 달력하고 기본정보 -->
		<div id="reserve_calendar">
			<!-- 달력 들어가는 공간 -->	
		</div>
				
		<c:set var="today" value="${calendarInfo }"/>	
		<div class="reserve_info">	
			<h5 class="info_today"> 오늘 날짜 : ${today.year }년 ${today.month }월 ${today.date }일</h5>		
			
			<div class="reserve_info_content">
				<h4><b>선택일</b></h4>
				<h4><b>비수기, 주중</b> 요금이 적용됩니다.</h4>
				<hr>
				<table>
					<tr>
						<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
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
						<th>기간안내</th>
						<td>비수기: 2022.06.10 ~ 2022.12.31</td>
					</tr>
				</table>	
			</div>
		</div>
	</div>
			
			
			<div id ="roomofdaylist_main">							
				<!-- 일자별 객실 정보 -->														
			</div>
			
			<div class="total_priceInfo">
				<div class="total_price">
					<table>
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
					<table>
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
					
					<div class="reserveBtn">													
						<form method="post" id="sendList" action="<%=request.getContextPath() %>/reserve_payment.do">
							<!-- 넘어갈 정보가 저장되는 공간(list형식으로 객실번호와 성인 인원수가 넘어감) -->
							<!-- dto로 넘겨주는 것이기 때문에 name을 dto와 맞춰줘야 하는데 -->				
							
							<input type="submit" value="예약하기">						
						</form>	
					</div>
				</div>
			</div>
						
			
			
	
	</div><!-- class="reserve_main" -->
	

</body>
</html>
