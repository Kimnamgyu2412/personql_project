package com.personal.project.friend.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.personal.project.friend.dto.dto;

@Controller
public class friendController {

	@Resource(name = "friendService")
	com.personal.project.friend.service.friendService friendService;
	
	//친구찾기
	@RequestMapping(value="/findFriendPage")
	public String findFriend(Model model,HttpSession session,@ModelAttribute("dto") dto dto) {
		HashMap sessionMap = (HashMap) session.getAttribute("userInfo");
    	dto.setFriendMyId((String) sessionMap.get("id"));
    	model.addAttribute("userId",dto.getFriendMyId());
		return"/friend/findFriend";
	}
	
	//친구요청
	@ResponseBody
	@RequestMapping(value="/requestFriend")
	public String requestFriend(@ModelAttribute("dto") dto dto) throws Exception {
		String result = "0";
		if(friendService.requestChk(dto) == 0) {
			if(friendService.requestFriend(dto) > 0) {
				result = "1";
			}
		}
		return result; 
	}
	//친구요청 수락
	@ResponseBody
	@RequestMapping(value="/agreeFriend")
	public String agreeFriend(@ModelAttribute("dto") dto dto) throws Exception {
		String result = "0";
		if(friendService.agreeFriend(dto) > 0) {
			if(friendService.saveFriend(dto) > 0) {
				result = "1";
			}
		}
		return result;
	}
	//친구 요청 리스트
	@RequestMapping(value="/requestFriendList")
	public String requestFriendList(Model model,@ModelAttribute("dto") dto dto,HttpSession session) throws Exception {
		HashMap sessionMap = (HashMap) session.getAttribute("userInfo");
    	dto.setFriendMyId((String) sessionMap.get("id"));
		if(friendService.requestFriendList(dto) != null) {
			model.addAttribute("requestFriendList",friendService.requestFriendList(dto));
		}
		if(friendService.agreeFriendList(dto) != null) {
			model.addAttribute("agreeFriendList",friendService.agreeFriendList(dto));
		}
		return "/friend/requestFriend";
	}
}
