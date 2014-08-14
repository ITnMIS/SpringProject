package service;

import java.util.HashMap;
import java.util.List;
import model.QnACommentModel;
import model.QnAModel;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import dao.QnADao;

public class QnAService implements QnADao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	@Override
	public List<QnAModel> getBoardList(int startArticleNum, int endArticleNum, String gseq) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("gseq", gseq);
		return sqlMapClientTemplate.queryForList("qna.getBoardList", valueMap);
	}

	@Override
	public QnAModel getOneArticle(int idx) {
		return (QnAModel) sqlMapClientTemplate.queryForObject("qna.getOneArticle", idx);
	}

	@Override
	public List<QnAModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("qna.searchArticle", valueMap);
	}

	@Override
	public List<QnACommentModel> getCommentList(int idx) {
		return sqlMapClientTemplate.queryForList("qna.getCommentList", idx);
	}

	@Override
	public boolean writeArticle(QnAModel qna) {
		sqlMapClientTemplate.insert("qna.writeArticle", qna);		
		return true;
	}

	@Override
	public boolean writeComment(QnACommentModel comment) {
		sqlMapClientTemplate.insert("qna.writeComment", comment);
		return true;
	}

	@Override
	public void updateHitcount(int hitcount, int idx) {
		valueMap.put("hitcount", hitcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("qna.updateHitcount", valueMap);		
	}

	@Override
	public void updateRecommendCount(int recommendcount, int idx) {
		valueMap.put("recommendcount", recommendcount);
		valueMap.put("idx", idx);
		sqlMapClientTemplate.update("qna.updateRecommendcount", valueMap);
		
	}
	@Override
	public int getTotalNum() {
		return (Integer) sqlMapClientTemplate.queryForObject("qna.getTotalNum");
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) sqlMapClientTemplate.queryForObject("qna.getSearchTotalNum", valueMap);
	}

	@Override
	public void deleteComment(int idx) {
		sqlMapClientTemplate.delete("qna.deleteComment", idx);
	}
	
	@Override
	public void deleteArticle(int idx) {
		sqlMapClientTemplate.delete("qna.deleteArticle", idx);	
	}

	@Override
	public QnACommentModel getOneComment(int idx) {
		return (QnACommentModel) sqlMapClientTemplate.queryForObject("qna.getOneComment", idx);		
	}

	@Override
	public boolean modifyArticle(QnAModel qna) {
		sqlMapClientTemplate.update("qna.modifyArticle", qna);
		return true;
	}	
}
