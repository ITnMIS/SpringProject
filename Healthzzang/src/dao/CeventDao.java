package dao;

import java.util.List;
import model.CeventCommentModel;
import model.CeventModel;

public interface CeventDao {
	// get all contents in Board table
	List<CeventModel> getBoardList(int startArticleNum, int showArticleLimit);
	
	// show detail about selected article
	CeventModel getOneArticle(int idx);
	
	// get search result list
	List<CeventModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum); 
	
	// get all comments
	List<CeventCommentModel> getCommentList(int idx);
	
	// get a comment
	CeventCommentModel getOneComment(int idx);
	
	// modify(update) article
	boolean modifyArticle(CeventModel board);
	
	// insert article data
	boolean writeArticle(CeventModel board);
	
	// insert comment data
	boolean writeComment(CeventCommentModel comment);
	
	// update hitcount
	void updateHitcount(int hitcount, int idx);
	
	// update recommendcount
	void updateRecommendCount(int recommendcount, int idx);
	
	// get contents count
	int getTotalNum();
	
	// get count of search results
	int getSearchTotalNum(String type, String keyword);
	
	// delete a comment
	void deleteComment(int idx);
	
	// delete a article
	void deleteArticle(int idx);
}
