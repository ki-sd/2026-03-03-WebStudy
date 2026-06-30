package com.sist.service;
import java.util.*;

import com.sist.vo.ReplyVO;
public interface ReplyService {
	public List<ReplyVO> replyListData(Map map);
	public void replyInsert(ReplyVO vo);
	public void replyDelete(int no);
	public void replyUpdate(ReplyVO vo);
}
