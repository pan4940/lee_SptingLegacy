package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	// 관리자화면 이동
	@GetMapping("/index")
	public String getIndex() {
		log.info("admin page........");
		return "/admin/index";
	}
	
	// 상품화면 이동
	@GetMapping("/products")
	public String products() {
		log.info("admin page........");
		return "/admin/products";
	}
	
	@GetMapping("/addProduct")
	public String addProducts() {
		log.info("admin page........");
		return "/admin/addProduct";
	}
	
	@GetMapping("/editProduct")
	public String editProducts() {
		log.info("admin page........");
		return "/admin/editProduct";
	}
	
	@GetMapping("/addCategory")
	public String addCategory() {
		log.info("admin page........");
		return "/admin/addCategory";
	}
	
	// 회원관리 이동
	@GetMapping("/accounts")
	public String accounts() {
		log.info("admin page........");
		return "/admin/accounts";
	}	
	
}
