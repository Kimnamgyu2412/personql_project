package com.personal.project.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.personal.project.board.dto.dto;
import com.personal.project.board.service.boardService;

@Repository
@Service("boardService")
public class boardServiceImpl implements boardService {
	
	@Autowired
	private SqlSession sql;
	
	
	//게시판 리스트
	@Override
    public List<Object> listBoard(dto dto) throws Exception {
        return  (List<Object>) sql.selectList("com.personal.project.board.sql.listBoard", dto);
    }
	
	//글쓰기
	@Override
	public int editBoardSave(dto dto) throws Exception {
		int result = 0;
		if(sql.insert("com.personal.project.board.sql.editBoardSave",dto) > 0) {
			result = 1;
		}
		return result;
	}
	
	//글보기
	@Override
	public dto viewBoard(dto dto) throws Exception {
		return sql.selectOne("com.personal.project.board.sql.viewBoard", dto);
	}

}
