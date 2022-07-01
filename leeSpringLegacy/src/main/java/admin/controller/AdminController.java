package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import product.bean.ProductCategoryDTO;

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
	
	//브랜드 카테고리 수정
	@GetMapping("/modifyBrandCategory")
	public String modifyBrandCategoryForm(@RequestParam String product_category_num, Model model) {
		model.addAttribute("product_category_num", product_category_num);
		return "/admin/modifyBrandCategory";
	}
	
	//브랜드 카테고리 수정
	@PostMapping("/modifyBrandCategory")
	public String modifyBrandCategory(@ModelAttribute ProductCategoryDTO productCategoryDTO) {
		productCategoryDTO.setProduct_category_num_ref(10000);
		
		//productService.modifyBrandCategory(productCategoryDTO);
		return "/product/category";
	}

	// 회원관리 이동
	@GetMapping("/accounts")
	public String accounts() {
		log.info("admin page........");
		return "/admin/accounts";
	}	
	
}
