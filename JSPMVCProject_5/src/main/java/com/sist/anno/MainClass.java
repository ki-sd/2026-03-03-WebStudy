package com.sist.anno;
import java.util.*;

public class MainClass {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.print("메뉴: 맛집(1),상품(2),댓글(3),회원(4):");
		int menu=sc.nextInt();
		switch(menu){
			case 1->{
				System.out.print("기능선택: 목록(1),상세(2)");
				int m=sc.nextInt();
				FoodModel model=new FoodModel();
				if(m==1) {
					model.food_list();
				}else if (m==2){
					model.food_detail();
				}
			}
			case 2->{
				
			}
			case 3->{
				
			}
			case 4->{
				
			}
		}
	}
	
}
