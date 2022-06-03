package member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import member.bean.MemberDTO;
import member.bean.MemberRankDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO getMemberDtoByMemberId(String member_id);

	public MemberDTO loginOK(Map<String, String> map);

	public void join(MemberDTO memberDTO);

	public void modifyOK(MemberDTO memberDTO);

	public MemberDTO findIdEmail(Map<String, String> map);

	public MemberDTO findIdPhone(Map<String, String> map);

	public MemberDTO findPwdByEmail(Map<String, String> map);

	public MemberDTO findPwdByPhone(Map<String, String> map);

	public MemberDTO findMemberByID(String member_id);

	public void updatePwdAndRank(MemberDTO memberDTO);

	public List<MemberDTO> getMember(Map<String, String> map);

	public List<MemberRankDTO> getRankNum();

	public void memberGradeUpdate(Map<String, String> map);

	public MemberDTO kakaologin(String kakaoId);


}
