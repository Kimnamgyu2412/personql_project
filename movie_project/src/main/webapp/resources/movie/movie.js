var _FRM;

/**
	 * 빈값 체크
	 * @param str
	 * @returns
	 */
	function isEmpty(str) {
		if (str == "undefined")
			return true;
		if (str == null)
			return true;
		if (str == "null")
			return true;
		str = $.trim(str);
		if (str.length == 0)
			return true;
		return false;
	}
	
	function isNotEmpty(str) {
		return (isEmpty(str)) ? false : true;
	}
	
	function findMovieTheatersName(){
		var movieTheatersType = $("#movieTheatersType option:selected").val();
		$.ajax({
			url : "/findMovieTheatersName",
			data:{"movieTheatersType" : movieTheatersType},
			success : function(data){
				$("#theatersNameSelect").remove();
				$("#theatersNameWrap").append('<div class="input-select" id="theatersNameSelect" style="margin-top: 15px;">'+
												'<select data-trigger="" id="movieTheatersName" name="choices-single-defaul">'+
												'<option placeholder="지점">선택</option></select></div>');
				for(var i in data){
					$("#movieTheatersName").append('<option value="'+data[i].movieTheatersName+','+data[i].movieTheatersCode+'">'+data[i].movieTheatersName+'</option>');
				}
				
				const choices = new Choices('[data-trigger]',
						{
					searchEnabled: false,
					itemSelectText: '',
						});
				
			},error : function(e){
		    	console.log(e);
			}
		});
	}
	//영화관 찾기
	function fnFindMovieTheaters(){
		var movieTheatersType = $("#movieTheatersType").val();
		var movieTheatersNameCode = $("#movieTheatersName").val();
		var movieTheatersNameCodeSplit = movieTheatersNameCode.split(",");
		var movieTheatersName = movieTheatersNameCodeSplit[0]; 
		
		console.log(movieTheatersType);
		console.log(movieTheatersName);
		$.ajax({
			url : "/findMovieTheaters",
			data:{"movieTheatersType":movieTheatersType,"movieTheatersName":movieTheatersName},
			success : function(data){
				console.log(data);
//				$("#map1").hide();
//				$("#map").show();
				//지도
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(data[0].movieTheatersAddress, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(
				        		result[0].y, 
				        		result[0].x
				        		);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+data[0].movieTheatersType+data[0].movieTheatersName+'점</div>'
				        });
				        infowindow.open(map, marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				        $("#myLocation").html("");
				        $("#findMap").append('<button type="button" id="myLocation" name="myLocation" onclick="findMyLocation(\''+result[0].y+'\',\''+result[0].x+'\');">내위치</button>');
				    }
					
				});    
				},error : function(e){
			    	console.log(e);
			}
		});
	}
	
	function fnFindMovieTime(){
		var movieTheatersType = $("#movieTheatersType").val();
		var movieTheatersNameCode = $("#movieTheatersName").val();
		var movieTheatersNameCodeSplit = movieTheatersNameCode.split(",");
		var movieTheatersName = movieTheatersNameCodeSplit[0]; 
		var movieTheatersCode = movieTheatersNameCodeSplit[1]; 
		$.ajax({
			url : "/findMovieSchedule",
			type:'post',
			data:{"movieTheatersType":movieTheatersType,"movieTheatersName":movieTheatersName,"movieTheatersCode" : movieTheatersCode},
			dataType : "json",
			success : function(data){
				$("#schedule").html("");
				var length = Number(data.movieSize);
				for(var i = 0; i < length; i++){
					$("#schedule").append('<h3>'+data.moiveName[i]+'</h3><br/><h4>'+data.moiveTime[i]+'</h4><br/>');
				}
			},error : function(e){
		    	console.log(e);
			}
		});
	}
	
	const choices = new Choices('[data-trigger]',
	  {
	    searchEnabled: false,
	    itemSelectText: '',
	  });
	
	
	function fnRequestFriendList(){
		_FRM.target = "_self";
		_FRM.action = "/requestFriendList";
		_FRM.submit();	 
		
	}
	