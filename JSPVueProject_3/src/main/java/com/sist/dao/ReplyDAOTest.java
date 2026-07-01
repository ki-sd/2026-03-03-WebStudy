package com.sist.dao;
import org.junit.jupiter.api.*;

import com.sist.service.ReplyService;
import com.sist.service.ReplyServiceImpl;
import com.sist.vo.ReplyVO;

import static org.junit.jupiter.api.Assertions.*;

import java.util.*;
public class ReplyDAOTest {
	ReplyService service=new ReplyServiceImpl();
	@Test
	public void listTest() {
		Map map=new HashMap();
		map.put("cno", 1);
		map.put("rno", 4);
		
		List<ReplyVO> list=service.replyListData(map);
		
		assertNotNull(list,"댓글 목록 정상 수행");
		assertFalse(list.isEmpty());
	}
}
