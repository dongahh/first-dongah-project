<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="roomword">객실선택</div>

	<c:set var="list" value="${room_list }" />
	<c:if test="${!empty list }">
		<c:forEach var="dto" items="${list }">
		
			<c:if test="${dto.room_possible ==0 }">
				<div class="roomofdayContainer">
					<!-- 넘어갈 값 : 룸번호, 추가 인원수-->
					<div class="checkSe" >
						<%-- <input type="checkbox" name="chk_lang" value="${dto.room_no }"> --%>
						<input type="checkbox" name="chk_lang" class="chk_lang" value="${dto.room_no }" onclick="checkclick()">
						<input type="hidden" name="roomno" class="roomno" value="${dto.room_no }">								
					</div>
				
				
					<div class="roomInfoContent"> 
						<div class="roomimage">
							
							<c:if test="${dto.room_name.substring(0,2) eq'계곡'}" >
								<img class="roomListImage" src="<%=request.getContextPath() %>/resources/image/valley.jpg" >	
													
							</c:if>
							
							<c:if test="${dto.room_name.substring(0,2) eq'대형'}">
								<img class="roomListImage" src="<%=request.getContextPath() %>/resources/image/large.jpg" >	
													
							</c:if>
						</div>
						
						<div class="roomnamelayer">
							<div class="roomposs">						
									<span class="yes_word">예약가능</span>						
							</div>
							
							<div class="roomname_people">
								<div class="roomname">${dto.room_name }</div>
								<div class="peolpe">기준 ${dto.room_people }명 / 최대 ${dto.room_mpeople }명</div>												
							</div>
							<div class="price">
								<fmt:formatNumber value="${dto.room_price }"/>원
							</div>
							<span style="color:red">10%</span>
							<div>
								<fmt:formatNumber value="${dto.room_price*0.9 }"/>원
							</div>
							
						</div>
					
					</div>
					
				
					
					<div id="${dto.room_no }" class="addpeople_roomprice">
						<div class="addpeople">
							<div class="peopleLayer" >
								<label>성인</label>
								
								<c:if test="${dto.room_name.substring(0,2) eq'계곡'}" >
									<select class="people_adult" onchange="peopleChange_valley(${dto.room_no })" >
										<option value="1">1명</option>
										<option value="2" selected>2명</option>
										<option value="3">3명</option>
										<option value="4">4명</option>							
									</select>		
								</c:if>
								<c:if test="${dto.room_name.substring(0,2) eq'대형'}" >
									<select class="people_adult" onchange="peopleChange_large(${dto.room_no })">
										<option value="1">1명</option>
										<option value="2" >2명</option>
										<option value="3">3명</option>
										<option value="4" selected>4명</option>	
										<option value="5">5명</option>
										<option value="6">6명</option>						
									</select>		
								</c:if>
								
								
							</div>
							
							<div class="peopleLayer">
								<label>아동</label>
								<select class="people_young">
									<option value="0">0명</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>	
									<option value="5">5명</option>						
								</select>							
							</div>
						</div>
				
						
						<div class="roomprice">
							<div>즉시결제</div>
							<div class="eachRoomPrice">
							<fmt:formatNumber value="${dto.room_price*0.9 }"/>원
							</div>
							<div class="eachRoomPrice_hidden" style="display:none">${dto.room_price*0.9 }</div>
							<div class="hiddenPrice" style="display:none" >
								<div>추가결제</div>
								<div class="addPeoplePrice">
									0원
								</div>
								
								<div class="addPeoplePrice_hidden" style="display:none" >0</div>
							
							</div>
						</div>
					</div>
				</div>				
			</c:if>
		
			<!-- 이미 예약 완료된 객실 -->
			<c:if test="${dto.room_possible ==1 }">
							
				<div class="roomofdayContainer_no">
				<!-- 넘어갈 값 : 룸번호, 추가 인원수-->
					<div class="checkSe" >
						<%-- <input type="checkbox" name="chk_lang" value="${dto.room_no }"> --%>
						<input type="checkbox" name="chk_lang_x" class="chk_lang" disabled>													
					</div>
				
					<div class="roomInfoContent"> 
						<div class="roomimage">
						<c:if test="${dto.room_name.substring(0,2) eq'계곡'}" >
								<img class="roomListImage" src="<%=request.getContextPath() %>/resources/image/valley.jpg" >	
													
							</c:if>
							
							<c:if test="${dto.room_name.substring(0,2) eq'대형'}">
								<img class="roomListImage" src="<%=request.getContextPath() %>/resources/image/large.jpg" >	
													
							</c:if>
						</div>
						
						<div class="roomnamelayer">
							<div class="roomposs">											
									<span class="no_word">예약완료</span>							
							</div>
							
							<div class="roomname_people">
								<div class="roomname">${dto.room_name }</div>
								<div class="peolpe">기준 ${dto.room_people }명 / 최대 ${dto.room_mpeople }명</div>												
							</div>
							<div class="price">
								<fmt:formatNumber value="${dto.room_price }"/>원
							</div>
						</div>
					
					</div>
					
				
					
					<div class="addpeople_roomprice">
						<div class="addpeople">
							<div class="peopleLayer">
								<label>성인</label>
								<select class="people_adult" disabled>
									<option value="1">1명</option>
									<option value="2" selected>2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>							
								</select>
								
							</div>
							
							<div class="peopleLayer">
								<label>아동</label>
								<select class="people_young" disabled>
									<option value="0">0명</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>							
								</select>
								
							</div>
						</div>
						
						<div class="roomprice">
							<div>즉시결제</div>
							<div>${dto.room_price }</div>
						</div>
					</div>
				</div>
			</c:if>	
		</c:forEach>				
			
			
	</c:if>

	
	
	
	

	

</body>
</html>