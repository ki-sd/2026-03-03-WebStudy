package com.sist.service;
import java.util.*;
import com.sist.vo.*;
public interface BoardService {
	public List<BoardVO> boardListData(int start);
	public int boardRowCount();
	public void boardInsert(BoardVO vo);
	public BoardVO boardDetailData(int no);
	public boolean boardDelete(int no,String pwd);
	public BoardVO boardUpdateDetail(int no);
	public boolean boardUpdate(BoardVO vo);
}
