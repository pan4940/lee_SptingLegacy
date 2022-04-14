package member.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	private String member_id;
	private int rank_num;
	private String member_pwd;
	private String member_name;
	private int zipcode;
	private String addr1;
	private String addr2;
	private int tel;
	private int phone;
	private String email;
	private String email_check;
	private Date joinDate;
	private Date updateDate;
	private int mileage;
	
}
