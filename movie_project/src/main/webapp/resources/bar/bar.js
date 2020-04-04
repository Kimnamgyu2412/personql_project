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
	
	function fnFindTgears(){
		_FRM.target = "_self";
		_FRM.action = "/findMovieTheatersPage";
		_FRM.submit();
	}
	function fnFindMovieSchedule(){
		_FRM.target = "_self";
		_FRM.action = "/findMovieSchedulePage";
		_FRM.submit();
	}
	
	function fnFindFriendPage(){
		_FRM.target = "_self";
		_FRM.action = "/findFriendPage";
		_FRM.submit();	 
	}
	function fnRequestFriendList(){
		_FRM.target = "_self";
		_FRM.action = "/requestFriendList";
		_FRM.submit();	 
	}
	