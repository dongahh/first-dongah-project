<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="roomofdaylist_main">

	<c:set var="list" value="${room_list }" />
	<c:if test="${!empty list }">
		<c:forEach var="dto" items="${list }">
			
		<div class="roomofdayContainer">
		
			<div class="checkSe">
				<input type="checkbox">
				<input type="hidden">
				
			</div>
			
			<div class="roomInfoContent"> 
				<div class="roomimage">
				</div>
				
				<div class="roomnamelayer">
					<div class="roomposs">
						<c:if test="${dto.room_possible ==1 }">
							<span>예약완료</span>
						</c:if>
						<c:if test="${dto.room_possible ==0 }">
							<span>예약가능</span>
						</c:if>		
					</div>
					
					<div class="roomname_people">
						<div class="roomname">${dto.room_name }</div>
						<div class="peolpe">기준 ${dto.room_people }명 / 최대 ${dto.room_mpeople }명</div>												
					</div>
				</div>
			
			</div>
			
			<div class="addpeople_roomprice">
				<div>즉시결제</div>
				<div>${dto.room_price }</div>
				
				
			</div>
		</div>
	
		</c:forEach>
	
	</c:if>
	</div>
	
	
	

	

</body>
</html>