package member.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import member.bean.MemberDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO checkId(String member_id);

	public MemberDTO loginOK(Map<String, String> map);

	public void join(MemberDTO memberDTO);

	public void modifyOK(MemberDTO memberDTO);

	public MemberDTO findIdEmail(Map<String, String> map);

	public MemberDTO findIdPhone(Map<String, String> map);

}
