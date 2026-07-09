package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.*;
public class ReviewDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="reviewListData" resultType="ReviewVO" parameterType="int">
//		SELECT no,fno,name,msg,dbday
//		FROM foodreview
//		WHERE fno=#{fno}
//	</select>
	public List<ReviewVO> reviewListData(int fno){
		SqlSession session=ssf.openSession();
		List<ReviewVO> list=session.selectList("reviewListData",fno);
		session.close();
		return list;
	}
//	<insert id="insertReview" parameterType="ReviewVO">
//		INSERT INTO foodreview(fno,id,name,msg) VALUES
//		(#{fno},#{id},#{name},#{msg})
//	</insert>
	public void insertReview(ReviewVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("insertReview",vo);
		session.commit();
		session.close();
	}
//	<delete id="deleteReview" parameterType="int">
//		DELETE FROM foodreview
//		WHERE no=#{no}
//	</delete>
	public void deleteReview(int fno) {
		SqlSession session=ssf.openSession();
		session.delete("deleteReview",fno);
		session.commit();
		session.close();
	}
//	<update id="updateReview" parameterType="ReviewVO">
//		UPDATE foodreview SET
//		msg=#{msg}
//		WHERE no=#{no}
//	</update>
	public void updateReview(ReviewVO vo) {
		SqlSession session=ssf.openSession();
		session.update("updateReview",vo);
		session.commit();
		session.close();
	}
}
