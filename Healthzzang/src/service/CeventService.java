package service;

import java.util.HashMap;
import java.util.List;
import model.CeventCommentModel;
import model.CeventModel;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import dao.CeventDao;

public class CeventService implements CeventDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	@Override
	public List<CeventModel> getBoardList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("cevent.getBoardList", valueMap);
	}

	@Override
	public CeventModel getOneArticle(int idx) {
		return (CeventModel) sqlMapClientTemplate.queryForObject("cevent.getOneArticle", idx);
	}

	@Override
	public List<CeventModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);

		return sqlMapClientTemplate.queryForList("cevent.searchArticle", valueMap);
	}

	@Override
	public List<CeventCommentModel> getCommentList(int idx) {
		return sqlMapClientTemplate.queryForList("cevent.getCommentList", idx);
	}

	@Override
	public boolean writeArticle(CeventModel cevent) {
		sqlMapClientTemplate.insert("cevent.writeArticle", cevent);		
		return true;
	}

	@Override
	public boolean writeComment(CeventCommentModel comment) {
		sqlMapClientTemplate.insert("cevent.writeComment", comment);
		return true;
	}

	@Override
	public void updateHitcount(int hitcount, int idx) {
		valueMap.put("hitcount", hitcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("cevent.updateHitcount", valueMap);		
	}

	@Override
	public void updateRecommendCount(int recommendcount, int idx) {
		valueMap.put("recommendcount", recommendcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("cevent.updateRecommendcount", valueMap);
		
	}
	@Override
	public int getTotalNum() {
		return (Integer) sqlMapClientTemplate.queryForObject("cevent.getTotalNum");
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlMapClientTemplate.queryForObject("cevent.getSearchTotalNum", valueMap);
	}

	@Override
	public void deleteComment(int idx) {
		sqlMapClientTemplate.delete("cevent.deleteComment", idx);
	}
	
	@Override
	public void deleteArticle(int idx) {
		sqlMapClientTemplate.delete("cevent.deleteArticle", idx);	
	}

	@Override
	public CeventCommentModel getOneComment(int idx) {
		return (CeventCommentModel) sqlMapClientTemplate.queryForObject("cevent.getOneComment", idx);		
	}

	@Override
	public boolean modifyArticle(CeventModel cevent) {
		sqlMapClientTemplate.update("cevent.modifyArticle", cevent);
		return true;
	}	
}
