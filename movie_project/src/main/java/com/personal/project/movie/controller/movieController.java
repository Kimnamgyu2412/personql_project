package com.personal.project.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.personal.project.movie.dto.dto;
@Controller
public class movieController {

	@Resource(name = "movieService")
	com.personal.project.movie.service.movieService movieService;
	
	//영화 랭킹 크롤링
    @RequestMapping(value="/movieChart")
    public String movieCrawling(Model model) {
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
		
		@SuppressWarnings("rawtypes")
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
		
		return "/movie/movieChart";
    }
    
    //영화관 검색 페이지
    @RequestMapping(value="/findMovieTheatersPage")
    public String findMovieTheatersPage(Model model,@ModelAttribute("dto") dto dto) throws Exception {
    	return "/movie/findMovieTheaters";
    }
    //상영시간표 페이지 
    @RequestMapping(value="/findMovieSchedulePage")
    public String findSchedule(Model model,@ModelAttribute("dto") dto dto) throws Exception {
    	return "/movie/findMovieSchedule";
    }

    //영화관 이름 찾기
    @ResponseBody
    @RequestMapping(value="/findMovieTheatersName",produces="application/json; charset=UTF-8")
    public List<Object> findMovieTheatersName(@ModelAttribute("dto") dto dto) throws Exception {
    	return movieService.findMovieTheatersName(dto);
    }
    
    //영화관 주소 찾기
    @ResponseBody
    @RequestMapping(value="/findMovieTheaters",produces="application/json; charset=UTF-8")
    public List<Object> findMovieTheaters(@ModelAttribute("dto") dto dto) throws Exception {
    	return movieService.findTheatersAddress(dto);
    }
    
    //영화관 별 상영표 기능
	@ResponseBody
    @RequestMapping(value="/findMovieSchedule",produces="application/json; charset=UTF-8")
    //작업때만 string 나중에 list 변환
    public HashMap<String, List> findMovieSchedule(@ModelAttribute("dto") dto dto, HashMap<String, List> moiveNameMap) throws Exception {

    	WebDriver driver; //기본 드라이버 
    	// 웹드라이버에 필요한 기본 소스 
    	final String WEB_DRIVER_ID = "webdriver.chrome.driver"; //각 브라우저에 따라 다름 
    	final String WEB_DRIVER_PATH = "D:/selenium/chromedriver_win32/chromedriver.exe"; //각 브라저에 맞는 드라이버 다운로드 후 경로 설정 
    	String base_url; //연결할 웹페이지 링크 
    	WebDriverWait wait; // 페이지 로딩시 까지 대기해주는 클래스
    	List<WebElement> timeWarp = null; // 각 결과를 넣어줄 List 
    	
    	HashMap<String, List> moiveScheduleMap = new HashMap<String, List>();
    	 
    	if(dto.getMovieTheatersType().equals("CGV")) {
    		String url = "http://www.cgv.co.kr/common/showtimes/iframeTheater.aspx?areacode=01&theaterCode="+dto.getMovieTheatersCode(); //크롤링할 url지정
    		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
    		
    		try {
    			doc = Jsoup.connect(url).get();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    		
    		Elements element = doc.select("div.col-times");
    		Elements element1 = doc.select(".sect-showtimes");
    		List<String> moiveNameList = new ArrayList<String>();
    		List<String> movieTimeList = new ArrayList<String>();
    		List<String> moiveSizeList = new ArrayList<String>();
    		
    		for(int i = 0; i < element.size(); i++) {
    			String movieName = element.select(".info-movie").select("strong").eq(i).text();
    			moiveNameList.add(movieName);
    			String moiveTime = element1.select("ul").select("li").select(".col-times").eq(i).select(".type-hall").select(".info-timetable").select("ul").select("li").text();
    			movieTimeList.add(moiveTime);
    			moiveScheduleMap.put("moiveName", moiveNameList);
    			moiveScheduleMap.put("moiveTime", movieTimeList);
    		}
    		String movieSize = Integer.toString(element.size());
    		moiveSizeList.add(movieSize);
    		moiveScheduleMap.put("movieSize", moiveSizeList);
    		
    		return moiveScheduleMap;
    	}else if(dto.getMovieTheatersType().equals("롯데시네마")) {
    		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH); 
    		ChromeOptions options = new ChromeOptions();  
    		options.setHeadless(true); // 활성화 시 웹페이지 안나옴 -> 속도 개선 
    		driver = new ChromeDriver(options); 
    		wait = new WebDriverWait(driver,20); 
    		base_url="https://www.lottecinema.co.kr/NLCHS/Cinema/Detail?divisionCode=1&detailDivisionCode=1&cinemaID="+dto.getMovieTheatersCode(); 
	    	driver.get(base_url); 
	    	timeWarp = driver.findElements(By.className("time_select_wrap"));
	    	List<String> movieNameList = new Vector<String>();
	    	List<String> movieTimeList = new Vector<String>();
	    	List<String> movieSizList = new Vector<String>();
	    	
	    	for(int i = 0; i<timeWarp.size();i++) {
	    		WebElement movieName = timeWarp.get(i).findElement(By.className("list_tit"));
	    		movieNameList.add(movieName.getText());
	    		List<WebElement> movieTime = timeWarp.get(i).findElements(By.className("list_time"));
	    		movieTimeList.add(movieTime.get(0).getText());
	    		
	    		moiveScheduleMap.put("moiveName", movieNameList);
	    		moiveScheduleMap.put("moiveTime", movieTimeList);
	    	}
	    	
	    	String movieSize = Integer.toString(timeWarp.size());
	    	movieSizList.add(movieSize);
	    	moiveScheduleMap.put("movieSize", movieSizList);
	    	
    		return moiveScheduleMap;
    	}else if(dto.getMovieTheatersType().equals("메가박스")){
    		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH); 
    		ChromeOptions options = new ChromeOptions();  
//    		options.setHeadless(true); // 활성화 시 웹페이지 안나옴 -> 속도 개선 
    		driver = new ChromeDriver(options); 
    		wait = new WebDriverWait(driver,20); 
    		base_url="https://www.megabox.co.kr/theater?brchNo="+dto.getMovieTheatersCode(); 
	    	driver.get(base_url);
	    	driver.findElements(By.linkText("상영시간표")).get(1).click();
	    	List<WebElement> timeWarpMega = driver.findElements(By.className(".theater-list-box"));
//	    	List<WebElement> findMovieName = findMovie.findElements(By.className(""));
//	    	List<WebElement> findMovieSize = findMovie.findElements(By.className(".theater-list"));
//	    	System.out.println(findMovieSize);
//	    	List<WebElement> findMovieTime = driver.findElements(By.className("tab-list"));
////	    	List<WebElement> a = findMovieTime.get(1).findElements(By.tagName("ul"));
//	    	List<WebElement> a = findMovieTime.get(1).findElements(By.tagName("ul"));
//	    	List<WebElement> b = a.get(0).findElements(By.tagName("li"));
//	    	WebElement c =  b.get(1).findElement(By.tagName("a"));
////	    	WebElement c =  b.findElement(By.linkText("상영시간표")).click();
//	    	WebElement d = ((WebElement) c).click();
//	    	System.out.println(c);
	    	
    	}
    	return moiveNameMap;
    }
    
   
}
