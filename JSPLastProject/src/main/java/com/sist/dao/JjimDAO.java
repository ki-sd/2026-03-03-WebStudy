package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.JjimVO;

public class JjimDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="jjimCount" resultType="int" parameterType="JjimVO">
//		SELECT COUNT(*)
//		FROM myJjim
//		WHERE id=#{id} AND fno=#{fno}
//	</select>
	public int jjimCount(JjimVO vo) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("jjimCount",vo);
		session.close();
		return count;
	}
//	<insert id="jjimInsert" parameterType="JjimVO">
//		INSERT INTO myJjim(fno,id)
//		VALUES(#{fno},#{id})
//	</insert>
	public void jjimInsert(JjimVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("jjimInsert",vo);
		session.commit();
		session.close();
	}
//	<select id="jjimListData" resultMap="JjimMap" parameterType="String">
//		SELECT fno,jno,name,poster,TO_CHAR(regdate,'yyyy-mm-dd') AS dbday
//		FROM myJjim j JOIN food f
//		ON j.fno=f.no AND id=#{id}
//		ORDER BY no DESC
//	</select>
	public List<JjimVO> jjimListData(String id){
		SqlSession session=ssf.openSession();
		List<JjimVO> list=session.selectList("jjimListData",id);
		session.close();
		return list;
	}
//	<delete id="jjimCancel" parameterType="int">
//		DELETE FROM myJjim
//		WHERE jno=#{jno}
//	</delete>
	public void jjimCancel(int jno) {
		SqlSession session=ssf.openSession();
		session.delete("jjimCancel",jno);
		session.commit();
		session.close();
	}
}
