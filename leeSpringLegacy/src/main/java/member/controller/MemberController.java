package member.controller;

import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value = "/member", method = {RequestMethod.GET, RequestMethod.POST})
public class MemberController {
	
	@Autowired
	private MemberService memberService; 
	
	//로그인
	@GetMapping("/loginForm")
	public String loginForm(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/login.jsp");
		return "index";
	}
	@PostMapping("/loginOK")
	@ResponseBody
	public String loginOK(HttpSession httpSession, @RequestParam Map<String, String> map) {
		
		System.out.println("login map : " + map);
		MemberDTO memberDTO = memberService.loginOK(map);
		if (memberDTO != null) {
			httpSession.setAttribute("memberDTO", memberDTO);
			return "ok";
		} else {
			return "fail";
		}
	}
	
	//로그아웃
	@PostMapping("/logout")
	@ResponseBody
	public void logout(HttpSession httpSession) {
		httpSession.invalidate();
	}
	
	
	
	
	//회원가입
	@GetMapping("/joinForm")
	public String joinMemberForm(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/join.jsp");
		return "index";
	}
	@PostMapping("/join")
	public void join(@ModelAttribute MemberDTO memberDTO, Model model) {
		System.out.println("joinMemberDTO : "  + memberDTO);
		memberDTO.setRank_num(1);
		memberService.join(memberDTO);
		model.addAttribute("display", "/WEB-INF/views/member/join.jsp");
	}
	//회원가입시 아이디 중복체크
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(String member_id) {
		System.out.println("check member_id : " + member_id);
		MemberDTO memberDTO = memberService.checkId(member_id);
		
		if (memberDTO != null) {
			return "exist";
		} else {
			return "non_exist";
		}
	}
	
	
	//회원정보 페이지
	@GetMapping("/account")
	public String account(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/account.jsp");
		return "index";
	}
	
	
	//회원정보수정
	@GetMapping("/modifyForm")
	public String modifyMemberForm(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/modify.jsp");
		return "index";
	}
	
	@PostMapping("/modifyOk")
	public void modifyOK(@ModelAttribute MemberDTO memberDTO) {
		System.out.println("modify memberDTO : " + memberDTO);
		memberService.modifyOK(memberDTO);
	}
	
	//회원탈퇴
	public void deleteMember() {
		
	}
	
	
	
	//아이디 찾기
	@GetMapping("/findIdForm")
	public String findId(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/findId.jsp");
		return "index";
	}
	//이메일로 아이디 찾기
	@PostMapping("/findIdEmail")
	@ResponseBody
	public String findIdEmail(HttpSession httpSession, @RequestParam Map<String, String> map) {
		System.out.println("findIdEmail : " + map);
		MemberDTO memberDTO = memberService.findIdEmail(map);
		
		if (memberDTO != null) {
			httpSession.setAttribute("memId", memberDTO.getMember_id());
			httpSession.setAttribute("memName", memberDTO.getMember_name());
			httpSession.setAttribute("memOption", "Email");
			httpSession.setAttribute("memKeyword", memberDTO.getEmail());
			
			httpSession.setAttribute("memSys", memberDTO.getJoinDate());
			
			httpSession.setAttribute("memRank", memberDTO.getRank_num());
			return "emailok";
		} else {
			return "emailfail";
		}
	}
	
	//핸드폰 번호로 아이디 찾기
	@PostMapping("/findIdPhone")
	@ResponseBody
	public String findIdPhone(HttpSession httpSession, @RequestParam Map<String, String> map) {
		System.out.println("findIdPhone : " + map);
		MemberDTO memberDTO = memberService.findIdPhone(map);
		
		if (memberDTO != null) {
			httpSession.setAttribute("memId", memberDTO.getMember_id());
			httpSession.setAttribute("memName", memberDTO.getMember_name());
			httpSession.setAttribute("memOption", "휴대폰번호");
			httpSession.setAttribute("memKeyword", memberDTO.getPhone1() + memberDTO.getPhone2() + memberDTO.getPhone3());
			httpSession.setAttribute("memSys", memberDTO.getJoinDate());
			httpSession.setAttribute("memRank", memberDTO.getRank_num());
			
			return "phoneok";
		} else {
			return "phonefail";
		}
	}
	
	
	//아이디 찾기 결과
	@GetMapping("/findIdResult")
	public String findIdResult(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/findIdResult.jsp");
		return "index";
	}
	
	
	//비밀번호 찾기
	@GetMapping("/findPwdForm")
	public String findPwd(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/findPwd.jsp");
		return "index";
	}
	
	//ID, 이름, email로 비밀번호 찾기
	@PostMapping("/findPwdByEmail")
	@ResponseBody
	public String findPwdByEmail(HttpSession httpSession, @RequestParam Map<String, String> map) {
		System.out.println("findPwdByEmail : " + map);
		MemberDTO memberDTO = memberService.findPwdByEmail(map);
		System.out.println("findPwdByEmail memberDTO : " + memberDTO);
		
		if (memberDTO != null) {
			httpSession.setAttribute("memId", memberDTO.getMember_id());
			httpSession.setAttribute("memName", memberDTO.getMember_name());
			httpSession.setAttribute("memOption", "Email");
			httpSession.setAttribute("memKeyword", memberDTO.getPhone1() + memberDTO.getPhone2() + memberDTO.getPhone3());
			return "emailok";
		} else {
			return "emailfail";
		}
	}
	//e메일로 임시비밀번호 전송
	@PostMapping("/tempPwdByEmail")
	@ResponseBody
	public void tempPwdByEmail(HttpSession httpSession, @RequestParam String member_id) {
		System.out.println("tempPwdByEmail : " + member_id);
		
		memberService.tempPwdByEmail(httpSession, member_id);
		
	}
	//임시비밀번호 전송후 페이지이동
	@GetMapping("/tempAlert")
	public String tempalert(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/tempAlert.jsp");
		return "index";
	}
	
	
	//ID, 이름, phone으로 비밀번호 찾기
	@PostMapping("/findPwdByPhone")
	@ResponseBody
	public String findPwdByPhone(HttpSession httpSession, @RequestParam Map<String, String> map) {
		System.out.println("findPwdByPhone : " + map);
		MemberDTO memberDTO = memberService.findPwdByPhone(map);
		
		if (memberDTO != null) {
			httpSession.setAttribute("memId", memberDTO.getMember_id());
			httpSession.setAttribute("memName", memberDTO.getMember_name());
			httpSession.setAttribute("memOption", "Email");
			httpSession.setAttribute("memKeyword", memberDTO.getPhone1() + memberDTO.getPhone2() + memberDTO.getPhone3());
			return "phoneok";
		} else {
			return "phonefail";
		}
	}
	//휴대폰번호로 임시비밀번호 전송
	@PostMapping("/tempPwdByPhone")
	@ResponseBody
	public void tempPwdByPhone(HttpSession httpSession, @RequestParam String member_id) {
		System.out.println("tempPwdByPhone : " + member_id);
		
		memberService.tempPwdByPhone(httpSession, member_id);
		
	}
	
	
	//비밀번호 찾기 결과
	@GetMapping("/findPwdResult")
	public String findPwdResult(Model model) {
		model.addAttribute("display", "/WEB-INF/views/member/findPwdResult.jsp");
		return "index";
	}
	
	
	
	//회원정보객체 반환
	
	
	
	
	//로그인
	
	
	
	
	
}
