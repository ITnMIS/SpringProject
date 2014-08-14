package service;

import java.util.HashMap;
import java.util.List;
import model.CeventCommentModel;
import model.CeventModel;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import dao.CeventDao;

public class ChealthzService implements CeventDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	@Override
	public List<CeventModel> getBoardList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("chealthz.getBoardList", valueMap);
	}

	@Override
	public CeventModel getOneArticle(int idx) {
		return (CeventModel) sqlMapClientTemplate.queryForObject("chealthz.getOneArticle", idx);
	}

	@Override
	public List<CeventModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("chealthz.searchArticle", valueMap);
	}

	@Override
	public List<CeventCommentModel> getCommentList(int idx) {
		return sqlMapClientTemplate.queryForList("chealthz.getCommentList", idx);
	}

	@Override
	public boolean writeArticle(CeventModel cevent) {
		sqlMapClientTemplate.insert("chealthz.writeArticle", cevent);		
		return true;
	}

	@Override
	public boolean writeComment(CeventCommentModel comment) {
		sqlMapClientTemplate.insert("chealthz.writeComment", comment);
		return true;
	}

	@Override
	public void updateHitcount(int hitcount, int idx) {
		valueMap.put("hitcount", hitcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("chealthz.updateHitcount", valueMap);		
	}

	@Override
	public void updateRecommendCount(int recommendcount, int idx) {
		valueMap.put("recommendcount", recommendcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("chealthz.updateRecommendcount", valueMap);
		
	}
	@Override
	public int getTotalNum() {
		return (Integer) sqlMapClientTemplate.queryForObject("chealthz.getTotalNum");
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlMapClientTemplate.queryForObject("chealthz.getSearchTotalNum", valueMap);
	}

	@Override
	public void deleteComment(int idx) {
		sqlMapClientTemplate.delete("chealthz.deleteComment", idx);
	}
	
	@Override
	public void deleteArticle(int idx) {
		sqlMapClientTemplate.delete("chealthz.deleteArticle", idx);	
	}

	@Override
	public CeventCommentModel getOneComment(int idx) {
		return (CeventCommentModel) sqlMapClientTemplate.queryForObject("chealthz.getOneComment", idx);		
	}

	@Override
	public boolean modifyArticle(CeventModel cevent) {
		sqlMapClientTemplate.update("chealthz.modifyArticle", cevent);
		return true;
	}	
}
