package com.care.root.join.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
	JavaMailSender mailSerder;
	public void sendMail(String to,String title,String body) {
		MimeMessage message=mailSerder.createMimeMessage();
		try {
			MimeMessageHelper messageHelper=
					new MimeMessageHelper(message,true,"utf-8");
			messageHelper.setSubject(title);
			messageHelper.setTo(to);
			messageHelper.setText(body,true);
			mailSerder.send(message);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String rand() {
		Random ran=new Random();
		String str="";
		int num;
		while(str.length()<=10) {
			num=ran.nextInt(75)+48;
			if((num>=48 && num<=57 ) || (num>=64 && num<=90) ||(num>=97 && num<=122)) {
				str+=num;
			}
		}
		return str;
	}
}
