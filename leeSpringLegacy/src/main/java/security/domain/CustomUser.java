package security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import member.bean.MemberDTO;

@Getter
public class CustomUser extends User{
	
	private MemberDTO memberDTO;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDTO member) {
		super(member.getMember_id(), member.getMember_pwd(), 
				member.getMemberAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));
		this.memberDTO = member;
	}
	
	
}
