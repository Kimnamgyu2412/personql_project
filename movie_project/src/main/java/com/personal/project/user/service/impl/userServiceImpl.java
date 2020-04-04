package com.personal.project.user.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.personal.project.user.dto.dto;
import com.personal.project.user.service.userService;

@Repository
@Service("userService")
public class userServiceImpl  implements userService{
    
    @Autowired
    private SqlSession sql;

    //회원가입
	@Override
	public int userJoin(dto dto) throws Exception {
		return sql.insert("com.personal.project.user.sql.userJoin",dto);
	}

	//로그인
	@Override
	public dto userLogin(dto dto) throws Exception {
		return sql.selectOne("com.personal.project.user.sql.userLogin", dto);
	}

	//아이디체크
	@Override
	public int idcheck(String id) throws Exception {
		return sql.selectOne("com.personal.project.user.sql.idChk",id);
	}

	//친구찾기
	@Override
	public List<Object> findFriend(dto dto) throws Exception {
		return sql.selectList("com.personal.project.user.sql.findFriend",dto);
	}

}
