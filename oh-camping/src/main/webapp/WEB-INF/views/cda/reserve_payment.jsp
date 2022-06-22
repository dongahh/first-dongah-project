<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	body, h1, h2, h3, h4, h5, div, dl, dt, dd, fieldset, form, label, p, th, td, input, select, textarea, button {
	margin:0; padding:0; line-height:1.5; font-size: 12px; color:#666;}
	
	/* 전체 컨테이너*/
	div.reserve_paymentMainContainer{font-family:Noto sans kr; word-break:break-all; margin:0px auto; margin-top:50px; padding-bottom:30px; padding: 57px 0px 0px; width:1024px; }
	
	div{display:block;}
	
	/* 객실 선택정보 */
	div.payment_roomInfo{width:100%; left: 50%; } 
	div.payment_roomInfo>table{position:relative; width:100%; border-spacing:0; margin-bottom: 30px;}	
	div.payment_roomInfo>table tr{display:table-row}
	div.payment_roomInfo>table tr th{
		border-bottom: 1px solid #A8A8A8; padding: 16px 0px 15px 20px; text-align: left; color: #666; font-weight: 700; vertical-align: middle;}
	div.payment_roomInfo>table tr td{
		border-bottom: 1px solid #A8A8A8; padding: 16px 0px 0px 14px; text-align: left; position: relative; font-size: 12px; vertical-align: middle; letter-spacing: 0px;}
	div.roomimage{display: inline-block; vertical-align: middle;}
	.roomListImage{width:142px; height: 99px; position: relative; display: inline-block; margin-right: 10px;}
	.roomInfo{display:inline-block; vertical-align: middle;}
	div.table2>table{position:relative; width:100%; border-spacing:0; line-height: 1;}
	div.table2>table tr th{border-bottom: 0px solid #A8A8A8; padding: 0px 0px 10px 0px; mar line-height: 1; }
	div.table2>table tr td{border-bottom: 0px solid #A8A8A8; padding: 0px 0px 10px 14px; line-height: 1;}
	
	
	/* 결제 금액 정보 */
	div.payforpriceContainer{width:100%; left:50%;}
	div.payforpriceContainer>div.payforpriceConent{width:100%; padding:16px 0; text-align: left; border-bottom: 1px solid #A8A8A8; margin:0px auto; position: relative; }
	div.payforpriceConent>div.priceText{font-size: 12px; color:#333; width:35%; display:inline-block; position:relative; padding-left: 10px;}
	div.payforpriceConent>div.totalPrice{font-size: 12px; color:#333; text-align:right; width:35%; display:inline-block; position:relative; padding-left: 20px; float:right;}
	
	
	/* 예약자 정보 */
	div.people_payContainer{width:100%; left: 50%; margin:0px auto; margin-top:50px; min-height: 750px;  }
	div.people_payContainer>div.peopleInfoContainer{width:49%; position:relative; display: inline-block; text-align: left; float:left; }
	
	
	div.peopleInfoContainer>table{width: 100%; line-height: 2.5; border-spacing: 0px;}
	
	div.peopleInfoContainer>table tr th{text-align: left; line-height: 3.5; font-size:12px;  }
	div.peopleInfoContainer>table tr th{line-height: 3.5;}
	div.peopleInfoContainer>table tr td>input[type=text]{width:100%; line-height: 1.8; font-size: 12px; border:1px solid #A8A8A8;}
	div.peopleInfoContainer>table tr td>div.phoneText{font-size: 7px; color:#666}
	div.peopleInfoContainer>table tr td>textarea{width:100%;  border:1px solid #A8A8A8;}
	
	div.word{border-bottom: 1px solid #404040; color:#404040; font-size: 16px; font-weight: 700; padding:10px 10px 10px 5px; position:relative;}
	div.word>div.checktext{font-size: 12px; color:#666; font-weight: 100; text-align: right; display:inline-block; float: right; margin: 4px 17px 0 0;}
	
	
	/* 결제수단 선택 */
	div.paymentInforContainer{width:49%; position:relative; display: inline-block; text-align: left; float: right;}
	div.paymentInforContainer>div.paymothodContainer{width:100%; position:relative;}
	div.paymothodContainer>div.payinfoTable>table{width:100%; padding:0;}
	
	div.payinfoTable>table tr td.firstChild{width:100%; padding:2%; position:relative; border-bottom: 1px dashed #A8A8A8; }
	table tr td.firstChild>div span{display: inline-block; bottom: 2;}
	div.payinfoTable>table tr td.seconChild{width:100%; padding:2%; position:relative; font-size: }
	
	div.paymentInforContainer>div.agreeContainer{whith:100%;} 
	div.agreeContainer>div.agreeHearLayer{padding:2%; width: 96%; background-color: #F4F4F4; border: 1px solid #E6E5E5; margin: 0px auto; margin-top: 10px;  position: relative; color: #666; font-weight: 700;}
	div.agreeContainer>div.agreeHearLayer>span{display:inline-block;}
	div.agreeHearLayer>div.agreeCheck{display:inline-block; text-align: right; float: right;}
	div.agreeCheck>span{color:#202020; font-size: 10px; font-weight: 2; }
	
	
	/* 환불 규정 */
	div.refundAgreeConainer{ border: 1px solid #E6E5E5; border-top: 0px; padding: 2%; margin: 0px auto; width: 96%; position: relative; max-height: 400px; overflow: auto;}
	div.refundAgreeConainer>div{font-size: 10px; line-height: 2;}
	div.refundAgreeConainer table{width:100%; position: relative; border: 1px solid #E6E5E5; text-align: center; margin: 10px auto; border-spacing:0px;}
	div.refundAgreeConainer table th{ background-color:#F4F4F4; border-collapse:separate; border-color: grey; font-size: 10px; }
	div.refundAgreeConainer table td{border: 1px solid #E6E5E5; font-size: 10px; line-height: 2;}
	
	
	/* 팝업 창 */
	
	div.popupContainer{width:450px; height: 500px; border: 1px solid black; position:fixed; top:20%; left:30%;  background: #fff;}
	div.popupContainer>div.pop_title{width:96%; font-size: 20px; font-weight: 700; margin:0px auto; border-bottom: 1px solid #E6E5E5; text-align: center; padding:19px 0px; }
	div.popupContainer>div.pop_content{width:96%; position:relative; max-height: 200px; overflow: auto; margin:2%; }
	div.popupContainer>div.pop_content>table{padding: 10px 0px; width: 90%; margin: 0% 5%; border-bottom:1px solid #E6E5E5; }
	div.popupContainer>div.pop_content>table tr th{line-height: 2; text-align: left;}
	div.popupContainer>div.pop_content>table tr td{line-height: 2; text-align: right;}
	div.popupContainer>div.pop_layer{width:91%; background-color: #E6E5E5; padding:20px; word-spacing: normal; position: relative; margin:0;}
	div.popupContainer>div.pop_cancelBtn{width:100%;}
	div.pop_cancelBtn>.popbtn{width:49.5%; height: 48px; border: none; background-color: #FF6559; COLOR: #FFF; FONT-SIZE: 16px; font-weight: 400;}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">


	
	$(document).ready(function(){
		
		
	  
		//전체 금액 가져오는 기능
		let sum = 0;
		
		$(".price_per_room").each(function(){
			
			console.log($(this).text());
			sum = parseInt(sum) + parseInt($(this).text());		
		});	
			
			console.log(sum);

	 	$(".totalPrice").empty();
	 	$(".totalPrice").append(sum); 
	 	

	 	
	 	 
	 	//전체 채크
		$("#checkAll").change(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked", true);
			}else{			
				$("input[name=chk]").prop("checked", false);
			}
		});
	 	
	 	//내용보기 클릭시
	 	//<span class="agreeDetail2">내용보기</span>
	 	
	 	$("#refundAgree").css('display','none');
	 	$("#privateAgree").css('display','none');
	 	
	 	$(".agreeDetail2").click(function(){
	 		if($(".agreeDetail2").text()=="닫기"){
	 			
	 			$("#refundAgree").css('display','none');
	 			$(".agreeDetail2").text('내용보기');
	 		}else{
	 			$("#refundAgree").css('display','block');
		 		$("#privateAgree").css('display','none');
		 		$(".agreeDetail2").text('닫기');
	 		}	 			 		
	 	});
	 	
		$(".agreeDetail3").click(function(){
	 		if($(".agreeDetail3").text()=="닫기"){
	 			
	 			$("#privateAgree").css('display','none');
	 			$(".agreeDetail3").text('내용보기');
	 		}else{
	 			$("#privateAgree").css('display','block');
		 		$("#refundAgree").css('display','none');
		 		$(".agreeDetail3").text('닫기');
	 		}	 			 		
	 	});

	});	
	
	//팝업
	function showPopup(){
		$(".popupContainer").css('display',"block");
		
	}
	
</script>
</head>
<body>

	<form action="" method="post" >
	<c:set var="roomList" value="${roomList}"/>

	
		<div class="reserve_paymentMainContainer">
			<div class="payment_roomInfo">
		
				<div class="word">선택 객실 정보</div>
				
				<table>
					<tr>
						<th>객실</th>
						<th>이용일</th>
						<th>금액</th>						
					</tr>
					<c:if test="${!empty roomList }">
					<c:forEach  var="roomlist" items="${roomList }">
						<tr>
							<td>
								<div class="roomimage">
									<c:if test="${roomlist.room_name.substring(0,2) eq'계곡'}" >
										<img class="roomListImage" src="<%=request.getContextPath() %>/resources/image/valley.jpg" >	
															
									</c:if>
									
									<c:if test="${roomlist.room_name.substring(0,2) eq'대형'}">
										<img class="roomListImage" src="<%=request.getContextPath() %>/resources/image/large.jpg" >	
															
									</c:if>
								</div>
								
								<div class="roomInfo">
									<div>${roomlist.room_resdate.substring(0,10) }</div>
									<div>${roomlist.room_name }</div>
									<div>(기준 ${roomlist.room_people }명/최대${roomlist.room_mpeople }명)</div>
									<br>
									<div>인원:&nbsp; ${roomlist.addpeople }명</div>
								</div>
							</td>
							<td>
								<div>${roomlist.room_resdate.substring(0,10)}.
									
								
								</div>
								<div>
									<span>비수기 주중</span>
								</div>
								
							</td>
							
							<td>
								<div class="table2">
									<table>
										<tr>
											<td>객실금액</td>
											<th>${roomlist.room_price }</th>										
										</tr>
										<tr>
											<td>추가금액</td>
											<th>${roomlist.addprice }</th>
										</tr>
										<tr>
											<td>결제금액</td>
											<th class="price_per_room">${roomlist.room_price+roomlist.addpeople*20000 }</th>
										</tr>
									</table>
								</div>
							
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty roomList }">
						<tr>
							<th colspan="3">
								<h2>정보가 없습니다.</h2>
							</th>
						</tr>
					</c:if>
				
				</table>	
			</div>
		
		
		<div class="payforpriceContainer">
			<div class="word">결제금액 안내</div>
			<div class="payforpriceConent">
				<div class="priceText">총 결제 금액</div>
				<div class="totalPrice"></div>
			</div>
		
		</div>
		
		<div class="people_payContainer">
			<div class="peopleInfoContainer">
			
				<div class="word">예약자 정보 입력<div class="checktext">✔표시는 필수 작성</div></div>
				
					<table>
						<colgroup>
							<col style="width:20%">
							<col style="width:5%">
							<col style="width:75%">							
						</colgroup>
						<tr>
							<th>예약자 이름</th>
							<th>✔</th>
							<td><input type="text" value="예약자의 이름을 입력해주세요"></td>
						</tr>
						<tr>
							<th>휴대전화 번호</th>
							<th>✔</th>
							<td><input type="text" value="'-'없이 입력해주세요">
							<div class="phoneText">예약 관련 연락에 이용되오니 휴대폰 번호를 정확하게 입력해 주세요.</div></td>
						</tr>
						<tr>
							<th>픽업 이용 여부</th>
							<th></th>
							<td><input style="color:red" type="text" value="예약자의 이름을 입력해주세요"></td>
						</tr>
						<tr>
							<th>도착 예정 시간</th>
							<th></th>
							<td>
								<select>
									<option value="15">15:00</option>
									<option value="16">16:00</option>
									<option value="17">17:00</option>
									<option value="18">18:00</option>
									<option value="19">19:00</option>
									<option value="20">20:00</option>
									<option value="21">21:00</option>
									<option value="22">22:00</option>
									<option value="23">23:00</option>	
								</select>
								<div class="phoneText">입실: 15:00 이후 | 퇴실 11:00 이전</div>
							</td>
						</tr>
						<tr>
							<th>출발지역</th>
							<th></th>
							<td>
								<select>
									
									<option>서울특별시</option>
									<option>경기도</option>
									<option>인천광역시</option>
									<option>부산광역시</option>
									<option>경상남도</option>
									<option>경상북도</option>
									<option>대구광역시</option>
									<option>대전광역시</option>
									<option>충청남도</option>
									<option>충청북도</option>
									<option>강원도</option>
									<option>전라남도</option>
									<option>전라북도</option>
									<option>광주광역시</option>
									<option>세종시</option>
									<option>제주도</option>
								
								</select>
								<select>
									<option>자가</option>
									<option>랜트카</option>
									<option>대중교통</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>요청사항</th>
							<th></th>
							<td><textarea cols="30" rows="20">요청사항을 입력해 주세요.</textarea></td>
						</tr>													
					</table>				
				</div>
			
				<div class="paymentInforContainer">
					<div class="paymothodContainer">
						<div class="word">결제수단 선택</div>
						<div class="payinfoTable">
							<table>
								<tr>
									<td class="firstChild">
									<div><span>●</span>&nbsp;&nbsp;무통장 입금</div>
									</td>
								</tr>
								<tr>
									<td class="seconChild">
										<div>[무통장 입금 계좌안내]</div>
										<br>
										<div>· 입금은행: 국민은행 233-02-9876543</div>
										<div>· 입금기한: (예약 후 5시간 이내)<span></span></div>
										<div>· 입금기한 내 입금확인 되지 않으면 예약이 자동 취소됩니다.</div>
										<div>· 입금확인이 되면 예약완료 문자(펜션 연락처, 예약번호 등)가 전송됩니다.</div>
										<div>· 무통장입금 시 반드시 예약자 명으로 입금하셔야 입금확인이 됩니다.</div>
									</td>
								</tr>				
							</table>
						</div>
					</div>
					<div class="agreeContainer">
						<div class="agreeHearLayer">
							<span>모든 규정 및 약관에 동의합니다.</span>
							<div class="agreeCheck">
								<label class="allCheck">전체동의
								<input type="checkbox" id="checkAll">
								</label> 
							</div>
						</div>
						
						<div class="agreeHearLayer">
							<span>(필수)예약자, 이용자는 미성년자가 아닙니다.</span>
							<div class="agreeCheck">
								<label class="Check1">확인
								<input type="checkbox" name="chk">
								</label> 
							</div>
						</div>
						
						<div class="agreeHearLayer">
							<span>(필수)환불 규정 및 이용 안내 동의</span>
							
							<div class="agreeCheck">
								<span class="agreeDetail2">내용보기</span>
								<span>&nbsp;|&nbsp;</span>
								<label class="Check2">확인
								<input type="checkbox" name="chk">
								</label> 
							</div>
						</div>
						
						<!-- 환불 규정 내용 -->
						<div class="refundAgreeConainer" id="refundAgree">
							<div>
								* 펜션의 취소수수료는 이용 일자별로 적용되어 합산됩니다.
								<br>
								(단, 옵션 상품의 경우 이용 첫째 날 기준으로 적용됩니다.)
								<br>
								* 이용 당일 예약 후 바로 취소한 경우에도 이용 당일 취소이므로 환불이 불가합니다																					
							</div>
							<div>
								<table>
									<tr>
										<th>취소일기준</th>
										<th>취소수수료</th>
									</tr>
									<tr>
										<td style="color:#FF6559">기본 취소 수수료</td>
										<td>0%</td>
									</tr>
									<tr>
										<td>이용 5일전</td>
										<td>10%</td>
									</tr>
									<tr>
										<td>이용 4일전</td>
										<td>20%</td>
									</tr>
									<tr>
										<td>이용 3일전</td>
										<td>30%</td>
									</tr>
									<tr>
										<td>이용 2일전</td>
										<td>50%</td>
									</tr>
									<tr>
										<td>이용 1일전</td>
										<td>70%</td>
									</tr>
									<tr>
										<td>이용 당일</td>
										<td style="color:#FF6559">환불불가</td>
									</tr>
									
								</table>
							</div>
							<div>
								* 환불은 결제한 금액에서 취소수수료를 제외한 금액으로 환불됩니다.
								<br>(취소수수료는 마일리지, 쿠폰, 특가 적용(할인) 전 이용금액 기준으로 책정됩니다.)
								<br>* 예약 후 펜션이나 객실 변경은 해당 예약 취소 후 다시 예약하셔야 합니다.
								<br>* 취소수수료는 결제금액이 아닌 예약금액(객실금액+옵션금액) 기준으로 책정됩니다.
								<br>* 숙박 업소는 법적으로 청소년 혼숙이 금지되어 있습니다. 또한 미성년자의 예약 및 이용은 숙소 규정에 따라 결정되며 해당 사유로 환불 받을 수 없습니다.
								<br>* <span style="color:#FF6559">최대 인원 초과로 인한 입실 거부 시 환불되지 않으니</span> 유의하시기 바랍니다.
								<br>* 최대 인원이 2명인 커플 객실은 영, 유아 동반 입실이 되지 않습니다.
								<br>* 사전 동의 없는 반려동물 입실은 불가능합니다. 반려동물 입실 가능 펜션 외에 반려동물 동반 시 입실이 거부될 수 있으며, 해당 사유로 환불 받을 수 없습니다.
								<br>* 예약 변경을 위한 취소 시에도 취소수수료가 부과되오니 양지하여 주시기 바랍니다.
								<br>* 실시간예약 특성상 <span style="color:#FF6559">1객실에 중복예약이 발생될 수 있으며, 이 경우 먼저 결제된 예약 건에 우선권</span>이 있습니다.
								<br>* 펜션별 기간이 미 확정되어 요금이 잘못 반영되었거나 요금표가 잘못 등록된 경우 예약이 완료된 경우라도 예약이 취소되며, 정상 금액으로 재 예약할 수 있습니다.
								<br>* 정상적으로 예약이 완료되면 문자(카카오톡)로 안내해 드리며, 펜션 연락처도 함께 발송됩니다.
								<br>* 휴대폰번호가 잘못 입력되어 연락이 불가할 경우 발생되는 불이익은 고객 책임이오니 예약 시 입력한 정보를 꼭 확인해주세요.
								<br>* 야놀자펜션은 통신판매중개자로 펜션은 펜션주의 책임하에 운영되고 있습니다.
								<br>* 당사는 펜션예약 대행사로서 예약상의 문제 이외의 펜션 상품 자체의 하자로 인한 문제는 펜션에 귀속됨을 알려드립니다.
															
														
							</div>
							
						</div>
						
						<div class="agreeHearLayer">
							<span>(필수)개인정보 수집 및 이용 동의</span>
							
							<div class="agreeCheck">
								<span class="agreeDetail3">내용보기</span>
								<span>&nbsp;|&nbsp;</span>
								<label class="check3">확인
								<input type="checkbox" name="chk">
								</label> 
							</div>
						</div>
						
						<!-- 개인정보 규정 내용 -->
						<div class = "refundAgreeConainer" id="privateAgree">
							<div>
								<b>가평 핀란드캠핑성펜션&글램핑(온수수영장)</b>(은)는 서비스 제공 및 예약 관리 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
							</div>
							
							<div>
								<table>
									<colgroup>
										<col width="10%">
										<col width="30%">
										<col width="30%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>분류</th>
										<th>수집·이동동의 목적</th>
										<th>항목</th>
										<th>보유·이용기간</th>
										
									</tr>
									
									<tr>
										<td>필수정보</td>
										<td>계약의 이행 및 서비스 제공, 예약 · 구매 · 상품 내역, 결제대금의 청구, 상담 · 불만 · 민원처리, 고지 · 안내사항 전달, 상품 · 서비스 이용실적 정보 통계 · 분석, 상품 · 서비스 개선 및 추천, 불법 · 부정이용방지</td>
										<td>예약 · 구매 시:
											<br>&nbsp;&nbsp;예약자 이름, 휴대폰번호, 예약내역(예약일시, 결제금액)
											<br>현금 환불 요청 시:
											<br>&nbsp;&nbsp;계좌번호 및 예금주명
										</td>
										<td>·개인정보 이용 목적 달성 시 삭제
											<br>·관계법령에 따라 보존할 필요가 있는 경우 해당 법령에서 요구하는 기한까지 보관
										</td>									
									
									</tr>
								</table>
							</div>
							
							<div>
							<b style="color:black">※ 위 개인정보 수집 · 이용에 대한 동의를 거부할 경우 서비스 이용이 제한됩니다.</b>
							</div>
						
						</div>
					</div>
					
					<div class="paybtnContainer" >
						<!-- <input type="submit" value="결제하기"> -->
						<div class="popupbtn" onclick="showPopup()">팝업열기</div>
					</div>
					
					
					
				</div>
			
		
		</div>
	</div> <!-- class:reserve_paymentContainer div end-->
	
	<!-- 팝업 -->
		<div class="popupContainer" style="display:none">
			<c:if test="${!empty roomList }">
				<div class="pop_title">
					예약확인
				</div>
				<div class="pop_content">
					<c:forEach items="${roomList }" var="poproomlist">
						<table>
							<tr>
								<th>이용일</th>
								<td>${poproomlist.getRoom_resdate().substring(0,4) }년 ${poproomlist.getRoom_resdate().substring(5,7) }월 ${poproomlist.getRoom_resdate().substring(8,10) }일 </td>					
							</tr>
							<tr>
								<th>펜션명</th>
								<td>가평 오캠핑(온수 수영장)</td>					
							</tr>
							<tr>
								<th>객실명</th>
								<td>${poproomlist.getRoom_name() }</td>					
							</tr>
							<tr>
								<th>인원</th>
								<td>${poproomlist.getAddpeople() }명</td>					
							</tr>
							
						</table>
					</c:forEach>
					
				</div>
				<div class="pop_layer">
					- 이용일이 오늘입니다. 당일예약의 경우 예약변경, 취소 및 환불이 불가합니다.
					<br><br><span style="color:red">- 취소수수료는 이용일 기준으로 적용됩니다.</span>
					<br><br>- 동일 객실이 펜션 상황에 따라 중복으로 예약될 경우 먼저 예약된 것이 우선입니다.
					
				</div>
				
				<div class="pop_cancelBtn">
					<input class="popbtn" type="button" value="취소">
					<input class="popbtn" type="submit" value="동의하고 결제 진행">
					<div>
						<!-- 사용자 정보 -->
						<input type="hidden" name="customername" value="">
						<input type="hidden" name="customerphone" value="">
						<input type="hidden" name="customerintime" value="">
						<input type="hidden" name="customerrequest" value="">
						<input type="hidden" name="customereara" value="">
						
						<!-- 객실정보:이용일, 객실명, 인원  => 이건 따로 리스트로 받아와야하나,,,,,,,,,,,,-->
						
						<!-- 결제정보 -->
						<input type="hidden" name="customertotalprice" value="">
					</div>
				</div>
				<!-- <div class="pop_payBtn"></div> -->
			
			</c:if>
		</div>
	
	</form>
	
	
		
	
	

</body>
</html>