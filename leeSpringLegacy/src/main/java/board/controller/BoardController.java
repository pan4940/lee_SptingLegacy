package board.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.bean.BoardDTO;
import board.bean.Criteria;
import board.bean.PageDTO;
import board.service.BoardService;
import file.bean.FileDTO;
import product.bean.ProductCategoryDTO;



@Controller
@RequestMapping(value = "/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	
	@Autowired
	private BoardService boardService; 
	
		
	//리스트 조회 및 출력
	@GetMapping("/list")
	public String list(@RequestParam Map<String, String> map, Model model) {
		System.out.println("list map : " + map);
		String board_category_num = map.get("board_category_num");
		if (Integer.parseInt(board_category_num) == 7) {
			System.out.println("board_category_num = 7 : " + map);
			
			List<BoardDTO> list = boardService.getPostList(Integer.parseInt(board_category_num));
			model.addAttribute("board_category_num", board_category_num);
			
			for (BoardDTO boardDTO : list) {
				boardDTO.setFileList(boardService.getFileList(boardDTO.getBoard_num()));
				System.out.println("boardDTO : " + boardDTO);
			}
			
			model.addAttribute("list", list);
			model.addAttribute("display", "/WEB-INF/views/board/post.jsp");
			return "index";
		
		} else {
			System.out.println("nav.jsp : " + map);
			String pageNum = map.get("pageNum");
			String amount = map.get("amount");
			
			Criteria criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
			
			List<BoardDTO> list = boardService.getListWithPaging(map);
			int total = boardService.getTotalCount(board_category_num);
			model.addAttribute("pageDTO", new PageDTO(criteria, total));
			model.addAttribute("board_category_num", board_category_num);
			model.addAttribute("list", list);
			
			model.addAttribute("display", "/WEB-INF/views/board/list.jsp");
			return "index";
		}
	}
	
	
	
	
	
	//원글작성
	@GetMapping("/writeForm")
	public String writeForm(@RequestParam Map<String, String> map, Model model) {
		model.addAttribute("map", map);
		model.addAttribute("display", "/WEB-INF/views/board/write.jsp");
		return "index";
		
	}
	
	@PostMapping("/write")
	public String write(@RequestParam Map<String, String> map, 
						@ModelAttribute BoardDTO boardDTO, 
						RedirectAttributes redirectAttributes) {
		
		System.out.println("map : " + map);
		
		//boardDTO.setPwd("11");
		System.out.println("boardDTO : " + boardDTO);
		
		int board_category_num = Integer.parseInt(map.get("board_category_num")); 
		
		if (board_category_num == 7) {
			List<FileDTO> list = boardDTO.getFileList();
			System.out.println("fileDTO list : " + list);
			
			boardService.write(boardDTO);
			redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
			return "redirect:/board/list";
		}
		
		boardService.writeSelectKey(boardDTO);
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", "1");
		redirectAttributes.addAttribute("amount", map.get("amount"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		
		redirectAttributes.addAttribute("display", "/WEB-INF/views/board/list.jsp");
		return "redirect:/board/list";
	}
	
	//게시물 조회
	//board_category_num, board_num, pageNum, amount넘겨받음. 
	@PostMapping("/get")
	public String get(@RequestParam Map<String, String> map, Model model) {
		
		System.out.println("get map : " + map);
		int board_category_num = Integer.parseInt(map.get("board_category_num"));
		int board_num = Integer.parseInt(map.get("board_num")) ;
		
		if (board_category_num == 7) {
			BoardDTO boardDTO = boardService.get(board_num);
			List<FileDTO> list = boardService.getFileList(board_num);
			boardDTO.setFileList(list);
			System.out.println("get boardDTO : " + boardDTO);
			
			model.addAttribute("map", map);
			model.addAttribute("boardDTO", boardDTO);
			
			model.addAttribute("display", "/WEB-INF/views/board/single.jsp");
			return "index";
		}
		
		
		BoardDTO boardDTO = boardService.get(board_num);
		model.addAttribute("map", map);
		model.addAttribute("boardDTO", boardDTO);
		
		model.addAttribute("display", "/WEB-INF/views/board/get.jsp");
		return "index";
		
		//return "/board/get";
	}
	
	
	
	
	//글 수정 페이지로 이동
	@PostMapping("/modifyForm")
	public String modifyForm(@RequestParam Map<String, String> map, Model model) {
		int board_category_num = Integer.parseInt(map.get("board_category_num"));
		BoardDTO boardDTO = boardService.get(Integer.parseInt(map.get("board_num")));
		if (board_category_num == 7) {
			boardDTO.setFileList(boardService.getFileList(boardDTO.getBoard_num()));
		}
		System.out.println("boardDTOpost : " + boardDTO);
		System.out.println("modifyForm map : " + map); 
		model.addAttribute("map", map);
		model.addAttribute("boardDTO", boardDTO);
		
		model.addAttribute("display", "/WEB-INF/views/board/modify.jsp");
		return "index";
		
		//return "/board/modify";
	}
	
	//글 수정
	@PostMapping("/modify")
	public String modify(@RequestParam Map<String, String> map, 
			@ModelAttribute BoardDTO boardDTO, 
			RedirectAttributes redirectAttributes) {
		System.out.println("modify boardDTO : " + boardDTO);
		boardService.modify(boardDTO);
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", map.get("pageNum"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		
		redirectAttributes.addAttribute("display", "/WEB-INF/views/board/list.jsp");
		return "redirect:/board/list";
		//return "index";
	}
	
	//답글 작성 페이지로 이동
	@PostMapping("/replyWriteForm")
	public String replyWriteForm(@RequestParam Map<String, String> map, Model model) {
		BoardDTO boardDTO = boardService.get(Integer.parseInt(map.get("board_num")));
		model.addAttribute("map", map);
		model.addAttribute("boardDTO", boardDTO);
		
		model.addAttribute("display", "/WEB-INF/views/board/reply.jsp");
		return "index";
	}
	
	@PostMapping("/boardReplyWrite")
	public String boardReplyWrite(@RequestParam Map<String, String> map, 
								  @ModelAttribute BoardDTO boardDTO,
								  RedirectAttributes redirectAttributes) {
		
		boardDTO.setParant_num(boardDTO.getBoard_num());
		System.out.println(boardDTO);
		boardDTO.setPwd("11");
		System.out.println("boardDTO : " + boardDTO);
		boardService.boardReplyWrite(boardDTO);
		
		//댓글 작성후 1페이지 이동
		//redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		//redirectAttributes.addAttribute("pageNum", 1);
		//redirectAttributes.addAttribute("amount", 10);
		
		//댓글 작성후 원글이 있는 페이지로 이동
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", map.get("pageNum"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		
		redirectAttributes.addAttribute("display", "/WEB-INF/views/board/list.jsp");
		return "redirect:/board/list";
		//return "index";
	}
	
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/delete")
	public String delete(@RequestParam Map<String, String> map, 
			//@ModelAttribute BoardDTO boardDTO, 
			RedirectAttributes redirectAttributes) {
		System.out.println(map);
		System.out.println("DeleteboardNum : " + map.get("board_num"));
		int board_num = Integer.parseInt(map.get("board_num")) ;
		List<FileDTO> fileList = boardService.getFileList(board_num);
		System.out.println(fileList);
		if (fileList != null) {
			System.out.println("fileList not null : " + fileList);
			deleteFiles(fileList);
		}
		
		boardService.delete(board_num);
		
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", map.get("pageNum"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		redirectAttributes.addAttribute("display", "/WEB-INF/views/board/list.jsp");
		//return "index";
		return "redirect:/board/list";
	}
	
	
	//게시물의 첨부파일 불러옴
	@PostMapping("/getFileList")
	@ResponseBody
	public List<FileDTO> getFileList(int board_num) {
		System.out.println("getFileList...........");
		return boardService.getFileList(board_num);
	}
	
	//게시물 삭제시 첨부파일 삭제
	
	public void deleteFiles(List<FileDTO> fileList) {
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		System.out.println("delete files.....");
		System.out.println("contoroller fileList : " + fileList);
		fileList.forEach(t -> {
			try {
				Path file = Paths.get("C:\\thec\\" + t.getUploadPath() + "\\" + t.getUuid() + "_" + t.getFileName());
				System.out.println(file);
				Files.deleteIfExists(file);
			} catch (IOException e) {
				System.out.println("delete file error " + e.getMessage());
			}
		});
	}
	
	//메인페이지 post 관련 메소드. 가장 최근에 등록한 post 정보. boardDTO가져온다. 
	
	@PostMapping("/getNewPost")
	@ResponseBody
	public BoardDTO getNewPost() {
		return boardService.getNewPost();
	}
	
	@PostMapping("/getProductReview")
	@ResponseBody
	public List<BoardDTO> getProductReview(@RequestParam int product_num) {
		return boardService.getProductReview(product_num);
	}
	
	
	@PostMapping("/secretForm")
	public String secret(@RequestParam Map<String, String> map, Model model) {
		System.out.println("secret: " + map);
		String rank_num = map.get("rank_num") != null? map.get("rank_num") : "0";
		String member_id = map.get("member_id") != null? map.get("member_id") : "";
		System.out.println("rank_num : " + rank_num);
		System.out.println("member_id : " + member_id);
		
		//int rank_num = Integer.parseInt(map.get("rank_num"));
		int board_num = Integer.parseInt(map.get("board_num"));
		BoardDTO boardDTO = boardService.get(board_num);
		System.out.println("boardDTO : " + boardDTO);
		if (Integer.parseInt(rank_num) == 3 || boardDTO.getMember_id().equals(member_id)||boardDTO.getBoard_category_num()==4) {
			System.out.println("관리자 혹은 글작성자");
			model.addAttribute("map", map);
			get(map, model);
			return "index";	
		} else {
			map.put("pwd", boardDTO.getPwd());
			model.addAttribute("map", map);
			model.addAttribute("display", "/WEB-INF/views/board/secret.jsp");
			return "/index";	
		}	
	}
	
	@PostMapping("/getNavPostBoardDTO")
	@ResponseBody
	public List<BoardDTO> getNavPostBoardDTO() {
		return boardService.getNavPostBoardDTO();
	}
}
