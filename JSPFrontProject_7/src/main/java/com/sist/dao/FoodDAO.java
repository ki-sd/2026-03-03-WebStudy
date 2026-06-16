package com.sist.dao;


import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.FoodVO;

/*
 * 		food/list.do
 *          | =============> 찾기 @WebServlet("*.do")
 *      DispatcherServlet
 *          => 모든 요청을 받아서 => Model을 찾아주는 역할
 *          => Model에서 수행된 결과를 JSP로 전송
 *          |
 *       Model에서 메서드를 찾는다
 *       ------------------- @RequestMapping("main/main.do")
 *                           @RequestMappint("food/list.do")
 *                           => 메서드
 *                              처리 => request.setAttribute()
 *          |
 *      DispatcherServlet
 *          |
 *       request를 전송 => 출력할 JSP를 찾아서 전송
 *                       ------------------
 *                       | => request 전송
 *                            return "../food/list.jsp"
 *                       | => request 초기화 => 화면이동
 *                            return "redirect:list.do"
 *                       | => Ajax를 이용한 방식
 *                            void => JSON 전송
 *      => Model클래스 전체를 찾는다 : 싱글턴 패턴 / Factory 패턴
 *      => 클래스 메모리 할당 @Autowired
 *      => @ResponseBody => getParameter() 없이 전송한 모든 데이터를 받을 수 있다
 */
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	<select id="foodListData" resultType="FoodVO" parameterType="int">
		SELECT fno,name,poster,address
		FROM food
		ORDER BY fno ASC
		OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	</select>
	<select id="foodTotalPage" resultType="int">
		SELECT CEIL(COUNT(*)/12.0)
		FROM food
	</select>
	<select id="foodDetailData" resultType="FoodVO" parameterType="int">
		SELECT *
		FROM food
		WHERE fno=#{fno}
	</select>
	 */
	public static List<FoodVO> foodListData(int start){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodListData",start);
		session.close();
		return list;
	}
	public static int foodTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodTotalPage");
		session.close();
		return total;
	}
	public static FoodVO foodDetailData(int fno) {
		SqlSession session=ssf.openSession();
		FoodVO vo=session.selectOne("foodDetailData",fno);
		session.close();
		return vo;
	}
//	<select id="foodFindData" resultType="FoodVO" parameterType="hashmap">
//	SELECT fno,name,poster,address
//	FROM food
//	WHERE ${column} LIKE '%'||#{fd}||'%'
//	ORDER BY fno ASC
//	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
//	</select>
	public static List<FoodVO> foodFindData(Map map){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodFindData",map);
		session.close();
		return list;
	}
	public static int foodFindTotalPage(Map map) {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodFindTotalPage",map);
		session.close();
		return total;
	}
}
