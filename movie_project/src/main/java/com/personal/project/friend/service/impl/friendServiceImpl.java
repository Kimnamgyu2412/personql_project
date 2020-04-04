package com.personal.project.friend.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.personal.project.friend.dto.dto;
import com.personal.project.friend.service.friendService;

@Repository
@Service("friendService")
public class friendServiceImpl implements friendService {
	
	@Autowired
	private SqlSession sql;

	//친구요청
	@Override
	public int requestFriend(dto dto) throws Exception {
		int result = 0;
		if(sql.insert("com.personal.project.friend.sql.requestFriend",dto) > 0) {
			result = 1;
		}
		return result;
	}

	//친구체크
	@Override
	public int requestChk(dto dto) throws Exception {
		return sql.selectOne("com.personal.project.friend.sql.requestChk",dto);
	}

	//친구요청 수락
	@Override
	public int agreeFriend(dto dto) throws Exception {
		return sql.update("com.personal.project.friend.sql.agreeFriend",dto);
	}
	//친구 수락 후 저장
	@Override
	public int saveFriend(dto dto) throws Exception {
		int result = 0;
		if(sql.insert("com.personal.project.friend.sql.saveFriend",dto) > 0) {
			result = 1;
		}
		return result;
	}

	//친구 수락 리스트
	@Override
	public List<Object> agreeFriendList(dto dto) throws Exception {
		return sql.selectList("com.personal.project.friend.sql.agreeFriendList",dto);
	}
	//친구 요청 리스트
	@Override
	public List<Object> requestFriendList(dto dto) throws Exception {
		return sql.selectList("com.personal.project.friend.sql.requestFriendList",dto);
	}

}
