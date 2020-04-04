package com.personal.project.board.service;

import java.util.List;

import com.personal.project.board.dto.dto;

public interface boardService {

	//게시판 리스트
	public List<Object> listBoard(dto dto) throws Exception;
	
	//글쓰기
	public int editBoardSave(dto dto) throws Exception;
	
	//상세보기
	public dto viewBoard(dto dto) throws Exception;

}
