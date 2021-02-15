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

	public boolean googleMailSend( String mailSubject
								  ,String sendMail
								  ,String sendPw
								  ,String receiveMail
								  ,String sendMsg) {
	
		boolean bool = true;
		System.out.println("googleMailSend mailSubject >>> : " + mailSubject);
		System.out.println("googleMailSend sendMail >>> : " + sendMail);
		System.out.println("googleMailSend sendPw >>> : " + sendPw);
		System.out.println("googleMailSend receiveMail >>> : " + receiveMail);
		System.out.println("googleMailSend sendMsg >>>> : " + sendMsg);
		
		Properties prop = System.getProperties();
		prop.out("mail.smtp.starttls.enable","true");
		prop.out("mail.smtp.host","stmp.gmail.com");
		prop.out("mail.smtp.auth","true");
		prop.out("mail.smtp.port","537");
		
		//gmail password 
		Authenticator auth = new GoogleMailAuth(sendMail, sendPw);
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try(){
			
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(sendMail, mailSubject));
			InternetAddress to = new InternetAddress(receiveMail);
			msg.setRecepient(Message.RecipientType.TO, to);
			msg.setText(sendMsg, "UTP-8");
			Transport.send(msg);
			
			bool true;
		}catch(AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		}catch(MessageException me) {
			System.out.println("MessageException : " + me.getMessage());
		}catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
		return bool;
	}
	
}
