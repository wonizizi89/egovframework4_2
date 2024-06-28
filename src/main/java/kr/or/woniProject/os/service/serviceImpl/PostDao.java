package kr.or.woniProject.os.service.serviceImpl;

import java.util.List;
import java.util.Map;

import kr.or.woniProject.cmmn.sys.dao.CmmnAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao extends CmmnAbstractMapper {

	public List<Map<String, Object>> selectPost (Map<String,Object> paramap){
		return selectList("os.Post.listView",paramap);
	}

	public Map<String, Object> detailView (Map<String,Object> paramap){
		return selectOne("os.Post.detailView",paramap);
	}
}
