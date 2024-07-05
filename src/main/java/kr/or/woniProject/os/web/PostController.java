package kr.or.woniProject.os.web;

import kr.or.woniProject.os.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("os")
public class PostController {

	@Autowired
	private PostService postService;
	@PostMapping("/")
	public String view(@RequestParam Map<String,Object> paraMaps, Model model){
//		List<Map<String,Object> > data = postService.selectPost(paraMaps);
//		model.addAttribute("postList",data);
		return "os/listView" ;
	}
//	 modelAndView는 옛방식으로 현재는 model을 선호한다.
	@GetMapping("/selectPost")
	public String selectPostList(@RequestParam Map<String,Object> paraMaps, Model model){
		List<Map<String,Object> > data = postService.selectPost(paraMaps);
		model.addAttribute("postList",data);
		return "os/listView" ;
	}



	@PostMapping("/search")
	public String searchPostByFormData (@RequestParam( name ="searchType") String searchType,
							  @RequestParam( name ="searchWord") String searchWord, Model model){
		Map<String,Object> paraMaps = new HashMap<>();
		paraMaps.put("searchType",searchType);
		paraMaps.put("searchWord",searchWord);
		System.out.println("paraMaps"+paraMaps);
		List<Map<String,Object> > data = postService.selectPost(paraMaps);
		model.addAttribute("postList",data);
		return "os/listView" ;
	}


	@PostMapping(value = "/detailView")
	@ResponseBody
	public Map<String,Object> selectDetailView(@RequestBody Map<String,Object> paraMaps){

		Map<String,Object> data = postService.detailView(paraMaps);
		Map<String,Object> result = new HashMap<>();
		result.put("data",data);
		return result ;
	}

	 @PostMapping(value = "/postSave")
	 @ResponseBody
	 public Map<String, Object> insertPost(@RequestBody Map<String,Object> paraMaps){
		Map<String, Object> result = new HashMap<>();
		int data =postService.insertPost(paraMaps);
		if(data>0){
			result.put("message","등록되었습니다.");
		}else{
			result.put("message","등록되지 않았습니다. 다시 시도해주세요");
		}
		 return result;
	 }




}
