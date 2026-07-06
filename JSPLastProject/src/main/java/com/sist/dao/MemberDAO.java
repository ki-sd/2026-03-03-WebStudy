package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.MemberVO;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<insert id="memberInsert" parameterType="MemberVO">
//	INSERT INTO member1 VALUES(
//		#{id},
//		#{pwd},
//		#{name},
//		#{sex},
//		#{birthday},
//		#{email},
//		#{post},
//		#{addr1},
//		#{addr2},
//		#{phone},
//		#{content},
//		'n',SYSDATE
//	)
//	</insert>
	public void memberInsert(MemberVO vo) {
		try(SqlSession session=ssf.openSession()) {
			session.insert("memberInsert",vo);
			session.commit();
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
//	<select id="memberIdCheck" resultType="int" parameterType="string">
//		SELECT COUNT(*)
//		FROM member1
//		WHERE id=#{id}
//	</select>
	public int memberIdCheck(String id) {
		int count=0;
		try(SqlSession session=ssf.openSession()) {
			count=session.selectOne("memberIdCheck",id);
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
//	<select id="memberGetPassword" resultType="MemberVO" parameterType="string">
//		SELECT id,pwd,name,sex,phone,email,post,addr1,addr2,admin
//		FROM member1
//		WHERE id=#{id}
//	</select>
	public MemberVO isLogin(String id) {
		MemberVO vo=new MemberVO();
		try(SqlSession session=ssf.openSession()) {
			vo=session.selectOne("memberGetPassword",id);
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
}
