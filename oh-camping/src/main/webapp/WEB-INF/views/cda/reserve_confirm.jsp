<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body, h1, h2, h3, h4, h5, div, dl, dt, dd, ul, ol, li, fieldset, form, label, p, th, td, input, select, textarea, button { margin: 0; padding: 0; line-height: 1.5; font-size: 12px;}
	div.mainContainer{width: 600px; margin: 0px auto; position: relative; margin-top: 50px; padding-bottom: 30px; font-family: Noto sans kr;}
	div.mainContainer>div.infoContainer{border: 1px solid #D9D9D9; width: 100%;}
	div.topcontainer{padding: 3%; }
	div.orderdate{color: #333; font-size: 12px; text-align: left;}
	div.topcontent{padding: 30px 0px; text-align: center; padding-top: 40px;}
	div.payconfirmtext{font-size: 18px; color: #FF6559; margin: 20px auto; font-weight: 700;}
	div.campingName{margin: 10px auto; font-size: 16px; font-weight: 400; color: #333; margin-bottom: 5px;}
	
	div.reservenotext{color: #333; font-weight: 700; font-size: 12px; text-align: center;}
	div.reservenotext>span{color: #888; font-weight: 400; font-size: 12px; margin-right: 30px;}
	hr.dachedborder{border-style: dashed; border-color: #D9D9D9; width: 94%; }
	
	/* 예약자 정보 */
	div.bookerInfoCotainer,div.roomInfoContainer, div.payInfoContainer { padding: 3%; width: 94%; position: relative; margin: 30px auto;}
	div.containerword{font-size: 14px; color: #333; text-align: left; border-bottom: 1px solid #333; padding: 10px 0px; font-weight: 700;}
	table{position:relative; width:100%; border-spacing:0; margin-bottom: 30px;}	
	table tr{display:table-row}
	table tr th{
		 padding: 16px 0px 15px 20px; text-align: left; color: #666; font-weight: 700; vertical-align: middle;}
	table tr td{
		 padding: 16px 15px 0px 14px; text-align: right; position: relative; font-size: 12px; vertical-align: middle; letter-spacing: 0px;}
	
	/* 객실정보 */
	div.roomInfoContainer table.table1{border-bottom: 1px solid #D9D9D9;}

	/* 버튼 */
	div.btnContainer{margin: 30px auto; text-align: center; position: relative;}
	div.gohome{color: #FFF; padding: 12px 0px; width: 35%; cursor: pointer; font-size: 16px; font-weight: 700; text-align: center; background-color: #FF6559; display: inline-block; margin: 10px;}
	div.cancel{background-color: #AAA; color: #FFF; padding: 12px 0px; width: 35%; cursor: pointer; font-size: 16px; font-weight: 700; text-align: center; display: inline-block; margin: 10px;}
	
	/* popup창 */
	div.popupContainer{position: fixed; top: 40%; left: 50%; width: 450px; margin-left: -225px; z-index: 22; background-color: #FFF; display: none; word-break: break-all;}
	div.canceltext{font-size: 16px; text-align: center; padding: 19px 0px; position: relative; color: #333; background-color: #FFF; border-bottom: 1px solid #E6E5E5; font-weight: 700; margin: 0px auto; width: 96%;}
	div.replaytext{font-size: 14px; color: #333; padding: 40px 2%; width: 96%; text-align: center; background-color: #FFF}
	div.pop_button{width:100%}
	div.pop_button>.popbtn{width:49.5%; height: 48px; border: none; background-color: #FF6559; COLOR: #FFF; FONT-SIZE: 16px; font-weight: 400;}
	
	/* 쉐도우 효과 */
	.shadow{position: fixed;left: 0;top: 0;background: rgba(0, 0, 0, 0.52);width: 100%;height: 100vh;display: none}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$(".popupContainer").hide();
		$(".shadow").hide();
		
	});
	
	//팝업 열기
	function openPopup(){
		$(".shadow").show();
		$(".popupContainer").show();
	
	}
	
	//팝업 닫기
	function closePopup(){
		$(".popupContainer").hide();
		$(".shadow").hide();
		
		
	}
	
 	//예약 취소.
	function reservecancel(num1){
		let paymentno = num1;
		
		$.ajax({
			
			type:"post",
			url:"reserve_cancel.do",
			datatype:"text",
			data:{"paymentno":paymentno},
			success:function(data){
				alert('예약이 취소되었습니다.');
				
				//메인 페이지로 이동.
				let url1="<%=request.getContextPath()%>/dong.do";
				location.replace(url1);
				
				
			},
			error : function(request, status, error){
				alert('error......');	
				
				//console.log(data);
			}
			
			
			
		});	//ajax의 end.
		
		
		// ajax로 리트스 넘겨주기ㅣㅣㅣ...... 
	} 
</script>


</head>
<body>
	<c:set var="paymentDTO" value="${paymentDTO }"/>
	<c:set var="detailList" value="${detailList }"/>
	
	<div class="mainContainer">
	<div class="infoContainer">
		
		
		<div class="topcontainer">
			<%-- <div class="orderdate">예약일시 &nbsp;&nbsp;&nbsp; <span>${paymentDTO.getPayment_orderdate().substring(0,10) }</span></div>--%>			<div class="topcontent">
				<div class="payconfirmtext">결제 완료</div>
				<div class="campingName">가평 오캠핑(온수 수영장)</div>
				<div class="reservenotext"><span>예약번호 </span>&nbsp;&nbsp;${paymentDTO.payment_no }</div>
			</div>
		</div>
		<hr class="dachedborder">
		
		
		<div class="bookerInfoCotainer">
			<div class="containerword">예약자 정보</div>
			<div>
				<table>
					<tr>
						<th>예약자 이름</th>
						<td>${paymentDTO.payment_pname }</td>
					</tr>
					
					<tr>
						<th>휴대폰 번호</th>
						<td>${paymentDTO.payment_pphone }</td>
					</tr>
					
					<tr>
						<th>픽업신청여부</th>
						<td>신청안함</td>
					</tr>
					
					<tr>
						<th>입실예정 시간</th>
						<td>${paymentDTO.arrive_time }:00</td>
					</tr>
					
					<tr>
						<th>출발지역</th>
						<td>${paymentDTO.arrive_eara }&nbsp;/&nbsp;${paymentDTO.arrive_getin }</td>
					</tr>
					
					<tr>
						<th>요청사항</th>
						<td>${paymentDTO.paymeny_request }</td>
					</tr>
					
				</table>
			</div>
		</div>
		
		
		<div class="roomInfoContainer">
			<div class="containerword">이용정보</div>
			<div>
				<c:if test="${!empty detailList}">
					
					<c:forEach items="${detailList }" var="list">
					<table class="table1">
						<tr>
							<th> 이용일</th>
							<td>${list.getPaymentDetail_resdate().substring(0,4) }년&nbsp;
								${list.getPaymentDetail_resdate().substring(5,7) }월&nbsp;
								${list.getPaymentDetail_resdate().substring(8,10) }일
							</td>
						</tr>
						<tr>
							<th>객실명</th>
							<td>${list.getPaymentDetail_roomname() }</td>
						</tr>
						<tr>
							<th>인원</th>
							<td>${list.getPaymentDetail_people() }명</td>
						</tr>
					</table>
					</c:forEach>
					
				
				</c:if>
			</div>
			
		</div>
		
		<div class="payInfoContainer">
			<div class="containerword">결제정보</div>
			<div>
				<table>
					<tr>
						<th>결제(입금금액)</th>
						<td>
							<fmt:formatNumber value="${paymentDTO.payment_price }"/>원
						</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td>무통장입금</td>					
					</tr>
					<tr>
						<th>예약 상태</th>
						<td>예약 완료</td>
						
					</tr>
				</table>
			</div>
		</div>
		
		<div class="btnContainer">
			<div class="gohome" onclick="location.href='<%=request.getContextPath()%>/dong.do'">홈으로</div>
			<div class="cancel" onclick="openPopup()">예약 취소하기</div>
		</div>
	</div>
	</div>
	
	
	<!--  예약 취소 팝업창 -->
	<div class="shadow" ></div>
	<div class="popupContainer">
		<div class="canceltext">예약 취소</div>
		<div class="replaytext"> 예약을 취소하시겠습니까?</div>
		<div class="pop_button">
			<input class="popbtn" type="button" value="닫기" onclick="closePopup()">
			<input class="popbtn" type="button" value="예약 취소" onclick="reservecancel(${paymentDTO.payment_no})">
		</div>
	
	</div>
</body>
</html>