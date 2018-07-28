package com.flower.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
public class MailUtils {
	 public static final String HOST = "smtp.163.com";  
	 public static final String PROTOCOL = "smtp";     
	 public static final int PORT = 25;  
	 public static final String FROM = "****@163.com";//发件人的email  
	 public static final String PWD = "****";//发件人密码  
	public static void sendMail(String email,String emailMsg) throws AddressException, MessagingException{
	
		
		Properties props = new Properties();
//		// 设置发送的协议
//		props.setProperty("mail.transport.protocol", "SMTP");
//
//		// 设置发送邮件的服务器
//		props.setProperty("mail.host", "localhost");
//		props.setProperty("mail.smtp.auth", "true");// 指定验证为true
		 props.put("mail.smtp.host", HOST);//设置服务器地址  
		 props.put("mail.store.protocol" , PROTOCOL);//设置协议  
		 props.put("mail.smtp.port", PORT);//设置端口  
		 props.put("mail.smtp.auth" , true);  

		
		// 创建验证器
		Authenticator auth= new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				//设置发送人的帐号和密码
				return new PasswordAuthentication(FROM,PWD);
			}
		};
		
		Session session=Session.getInstance(props,auth);
		//创建message，他相当于是邮件内容
		Message message=new MimeMessage(session);
		//设置发送者
		message.setFrom(new InternetAddress(FROM));

		//设置发送方式与接收者
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); 

		message.setSubject("鲜花网站账号激活");
		message.setContent(emailMsg,"text/html;charset=utf-8");
		//发送邮件
		Transport.send(message);
		
	}

}
