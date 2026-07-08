package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.BoardVO;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="boardListData" resultType="BoardVO" parameterType="int">
//		SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd') AS dbday, hit
//		FROM freeboard
//		ORDER BY no DESC
//		OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
//	</select>
	public List<BoardVO> boardListData(int start){
		SqlSession session=ssf.openSession();
		List<BoardVO> list=session.selectList("boardListData",start);
		session.close();
		return list;
	}
//	<select id="boardRowCount" resultType="int">
//		SELECT COUNT(*)
//		FRIM freeboard
//	</select>
	public int boardRowCount() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("boardRowCount");
		session.close();
		return total;
	}
//	<insert id="boardInsert" parameterType="BoardVO">
//		INSERT INTO freeboard(no,name,subject,content,pwd)
//		VALUES(
//			fb_no_seq.nextval,#{name},#{subject},#{content},#{pwd}
//		)
//	</insert>
	public void boardInsert(BoardVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("boardInsert",vo);
		session.commit();
		session.close();
	}
//	<update id="boardHitIncrement" parameterType="int">
//		UPDATE freeboard SET
//		hit=hit+1
//		WHERE no=#{no}
//	</update>
//	<select id="boardDetailData" resultType="BoardVO" parameterType="int">
//		SELECT *
//		FROM freeboard
//		WHERE no=#{no}
//	</select>
	public BoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession();
		session.update("boardHitIncrement",no);
		session.commit();
		BoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
//	<select id="boardGetPassword" resultType="string" parameterType="int">
//		SELECT pwd
//		FROM freeboard
//		WHERE no=#{no}
//	</select>
	public String boardGetPassword(int no) {
		SqlSession session=ssf.openSession();
		String pwd=session.selectOne("boardGetPassword",no);
		session.close();
		return pwd;
	}
//	<delete id="boardDelete" parameterType="int">
//		DELETE FROM freeboard
//		WHERE no=#{no}
//	</delete>
	public void boardDelete(int no) {
		SqlSession session=ssf.openSession();
		session.delete("boardDelete",no);
		session.commit();
		session.close();
	}
//	<update id="boardUpdate" parameterType="BoardVO">
//		UPDATE freeboard SET
//		name=#{name},subject=#{subject},content=#{content},pwd=#{pwd}
//		WHERE no=#{no}
//	</update>
	public void boardUpdate(BoardVO vo) {
		SqlSession session=ssf.openSession();
		session.update("boardUpdate",vo);
		session.commit();
		session.close();
	}
}
