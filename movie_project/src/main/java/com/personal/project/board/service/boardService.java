package com.personal.project.board.service;

import java.util.List;

import com.personal.project.board.dto.dto;

public interface boardService {

	//�Խ��� ����Ʈ
	public List<Object> listBoard(dto dto) throws Exception;
	
	//�۾���
	public int editBoardSave(dto dto) throws Exception;
	
	//�󼼺���
	public dto viewBoard(dto dto) throws Exception;

}
