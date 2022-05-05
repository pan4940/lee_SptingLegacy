package member.bean;


import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberRankDTO {
	private int rank_num;
	private String rank_name;
}
