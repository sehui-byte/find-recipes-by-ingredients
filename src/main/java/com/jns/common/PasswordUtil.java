package com.jns.common;

import java.util.UUID;

public abstract class PasswordUtil {

	/*
	 * 자바 중복되지 않는 고유 키 
	 * UUID(Universally unique identifier)
	 * 숫자와 영어(소문자)만을 조합하여 임시비밀번호 생성
	 * 32개 문자 + '-' = 36개	   
	 */
	public static String tempPW(int len) {
		
		String u = UUID.randomUUID().toString();
		//System.out.println("u >>> : " + u);
		u = u.replace("-","").substring(0, len);
		System.out.println("u >>> : " + u);
		return u;
	}
	
	public static String randomPW(int len) {
		char c[] = {'1','2','3','4','5','6','7','8','9','0', 
		        	'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
		        	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
		        	'!','@','#','&'
		        	}; 
		String p = "";
		for (int i=0; i < len; i++) {
			int a = (int)(Math.random()*(c.length));
			p += c[a];
		}		
		return p;
	}
	
}
