package kr.or.woniProject.os.service.serviceImpl;


import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.woniProject.os.service.PostService;

/**
 * 전자정부 프레임 워크 사용 규칙
 * EgovAbstractServiceImpl 상속받아야한다. 
 * @author jeonghyewon
 *
 */
@Service
public class PostServiceImpl  extends EgovAbstractServiceImpl implements PostService {

	
	
	@Autowired
	private PostDao postDao; 
	@Override
	public List<Map<String, Object>> selectPost(Map<String, Object> paraMaps) {
		return postDao.selectPost(paraMaps);
	}


	@Override
	public Map<String, Object> detailView(Map<String, Object> paraMaps) {
		return postDao.detailView(paraMaps);
	}
}
