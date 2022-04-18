package member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	PasswordAuthentication account;
	 
    public MyAuthentication(){
        String id = "dltjdgh0204";
        String pw = "PKBZSX1KDRDY";
        account = new PasswordAuthentication(id, pw);
    }
 
    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}
