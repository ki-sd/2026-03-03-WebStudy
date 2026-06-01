package com.sist.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.sist.dao.DataBoardDAO;
import com.sist.vo.DataBoardVO;

@WebServlet("/UploadServlet")
// JSP로 처리하려면 => web.xml 등록
@MultipartConfig(
	fileSizeThreshold = 1024*1024, //1MB
	maxFileSize = 1024*1024*100,
	maxRequestSize = 1024*1024*50
	// 요청에 포함된 모든 파일 및 데이터의 전체 최대 크기
	// Part => 1. file , 2. text
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR="uploads";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath=getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		// application.getRealPath("") => getServletContext()
		// ServletContext application=getServletContext()
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists()) // 폴더가 없으면
			uploadDir.mkdir(); // 파일 저장할 폴더를 만든다
		// 파일 저장
		/*
		 *   Part 1 : file
		 *   Part 2 : text
		 */
		try {
			// 1. 한글 꺠짐 방지
			request.setCharacterEncoding("UTF-8");
			// 인코딩 => 디코딩
			String name=request.getParameter("name");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String pwd=request.getParameter("pwd");
			
			DataBoardVO vo=new DataBoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			Part filePart=request.getPart("upload");
			if(filePart==null || filePart.getSize()==0) {
				vo.setFilename("");
				vo.setFilesize(0);
			}else {
				String fileName=filePart.getSubmittedFileName();
				filePart.write(uploadPath+File.separator+fileName);
				
				File f=new File(uploadPath+File.separator+fileName);
				vo.setFilename(fileName);
				vo.setFilesize((int)f.length());
			}
			//DAO 연결
			DataBoardDAO.databoardInsert(vo);
			response.sendRedirect("databoard/boardList.do");
		}catch(Exception ex) {}
	}

}
