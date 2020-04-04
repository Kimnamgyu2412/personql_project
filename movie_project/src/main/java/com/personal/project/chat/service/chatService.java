package com.personal.project.chat.service;

import java.util.HashMap;
import java.util.List;

import com.personal.project.chat.dto.dto;


public interface chatService {

	public List<Object> listChat(dto dto) throws Exception;
	
	public int saveChat(HashMap<String,String> chatMap) throws Exception;
}
