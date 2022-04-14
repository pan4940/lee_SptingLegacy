package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.bean.GoodsCategoryDTO;
import admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자화면 이동
	@GetMapping("/index")
	public String adminView() {
		return "/admin/index";
	}
	
	
	
	/* 상품의 카테고리 */
	//카테고리 관리 페이지 이동
	@GetMapping("/goods/category")
	public String goodsCategory() {
		return "/product/category";
	}
	
	
	
	/* 상품관련항목 */
	// 상품 등록 페이지 이동
	@GetMapping("/goods/register")
	public String goodsRegister() {
		return "/admin/goods/register";
	}
	
	
	
	// 상품 등록
	//상품 관련 테이블 및 구조가 있어야 할 것
	
	
	// 상품 목록 페이지 이동
	@GetMapping("/goods/list")
	public String goodsList() {
		return "/admin/goods/list";
	}
	
	
	// 상품 조회
	
	
	// 상품 수정 
	
	
	// 상품 수정
	
	
	// 상품 삭제
	
	// ck 에디터에서 파일 업로드
	
	
	/* 주문관련항목 */
	//주문목록 페이지 이동
	@GetMapping("/shop/orderList")
	public String orderList() {
		return "/admin/shop/orderList";
	}
	
	
	// 주문 목록 가져오기
	

	
	// 주문 상세 목록 페이지 이동
	@GetMapping("/shop/orderView")
	public String orderView() {
		return "/admin/shop/orderView";
	}
	
	// 주문 상세 목록 가져오기
	
	// 주문 상세 목록 - 상태 변경
	
	
	
	/* 상품리뷰 관리 */
	// 모든 소감(댓글)
	@GetMapping("/shop/allReply")
	public String allReply() {
		return "/admin/shop/allReply";
	}

	// 모든 소감(댓글)
	
	
	/* 회원 관리 */
	
}