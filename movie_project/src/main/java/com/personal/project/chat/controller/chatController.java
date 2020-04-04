package com.personal.project.chat.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.personal.project.chat.dto.dto;
@Controller
public class chatController {

	@Resource(name = "chatService")
	com.personal.project.chat.service.chatService chatService;
	
	
	 //채팅예제
    @RequestMapping(value="/chat")
    public String chat(String nowTime,Model model,HttpSession session,@ModelAttribute("dto") dto dto) throws Exception {
    	HashMap sessionMap = (HashMap) session.getAttribute("userInfo");
    	dto.setChatName((String) sessionMap.get("userName"));
    	dto.setMyId((String) sessionMap.get("id"));
    	model.addAttribute("chatName",dto.getChatName());
    	model.addAttribute("myId",dto.getMyId());
    	if(chatService.listChat(dto) != null) {
    		model.addAttribute("chatList",chatService.listChat(dto));
    	}
    	return "/chat/chat";
    }
  
}
