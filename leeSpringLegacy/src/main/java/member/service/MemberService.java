package member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	public MemberDTO findPwdByEmail(Map<String, String> map);

	public MemberDTO findPwdByPhone(Map<String, String> map);

	public MemberDTO findMemberByID(String member_id);

	public void tempPwdByEmail(HttpSession httpSession, String member_id);

	public void updatePwdAndRank(MemberDTO memberDTO);

	public void tempPwdByPhone(HttpSession httpSession, String member_id);

	public List<MemberDTO> getMember(Map<String, String> map);




}
