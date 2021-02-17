package com.jns.member.security.password;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoder {

	// 혹시 몰라 따로 뺴놓은 것
	// 비밀번호 암호화 type BCrypt
	public static String pwEncoder(String password) {

		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

		String pw1 = pwEncoder.encode(password);

		return pw1;
	}

	// 비밀번호 매칭
	public static boolean pwMatches(String password) {

		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

		boolean bool = pwEncoder.matches(password, pwEncoder(password));
		
		System.out.println(bool);
		
		return bool;
	}

}