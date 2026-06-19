package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.vo.*;
import com.sist.commons.CreateSqlSessionFactory;

public class DataBoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
//	<select id="boardListData" resultType="DataBoardVO" parameterType="int">
//	SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm'dd') AS dbday, hit
//	FROM mvcdataboard
//	ORDER BY no DESC
//	OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
//	</select>
	public static List<DataBoardVO> boardListData(int start) {
		SqlSession session=ssf.openSession();
		List<DataBoardVO> list=session.selectList("boardListData",start);
		session.close();
		return list;
	}
	
//	<select id="boardRowCount" resultType="int">
//	SELECT COUNT(*)
//	FROM mvcdataboard
//	</select>
	public static int boardRowCount() {
		SqlSession session=ssf.openSession();
		int row=session.selectOne("boardRowCount");
		session.close();
		return row;
	}
//	<insert id="boardInsert" parameterType="DataBoardVO">
//	<selectKey keyProperty="no" resultType="int" order="BEFORE">
//		<!-- SEQUENCE -->
//		SELECT NVL(MAX(no)+1,1) as no FROM mvcdataboard
//	</selectKey>
//	INSERT INTO mvcdataboard(no,name,subject,content,pwd,filename,filesize)
//	VALUES(#{no},#{name},#{subject},#{content},#{pwd},#{filename},#{filesize})
//	</insert>
	public static void boardInsert(DataBoardVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("boardInser",vo);
		session.close();
	}
//	<!-- 상세보기 -->
//	<update id="boardHitIncrement" parameterType="int">
//		UPDATE mvcdataboard SET
//		hit=hit+1
//		WHERE no=#{no}
//	</update>
//	<select id="boardDetailData" resultType="DataBoardVO" parameterType="int">
//		SELECT no,name,subject,content,TO_CHAR(regdate,'yyyy-mm-dd hh24:mi:ss') AS dbday,filename,filesize
//		FROM mvcdataboard
//		WHERE no=#{no}
//	</select>
	public static DataBoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession();
		session.update("boardHitIncrement",no);
		DataBoardVO vo=session.selectOne("boardDetailData",no);
		session.commit();
		session.close();
		return vo;
	}
//	<!-- Update -->
//	<select id="boardGetPassword" parameterType="int" resultType="string">
//		SELECT pwd FROM mvcdataboard
//		WHERE no=#{no}
//	</select>
//	<update id="boardUpdate" parameterType="DataBoardVO">
//		UPDATE mvcdataboard SET
//		name=#{name},subject=#{subject},content=#{content},filename=#{filename},filesize=#{filesize}
//		WHERE no=#{no}
//	</update>
	public static DataBoardVO boardUpdateData(int no) {
		SqlSession session=ssf.openSession();
		DataBoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
	public static boolean boardUpdate(DataBoardVO vo) {
		boolean bCheck=false;
		SqlSession session=ssf.openSession();
		String db_pwd=session.selectOne("boardGetPassword",vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			session.update("boardUpdate",vo);
			session.commit();
		}
		return bCheck;
	}
//	<!-- Delete -->
//	<delete id="boardDelete" parameterType="int">
//		DELETE FROM mvcdataboard
//		WHERE no=#{no}
//	</delete>
	
	public static void boardDelete(DataBoardVO vo) {
		boolean bCheck=false;
		SqlSession session=ssf.openSession();
		String db_pwd=session.selectOne("boardGetPassword",vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			
		}
	}
}
