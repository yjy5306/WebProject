package thelecture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import thelecture.model.qnaBean;

@Repository
public class qnaDaoImpl {

	@Autowired
	private SqlSession session;
	
	public int insert(qnaBean qna) {
		System.out.println("c");
		return session.insert("qna_insert",qna);
	}
	
	public int count() throws Exception{
		int count = 0;	
		count = ((Integer) session.selectOne("qna_count")).intValue();
		return count;
	}
	
	public List<qnaBean> list(int page) throws Exception{
		return session.selectList("qna_list", page);
	}
	
	public void qna_upcount(int qna_num) {
		 session.update("qna_upcount", qna_num);
	}
	
	public qnaBean qna_read(int qna_num) {
		return session.selectOne("qna_read", qna_num);
	}
	
	public int qna_delete(int board_num) {
		return session.delete("qna_delete", board_num);
	}
}
