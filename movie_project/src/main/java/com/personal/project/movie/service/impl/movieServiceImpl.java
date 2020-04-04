package com.personal.project.movie.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.personal.project.movie.dto.dto;
import com.personal.project.movie.service.movieService;

@Repository
@Service("movieService")
public class movieServiceImpl implements movieService {
	
	@Autowired
	private SqlSession sql;
	
	//영화관 주소 찾기 리스트
	@Override
	public List<Object> findTheatersAddress(dto dto) throws Exception {
		return (List<Object>) sql.selectList("com.personal.project.movie.sql.findTheatersAddress", dto);
	}
	
	//영화관 지점이름 찾기 리스트
	@Override
	public List<Object> findMovieTheatersName(dto dto) throws Exception {
		return (List<Object>) sql.selectList("com.personal.project.movie.sql.findMovieTheatersName", dto);
	}
}
