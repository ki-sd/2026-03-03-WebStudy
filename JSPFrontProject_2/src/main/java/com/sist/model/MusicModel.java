package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import org.json.simple.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class MusicModel {
	@RequestMapping("js/music.do")
	public void musicListData(HttpServletRequest request, HttpServletResponse response) {
		List<MusicVO> list=MusicDAO.musicListData();
		JSONArray arr=new JSONArray(); // List 매칭 => arr[]
		for(MusicVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("cno", vo.getCno());
			obj.put("title", vo.getTitle());
			obj.put("singer", vo.getSinger());
			obj.put("album", vo.getAlbum());
			obj.put("poster", vo.getPoster());
			obj.put("state", vo.getState());
			obj.put("idcrement", vo.getIdcrement());
			
			arr.add(obj);
		}
		// 브라우저로 전송
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
//		System.out.println(arr.toJSONString());
	}
}
