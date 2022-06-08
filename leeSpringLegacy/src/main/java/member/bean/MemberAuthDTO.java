package member.bean;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;

@Component
@Data
@AllArgsConstructor
public class MemberAuthDTO {
	private String member_id;
	private String authority;
	
	public MemberAuthDTO() {
	}
}
