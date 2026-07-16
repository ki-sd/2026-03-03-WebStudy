package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.*;

public class AdminDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="memberListData" resultType="MemberVO" parameterType="int">
//		SELECT id,name,sex,phone,addr1,grade
//		FROM member1
//		WHERE admin!='y'
//		ORDER BY regdate DESC
//		OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
//	</select>
	public List<MemberVO> memberListData(int start){
		SqlSession session=ssf.openSession();
		List<MemberVO> list=session.selectList("memberListData",start);
		session.close();
		return list;
	}
//	<select id="memberTotalPage" resultType="int">
//		SELECT CEIL(COUNT(*)/10.0)
//		FROM member1
//		WHERE admin!='y'
//	</select>
	public int memberTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("memberTotalPage");
		session.close();
		return total;
	}
//	<update id="memberUpdate" parameterType="MemberVO">
//		UPDATE member1 SET
//		grade=#{grade}
//		WHERE id=#{id}
//	</update>
	public int memberUpdate(MemberVO vo) {
		SqlSession session=ssf.openSession();
		int count=session.update("memberUpdate",vo);
		session.commit();
		session.close();
		return count;
	}
	/*
	    *   <update id="reserveAdminOk" parameterType="int">
			    UPDATE reserve SET
			    ok='y'
			    WHERE rno=#{rno}
			  </update>
	    */
	   public static void reserveAdminOk(int rno)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("reserveAdminOk",rno);
		   session.close();
	   }
}
