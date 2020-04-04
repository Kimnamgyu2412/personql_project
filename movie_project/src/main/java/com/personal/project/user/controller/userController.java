package com.personal.project.user.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.personal.project.user.dto.dto;

@Controller
public class userController {

	@Resource(name = "userService")
	com.personal.project.user.service.userService userService;
	
	//메인화면
    @RequestMapping(value="/")
    public String mainPageMove( Model model,HttpSession session) {
    	String url = "http://www.cgv.co.kr/movies/"; //크롤링할 url지정
		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements element = doc.select("div.sect-movie-chart");
		
		List<String> rankList = new ArrayList<String>();
		List<String> titleList = new ArrayList<String>();
		List<String> imgList = new ArrayList<String>();
		List<String> aTagList = new ArrayList<String>();
		List<String> advanceRateList = new ArrayList<String>();
		List<String> openMovieList = new ArrayList<String>();
		
		HashMap<String, List> crawlingMap = new HashMap<String, List>();
		
		for(int i = 0; i < element.select("div.box-image strong.rank").size(); i++) {
			String rank = element.select("strong.rank").eq(i).text();
			String title = element.select("strong.title").eq(i).text();
			String img = element.select("span.thumb-image img").eq(i).attr("src");
			String aTag = element.select("div.box-image > a").eq(i).attr("href");
			String advanceRate = element.select("strong.percent").eq(i).text();
			String openMovie = element.select("span.txt-info").eq(i).text();
			rankList.add(rank);
			imgList.add(img);
			titleList.add(title);
			aTagList.add(aTag);
			advanceRateList.add(advanceRate);
			openMovieList.add(openMovie);
			crawlingMap.put("advanceRate", advanceRateList);
			crawlingMap.put("rank", rankList);
			crawlingMap.put("title", titleList);
			crawlingMap.put("image", imgList);
			crawlingMap.put("aTag", aTagList);
			crawlingMap.put("openMovie", openMovieList);
		}
		model.addAttribute("crawlingList",crawlingMap);
		model.addAttribute("crawlingLength",element.select("div.box-image strong.rank").size());
		
	return "/home";
    }
 
    //로그인페이지
    @RequestMapping(value="/loginPage")
    public String userLoginPage() {
    	return "/user/userLogin";
    }
    
    //로그인
    @RequestMapping(value="/login")
    public String userLogin(@ModelAttribute("dto") dto dto, HttpSession session, Model model) throws Exception {
	  	
    	HashMap sessionMap = new HashMap();
	  	if(userService.userLogin(dto) != null) {
	  		String userNo = userService.userLogin(dto).getUserNo();
	  		String id = dto.getId();
	  		String userName = userService.userLogin(dto).getUserName();
	  		
	  		sessionMap.put("userNo",userNo);
	  		sessionMap.put("id",id);
	  		sessionMap.put("userName",userName);

	  		session.setAttribute("userInfo", sessionMap);
	  		return "/home";
	  	}
		return "/user/userLogin";
	  }
    
    //로그아웃
    @RequestMapping(value = "/logout")
    public String logout(Model model,HttpSession session)throws IOException {
	    session.invalidate();
    return "/home";
    }
    
    //회원가입
    @ResponseBody
    @RequestMapping(value="/join")
    public String userJoin(@ModelAttribute("dto") dto dto, Model model) throws Exception {
    	String result = "0";
    	if(userService.userJoin(dto) > 0) {
    		result = "1";
    	}
	return result;
    }
    
    //마이페이지 이동
    @RequestMapping(value="/myPage")
    public String myPage(Model model,@ModelAttribute("dto") dto dto,HttpSession session) {
    	HashMap sessionMap = (HashMap) session.getAttribute("userInfo");
    	dto.setUserNo((String) sessionMap.get("id"));
    	model.addAttribute("userId",dto.getUserNo());
    	return "/user/myPage";
    }
    
    //아이디 유무 체크
    @ResponseBody
    @RequestMapping(value="/idcheck")
    public int idChk(@RequestBody String id) throws Exception{
    	int result = 0;
    	if(userService.idcheck(id)>0) {
    		result = 1;
    	}
        return result;
    }
    
    //친구(유저)찾기
    @ResponseBody 
    @RequestMapping(value="/findFriend", produces="application/json; charset=UTF-8")
    public List<Object> findFriend(@ModelAttribute("dto") dto dto) throws Exception{
    	return userService.findFriend(dto);
    }
    
}
