package com.sist.jsp;

public class jspChange {
	private static String[] jsp= {
		"",
		"../main/home.jsp",
		"../main/food/detail.jsp",
		"databoard/list.jsp",
		"databoard/detail.jsp",
		"databoard/insert.jsp",
		"databoard/update.jsp",
		"databoard/delete.jsp"
	};
	public static String change(int mode) {
		return jsp[mode];
	}
}
