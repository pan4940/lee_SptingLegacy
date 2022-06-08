package member.bean;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	private String member_id;
	private String member_pwd;
	private String member_name;
	
	private String email;
	private String email_check;
	private Date joinDate;
	private Date updateDate;
	private int mileage;
	
	
	private List<MemberAddressDTO> addressDTOList;
	private List<MemberAuthDTO> memberAuthList;
	
	
	
}
