package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.NoticeVO;

public class NoticeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<insert id="noticeInsert" parameterType="NoticeVO">
//		INSERT INTO notice(np,type,subject,content)
//		VALUES(notice_no_seq.nextVal,#{type},#{subject},#{content})
//	</insert>
	public void noticeInsert(NoticeVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("noticeInsert",vo);
		session.commit();
		session.close();
	}
//	<select id="noticeListData" resultType="NoticeVO" parameterType="int">
//		SELECT no,type,name,subject,TO_CHAR(regdate,'yyyy-mm-dd') AS dbday, hit
//		FROM notice
//		ORDER BY no DESC
//		OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
//	</select>
	public List<NoticeVO> noticeListData(int start){
		SqlSession session=ssf.openSession();
		List<NoticeVO> list=session.selectList("noticeListData",start);
		session.close();
		return list;
	}
//	<select id="noticeTotalPage" resultType="int">
//		SELECT CEIL(COUNT(*)/10.0)
//		FROM notice
//	</select>
	public int noticeTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("noticeTotalPage");
		session.close();
		return total;
	}
}
