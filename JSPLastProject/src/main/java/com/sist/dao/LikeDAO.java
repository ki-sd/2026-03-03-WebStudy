package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.LikeVO;

public class LikeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<insert id="likeOn" parameterType="LikeVO">
//		INSERT INTO myLike(lno,fno,id) VALUES(
//			like_lno_seq.nextVal,#{fno},#{id}
//		)
//	</insert>
	public void likeOn(LikeVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("likeOn",vo);
		session.commit();
		session.close();
	}
//	<delete id="likeOff" parameterType="int">
//		DELETE FROM myLike
//		WHERE lno=#{lno}
//	</delete>
	public void likeOff(LikeVO vo) {
		SqlSession session=ssf.openSession();
		session.delete("likeOff",vo);
		session.commit();
		session.close();
	}
//	<select id="likeCount" resultType="int" parameterType="int">
//		SELECT NVL(COUNT(*),0)
//		FROM myLike
//		WHERE fno=#{fno}
//	</select>
	public int likeCount(int fno) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("likeCount",fno);
		session.close();
		return count;
	}
//	<select id="likeCheck" resultType="int" parameterType="LikeVO">
//		SELECT COUNT(*)
//		FROM myLike
//		WHERE fno=#{fno} AND id=#{id}
//	</select>
	public int likeCheck(LikeVO vo) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("likeCheck",vo);
		session.close();
		return count;
	}
//	<update id="foodLikeUpdate" parameterType="int">
//		UPDATE food SET
//		likecount=(SELECT COUNT(*)
//					FROM myLike
//					WHERE fno=#{fno})
//		WHERE no=#{fno}
//	</update>
	public void foodLikeUpdate(int fno) {
		SqlSession session=ssf.openSession();
		session.update("foodLikeUpdate",fno);
		session.commit();
		session.close();
	}
}
