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
	private String tel1;
	private String tel2;
	private String tel3;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private String email_check;
	private Date joinDate;
	private Date updateDate;
	private int mileage;
}
