package com.jns.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleMailAuth extends Authenticator {

	PasswordAuthentication pa;
	
	public GoogleMailAuth() {
		
		String mail_id = ""; // mail ID
		String mail_pw = ""; // mail PW
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public GoogleMailAuth(String sendMail, String sendPw) {
		
		System.out.println("GoogleMailAuth sendMail >>> : " + sendMail);
		System.out.println("GoogleMailAuth sendPw >>> : " + sendPw);
		
		// mail, pw (gmail)
		pa = new PasswordAuthentication(sendMail, sendPw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		
		return pa;
		
		/* 
		 * public PasswordAuthentication getPasswordAuthentication() {	
		 *		return pa;
		 * 
		 *  Authenticator를 사용하기 위해서는 PasswordAuthenticator 클래스로부터 
		 *  인스턴스를 생성하고 getPasswordAuthentication 메소드로 리턴받아야 한다.
		 *  PasswordAuthentication 클래스는 사용자의 
		 *  ***아이디와 패스워드를 입력받아 반환하도록 재정의한다.***
		 */	
	}
}
