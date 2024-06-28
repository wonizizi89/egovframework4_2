package kr.or.woniProject.os.service;

import java.util.List;
import java.util.Map;


public interface PostService {
	
	List<Map<String, Object>> selectPost (Map<String,Object> paraMaps);
	Map<String, Object> detailView (Map<String,Object> paraMaps);

}
