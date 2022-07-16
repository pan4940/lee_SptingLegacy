package com.lee.thec.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	
	PasswordAuthentication account;
	
	//회원에게 메일 보낼 시, 전솔자 정보
    public MyAuthentication(){
    	//이메알 아이디
        String id = "";
        //이메일 비밀번호
        String pw = "";
        account = new PasswordAuthentication(id, pw);
    }
 
    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}
