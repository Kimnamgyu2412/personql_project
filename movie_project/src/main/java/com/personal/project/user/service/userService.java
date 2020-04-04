package com.personal.project.user.service;

import java.util.List;

import com.personal.project.user.dto.dto;

public interface userService {
	
	//회원가입
	public int userJoin(dto dto) throws Exception;
	
	//로그인
	public dto userLogin(dto dto) throws Exception;
	
	//아이디체크유무
	public int idcheck(String id) throws Exception;
	 
	//친구찾기
	public List<Object> findFriend(dto dto) throws Exception;
}
