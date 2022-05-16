package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import order.service.OrderService;
import product.bean.DetailProductDTO;
import product.bean.ProductDTO;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@PostMapping("/addCart")
	@ResponseBody
	public void addCart(String product_size_id) {
		System.out.println("product_size_id : " + product_size_id);
	}
	
	
	
	@GetMapping("/cart")
	public String cart(Model model) {
		model.addAttribute("display", "/WEB-INF/views/order/cart.jsp");
		return "index";
	} 
	
	
	@PostMapping("/getCartList")
	@ResponseBody
	//productSizeList는 해당 사이즈만 얻게끔 설정
	public List<ProductDTO> getCartList(HttpSession httpSession) {
		//MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("memberDTO");
		//String member_id = memberDTO.getMember_id();
		String member_id = "rlatjdgus";
		List<ProductDTO> list = orderService.getCartList(member_id);
		System.out.println(list);
		return list;
	}
	
}
