package product.controller;

import java.util.List;
import java.util.Map;

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

import board.bean.BoardDTO;
import file.bean.FileDTO;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;
import product.service.ProductService;

@Controller
@RequestMapping(value = "/product", method = {RequestMethod.GET, RequestMethod.POST})
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	/* 상품의 카테고리 */
	//카테고리 관리 페이지 이동
	@GetMapping("/categoryForm")
	public String productCategory() {
		return "/product/category";
	}
	
	//카테고리 목록 반환
	@PostMapping("/getProductCategoryList")
	@ResponseBody
	public List<ProductCategoryDTO> getProductCategoryList() {
		List<ProductCategoryDTO> list = productService.getProductCategoryList();
		//System.out.println(list);
		return list;
	}
	
	
	//하나의 ProductCategoryDTO 반환
	@PostMapping("/getProductCategoryDTO")
	@ResponseBody
	public ProductCategoryDTO  getProductCategoryDTO(@RequestParam int product_category_num) {
		System.out.println("product_category_num : " + product_category_num);
		ProductCategoryDTO productCategoryDTO = productService.getProductCategoryDTO(product_category_num);
		System.out.println("productCategoryDTO : " + productCategoryDTO);
		return productCategoryDTO;
	}
	
	//카테고리 목록 반환
	@PostMapping("/getBrandsCategoryList")
	@ResponseBody
	public List<ProductCategoryDTO> getBrandsCategoryList() {
		List<ProductCategoryDTO> list = productService.getBrandsCategoryList();
		System.out.println(list);
		return list;
	}
	
	//브랜드 카테고리 생성
	@PostMapping("/createBrandCategory")
	public String createbrandCategory(@ModelAttribute ProductCategoryDTO productCategoryDTO) {
		productCategoryDTO.setProduct_category_num_ref(10000);
		System.out.println("productCategoryDTO : " + productCategoryDTO);
		
		productService.createBrandCategorySelectKey(productCategoryDTO);
		return "/product/category";
	}
	
	
	//브랜드 카테고리 수정
	@PostMapping("/modifyBrandCategory")
	public String modifyBrandCategory(@ModelAttribute ProductCategoryDTO productCategoryDTO) {
		productCategoryDTO.setProduct_category_num_ref(10000);
		System.out.println("productCategoryDTO : " + productCategoryDTO);
		
		productService.modifyBrandCategory(productCategoryDTO);
		return "/product/category";
	}
	
	
	
	
	
	/* 상품관련항목 */
	// 상품 등록 페이지 이동
	@GetMapping("/registerForm")
	public String productRegisterForm() {
		return "/product/register";
	}
	
	
	// 상품 등록
	//상품 관련 테이블 및 구조가 있어야 할 것
	@PostMapping("/register")
	public String productRegister(@ModelAttribute ProductDTO productDTO) {
		
		String brandname = productService.getBrandnameByBrandcategory(productDTO.getBrandCategory());
		productDTO.setBrand_name(brandname);
		System.out.println("register ProductDTO : " + productDTO);
		productService.productRegister(productDTO);
		
		return "/product/register";
	}
	
	// 브랜드명으로 상품목록 페이지 이동
	@GetMapping("/list-brand")
	public String moveListBrand(@RequestParam int product_category_num, Model model) {
		//List<ProductDTO> productDTOs = productService.getProductsByBrandCategory(product_category_num);
		model.addAttribute("product_category_num", product_category_num);
		model.addAttribute("display", "/WEB-INF/views/product/list-brand.jsp");
		return "index";
		
		//return "/product/list-brand";
	}
	
	@PostMapping("/getProductsByBrandCategory")
	@ResponseBody
	public List<ProductDTO> getProductsByBrandCategory(@RequestParam int product_category_num, Model model) {
		return productService.getProductsByBrandCategory(product_category_num);
	}
	
	
	// 상품 수정 페이지 이동
	@PostMapping("/modifyForm")
	public String modifyForm() {
		return "/product/modify";
	}
	
	//상품명으로 상품 검색
	@PostMapping("/search")
	@ResponseBody
	public ProductDTO searchProductName(String product_name) {
		System.out.println("search product_name: " + product_name);
		return productService.searchProductName(product_name);
	}
	
	
	//카테고리 코드로 상품검색
	@PostMapping("/getProductByCategory")
	@ResponseBody
	public List<ProductDTO> getProductByCategory(@RequestParam Map<String, String> map) {
		System.out.println("search category : " + map);
		
		if (map.get("cateCode1").equals(map.get("cateCode2"))) {
			map.replace("cateCode2", map.get("cateCode2"), "");
		} else if (map.get("cateCode2").equals(map.get("cateCode3"))) {
			map.replace("cateCode3", map.get("cateCode3"), "");
		}
		List<ProductDTO> list;
		System.out.println("after search category : " + map);
		
		list = productService.getProductByCategory(map);
		for (ProductDTO productDTO : list) {
			System.out.println("productDTO : " + productDTO);
			List<FileDTO> productFileList = productService.getProductFileList(productDTO.getProduct_num());
			System.out.println("fileList : " + productFileList);
			productDTO.setFileList(productFileList);
		}
		
		System.out.println("list : " + list);
		return list;
	}
	
	
	@PostMapping("/getProductByProductNum")
	@ResponseBody
	public ProductDTO getProductByProductNum(String product_num) {
		ProductDTO productDTO = productService.getProductByProductNum(product_num);
		
		List<FileDTO> list = productService.getProductFileList(productDTO.getProduct_num());
		System.out.println(list);
		productDTO.setFileList(list);
		System.out.println(productDTO);
		return productDTO;
	}
	
	//개별 상품 패이지 조회
	//category_num, product_num, pageNum, amount넘겨받음. 
	@GetMapping("/detail")
	public String get(@RequestParam Map<String, String> map, Model model) {
		
		System.out.println("get map : " + map);
		int product_num = Integer.parseInt(map.get("product_num")) ;
		
		model.addAttribute("map", map);
		model.addAttribute("display", "/WEB-INF/views/product/detail.jsp");
		return "index";
	}
	
	@PostMapping("/getProductDTO")
	@ResponseBody
	public ProductDTO getProductDTO(@RequestParam int product_num) {
		
		return productService.getProductDTO(product_num);
	}
	
	//상품의 첨부파일 불러옴
	@PostMapping("/getFileList")
	@ResponseBody
	public List<FileDTO> getFileList(int product_num) {
		System.out.println("getFileList...........");
		return productService.getProductFileList(product_num);
	}
	
	
	
	@PostMapping("/modify")
	public void modify(@ModelAttribute ProductDTO productDTO) {
		System.out.println("modify productDTO : " + productDTO);
		productService.modify(productDTO);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public void delete(@RequestParam String[] checkProduct_num) {
		for (String string : checkProduct_num) {
			System.out.println("delete product_num : " + string);
			productService.delete(Integer.parseInt(string));
		}
		
	}
	
	@GetMapping("/brands")
	public String brands(Model model) {
		model.addAttribute("display", "/WEB-INF/views/product/brands.jsp");
		return "index";
	}
	
}
