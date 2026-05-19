package com.sist.dao;
import java.util.*;
import java.sql.*;
public class GoodsDAO {
	private PreparedStatement ps;
	private Connection conn;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static GoodsDAO dao;
	
	private GoodsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static GoodsDAO newInstance() {
        if (dao==null) {
            dao=new GoodsDAO();
        }
        return dao;
    }
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
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
	//NO                                        NOT NULL NUMBER
	//GOODS_NAME                                NOT NULL VARCHAR2(1000)
	//GOODS_SUB                                          VARCHAR2(1000)
	//GOODS_PRICE                               NOT NULL VARCHAR2(50)
	//GOODS_DISCOUNT                                     NUMBER
	//GOODS_FIRST_PRICE                                  VARCHAR2(20)
	//GOODS_DELIVERY                            NOT NULL VARCHAR2(20)
	//GOODS_POSTER                                       VARCHAR2(260)
	//HIT                                                NUMBER
	public List<GoodsVO> goodsListData(int page, int row){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		try {
			getConnection();
			String sql="SELECT no,goods_name,goods_poster,goods_price "
					+ "FROM goods_all "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*row)-row);
			ps.setInt(2, row);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setGoods_name(rs.getString(2));
				vo.setGoods_poster(rs.getString(3));
				vo.setGoods_price(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	public int goodsTotalPage(int row) {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/"+row+") FROM goods_all";
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
	//NO                                        NOT NULL NUMBER
	//GOODS_NAME                                NOT NULL VARCHAR2(1000)
	//GOODS_SUB                                          VARCHAR2(1000)
	//GOODS_PRICE                               NOT NULL VARCHAR2(50)
	//GOODS_DISCOUNT                                     NUMBER
	//GOODS_FIRST_PRICE                                  VARCHAR2(20)
	//GOODS_DELIVERY                            NOT NULL VARCHAR2(20)
	//GOODS_POSTER                                       VARCHAR2(260)
	//HIT                                                NUMBER
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo=new GoodsVO();
		try {
			getConnection();
			String sql="UPDATE goods_all SET "
					+ "hit=hit+1 "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			sql="SELECT no,goods_name,goods_poster,goods_price,goods_sub,goods_discount,goods_delivery,goods_first_price,hit "
					+ "FROM goods_all "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setGoods_name(rs.getString(2));
			vo.setGoods_poster(rs.getString(3));
			vo.setGoods_price(rs.getString(4));
			vo.setGoods_sub(rs.getString(5));
			vo.setGoods_discount(rs.getInt(6));
			vo.setGoods_delivery(rs.getString(7));
			vo.setGoods_first_price(rs.getString(8));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
}
