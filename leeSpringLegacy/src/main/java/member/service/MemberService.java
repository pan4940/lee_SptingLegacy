package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {
	
	//회원가입시 아이디 중복체크
	public MemberDTO checkId(String member_id);

	//로그인
	public MemberDTO loginOK(Map<String, String> map);
	
	//회원가입
	public void join(MemberDTO memberDTO);

	public void modifyOK(MemberDTO memberDTO);

	public MemberDTO findIdEmail(Map<String, String> map);

	public MemberDTO findIdPhone(Map<String, String> map);


}
