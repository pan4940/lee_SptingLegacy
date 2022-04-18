package member.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public MemberDTO checkId(String member_id) {
		return memberMapper.checkId(member_id);
	}
	
	@Override
	public MemberDTO loginOK(Map<String, String> map) {
		return memberMapper.loginOK(map);
	}
	
	@Override
	public void join(MemberDTO memberDTO) {
		memberMapper.join(memberDTO);
	}
	
	@Override
	public void modifyOK(MemberDTO memberDTO) {
		memberMapper.modifyOK(memberDTO);
	}
	
	@Override
	public MemberDTO findIdEmail(Map<String, String> map) {
		return memberMapper.findIdEmail(map);
	}
	
	@Override
	public MemberDTO findIdPhone(Map<String, String> map) {
		return memberMapper.findIdPhone(map);
	}
	
	@Override
	public MemberDTO findPwdByEmail(Map<String, String> map) {
		return memberMapper.findPwdByEmail(map);
	}
	
	@Override
	public MemberDTO findPwdByPhone(Map<String, String> map) {
		return memberMapper.findPwdByPhone(map);
	}
	
	@Override
	public MemberDTO findMemberByID(String member_id) {
		return memberMapper.findMemberByID(member_id);
	}
	
	@Override
	public void tempPwdByEmail(HttpSession httpSession, String member_id) {
		// TODO Auto-generated method stub
		
	}
}
