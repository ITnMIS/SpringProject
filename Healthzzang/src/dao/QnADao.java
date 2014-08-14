package dao;

import java.util.List;

import model.CeventCommentModel;
import model.CeventModel;
import model.QnACommentModel;
import model.QnAModel;

public interface QnADao {
	// get all contents in JMBoard table
	List<QnAModel> getBoardList(int startArticleNum, int showArticleLimit, String gseq);
	
	// show detail about selected article
	QnAModel getOneArticle(int idx);
	
	// get search result list
	List<QnAModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum); 
	
	// get all comments
	List<QnACommentModel> getCommentList(int idx);
	
	// get a comment
	QnACommentModel getOneComment(int idx);
	
	// modify(update) article
	boolean modifyArticle(QnAModel board);
	
	// insert article data
	boolean writeArticle(QnAModel board);
	
	// insert comment data
	boolean writeComment(QnACommentModel comment);
	
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
