package member.bean;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;

@Component
@Data
@AllArgsConstructor
public class MemberAddressDTO {
	private String address_id;
	private String member_id;
	private int zipcode;
	private String addr1;
	private String addr2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String phone1;
	private String phone2;
	private String phone3;
	private String orders;
	
	public MemberAddressDTO() {}
	
	public String getTotalTel() {
		return tel1 + tel2 + tel3;
	}
	
	public String getTotalPhone() {
		return phone1 + phone2 + phone3;
	}
}
