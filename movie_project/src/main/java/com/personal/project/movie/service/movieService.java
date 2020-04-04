package com.personal.project.movie.service;

import java.util.List;

import com.personal.project.movie.dto.dto;

public interface movieService {
	
	//영화관 주소 찾기 리스트
	public List<Object> findTheatersAddress(dto dto) throws Exception;

	//영화관 지점이름 찾기 리스트
	public List<Object> findMovieTheatersName(dto dto) throws Exception;
	
}
