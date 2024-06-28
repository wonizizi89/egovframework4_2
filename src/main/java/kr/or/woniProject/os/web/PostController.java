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
	@GetMapping("/")
	public String view(@RequestParam Map<String,Object> paraMaps, Model model){
		List<Map<String,Object> > data = postService.selectPost(paraMaps);
		model.addAttribute("postList",data);
		return "os/listView" ;
	}
	// modelAndView는 옛방식으로 현재는 model을 선호한다.
	@GetMapping("/selectPost")
	public String selectPost(@RequestParam Map<String,Object> paraMaps, Model model){
		List<Map<String,Object> > data = postService.selectPost(paraMaps);
		model.addAttribute("postList",data);
		return "os/listView" ;
	}

	@PostMapping("/search")
	public String searchPost (@RequestParam( name ="searchType") String searchType,
							  @RequestParam( name ="searchWord") String searchWord, Model model){
		Map<String,Object> paraMaps = new HashMap<>();
		paraMaps.put("searchType",searchType);
		paraMaps.put("searchWord",searchWord);
		System.out.println("paraMaps"+paraMaps);
		List<Map<String,Object> > data = postService.selectPost(paraMaps);
		model.addAttribute("postList",data);
		return "os/listView" ;
	}

	@PostMapping(value = "/detailView", consumes = "application/json", produces = "application/json")
	@ResponseBody
	public Map<String,Object> detailView(@RequestBody Map<String,Object> paraMaps){

		Map<String,Object> data = postService.detailView(paraMaps);
		Map<String,Object> result = new HashMap<>();
		result.put("data",data);
		return result ;
	}

}
