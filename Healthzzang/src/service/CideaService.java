package service;

import java.util.HashMap;
import java.util.List;
import model.CeventCommentModel;
import model.CeventModel;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import dao.CeventDao;

public class CideaService implements CeventDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	@Override
	public List<CeventModel> getBoardList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("cidea.getBoardList", valueMap);
	}

	@Override
	public CeventModel getOneArticle(int idx) {
		return (CeventModel) sqlMapClientTemplate.queryForObject("cidea.getOneArticle", idx);
	}

	@Override
	public List<CeventModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("cidea.searchArticle", valueMap);
	}

	@Override
	public List<CeventCommentModel> getCommentList(int idx) {
		return sqlMapClientTemplate.queryForList("cidea.getCommentList", idx);
	}

	@Override
	public boolean writeArticle(CeventModel cevent) {
		sqlMapClientTemplate.insert("cidea.writeArticle", cevent);		
		return true;
	}

	@Override
	public boolean writeComment(CeventCommentModel comment) {
		sqlMapClientTemplate.insert("cidea.writeComment", comment);
		return true;
	}

	@Override
	public void updateHitcount(int hitcount, int idx) {
		valueMap.put("hitcount", hitcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("cidea.updateHitcount", valueMap);		
	}

	@Override
	public void updateRecommendCount(int recommendcount, int idx) {
		valueMap.put("recommendcount", recommendcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("cidea.updateRecommendcount", valueMap);
		
	}
	@Override
	public int getTotalNum() {
		return (Integer) sqlMapClientTemplate.queryForObject("cidea.getTotalNum");
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlMapClientTemplate.queryForObject("cidea.getSearchTotalNum", valueMap);
	}

	@Override
	public void deleteComment(int idx) {
		sqlMapClientTemplate.delete("cidea.deleteComment", idx);
	}
	
	@Override
	public void deleteArticle(int idx) {
		sqlMapClientTemplate.delete("cidea.deleteArticle", idx);	
	}

	@Override
	public CeventCommentModel getOneComment(int idx) {
		return (CeventCommentModel) sqlMapClientTemplate.queryForObject("cidea.getOneComment", idx);		
	}

	@Override
	public boolean modifyArticle(CeventModel cevent) {
		sqlMapClientTemplate.update("cidea.modifyArticle", cevent);
		return true;
	}	
}
