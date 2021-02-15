package com.jns.common;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GoogleMailSend {

	public void googleMailSend( String mailSubject
								  ,String sendMail
								  ,String sendPw
								  ,String receiveMail
								  ,String sendMsg) {
		
		System.out.println("googleMailSend mailSubject >>> : " + mailSubject);
		System.out.println("googleMailSend sendMail >>> : " + sendMail);
		System.out.println("googleMailSend sendPw >>> : " + sendPw);
		System.out.println("googleMailSend receiveMail >>> : " + receiveMail);
		System.out.println("googleMailSend sendMsg >>>> : " + sendMsg);
		
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable","true");
		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.host","smtp.gmail.com");
		// 이메일 방솔을 처리해줄 SMTP서버
		prop.put("mail.smtp.auth","true");
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.port","587");
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		
		//gmail password 
		Authenticator auth = new GoogleMailAuth();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try{
			
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("fullsleeeep@gmail.com", "MvcMemberAdmin"));
			InternetAddress to = new InternetAddress(receiveMail);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setText(sendMsg, "UTF-8");
			Transport.send(msg);
			
		}catch(AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		}catch(MessagingException me) {
			System.out.println("MessageException : " + me.getMessage());
		}catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
	
}
