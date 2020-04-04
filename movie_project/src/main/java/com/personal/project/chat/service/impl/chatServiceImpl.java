package com.personal.project.chat.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.personal.project.chat.dto.dto;
import com.personal.project.chat.service.chatService;

@Repository
@Service("chatService")
public class chatServiceImpl implements chatService {
	
	@Autowired
	private SqlSession sql;

	@Override
	public List<Object> listChat(dto dto) throws Exception {
		return  (List<Object>) sql.selectList("com.personal.project.chat.sql.listChat", dto);
	}

	@Override
	public int saveChat(HashMap<String,String> chatMap) throws Exception {
		int result = 0;
		if(sql.insert("com.personal.project.chat.sql.saveChat",chatMap) > 0) {
			result = 1;
		}
		return result;
	}
	
	


}
