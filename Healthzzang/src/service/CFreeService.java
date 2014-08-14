package service;

import java.util.HashMap;
import java.util.List;
import model.CeventCommentModel;
import model.CeventModel;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import dao.CeventDao;

public class CFreeService implements CeventDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	@Override
	public List<CeventModel> getBoardList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("cfree.getBoardList", valueMap);
	}

	@Override
	public CeventModel getOneArticle(int idx) {
		return (CeventModel) sqlMapClientTemplate.queryForObject("cfree.getOneArticle", idx);
	}

	@Override
	public List<CeventModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("cfree.searchArticle", valueMap);
	}

	@Override
	public List<CeventCommentModel> getCommentList(int idx) {
		return sqlMapClientTemplate.queryForList("cfree.getCommentList", idx);
	}

	@Override
	public boolean writeArticle(CeventModel cevent) {
		sqlMapClientTemplate.insert("cfree.writeArticle", cevent);		
		return true;
	}

	@Override
	public boolean writeComment(CeventCommentModel comment) {
		sqlMapClientTemplate.insert("cfree.writeComment", comment);
		return true;
	}

	@Override
	public void updateHitcount(int hitcount, int idx) {
		valueMap.put("hitcount", hitcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("cfree.updateHitcount", valueMap);		
	}

	@Override
	public void updateRecommendCount(int recommendcount, int idx) {
		valueMap.put("recommendcount", recommendcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("cfree.updateRecommendcount", valueMap);
		
	}
	@Override
	public int getTotalNum() {
		return (Integer) sqlMapClientTemplate.queryForObject("cfree.getTotalNum");
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlMapClientTemplate.queryForObject("cfree.getSearchTotalNum", valueMap);
	}

	@Override
	public void deleteComment(int idx) {
		sqlMapClientTemplate.delete("cfree.deleteComment", idx);
	}
	
	@Override
	public void deleteArticle(int idx) {
		sqlMapClientTemplate.delete("cfree.deleteArticle", idx);	
	}

	@Override
	public CeventCommentModel getOneComment(int idx) {
		return (CeventCommentModel) sqlMapClientTemplate.queryForObject("cfree.getOneComment", idx);		
	}

	@Override
	public boolean modifyArticle(CeventModel cevent) {
		sqlMapClientTemplate.update("cfree.modifyArticle", cevent);
		return true;
	}	
}
