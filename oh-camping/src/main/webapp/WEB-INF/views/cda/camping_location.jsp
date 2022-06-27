<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style type="text/css">	
		body{ background-color: white; font-size: 1em; margin:0px; font-family: 'Nanum Gothic', sans-serif;}
		div.location{outline: none;}
		div.location>div.locationtext{  padding-top: 150px; text-align: center; font-family: "Nanum Gothic"; background: url(/img/bg_main_1.jpg)no-repeat 50% 50%; background-size: 100%;}
		div.location>div.locationtext>h1{position: relative; padding: 50px 0 0px 0; font-size: 50px; font-family: "Poiret One";}
		div.location>div.locationtext>h3{padding:30px; color:#dfb99a;}
		
		div.location>div.locationmap{width:1200px; margin:70px auto; text-align: center;}
		div.locationmap>h1{margin:20px; color:#cd996f; font-size: 50px; font-family: "Poiret One"; font-weight: 200; letter-spacing: 3px; }
		div.locationmap>h3{ padding-bottom: 40px; border-bottom: 1px solid #cd996f;}
		
		
		div.locationBottom{width: 1200px; margin: 70px auto; text-align: center}
		div.locationBottom>h1{margin:20px; color:#cd996f; font-size: 50px; font-family: "Poiret One"; font-weight: 200; letter-spacing: 3px;}
		div.locationBottom>h3{ padding-bottom: 40px; border-bottom: 1px solid #cd996f;}	
		div.findplaceCar{display: flex; justify-content: space-between; magin:20px 10px;}
		
		div.findImage{magin:0px; width: 30%; height: 400px; background: url(<%=request.getContextPath() %>/resources/image/location.jpg)no-repeat 50% 50%; background-size: cover;}
		div.lefttext{display: flex; flex-direction: column; justify-content: center; width: 60%; font-size: 13px;}
	</style>



</head>

<body>
	<div class="location">
	
		<!-- 위쪽-->
		<div class="locationtext">
			<h1>Location</h1>
			<h3>저희 펜션으로 오시는 길을 안내해 드리겠습니다.</h3>
	
		</div>
		
		
		<!-- 지도 -->
		<div class="locationmap">
			<h1>Map</h1>
			<h3>지도로 저희 펜션의 위치를 확인해보세요.</h3>
		
			<div id="map" style="width:1024px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c66a4824fd7b717fb864ce0f79260ce"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.836423000000266, 127.3121087999996),
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
			</script>	
			
			<!-- <script>
				var domain = 'https://i1.daumcdn.net';
				var path = '/dmaps/apis/openapi/sampleimg/';
				var plan = function( x, y, z ) {
				    y = -y - 1;
				    var limit = Math.ceil( 3 / Math.pow( 2, z ) );
				
				    if ( 0 <= y && y < limit && 0 <= x && x < limit ) {
				        return domain + path + 'planh' +
				            z + '_' + y + '_' + x + '.png';
				    } else {
				        return 'https://i1.daumcdn.net/dmaps/apis/white.png';
				    }
				};
				
				kakao.maps.Tileset.add( 'PLAN',
				        new kakao.maps.Tileset(
				            512, 512, plan, '', false, 0, 2 ) );
				
				var node = document.getElementById( 'map' );
				var map = new kakao.maps.Map( node, {
				    projectionId: null,
				    mapTypeId: kakao.maps.MapTypeId.PLAN,
				    $scale: false,
				    center: new kakao.maps.Coords( 650, -550 ),
				    level: 2
				} );
				var center = map.getCenter();
				var marker = new kakao.maps.Marker({
				    position: center
				});
				marker.setMap(map);
				
				var infowindow = new kakao.maps.InfoWindow({
				    content: '커스텀 타일셋을 올릴수 있습니다!'
				});
				infowindow.open(map, marker);
			</script> -->			
		</div>		
		<div class="locationBottom">
			<h1>Location by a car</h1>
			<h3>자동차로 오는 법</h3>
			<div class="findplaceCar">
				<div class="findImage"></div>
				<div class="lefttext">
					<b>주소지는"경기도 가평군 상면 물골길 102"로 검색해서 찾아와 주세요.</b>
				</div>
			</div>
		
					
		</div>
		
	</div>

</body>
</html>