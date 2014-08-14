package dao;

import java.util.List;

import model.CeventModel;
import model.GymModel;
public interface SearchDao {
	
	// get Cevent Board trough search form
	List<CeventModel> searchCevent(String search, int startArticleNum, int endArticleNum);
	
	// get CFree Board trough search form
	List<CeventModel> searchCFree(String search, int startArticleNum, int endArticleNum);
	
	List<CeventModel> searchChealthz(String search, int startArticleNum, int endArticleNum);
	
	List<CeventModel> searchCidea(String search, int startArticleNum, int endArticleNum);

	
	//get all contents in Gym
	List<GymModel> searchGym(String search, int startArticleNum, int endArticleNum);
	
	// get count of search results
	int getCeventSearchTotalNum(String search);
	
	int getCFreeSearchTotalNum(String search);

	int getChealthzSearchTotalNum(String search);

	int getCideaSearchTotalNum(String search);

	int getGymSearchTotalNum(String search);

	
}
