package admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lee.thec.file.bean.FileDTO;
import com.lee.thec.product.bean.ProductCategoryDTO;
import com.lee.thec.product.bean.ProductDTO;
import com.lee.thec.product.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	
	@Autowired
	private ProductService productService;
	
	// 관리자화면 이동
	@GetMapping("/index")
	public String getIndex() {
		log.info("admin page........");
		return "/admin/index";
	}
	
	// 상품화면 이동
	@GetMapping("/products")
	public String products(Model model) {
		log.info("admin page........");
		model.addAttribute("list", productService.getBrandsCategoryList());
		return "/admin/products";
	}
	
	@GetMapping("/addProduct")
	public String addProducts(Model model) {
		log.info("admin page........");
		model.addAttribute("list", productService.getBrandsCategoryList());
		return "/admin/addProduct";
	}
	
	@GetMapping("/editProduct")
	public String editProducts(@RequestParam String product_num, Model model) {
		log.info("admin page........");
		model.addAttribute("ProductCategoryDTO", productService.getProductByProductNum(product_num));
		return "/admin/editProduct";
	}
	
	@GetMapping("/addCategory")
	public String addCategory() {
		log.info("admin page........");
		return "/admin/addCategory";
	}
	
	@GetMapping("/productSize")
	public String productSize() {
		log.info("admin page........");
		return "/admin/productSize";
	}
	
	
	//브랜드 카테고리 등록
	@PostMapping("/registerBrandCategory")
	@ResponseBody
	public void registerBrandCategory(@ModelAttribute ProductCategoryDTO productCategoryDTO) {
		System.out.println(productCategoryDTO);
		productService.createBrandCategorySelectKey(productCategoryDTO);
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
	
	
	//카테고리 코드로 상품검색
	@PostMapping("/getProductByCategory")
	@ResponseBody
	public List<ProductDTO> getProductByCategory(@RequestParam Map<String, String> map) {
		System.out.println("getProductByCategory: " + map);
		
		if (map.get("cateCode1").equals(map.get("cateCode2"))) {
			map.replace("cateCode2", map.get("cateCode2"), "");
		} else if (map.get("cateCode2").equals(map.get("cateCode3"))) {
			map.replace("cateCode3", map.get("cateCode3"), "");
		}
		System.out.println("after getProductByCategory: " + map);
		List<ProductDTO> list = productService.getProductByCategory(map);
		for (ProductDTO productDTO : list) {
			List<FileDTO> productFileList = productService.getProductFileList(productDTO.getProduct_num());
			productDTO.setFileList(productFileList);
		}
		
		return list;
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@PostMapping("/deleteProducts")
	@ResponseBody
	public void delete(@RequestParam String[] product_num) {
		for (int i = 0; i < product_num.length; i++) {
			productService.delete(Integer.parseInt(product_num[i]));
		}
	}
	
	// 회원관리 이동
	@GetMapping("/accounts")
	public String accounts() {
		log.info("admin page........");
		return "/admin/accounts";
	}	
	
	
	//상품 모델 등록. 사이즈까지 처리
	@PostMapping("/productRegister")
	@ResponseBody
	@Transactional(rollbackFor = {Exception.class})
	public void delete(@ModelAttribute ProductDTO productDTO) {
		System.out.println(productDTO);
		productService.productRegister(productDTO);
		//사이즈 등록
		productService.registerProductSize(productDTO);
	}
	
	
}
