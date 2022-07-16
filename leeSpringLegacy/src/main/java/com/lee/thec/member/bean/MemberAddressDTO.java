package com.lee.thec.member.bean;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;

@Component
@Data
@AllArgsConstructor
public class MemberAddressDTO {
	private String address_id;
	private String member_id;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String orders;
	
	public MemberAddressDTO() {}
	
	
}
