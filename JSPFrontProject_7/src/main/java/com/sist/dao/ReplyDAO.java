package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
//<select id="replyListData" resultType="ReplyVO" parameterType="int">
//SELECT no,bno,id,name,msg,to_CHAR(regdate,'yyyy-mm-dd HH24:MI:SS') AS dbday
//FROM reply
//WHERE bno=#{bno}
//ORDER BY no DESC
//</select>
//<insert id="replyInsert" parameterType="ReplyVO">
//<!-- 
//order => 먼저 실행
//-->
//<selectKey keyProperty="no" resultType="int" order="BEFORE">
//	SELECT NVL(MAX(no)+1),1)
//	FROM reply
//</selectKey>
//INSERT INTO reply VALUES(#{no},#{bno},#{id},#{name},#{sex},#{msg},SYSDATE)
//</insert>
public class ReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<ReplyVO> replyListData(int bno){
		SqlSession session=ssf.openSession();
		List<ReplyVO> list=session.selectList("replyListData",bno);
		session.close();
		return list;
	}
	public static void replyInsert(ReplyVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("replyInsert",vo);
		session.close();
	}
//	<update id="replyUpdate" parameterType="hashmap">
//	UPDATE reply SET
//	msg=#{msg}
//	WHERE no=#{no}
//	</update>
	public static void replyUpdate(Map map) {
		SqlSession session=ssf.openSession(true);
		session.update("replyUpdate",map);
		session.close();
	}
	public static void replyDelete(int no) {
		SqlSession session=ssf.openSession(true);
		session.delete("replyDelete",no);
		session.close();
	}
}
