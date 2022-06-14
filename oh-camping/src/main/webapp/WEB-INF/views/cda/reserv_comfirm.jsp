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
				
				$("#reserve_choose_room").html(data);
				
				
						
				
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
			
			let container1 = checkbox.parent().parent().attr('class','roomofdaycontainer_on');			
			console.log(container1);  //여기선 each사용 x?						
	
			//체크 안된 값.
			let uncheckbox= $("input[name='chk_lang']:not(:checked)");
			console.log(uncheckbox.val());
								
			let container2 = uncheckbox.parent().parent().attr('class','roomofdaycontainer');
			console.log(container2);
				
				
			//2. 이름이 변경된 클래스 정보를 리스트에 담아줌.
			let checked_info = document.getElementsByClassName("roomofdaycontainer_on");
			
			let checked_roomno =[];
			let checked_roomday=[];
			let checked_addpeople=[];
			
			$('.roomofdaycontainer_on').each(function(){
				
				checked_roomno.push($(this).find('.roomno').val());
				//check_roomday = $(this).find('.').val();
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
			
			let container = checkbox.parent().parent().attr('class','roomofdaycontainer_on');
			//console.log(container);
			
			
		});
		
		//class가  roomofdaycontainer_on로 바뀐 것의 데이터만 가져와 form에 넣어주면 됨.
		let checked_info = document.getElementsByClassName("roomofdaycontainer_on");
		
		let checked_roomno =[];
		let checked_roomday=[];
		let checked_addpeople=[];
		
		$('.roomofdaycontainer_on').each(function(){
			
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
	
	<div id="test">
		<!-- 달력 들어가는 공간 -->	
	</div>
			
			
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
				<form method="post" id="sendList" action="<%=request.getContextPath() %>/reserve_payment.do">
					<!-- 넘어갈 정보가 저장되는 공간(list형식으로 객실번호와 성인 인원수가 넘어감) -->
					<!-- dto로 넘겨주는 것이기 때문에 name을 dto와 맞춰줘야 하는데 -->				
					
					<input type="submit" value="예약하기">						
				</form>	
			</div>
	
	</div><!-- class="reserve_main" -->
	

</body>
</html>
