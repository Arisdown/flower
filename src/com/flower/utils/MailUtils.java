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
	 public static final String FROM = "****@163.com";//�����˵�email  
	 public static final String PWD = "****";//����������  
	public static void sendMail(String email,String emailMsg) throws AddressException, MessagingException{
	
		
		Properties props = new Properties();
//		// ���÷��͵�Э��
//		props.setProperty("mail.transport.protocol", "SMTP");
//
//		// ���÷����ʼ��ķ�����
//		props.setProperty("mail.host", "localhost");
//		props.setProperty("mail.smtp.auth", "true");// ָ����֤Ϊtrue
		 props.put("mail.smtp.host", HOST);//���÷�������ַ  
		 props.put("mail.store.protocol" , PROTOCOL);//����Э��  
		 props.put("mail.smtp.port", PORT);//���ö˿�  
		 props.put("mail.smtp.auth" , true);  

		
		// ������֤��
		Authenticator auth= new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				//���÷����˵��ʺź�����
				return new PasswordAuthentication(FROM,PWD);
			}
		};
		
		Session session=Session.getInstance(props,auth);
		//����message�����൱�����ʼ�����
		Message message=new MimeMessage(session);
		//���÷�����
		message.setFrom(new InternetAddress(FROM));

		//���÷��ͷ�ʽ�������
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); 

		message.setSubject("�ʻ���վ�˺ż���");
		message.setContent(emailMsg,"text/html;charset=utf-8");
		//�����ʼ�
		Transport.send(message);
		
	}

}
