package security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import member.bean.MemberDTO;
import member.mapper.MemberMapper;
import security.domain.CustomUser;

public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("load user by username : " + username);
		
		MemberDTO memberDTO = memberMapper.getMemberDtoByMemberId(username);
		System.out.println("queried by member mapper : " + memberDTO);
		
		if (memberDTO == null) {
			return null;	
		}
		
		return new CustomUser(memberDTO);
	}

}
