package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao=new MusicDAO();
	
	public static MusicDAO newInstance() {
		if(dao==null)
			dao=new MusicDAO();
		return dao;
	}
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public List<MusicVO> musicListData(int page){
		List<MusicVO> list=new ArrayList<MusicVO>();
		try {
			getConnection();
			String sql="SELECT UNIQUE no,title,singer,album,poster,state,idcrement "
					+ "FROM genie_music "
					+ "WHERE cno=1 "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*20)-20);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MusicVO vo=new MusicVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSinger(rs.getString(3));
				vo.setAlbum(rs.getString(4));
				vo.setPoster(rs.getString(5));
				vo.setState(rs.getString(6));
				vo.setIdcrement(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace(); // 테스트 방법 => Junit (단위테스트)
		}finally {
			disConnection();
		}
		return list;
	}
	public int musicTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT (DISTINCT no)/20.0) "
					+ "FROM genie_music "
					+ "WHERE cno=1";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return total;
	}
}
