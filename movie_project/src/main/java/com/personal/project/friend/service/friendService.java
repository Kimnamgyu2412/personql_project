package com.personal.project.friend.service;

import java.util.List;

import com.personal.project.friend.dto.dto;

public interface friendService {

	//친구요청
	public int requestFriend(dto dto) throws Exception;
	
	//친구체크
	public int requestChk(dto dto) throws Exception;
	
	//친구수락
	public int agreeFriend(dto dto) throws Exception;

	//친구 수락 후 친구저장
	public int saveFriend(dto dto) throws Exception;
	
	//친구수락 리스트
	public List<Object> agreeFriendList(dto dto) throws Exception;

	//친구요청 리스트
	public List<Object> requestFriendList(dto dto) throws Exception;
}
