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
		next_calendar(2022,5);
		getInfoList(2022512);
		
			
			
		
		
		/* $('.chk_lang').onclick(function(){
			//$("input:checkbox[name='chk_lang']").change(function(){
				
				//if($(this).is(':checked')){
					
					alert('클릭');
				
					//$(this).parent().parent().attr('class','roomofdaycontainer_on');
					//console.log($(this).parent().parent());
				
				//}
				
				//checkbox.parent().parent().attr('class','roomofdaycontainer_on');
				
				
				
		});	 */
		
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
				
				
			}
		});
		
	} */
	
	/* 체크 된 값 넘겨주기 */
	// 결제 페이지로 넘어갈 것 : room_no, addpeople, --> 리스트로 넘겨줘야 하나?
	
	/* //채크된 값 클래스 이름 변경
	$(".checkSe").attr('class','checkSe_on'); */
	
	
	//체크 내용 저장
/* 	function doSave(){
		let chk_langs = document.getElementsByName("chk_lang");
		let checked_langs_items =[];
		
		
		
		for(let i=0; i<chk_langs.length; i++){
			if(chk_langs[i].checked){
				checked_langs_items.push(chk_langs[i].value);
				
				
				
			}
		}
		console.log(checked_langs_items);
	} */
	
	
	
	//checkbox 바꾸면 발생하는 이벤트		
	function checkclick(){
		//var rowData = new array();
		//var rdArr = new Array();
		
		
		
		
		 //if($("input[name=chk_lang]").is(":checked")){
			 
		 	
			var checkbox = $("input[name=chk_lang]:checked");
			console.log(checkbox.val());
			
			var container = checkbox.parent().parent().attr('class','roomofdaycontainer_on');
			
			console.log(container); 
			/* checkbox.each(function(){
				
				var container = checkbox.parent().parent().attr('class','roomofdaycontainer_on');
				console.log(container); 
				
				
			});*/
		//}else{
			
			
			var uncheckbox= $("input[name='chk_lang']:not(:checked)");
			console.log(uncheckbox.val());
				
				
				var container = uncheckbox.parent().parent().attr('class','roomofdaycontainer');
				console.log(container);
				
				
			
		//}
			
		/* 	//class가  roomofdaycontainer_on로 바뀐 것의 데이터만 가져와 form에 넣어주면 됨.
			let checked_info = document.getElementsByClassName("roomofdaycontainer_on");
			
			let checked_roomno =[];
			let checked_roomday=[];
			let checked_addpeople=[];
			
			$('.roomofdaycontainer_on').each(function(){
				
				checked_roomno.push($(this).find('.roomno').val());
				//check_roomday = $(this).find('.').val();
				checked_addpeople.push($(this).find('.people_adult').val());
			}); */
			
				 /* for(let i=0; i<checked_info.length; i++){
				console.log(checked_info[i]);
				console.log(checked_info[i].children);
				console.log(checked_info[i].children[0].children[1].value);
				console.log(checked_info[i].children[0].children[2].value); */
				
				//checked_roomno.push(checked_info[i].children('.roomno').value);
				//checked_addpeople.push(checked_info[i].children('.people_adult').value);						
				//}
		/* 	
		
	 		console.log(checked_roomno);
			console.log(checked_addpeople); */
			
			//list를 form에 넣어줌.
		} 
	
	
		
	
	
	 //2.
	function changenameofclass(){
		
		//var rowData = new array();
		//var rdArr = new Array();
		var checkbox = $("input[name=chk_lang]:checked");
		
		checkbox.each(function(){
			
			var container = checkbox.parent().parent().attr('class','roomofdaycontainer_on');
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
		
			 /* for(let i=0; i<checked_info.length; i++){
			console.log(checked_info[i]);
			console.log(checked_info[i].children);
			console.log(checked_info[i].children[0].children[1].value);
			console.log(checked_info[i].children[0].children[2].value); */
			
			//checked_roomno.push(checked_info[i].children('.roomno').value);
			//checked_addpeople.push(checked_info[i].children('.people_adult').value);						
			//}
		
	
 		console.log(checked_roomno);
		console.log(checked_addpeople);
		
		//list를 form에 넣어줌.
		
		
		
		
		
		//1. 
		//document.getElementById('sendList').innerHTML=checked_roomno;
		//document.getElementById('sendList').innerHTML=checked_addpeople;
		
		//2. 
		
	
		
	}  
	
	
	
	
	
	//다시 : 
	//채크되면 form으로  데이터가 넘어가고 
	//예약 버튼을 누르면 데이터가 이동이 됨.
	
	
	
	
	

	
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
						
			
			<!-- <div class="reserveBtn">
				<input type="button" value="예약하기" onclick="changenameofclass()">	
						
			</div>
					 -->
			<form method="post" id="sendList" action="reserve_payment.do">
				<!-- 넘어갈 정보가 저장되는 공간. -->
				<!-- dto로 넘겨주는 것이기 때문에 name을 dto와 맞춰줘야 하는데 
				 -->
				 <input type="hidden" name="dto[].roomno" value="">
				
				
				<input type="submit" value="예약하기">						
			</form>	
			
	
	</div><!-- class="reserve_main" -->
	

</body>
</html>
