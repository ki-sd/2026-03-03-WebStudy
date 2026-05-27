package com.sist.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// <% %> : 자바 / HTML => 분리
//               => JSP
//         Model / View ==> MV구조 => <% %>가 남아있음 => Controller
// JSP => 태그형만 남긴다 (MVC)
/*
 * 
 * 
 */
public class DataVO {
	// 데이터 마이닝 => 꼬꼬마 (형태소 분석) => 라이브러리
	private String word;
	private int count;
}
