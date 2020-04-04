package com.personal.project.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.personal.project.board.dto.dto;

@Controller
public class boardController {

	@Resource(name = "boardService")
	com.personal.project.board.service.boardService boardService;
	
	//게시판 리스트
    @RequestMapping(value="/freeBoard")
    public String boardPageMove( Model model,HttpSession session,@ModelAttribute("dto") dto dto) throws Exception {
    	if(boardService.listBoard(dto)!=null) {
    		model.addAttribute("boardList",boardService.listBoard(dto));
    	}
    	return "/board/freeBoard";
    }

    //상세보기
    @RequestMapping(value="/viewBoard")
    public String viewBoardMove(Model model,@ModelAttribute("dto") dto dto) throws Exception {
    	model.addAttribute("view",boardService.viewBoard(dto));
    	return"/board/viewBoard";
    }
    
    
    //글쓰기 페이지
    @RequestMapping(value="/editPage")
    public String editPageMove(Model model,HttpSession session) {
    	return "/board/editBoard";
    }
    
    //글쓰기 저장
    @RequestMapping(value="/editBoardSave")
    public String editBoardSave(Model model,HttpSession session,@ModelAttribute("dto") dto dto) throws Exception {
    	HashMap sessionMap = (HashMap) session.getAttribute("userInfo");
    	if(dto.getTitle() != null || dto.getContents() != null) {
    		dto.setRegUser((String) sessionMap.get("id"));
    		dto.setUpdUser((String) sessionMap.get("id"));
    		dto.setUserName((String) sessionMap.get("userName"));
    		dto.setUserNo((String) sessionMap.get("userNo"));
    		if(boardService.editBoardSave(dto)>0) {
    			return "redirect:/freeBoard";
    		}
    	}
    	return "/board/editBoard";
    }
    
  

}
