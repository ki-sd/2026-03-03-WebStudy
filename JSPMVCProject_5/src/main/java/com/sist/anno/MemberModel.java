package com.sist.anno;
@Controller
public class MemberModel {
	@RequestMapping("member/login.do")
	public void member_login() {
		System.out.println("member_login() Call..");
	}
	@RequestMapping("member/join.do")
	public void member_join() {
		System.out.println("member_join() Call..");
	}
}
